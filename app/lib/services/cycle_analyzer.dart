import '../models/cycle.dart';
import '../models/day_log.dart';
import '../util/day.dart';

/// Turns raw day logs into the cycle history everything else reasons about.
///
/// Real logging is messy: people skip days, bleed for one day, spot for three
/// days before the real thing, or forget to close a period. The rules below are
/// deliberately conservative — when the data is ambiguous we would rather merge
/// two events into one cycle than invent a 6-day cycle that poisons the average.
class CycleAnalyzer {
  const CycleAnalyzer({this.maxGapWithinPeriod = 1, this.minCycleLength = 15});

  /// How many consecutive non-bleeding days may sit inside a single period
  /// before it is treated as two separate periods. One day absorbs the common
  /// "light day the user forgot to log" case.
  final int maxGapWithinPeriod;

  /// Bleeding that begins fewer than this many days after the current cycle
  /// started is treated as the same cycle, not a new one.
  ///
  /// Cycles shorter than ~15 days are rare enough, and mis-logged mid-cycle
  /// bleeding common enough, that this trade is worth it. The cost is that a
  /// genuinely very short cycle is absorbed; the benefit is that spotting never
  /// fabricates one.
  final int minCycleLength;

  /// Derives cycles from [logs], oldest first.
  ///
  /// Only [DayLog.hasMenstrualFlow] days open a cycle — spotting alone never
  /// does.
  List<ObservedCycle> analyze(Iterable<DayLog> logs) {
    final bleedingDays =
        logs.where((l) => l.hasMenstrualFlow).map((l) => l.date).toList()
          ..sort();

    if (bleedingDays.isEmpty) return const [];

    final episodes = _groupIntoEpisodes(bleedingDays);
    final merged = _mergeShortIntervals(episodes);

    final cycles = <ObservedCycle>[];
    for (var i = 0; i < merged.length; i++) {
      cycles.add(
        ObservedCycle(
          startDate: merged[i].start,
          periodEndDate: merged[i].end,
          nextStartDate: i + 1 < merged.length ? merged[i + 1].start : null,
        ),
      );
    }
    return cycles;
  }

  /// Groups sorted bleeding days into contiguous runs, tolerating gaps of up to
  /// [maxGapWithinPeriod] days.
  List<_Episode> _groupIntoEpisodes(List<DateTime> days) {
    final episodes = <_Episode>[];
    var start = days.first;
    var end = days.first;

    for (var i = 1; i < days.length; i++) {
      final gap = daysBetween(end, days[i]);
      if (gap <= maxGapWithinPeriod + 1) {
        end = days[i];
      } else {
        episodes.add(_Episode(start, end));
        start = days[i];
        end = days[i];
      }
    }
    episodes.add(_Episode(start, end));
    return episodes;
  }

  /// Folds an episode into its predecessor when it begins too soon after that
  /// cycle started to plausibly be a new cycle.
  List<_Episode> _mergeShortIntervals(List<_Episode> episodes) {
    final merged = <_Episode>[];
    for (final e in episodes) {
      if (merged.isNotEmpty &&
          daysBetween(merged.last.start, e.start) < minCycleLength) {
        // Same cycle: extend the period to cover the later bleeding.
        merged[merged.length - 1] = _Episode(merged.last.start, e.end);
      } else {
        merged.add(e);
      }
    }
    return merged;
  }
}

class _Episode {
  const _Episode(this.start, this.end);
  final DateTime start;
  final DateTime end;
}
