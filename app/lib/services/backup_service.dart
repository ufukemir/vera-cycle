// ignore_for_file: prefer_initializing_formals
// The fields are private and the constructor parameters are not, so an
// initializing formal would force every caller to write `_repository:`.
// The lint has no way to express "same value, different name".
import 'dart:convert';
import 'dart:math';
import 'dart:typed_data';

import 'package:cryptography/cryptography.dart';

import '../models/day_log.dart';
import 'crypto/cycle_codec.dart';

/// Password-protected encrypted backups, for moving history to a new device.
///
/// Reuses [CycleCodec] as-is — it only needs *a* [SecretKey], regardless of
/// where the key came from, so the on-disk encryption logic isn't duplicated
/// here. The only new piece is turning a human password into that key.
///
/// File layout: a 4-byte big-endian length, then a plaintext JSON header
/// (format/version/KDF parameters/salt — nothing secret), then the
/// [CycleCodec] ciphertext. The header is deliberately unencrypted: without
/// it, a future app version couldn't even know how to derive the key to
/// attempt a decrypt, and none of it reveals anything about the user's data.
class BackupService {
  const BackupService({CycleCodec codec = const CycleCodec()}) : _codec = codec;

  static const _format = 'cycle-backup';
  static const _formatVersion = 1;

  // PBKDF2-HMAC-SHA256 at 600,000 iterations, the 2023 OWASP baseline for
  // this construction. Argon2id would be preferable in the abstract, but its
  // exact API in the installed cryptography package version wasn't
  // confirmed and its performance on low-end Android wasn't benchmarked —
  // PBKDF2 is the well-understood, verified-available choice for v1.
  static const _iterations = 600000;
  static const _keyBits = 256;
  static const _saltLength = 16;

  final CycleCodec _codec;

  /// Encrypts [logs] under a key derived from [password]. A fresh random
  /// salt is used every time, so encrypting the same history twice produces
  /// unrelated files even with the same password.
  Future<Uint8List> createBackup(List<DayLog> logs, String password) async {
    final salt = _randomBytes(_saltLength);
    final key = await _deriveKey(password, salt, _iterations, _keyBits);
    final payload = await _codec.encode(logs, key);

    final header = utf8.encode(jsonEncode({
      'format': _format,
      'version': _formatVersion,
      'kdf': 'pbkdf2-hmac-sha256',
      'kdfParams': {'iterations': _iterations, 'bits': _keyBits},
      'salt': base64Encode(salt),
    }));

    return Uint8List.fromList([
      ..._uint32BE(header.length),
      ...header,
      ...payload,
    ]);
  }

  /// Decrypts a file produced by [createBackup].
  ///
  /// Throws [FormatException] for a malformed/foreign file, and lets
  /// [SecretBoxAuthenticationError] (from [CycleCodec.decode]) propagate for
  /// a wrong password — the caller must not treat that as "empty backup", so
  /// this deliberately does not catch it.
  Future<List<DayLog>> restoreBackup(Uint8List bytes, String password) async {
    if (bytes.length < 4) {
      throw const FormatException('File is too short to be a backup');
    }
    final headerLength = _readUint32BE(bytes, 0);
    if (bytes.length < 4 + headerLength) {
      throw const FormatException('Backup file is truncated');
    }

    final Map<String, dynamic> header;
    try {
      header = jsonDecode(utf8.decode(bytes.sublist(4, 4 + headerLength)))
          as Map<String, dynamic>;
    } on FormatException {
      rethrow;
    } on Object {
      throw const FormatException('Backup header is not valid JSON');
    }

    if (header['format'] != _format) {
      throw const FormatException('Not a Cycle backup file');
    }

    final kdfParams = header['kdfParams'] as Map<String, dynamic>;
    final salt = base64Decode(header['salt'] as String);
    final key = await _deriveKey(
      password,
      salt,
      kdfParams['iterations'] as int,
      kdfParams['bits'] as int,
    );

    final payload = bytes.sublist(4 + headerLength);
    return _codec.decode(payload, key);
  }

  Future<SecretKey> _deriveKey(
    String password,
    List<int> salt,
    int iterations,
    int bits,
  ) {
    final pbkdf2 = Pbkdf2.hmacSha256(iterations: iterations, bits: bits);
    return pbkdf2.deriveKeyFromPassword(password: password, nonce: salt);
  }

  List<int> _randomBytes(int length) {
    final rnd = Random.secure();
    return List<int>.generate(length, (_) => rnd.nextInt(256));
  }

  List<int> _uint32BE(int value) => [
        (value >> 24) & 0xFF,
        (value >> 16) & 0xFF,
        (value >> 8) & 0xFF,
        value & 0xFF,
      ];

  int _readUint32BE(Uint8List bytes, int offset) =>
      (bytes[offset] << 24) |
      (bytes[offset + 1] << 16) |
      (bytes[offset + 2] << 8) |
      bytes[offset + 3];
}
