import 'package:cycle_app/models/day_log.dart';
import 'package:cycle_app/models/enums.dart';
import 'package:cycle_app/services/day_log_repository.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('applyUpsert', () {
    test('adds a new day into a sorted position', () {
      final existing = [
        DayLog(date: DateTime(2026, 1, 1), flow: FlowIntensity.medium),
        DayLog(date: DateTime(2026, 1, 3), flow: FlowIntensity.medium),
      ];

      final result = applyUpsert(
        existing,
        DayLog(date: DateTime(2026, 1, 2), flow: FlowIntensity.light),
      );

      expect(result.map((l) => l.date), [
        DateTime(2026, 1, 1),
        DateTime(2026, 1, 2),
        DateTime(2026, 1, 3),
      ]);
    });

    test('replaces the existing entry for the same day rather than '
        'duplicating it', () {
      final existing = [
        DayLog(date: DateTime(2026, 1, 1), flow: FlowIntensity.light),
      ];

      final result = applyUpsert(
        existing,
        DayLog(date: DateTime(2026, 1, 1), flow: FlowIntensity.heavy),
      );

      expect(result, hasLength(1));
      expect(result.single.flow, FlowIntensity.heavy);
    });

    test('upserting an empty log deletes that day instead of storing an '
        'empty row', () {
      final existing = [
        DayLog(date: DateTime(2026, 1, 1), flow: FlowIntensity.light),
      ];

      final result = applyUpsert(existing, DayLog(date: DateTime(2026, 1, 1)));

      expect(result, isEmpty);
    });

    test('does not mutate the list passed in', () {
      final existing = [
        DayLog(date: DateTime(2026, 1, 1), flow: FlowIntensity.light),
      ];

      applyUpsert(existing, DayLog(date: DateTime(2026, 1, 2)));

      expect(existing, hasLength(1));
    });
  });

  group('applyDelete', () {
    test('removes the log for the given day', () {
      final existing = [
        DayLog(date: DateTime(2026, 1, 1), flow: FlowIntensity.light),
        DayLog(date: DateTime(2026, 1, 2), flow: FlowIntensity.light),
      ];

      final result = applyDelete(existing, DateTime(2026, 1, 1));

      expect(result.map((l) => l.date), [DateTime(2026, 1, 2)]);
    });

    test('deleting a day with no log is a no-op', () {
      final existing = [
        DayLog(date: DateTime(2026, 1, 1), flow: FlowIntensity.light),
      ];

      final result = applyDelete(existing, DateTime(2026, 6, 1));

      expect(result, hasLength(1));
    });
  });
}
