import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart' show User;
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../services/firebase_bootstrap.dart';
import '../services/partner_service.dart';

/// Error codes [PartnerController.error] can hold, meant to be mapped to a
/// localized string by the UI rather than shown as-is — see
/// [PartnerModeScreen]'s error handling.
enum PartnerErrorCode {
  notConfigured,
  codeNotFound,
  codeExpired,
  codeIsOwn,
  notSignedIn,
  unknown,
}

/// Thin reactive wrapper over [PartnerService]: tracks the signed-in user
/// and pairing state as streams so screens can `context.watch` them, and
/// turns every action into a loading flag + a typed error code instead of a
/// raw exception the UI would have to guess how to word.
///
/// Deliberately holds no cycle data itself — [shareMySnapshot] takes the
/// fields to share as a plain map, built by whoever calls it (the one place
/// that already has both [AppPreferences]' share toggles and the actual
/// cycle state) rather than reaching into those on its own.
class PartnerController extends ChangeNotifier {
  PartnerController({PartnerService? service})
    : _service = service ?? PartnerService();

  final PartnerService _service;

  StreamSubscription<User?>? _authSub;
  StreamSubscription<String?>? _pairedSub;

  User? _user;
  String? _pairedWith;
  bool _loading = false;
  PartnerErrorCode? _error;
  bool _ready = false;

  User? get user => _user;
  bool get isSignedIn => _user != null;
  String? get pairedWith => _pairedWith;
  bool get isPaired => _pairedWith != null;
  bool get isConfigured => _service.isConfigured;
  bool get loading => _loading;
  PartnerErrorCode? get error => _error;

  /// False until [init] has resolved whether Firebase is even configured —
  /// lets the UI show a neutral loading state instead of flashing a "not
  /// signed in" hub for a moment before the real state arrives.
  bool get ready => _ready;

  Future<void> init() async {
    await PartnerService.ensureInitialized();
    _ready = true;
    if (!_service.isConfigured) {
      notifyListeners();
      return;
    }
    _authSub = _service.authStateChanges().listen((user) {
      _user = user;
      unawaited(_pairedSub?.cancel());
      _pairedSub = null;
      if (user != null) {
        _pairedSub = _service.pairedWithStream().listen((paired) {
          _pairedWith = paired;
          notifyListeners();
        });
      } else {
        _pairedWith = null;
      }
      notifyListeners();
    });
  }

  Future<bool> _run(Future<void> Function() action) async {
    _loading = true;
    _error = null;
    notifyListeners();
    try {
      await action();
      _loading = false;
      notifyListeners();
      return true;
    } on GoogleSignInException catch (e) {
      // A user backing out of the Google account picker is not an error —
      // nothing to report, just return to wherever they were.
      _loading = false;
      if (e.code != GoogleSignInExceptionCode.canceled) {
        _error = PartnerErrorCode.unknown;
      }
      notifyListeners();
      return false;
    } on CloudServiceNotConfiguredException {
      _loading = false;
      _error = PartnerErrorCode.notConfigured;
      notifyListeners();
      return false;
    } on StateError catch (e) {
      _loading = false;
      _error = _codeFor(e.message);
      notifyListeners();
      return false;
    } on Object {
      _loading = false;
      _error = PartnerErrorCode.unknown;
      notifyListeners();
      return false;
    }
  }

  PartnerErrorCode _codeFor(String message) {
    switch (message) {
      case 'code-not-found':
        return PartnerErrorCode.codeNotFound;
      case 'code-expired':
        return PartnerErrorCode.codeExpired;
      case 'code-is-own':
        return PartnerErrorCode.codeIsOwn;
      case 'not-signed-in':
        return PartnerErrorCode.notSignedIn;
      default:
        return PartnerErrorCode.unknown;
    }
  }

  Future<bool> signInWithGoogle() => _run(_service.signInWithGoogle);

  Future<bool> signInWithApple() => _run(_service.signInWithApple);

  Future<bool> signOut() => _run(_service.signOut);

  Future<bool> unpair() => _run(_service.unpair);

  Future<bool> shareMySnapshot(Map<String, Object?> fields) =>
      _run(() => _service.shareSnapshot(fields));

  /// Creates a fresh pairing code, or null if it failed — [error] holds why.
  Future<String?> createPairingCode() async {
    _loading = true;
    _error = null;
    notifyListeners();
    try {
      final code = await _service.createPairingCode();
      _loading = false;
      notifyListeners();
      return code;
    } on Object catch (e) {
      _loading = false;
      _error = e is StateError ? _codeFor(e.message) : PartnerErrorCode.unknown;
      notifyListeners();
      return null;
    }
  }

  Future<bool> redeemPairingCode(String code) =>
      _run(() => _service.redeemPairingCode(code));

  Stream<Map<String, dynamic>?> partnerSnapshotStream() {
    final uid = _pairedWith;
    if (uid == null) return Stream.value(null);
    return _service.partnerSnapshotStream(uid);
  }

  void clearError() {
    _error = null;
    notifyListeners();
  }

  @override
  void dispose() {
    unawaited(_authSub?.cancel());
    unawaited(_pairedSub?.cancel());
    super.dispose();
  }
}
