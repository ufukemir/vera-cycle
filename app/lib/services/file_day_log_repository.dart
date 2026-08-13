import 'dart:io';

import 'package:path_provider/path_provider.dart';

import '../models/day_log.dart';
import 'crypto/cycle_codec.dart';
import 'day_log_repository.dart';
import 'secure_key_store.dart';

/// The only [DayLogRepository] used in the shipping app.
///
/// Whole-history read/write-on-every-change, not row-level updates: cycle
/// history for even a decade of daily logs is tens of kilobytes, so there is
/// no scaling reason to reach for something more granular in v1, and a single
/// file is trivial to include (encrypted, as-is) in the backup export.
///
/// Every public method re-reads the file rather than trusting an in-memory
/// cache, deliberately: this is the app holding the user's most sensitive
/// data, and staying correct under app-lifecycle interruptions (killed
/// mid-write, restored from an old backup) matters far more than shaving disk
/// I/O most users will never notice.
class FileDayLogRepository implements DayLogRepository {
  FileDayLogRepository({
    SecureKeyStore? keyStore,
    CycleCodec? codec,
  })  : _keyStore = keyStore ?? SecureKeyStore(),
        _codec = codec ?? const CycleCodec();

  static const _fileName = 'cycle_data.enc';

  final SecureKeyStore _keyStore;
  final CycleCodec _codec;

  Future<File> _file() async {
    // Application Support, not Documents: this file must never appear in the
    // Files app / a user-facing "on my iPhone" browser, since its filename
    // alone would out the app's purpose.
    final dir = await getApplicationSupportDirectory();
    return File('${dir.path}/$_fileName');
  }

  @override
  Future<List<DayLog>> loadAll() async {
    final file = await _file();
    if (!await file.exists()) return const [];

    final bytes = await file.readAsBytes();
    if (bytes.isEmpty) return const [];

    final key = await _keyStore.getOrCreateKey();
    final logs = await _codec.decode(bytes, key);
    return logs..sort((a, b) => a.date.compareTo(b.date));
  }

  Future<void> _persist(List<DayLog> logs) async {
    final key = await _keyStore.getOrCreateKey();
    final bytes = await _codec.encode(logs, key);
    final file = await _file();
    // Write to a temp file and rename over the target: an interruption mid
    // write must never leave a half-written, unreadable ciphertext in place
    // of the user's last-known-good history.
    final tmp = File('${file.path}.tmp');
    await tmp.writeAsBytes(bytes, flush: true);
    await tmp.rename(file.path);
  }

  @override
  Future<void> upsert(DayLog log) async {
    final current = await loadAll();
    await _persist(applyUpsert(current, log));
  }

  @override
  Future<void> delete(DateTime date) async {
    final current = await loadAll();
    await _persist(applyDelete(current, date));
  }

  @override
  Future<void> replaceAll(List<DayLog> logs) async {
    await _persist(logs..sort((a, b) => a.date.compareTo(b.date)));
  }

  @override
  Future<void> eraseEverything() async {
    final file = await _file();
    if (await file.exists()) await file.delete();
    // The key is deleted too, not just the file: on some platforms a prior
    // on-disk copy (e.g. an OS-level snapshot) could otherwise still be
    // decrypted after "delete everything" claimed to have erased the data.
    await _keyStore.deleteKey();
  }
}
