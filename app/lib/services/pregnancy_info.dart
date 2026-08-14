import '../util/day.dart';

/// Gestational maths from the last menstrual period (LMP) — Naegele's rule,
/// the same convention clinicians use for a first estimate.
///
/// Everything here is explicitly an *estimate*: real dating comes from an
/// ultrasound, and cycles that ovulate late shift these numbers. The UI
/// says so; this class just does the arithmetic (see CLAUDE.md principle 7
/// — informational, never a substitute for medical care).
class PregnancyInfo {
  const PregnancyInfo._({
    required this.lmp,
    required this.dueDate,
    required this.daysElapsed,
  });

  /// Standard full-term length counted from LMP.
  static const gestationDays = 280;

  static const _maxWeeks = 42;

  final DateTime lmp;
  final DateTime dueDate;

  /// Days since LMP, clamped at zero — a future LMP is nonsense input.
  final int daysElapsed;

  /// `null` when [lmp] is more than 42 weeks ago: past that point the
  /// numbers stop being meaningful and the UI should prompt to update or
  /// turn the mode off rather than show an absurd week count.
  static PregnancyInfo? from(DateTime lmp, {DateTime? on}) {
    final start = dateOnly(lmp);
    final today = dateOnly(on ?? DateTime.now());
    final elapsed = daysBetween(start, today);
    if (elapsed < 0) return null;
    if (elapsed > _maxWeeks * 7) return null;
    return PregnancyInfo._(
      lmp: start,
      dueDate: addDays(start, gestationDays),
      daysElapsed: elapsed,
    );
  }

  int get weeks => daysElapsed ~/ 7;
  int get daysIntoWeek => daysElapsed % 7;

  /// 1-based trimester (1–3).
  int get trimester {
    if (weeks < 13) return 1;
    if (weeks < 27) return 2;
    return 3;
  }

  /// Days remaining until [dueDate]; negative once past it.
  int daysUntilDue({DateTime? on}) =>
      daysBetween(dateOnly(on ?? DateTime.now()), dueDate);

  /// 0.0–1.0 progress through the 280 days, clamped.
  double get progress => (daysElapsed / gestationDays).clamp(0.0, 1.0);
}
