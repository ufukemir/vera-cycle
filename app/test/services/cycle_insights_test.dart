import 'package:cycle_app/models/day_log.dart';
import 'package:cycle_app/models/enums.dart';
import 'package:cycle_app/services/cycle_analyzer.dart';
import 'package:cycle_app/services/cycle_insights.dart';
import 'package:cycle_app/util/day.dart';
import 'package:flutter_test/flutter_test.dart';

const analyzer = CycleAnalyzer();

List<DayLog> _period(DateTime start, int days) => List.generate(
      days,
      (i) => DayLog(date: addDays(start, i), flow: FlowIntensity.medium),
    );

void main() {
  group('cycle-length stats', () {
    test('no cycles: nothing computed', () {
      final insights = CycleInsights.compute(const [], const []);

      expect(insights.cyclesLoggedCount, 0);
      expect(insights.hasPeriodLengthStats, isFalse);
      expect(insights.hasCycleLengthStats, isFalse);
    });

    test('one cycle: period length known, cycle length still withheld', () {
      final logs = _period(DateTime(2026, 1, 1), 5);
      final cycles = analyzer.analyze(logs);
      final insights = CycleInsights.compute(cycles, logs);

      expect(insights.cyclesLoggedCount, 1);
      expect(insights.averagePeriodLength, 5);
      expect(insights.hasCycleLengthStats, isFalse,
          reason: 'one data point has no measurable cycle-length variability');
    });

    test('two completed cycles: cycle length and stddev appear', () {
      final logs = [
        ..._period(DateTime(2026, 1, 1), 4),
        ..._period(DateTime(2026, 1, 29), 4), // 28-day cycle
        ..._period(DateTime(2026, 2, 27), 4), // 29-day cycle
      ];
      final cycles = analyzer.analyze(logs);
      final insights = CycleInsights.compute(cycles, logs);

      expect(insights.hasCycleLengthStats, isTrue);
      expect(insights.averageCycleLength, closeTo(28.5, 0.01));
      expect(insights.cycleLengthStdDev, greaterThan(0));
    });

    test('average period length covers every observed cycle, including the '
        'open one', () {
      final logs = [
        ..._period(DateTime(2026, 1, 1), 4),
        ..._period(DateTime(2026, 1, 29), 6),
      ];
      final cycles = analyzer.analyze(logs);
      final insights = CycleInsights.compute(cycles, logs);

      expect(insights.averagePeriodLength, closeTo(5, 0.01));
    });
  });

  group('symptom frequency by cycle day', () {
    test('counts symptom tags on their cycle day', () {
      final start = DateTime(2026, 3, 1);
      final logs = [
        ..._period(start, 4),
        DayLog(date: addDays(start, 0), symptoms: const {Symptom.cramps}),
        DayLog(date: addDays(start, 1),
            symptoms: const {Symptom.cramps, Symptom.headache}),
      ];
      final cycles = analyzer.analyze(logs);
      final insights = CycleInsights.compute(cycles, logs);

      expect(insights.symptomFrequencyByCycleDay[1], 1);
      expect(insights.symptomFrequencyByCycleDay[2], 2);
    });

    test('days beyond the display cap are excluded', () {
      final start = DateTime(2026, 3, 1);
      final logs = [
        ..._period(start, 4),
        DayLog(
          date: addDays(start, CycleInsights.maxCycleDay),
          symptoms: const {Symptom.fatigue},
        ),
      ];
      final cycles = analyzer.analyze(logs);
      final insights = CycleInsights.compute(cycles, logs);

      expect(insights.symptomFrequencyByCycleDay.containsKey(
              CycleInsights.maxCycleDay + 1),
          isFalse);
    });

    test('days with no symptoms logged do not appear', () {
      final logs = _period(DateTime(2026, 3, 1), 4);
      final cycles = analyzer.analyze(logs);
      final insights = CycleInsights.compute(cycles, logs);

      expect(insights.symptomFrequencyByCycleDay, isEmpty);
    });

    test('symptoms logged before any recorded cycle are ignored, not '
        'crashing', () {
      final logs = [
        DayLog(date: DateTime(2025, 12, 1), symptoms: const {Symptom.nausea}),
        ..._period(DateTime(2026, 3, 1), 4),
      ];
      final cycles = analyzer.analyze(logs);

      expect(() => CycleInsights.compute(cycles, logs), returnsNormally);
    });
  });
}
