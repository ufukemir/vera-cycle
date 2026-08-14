import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

  static const _kOnboardingComplete = 'onboarding_complete';
  static const _kLocale = 'locale';
  static const _kWeekStartMonday = 'week_start_monday';
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
  Locale? get locale {
    final code = _prefs.getString(_kLocale);
    return code == null ? null : Locale(code);
  }

  Future<void> setLocale(Locale? value) async {
    if (value == null) {
      await _prefs.remove(_kLocale);
    } else {
      await _prefs.setString(_kLocale, value.languageCode);
    }
    notifyListeners();
  }

  /// `true` = weeks start Monday, `false` = Sunday.
  bool get weekStartsMonday => _prefs.getBool(_kWeekStartMonday) ?? true;

  Future<void> setWeekStartsMonday(bool value) async {
    await _prefs.setBool(_kWeekStartMonday, value);
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

  /// Which companion mascot decorates the home screen. See [Mascot].
  Mascot get mascot {
    final raw = _prefs.getString(_kMascot);
    return Mascot.values.firstWhere(
      (m) => m.name == raw,
      orElse: () => Mascot.droplet,
    );
  }

  /// Scenic photo behind the home hero. See [HomeTheme].
  HomeTheme get homeTheme {
    final raw = _prefs.getString(_kHomeTheme);
    return HomeTheme.values.firstWhere(
      (t) => t.name == raw,
      orElse: () => HomeTheme.wheat,
    );
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
