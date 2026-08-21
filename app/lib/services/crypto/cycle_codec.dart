import 'dart:convert';

import 'package:cryptography/cryptography.dart';

import '../../models/day_log.dart';

/// Encrypts and decrypts the user's day-log history.
///
/// Pure w.r.t. the platform: `cryptography`'s AES-GCM is a Dart implementation
/// with no platform channel, so this class needs no plugin and is fully unit
/// testable — unlike key storage or file I/O, which are thin glue over
/// `flutter_secure_storage` / `path_provider` and are exercised manually instead
/// (see CLAUDE.md; a plugin call cannot be meaningfully unit tested).
///
/// Wire format is the algorithm's own [SecretBox] concatenation: 12-byte nonce
/// + ciphertext + 16-byte MAC, in that order. Nothing else is added, so a
/// corrupted or foreign file fails to authenticate rather than partially
/// decoding.
class CycleCodec {
  const CycleCodec();

  static final AesGcm _algorithm = AesGcm.with256bits();

  /// Generates a fresh random 256-bit key. Called once per install; the key
  /// then lives in secure hardware-backed storage for the app's lifetime.
  Future<SecretKey> newKey() => _algorithm.newSecretKey();

  /// Encrypts [logs] under [key]. Empty input encrypts to a valid empty-list
  /// ciphertext rather than being special-cased, so a brand-new store and a
  /// wiped-then-resaved store are indistinguishable on disk.
  Future<List<int>> encode(List<DayLog> logs, SecretKey key) async {
    final json = jsonEncode(logs.map((l) => l.toJson()).toList());
    final clearText = utf8.encode(json);
    final box = await _algorithm.encrypt(clearText, secretKey: key);
    return box.concatenation();
  }

  /// Decrypts [bytes] under [key].
  ///
  /// Throws [SecretBoxAuthenticationError] if [bytes] were tampered with or
  /// encrypted under a different key — the caller must not treat that as "no
  /// data", since silently returning an empty list on auth failure would mask
  /// corruption or a wrong key as a fresh install and could overwrite real
  /// history on next save.
  Future<List<DayLog>> decode(List<int> bytes, SecretKey key) async {
    final box = SecretBox.fromConcatenation(
      bytes,
      nonceLength: _algorithm.nonceLength,
      macLength: _algorithm.macAlgorithm.macLength,
    );
    final clearText = await _algorithm.decrypt(box, secretKey: key);
    final json = jsonDecode(utf8.decode(clearText)) as List<dynamic>;
    return json.map((e) => DayLog.fromJson(e as Map<String, dynamic>)).toList();
  }
}
