import 'package:cycle_app/services/pregnancy_info.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final lmp = DateTime(2026, 1, 1);

  test('due date is LMP + 280 days (Naegele)', () {
    final info = PregnancyInfo.from(lmp, on: DateTime(2026, 3, 1))!;
    expect(info.dueDate, DateTime(2026, 10, 8));
  });

  test('reports weeks and days into the week', () {
    // 65 days elapsed = 9 weeks + 2 days.
    final info = PregnancyInfo.from(lmp, on: DateTime(2026, 3, 7))!;
    expect(info.daysElapsed, 65);
    expect(info.weeks, 9);
    expect(info.daysIntoWeek, 2);
  });

  test('trimester boundaries fall at weeks 13 and 27', () {
    expect(PregnancyInfo.from(lmp, on: DateTime(2026, 3, 26))!.weeks, 12);
    expect(PregnancyInfo.from(lmp, on: DateTime(2026, 3, 26))!.trimester, 1);
    expect(PregnancyInfo.from(lmp, on: DateTime(2026, 4, 2))!.trimester, 2);
    expect(PregnancyInfo.from(lmp, on: DateTime(2026, 7, 9))!.trimester, 3);
  });

  test('a future LMP is rejected rather than producing negative weeks', () {
    expect(
      PregnancyInfo.from(DateTime(2026, 6, 1), on: DateTime(2026, 5, 1)),
      isNull,
    );
  });

  test('past 42 weeks it returns null instead of an absurd week count', () {
    expect(PregnancyInfo.from(lmp, on: DateTime(2026, 11, 1)), isNull);
  });

  test('progress is clamped to 0..1', () {
    final early = PregnancyInfo.from(lmp, on: DateTime(2026, 1, 1))!;
    expect(early.progress, 0.0);
    final late = PregnancyInfo.from(lmp, on: DateTime(2026, 10, 20))!;
    expect(late.progress, lessThanOrEqualTo(1.0));
  });

  test('days until due goes negative past the due date', () {
    final info = PregnancyInfo.from(lmp, on: DateTime(2026, 10, 15))!;
    expect(info.daysUntilDue(on: DateTime(2026, 10, 15)), -7);
  });
}
