import '../models/enums.dart';
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
