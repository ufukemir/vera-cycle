import '../models/day_log.dart';
import '../util/day.dart';

/// Storage for the user's day-log history, independent of where it actually
/// lives.
///
/// Kept behind an interface so the on-disk format (currently a single
/// encrypted blob, see [CycleCodec]) can move to something like SQLCipher
/// later without any screen needing to change — CLAUDE.md commits to that
/// migration path explicitly.
abstract class DayLogRepository {
  /// All logs, sorted oldest first. Empty logs (see [DayLog.isEmpty]) are
  /// never persisted, so this list never contains one.
  Future<List<DayLog>> loadAll();

  /// Inserts or replaces the log for [log.date]. Passing a log that is
  /// [DayLog.isEmpty] deletes that day instead of storing an empty row.
  Future<void> upsert(DayLog log);

  /// Removes any log for [date], if one exists.
  Future<void> delete(DateTime date);

  /// Replaces the entire history — used by restore-from-backup.
  Future<void> replaceAll(List<DayLog> logs);

  /// Irreversibly erases all stored data. Backs [CLAUDE.md]'s "delete
  /// everything" requirement — this must actually remove the ciphertext, not
  /// just clear the in-memory view, so a device backup cannot resurrect it.
  Future<void> eraseEverything();
}

/// Applies an upsert to a sorted log list, returning a new sorted list.
///
/// Pure and side-effect free so both [DayLogRepository] implementations share
/// one tested definition of "what upsert means" instead of each
/// reimplementing the merge.
List<DayLog> applyUpsert(List<DayLog> existing, DayLog updated) {
  final without = existing.where((l) => !isSameDay(l.date, updated.date));
  if (updated.isEmpty) {
    return without.toList()..sort(_byDate);
  }
  return [...without, updated]..sort(_byDate);
}

/// Applies a delete-by-date, returning a new sorted list.
List<DayLog> applyDelete(List<DayLog> existing, DateTime date) {
  return existing.where((l) => !isSameDay(l.date, date)).toList()
    ..sort(_byDate);
}

int _byDate(DayLog a, DayLog b) => a.date.compareTo(b.date);
