import 'enums.dart';
import '../util/day.dart';

/// Everything the user recorded about a single calendar day.
///
/// Serialisation is hand-written rather than generated: this file is the shape
/// of the user's most sensitive data, and it should be readable by anyone
/// auditing the app without running a code generator.
///
/// Enums persist by `name`, never by index, so reordering [Symptom] in a later
/// release cannot silently rewrite a user's history.
class DayLog {
  DayLog({
    required DateTime date,
    this.flow,
    Set<Symptom>? symptoms,
    this.mood,
    this.energyLevel,
    Set<SkinHairSymptom>? skinHair,
    this.note,
    this.sexualActivity,
    this.sexLife = const {},
    this.basalTempC,
    this.mucus,
    this.ovulationTest,
    this.pregnancyTest,
    Set<BreastExamFinding>? breastExam,
    this.cervixPosition,
    this.cervixOpening,
    this.cervixFirmness,
    Set<BirthControlEntry>? birthControl,
    this.waterIntakeMl,
    this.sleepMinutes,
    this.weightKg,
    List<String>? medications,
    Set<String>? customTags,
  })  : date = dateOnly(date),
        symptoms = Set.unmodifiable(symptoms ?? const <Symptom>{}),
        skinHair = Set.unmodifiable(skinHair ?? const <SkinHairSymptom>{}),
        breastExam =
            Set.unmodifiable(breastExam ?? const <BreastExamFinding>{}),
        birthControl =
            Set.unmodifiable(birthControl ?? const <BirthControlEntry>{}),
        medications = List.unmodifiable(medications ?? const <String>[]),
        customTags = Set.unmodifiable(customTags ?? const <String>{});

  final DateTime date;

  /// `null` means "no bleeding recorded", which is distinct from an explicit
  /// zero — the user simply did not report bleeding that day.
  final FlowIntensity? flow;

  final Set<Symptom> symptoms;
  final Mood? mood;

  /// Deliberately separate from [mood] — see [EnergyLevel].
  final EnergyLevel? energyLevel;
  final Set<SkinHairSymptom> skinHair;
  final String? note;

  /// Optional trackers. All default to disabled in settings; a `null` here means
  /// the user never entered a value, not that the answer was "no".
  final bool? sexualActivity;

  /// What happened, when the user tracks that. Empty for everyone who does
  /// not — the switch that reveals this is off by default.
  ///
  /// [sexualActivity] stays as the plain yes/no it always was: it is what
  /// the tracker hub and the day list read, and rewriting stored logs to
  /// drop it would lose history for no gain. The two are kept consistent by
  /// the editor, not by the model.
  final Set<SexLifeEntry> sexLife;
  final double? basalTempC;
  final CervicalMucus? mucus;
  final OvulationTestResult? ovulationTest;
  final PregnancyTestResult? pregnancyTest;
  final Set<BreastExamFinding> breastExam;
  /// Contraception taken, or missed, today. Empty for anyone who does not
  /// track it; it is not gated behind a preference because it lives inside
  /// the medication card the user already opened.
  final Set<BirthControlEntry> birthControl;
  final CervixPosition? cervixPosition;
  final CervixOpening? cervixOpening;
  final CervixFirmness? cervixFirmness;

  /// Lifestyle stats — always visible (not gated by an opt-in preference),
  /// unlike the fertility-awareness/intimate trackers above.
  final int? waterIntakeMl;
  final int? sleepMinutes;
  final double? weightKg;
  final List<String> medications;

  /// User-defined tracker labels (Premium). Stored on the day itself rather
  /// than in a separate definitions list, so the set of available tags is
  /// simply everything the user has ever used — which keeps these
  /// user-authored health words inside the encrypted store instead of in
  /// plaintext preferences.
  final Set<String> customTags;

  /// `true` when this day carries no information, so the store can drop it
  /// instead of persisting empty rows the user did not create.
  bool get isEmpty =>
      flow == null &&
      symptoms.isEmpty &&
      mood == null &&
      energyLevel == null &&
      skinHair.isEmpty &&
      (note == null || note!.trim().isEmpty) &&
      sexualActivity == null &&
      sexLife.isEmpty &&
      basalTempC == null &&
      mucus == null &&
      ovulationTest == null &&
      pregnancyTest == null &&
      breastExam.isEmpty &&
      cervixPosition == null &&
      cervixOpening == null &&
      cervixFirmness == null &&
      birthControl.isEmpty &&
      waterIntakeMl == null &&
      sleepMinutes == null &&
      weightKg == null &&
      medications.isEmpty &&
      customTags.isEmpty;

  /// Any bleeding at all, including spotting.
  bool get hasBleeding => flow != null;

  /// Bleeding heavy enough to mark the start of a period.
  ///
  /// Spotting is excluded on purpose — see [FlowIntensity.spotting].
  bool get hasMenstrualFlow =>
      flow != null && flow != FlowIntensity.spotting;

  DayLog copyWith({
    FlowIntensity? flow,
    bool clearFlow = false,
    Set<Symptom>? symptoms,
    Mood? mood,
    bool clearMood = false,
    EnergyLevel? energyLevel,
    bool clearEnergyLevel = false,
    Set<SkinHairSymptom>? skinHair,
    String? note,
    bool clearNote = false,
    bool? sexualActivity,
    Set<SexLifeEntry>? sexLife,
    bool clearSexualActivity = false,
    double? basalTempC,
    bool clearBasalTemp = false,
    CervicalMucus? mucus,
    bool clearMucus = false,
    OvulationTestResult? ovulationTest,
    PregnancyTestResult? pregnancyTest,
    bool clearPregnancyTest = false,
    bool clearOvulationTest = false,
    Set<BreastExamFinding>? breastExam,
    CervixPosition? cervixPosition,
    bool clearCervixPosition = false,
    CervixOpening? cervixOpening,
    bool clearCervixOpening = false,
    CervixFirmness? cervixFirmness,
    Set<BirthControlEntry>? birthControl,
    bool clearCervixFirmness = false,
    int? waterIntakeMl,
    bool clearWaterIntake = false,
    int? sleepMinutes,
    bool clearSleepMinutes = false,
    double? weightKg,
    bool clearWeight = false,
    List<String>? medications,
    Set<String>? customTags,
  }) {
    return DayLog(
      date: date,
      flow: clearFlow ? null : (flow ?? this.flow),
      symptoms: symptoms ?? this.symptoms,
      mood: clearMood ? null : (mood ?? this.mood),
      energyLevel:
          clearEnergyLevel ? null : (energyLevel ?? this.energyLevel),
      skinHair: skinHair ?? this.skinHair,
      note: clearNote ? null : (note ?? this.note),
      sexLife: sexLife ?? this.sexLife,
      sexualActivity: clearSexualActivity
          ? null
          : (sexualActivity ?? this.sexualActivity),
      basalTempC: clearBasalTemp ? null : (basalTempC ?? this.basalTempC),
      mucus: clearMucus ? null : (mucus ?? this.mucus),
      ovulationTest:
          clearOvulationTest ? null : (ovulationTest ?? this.ovulationTest),
      pregnancyTest: clearPregnancyTest
          ? null
          : (pregnancyTest ?? this.pregnancyTest),
      breastExam: breastExam ?? this.breastExam,
      cervixPosition: clearCervixPosition
          ? null
          : (cervixPosition ?? this.cervixPosition),
      cervixOpening:
          clearCervixOpening ? null : (cervixOpening ?? this.cervixOpening),
      cervixFirmness: clearCervixFirmness
          ? null
          : (cervixFirmness ?? this.cervixFirmness),
      waterIntakeMl:
          clearWaterIntake ? null : (waterIntakeMl ?? this.waterIntakeMl),
      sleepMinutes:
          clearSleepMinutes ? null : (sleepMinutes ?? this.sleepMinutes),
      weightKg: clearWeight ? null : (weightKg ?? this.weightKg),
      medications: medications ?? this.medications,
      customTags: customTags ?? this.customTags,
    );
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'date': dayKey(date),
        if (flow != null) 'flow': flow!.name,
        if (symptoms.isNotEmpty)
          'symptoms': symptoms.map((s) => s.name).toList()..sort(),
        if (mood != null) 'mood': mood!.name,
        if (energyLevel != null) 'energyLevel': energyLevel!.name,
        if (skinHair.isNotEmpty)
          'skinHair': skinHair.map((s) => s.name).toList()..sort(),
        if (note != null && note!.isNotEmpty) 'note': note,
        if (sexualActivity != null) 'sexualActivity': sexualActivity,
        if (sexLife.isNotEmpty)
          'sexLife': sexLife.map((e) => e.name).toList()..sort(),
        if (basalTempC != null) 'basalTempC': basalTempC,
        if (mucus != null) 'mucus': mucus!.name,
        if (ovulationTest != null) 'ovulationTest': ovulationTest!.name,
        if (pregnancyTest != null) 'pregnancyTest': pregnancyTest!.name,
        if (breastExam.isNotEmpty)
          'breastExam': breastExam.map((b) => b.name).toList()..sort(),
        if (cervixPosition != null) 'cervixPosition': cervixPosition!.name,
        if (cervixOpening != null) 'cervixOpening': cervixOpening!.name,
        if (cervixFirmness != null) 'cervixFirmness': cervixFirmness!.name,
        if (birthControl.isNotEmpty)
          'birthControl': birthControl.map((e) => e.name).toList()..sort(),
        if (waterIntakeMl != null) 'waterIntakeMl': waterIntakeMl,
        if (sleepMinutes != null) 'sleepMinutes': sleepMinutes,
        if (weightKg != null) 'weightKg': weightKg,
        if (medications.isNotEmpty) 'medications': medications,
        if (customTags.isNotEmpty)
          'customTags': customTags.toList()..sort(),
      };

  /// Unknown enum values decode to `null` rather than throwing: a log written by
  /// a newer version of the app must not make the whole store unreadable on an
  /// older one.
  static DayLog fromJson(Map<String, dynamic> json) {
    return DayLog(
      date: parseDayKey(json['date'] as String),
      flow: _byName(FlowIntensity.values, json['flow']),
      symptoms: <Symptom>{
        for (final raw in (json['symptoms'] as List<dynamic>? ?? const []))
          ...[_byName(Symptom.values, raw)].whereType<Symptom>(),
      },
      mood: _byName(Mood.values, json['mood']),
      energyLevel: _byName(EnergyLevel.values, json['energyLevel']),
      skinHair: <SkinHairSymptom>{
        for (final raw in (json['skinHair'] as List<dynamic>? ?? const []))
          ...[_byName(SkinHairSymptom.values, raw)].whereType<SkinHairSymptom>(),
      },
      note: json['note'] as String?,
      sexualActivity: json['sexualActivity'] as bool?,
      sexLife: <SexLifeEntry>{
        for (final raw in (json['sexLife'] as List<dynamic>? ?? const []))
          ...[_byName(SexLifeEntry.values, raw)].whereType<SexLifeEntry>(),
      },
      basalTempC: (json['basalTempC'] as num?)?.toDouble(),
      mucus: _byName(CervicalMucus.values, json['mucus']),
      ovulationTest:
          _byName(OvulationTestResult.values, json['ovulationTest']),
      pregnancyTest:
          _byName(PregnancyTestResult.values, json['pregnancyTest']),
      breastExam: <BreastExamFinding>{
        for (final raw in (json['breastExam'] as List<dynamic>? ?? const []))
          ...[_byName(BreastExamFinding.values, raw)]
              .whereType<BreastExamFinding>(),
      },
      cervixPosition: _byName(CervixPosition.values, json['cervixPosition']),
      cervixOpening: _byName(CervixOpening.values, json['cervixOpening']),
      cervixFirmness: _byName(CervixFirmness.values, json['cervixFirmness']),
      birthControl: <BirthControlEntry>{
        for (final raw in (json['birthControl'] as List<dynamic>? ?? const []))
          ...[_byName(BirthControlEntry.values, raw)]
              .whereType<BirthControlEntry>(),
      },
      waterIntakeMl: (json['waterIntakeMl'] as num?)?.toInt(),
      sleepMinutes: (json['sleepMinutes'] as num?)?.toInt(),
      weightKg: (json['weightKg'] as num?)?.toDouble(),
      medications: [
        for (final raw in (json['medications'] as List<dynamic>? ?? const []))
          if (raw is String) raw,
      ],
      customTags: <String>{
        for (final raw in (json['customTags'] as List<dynamic>? ?? const []))
          if (raw is String && raw.trim().isNotEmpty) raw,
      },
    );
  }

  static T? _byName<T extends Enum>(List<T> values, Object? raw) {
    if (raw is! String) return null;
    for (final v in values) {
      if (v.name == raw) return v;
    }
    return null;
  }
}
