import 'package:flutter/material.dart';

import '../models/enums.dart';

/// An icon for every loggable option.
///
/// The day log was a wall of text pills. Every competitor worth looking at
/// puts a small picture on each option, and it is not decoration: an icon
/// makes a twelve-item symptom list scannable at a glance instead of read
/// word by word, and it gives the eye something to aim at on a screen the
/// user taps several times a day.
///
/// These are Material glyphs rather than drawn artwork — deliberately. The
/// reference app's own illustrations are copyrighted and CLAUDE.md is
/// explicit that patterns may be borrowed and assets may not. Material icons
/// are already in the bundle, render crisply at every size, and never need a
/// licence note.
class LogIcons {
  LogIcons._();

  static IconData flow(FlowIntensity? value) => switch (value) {
        null => Icons.do_not_disturb_alt,
        FlowIntensity.spotting => Icons.water_drop_outlined,
        FlowIntensity.light => Icons.water_drop,
        FlowIntensity.medium => Icons.invert_colors,
        FlowIntensity.heavy => Icons.bloodtype,
      };

  static IconData symptom(Symptom value) => switch (value) {
        Symptom.cramps => Icons.flash_on,
        Symptom.headache => Icons.psychology_alt,
        Symptom.bloating => Icons.bubble_chart,
        Symptom.breastTenderness => Icons.spa,
        Symptom.acne => Icons.face_retouching_natural,
        Symptom.fatigue => Icons.battery_2_bar,
        Symptom.nausea => Icons.sick,
        Symptom.backPain => Icons.accessibility_new,
        Symptom.appetiteChange => Icons.restaurant,
        Symptom.sleepTrouble => Icons.bedtime_off,
        Symptom.pelvicPain => Icons.adjust,
        Symptom.dizziness => Icons.blur_on,
      };

  static IconData mood(Mood value) => switch (value) {
        Mood.calm => Icons.self_improvement,
        Mood.anxious => Icons.sentiment_neutral,
        Mood.irritable => Icons.sentiment_very_dissatisfied,
        Mood.low => Icons.sentiment_dissatisfied,
        Mood.energetic => Icons.bolt,
        Mood.happy => Icons.sentiment_very_satisfied,
        Mood.content => Icons.sentiment_satisfied,
        Mood.sad => Icons.mood_bad,
        Mood.depressed => Icons.cloud,
        Mood.emotional => Icons.favorite,
      };

  static IconData energy(EnergyLevel value) => switch (value) {
        EnergyLevel.low => Icons.battery_1_bar,
        EnergyLevel.medium => Icons.battery_3_bar,
        EnergyLevel.high => Icons.battery_5_bar,
        EnergyLevel.energetic => Icons.battery_charging_full,
      };

  static IconData skinHair(SkinHairSymptom value) => switch (value) {
        SkinHairSymptom.healthyGlow => Icons.auto_awesome,
        SkinHairSymptom.skinRedness => Icons.local_fire_department,
        SkinHairSymptom.skinDryness => Icons.grain,
        SkinHairSymptom.skinOiliness => Icons.opacity,
        SkinHairSymptom.goodHairDay => Icons.brush,
        SkinHairSymptom.badHairDay => Icons.air,
        SkinHairSymptom.hairLoss => Icons.content_cut,
        SkinHairSymptom.oilyScalp => Icons.water_drop,
      };

  static IconData mucus(CervicalMucus value) => switch (value) {
        CervicalMucus.dry => Icons.grain,
        CervicalMucus.sticky => Icons.blur_circular,
        CervicalMucus.creamy => Icons.opacity,
        CervicalMucus.watery => Icons.water_drop,
        CervicalMucus.eggWhite => Icons.egg_alt,
      };

  static IconData sexLife(SexLifeEntry value) => switch (value) {
        SexLifeEntry.none => Icons.do_not_disturb_alt,
        SexLifeEntry.unprotected => Icons.favorite,
        SexLifeEntry.protectedSex => Icons.shield_outlined,
        SexLifeEntry.masturbation => Icons.back_hand_outlined,
        SexLifeEntry.noOrgasm => Icons.sentiment_neutral,
        SexLifeEntry.orgasm => Icons.auto_awesome,
        SexLifeEntry.highDesire => Icons.local_fire_department,
      };

  static IconData ovulationTest(OvulationTestResult value) => switch (value) {
        OvulationTestResult.negative => Icons.remove_circle_outline,
        OvulationTestResult.high => Icons.trending_up,
        OvulationTestResult.positive => Icons.check_circle_outline,
      };

  static IconData breastExam(BreastExamFinding value) => switch (value) {
        BreastExamFinding.allNormal => Icons.check_circle_outline,
        BreastExamFinding.lump => Icons.radio_button_checked,
        BreastExamFinding.indentation => Icons.adjust,
        BreastExamFinding.redness => Icons.local_fire_department,
        BreastExamFinding.crackedNipple => Icons.healing,
        BreastExamFinding.discharge => Icons.water_drop,
      };

  static IconData cervixPosition(CervixPosition value) => switch (value) {
        CervixPosition.low => Icons.vertical_align_bottom,
        CervixPosition.medium => Icons.height,
        CervixPosition.high => Icons.vertical_align_top,
      };

  static IconData cervixOpening(CervixOpening value) => switch (value) {
        CervixOpening.closed => Icons.lock_outline,
        CervixOpening.medium => Icons.lock_open,
        CervixOpening.open => Icons.circle_outlined,
      };

  static IconData cervixFirmness(CervixFirmness value) => switch (value) {
        CervixFirmness.soft => Icons.cloud_outlined,
        CervixFirmness.medium => Icons.circle,
        CervixFirmness.firm => Icons.fitness_center,
      };
}
