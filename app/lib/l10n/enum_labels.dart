import '../models/enums.dart';
import '../services/reminder_service.dart';
import '../services/advanced_insights.dart';
import 'app_localizations.dart';

/// Shared enum→label lookups.
///
/// These mappings had grown a copy per screen; new screens use these so the
/// count stops rising.
String symptomLabel(AppLocalizations l10n, Symptom symptom) =>
    switch (symptom) {
      Symptom.cramps => l10n.symptomCramps,
      Symptom.headache => l10n.symptomHeadache,
      Symptom.bloating => l10n.symptomBloating,
      Symptom.breastTenderness => l10n.symptomBreastTenderness,
      Symptom.acne => l10n.symptomAcne,
      Symptom.fatigue => l10n.symptomFatigue,
      Symptom.nausea => l10n.symptomNausea,
      Symptom.backPain => l10n.symptomBackPain,
      Symptom.appetiteChange => l10n.symptomAppetiteChange,
      Symptom.sleepTrouble => l10n.symptomSleepTrouble,
      Symptom.pelvicPain => l10n.symptomPelvicPain,
      Symptom.dizziness => l10n.symptomDizziness,
    };

String moodLabel(AppLocalizations l10n, Mood mood) => switch (mood) {
      Mood.calm => l10n.moodCalm,
      Mood.anxious => l10n.moodAnxious,
      Mood.irritable => l10n.moodIrritable,
      Mood.low => l10n.moodLow,
      Mood.energetic => l10n.moodEnergetic,
      Mood.happy => l10n.moodHappy,
      Mood.content => l10n.moodContent,
      Mood.sad => l10n.moodSad,
      Mood.depressed => l10n.moodDepressed,
      Mood.emotional => l10n.moodEmotional,
    };

String phaseLabel(AppLocalizations l10n, CyclePhase phase) => switch (phase) {
      CyclePhase.menstrual => l10n.homePhaseMenstrual,
      CyclePhase.follicular => l10n.homePhaseFollicular,
      CyclePhase.fertileWindow => l10n.homePhaseFertileWindow,
      CyclePhase.luteal => l10n.homePhaseLuteal,
      CyclePhase.unknown => l10n.homePhaseUnknown,
    };

String flowLabel(AppLocalizations l10n, FlowIntensity flow) => switch (flow) {
      FlowIntensity.spotting => l10n.flowSpotting,
      FlowIntensity.light => l10n.flowLight,
      FlowIntensity.medium => l10n.flowMedium,
      FlowIntensity.heavy => l10n.flowHeavy,
    };

String cycleSegmentLabel(AppLocalizations l10n, CycleSegment segment) =>
    switch (segment) {
      CycleSegment.period => l10n.segmentPeriod,
      CycleSegment.afterPeriod => l10n.segmentAfterPeriod,
      CycleSegment.midCycle => l10n.segmentMidCycle,
      CycleSegment.beforePeriod => l10n.segmentBeforePeriod,
    };

/// Name shown for a reminder category in the OS notification settings.
///
/// Android displays this in Settings → Apps → Vera → Notifications, so it
/// has to be in the user's language like everything else. It previously
/// came from an English literal on the enum.
String reminderChannelName(AppLocalizations l10n, ReminderCategory category) =>
    switch (category) {
      ReminderCategory.periodStart => l10n.notificationChannelPeriodStart,
      ReminderCategory.periodEnd => l10n.notificationChannelPeriodEnd,
      ReminderCategory.medication => l10n.notificationChannelMedication,
      ReminderCategory.water => l10n.notificationChannelWater,
      ReminderCategory.appointment => l10n.notificationChannelAppointment,
      ReminderCategory.ovulation => l10n.notificationChannelOvulation,
      ReminderCategory.backup => l10n.notificationChannelBackup,
    };

String sexLifeLabel(AppLocalizations l10n, SexLifeEntry entry) =>
    switch (entry) {
      SexLifeEntry.none => l10n.sexLifeNone,
      SexLifeEntry.unprotected => l10n.sexLifeUnprotected,
      SexLifeEntry.protectedSex => l10n.sexLifeProtected,
      SexLifeEntry.masturbation => l10n.sexLifeMasturbation,
      SexLifeEntry.noOrgasm => l10n.sexLifeNoOrgasm,
      SexLifeEntry.orgasm => l10n.sexLifeOrgasm,
      SexLifeEntry.highDesire => l10n.sexLifeHighDesire,
    };

String ovulationTestLabel(AppLocalizations l10n, OvulationTestResult value) =>
    switch (value) {
      OvulationTestResult.negative => l10n.ovulationTestLow,
      OvulationTestResult.high => l10n.ovulationTestHigh,
      OvulationTestResult.positive => l10n.ovulationTestPeak,
    };

String pregnancyTestLabel(AppLocalizations l10n, PregnancyTestResult value) =>
    switch (value) {
      PregnancyTestResult.positive => l10n.pregnancyTestPositive,
      PregnancyTestResult.faint => l10n.pregnancyTestFaint,
      PregnancyTestResult.negative => l10n.pregnancyTestNegative,
    };
