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
    this.note,
    this.sexualActivity,
    this.basalTempC,
    this.mucus,
  })  : date = dateOnly(date),
        symptoms = Set.unmodifiable(symptoms ?? const <Symptom>{});

  final DateTime date;

  /// `null` means "no bleeding recorded", which is distinct from an explicit
  /// zero — the user simply did not report bleeding that day.
  final FlowIntensity? flow;

  final Set<Symptom> symptoms;
  final Mood? mood;
  final String? note;

  /// Optional trackers. All default to disabled in settings; a `null` here means
  /// the user never entered a value, not that the answer was "no".
  final bool? sexualActivity;
  final double? basalTempC;
  final CervicalMucus? mucus;

  /// `true` when this day carries no information, so the store can drop it
  /// instead of persisting empty rows the user did not create.
  bool get isEmpty =>
      flow == null &&
      symptoms.isEmpty &&
      mood == null &&
      (note == null || note!.trim().isEmpty) &&
      sexualActivity == null &&
      basalTempC == null &&
      mucus == null;

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
    String? note,
    bool clearNote = false,
    bool? sexualActivity,
    bool clearSexualActivity = false,
    double? basalTempC,
    bool clearBasalTemp = false,
    CervicalMucus? mucus,
    bool clearMucus = false,
  }) {
    return DayLog(
      date: date,
      flow: clearFlow ? null : (flow ?? this.flow),
      symptoms: symptoms ?? this.symptoms,
      mood: clearMood ? null : (mood ?? this.mood),
      note: clearNote ? null : (note ?? this.note),
      sexualActivity: clearSexualActivity
          ? null
          : (sexualActivity ?? this.sexualActivity),
      basalTempC: clearBasalTemp ? null : (basalTempC ?? this.basalTempC),
      mucus: clearMucus ? null : (mucus ?? this.mucus),
    );
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'date': dayKey(date),
        if (flow != null) 'flow': flow!.name,
        if (symptoms.isNotEmpty)
          'symptoms': symptoms.map((s) => s.name).toList()..sort(),
        if (mood != null) 'mood': mood!.name,
        if (note != null && note!.isNotEmpty) 'note': note,
        if (sexualActivity != null) 'sexualActivity': sexualActivity,
        if (basalTempC != null) 'basalTempC': basalTempC,
        if (mucus != null) 'mucus': mucus!.name,
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
      note: json['note'] as String?,
      sexualActivity: json['sexualActivity'] as bool?,
      basalTempC: (json['basalTempC'] as num?)?.toDouble(),
      mucus: _byName(CervicalMucus.values, json['mucus']),
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
