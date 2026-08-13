import 'package:cycle_app/models/day_log.dart';
import 'package:cycle_app/models/enums.dart';
import 'package:cycle_app/services/cycle_analyzer.dart';
import 'package:cycle_app/util/day.dart';
import 'package:flutter_test/flutter_test.dart';

/// Bleeding days starting at [start], one log per day.
List<DayLog> period(DateTime start, int days,
    {FlowIntensity flow = FlowIntensity.medium}) {
  return List.generate(
    days,
    (i) => DayLog(date: addDays(start, i), flow: flow),
  );
}

void main() {
  const analyzer = CycleAnalyzer();

  test('no bleeding logged yields no cycles', () {
    final logs = [
      DayLog(date: DateTime(2026, 1, 5), symptoms: {Symptom.headache}),
    ];
    expect(analyzer.analyze(logs), isEmpty);
  });

  test('a single period yields one open cycle', () {
    final cycles = analyzer.analyze(period(DateTime(2026, 1, 5), 5));

    expect(cycles, hasLength(1));
    expect(cycles.single.startDate, DateTime(2026, 1, 5));
    expect(cycles.single.periodLength, 5);
    expect(cycles.single.length, isNull, reason: 'cycle is still open');
    expect(cycles.single.isComplete, isFalse);
  });

  test('two periods produce one completed cycle of the right length', () {
    final logs = [
      ...period(DateTime(2026, 1, 1), 5),
      ...period(DateTime(2026, 1, 29), 4),
    ];
    final cycles = analyzer.analyze(logs);

    expect(cycles, hasLength(2));
    expect(cycles.first.length, 28);
    expect(cycles.first.isComplete, isTrue);
    expect(cycles.last.length, isNull);
  });

  test('a one-day gap inside a period does not split it', () {
    final logs = [
      DayLog(date: DateTime(2026, 3, 1), flow: FlowIntensity.medium),
      DayLog(date: DateTime(2026, 3, 2), flow: FlowIntensity.medium),
      // 3 March not logged — the classic "forgot the light day".
      DayLog(date: DateTime(2026, 3, 4), flow: FlowIntensity.light),
    ];
    final cycles = analyzer.analyze(logs);

    expect(cycles, hasLength(1));
    expect(cycles.single.periodLength, 4);
  });

  test('spotting alone never starts a cycle', () {
    final logs = [
      DayLog(date: DateTime(2026, 4, 1), flow: FlowIntensity.spotting),
      DayLog(date: DateTime(2026, 4, 2), flow: FlowIntensity.spotting),
    ];
    expect(analyzer.analyze(logs), isEmpty);
  });

  test('spotting before a period does not shift day 1 earlier', () {
    final logs = [
      DayLog(date: DateTime(2026, 4, 1), flow: FlowIntensity.spotting),
      ...period(DateTime(2026, 4, 3), 4),
    ];
    final cycles = analyzer.analyze(logs);

    expect(cycles.single.startDate, DateTime(2026, 4, 3));
  });

  test('mid-cycle bleeding is absorbed rather than fabricating a short cycle',
      () {
    final logs = [
      ...period(DateTime(2026, 5, 1), 4),
      // Breakthrough bleeding on day 11 — too soon to be a new cycle.
      DayLog(date: DateTime(2026, 5, 11), flow: FlowIntensity.light),
      ...period(DateTime(2026, 5, 29), 4),
    ];
    final cycles = analyzer.analyze(logs);

    expect(cycles, hasLength(2));
    expect(cycles.first.startDate, DateTime(2026, 5, 1));
    expect(cycles.first.length, 28,
        reason: 'the day-11 bleed must not become its own cycle');
  });

  test('logs in arbitrary order are handled', () {
    final logs = [
      ...period(DateTime(2026, 2, 26), 3),
      ...period(DateTime(2026, 1, 1), 3),
    ]..shuffle();

    final cycles = analyzer.analyze(logs);

    expect(cycles.first.startDate, DateTime(2026, 1, 1));
    expect(cycles.first.length, 56);
  });

  test('cycles are derived across a leap day without drift', () {
    final logs = [
      ...period(DateTime(2028, 2, 20), 3),
      ...period(DateTime(2028, 3, 19), 3),
    ];
    final cycles = analyzer.analyze(logs);

    // 2028 is a leap year: 20 Feb → 19 Mar is 28 days.
    expect(cycles.first.length, 28);
  });
}
