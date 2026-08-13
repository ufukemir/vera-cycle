import 'package:cycle_app/models/day_log.dart';
import 'package:cycle_app/models/enums.dart';
import 'package:cycle_app/models/prediction.dart';
import 'package:cycle_app/services/cycle_analyzer.dart';
import 'package:cycle_app/services/prediction_engine.dart';
import 'package:cycle_app/util/day.dart';
import 'package:flutter_test/flutter_test.dart';

const analyzer = CycleAnalyzer();
const engine = PredictionEngine();

/// Builds logs for consecutive cycles of the given [lengths], each with a
/// 4-day period, starting at [start].
List<DayLog> cyclesOf(DateTime start, List<int> lengths,
    {int periodDays = 4}) {
  final logs = <DayLog>[];
  var cursor = start;
  for (final len in lengths) {
    for (var i = 0; i < periodDays; i++) {
      logs.add(DayLog(date: addDays(cursor, i), flow: FlowIntensity.medium));
    }
    cursor = addDays(cursor, len);
  }
  // Final period opens the trailing cycle.
  for (var i = 0; i < periodDays; i++) {
    logs.add(DayLog(date: addDays(cursor, i), flow: FlowIntensity.medium));
  }
  return logs;
}

void main() {
  group('insufficient data', () {
    test('no cycles gives no prediction', () {
      final p = engine.predict(const []);
      expect(p.hasPrediction, isFalse);
      expect(p.confidence, PredictionConfidence.none);
    });

    test('a single period gives no prediction rather than a guess', () {
      final cycles = analyzer.analyze(cyclesOf(DateTime(2026, 1, 1), const []));
      final p = engine.predict(cycles);

      expect(p.hasPrediction, isFalse);
      expect(p.cyclesUsed, 0);
    });

    test('one completed cycle is still not enough', () {
      final cycles = analyzer.analyze(cyclesOf(DateTime(2026, 1, 1), const [28]));
      final p = engine.predict(cycles);

      expect(cycles.where((c) => c.isComplete), hasLength(1));
      expect(p.hasPrediction, isFalse,
          reason: 'one data point has no measurable variability');
    });
  });

  group('regular cycles', () {
    test('predicts a window centred on the mean', () {
      final logs = cyclesOf(DateTime(2026, 1, 1), const [28, 28, 28, 28, 28, 28]);
      final p = engine.predict(analyzer.analyze(logs));

      expect(p.hasPrediction, isTrue);
      expect(p.cyclesUsed, 6);
      expect(p.meanLength, 28);
      // Last period starts 6 * 28 = 168 days after 1 Jan.
      final lastStart = addDays(DateTime(2026, 1, 1), 168);
      expect(p.likelyStart, addDays(lastStart, 28));
    });

    test('perfectly regular history still yields a range, never a single day',
        () {
      final logs = cyclesOf(DateTime(2026, 1, 1), const [28, 28, 28, 28, 28, 28]);
      final p = engine.predict(analyzer.analyze(logs));

      expect(p.windowDays, greaterThan(1),
          reason: 'zero observed variance must not become false certainty');
      expect(p.stdDev, greaterThanOrEqualTo(1.0));
    });

    test('high confidence needs both enough cycles and low variability', () {
      final logs = cyclesOf(DateTime(2026, 1, 1), const [28, 29, 28, 29, 28, 29]);
      final p = engine.predict(analyzer.analyze(logs));

      expect(p.confidence, PredictionConfidence.high);
    });

    test('few cycles cap confidence below high', () {
      final logs = cyclesOf(DateTime(2026, 1, 1), const [28, 28]);
      final p = engine.predict(analyzer.analyze(logs));

      expect(p.cyclesUsed, 2);
      expect(p.confidence, isNot(PredictionConfidence.high));
    });
  });

  group('irregular cycles', () {
    test('wider variability produces a wider window and lower confidence', () {
      final regular = engine.predict(
          analyzer.analyze(cyclesOf(DateTime(2026, 1, 1), const [28, 28, 28, 28])));
      final erratic = engine.predict(
          analyzer.analyze(cyclesOf(DateTime(2026, 1, 1), const [22, 35, 26, 40])));

      expect(erratic.windowDays!, greaterThan(regular.windowDays!));
      expect(erratic.confidence.index, lessThan(regular.confidence.index));
    });

    test('very high variability is flagged as irregular', () {
      final logs = cyclesOf(DateTime(2026, 1, 1), const [21, 45, 24, 50, 22, 44]);
      final p = engine.predict(analyzer.analyze(logs));

      expect(p.irregular, isTrue);
      expect(p.confidence, PredictionConfidence.low);
    });

    test('regular cycles are not flagged as irregular', () {
      final logs = cyclesOf(DateTime(2026, 1, 1), const [27, 28, 29, 28, 28, 27]);
      final p = engine.predict(analyzer.analyze(logs));

      expect(p.irregular, isFalse);
    });
  });

  group('robustness', () {
    test('an implausibly long gap is excluded from the statistics', () {
      // A year of not logging sits between two normal stretches.
      final logs = cyclesOf(
          DateTime(2024, 1, 1), const [28, 28, 400, 28, 28, 28]);
      final p = engine.predict(analyzer.analyze(logs));

      expect(p.meanLength, closeTo(28, 0.01),
          reason: 'the 400-day gap is missing data, not a 400-day cycle');
    });

    test('only the most recent cycles are used', () {
      // Old 40-day cycles, then a settled 28-day rhythm.
      final logs = cyclesOf(DateTime(2024, 1, 1),
          const [40, 40, 40, 28, 28, 28, 28, 28, 28]);
      final p = engine.predict(analyzer.analyze(logs));

      expect(p.cyclesUsed, 6);
      expect(p.meanLength, closeTo(28, 0.01),
          reason: 'the window must follow a body that has changed');
    });
  });

  group('status', () {
    test('a day inside the recorded period reads as menstrual', () {
      final logs = cyclesOf(DateTime(2026, 1, 1), const [28, 28, 28]);
      final cycles = analyzer.analyze(logs);
      final p = engine.predict(cycles);
      final lastStart = cycles.last.startDate;

      final s = engine.status(
          cycles: cycles, prediction: p, on: addDays(lastStart, 1));

      expect(s.phase, CyclePhase.menstrual);
      expect(s.cycleDay, 2);
    });

    test('the fertile window is an estimate that precedes the next period', () {
      final logs = cyclesOf(DateTime(2026, 1, 1), const [28, 28, 28, 28]);
      final cycles = analyzer.analyze(logs);
      final p = engine.predict(cycles);

      final s = engine.status(
          cycles: cycles, prediction: p, on: cycles.last.startDate);

      expect(s.hasFertileEstimate, isTrue);
      expect(s.fertileWindowEnd!.isBefore(p.likelyStart!), isTrue);
      expect(daysBetween(s.fertileWindowStart!, s.fertileWindowEnd!), 6);
    });

    test('well past the predicted window the phase becomes unknown', () {
      final logs = cyclesOf(DateTime(2026, 1, 1), const [28, 28, 28]);
      final cycles = analyzer.analyze(logs);
      final p = engine.predict(cycles);

      final s = engine.status(
        cycles: cycles,
        prediction: p,
        on: addDays(p.latestStart!, 30),
      );

      expect(s.phase, CyclePhase.unknown,
          reason: 'the model has lost the thread and should admit it');
    });

    test('no cycles means unknown, not a default 28-day assumption', () {
      final s = engine.status(
        cycles: const [],
        prediction: const CyclePrediction.insufficient(),
        on: DateTime(2026, 6, 1),
      );

      expect(s.phase, CyclePhase.unknown);
      expect(s.cycleDay, isNull);
    });
  });
}
