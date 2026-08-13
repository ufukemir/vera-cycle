// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Cycle';

  @override
  String get actionSkip => 'Skip';

  @override
  String get actionContinue => 'Continue';

  @override
  String get actionDone => 'Done';

  @override
  String get actionCancel => 'Cancel';

  @override
  String get actionDelete => 'Delete';

  @override
  String get actionEnable => 'Enable';

  @override
  String get commonIDontKnow => 'I don\'t know';

  @override
  String get pinSetupTitle => 'Set up a PIN';

  @override
  String get pinSetupEnterPrompt => 'Choose a 6-digit PIN to lock the app';

  @override
  String get pinSetupConfirmPrompt => 'Enter it again to confirm';

  @override
  String get pinSetupMismatch => 'Those didn\'t match — let\'s try again';

  @override
  String get pinSetupBiometricTitle => 'Faster unlock?';

  @override
  String get pinSetupBiometricBody =>
      'You can also use your fingerprint or face to unlock — your PIN still works as a backup.';

  @override
  String get lockScreenTitle => 'Locked';

  @override
  String get lockScreenEnterPin => 'Enter your PIN';

  @override
  String get lockScreenWrongPin => 'That PIN doesn\'t match';

  @override
  String get lockScreenUseBiometrics => 'Use biometrics';

  @override
  String get lockScreenForgotPin => 'Forgot your PIN?';

  @override
  String lockScreenThrottled(int seconds) {
    return 'Too many attempts. Try again in ${seconds}s';
  }

  @override
  String get lockScreenEraseTitle => 'Erase all data?';

  @override
  String get lockScreenEraseBody =>
      'This permanently deletes everything on this device. There\'s no account and no server backup, so this can\'t be undone.';

  @override
  String get lockScreenEraseConfirm => 'Erase everything';

  @override
  String get onboardingPrivacyTitle => 'Welcome';

  @override
  String get onboardingPrivacyBody =>
      'Your data stays only on this device. There\'s no account, no cloud, nothing sent anywhere — the app doesn\'t even have permission to use the internet, and you can check that yourself in your phone\'s settings.';

  @override
  String get onboardingLastPeriodTitle => 'When did your last period start?';

  @override
  String get onboardingLastPeriodBody =>
      'This helps us get started — you can always correct it later from the calendar.';

  @override
  String get onboardingPickDate => 'Choose a date';

  @override
  String get onboardingCycleLengthTitle => 'How long is your cycle, typically?';

  @override
  String get onboardingCycleLengthBody =>
      'A rough number is fine. We\'ll start giving you a real estimate once we\'ve seen a couple of full cycles.';

  @override
  String get onboardingPeriodLengthTitle =>
      'How many days does your period usually last?';

  @override
  String get onboardingPeriodLengthBody =>
      'We\'ll use this to fill in your last period so you\'re not starting from zero.';

  @override
  String get onboardingDaysUnit => 'days';

  @override
  String get navHome => 'Home';

  @override
  String get navCalendar => 'Calendar';

  @override
  String get navInsights => 'Insights';

  @override
  String get navSettings => 'Settings';

  @override
  String homeCycleDayLabel(int day) {
    return 'Day $day';
  }

  @override
  String get homeNoCycleYet => 'No period logged yet';

  @override
  String get homePhaseMenstrual => 'Period';

  @override
  String get homePhaseFollicular => 'Follicular phase';

  @override
  String get homePhaseFertileWindow => 'Estimated fertile window';

  @override
  String get homePhaseLuteal => 'Luteal phase';

  @override
  String get homePhaseUnknown => 'Not enough recent data';

  @override
  String get homePredictionInsufficientTitle => 'Not enough data yet';

  @override
  String get homePredictionInsufficientBody =>
      'Log your next period and we\'ll start estimating.';

  @override
  String homePredictionRangeLabel(String start, String end) {
    return '$start – $end';
  }

  @override
  String get homeConfidenceHigh => 'High confidence';

  @override
  String get homeConfidenceMedium => 'Medium confidence';

  @override
  String get homeConfidenceLow => 'Low confidence';

  @override
  String get homeIrregularNote =>
      'Your cycle length has varied more than usual lately. If that\'s new for you, it may be worth mentioning at a checkup.';

  @override
  String get homeFertileWindowDisclaimer =>
      'Based on typical cycle timing — not a method of contraception.';

  @override
  String get homePeriodStartedButton => 'Period started today';

  @override
  String get homePeriodStartedSnackbar => 'Logged — period started today';

  @override
  String get actionUndo => 'Undo';

  @override
  String get comingSoon => 'Coming soon';

  @override
  String get dayLogFlowLabel => 'Flow';

  @override
  String get flowSpotting => 'Spotting';

  @override
  String get flowLight => 'Light';

  @override
  String get flowMedium => 'Medium';

  @override
  String get flowHeavy => 'Heavy';

  @override
  String get flowNone => 'None';

  @override
  String get dayLogSymptomsLabel => 'Symptoms';

  @override
  String get symptomCramps => 'Cramps';

  @override
  String get symptomHeadache => 'Headache';

  @override
  String get symptomBloating => 'Bloating';

  @override
  String get symptomBreastTenderness => 'Breast tenderness';

  @override
  String get symptomAcne => 'Acne';

  @override
  String get symptomFatigue => 'Fatigue';

  @override
  String get symptomNausea => 'Nausea';

  @override
  String get symptomBackPain => 'Back pain';

  @override
  String get symptomAppetiteChange => 'Appetite change';

  @override
  String get symptomSleepTrouble => 'Sleep trouble';

  @override
  String get dayLogMoodLabel => 'Mood';

  @override
  String get moodCalm => 'Calm';

  @override
  String get moodAnxious => 'Anxious';

  @override
  String get moodIrritable => 'Irritable';

  @override
  String get moodLow => 'Low';

  @override
  String get moodEnergetic => 'Energetic';

  @override
  String get dayLogNoteLabel => 'Note';

  @override
  String get dayLogNoteHint => 'Anything you want to remember about today';

  @override
  String get dayLogOptionalTrackersLabel => 'Optional trackers';

  @override
  String get dayLogSexualActivityLabel => 'Sexual activity';

  @override
  String get dayLogBbtLabel => 'Basal body temperature';

  @override
  String get dayLogMucusLabel => 'Cervical mucus';

  @override
  String get mucusDry => 'Dry';

  @override
  String get mucusSticky => 'Sticky';

  @override
  String get mucusCreamy => 'Creamy';

  @override
  String get mucusWatery => 'Watery';

  @override
  String get mucusEggWhite => 'Egg white';

  @override
  String get dayLogSavedIndicator => 'Saved';

  @override
  String get homeOpenTodayLog => 'Add details for today';

  @override
  String get calendarLegendActual => 'Logged period';

  @override
  String get calendarLegendPredicted => 'Predicted window';

  @override
  String get calendarLegendFertile => 'Estimated fertile window';

  @override
  String get insightsCyclesLoggedLabel => 'Cycles logged';

  @override
  String get insightsAveragePeriodLengthLabel => 'Average period length';

  @override
  String get insightsAverageCycleLengthLabel => 'Average cycle length';

  @override
  String insightsVariabilityLabel(String days) {
    return 'Varies by about $days days';
  }

  @override
  String get insightsNotEnoughDataTitle => 'Not enough data yet';

  @override
  String get insightsNotEnoughDataBody =>
      'Log a couple of full cycles and your averages will show up here.';

  @override
  String get insightsSymptomFrequencyTitle => 'Symptoms by cycle day';

  @override
  String get insightsNoSymptomsLogged => 'No symptoms logged yet';

  @override
  String get settingsLanguageLabel => 'Language';

  @override
  String get settingsLanguageEnglish => 'English';

  @override
  String get settingsLanguageTurkish => 'Türkçe';

  @override
  String get settingsWeekStartLabel => 'Week starts on';

  @override
  String get settingsWeekStartMonday => 'Monday';

  @override
  String get settingsWeekStartSunday => 'Sunday';

  @override
  String get settingsTemperatureUnitLabel => 'Temperature unit';

  @override
  String get settingsTemperatureCelsius => 'Celsius';

  @override
  String get settingsTemperatureFahrenheit => 'Fahrenheit';

  @override
  String get settingsRemindersLabel => 'Remind me before my period';

  @override
  String get settingsOptionalTrackersHeading => 'Optional trackers';

  @override
  String get settingsOptionalTrackersBody =>
      'Off by default. Turning one on adds it to the day-log screen.';

  @override
  String get settingsSexualActivityToggle => 'Sexual activity';

  @override
  String get settingsBbtToggle => 'Basal body temperature';

  @override
  String get settingsMucusToggle => 'Cervical mucus';

  @override
  String get settingsPrivacyEntry => 'Privacy';

  @override
  String get settingsDeleteAllData => 'Delete all data';

  @override
  String get privacyScreenTitle => 'Privacy';

  @override
  String get privacyScreenIntro =>
      'Here\'s exactly what happens to your data, in plain language.';

  @override
  String get privacyScreenStorage =>
      'Everything you log is encrypted and stored only on this device, in a single file. The encryption key lives in your phone\'s secure hardware — Keychain on iOS, Keystore on Android — not in the file itself.';

  @override
  String get privacyScreenNoNetwork =>
      'This app has no server. It doesn\'t have permission to use the internet at all — you can check that yourself in your phone\'s app settings.';

  @override
  String get privacyScreenNoThirdParty =>
      'There\'s no analytics, no crash reporting, no ads, and no third-party SDK of any kind.';

  @override
  String get privacyScreenExport =>
      'The only way your data ever leaves this device is if you export it yourself, and that export is encrypted with a password only you know.';

  @override
  String get privacyScreenDelete =>
      'Deleting your data is real and immediate. There\'s no account and no backup on our end — once it\'s gone, it\'s gone.';

  @override
  String get reminderNotificationTitle => 'Your period may be starting soon';

  @override
  String get reminderNotificationBody =>
      'Based on your logged cycles, your estimated window is coming up.';

  @override
  String get settingsExportEntry => 'Export & backup';

  @override
  String get exportBackupHeading => 'Encrypted backup';

  @override
  String get exportBackupBody =>
      'Save an encrypted copy of your history to move to a new device. You\'ll need the password again to restore it — there\'s no way to recover it otherwise.';

  @override
  String get exportCreateBackupButton => 'Create backup';

  @override
  String get exportRestoreBackupButton => 'Restore from backup';

  @override
  String get exportPasswordLabel => 'Password';

  @override
  String get exportPasswordConfirmLabel => 'Confirm password';

  @override
  String get exportPasswordMismatch => 'Passwords don\'t match';

  @override
  String get exportPasswordTooShort => 'Use at least 8 characters';

  @override
  String get exportRestoreConfirmTitle => 'Replace all data on this device?';

  @override
  String get exportRestoreConfirmBody =>
      'Restoring a backup replaces everything currently logged on this device. This can\'t be undone.';

  @override
  String get exportRestoreConfirmAction => 'Restore';

  @override
  String get exportWrongPassword => 'That password doesn\'t match this backup';

  @override
  String get exportInvalidFile => 'That file doesn\'t look like a Cycle backup';

  @override
  String get exportBackupCreated => 'Backup ready to share';

  @override
  String get exportRestoreSuccess => 'Backup restored';

  @override
  String get exportDoctorReportHeading => 'Doctor report';

  @override
  String get exportDoctorReportBody =>
      'A summary you can share with a clinician.';

  @override
  String get exportIncludeNotesToggle => 'Include personal notes';

  @override
  String get exportShareCsvButton => 'Share as CSV';

  @override
  String get exportPrintPdfButton => 'Print / Save as PDF';

  @override
  String get doctorReportDisclaimer =>
      'Generated by Cycle from user-entered data. Not a medical diagnosis.';

  @override
  String get doctorReportGeneratedOn => 'Generated on';

  @override
  String get doctorReportSummaryHeading => 'Summary';

  @override
  String get doctorReportDailyLogHeading => 'Daily log';

  @override
  String get doctorReportColumnDate => 'Date';
}
