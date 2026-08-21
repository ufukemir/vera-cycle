import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart' show User;
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../services/cloud_auth_service.dart';
import '../services/cloud_backup_service.dart';
import '../services/firebase_bootstrap.dart';

enum CloudBackupErrorCode { notConfigured, notSignedIn, unknown }

/// Reactive wrapper over [CloudAuthService] + [CloudBackupService] — same
/// shape as `PartnerController`, deliberately: both features share the same
/// sign-in state (see [CloudAuthService]'s doc comment), so signing in here
/// also signs in for Partner Modu and vice versa.
class CloudBackupController extends ChangeNotifier {
  CloudBackupController({CloudAuthService? auth, CloudBackupService? backup})
    : _auth = auth ?? CloudAuthService(),
      _backup = backup ?? CloudBackupService();

  final CloudAuthService _auth;
  final CloudBackupService _backup;

  StreamSubscription<User?>? _authSub;

  User? _user;
  bool _loading = false;
  CloudBackupErrorCode? _error;
  bool _ready = false;
  DateTime? _lastUploadedAt;
  bool _checkedLastUpload = false;

  User? get user => _user;
  bool get isSignedIn => _user != null;
  bool get isConfigured => _auth.isConfigured;
  bool get loading => _loading;
  CloudBackupErrorCode? get error => _error;
  bool get ready => _ready;
  DateTime? get lastUploadedAt => _lastUploadedAt;

  Future<void> init() async {
    await FirebaseBootstrap.ensureInitialized();
    _ready = true;
    if (!isConfigured) {
      notifyListeners();
      return;
    }
    _authSub = _auth.authStateChanges().listen((user) {
      _user = user;
      _checkedLastUpload = false;
      _lastUploadedAt = null;
      notifyListeners();
      if (user != null) unawaited(_refreshLastUploadedAt(user.uid));
    });
  }

  Future<void> _refreshLastUploadedAt(String uid) async {
    if (_checkedLastUpload) return;
    _checkedLastUpload = true;
    try {
      _lastUploadedAt = await _backup.lastUploadedAt(uid);
      notifyListeners();
    } on Object {
      // A failed status check must not block the rest of the screen — the
      // upload/download buttons themselves will surface a real error.
    }
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
      _loading = false;
      if (e.code != GoogleSignInExceptionCode.canceled) {
        _error = CloudBackupErrorCode.unknown;
      }
      notifyListeners();
      return false;
    } on CloudServiceNotConfiguredException {
      _loading = false;
      _error = CloudBackupErrorCode.notConfigured;
      notifyListeners();
      return false;
    } on Object {
      _loading = false;
      _error = CloudBackupErrorCode.unknown;
      notifyListeners();
      return false;
    }
  }

  Future<bool> signInWithGoogle() => _run(_auth.signInWithGoogle);

  Future<bool> signInWithApple() => _run(_auth.signInWithApple);

  Future<bool> signOut() => _run(_auth.signOut);

  Future<bool> upload(Uint8List bytes) => _run(() async {
    final uid = _user?.uid;
    if (uid == null) throw StateError('not-signed-in');
    await _backup.upload(uid, bytes);
    _lastUploadedAt = DateTime.now();
  });

  /// The stored backup bytes, or null if this account has never uploaded
  /// one (surfaced via [error] as [CloudBackupErrorCode.unknown] only for a
  /// real failure — "nothing there yet" is a normal null return, not an
  /// error, so the caller can tell the two apart).
  Future<Uint8List?> download() async {
    final uid = _user?.uid;
    if (uid == null) {
      _error = CloudBackupErrorCode.notSignedIn;
      notifyListeners();
      return null;
    }
    _loading = true;
    _error = null;
    notifyListeners();
    try {
      final bytes = await _backup.download(uid);
      _loading = false;
      notifyListeners();
      return bytes;
    } on Object {
      _loading = false;
      _error = CloudBackupErrorCode.unknown;
      notifyListeners();
      return null;
    }
  }

  void clearError() {
    _error = null;
    notifyListeners();
  }

  @override
  void dispose() {
    unawaited(_authSub?.cancel());
    super.dispose();
  }
}
