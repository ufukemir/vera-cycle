import 'package:cycle_app/models/cycle.dart';
import 'package:cycle_app/models/day_log.dart';
import 'package:cycle_app/models/enums.dart';
import 'package:cycle_app/services/advanced_insights.dart';
import 'package:cycle_app/util/day.dart';
import 'package:flutter_test/flutter_test.dart';

/// A run of back-to-back 28-day cycles with 5-day periods, starting
/// [count] cycles ago.
List<ObservedCycle> _cycles(int count, {int length = 28, int period = 5}) {
  final first = addDays(today(), -length * count);
  return [
    for (var i = 0; i < count; i++)
      ObservedCycle(
        startDate: addDays(first, length * i),
        periodEndDate: addDays(first, length * i + period - 1),
        nextStartDate: addDays(first, length * (i + 1)),
      ),
  ];
}

/// Logs [symptom] on [cycleDay] of every cycle in [cycles].
List<DayLog> _onCycleDay(
  List<ObservedCycle> cycles,
  int cycleDay, {
  Symptom? symptom,
  String? tag,
  Mood? mood,
}) {
  return [
    for (final cycle in cycles)
      DayLog(
        date: addDays(cycle.startDate, cycleDay - 1),
        symptoms: symptom == null ? null : {symptom},
        customTags: tag == null ? null : {tag},
        mood: mood,
      ),
  ];
}

void main() {
  test('says nothing at all until three cycles are complete', () {
    final cycles = _cycles(2);
    final insights = AdvancedInsights.compute(
      cycles,
      _onCycleDay(cycles, 2, symptom: Symptom.cramps),
    );

    expect(insights.hasPatterns, isFalse);
    expect(insights.symptomPatterns, isEmpty);
    // The raw length series is still reported — it states a fact rather
    // than claiming a pattern.
    expect(insights.cycleLengthTrend, hasLength(2));
  });

  test('places a symptom logged during bleeding in the period segment', () {
    final cycles = _cycles(4);
    final insights = AdvancedInsights.compute(
      cycles,
      _onCycleDay(cycles, 2, symptom: Symptom.cramps),
    );

    final cramps = insights.symptomPatterns.single;
    expect(cramps.key, Symptom.cramps);
    expect(cramps.value.totalDays, 4);
    expect(cramps.value.peakSegment, CycleSegment.period);
    expect(cramps.value.averageCycleDay, 2);
    expect(cramps.value.isPronounced, isTrue);
  });

  test('places a late-cycle symptom in the run-up to the next period', () {
    final cycles = _cycles(4);
    final insights = AdvancedInsights.compute(
      cycles,
      _onCycleDay(cycles, 25, symptom: Symptom.bloating),
    );

    expect(insights.symptomPatterns.single.value.peakSegment,
        CycleSegment.beforePeriod);
  });

  test('a symptom spread evenly across the cycle is not called a pattern', () {
    final cycles = _cycles(4);
    final insights = AdvancedInsights.compute(cycles, [
      ..._onCycleDay(cycles, 2, symptom: Symptom.headache),
      ..._onCycleDay(cycles, 10, symptom: Symptom.headache),
      ..._onCycleDay(cycles, 15, symptom: Symptom.headache),
      ..._onCycleDay(cycles, 25, symptom: Symptom.headache),
    ]);

    expect(insights.symptomPatterns.single.value.isPronounced, isFalse);
  });

  test('a tie between segments reports no peak rather than picking one', () {
    final cycles = _cycles(4);
    final insights = AdvancedInsights.compute(cycles, [
      ..._onCycleDay(cycles, 2, symptom: Symptom.nausea),
      ..._onCycleDay(cycles, 25, symptom: Symptom.nausea),
    ]);

    expect(insights.symptomPatterns.single.value.peakSegment, isNull);
    expect(insights.symptomPatterns.single.value.peakShare, 0);
  });

  test('custom trackers get the same treatment as built-in symptoms', () {
    final cycles = _cycles(4);
    final insights = AdvancedInsights.compute(
      cycles,
      _onCycleDay(cycles, 24, tag: 'migren'),
    );

    final tag = insights.customTagPatterns.single;
    expect(tag.key, 'migren');
    expect(tag.value.totalDays, 4);
    expect(tag.value.peakSegment, CycleSegment.beforePeriod);
  });

  test('patterns are ranked by how often each thing was logged', () {
    final cycles = _cycles(4);
    final insights = AdvancedInsights.compute(cycles, [
      ..._onCycleDay(cycles, 2, symptom: Symptom.cramps),
      ..._onCycleDay(cycles.take(2).toList(), 3, symptom: Symptom.acne),
    ]);

    expect(
      insights.symptomPatterns.map((e) => e.key),
      [Symptom.cramps, Symptom.acne],
    );
  });

  test('the still-open cycle is excluded from placement', () {
    // Three closed cycles that end well before today, then an open one —
    // so the logged day below falls only inside the open cycle.
    final firstStart = addDays(today(), -100);
    final closed = [
      for (var i = 0; i < 3; i++)
        ObservedCycle(
          startDate: addDays(firstStart, 28 * i),
          periodEndDate: addDays(firstStart, 28 * i + 4),
          nextStartDate: addDays(firstStart, 28 * (i + 1)),
        ),
    ];
    final open = ObservedCycle(
      startDate: addDays(firstStart, 84),
      periodEndDate: addDays(firstStart, 88),
    );

    final insights = AdvancedInsights.compute(
      [...closed, open],
      [
        DayLog(
          date: addDays(firstStart, 90),
          symptoms: const {Symptom.cramps},
        ),
      ],
    );

    expect(insights.symptomPatterns, isEmpty);
  });

  test('the dominant mood per segment needs a clear winner', () {
    final cycles = _cycles(4);
    final tied = AdvancedInsights.compute(cycles, [
      ..._onCycleDay(cycles.take(2).toList(), 2, mood: Mood.calm),
      ..._onCycleDay(cycles.skip(2).toList(), 2, mood: Mood.sad),
    ]);
    expect(tied.dominantMoodBySegment[CycleSegment.period], isNull);

    final clear = AdvancedInsights.compute(
      cycles,
      _onCycleDay(cycles, 2, mood: Mood.irritable),
    );
    expect(clear.dominantMoodBySegment[CycleSegment.period], Mood.irritable);
  });

  test('an empty history computes without throwing and claims nothing', () {
    final insights = AdvancedInsights.compute(const [], const []);

    expect(insights.hasPatterns, isFalse);
    expect(insights.hasAnythingToShow, isFalse);
    expect(insights.cycleLengthTrend, isEmpty);
    expect(insights.cycleLengthDrift, isNull);
    expect(insights.driftGroupSize, isNull);
    expect(insights.dominantMoodBySegment, isEmpty);
  });

  test('a trend with no symptoms logged still has something to show', () {
    // Someone who logs flow faithfully but never taps a symptom: the
    // screen used to gate on hasPatterns and tell her to log three
    // cycles when she already had six.
    final insights = AdvancedInsights.compute(_cycles(6), const []);

    expect(insights.hasPatterns, isFalse);
    expect(insights.hasAnythingToShow, isTrue);
    expect(insights.cycleLengthTrend, hasLength(6));
  });

  test('drift refuses to compare a single cycle against a single cycle', () {
    // At 4 and 5 cycles a "third" is one cycle, so the old bar reported a
    // difference between two individual cycles — to one decimal place.
    for (final count in [4, 5]) {
      final start = addDays(today(), -400);
      var cursor = start;
      final volatile = <ObservedCycle>[];
      for (final length in [26, 40, 20, 32, 24].take(count)) {
        final next = addDays(cursor, length);
        volatile.add(ObservedCycle(
          startDate: cursor,
          periodEndDate: addDays(cursor, 4),
          nextStartDate: next,
        ));
        cursor = next;
      }

      final insights = AdvancedInsights.compute(volatile, const []);
      expect(insights.cycleLengthTrend, hasLength(count));
      expect(insights.cycleLengthDrift, isNull,
          reason: '$count cycles is not two comparable groups');
      expect(insights.driftGroupSize, isNull);
    }
  });

  test('a run inside one cycle is not a pattern', () {
    // Four consecutive bloating days in ONE of four cycles satisfied
    // "at least half the occurrences in one segment, over enough
    // occurrences" and got reported as "most often before your period".
    final cycles = _cycles(4);
    final target = cycles.first;
    final logs = [
      for (var day = 20; day <= 23; day++)
        DayLog(
          date: addDays(target.startDate, day - 1),
          symptoms: const {Symptom.bloating},
        ),
    ];

    final insights = AdvancedInsights.compute(cycles, logs);
    final bloating =
        insights.symptomPatterns.firstWhere((e) => e.key == Symptom.bloating);

    expect(bloating.value.totalDays, 4);
    expect(bloating.value.peakShare, 1.0);
    expect(bloating.value.cyclesInPeak, 1);
    expect(bloating.value.isPronounced, isFalse,
        reason: 'one event repeated over four days is still one event');
  });

  test('the same symptom across separate cycles does count as a pattern', () {
    final cycles = _cycles(4);
    final logs = [
      ..._onCycleDay(cycles, 25, symptom: Symptom.bloating),
      ..._onCycleDay(cycles, 26, symptom: Symptom.bloating),
    ];

    final insights = AdvancedInsights.compute(cycles, logs);
    final bloating =
        insights.symptomPatterns.firstWhere((e) => e.key == Symptom.bloating);

    expect(bloating.value.cyclesInPeak, 4);
    expect(bloating.value.isPronounced, isTrue);
  });

  test('cycle length drift needs six cycles and reports the direction', () {
    expect(
      AdvancedInsights.compute(_cycles(3), const []).cycleLengthDrift,
      isNull,
    );

    final start = addDays(today(), -200);
    var cursor = start;
    final lengthening = <ObservedCycle>[];
    for (final length in [26, 26, 30, 30, 32, 32]) {
      final next = addDays(cursor, length);
      lengthening.add(ObservedCycle(
        startDate: cursor,
        periodEndDate: addDays(cursor, 4),
        nextStartDate: next,
      ));
      cursor = next;
    }

    final drift =
        AdvancedInsights.compute(lengthening, const []).cycleLengthDrift;
    expect(drift, isNotNull);
    expect(drift, greaterThan(0));
  });
}
