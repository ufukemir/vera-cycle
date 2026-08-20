import 'package:cycle_app/models/day_log.dart';
import 'package:cycle_app/models/enums.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('round-trips every expanded field through JSON', () {
    final log = DayLog(
      date: DateTime(2026, 5, 1),
      flow: FlowIntensity.medium,
      symptoms: const {Symptom.pelvicPain, Symptom.dizziness},
      mood: Mood.content,
      energyLevel: EnergyLevel.energetic,
      skinHair: const {SkinHairSymptom.hairLoss, SkinHairSymptom.oilyScalp},
      breastExam: const {BreastExamFinding.allNormal},
      cervixPosition: CervixPosition.high,
      cervixOpening: CervixOpening.medium,
      cervixFirmness: CervixFirmness.soft,
      ovulationTest: OvulationTestResult.positive,
      waterIntakeMl: 1500,
      sleepMinutes: 480,
      weightKg: 62.5,
      medications: const ['Ibuprofen'],
    );

    final restored = DayLog.fromJson(log.toJson());

    expect(restored.energyLevel, EnergyLevel.energetic);
    expect(restored.skinHair, {SkinHairSymptom.hairLoss, SkinHairSymptom.oilyScalp});
    expect(restored.breastExam, {BreastExamFinding.allNormal});
    expect(restored.cervixPosition, CervixPosition.high);
    expect(restored.cervixOpening, CervixOpening.medium);
    expect(restored.cervixFirmness, CervixFirmness.soft);
    expect(restored.ovulationTest, OvulationTestResult.positive);
    expect(restored.waterIntakeMl, 1500);
    expect(restored.sleepMinutes, 480);
    expect(restored.weightKg, 62.5);
    expect(restored.medications, ['Ibuprofen']);
  });

  test('a day with only a new-field value is not considered empty', () {
    final log = DayLog(date: DateTime(2026, 5, 1), weightKg: 60.0);
    expect(log.isEmpty, isFalse);
  });

  test('an unknown skinHair value in storage decodes to nothing, not a crash', () {
    final json = {
      'date': '2026-05-01',
      'skinHair': ['futureValueNotYetSupported', 'hairLoss'],
    };

    final restored = DayLog.fromJson(json);

    expect(restored.skinHair, {SkinHairSymptom.hairLoss});
  });

  test('copyWith clears cervix fields independently', () {
    final log = DayLog(
      date: DateTime(2026, 5, 1),
      cervixPosition: CervixPosition.low,
      cervixFirmness: CervixFirmness.firm,
    );

    final cleared = log.copyWith(clearCervixPosition: true);

    expect(cleared.cervixPosition, isNull);
    expect(cleared.cervixFirmness, CervixFirmness.firm);
  });

  test('birth-control entries round-trip through storage', () {
    final log = DayLog(
      date: DateTime(2026, 5, 1),
      birthControl: {BirthControlEntry.pillTaken, BirthControlEntry.iud},
    );

    final restored = DayLog.fromJson(log.toJson());

    expect(restored.birthControl,
        {BirthControlEntry.pillTaken, BirthControlEntry.iud});
    expect(restored.isEmpty, isFalse);
  });

  test('an unknown birth-control value decodes to nothing, not a crash', () {
    final restored = DayLog.fromJson({
      'date': '2026-05-01',
      'birthControl': ['someFutureMethod', 'patch'],
    });

    expect(restored.birthControl, {BirthControlEntry.patch});
  });
}
