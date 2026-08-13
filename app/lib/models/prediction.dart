import 'enums.dart';
import '../util/day.dart';

/// The app's forecast for the next period, expressed as a range.
///
/// There is no single "your period is on the 14th" field anywhere in this class,
/// and that omission is the product. A point estimate implies a precision that
/// menstrual cycles do not have, and every user who has been told the wrong
/// exact day has learned to distrust the app that told them.
class CyclePrediction {
  const CyclePrediction({
    required this.confidence,
    required this.cyclesUsed,
    this.earliestStart,
    this.likelyStart,
    this.latestStart,
    this.meanLength,
    this.stdDev,
    this.irregular = false,
  });

  /// The "not enough data yet" prediction. Shown instead of a guess dressed up
  /// as a forecast.
  const CyclePrediction.insufficient({this.cyclesUsed = 0})
      : confidence = PredictionConfidence.none,
        earliestStart = null,
        likelyStart = null,
        latestStart = null,
        meanLength = null,
        stdDev = null,
        irregular = false;

  final PredictionConfidence confidence;

  /// How many completed cycles went into the estimate. Surfaced in the UI so the
  /// user can judge the forecast for themselves.
  final int cyclesUsed;

  /// Start of the predicted window.
  final DateTime? earliestStart;

  /// Centre of the predicted window. Presented as the middle of a range, never
  /// alone.
  final DateTime? likelyStart;

  /// End of the predicted window.
  final DateTime? latestStart;

  final double? meanLength;
  final double? stdDev;

  /// Set when cycle length varies far more than typical. Surfaced as neutral
  /// information plus a suggestion to talk to a clinician — never as a
  /// diagnosis (see CLAUDE.md, principle 7).
  final bool irregular;

  bool get hasPrediction => likelyStart != null;

  /// Width of the predicted window in days, inclusive.
  int? get windowDays => (earliestStart == null || latestStart == null)
      ? null
      : daysBetween(earliestStart!, latestStart!) + 1;

  @override
  String toString() => hasPrediction
      ? 'CyclePrediction(${dayKey(earliestStart!)}–${dayKey(latestStart!)}, '
          '${confidence.name}, n=$cyclesUsed)'
      : 'CyclePrediction(none, n=$cyclesUsed)';
}

/// Where the user is in the current cycle, plus the estimated fertile window.
class CycleStatus {
  const CycleStatus({
    required this.phase,
    this.cycleDay,
    this.currentCycleStart,
    this.fertileWindowStart,
    this.fertileWindowEnd,
  });

  final CyclePhase phase;

  /// 1-based day of the current cycle; `null` when no cycle has been recorded.
  final int? cycleDay;

  final DateTime? currentCycleStart;

  /// Estimated fertile window. Derived from the *predicted* next period, so it
  /// inherits all of that prediction's uncertainty — which is why it is labelled
  /// an estimate everywhere it appears and is never offered as contraception.
  final DateTime? fertileWindowStart;
  final DateTime? fertileWindowEnd;

  bool get hasFertileEstimate =>
      fertileWindowStart != null && fertileWindowEnd != null;
}
