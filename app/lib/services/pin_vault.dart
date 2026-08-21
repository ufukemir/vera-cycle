import 'dart:convert';
import 'dart:math';

import 'package:cryptography/cryptography.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'secure_key_store.dart';

/// Owns the app-lock PIN, stored as a salted PBKDF2 hash — never plaintext.
///
/// Mirrors [SecureKeyStore]'s pattern but under entirely different key names:
/// the PIN must never share storage with, or be derivable from, the data
/// encryption key. A PIN gates the *app's UI*; the data itself stays
/// encrypted under the Keychain/Keystore key regardless of whether the app is
/// locked, so a lost PIN must be recoverable by wiping local state without
/// weakening that separation.
class PinVault {
  PinVault({FlutterSecureStorage? storage})
    : _storage =
          storage ??
          const FlutterSecureStorage(iOptions: SecureKeyStore.iosOptions);

  static const _hashKey = 'cycle_pin_hash_v1';
  static const _saltKey = 'cycle_pin_salt_v1';

  // Lower than the backup-export KDF: this runs on every unlock attempt and
  // needs to stay fast enough to feel instant, whereas a backup file is meant
  // to withstand offline attack after leaving the device. Still slow enough
  // to meaningfully throttle an offline brute force of an exfiltrated
  // secure-storage blob, which is the realistic threat here — attempt
  // throttling in AppLockController handles the "phone in someone else's
  // hands" threat instead.
  static const _iterations = 120000;
  static const _bits = 256;

  final FlutterSecureStorage _storage;

  Future<bool> isSet() async => await _storage.read(key: _hashKey) != null;

  Future<void> setPin(String pin) async {
    final salt = _randomBytes(16);
    final hash = await _hash(pin, salt);
    // Delete first, always. Keychain items outlive the app that wrote them:
    // deleting the app does not delete them, so a reinstall arrives with the
    // previous PIN's salt and hash still present. flutter_secure_storage's
    // write then fails with errSecDuplicateItem (-25299) instead of
    // overwriting, the exception escapes into the async callback, and PIN
    // setup simply stops responding — leaving the user stuck in onboarding
    // with no way into the app at all. This was reproducible on a real
    // device the moment anyone reinstalled.
    await _storage.delete(key: _saltKey);
    await _storage.delete(key: _hashKey);
    await _storage.write(key: _saltKey, value: base64Encode(salt));
    await _storage.write(key: _hashKey, value: base64Encode(hash));
  }

  Future<bool> verify(String pin) async {
    final saltB64 = await _storage.read(key: _saltKey);
    final hashB64 = await _storage.read(key: _hashKey);
    if (saltB64 == null || hashB64 == null) return false;

    final candidate = await _hash(pin, base64Decode(saltB64));
    return _constantTimeEquals(candidate, base64Decode(hashB64));
  }

  Future<void> clear() async {
    await _storage.delete(key: _hashKey);
    await _storage.delete(key: _saltKey);
  }

  Future<List<int>> _hash(String pin, List<int> salt) async {
    final pbkdf2 = Pbkdf2.hmacSha256(iterations: _iterations, bits: _bits);
    final key = await pbkdf2.deriveKeyFromPassword(password: pin, nonce: salt);
    return key.extractBytes();
  }

  List<int> _randomBytes(int length) {
    final rnd = Random.secure();
    return List<int>.generate(length, (_) => rnd.nextInt(256));
  }

  /// Avoids a timing side-channel on hash comparison — `==` on a `List`
  /// short-circuits at the first mismatched byte.
  bool _constantTimeEquals(List<int> a, List<int> b) {
    if (a.length != b.length) return false;
    var diff = 0;
    for (var i = 0; i < a.length; i++) {
      diff |= a[i] ^ b[i];
    }
    return diff == 0;
  }
}
