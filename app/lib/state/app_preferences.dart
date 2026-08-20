import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/custom_reminder.dart';
import '../models/enums.dart';

/// Temperature unit for basal body temperature entries.
enum TemperatureUnit { celsius, fahrenheit }

/// Non-sensitive app settings and UI flags.
///
/// Backed by `shared_preferences`, which is fine here specifically because
/// nothing in this class is cycle data — only flags like "has onboarding run"
/// or "which language". Actual health data must never be routed through this
/// class; it belongs behind [DayLogRepository] instead, encrypted.
class AppPreferences extends ChangeNotifier {
  AppPreferences(this._prefs);

  final SharedPreferences _prefs;

  static Future<AppPreferences> load() async =>
      AppPreferences(await SharedPreferences.getInstance());

  static const _kCustomReminders = 'custom_reminders';
  static const _kCustomReminderNextId = 'custom_reminder_next_id';
  static const _kOnboardingComplete = 'onboarding_complete';
  static const _kLocale = 'locale';
  static const _kWeekStartMonday = 'week_start_monday';
  static const _kWeekStartWeekday = 'week_start_weekday';
  static const _kTemperatureUnit = 'temperature_unit';
  static const _kRemindersEnabled = 'reminders_enabled';
  static const _kReminderMinuteOfDay = 'reminder_minute_of_day';
  static const _kBiometricUnlockEnabled = 'biometric_unlock_enabled';
  static const _kSexualActivityTracking = 'track_sexual_activity';
  static const _kBbtTracking = 'track_bbt';
  static const _kMucusTracking = 'track_mucus';
  static const _kBreastExamTracking = 'track_breast_exam';
  static const _kCervixTracking = 'track_cervix';
  static const _kEstimatedCycleLengthDays = 'estimated_cycle_length_days';
  static const _kEstimatedPeriodLengthDays = 'estimated_period_length_days';
  static const _kLutealPhaseDays = 'luteal_phase_days';
  static const _kGoal = 'goal';
  static const _kPeriodEndRemindersEnabled = 'period_end_reminders_enabled';
  static const _kPeriodEndReminderMinuteOfDay = 'period_end_reminder_minute_of_day';
  static const _kMedicationRemindersEnabled = 'medication_reminders_enabled';
  static const _kMedicationReminderMinuteOfDay = 'medication_reminder_minute_of_day';
  static const _kWaterRemindersEnabled = 'water_reminders_enabled';
  static const _kWaterReminderMinuteOfDay = 'water_reminder_minute_of_day';
  static const _kAppointmentReminderAt = 'appointment_reminder_at';
  static const _kThemeMode = 'theme_mode';
  static const _kOvulationTestTracking = 'track_ovulation_test';
  static const _kOvulationRemindersEnabled = 'ovulation_reminders_enabled';
  static const _kMascot = 'mascot';
  static const _kHomeTheme = 'home_theme';
  static const _kHealthSyncEnabled = 'health_sync_enabled';
  static const _kLastDailyPrompt = 'last_daily_prompt_day';
  static const _kLastBackupAt = 'last_backup_at';
  static const _kBackupRemindersEnabled = 'backup_reminders_enabled';
  static const _kPremiumActive = 'premium_active';
  static const _kPregnancyMode = 'pregnancy_mode';
  static const _kPregnancyLmp = 'pregnancy_lmp';

  bool get onboardingComplete => _prefs.getBool(_kOnboardingComplete) ?? false;

  Future<void> setOnboardingComplete(bool value) async {
    await _prefs.setBool(_kOnboardingComplete, value);
    notifyListeners();
  }

  /// `null` means "follow the system language" — the default. Only set once
  /// the user explicitly picks a language in Settings; `MaterialApp` resolves
  /// `null` against the device's own locale list automatically.
  ///
  /// Stored as a BCP-47-style tag rather than a bare language code. Only the
  /// language code used to be kept, which silently discarded script and
  /// region — so `zh-Hans` vs `zh-Hant` and `pt-BR` vs `pt-PT` could not be
  /// represented at all. Those are exactly the distinctions the parked
  /// Chinese and Portuguese translations will need, and migrating a stored
  /// preference key after the fact is uglier than widening it now.
  ///
  /// Old values are bare language codes, which [_parseLocale] reads
  /// unchanged — no migration step is needed.
  Locale? get locale {
    final tag = _prefs.getString(_kLocale);
    return tag == null ? null : _parseLocale(tag);
  }

  Future<void> setLocale(Locale? value) async {
    if (value == null) {
      await _prefs.remove(_kLocale);
    } else {
      await _prefs.setString(_kLocale, _localeTag(value));
    }
    notifyListeners();
  }

  /// `en`, `zh-Hans`, `pt-BR`, `zh-Hant-TW`.
  @visibleForTesting
  static String localeTag(Locale value) => _localeTag(value);

  static String _localeTag(Locale value) => [
        value.languageCode,
        if (value.scriptCode != null) value.scriptCode,
        if (value.countryCode != null && value.countryCode!.isNotEmpty)
          value.countryCode,
      ].join('-');

  @visibleForTesting
  static Locale parseLocale(String tag) => _parseLocale(tag);

  /// Inverse of [_localeTag].
  ///
  /// Subtags are identified by shape rather than position, which is how
  /// BCP-47 itself does it: a 4-letter subtag is a script, a 2-letter or
  /// 3-digit one is a region. That keeps `zh-Hans` and `zh-TW` apart
  /// without needing to know which is present.
  static Locale _parseLocale(String tag) {
    final parts = tag.split(RegExp(r'[-_]'));
    final language = parts.first;
    String? script;
    String? country;

    for (final part in parts.skip(1)) {
      if (part.length == 4 && RegExp(r'^[A-Za-z]{4}$').hasMatch(part)) {
        script = part[0].toUpperCase() + part.substring(1).toLowerCase();
      } else if (RegExp(r'^([A-Za-z]{2}|\d{3})$').hasMatch(part)) {
        country = part.toUpperCase();
      }
      // Anything else (variants, extensions) is deliberately dropped:
      // Flutter's Locale cannot represent it, and silently keeping a tag
      // we cannot resolve would be worse than losing it.
    }

    return Locale.fromSubtags(
      languageCode: language.toLowerCase(),
      scriptCode: script,
      countryCode: country,
    );
  }

  /// First day of the week as a [DateTime] weekday constant
  /// (1 = Monday … 7 = Sunday), or `null` to follow the device locale.
  ///
  /// This was a bool — Monday or Sunday — defaulting to Monday for
  /// everyone. Two problems. Monday is wrong for a large share of the
  /// app's languages (en-US, ja, ko, pt-BR and hi all start on Sunday),
  /// and a two-valued setting cannot express Saturday at all, which is the
  /// convention in ar, fa and ur. An Arabic user could not select their own
  /// week start.
  ///
  /// `null` resolves through [MaterialLocalizations.firstDayOfWeekIndex],
  /// so the default is right everywhere without the user touching it.
  int? get weekStartWeekday {
    final stored = _prefs.getInt(_kWeekStartWeekday);
    if (stored != null) return stored;
    // Migration: the old boolean key. Read once, translated, and left in
    // place — rewriting it here would mean a write on every read.
    if (_prefs.containsKey(_kWeekStartMonday)) {
      return (_prefs.getBool(_kWeekStartMonday) ?? true)
          ? DateTime.monday
          : DateTime.sunday;
    }
    return null;
  }

  Future<void> setWeekStartWeekday(int? value) async {
    if (value == null) {
      await _prefs.remove(_kWeekStartWeekday);
      await _prefs.remove(_kWeekStartMonday);
    } else {
      await _prefs.setInt(_kWeekStartWeekday, value);
      // Drop the superseded key so the two can never disagree.
      await _prefs.remove(_kWeekStartMonday);
    }
    notifyListeners();
  }

  TemperatureUnit get temperatureUnit {
    final raw = _prefs.getString(_kTemperatureUnit);
    return raw == 'fahrenheit'
        ? TemperatureUnit.fahrenheit
        : TemperatureUnit.celsius;
  }

  Future<void> setTemperatureUnit(TemperatureUnit value) async {
    await _prefs.setString(_kTemperatureUnit, value.name);
    notifyListeners();
  }

  /// Whether the lock screen should offer a biometric prompt. The PIN always
  /// works regardless of this flag — biometrics are a shortcut, never the
  /// only path in, since there's no server-side account recovery.
  bool get biometricUnlockEnabled =>
      _prefs.getBool(_kBiometricUnlockEnabled) ?? false;

  Future<void> setBiometricUnlockEnabled(bool value) async {
    await _prefs.setBool(_kBiometricUnlockEnabled, value);
    notifyListeners();
  }

  /// Default OFF, per CLAUDE.md: local reminders must never be presumed wanted.
  bool get remindersEnabled => _prefs.getBool(_kRemindersEnabled) ?? false;

  Future<void> setRemindersEnabled(bool value) async {
    await _prefs.setBool(_kRemindersEnabled, value);
    notifyListeners();
  }

  /// Local time of day the reminder fires at, stored as minutes since
  /// midnight. Defaults to 09:00 — only meaningful once [remindersEnabled].
  TimeOfDay get reminderTime {
    final minutes = _prefs.getInt(_kReminderMinuteOfDay) ?? (9 * 60);
    return TimeOfDay(hour: minutes ~/ 60, minute: minutes % 60);
  }

  Future<void> setReminderTime(TimeOfDay value) async {
    await _prefs.setInt(_kReminderMinuteOfDay, value.hour * 60 + value.minute);
    notifyListeners();
  }

  /// Default OFF. Also gates whether the field renders in the day-log UI at
  /// all, not just its default value — see docs/01-mvp-spec.md.
  bool get sexualActivityTrackingEnabled =>
      _prefs.getBool(_kSexualActivityTracking) ?? false;

  Future<void> setSexualActivityTrackingEnabled(bool value) async {
    await _prefs.setBool(_kSexualActivityTracking, value);
    notifyListeners();
  }

  bool get bbtTrackingEnabled => _prefs.getBool(_kBbtTracking) ?? false;

  Future<void> setBbtTrackingEnabled(bool value) async {
    await _prefs.setBool(_kBbtTracking, value);
    notifyListeners();
  }

  bool get mucusTrackingEnabled => _prefs.getBool(_kMucusTracking) ?? false;

  Future<void> setMucusTrackingEnabled(bool value) async {
    await _prefs.setBool(_kMucusTracking, value);
    notifyListeners();
  }

  bool get breastExamTrackingEnabled =>
      _prefs.getBool(_kBreastExamTracking) ?? false;

  Future<void> setBreastExamTrackingEnabled(bool value) async {
    await _prefs.setBool(_kBreastExamTracking, value);
    notifyListeners();
  }

  bool get cervixTrackingEnabled => _prefs.getBool(_kCervixTracking) ?? false;

  bool get ovulationTestTrackingEnabled =>
      _prefs.getBool(_kOvulationTestTracking) ?? false;

  Future<void> setOvulationTestTrackingEnabled(bool value) async {
    await _prefs.setBool(_kOvulationTestTracking, value);
    notifyListeners();
  }

  /// Default OFF like every reminder. Fires once, at the estimated fertile
  /// window's start, at [reminderTime].
  bool get ovulationRemindersEnabled =>
      _prefs.getBool(_kOvulationRemindersEnabled) ?? false;

  Future<void> setOvulationRemindersEnabled(bool value) async {
    await _prefs.setBool(_kOvulationRemindersEnabled, value);
    notifyListeners();
  }

  Future<void> setCervixTrackingEnabled(bool value) async {
    await _prefs.setBool(_kCervixTracking, value);
    notifyListeners();
  }

  /// A user-declared "roughly how long" estimate. Purely decorative (see
  /// [CycleRing]) and, for the luteal phase specifically, a real input to
  /// [PredictionEngine] — never a substitute for the statistical prediction
  /// itself, which always requires real logged cycles. See
  /// docs/03-rakip-analizi.md and the "Tahmin Ayarları" screen doc comment
  /// for the honesty reasoning behind this split.
  int get estimatedCycleLengthDays =>
      _prefs.getInt(_kEstimatedCycleLengthDays) ?? 28;

  Future<void> setEstimatedCycleLengthDays(int value) async {
    await _prefs.setInt(_kEstimatedCycleLengthDays, value);
    notifyListeners();
  }

  int get estimatedPeriodLengthDays =>
      _prefs.getInt(_kEstimatedPeriodLengthDays) ?? 5;

  Future<void> setEstimatedPeriodLengthDays(int value) async {
    await _prefs.setInt(_kEstimatedPeriodLengthDays, value);
    notifyListeners();
  }

  /// Real input to [PredictionEngine] — see [PredictionSettingsScreen].
  int get lutealPhaseDays => _prefs.getInt(_kLutealPhaseDays) ?? 14;

  Future<void> setLutealPhaseDays(int value) async {
    await _prefs.setInt(_kLutealPhaseDays, value);
    notifyListeners();
  }

  /// Set once during onboarding — see [Goal].
  Goal get goal {
    final raw = _prefs.getString(_kGoal);
    return Goal.values.firstWhere(
      (g) => g.name == raw,
      orElse: () => Goal.trackPeriod,
    );
  }

  Future<void> setGoal(Goal value) async {
    await _prefs.setString(_kGoal, value.name);
    notifyListeners();
  }

  /// Default OFF, per CLAUDE.md: local reminders must never be presumed
  /// wanted. Independent from [remindersEnabled] (the period-start
  /// reminder) — each reminder category has its own toggle and time so
  /// disabling one never disturbs the others.
  bool get periodEndRemindersEnabled =>
      _prefs.getBool(_kPeriodEndRemindersEnabled) ?? false;

  Future<void> setPeriodEndRemindersEnabled(bool value) async {
    await _prefs.setBool(_kPeriodEndRemindersEnabled, value);
    notifyListeners();
  }

  TimeOfDay get periodEndReminderTime {
    final minutes = _prefs.getInt(_kPeriodEndReminderMinuteOfDay) ?? (9 * 60);
    return TimeOfDay(hour: minutes ~/ 60, minute: minutes % 60);
  }

  Future<void> setPeriodEndReminderTime(TimeOfDay value) async {
    await _prefs.setInt(
        _kPeriodEndReminderMinuteOfDay, value.hour * 60 + value.minute);
    notifyListeners();
  }

  bool get medicationRemindersEnabled =>
      _prefs.getBool(_kMedicationRemindersEnabled) ?? false;

  Future<void> setMedicationRemindersEnabled(bool value) async {
    await _prefs.setBool(_kMedicationRemindersEnabled, value);
    notifyListeners();
  }

  TimeOfDay get medicationReminderTime {
    final minutes = _prefs.getInt(_kMedicationReminderMinuteOfDay) ?? (9 * 60);
    return TimeOfDay(hour: minutes ~/ 60, minute: minutes % 60);
  }

  Future<void> setMedicationReminderTime(TimeOfDay value) async {
    await _prefs.setInt(
        _kMedicationReminderMinuteOfDay, value.hour * 60 + value.minute);
    notifyListeners();
  }

  /// Premium: reminders the user wrote themselves.
  ///
  /// These live here, unencrypted, unlike cycle data — because the label is
  /// about to be handed to the OS scheduler and shown on the lock screen
  /// anyway. Encrypting our copy would protect nothing the notification
  /// itself does not already reveal, so the honest move is to say so in the
  /// UI rather than to imply a secrecy that cannot hold.
  List<CustomReminder> get customReminders {
    final raw = _prefs.getStringList(_kCustomReminders) ?? const [];
    return [for (final entry in raw) ?_decodeReminder(entry)];
  }

  static CustomReminder? _decodeReminder(String entry) {
    try {
      final decoded = jsonDecode(entry);
      if (decoded is! Map<String, dynamic>) return null;
      return CustomReminder.fromJson(decoded);
    } on FormatException {
      return null;
    }
  }

  Future<CustomReminder> addCustomReminder({
    required String label,
    required TimeOfDay time,
  }) async {
    final id = _prefs.getInt(_kCustomReminderNextId) ?? 1;
    final reminder = CustomReminder(
      id: id,
      label: label.trim(),
      minuteOfDay: time.hour * 60 + time.minute,
    );
    await _prefs.setInt(_kCustomReminderNextId, id + 1);
    await _writeCustomReminders([...customReminders, reminder]);
    return reminder;
  }

  Future<void> updateCustomReminder(CustomReminder reminder) =>
      _writeCustomReminders([
        for (final existing in customReminders)
          if (existing.id == reminder.id) reminder else existing,
      ]);

  Future<void> removeCustomReminder(int id) => _writeCustomReminders([
        for (final existing in customReminders)
          if (existing.id != id) existing,
      ]);

  /// Wipes every user-authored reminder, label and all.
  ///
  /// "Erase everything" cleared logs, the PIN and onboarding but left this
  /// key untouched, so free text the user had written about themselves
  /// ("take my pill") survived the erase in plaintext. Anything the user
  /// typed has to go when they ask for everything to go.
  Future<void> clearCustomReminders() async {
    await _prefs.remove(_kCustomReminders);
    await _prefs.remove(_kCustomReminderNextId);
    notifyListeners();
  }

  Future<void> _writeCustomReminders(List<CustomReminder> reminders) async {
    await _prefs.setStringList(
      _kCustomReminders,
      [for (final r in reminders) jsonEncode(r.toJson())],
    );
    notifyListeners();
  }

  bool get waterRemindersEnabled => _prefs.getBool(_kWaterRemindersEnabled) ?? false;

  Future<void> setWaterRemindersEnabled(bool value) async {
    await _prefs.setBool(_kWaterRemindersEnabled, value);
    notifyListeners();
  }

  TimeOfDay get waterReminderTime {
    final minutes = _prefs.getInt(_kWaterReminderMinuteOfDay) ?? (10 * 60);
    return TimeOfDay(hour: minutes ~/ 60, minute: minutes % 60);
  }

  Future<void> setWaterReminderTime(TimeOfDay value) async {
    await _prefs.setInt(_kWaterReminderMinuteOfDay, value.hour * 60 + value.minute);
    notifyListeners();
  }

  /// `null` means no appointment reminder is set — there's exactly one
  /// upcoming-appointment slot in v1, not an open-ended list, since a real
  /// appointments feature is out of scope (see docs/backlog.md).
  DateTime? get appointmentReminderAt {
    final millis = _prefs.getInt(_kAppointmentReminderAt);
    return millis == null ? null : DateTime.fromMillisecondsSinceEpoch(millis);
  }

  Future<void> setAppointmentReminderAt(DateTime? value) async {
    if (value == null) {
      await _prefs.remove(_kAppointmentReminderAt);
    } else {
      await _prefs.setInt(_kAppointmentReminderAt, value.millisecondsSinceEpoch);
    }
    notifyListeners();
  }

  /// Follows the system by default, like [locale].
  ThemeMode get themeMode {
    switch (_prefs.getString(_kThemeMode)) {
      case 'light':
        return ThemeMode.light;
      case 'dark':
        return ThemeMode.dark;
      default:
        return ThemeMode.system;
    }
  }

  Future<void> setThemeMode(ThemeMode value) async {
    if (value == ThemeMode.system) {
      await _prefs.remove(_kThemeMode);
    } else {
      await _prefs.setString(_kThemeMode, value.name);
    }
    notifyListeners();
  }

  /// The mascot as the user chose it. See [mascot] for what is rendered.
  Mascot get selectedMascot {
    final raw = _prefs.getString(_kMascot);
    return Mascot.values.firstWhere(
      (m) => m.name == raw,
      orElse: () => Mascot.droplet,
    );
  }

  /// Which companion mascot decorates the home screen, with the same
  /// lapse fallback as [homeTheme].
  Mascot get mascot {
    final selected = selectedMascot;
    if (selected.premium && !premiumActive) return Mascot.droplet;
    return selected;
  }

  /// Off by default: handing cycle data to the OS health record is the
  /// user's call, not ours.
  /// The day the "how does today feel?" sheet last opened by itself,
  /// as `yyyy-mm-dd`.
  ///
  /// Recorded when it *opens*, not when something is saved: dismissing it
  /// has to count, or the app would reopen the same sheet every time the
  /// user came back to Home, which is nagging rather than prompting.
  String? get lastDailyPromptDay => _prefs.getString(_kLastDailyPrompt);

  Future<void> setLastDailyPromptDay(String day) async {
    await _prefs.setString(_kLastDailyPrompt, day);
    notifyListeners();
  }

  bool get healthSyncEnabled => _prefs.getBool(_kHealthSyncEnabled) ?? false;

  Future<void> setHealthSyncEnabled(bool value) async {
    await _prefs.setBool(_kHealthSyncEnabled, value);
    notifyListeners();
  }

  /// When the user last created an encrypted backup, or `null` if never.
  /// Drives the home nudge — everything lives on this device, so a lost
  /// phone means lost history unless a copy exists.
  DateTime? get lastBackupAt {
    final millis = _prefs.getInt(_kLastBackupAt);
    return millis == null ? null : DateTime.fromMillisecondsSinceEpoch(millis);
  }

  Future<void> markBackedUpNow() async {
    await _prefs.setInt(_kLastBackupAt, DateTime.now().millisecondsSinceEpoch);
    notifyListeners();
  }

  /// Default ON — unlike every other reminder. Losing all your data is a
  /// different class of harm from missing a convenience notification, and
  /// the nudge is quiet and dismissible.
  bool get backupRemindersEnabled =>
      _prefs.getBool(_kBackupRemindersEnabled) ?? true;

  Future<void> setBackupRemindersEnabled(bool value) async {
    await _prefs.setBool(_kBackupRemindersEnabled, value);
    notifyListeners();
  }

  /// Scenic photo behind the home hero, as the user chose it — including a
  /// Premium one while the subscription is lapsed.
  ///
  /// Prefer [homeTheme] for display. This raw value exists so the settings
  /// picker can keep showing the user's actual choice, and so resubscribing
  /// restores it instead of silently forgetting it.
  HomeTheme get selectedHomeTheme {
    final raw = _prefs.getString(_kHomeTheme);
    return HomeTheme.values.firstWhere(
      (t) => t.name == raw,
      orElse: () => HomeTheme.wheat,
    );
  }

  /// The theme actually rendered: a Premium background falls back to a free
  /// one when the subscription is not active.
  ///
  /// CLAUDE.md principle 6 and `enums.dart` both promised this ("abonelik
  /// biterse kullanıcı ücretsiz bir arka plana düşer, hiçbir kaydını
  /// kaybetmez") and nothing implemented it. The choice is remembered, not
  /// erased — only its rendering is deferred until Premium is back.
  HomeTheme get homeTheme {
    final selected = selectedHomeTheme;
    if (selected.premium && !premiumActive) return HomeTheme.wheat;
    return selected;
  }

  Future<void> setHomeTheme(HomeTheme value) async {
    await _prefs.setString(_kHomeTheme, value.name);
    notifyListeners();
  }

  Future<void> setMascot(Mascot value) async {
    await _prefs.setString(_kMascot, value.name);
    notifyListeners();
  }

  /// Whether the ad-free Premium tier is active. Today this is only ever
  /// set locally (there is no billing integration yet); once real
  /// subscriptions ship it must be derived from the store receipt, not
  /// from this flag alone.
  bool get premiumActive => _prefs.getBool(_kPremiumActive) ?? false;

  Future<void> setPremiumActive(bool value) async {
    await _prefs.setBool(_kPremiumActive, value);
    notifyListeners();
  }

  /// Pregnancy mode swaps the home screen's prediction UI for gestational
  /// tracking. Off by default; turning it on requires an LMP date.
  bool get pregnancyMode => _prefs.getBool(_kPregnancyMode) ?? false;

  Future<void> setPregnancyMode(bool value) async {
    await _prefs.setBool(_kPregnancyMode, value);
    notifyListeners();
  }

  /// First day of the last menstrual period, the basis for gestational age.
  DateTime? get pregnancyLmp {
    final millis = _prefs.getInt(_kPregnancyLmp);
    return millis == null ? null : DateTime.fromMillisecondsSinceEpoch(millis);
  }

  Future<void> setPregnancyLmp(DateTime? value) async {
    if (value == null) {
      await _prefs.remove(_kPregnancyLmp);
    } else {
      await _prefs.setInt(_kPregnancyLmp, value.millisecondsSinceEpoch);
    }
    notifyListeners();
  }
}
