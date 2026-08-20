// ignore_for_file: prefer_initializing_formals, avoid_renaming_method_parameters
// Private fields, public parameter names — see CycleController.
import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';

import '../services/pin_vault.dart';

enum AppLockState { locked, unlocked }

/// Gates the app behind a PIN (with optional biometric shortcut).
///
/// Re-locks on every backgrounding — an owner decision, not a default: this
/// app is positioned on privacy above convenience, so the friction of
/// re-authenticating after every app switch is accepted deliberately rather
/// than offering a grace period.
///
/// "Backgrounding" means the app actually left the foreground, not
/// [AppLifecycleState.inactive]. Sheets the app opens itself are excluded
/// too — see [duringSystemSheet].
///
/// Failed-PIN throttling here is in-memory only and resets on process
/// restart. That's a known v1 simplification, not an oversight: persisting it
/// would need a home in [AppPreferences] or its own secure-storage entry, and
/// the primary defense against an unlocked-phone attacker guessing a PIN is
/// still the OS-level app-switcher content hiding (see native platform
/// changes) plus the PIN's own entropy — this layer only blunts rapid
/// automated guessing within a single app session.
class AppLockController extends ChangeNotifier with WidgetsBindingObserver {
  AppLockController({required PinVault pinVault, LocalAuthentication? auth})
      : _pinVault = pinVault,
        _auth = auth ?? LocalAuthentication() {
    WidgetsBinding.instance.addObserver(this);
  }

  static const _throttleAfterAttempts = 5;
  static const _baseBackoff = Duration(seconds: 5);

  /// How long the app may sit in the background during one of its own
  /// system sheets before the lock applies anyway.
  ///
  /// A share chooser that leads the user into another app is no longer a
  /// sheet — it is a session somewhere else. Two minutes covers "pick an
  /// app, send, come straight back" without leaving the history readable
  /// on a phone that was put down.
  static const _maxSheetAway = Duration(minutes: 2);

  final PinVault _pinVault;
  final LocalAuthentication _auth;

  AppLockState _state = AppLockState.locked;
  int _failedAttempts = 0;
  DateTime? _lockedOutUntil;

  /// How many [duringSystemSheet] calls are in flight.
  int _openSheets = 0;

  /// When the app went to the background with a sheet open, if it did.
  DateTime? _leftDuringSheet;

  AppLockState get state => _state;

  /// `null` when not currently throttled.
  Duration? get lockoutRemaining {
    final until = _lockedOutUntil;
    if (until == null) return null;
    final remaining = until.difference(DateTime.now());
    return remaining.isNegative ? null : remaining;
  }

  Future<bool> canUseBiometrics() async {
    try {
      return await _auth.isDeviceSupported() && await _auth.canCheckBiometrics;
    } on Object {
      return false;
    }
  }

  /// The icon that matches what the device actually offers.
  ///
  /// Both lock screens used a hardcoded fingerprint icon regardless of the
  /// device, so a Face ID phone — the whole iPhone line since the X — showed
  /// a fingerprint glyph for a feature the user unlocks by looking at their
  /// phone. [getAvailableBiometrics] can return more than one type; face is
  /// preferred when offered since it is the newer, camera-based method and
  /// the one most likely to be what a modern iPhone actually has.
  Future<IconData> biometricIcon() async {
    try {
      final types = await _auth.getAvailableBiometrics();
      if (types.contains(BiometricType.face)) return Icons.face_outlined;
      if (types.contains(BiometricType.iris)) return Icons.visibility_outlined;
    } on Object {
      // Falls through to the fingerprint default below — still correct for
      // the common case, just not tailored to this specific device.
    }
    return Icons.fingerprint;
  }

  /// [localizedReason] is supplied by the caller so this controller never
  /// hardcodes UI copy in one language.
  Future<bool> unlockWithBiometrics(String localizedReason) async {
    if (lockoutRemaining != null) return false;
    try {
      final didAuthenticate = await _auth.authenticate(
        localizedReason: localizedReason,
        biometricOnly: true,
        persistAcrossBackgrounding: true,
      );
      if (didAuthenticate) _unlock();
      return didAuthenticate;
    } on Object {
      return false;
    }
  }

  Future<bool> unlockWithPin(String pin) async {
    if (lockoutRemaining != null) return false;

    final correct = await _pinVault.verify(pin);
    if (correct) {
      _unlock();
      return true;
    }

    _failedAttempts++;
    if (_failedAttempts >= _throttleAfterAttempts) {
      final backoffSteps = _failedAttempts - _throttleAfterAttempts;
      final backoff = _baseBackoff * (1 << backoffSteps.clamp(0, 6));
      _lockedOutUntil = DateTime.now().add(backoff);
    }
    notifyListeners();
    return false;
  }

  void lock() {
    _state = AppLockState.locked;
    notifyListeners();
  }

  /// Unlocks without an auth check — used only right after onboarding's PIN
  /// setup, where the user just proved they know the PIN by typing it twice.
  /// Forcing a third entry immediately after would be friction with no
  /// security benefit.
  void unlockAfterSetup() => _unlock();

  void _unlock() {
    _state = AppLockState.unlocked;
    _failedAttempts = 0;
    _lockedOutUntil = null;
    notifyListeners();
  }

  /// Runs [action] with the automatic lock suspended.
  ///
  /// For the sheets the app opens itself: a share chooser, a file picker,
  /// the print dialog, a permission screen. On Android each of those is a
  /// separate activity, so Flutter reports `paused` and the lock fired
  /// behind the user's back. That was not merely annoying: [AppRoot] swaps
  /// the whole tree for the lock screen rather than layering over it, so
  /// the screen that opened the sheet was unmounted and its `await`
  /// resumed with `mounted == false`. Restoring a backup and importing a
  /// CSV did nothing at all — silently, with no error — and creating a
  /// backup shared the file but never recorded that it had, so the
  /// "time to back up" nudge kept nagging.
  ///
  /// The suspension is narrow on purpose: only this call, only while it is
  /// in flight, and [_maxSheetAway] still locks if the user left for the
  /// other app rather than coming back.
  Future<T> duringSystemSheet<T>(Future<T> Function() action) async {
    _openSheets++;
    try {
      return await action();
    } finally {
      _openSheets--;
    }
  }

  // The parameter is `lifecycleState`, not `state`: this class already has
  // a `state` getter, and shadowing it inside the one method that decides
  // when to lock is a worse trade than the lint.
  @override
  void didChangeAppLifecycleState(AppLifecycleState lifecycleState) {
    switch (lifecycleState) {
      // `inactive` is not backgrounding. It is the Face ID prompt, a
      // permission alert, Control Centre pulled halfway down, an incoming
      // call banner — and on iOS the share sheet and document picker,
      // which are presented in-process. Locking on it made the biometric
      // prompt race its own lock screen and threw the user back to the PIN
      // pad for every system alert. The app-switcher snapshot is already
      // hidden natively, so ignoring `inactive` exposes nothing.
      case AppLifecycleState.inactive:
        break;
      case AppLifecycleState.paused:
      case AppLifecycleState.hidden:
      case AppLifecycleState.detached:
        if (_openSheets > 0) {
          _leftDuringSheet ??= DateTime.now();
        } else {
          lock();
        }
      case AppLifecycleState.resumed:
        final leftAt = _leftDuringSheet;
        _leftDuringSheet = null;
        if (leftAt != null &&
            DateTime.now().difference(leftAt) > _maxSheetAway) {
          lock();
        }
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }
}
