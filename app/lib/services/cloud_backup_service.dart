import 'dart:typed_data';

import 'package:firebase_storage/firebase_storage.dart';

import 'firebase_bootstrap.dart';

/// Uploads/downloads the exact encrypted file [BackupService] already
/// produces for local export — this class never sees a password or
/// plaintext health data, only opaque bytes. See CLAUDE.md's 2026-08-21
/// cloud-backup revision note and `storage.rules` for the matching access
/// rules.
///
/// One backup slot per account, at a fixed path — not a version history.
/// Uploading overwrites whatever was there; that mirrors how the local
/// export/import flow already works (one file, user-managed) and keeps
/// "what does my cloud backup contain" a question with one obvious answer.
class CloudBackupService {
  CloudBackupService({FirebaseStorage? storage}) : _storageOverride = storage;

  final FirebaseStorage? _storageOverride;

  bool get isConfigured => FirebaseBootstrap.isConfigured;

  FirebaseStorage get _storage {
    if (!isConfigured) throw const CloudServiceNotConfiguredException();
    return _storageOverride ?? FirebaseStorage.instance;
  }

  Reference _ref(String uid) =>
      _storage.ref().child('backups').child(uid).child('backup.cyclebackup');

  Future<void> upload(String uid, Uint8List bytes) async {
    await _ref(
      uid,
    ).putData(bytes, SettableMetadata(contentType: 'application/octet-stream'));
  }

  /// The stored backup bytes, or `null` if this account has never uploaded
  /// one. 25MB is far beyond any realistic history size (the whole point of
  /// the encrypted format is that it is close to the raw JSON size) — it
  /// exists as a sanity ceiling, not a real limit anyone should hit.
  Future<Uint8List?> download(String uid) async {
    try {
      return await _ref(uid).getData(25 * 1024 * 1024);
    } on FirebaseException catch (e) {
      if (e.code == 'object-not-found') return null;
      rethrow;
    }
  }

  /// When the current backup was uploaded, or `null` if there isn't one.
  Future<DateTime?> lastUploadedAt(String uid) async {
    try {
      final metadata = await _ref(uid).getMetadata();
      return metadata.updated;
    } on FirebaseException catch (e) {
      if (e.code == 'object-not-found') return null;
      rethrow;
    }
  }

  Future<void> delete(String uid) async {
    try {
      await _ref(uid).delete();
    } on FirebaseException catch (e) {
      if (e.code != 'object-not-found') rethrow;
    }
  }
}
