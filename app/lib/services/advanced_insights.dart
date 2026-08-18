import '../models/cycle.dart';
import '../models/day_log.dart';
import '../models/enums.dart';
import '../util/day.dart';

/// Which stretch of a cycle a day fell in.
///
/// Deliberately coarser than [CyclePhase], and named after the user's own
/// recorded boundaries rather than after ovulation: this bucketing stays
/// true even for irregular cycles, where "fertile window" would be
/// guesswork dressed up as a measurement.
enum CycleSegment {
  /// Bleeding days, from day 1 to the last recorded day of flow.
  period,

  /// After bleeding stops, up to the middle of the cycle.
  afterPeriod,

  /// Around the middle of the cycle.
  midCycle,

  /// The run-up to the next period.
  beforePeriod,
}

/// How often something was logged, and where in the cycle it landed.
class OccurrencePattern {
  const OccurrencePattern({
    required this.totalDays,
    required this.bySegment,
    required this.peakSegment,
    required this.averageCycleDay,
    required this.cyclesInPeak,
  });

  /// Days this was logged at all, across every completed cycle.
  final int totalDays;

  /// How many DISTINCT cycles contributed a day to [peakSegment].
  ///
  /// The distinction matters: four bloating days in a row inside a single
  /// cycle used to satisfy "at least half the occurrences in one segment,
  /// over enough occurrences", and got reported as "most often before your
  /// period" — a recurring pattern claimed from one event.
  final int cyclesInPeak;

  /// Days logged per segment; segments with none are omitted.
  final Map<CycleSegment, int> bySegment;

  /// Where it shows up most, or `null` when the top two segments tie — a
  /// tie is not a pattern, and naming a winner would invent one.
  final CycleSegment? peakSegment;

  /// Mean 1-based cycle day it was logged on.
  final double averageCycleDay;

  /// Share of occurrences that fell in [peakSegment], 0–1.
  double get peakShare {
    final peak = peakSegment;
    if (peak == null || totalDays == 0) return 0;
    return (bySegment[peak] ?? 0) / totalDays;
  }

  /// Whether the concentration is worth describing as a pattern rather than
  /// noise: at least half the occurrences in one segment, over enough
  /// occurrences that "half" means something, and — the part that makes it
  /// a *pattern* — recurring in more than one cycle.
  bool get isPronounced =>
      totalDays >= 4 && peakShare >= 0.5 && cyclesInPeak >= 2;
}

/// A completed cycle's length — one point of the trend series.
class CycleLengthPoint {
  const CycleLengthPoint({required this.startDate, required this.length});

  final DateTime startDate;
  final int length;
}

/// Premium analysis over the user's own history.
///
/// Everything here is descriptive: counts of what was logged and when.
/// Nothing infers a diagnosis, and nothing is reported until there is
/// enough history for it to mean anything — the same bar the prediction
/// engine holds itself to.
class AdvancedInsights {
  const AdvancedInsights({
    required this.symptomPatterns,
    required this.cycleLengthTrend,
    required this.dominantMoodBySegment,
    required this.customTagPatterns,
  });

  /// Completed cycles needed before patterns are computed at all. Two
  /// cycles can line up by pure coincidence; three is the first point where
  /// repetition is worth showing to someone.
  static const minCyclesForPatterns = 3;

  /// Symptom → its distribution, most-logged first.
  final List<MapEntry<Symptom, OccurrencePattern>> symptomPatterns;

  /// Completed cycle lengths, oldest first.
  final List<CycleLengthPoint> cycleLengthTrend;

  /// Segment → the mood logged most often in it, where there is a clear one.
  final Map<CycleSegment, Mood> dominantMoodBySegment;

  /// The user's own tracker labels, same shape as [symptomPatterns].
  final List<MapEntry<String, OccurrencePattern>> customTagPatterns;

  bool get hasPatterns =>
      symptomPatterns.isNotEmpty || customTagPatterns.isNotEmpty;

  /// Whether the report has any section worth rendering. Broader than
  /// [hasPatterns] on purpose: the cycle-length trend and the mood
  /// breakdown stand on their own for someone who logs flow but not
  /// symptoms.
  bool get hasAnythingToShow =>
      hasPatterns ||
      cycleLengthTrend.length >= 2 ||
      dominantMoodBySegment.isNotEmpty;

  /// Cycles each of the two compared groups must hold before a drift is
  /// worth reporting. At the old bar of 4 cycles a "third" was a single
  /// cycle, so the figure compared one cycle to one cycle — and was printed
  /// to one decimal place, which reads as a measurement rather than the
  /// coin-flip it was.
  static const _minCyclesPerDriftGroup = 2;

  /// How many cycles sit in each side of the [cycleLengthDrift] comparison,
  /// or `null` when there is no drift to report. The UI states this, so the
  /// number is never read as coming from the whole history.
  int? get driftGroupSize {
    final third = (cycleLengthTrend.length / 3).floor();
    return third < _minCyclesPerDriftGroup ? null : third;
  }

  /// How much cycle length moved between the oldest and newest thirds of
  /// the history, in days. `null` until each third holds at least
  /// [_minCyclesPerDriftGroup] cycles — that is, from 6 completed cycles.
  double? get cycleLengthDrift {
    final third = driftGroupSize;
    if (third == null) return null;
    final oldest = cycleLengthTrend.take(third);
    final newest = cycleLengthTrend.skip(cycleLengthTrend.length - third);
    final oldMean = oldest.fold<int>(0, (s, p) => s + p.length) / oldest.length;
    final newMean = newest.fold<int>(0, (s, p) => s + p.length) / newest.length;
    return newMean - oldMean;
  }

  static AdvancedInsights compute(
    List<ObservedCycle> cycles,
    List<DayLog> logs,
  ) {
    final completed = cycles.where((c) => c.isComplete).toList();
    final trend = [
      for (final cycle in completed)
        CycleLengthPoint(startDate: cycle.startDate, length: cycle.length!),
    ]..sort((a, b) => a.startDate.compareTo(b.startDate));

    if (completed.length < minCyclesForPatterns) {
      return AdvancedInsights(
        symptomPatterns: const [],
        cycleLengthTrend: trend,
        dominantMoodBySegment: const {},
        customTagPatterns: const [],
      );
    }

    final symptomDays = <Symptom, List<_Placed>>{};
    final tagDays = <String, List<_Placed>>{};
    final moodsBySegment = <CycleSegment, Map<Mood, int>>{};

    for (final log in logs) {
      final placed = _place(log.date, completed);
      if (placed == null) continue;

      for (final symptom in log.symptoms) {
        (symptomDays[symptom] ??= []).add(placed);
      }
      for (final tag in log.customTags) {
        (tagDays[tag] ??= []).add(placed);
      }
      final mood = log.mood;
      if (mood != null) {
        final counts = moodsBySegment[placed.segment] ??= {};
        counts[mood] = (counts[mood] ?? 0) + 1;
      }
    }

    return AdvancedInsights(
      symptomPatterns: _ranked(symptomDays),
      cycleLengthTrend: trend,
      // Keyed in CycleSegment declaration order, not first-encounter
      // order, so the UI reads period → after → mid → before rather than
      // whatever order the logs happened to arrive in.
      dominantMoodBySegment: {
        for (final segment in CycleSegment.values)
          if (moodsBySegment[segment] case final counts?)
            segment: ?_dominant(counts),
      },
      customTagPatterns: _ranked(tagDays),
    );
  }

  static List<MapEntry<K, OccurrencePattern>> _ranked<K>(
    Map<K, List<_Placed>> source,
  ) {
    final ranked = [
      for (final entry in source.entries)
        MapEntry(entry.key, _pattern(entry.value)),
    ]..sort((a, b) => b.value.totalDays.compareTo(a.value.totalDays));
    return List.unmodifiable(ranked);
  }

  static OccurrencePattern _pattern(List<_Placed> days) {
    final bySegment = <CycleSegment, int>{};
    final cyclesBySegment = <CycleSegment, Set<DateTime>>{};
    var cycleDaySum = 0;
    for (final day in days) {
      bySegment[day.segment] = (bySegment[day.segment] ?? 0) + 1;
      (cyclesBySegment[day.segment] ??= {}).add(day.cycleStart);
      cycleDaySum += day.cycleDay;
    }

    final peak = _dominant(bySegment);
    return OccurrencePattern(
      totalDays: days.length,
      bySegment: Map.unmodifiable(bySegment),
      peakSegment: peak,
      averageCycleDay: cycleDaySum / days.length,
      cyclesInPeak: peak == null ? 0 : (cyclesBySegment[peak]?.length ?? 0),
    );
  }

  /// The single most common key, or `null` if the top two are tied.
  static T? _dominant<T>(Map<T, int> counts) {
    if (counts.isEmpty) return null;
    final sorted = counts.entries.toList()
      ..sort((a, b) => b.value.compareTo(a.value));
    if (sorted.length > 1 && sorted[0].value == sorted[1].value) return null;
    return sorted.first.key;
  }

  /// Locates a date within the completed cycle it belongs to. Days outside
  /// every completed cycle — before the first, or inside the still-open one
  /// — are skipped: the open cycle's later days have not happened yet, so
  /// counting it would starve the "before period" bucket.
  static _Placed? _place(DateTime date, List<ObservedCycle> completed) {
    for (final cycle in completed) {
      if (date.isBefore(cycle.startDate)) continue;
      if (!date.isBefore(cycle.nextStartDate!)) continue;

      final cycleDay = daysBetween(cycle.startDate, date) + 1;
      final length = cycle.length!;
      final CycleSegment segment;
      if (cycleDay <= cycle.periodLength) {
        segment = CycleSegment.period;
      } else if (cycleDay < length * 0.4) {
        segment = CycleSegment.afterPeriod;
      } else if (cycleDay <= length * 0.6) {
        segment = CycleSegment.midCycle;
      } else {
        segment = CycleSegment.beforePeriod;
      }
      return _Placed(
        cycleDay: cycleDay,
        segment: segment,
        cycleStart: cycle.startDate,
      );
    }
    return null;
  }
}

class _Placed {
  const _Placed({
    required this.cycleDay,
    required this.segment,
    required this.cycleStart,
  });

  final int cycleDay;
  final CycleSegment segment;

  /// Which cycle this day belongs to, so a "pattern" can be required to
  /// repeat across cycles rather than being one long stretch inside one.
  final DateTime cycleStart;
}
