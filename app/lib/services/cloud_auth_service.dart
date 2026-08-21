import 'dart:convert';
import 'dart:math';

import 'package:crypto/crypto.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

import 'firebase_bootstrap.dart';

/// Google/Apple sign-in via Firebase Auth — the one shared account layer
/// under both Partner Modu (see `partner_service.dart`) and cloud backup
/// (see `cloud_backup_service.dart`). Signing in once through either
/// feature signs in for both, since both just read `FirebaseAuth.instance`.
class CloudAuthService {
  CloudAuthService({FirebaseAuth? auth}) : _authOverride = auth;

  final FirebaseAuth? _authOverride;

  bool get isConfigured => FirebaseBootstrap.isConfigured;

  FirebaseAuth get _auth {
    if (!isConfigured) throw const CloudServiceNotConfiguredException();
    return _authOverride ?? FirebaseAuth.instance;
  }

  User? get currentUser => isConfigured ? _auth.currentUser : null;

  Stream<User?> authStateChanges() => _auth.authStateChanges();

  Future<void> signOut() async {
    await _auth.signOut();
  }

  Future<UserCredential> signInWithGoogle() async {
    await GoogleSignIn.instance.initialize();
    final account = await GoogleSignIn.instance.authenticate();
    final idToken = account.authentication.idToken;
    final credential = GoogleAuthProvider.credential(idToken: idToken);
    return _auth.signInWithCredential(credential);
  }

  /// Apple requires the SHA-256 of a random nonce sent to it, and the raw
  /// nonce sent to Firebase — Firebase hashes the raw value itself and
  /// checks it matches what Apple signed, which is what stops a stolen
  /// identity token from being replayed against a different sign-in.
  Future<UserCredential> signInWithApple() async {
    final rawNonce = _randomNonce();
    final hashedNonce = sha256.convert(utf8.encode(rawNonce)).toString();

    final appleCredential = await SignInWithApple.getAppleIDCredential(
      scopes: [
        AppleIDAuthorizationScopes.email,
        AppleIDAuthorizationScopes.fullName,
      ],
      nonce: hashedNonce,
    );

    final credential = OAuthProvider('apple.com').credential(
      idToken: appleCredential.identityToken,
      accessToken: appleCredential.authorizationCode,
      rawNonce: rawNonce,
    );
    return _auth.signInWithCredential(credential);
  }

  String _randomNonce([int length = 32]) {
    const charset =
        '0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._';
    final random = Random.secure();
    return List.generate(
      length,
      (_) => charset[random.nextInt(charset.length)],
    ).join();
  }
}
