import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

  bool get onboardingComplete => _prefs.getBool(_kOnboardingComplete) ?? false;

  Future<void> setOnboardingComplete(bool value) async {
    await _prefs.setBool(_kOnboardingComplete, value);
    notifyListeners();
  }

  Locale get locale => Locale(_prefs.getString(_kLocale) ?? 'en');

  Future<void> setLocale(Locale value) async {
    await _prefs.setString(_kLocale, value.languageCode);
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
}
