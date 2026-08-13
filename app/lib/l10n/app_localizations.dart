import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_tr.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('tr'),
  ];

  /// The application name, shown as the app title.
  ///
  /// In en, this message translates to:
  /// **'Cycle'**
  String get appTitle;

  /// No description provided for @actionSkip.
  ///
  /// In en, this message translates to:
  /// **'Skip'**
  String get actionSkip;

  /// No description provided for @actionContinue.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get actionContinue;

  /// No description provided for @actionDone.
  ///
  /// In en, this message translates to:
  /// **'Done'**
  String get actionDone;

  /// No description provided for @actionCancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get actionCancel;

  /// No description provided for @actionDelete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get actionDelete;

  /// No description provided for @actionEnable.
  ///
  /// In en, this message translates to:
  /// **'Enable'**
  String get actionEnable;

  /// No description provided for @commonIDontKnow.
  ///
  /// In en, this message translates to:
  /// **'I don\'t know'**
  String get commonIDontKnow;

  /// No description provided for @pinSetupTitle.
  ///
  /// In en, this message translates to:
  /// **'Set up a PIN'**
  String get pinSetupTitle;

  /// No description provided for @pinSetupEnterPrompt.
  ///
  /// In en, this message translates to:
  /// **'Choose a 6-digit PIN to lock the app'**
  String get pinSetupEnterPrompt;

  /// No description provided for @pinSetupConfirmPrompt.
  ///
  /// In en, this message translates to:
  /// **'Enter it again to confirm'**
  String get pinSetupConfirmPrompt;

  /// No description provided for @pinSetupMismatch.
  ///
  /// In en, this message translates to:
  /// **'Those didn\'t match — let\'s try again'**
  String get pinSetupMismatch;

  /// No description provided for @pinSetupBiometricTitle.
  ///
  /// In en, this message translates to:
  /// **'Faster unlock?'**
  String get pinSetupBiometricTitle;

  /// No description provided for @pinSetupBiometricBody.
  ///
  /// In en, this message translates to:
  /// **'You can also use your fingerprint or face to unlock — your PIN still works as a backup.'**
  String get pinSetupBiometricBody;

  /// No description provided for @lockScreenTitle.
  ///
  /// In en, this message translates to:
  /// **'Locked'**
  String get lockScreenTitle;

  /// No description provided for @lockScreenEnterPin.
  ///
  /// In en, this message translates to:
  /// **'Enter your PIN'**
  String get lockScreenEnterPin;

  /// No description provided for @lockScreenWrongPin.
  ///
  /// In en, this message translates to:
  /// **'That PIN doesn\'t match'**
  String get lockScreenWrongPin;

  /// No description provided for @lockScreenUseBiometrics.
  ///
  /// In en, this message translates to:
  /// **'Use biometrics'**
  String get lockScreenUseBiometrics;

  /// No description provided for @lockScreenForgotPin.
  ///
  /// In en, this message translates to:
  /// **'Forgot your PIN?'**
  String get lockScreenForgotPin;

  /// No description provided for @lockScreenThrottled.
  ///
  /// In en, this message translates to:
  /// **'Too many attempts. Try again in {seconds}s'**
  String lockScreenThrottled(int seconds);

  /// No description provided for @lockScreenEraseTitle.
  ///
  /// In en, this message translates to:
  /// **'Erase all data?'**
  String get lockScreenEraseTitle;

  /// No description provided for @lockScreenEraseBody.
  ///
  /// In en, this message translates to:
  /// **'This permanently deletes everything on this device. There\'s no account and no server backup, so this can\'t be undone.'**
  String get lockScreenEraseBody;

  /// No description provided for @lockScreenEraseConfirm.
  ///
  /// In en, this message translates to:
  /// **'Erase everything'**
  String get lockScreenEraseConfirm;

  /// No description provided for @onboardingPrivacyTitle.
  ///
  /// In en, this message translates to:
  /// **'Welcome'**
  String get onboardingPrivacyTitle;

  /// No description provided for @onboardingPrivacyBody.
  ///
  /// In en, this message translates to:
  /// **'Your data stays only on this device. There\'s no account, no cloud, nothing sent anywhere — the app doesn\'t even have permission to use the internet, and you can check that yourself in your phone\'s settings.'**
  String get onboardingPrivacyBody;

  /// No description provided for @onboardingLastPeriodTitle.
  ///
  /// In en, this message translates to:
  /// **'When did your last period start?'**
  String get onboardingLastPeriodTitle;

  /// No description provided for @onboardingLastPeriodBody.
  ///
  /// In en, this message translates to:
  /// **'This helps us get started — you can always correct it later from the calendar.'**
  String get onboardingLastPeriodBody;

  /// No description provided for @onboardingPickDate.
  ///
  /// In en, this message translates to:
  /// **'Choose a date'**
  String get onboardingPickDate;

  /// No description provided for @onboardingCycleLengthTitle.
  ///
  /// In en, this message translates to:
  /// **'How long is your cycle, typically?'**
  String get onboardingCycleLengthTitle;

  /// No description provided for @onboardingCycleLengthBody.
  ///
  /// In en, this message translates to:
  /// **'A rough number is fine. We\'ll start giving you a real estimate once we\'ve seen a couple of full cycles.'**
  String get onboardingCycleLengthBody;

  /// No description provided for @onboardingPeriodLengthTitle.
  ///
  /// In en, this message translates to:
  /// **'How many days does your period usually last?'**
  String get onboardingPeriodLengthTitle;

  /// No description provided for @onboardingPeriodLengthBody.
  ///
  /// In en, this message translates to:
  /// **'We\'ll use this to fill in your last period so you\'re not starting from zero.'**
  String get onboardingPeriodLengthBody;

  /// No description provided for @onboardingDaysUnit.
  ///
  /// In en, this message translates to:
  /// **'days'**
  String get onboardingDaysUnit;

  /// No description provided for @navHome.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get navHome;

  /// No description provided for @navCalendar.
  ///
  /// In en, this message translates to:
  /// **'Calendar'**
  String get navCalendar;

  /// No description provided for @navInsights.
  ///
  /// In en, this message translates to:
  /// **'Insights'**
  String get navInsights;

  /// No description provided for @navSettings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get navSettings;

  /// No description provided for @homeCycleDayLabel.
  ///
  /// In en, this message translates to:
  /// **'Day {day}'**
  String homeCycleDayLabel(int day);

  /// No description provided for @homeNoCycleYet.
  ///
  /// In en, this message translates to:
  /// **'No period logged yet'**
  String get homeNoCycleYet;

  /// No description provided for @homePhaseMenstrual.
  ///
  /// In en, this message translates to:
  /// **'Period'**
  String get homePhaseMenstrual;

  /// No description provided for @homePhaseFollicular.
  ///
  /// In en, this message translates to:
  /// **'Follicular phase'**
  String get homePhaseFollicular;

  /// No description provided for @homePhaseFertileWindow.
  ///
  /// In en, this message translates to:
  /// **'Estimated fertile window'**
  String get homePhaseFertileWindow;

  /// No description provided for @homePhaseLuteal.
  ///
  /// In en, this message translates to:
  /// **'Luteal phase'**
  String get homePhaseLuteal;

  /// No description provided for @homePhaseUnknown.
  ///
  /// In en, this message translates to:
  /// **'Not enough recent data'**
  String get homePhaseUnknown;

  /// No description provided for @homePredictionInsufficientTitle.
  ///
  /// In en, this message translates to:
  /// **'Not enough data yet'**
  String get homePredictionInsufficientTitle;

  /// No description provided for @homePredictionInsufficientBody.
  ///
  /// In en, this message translates to:
  /// **'Log your next period and we\'ll start estimating.'**
  String get homePredictionInsufficientBody;

  /// No description provided for @homePredictionRangeLabel.
  ///
  /// In en, this message translates to:
  /// **'{start} – {end}'**
  String homePredictionRangeLabel(String start, String end);

  /// No description provided for @homeConfidenceHigh.
  ///
  /// In en, this message translates to:
  /// **'High confidence'**
  String get homeConfidenceHigh;

  /// No description provided for @homeConfidenceMedium.
  ///
  /// In en, this message translates to:
  /// **'Medium confidence'**
  String get homeConfidenceMedium;

  /// No description provided for @homeConfidenceLow.
  ///
  /// In en, this message translates to:
  /// **'Low confidence'**
  String get homeConfidenceLow;

  /// No description provided for @homeIrregularNote.
  ///
  /// In en, this message translates to:
  /// **'Your cycle length has varied more than usual lately. If that\'s new for you, it may be worth mentioning at a checkup.'**
  String get homeIrregularNote;

  /// No description provided for @homeFertileWindowDisclaimer.
  ///
  /// In en, this message translates to:
  /// **'Based on typical cycle timing — not a method of contraception.'**
  String get homeFertileWindowDisclaimer;

  /// No description provided for @homePeriodStartedButton.
  ///
  /// In en, this message translates to:
  /// **'Period started today'**
  String get homePeriodStartedButton;

  /// No description provided for @homePeriodStartedSnackbar.
  ///
  /// In en, this message translates to:
  /// **'Logged — period started today'**
  String get homePeriodStartedSnackbar;

  /// No description provided for @actionUndo.
  ///
  /// In en, this message translates to:
  /// **'Undo'**
  String get actionUndo;

  /// No description provided for @comingSoon.
  ///
  /// In en, this message translates to:
  /// **'Coming soon'**
  String get comingSoon;

  /// No description provided for @dayLogFlowLabel.
  ///
  /// In en, this message translates to:
  /// **'Flow'**
  String get dayLogFlowLabel;

  /// No description provided for @flowSpotting.
  ///
  /// In en, this message translates to:
  /// **'Spotting'**
  String get flowSpotting;

  /// No description provided for @flowLight.
  ///
  /// In en, this message translates to:
  /// **'Light'**
  String get flowLight;

  /// No description provided for @flowMedium.
  ///
  /// In en, this message translates to:
  /// **'Medium'**
  String get flowMedium;

  /// No description provided for @flowHeavy.
  ///
  /// In en, this message translates to:
  /// **'Heavy'**
  String get flowHeavy;

  /// No description provided for @flowNone.
  ///
  /// In en, this message translates to:
  /// **'None'**
  String get flowNone;

  /// No description provided for @dayLogSymptomsLabel.
  ///
  /// In en, this message translates to:
  /// **'Symptoms'**
  String get dayLogSymptomsLabel;

  /// No description provided for @symptomCramps.
  ///
  /// In en, this message translates to:
  /// **'Cramps'**
  String get symptomCramps;

  /// No description provided for @symptomHeadache.
  ///
  /// In en, this message translates to:
  /// **'Headache'**
  String get symptomHeadache;

  /// No description provided for @symptomBloating.
  ///
  /// In en, this message translates to:
  /// **'Bloating'**
  String get symptomBloating;

  /// No description provided for @symptomBreastTenderness.
  ///
  /// In en, this message translates to:
  /// **'Breast tenderness'**
  String get symptomBreastTenderness;

  /// No description provided for @symptomAcne.
  ///
  /// In en, this message translates to:
  /// **'Acne'**
  String get symptomAcne;

  /// No description provided for @symptomFatigue.
  ///
  /// In en, this message translates to:
  /// **'Fatigue'**
  String get symptomFatigue;

  /// No description provided for @symptomNausea.
  ///
  /// In en, this message translates to:
  /// **'Nausea'**
  String get symptomNausea;

  /// No description provided for @symptomBackPain.
  ///
  /// In en, this message translates to:
  /// **'Back pain'**
  String get symptomBackPain;

  /// No description provided for @symptomAppetiteChange.
  ///
  /// In en, this message translates to:
  /// **'Appetite change'**
  String get symptomAppetiteChange;

  /// No description provided for @symptomSleepTrouble.
  ///
  /// In en, this message translates to:
  /// **'Sleep trouble'**
  String get symptomSleepTrouble;

  /// No description provided for @dayLogMoodLabel.
  ///
  /// In en, this message translates to:
  /// **'Mood'**
  String get dayLogMoodLabel;

  /// No description provided for @moodCalm.
  ///
  /// In en, this message translates to:
  /// **'Calm'**
  String get moodCalm;

  /// No description provided for @moodAnxious.
  ///
  /// In en, this message translates to:
  /// **'Anxious'**
  String get moodAnxious;

  /// No description provided for @moodIrritable.
  ///
  /// In en, this message translates to:
  /// **'Irritable'**
  String get moodIrritable;

  /// No description provided for @moodLow.
  ///
  /// In en, this message translates to:
  /// **'Low'**
  String get moodLow;

  /// No description provided for @moodEnergetic.
  ///
  /// In en, this message translates to:
  /// **'Energetic'**
  String get moodEnergetic;

  /// No description provided for @dayLogNoteLabel.
  ///
  /// In en, this message translates to:
  /// **'Note'**
  String get dayLogNoteLabel;

  /// No description provided for @dayLogNoteHint.
  ///
  /// In en, this message translates to:
  /// **'Anything you want to remember about today'**
  String get dayLogNoteHint;

  /// No description provided for @dayLogOptionalTrackersLabel.
  ///
  /// In en, this message translates to:
  /// **'Optional trackers'**
  String get dayLogOptionalTrackersLabel;

  /// No description provided for @dayLogSexualActivityLabel.
  ///
  /// In en, this message translates to:
  /// **'Sexual activity'**
  String get dayLogSexualActivityLabel;

  /// No description provided for @dayLogBbtLabel.
  ///
  /// In en, this message translates to:
  /// **'Basal body temperature'**
  String get dayLogBbtLabel;

  /// No description provided for @dayLogMucusLabel.
  ///
  /// In en, this message translates to:
  /// **'Cervical mucus'**
  String get dayLogMucusLabel;

  /// No description provided for @mucusDry.
  ///
  /// In en, this message translates to:
  /// **'Dry'**
  String get mucusDry;

  /// No description provided for @mucusSticky.
  ///
  /// In en, this message translates to:
  /// **'Sticky'**
  String get mucusSticky;

  /// No description provided for @mucusCreamy.
  ///
  /// In en, this message translates to:
  /// **'Creamy'**
  String get mucusCreamy;

  /// No description provided for @mucusWatery.
  ///
  /// In en, this message translates to:
  /// **'Watery'**
  String get mucusWatery;

  /// No description provided for @mucusEggWhite.
  ///
  /// In en, this message translates to:
  /// **'Egg white'**
  String get mucusEggWhite;

  /// No description provided for @dayLogSavedIndicator.
  ///
  /// In en, this message translates to:
  /// **'Saved'**
  String get dayLogSavedIndicator;

  /// No description provided for @homeOpenTodayLog.
  ///
  /// In en, this message translates to:
  /// **'Add details for today'**
  String get homeOpenTodayLog;

  /// No description provided for @calendarLegendActual.
  ///
  /// In en, this message translates to:
  /// **'Logged period'**
  String get calendarLegendActual;

  /// No description provided for @calendarLegendPredicted.
  ///
  /// In en, this message translates to:
  /// **'Predicted window'**
  String get calendarLegendPredicted;

  /// No description provided for @calendarLegendFertile.
  ///
  /// In en, this message translates to:
  /// **'Estimated fertile window'**
  String get calendarLegendFertile;

  /// No description provided for @insightsCyclesLoggedLabel.
  ///
  /// In en, this message translates to:
  /// **'Cycles logged'**
  String get insightsCyclesLoggedLabel;

  /// No description provided for @insightsAveragePeriodLengthLabel.
  ///
  /// In en, this message translates to:
  /// **'Average period length'**
  String get insightsAveragePeriodLengthLabel;

  /// No description provided for @insightsAverageCycleLengthLabel.
  ///
  /// In en, this message translates to:
  /// **'Average cycle length'**
  String get insightsAverageCycleLengthLabel;

  /// No description provided for @insightsVariabilityLabel.
  ///
  /// In en, this message translates to:
  /// **'Varies by about {days} days'**
  String insightsVariabilityLabel(String days);

  /// No description provided for @insightsNotEnoughDataTitle.
  ///
  /// In en, this message translates to:
  /// **'Not enough data yet'**
  String get insightsNotEnoughDataTitle;

  /// No description provided for @insightsNotEnoughDataBody.
  ///
  /// In en, this message translates to:
  /// **'Log a couple of full cycles and your averages will show up here.'**
  String get insightsNotEnoughDataBody;

  /// No description provided for @insightsSymptomFrequencyTitle.
  ///
  /// In en, this message translates to:
  /// **'Symptoms by cycle day'**
  String get insightsSymptomFrequencyTitle;

  /// No description provided for @insightsNoSymptomsLogged.
  ///
  /// In en, this message translates to:
  /// **'No symptoms logged yet'**
  String get insightsNoSymptomsLogged;

  /// No description provided for @settingsLanguageLabel.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get settingsLanguageLabel;

  /// No description provided for @settingsLanguageEnglish.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get settingsLanguageEnglish;

  /// No description provided for @settingsLanguageTurkish.
  ///
  /// In en, this message translates to:
  /// **'Türkçe'**
  String get settingsLanguageTurkish;

  /// No description provided for @settingsWeekStartLabel.
  ///
  /// In en, this message translates to:
  /// **'Week starts on'**
  String get settingsWeekStartLabel;

  /// No description provided for @settingsWeekStartMonday.
  ///
  /// In en, this message translates to:
  /// **'Monday'**
  String get settingsWeekStartMonday;

  /// No description provided for @settingsWeekStartSunday.
  ///
  /// In en, this message translates to:
  /// **'Sunday'**
  String get settingsWeekStartSunday;

  /// No description provided for @settingsTemperatureUnitLabel.
  ///
  /// In en, this message translates to:
  /// **'Temperature unit'**
  String get settingsTemperatureUnitLabel;

  /// No description provided for @settingsTemperatureCelsius.
  ///
  /// In en, this message translates to:
  /// **'Celsius'**
  String get settingsTemperatureCelsius;

  /// No description provided for @settingsTemperatureFahrenheit.
  ///
  /// In en, this message translates to:
  /// **'Fahrenheit'**
  String get settingsTemperatureFahrenheit;

  /// No description provided for @settingsRemindersLabel.
  ///
  /// In en, this message translates to:
  /// **'Remind me before my period'**
  String get settingsRemindersLabel;

  /// No description provided for @settingsOptionalTrackersHeading.
  ///
  /// In en, this message translates to:
  /// **'Optional trackers'**
  String get settingsOptionalTrackersHeading;

  /// No description provided for @settingsOptionalTrackersBody.
  ///
  /// In en, this message translates to:
  /// **'Off by default. Turning one on adds it to the day-log screen.'**
  String get settingsOptionalTrackersBody;

  /// No description provided for @settingsSexualActivityToggle.
  ///
  /// In en, this message translates to:
  /// **'Sexual activity'**
  String get settingsSexualActivityToggle;

  /// No description provided for @settingsBbtToggle.
  ///
  /// In en, this message translates to:
  /// **'Basal body temperature'**
  String get settingsBbtToggle;

  /// No description provided for @settingsMucusToggle.
  ///
  /// In en, this message translates to:
  /// **'Cervical mucus'**
  String get settingsMucusToggle;

  /// No description provided for @settingsPrivacyEntry.
  ///
  /// In en, this message translates to:
  /// **'Privacy'**
  String get settingsPrivacyEntry;

  /// No description provided for @settingsDeleteAllData.
  ///
  /// In en, this message translates to:
  /// **'Delete all data'**
  String get settingsDeleteAllData;

  /// No description provided for @privacyScreenTitle.
  ///
  /// In en, this message translates to:
  /// **'Privacy'**
  String get privacyScreenTitle;

  /// No description provided for @privacyScreenIntro.
  ///
  /// In en, this message translates to:
  /// **'Here\'s exactly what happens to your data, in plain language.'**
  String get privacyScreenIntro;

  /// No description provided for @privacyScreenStorage.
  ///
  /// In en, this message translates to:
  /// **'Everything you log is encrypted and stored only on this device, in a single file. The encryption key lives in your phone\'s secure hardware — Keychain on iOS, Keystore on Android — not in the file itself.'**
  String get privacyScreenStorage;

  /// No description provided for @privacyScreenNoNetwork.
  ///
  /// In en, this message translates to:
  /// **'This app has no server. It doesn\'t have permission to use the internet at all — you can check that yourself in your phone\'s app settings.'**
  String get privacyScreenNoNetwork;

  /// No description provided for @privacyScreenNoThirdParty.
  ///
  /// In en, this message translates to:
  /// **'There\'s no analytics, no crash reporting, no ads, and no third-party SDK of any kind.'**
  String get privacyScreenNoThirdParty;

  /// No description provided for @privacyScreenExport.
  ///
  /// In en, this message translates to:
  /// **'The only way your data ever leaves this device is if you export it yourself, and that export is encrypted with a password only you know.'**
  String get privacyScreenExport;

  /// No description provided for @privacyScreenDelete.
  ///
  /// In en, this message translates to:
  /// **'Deleting your data is real and immediate. There\'s no account and no backup on our end — once it\'s gone, it\'s gone.'**
  String get privacyScreenDelete;

  /// No description provided for @reminderNotificationTitle.
  ///
  /// In en, this message translates to:
  /// **'Your period may be starting soon'**
  String get reminderNotificationTitle;

  /// No description provided for @reminderNotificationBody.
  ///
  /// In en, this message translates to:
  /// **'Based on your logged cycles, your estimated window is coming up.'**
  String get reminderNotificationBody;

  /// No description provided for @settingsExportEntry.
  ///
  /// In en, this message translates to:
  /// **'Export & backup'**
  String get settingsExportEntry;

  /// No description provided for @exportBackupHeading.
  ///
  /// In en, this message translates to:
  /// **'Encrypted backup'**
  String get exportBackupHeading;

  /// No description provided for @exportBackupBody.
  ///
  /// In en, this message translates to:
  /// **'Save an encrypted copy of your history to move to a new device. You\'ll need the password again to restore it — there\'s no way to recover it otherwise.'**
  String get exportBackupBody;

  /// No description provided for @exportCreateBackupButton.
  ///
  /// In en, this message translates to:
  /// **'Create backup'**
  String get exportCreateBackupButton;

  /// No description provided for @exportRestoreBackupButton.
  ///
  /// In en, this message translates to:
  /// **'Restore from backup'**
  String get exportRestoreBackupButton;

  /// No description provided for @exportPasswordLabel.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get exportPasswordLabel;

  /// No description provided for @exportPasswordConfirmLabel.
  ///
  /// In en, this message translates to:
  /// **'Confirm password'**
  String get exportPasswordConfirmLabel;

  /// No description provided for @exportPasswordMismatch.
  ///
  /// In en, this message translates to:
  /// **'Passwords don\'t match'**
  String get exportPasswordMismatch;

  /// No description provided for @exportPasswordTooShort.
  ///
  /// In en, this message translates to:
  /// **'Use at least 8 characters'**
  String get exportPasswordTooShort;

  /// No description provided for @exportRestoreConfirmTitle.
  ///
  /// In en, this message translates to:
  /// **'Replace all data on this device?'**
  String get exportRestoreConfirmTitle;

  /// No description provided for @exportRestoreConfirmBody.
  ///
  /// In en, this message translates to:
  /// **'Restoring a backup replaces everything currently logged on this device. This can\'t be undone.'**
  String get exportRestoreConfirmBody;

  /// No description provided for @exportRestoreConfirmAction.
  ///
  /// In en, this message translates to:
  /// **'Restore'**
  String get exportRestoreConfirmAction;

  /// No description provided for @exportWrongPassword.
  ///
  /// In en, this message translates to:
  /// **'That password doesn\'t match this backup'**
  String get exportWrongPassword;

  /// No description provided for @exportInvalidFile.
  ///
  /// In en, this message translates to:
  /// **'That file doesn\'t look like a Cycle backup'**
  String get exportInvalidFile;

  /// No description provided for @exportBackupCreated.
  ///
  /// In en, this message translates to:
  /// **'Backup ready to share'**
  String get exportBackupCreated;

  /// No description provided for @exportRestoreSuccess.
  ///
  /// In en, this message translates to:
  /// **'Backup restored'**
  String get exportRestoreSuccess;

  /// No description provided for @exportDoctorReportHeading.
  ///
  /// In en, this message translates to:
  /// **'Doctor report'**
  String get exportDoctorReportHeading;

  /// No description provided for @exportDoctorReportBody.
  ///
  /// In en, this message translates to:
  /// **'A summary you can share with a clinician.'**
  String get exportDoctorReportBody;

  /// No description provided for @exportIncludeNotesToggle.
  ///
  /// In en, this message translates to:
  /// **'Include personal notes'**
  String get exportIncludeNotesToggle;

  /// No description provided for @exportShareCsvButton.
  ///
  /// In en, this message translates to:
  /// **'Share as CSV'**
  String get exportShareCsvButton;

  /// No description provided for @exportPrintPdfButton.
  ///
  /// In en, this message translates to:
  /// **'Print / Save as PDF'**
  String get exportPrintPdfButton;

  /// No description provided for @doctorReportDisclaimer.
  ///
  /// In en, this message translates to:
  /// **'Generated by Cycle from user-entered data. Not a medical diagnosis.'**
  String get doctorReportDisclaimer;

  /// No description provided for @doctorReportGeneratedOn.
  ///
  /// In en, this message translates to:
  /// **'Generated on'**
  String get doctorReportGeneratedOn;

  /// No description provided for @doctorReportSummaryHeading.
  ///
  /// In en, this message translates to:
  /// **'Summary'**
  String get doctorReportSummaryHeading;

  /// No description provided for @doctorReportDailyLogHeading.
  ///
  /// In en, this message translates to:
  /// **'Daily log'**
  String get doctorReportDailyLogHeading;

  /// No description provided for @doctorReportColumnDate.
  ///
  /// In en, this message translates to:
  /// **'Date'**
  String get doctorReportColumnDate;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'tr'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'tr':
      return AppLocalizationsTr();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
