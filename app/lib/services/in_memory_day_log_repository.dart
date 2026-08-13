import '../models/day_log.dart';
import 'day_log_repository.dart';

/// A [DayLogRepository] backed by nothing but a list in memory.
///
/// Used in widget tests and previews so screens can be exercised without the
/// real plugin stack ([FileDayLogRepository] needs a working Keychain/
/// Keystore and filesystem, neither of which exists in the `flutter test`
/// environment). Never used to hold real user data.
class InMemoryDayLogRepository implements DayLogRepository {
  InMemoryDayLogRepository([List<DayLog>? seed])
      : _logs = List.of(seed ?? const []);

  List<DayLog> _logs;

  @override
  Future<List<DayLog>> loadAll() async => List.unmodifiable(_logs);

  @override
  Future<void> upsert(DayLog log) async {
    _logs = applyUpsert(_logs, log);
  }

  @override
  Future<void> delete(DateTime date) async {
    _logs = applyDelete(_logs, date);
  }

  @override
  Future<void> replaceAll(List<DayLog> logs) async {
    _logs = List.of(logs)..sort((a, b) => a.date.compareTo(b.date));
  }

  @override
  Future<void> eraseEverything() async {
    _logs = [];
  }
}
