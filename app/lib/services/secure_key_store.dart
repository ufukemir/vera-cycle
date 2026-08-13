import 'dart:convert';

import 'package:cryptography/cryptography.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

/// Owns the app's single AES-GCM data key in the platform keychain/keystore.
///
/// Thin glue over a plugin with a platform channel, so unlike [CycleCodec] it
/// is not covered by `flutter test` — verify it manually (install, log a day,
/// force-quit, reopen, confirm the log survived) as part of release testing.
///
/// `flutter_secure_storage` maps to Keychain on iOS and to AES-GCM storage
/// with RSA-OAEP key wrapping backed by Android Keystore on Android, which is
/// what makes the key itself hardware-backed rather than just another file on
/// disk.
class SecureKeyStore {
  SecureKeyStore({FlutterSecureStorage? storage})
      : _storage = storage ?? const FlutterSecureStorage();

  static const _keyName = 'cycle_data_key_v1';

  final FlutterSecureStorage _storage;

  /// Returns the app's data key, generating and persisting one on first call.
  Future<SecretKey> getOrCreateKey() async {
    final existing = await _storage.read(key: _keyName);
    if (existing != null) {
      return SecretKey(base64Decode(existing));
    }

    final key = await AesGcm.with256bits().newSecretKey();
    final bytes = await key.extractBytes();
    await _storage.write(key: _keyName, value: base64Encode(bytes));
    return key;
  }

  /// Deletes the key. Without it the encrypted data file is permanently
  /// unreadable, which is exactly what "erase everything" needs — this is
  /// called alongside deleting the file itself, not instead of it.
  Future<void> deleteKey() => _storage.delete(key: _keyName);
}
