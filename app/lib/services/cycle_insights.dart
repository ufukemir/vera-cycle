import 'dart:math' as math;

import '../models/cycle.dart';
import '../models/day_log.dart';
import '../util/day.dart';

/// On-device summary statistics for the Insights screen.
///
/// Mirrors [PredictionEngine]'s honesty rules rather than introducing new
/// ones: cycle-length average/variability is `null` (not a misleadingly
/// confident number from one data point) until at least 2 completed cycles
/// exist — the same bar [PredictionEngine.minCyclesForPrediction] uses.
/// Period length has no such gate: it doesn't need a second cycle to be
/// meaningful, so it's shown as soon as one period has been logged.
class CycleInsights {
  const CycleInsights({
    required this.cyclesLoggedCount,
    required this.averagePeriodLength,
    required this.averageCycleLength,
    required this.cycleLengthStdDev,
    required this.symptomFrequencyByCycleDay,
  });

  /// Cycle days beyond this are excluded from the symptom-frequency bar row,
  /// keeping it a simple, glanceable row rather than a chart that needs its
  /// own scroll.
  static const maxCycleDay = 10;

  final int cyclesLoggedCount;
  final double? averagePeriodLength;
  final double? averageCycleLength;
  final double? cycleLengthStdDev;

  /// 1-based cycle day → number of symptom tags logged on that day across all
  /// cycles (a day with 3 symptoms logged counts 3, not 1 — this reflects
  /// symptom *load* on that day, not just whether the user opened the app).
  final Map<int, int> symptomFrequencyByCycleDay;

  bool get hasCycleLengthStats => averageCycleLength != null;
  bool get hasPeriodLengthStats => averagePeriodLength != null;

  static CycleInsights compute(List<ObservedCycle> cycles, List<DayLog> logs) {
    final periodLengths = cycles.map((c) => c.periodLength).toList();
    final completedLengths = cycles.map((c) => c.length).whereType<int>().toList();

    final averagePeriodLength =
        periodLengths.isEmpty ? null : _mean(periodLengths);

    double? averageCycleLength;
    double? cycleLengthStdDev;
    if (completedLengths.length >= 2) {
      averageCycleLength = _mean(completedLengths);
      cycleLengthStdDev = _stdDev(completedLengths, averageCycleLength);
    }

    final symptomFrequency = <int, int>{};
    for (final log in logs) {
      if (log.symptoms.isEmpty) continue;
      final cycleDay = _cycleDayFor(log.date, cycles);
      if (cycleDay == null || cycleDay < 1 || cycleDay > maxCycleDay) continue;
      symptomFrequency[cycleDay] =
          (symptomFrequency[cycleDay] ?? 0) + log.symptoms.length;
    }

    return CycleInsights(
      cyclesLoggedCount: cycles.length,
      averagePeriodLength: averagePeriodLength,
      averageCycleLength: averageCycleLength,
      cycleLengthStdDev: cycleLengthStdDev,
      symptomFrequencyByCycleDay: symptomFrequency,
    );
  }

  /// 1-based day within whichever cycle contains [date], or `null` if
  /// [date] predates every recorded cycle.
  static int? _cycleDayFor(DateTime date, List<ObservedCycle> cycles) {
    for (final cycle in cycles) {
      final nextStart = cycle.nextStartDate;
      final withinOpenCycle = nextStart == null && !date.isBefore(cycle.startDate);
      final withinClosedCycle = nextStart != null &&
          !date.isBefore(cycle.startDate) &&
          date.isBefore(nextStart);
      if (withinOpenCycle || withinClosedCycle) {
        return daysBetween(cycle.startDate, date) + 1;
      }
    }
    return null;
  }

  static double _mean(List<int> xs) =>
      xs.fold<int>(0, (a, b) => a + b) / xs.length;

  static double _stdDev(List<int> xs, double mean) {
    final sumOfSquares = xs.fold<double>(0, (a, x) => a + math.pow(x - mean, 2));
    return math.sqrt(sumOfSquares / (xs.length - 1));
  }
}
