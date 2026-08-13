import '../util/day.dart';

/// A cycle the user actually recorded, derived from their day logs rather than
/// stored directly — the logs are the source of truth, so editing a past day
/// always re-derives clean history.
class ObservedCycle {
  ObservedCycle({
    required DateTime startDate,
    required DateTime periodEndDate,
    DateTime? nextStartDate,
  })  : startDate = dateOnly(startDate),
        periodEndDate = dateOnly(periodEndDate),
        nextStartDate =
            nextStartDate == null ? null : dateOnly(nextStartDate);

  /// Day 1: the first day of menstrual flow in this cycle.
  final DateTime startDate;

  /// Last recorded day of bleeding in this cycle's period.
  final DateTime periodEndDate;

  /// First day of the *following* period. `null` for the cycle still in
  /// progress, which is precisely the cycle whose length we are predicting.
  final DateTime? nextStartDate;

  /// Days of bleeding, inclusive of both endpoints.
  int get periodLength => daysBetween(startDate, periodEndDate) + 1;

  /// Full cycle length in days, or `null` while the cycle is still open.
  ///
  /// An open cycle has no length yet; averaging it in as if it had one would
  /// drag every prediction downward.
  int? get length =>
      nextStartDate == null ? null : daysBetween(startDate, nextStartDate!);

  bool get isComplete => nextStartDate != null;

  @override
  String toString() =>
      'ObservedCycle(${dayKey(startDate)} → ${length ?? "ongoing"}d, '
      'period ${periodLength}d)';
}
