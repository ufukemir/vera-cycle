import 'dart:math' as math;

import '../models/cycle.dart';
import '../models/enums.dart';
import '../models/prediction.dart';
import '../util/day.dart';

/// On-device cycle forecasting.
///
/// Runs entirely locally — no model download, no inference server, nothing that
/// would need the network permission this app does not request.
///
/// The method is plain descriptive statistics over recent completed cycles, and
/// that is a deliberate choice over a fancier model: a user can be told exactly
/// how the number was reached ("your last 6 cycles averaged 29.3 days, varying
/// by about 2 days"), and an explanation the user can check is worth more here
/// than a fraction of a day of accuracy they cannot.
class PredictionEngine {
  const PredictionEngine({
    this.window = 6,
    this.minCyclesForPrediction = 2,
    this.minPlausibleLength = 15,
    this.maxPlausibleLength = 90,
    this.stdDevFloor = 1.0,
    this.irregularStdDev = 7.0,
    this.lutealPhaseDays = 14,
  });

  /// How many recent completed cycles feed the estimate. Six is roughly half a
  /// year — long enough to average out noise, short enough to follow a body that
  /// is actually changing.
  final int window;

  /// Below this, the engine reports [PredictionConfidence.none] rather than
  /// guessing from a single data point.
  final int minCyclesForPrediction;

  /// Cycles outside this range are excluded from the statistics. A 140-day
  /// "cycle" is almost always a stretch of unlogged months, and averaging it in
  /// would push the next prediction weeks into the future.
  final int minPlausibleLength;
  final int maxPlausibleLength;

  /// Minimum standard deviation used when building the window.
  ///
  /// Three identically-logged cycles produce a standard deviation of zero, which
  /// would render as a single-day prediction stated with total certainty — the
  /// false precision this app exists to avoid.
  final double stdDevFloor;

  /// Variability above which the cycle is flagged as irregular.
  final double irregularStdDev;

  /// Assumed luteal phase length, used to place the fertile-window estimate.
  /// Fairly stable across people compared with the follicular phase, which is
  /// what makes counting back from the *next* period more reliable than
  /// counting forward from the last one.
  final int lutealPhaseDays;

  /// z-score for an ~80% predictive interval under a normal approximation.
  ///
  /// Not 95%: at that width the honest answer becomes a two-week window, which
  /// is useless to plan around. 80% keeps the range actionable while still being
  /// wrong roughly one cycle in five — a rate the UI states plainly.
  static const double _z80 = 1.2816;

  /// Forecasts the next period start from [cycles] (oldest first).
  CyclePrediction predict(List<ObservedCycle> cycles) {
    if (cycles.isEmpty) return const CyclePrediction.insufficient();

    final lengths = _usableLengths(cycles);
    final lastStart = cycles.last.startDate;

    if (lengths.length < minCyclesForPrediction) {
      return CyclePrediction.insufficient(cyclesUsed: lengths.length);
    }

    final mean = _mean(lengths);
    final sd = math.max(_sampleStdDev(lengths, mean), stdDevFloor);

    // sqrt(1 + 1/n) widens the interval for a *future* observation rather than
    // for the mean: we are predicting one more cycle, not estimating an average.
    final n = lengths.length;
    final margin = _z80 * sd * math.sqrt(1 + 1 / n);
    final halfWidth = math.max(1, margin.ceil());

    final likely = addDays(lastStart, mean.round());

    return CyclePrediction(
      confidence: _confidence(n, sd),
      cyclesUsed: n,
      earliestStart: addDays(likely, -halfWidth),
      likelyStart: likely,
      latestStart: addDays(likely, halfWidth),
      meanLength: mean,
      stdDev: sd,
      irregular: sd >= irregularStdDev,
    );
  }

  /// Describes where [on] falls in the current cycle.
  CycleStatus status({
    required List<ObservedCycle> cycles,
    required CyclePrediction prediction,
    required DateTime on,
  }) {
    if (cycles.isEmpty) {
      return const CycleStatus(phase: CyclePhase.unknown);
    }

    final current = cycles.last;
    final date = dateOnly(on);
    final dayOffset = daysBetween(current.startDate, date);

    // A date before the first recorded cycle, or long after the last one, tells
    // us nothing reliable — say so instead of extrapolating.
    if (dayOffset < 0) {
      return const CycleStatus(phase: CyclePhase.unknown);
    }

    final cycleDay = dayOffset + 1;

    DateTime? fertileStart;
    DateTime? fertileEnd;
    if (prediction.hasPrediction) {
      // Sperm survive several days, the egg about one: the window opens five
      // days before ovulation and closes the day after.
      final ovulation = addDays(prediction.likelyStart!, -lutealPhaseDays);
      fertileStart = addDays(ovulation, -5);
      fertileEnd = addDays(ovulation, 1);
    }

    final phase = _phase(
      date: date,
      cycle: current,
      fertileStart: fertileStart,
      fertileEnd: fertileEnd,
      prediction: prediction,
    );

    return CycleStatus(
      phase: phase,
      cycleDay: cycleDay,
      currentCycleStart: current.startDate,
      fertileWindowStart: fertileStart,
      fertileWindowEnd: fertileEnd,
    );
  }

  CyclePhase _phase({
    required DateTime date,
    required ObservedCycle cycle,
    required DateTime? fertileStart,
    required DateTime? fertileEnd,
    required CyclePrediction prediction,
  }) {
    // Recorded bleeding always wins over any estimate: what the user observed
    // outranks what the model expected.
    if (!date.isBefore(cycle.startDate) &&
        !date.isAfter(cycle.periodEndDate)) {
      return CyclePhase.menstrual;
    }

    if (!prediction.hasPrediction) return CyclePhase.unknown;

    // Well past the predicted window with no bleeding logged: the model has lost
    // the thread, and guessing "luteal" would be pretending otherwise.
    if (date.isAfter(addDays(prediction.latestStart!, 7))) {
      return CyclePhase.unknown;
    }

    if (fertileStart != null &&
        fertileEnd != null &&
        !date.isBefore(fertileStart) &&
        !date.isAfter(fertileEnd)) {
      return CyclePhase.fertileWindow;
    }

    return date.isBefore(fertileStart ?? prediction.likelyStart!)
        ? CyclePhase.follicular
        : CyclePhase.luteal;
  }

  /// Completed, plausible cycle lengths from the most recent [window] cycles.
  List<int> _usableLengths(List<ObservedCycle> cycles) {
    final lengths = <int>[];
    for (final c in cycles) {
      final len = c.length;
      if (len == null) continue;
      if (len < minPlausibleLength || len > maxPlausibleLength) continue;
      lengths.add(len);
    }
    if (lengths.length <= window) return lengths;
    return lengths.sublist(lengths.length - window);
  }

  PredictionConfidence _confidence(int n, double sd) {
    if (n >= 6 && sd <= 2.5) return PredictionConfidence.high;
    if (n >= 3 && sd <= 5.0) return PredictionConfidence.medium;
    return PredictionConfidence.low;
  }

  double _mean(List<int> xs) =>
      xs.fold<int>(0, (a, b) => a + b) / xs.length;

  /// Sample standard deviation (n−1). With a single value there is no spread to
  /// measure, so the caller's floor takes over.
  double _sampleStdDev(List<int> xs, double mean) {
    if (xs.length < 2) return 0;
    final ss = xs.fold<double>(0, (a, x) => a + math.pow(x - mean, 2));
    return math.sqrt(ss / (xs.length - 1));
  }
}
