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

  final PinVault _pinVault;
  final LocalAuthentication _auth;

  AppLockState _state = AppLockState.locked;
  int _failedAttempts = 0;
  DateTime? _lockedOutUntil;

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

  @override
  void didChangeAppLifecycleState(AppLifecycleState lifecycleState) {
    if (lifecycleState == AppLifecycleState.paused ||
        lifecycleState == AppLifecycleState.inactive) {
      lock();
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }
}
