import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_de.dart';
import 'app_localizations_en.dart';
import 'app_localizations_es.dart';
import 'app_localizations_fr.dart';
import 'app_localizations_hi.dart';
import 'app_localizations_id.dart';
import 'app_localizations_it.dart';
import 'app_localizations_ja.dart';
import 'app_localizations_ko.dart';
import 'app_localizations_pt.dart';
import 'app_localizations_ru.dart';
import 'app_localizations_tr.dart';
import 'app_localizations_ur.dart';
import 'app_localizations_zh.dart';

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
    Locale('ar'),
    Locale('de'),
    Locale('en'),
    Locale('es'),
    Locale('fr'),
    Locale('hi'),
    Locale('id'),
    Locale('it'),
    Locale('ja'),
    Locale('ko'),
    Locale('pt'),
    Locale('ru'),
    Locale('tr'),
    Locale('ur'),
    Locale('zh'),
  ];

  /// The application name, shown as the app title.
  ///
  /// In en, this message translates to:
  /// **'Vera'**
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

  /// No description provided for @commonYes.
  ///
  /// In en, this message translates to:
  /// **'Yes'**
  String get commonYes;

  /// No description provided for @commonNo.
  ///
  /// In en, this message translates to:
  /// **'No'**
  String get commonNo;

  /// No description provided for @commonNotSure.
  ///
  /// In en, this message translates to:
  /// **'Not sure'**
  String get commonNotSure;

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
  /// **'Your cycle data stays only on this device, encrypted. There\'s no account and no cloud sync — nothing you log is ever uploaded. The free version shows ads, which do use the internet, but they never receive your health data.'**
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

  /// No description provided for @onboardingGoalTitle.
  ///
  /// In en, this message translates to:
  /// **'What brings you here?'**
  String get onboardingGoalTitle;

  /// No description provided for @onboardingGoalBody.
  ///
  /// In en, this message translates to:
  /// **'This just helps us show you the right things first — you can change your mind anytime in Settings.'**
  String get onboardingGoalBody;

  /// No description provided for @goalTrackPeriod.
  ///
  /// In en, this message translates to:
  /// **'Track my period'**
  String get goalTrackPeriod;

  /// No description provided for @goalTryingToConceive.
  ///
  /// In en, this message translates to:
  /// **'Trying to conceive'**
  String get goalTryingToConceive;

  /// No description provided for @goalPregnancyTracking.
  ///
  /// In en, this message translates to:
  /// **'Tracking a pregnancy'**
  String get goalPregnancyTracking;

  /// No description provided for @onboardingRegularityTitle.
  ///
  /// In en, this message translates to:
  /// **'Are your periods usually regular?'**
  String get onboardingRegularityTitle;

  /// No description provided for @onboardingRegularityBody.
  ///
  /// In en, this message translates to:
  /// **'No wrong answer here — this just helps us get to know your body a little.'**
  String get onboardingRegularityBody;

  /// No description provided for @onboardingCrampsTitle.
  ///
  /// In en, this message translates to:
  /// **'Do you usually get cramps?'**
  String get onboardingCrampsTitle;

  /// No description provided for @onboardingCrampsBody.
  ///
  /// In en, this message translates to:
  /// **'We\'ll make sure it\'s easy to log how you\'re feeling on days like that.'**
  String get onboardingCrampsBody;

  /// No description provided for @onboardingNotificationTitle.
  ///
  /// In en, this message translates to:
  /// **'Would you like gentle reminders?'**
  String get onboardingNotificationTitle;

  /// No description provided for @onboardingNotificationBody.
  ///
  /// In en, this message translates to:
  /// **'We can nudge you before your period is expected.'**
  String get onboardingNotificationBody;

  /// No description provided for @onboardingNotificationMockTitle.
  ///
  /// In en, this message translates to:
  /// **'Your period may start soon'**
  String get onboardingNotificationMockTitle;

  /// No description provided for @onboardingNotificationMockBody.
  ///
  /// In en, this message translates to:
  /// **'Based on your logged cycles'**
  String get onboardingNotificationMockBody;

  /// No description provided for @onboardingNotificationAllow.
  ///
  /// In en, this message translates to:
  /// **'Turn on reminders'**
  String get onboardingNotificationAllow;

  /// No description provided for @onboardingNotificationNotNow.
  ///
  /// In en, this message translates to:
  /// **'Not now'**
  String get onboardingNotificationNotNow;

  /// No description provided for @onboardingBuildingPlanTitle.
  ///
  /// In en, this message translates to:
  /// **'Setting things up for you'**
  String get onboardingBuildingPlanTitle;

  /// No description provided for @onboardingBuildingPlanStep1.
  ///
  /// In en, this message translates to:
  /// **'Securing your data on this device'**
  String get onboardingBuildingPlanStep1;

  /// No description provided for @onboardingBuildingPlanStep2.
  ///
  /// In en, this message translates to:
  /// **'Saving your preferences'**
  String get onboardingBuildingPlanStep2;

  /// No description provided for @onboardingBuildingPlanStep3.
  ///
  /// In en, this message translates to:
  /// **'Getting your calendar ready'**
  String get onboardingBuildingPlanStep3;

  /// No description provided for @onboardingBuildingPlanDone.
  ///
  /// In en, this message translates to:
  /// **'All set'**
  String get onboardingBuildingPlanDone;

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

  /// No description provided for @symptomPelvicPain.
  ///
  /// In en, this message translates to:
  /// **'Pelvic pain'**
  String get symptomPelvicPain;

  /// No description provided for @symptomDizziness.
  ///
  /// In en, this message translates to:
  /// **'Dizziness'**
  String get symptomDizziness;

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

  /// No description provided for @moodHappy.
  ///
  /// In en, this message translates to:
  /// **'Happy'**
  String get moodHappy;

  /// No description provided for @moodContent.
  ///
  /// In en, this message translates to:
  /// **'Content'**
  String get moodContent;

  /// No description provided for @moodSad.
  ///
  /// In en, this message translates to:
  /// **'Sad'**
  String get moodSad;

  /// No description provided for @moodDepressed.
  ///
  /// In en, this message translates to:
  /// **'Depressed'**
  String get moodDepressed;

  /// No description provided for @moodEmotional.
  ///
  /// In en, this message translates to:
  /// **'Emotional'**
  String get moodEmotional;

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

  /// No description provided for @calendarLegendOvulation.
  ///
  /// In en, this message translates to:
  /// **'Estimated ovulation'**
  String get calendarLegendOvulation;

  /// No description provided for @dayDetailFertileTitle.
  ///
  /// In en, this message translates to:
  /// **'In your estimated fertile window'**
  String get dayDetailFertileTitle;

  /// No description provided for @dayDetailOvulationTitle.
  ///
  /// In en, this message translates to:
  /// **'Estimated ovulation day'**
  String get dayDetailOvulationTitle;

  /// No description provided for @dayDetailOvulationBody.
  ///
  /// In en, this message translates to:
  /// **'Pregnancy is typically more likely around this day, based on usual timing — this is an estimate, not a guarantee.'**
  String get dayDetailOvulationBody;

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

  /// No description provided for @settingsLanguageSystem.
  ///
  /// In en, this message translates to:
  /// **'System language'**
  String get settingsLanguageSystem;

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

  /// No description provided for @settingsLanguageArabic.
  ///
  /// In en, this message translates to:
  /// **'العربية'**
  String get settingsLanguageArabic;

  /// No description provided for @settingsLanguageSpanish.
  ///
  /// In en, this message translates to:
  /// **'Español'**
  String get settingsLanguageSpanish;

  /// No description provided for @settingsLanguageFrench.
  ///
  /// In en, this message translates to:
  /// **'Français'**
  String get settingsLanguageFrench;

  /// No description provided for @settingsLanguageGerman.
  ///
  /// In en, this message translates to:
  /// **'Deutsch'**
  String get settingsLanguageGerman;

  /// No description provided for @settingsLanguageIndonesian.
  ///
  /// In en, this message translates to:
  /// **'Bahasa Indonesia'**
  String get settingsLanguageIndonesian;

  /// No description provided for @settingsLanguagePortuguese.
  ///
  /// In en, this message translates to:
  /// **'Português'**
  String get settingsLanguagePortuguese;

  /// No description provided for @settingsLanguageItalian.
  ///
  /// In en, this message translates to:
  /// **'Italiano'**
  String get settingsLanguageItalian;

  /// No description provided for @settingsLanguageRussian.
  ///
  /// In en, this message translates to:
  /// **'Русский'**
  String get settingsLanguageRussian;

  /// No description provided for @settingsLanguageHindi.
  ///
  /// In en, this message translates to:
  /// **'हिन्दी'**
  String get settingsLanguageHindi;

  /// No description provided for @settingsLanguageJapanese.
  ///
  /// In en, this message translates to:
  /// **'日本語'**
  String get settingsLanguageJapanese;

  /// No description provided for @settingsLanguageKorean.
  ///
  /// In en, this message translates to:
  /// **'한국어'**
  String get settingsLanguageKorean;

  /// No description provided for @settingsLanguageChinese.
  ///
  /// In en, this message translates to:
  /// **'简体中文'**
  String get settingsLanguageChinese;

  /// No description provided for @settingsLanguageUrdu.
  ///
  /// In en, this message translates to:
  /// **'اردو'**
  String get settingsLanguageUrdu;

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

  /// No description provided for @settingsRemindersPeriodEndLabel.
  ///
  /// In en, this message translates to:
  /// **'Check in when my period should be ending'**
  String get settingsRemindersPeriodEndLabel;

  /// No description provided for @settingsRemindersMedicationLabel.
  ///
  /// In en, this message translates to:
  /// **'Medication reminder'**
  String get settingsRemindersMedicationLabel;

  /// No description provided for @settingsRemindersWaterLabel.
  ///
  /// In en, this message translates to:
  /// **'Water reminder'**
  String get settingsRemindersWaterLabel;

  /// No description provided for @settingsRemindersAppointmentLabel.
  ///
  /// In en, this message translates to:
  /// **'Appointment reminder'**
  String get settingsRemindersAppointmentLabel;

  /// No description provided for @settingsRemindersAppointmentSet.
  ///
  /// In en, this message translates to:
  /// **'Set date & time'**
  String get settingsRemindersAppointmentSet;

  /// No description provided for @settingsRemindersAppointmentClear.
  ///
  /// In en, this message translates to:
  /// **'Clear'**
  String get settingsRemindersAppointmentClear;

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

  /// No description provided for @settingsBreastExamToggle.
  ///
  /// In en, this message translates to:
  /// **'Self breast exam'**
  String get settingsBreastExamToggle;

  /// No description provided for @settingsCervixToggle.
  ///
  /// In en, this message translates to:
  /// **'Cervix position & firmness'**
  String get settingsCervixToggle;

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
  /// **'This app has no server of its own and no account system — your logs are never uploaded. The free version does include Google ads, which connect to the internet; they never receive anything you log.'**
  String get privacyScreenNoNetwork;

  /// No description provided for @privacyScreenNoThirdParty.
  ///
  /// In en, this message translates to:
  /// **'There\'s no analytics, no crash reporting, and no tracking SDK. The only third-party component is Google\'s ad SDK in the free version — Premium removes it entirely.'**
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

  /// No description provided for @adPlaceholderLabel.
  ///
  /// In en, this message translates to:
  /// **'Ad space'**
  String get adPlaceholderLabel;

  /// No description provided for @adPlaceholderUpgradeCta.
  ///
  /// In en, this message translates to:
  /// **'Go ad-free with Premium'**
  String get adPlaceholderUpgradeCta;

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

  /// No description provided for @reminderPeriodEndTitle.
  ///
  /// In en, this message translates to:
  /// **'Your period may be wrapping up'**
  String get reminderPeriodEndTitle;

  /// No description provided for @reminderPeriodEndBody.
  ///
  /// In en, this message translates to:
  /// **'If it\'s still going, that\'s completely normal — just a gentle check-in.'**
  String get reminderPeriodEndBody;

  /// No description provided for @reminderMedicationTitle.
  ///
  /// In en, this message translates to:
  /// **'Medication reminder'**
  String get reminderMedicationTitle;

  /// No description provided for @reminderMedicationBody.
  ///
  /// In en, this message translates to:
  /// **'Time to take your medication.'**
  String get reminderMedicationBody;

  /// No description provided for @reminderWaterTitle.
  ///
  /// In en, this message translates to:
  /// **'Stay hydrated'**
  String get reminderWaterTitle;

  /// No description provided for @reminderWaterBody.
  ///
  /// In en, this message translates to:
  /// **'A little water reminder.'**
  String get reminderWaterBody;

  /// No description provided for @reminderAppointmentTitle.
  ///
  /// In en, this message translates to:
  /// **'Upcoming appointment'**
  String get reminderAppointmentTitle;

  /// No description provided for @reminderAppointmentBody.
  ///
  /// In en, this message translates to:
  /// **'You have an appointment coming up.'**
  String get reminderAppointmentBody;

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
  /// **'That file doesn\'t look like a Vera backup'**
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
  /// **'Generated by Vera from user-entered data. Not a medical diagnosis.'**
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

  /// No description provided for @doctorReportTimelineHeading.
  ///
  /// In en, this message translates to:
  /// **'Cycle timeline'**
  String get doctorReportTimelineHeading;

  /// No description provided for @doctorReportCycleLabel.
  ///
  /// In en, this message translates to:
  /// **'Cycle'**
  String get doctorReportCycleLabel;

  /// No description provided for @doctorReportTimelineLegendPeriod.
  ///
  /// In en, this message translates to:
  /// **'Period'**
  String get doctorReportTimelineLegendPeriod;

  /// No description provided for @doctorReportTimelineLegendCycle.
  ///
  /// In en, this message translates to:
  /// **'Rest of cycle'**
  String get doctorReportTimelineLegendCycle;

  /// No description provided for @doctorReportTimelineOngoing.
  ///
  /// In en, this message translates to:
  /// **'Ongoing'**
  String get doctorReportTimelineOngoing;

  /// No description provided for @dailyInsightLabel.
  ///
  /// In en, this message translates to:
  /// **'Did you know?'**
  String get dailyInsightLabel;

  /// No description provided for @insightMenstrual1.
  ///
  /// In en, this message translates to:
  /// **'Your uterine lining is shedding right now — most periods last 3 to 7 days, and that\'s completely normal.'**
  String get insightMenstrual1;

  /// No description provided for @insightMenstrual2.
  ///
  /// In en, this message translates to:
  /// **'Iron-rich foods like leafy greens and lentils can help offset what your body loses this week.'**
  String get insightMenstrual2;

  /// No description provided for @insightFollicular1.
  ///
  /// In en, this message translates to:
  /// **'Estrogen is rising, and many people notice more energy and better focus starting around now.'**
  String get insightFollicular1;

  /// No description provided for @insightFollicular2.
  ///
  /// In en, this message translates to:
  /// **'Your body is preparing an egg for release — this phase can last anywhere from a week to a few weeks.'**
  String get insightFollicular2;

  /// No description provided for @insightFertile1.
  ///
  /// In en, this message translates to:
  /// **'This is your estimated fertile window — the days around ovulation when pregnancy is most likely, based on typical timing.'**
  String get insightFertile1;

  /// No description provided for @insightFertile2.
  ///
  /// In en, this message translates to:
  /// **'Some people notice a slight rise in basal body temperature or changes in cervical mucus around ovulation.'**
  String get insightFertile2;

  /// No description provided for @insightLuteal1.
  ///
  /// In en, this message translates to:
  /// **'Progesterone rises after ovulation — this is often when PMS symptoms like mood changes or bloating show up.'**
  String get insightLuteal1;

  /// No description provided for @insightLuteal2.
  ///
  /// In en, this message translates to:
  /// **'If a pregnancy hasn\'t implanted, hormone levels drop near the end of this phase, triggering your next period.'**
  String get insightLuteal2;

  /// No description provided for @insightUnknown1.
  ///
  /// In en, this message translates to:
  /// **'Cycle lengths vary a lot from person to person — anywhere from 21 to 35 days is considered typical.'**
  String get insightUnknown1;

  /// No description provided for @insightsPhaseTipsTitle.
  ///
  /// In en, this message translates to:
  /// **'May feel good in this phase'**
  String get insightsPhaseTipsTitle;

  /// No description provided for @tipFitnessLabel.
  ///
  /// In en, this message translates to:
  /// **'Movement'**
  String get tipFitnessLabel;

  /// No description provided for @tipNutritionLabel.
  ///
  /// In en, this message translates to:
  /// **'Nutrition'**
  String get tipNutritionLabel;

  /// No description provided for @tipFitnessMenstrual.
  ///
  /// In en, this message translates to:
  /// **'Gentle movement — walking, stretching, or restorative yoga — can feel better than intense workouts right now.'**
  String get tipFitnessMenstrual;

  /// No description provided for @tipFitnessFollicular.
  ///
  /// In en, this message translates to:
  /// **'Energy often climbs in this phase — a good window to try a new workout or push a bit harder.'**
  String get tipFitnessFollicular;

  /// No description provided for @tipFitnessFertile.
  ///
  /// In en, this message translates to:
  /// **'Many people feel at their most energetic here — a good phase for higher-intensity training if that appeals to you.'**
  String get tipFitnessFertile;

  /// No description provided for @tipFitnessLuteal.
  ///
  /// In en, this message translates to:
  /// **'If energy dips later in this phase, lower-intensity strength work or swimming can feel more sustainable.'**
  String get tipFitnessLuteal;

  /// No description provided for @tipFitnessUnknown.
  ///
  /// In en, this message translates to:
  /// **'Whatever movement feels good today is a good choice — there\'s no single \"right\" routine for every day.'**
  String get tipFitnessUnknown;

  /// No description provided for @tipNutritionMenstrual.
  ///
  /// In en, this message translates to:
  /// **'Iron-rich foods like leafy greens, lentils, and red meat can help offset what your body loses this week.'**
  String get tipNutritionMenstrual;

  /// No description provided for @tipNutritionFollicular.
  ///
  /// In en, this message translates to:
  /// **'Lighter, fresh meals often sit well as energy rises — but there\'s no single \"right\" way to eat in this phase.'**
  String get tipNutritionFollicular;

  /// No description provided for @tipNutritionFertile.
  ///
  /// In en, this message translates to:
  /// **'Staying hydrated and keeping meals balanced supports energy through this more active-feeling phase.'**
  String get tipNutritionFertile;

  /// No description provided for @tipNutritionLuteal.
  ///
  /// In en, this message translates to:
  /// **'Cravings can shift here — complex carbs and magnesium-rich foods like nuts and dark chocolate are common go-tos.'**
  String get tipNutritionLuteal;

  /// No description provided for @tipNutritionUnknown.
  ///
  /// In en, this message translates to:
  /// **'Balanced, regular meals are a solid default whenever your phase isn\'t clear yet.'**
  String get tipNutritionUnknown;

  /// No description provided for @predictionSettingsEntry.
  ///
  /// In en, this message translates to:
  /// **'Prediction settings'**
  String get predictionSettingsEntry;

  /// No description provided for @predictionSettingsIntro.
  ///
  /// In en, this message translates to:
  /// **'These are assumptions, shown openly. Once you\'ve logged 2 full cycles, your real prediction on Home is calculated from your own data — these numbers stop being used for that.'**
  String get predictionSettingsIntro;

  /// No description provided for @predictionSettingsPeriodLengthLabel.
  ///
  /// In en, this message translates to:
  /// **'Typical period length'**
  String get predictionSettingsPeriodLengthLabel;

  /// No description provided for @predictionSettingsCycleLengthLabel.
  ///
  /// In en, this message translates to:
  /// **'Typical cycle length'**
  String get predictionSettingsCycleLengthLabel;

  /// No description provided for @predictionSettingsCycleLengthHint.
  ///
  /// In en, this message translates to:
  /// **'Used to scale the ring on Home until we have real data.'**
  String get predictionSettingsCycleLengthHint;

  /// No description provided for @predictionSettingsLutealLabel.
  ///
  /// In en, this message translates to:
  /// **'Luteal phase length'**
  String get predictionSettingsLutealLabel;

  /// No description provided for @predictionSettingsLutealHint.
  ///
  /// In en, this message translates to:
  /// **'The typical days between ovulation and your next period. Used to place the estimated fertile window — this one keeps being used even after real predictions start.'**
  String get predictionSettingsLutealHint;

  /// No description provided for @dayLogEnergyLabel.
  ///
  /// In en, this message translates to:
  /// **'Energy'**
  String get dayLogEnergyLabel;

  /// No description provided for @energyLevelLow.
  ///
  /// In en, this message translates to:
  /// **'Low'**
  String get energyLevelLow;

  /// No description provided for @energyLevelMedium.
  ///
  /// In en, this message translates to:
  /// **'Medium'**
  String get energyLevelMedium;

  /// No description provided for @energyLevelHigh.
  ///
  /// In en, this message translates to:
  /// **'High'**
  String get energyLevelHigh;

  /// No description provided for @energyLevelEnergetic.
  ///
  /// In en, this message translates to:
  /// **'Energized'**
  String get energyLevelEnergetic;

  /// No description provided for @dayLogSkinHairLabel.
  ///
  /// In en, this message translates to:
  /// **'Skin & hair'**
  String get dayLogSkinHairLabel;

  /// No description provided for @skinHealthyGlow.
  ///
  /// In en, this message translates to:
  /// **'Healthy glow'**
  String get skinHealthyGlow;

  /// No description provided for @skinRedness.
  ///
  /// In en, this message translates to:
  /// **'Redness'**
  String get skinRedness;

  /// No description provided for @skinDryness.
  ///
  /// In en, this message translates to:
  /// **'Dryness'**
  String get skinDryness;

  /// No description provided for @skinOiliness.
  ///
  /// In en, this message translates to:
  /// **'Oiliness'**
  String get skinOiliness;

  /// No description provided for @hairGoodDay.
  ///
  /// In en, this message translates to:
  /// **'Good hair day'**
  String get hairGoodDay;

  /// No description provided for @hairBadDay.
  ///
  /// In en, this message translates to:
  /// **'Bad hair day'**
  String get hairBadDay;

  /// No description provided for @hairLoss.
  ///
  /// In en, this message translates to:
  /// **'Hair loss'**
  String get hairLoss;

  /// No description provided for @scalpOily.
  ///
  /// In en, this message translates to:
  /// **'Oily scalp'**
  String get scalpOily;

  /// No description provided for @dayLogBreastExamLabel.
  ///
  /// In en, this message translates to:
  /// **'Self breast exam'**
  String get dayLogBreastExamLabel;

  /// No description provided for @breastExamAllNormal.
  ///
  /// In en, this message translates to:
  /// **'Nothing unusual'**
  String get breastExamAllNormal;

  /// No description provided for @breastExamLump.
  ///
  /// In en, this message translates to:
  /// **'Lump'**
  String get breastExamLump;

  /// No description provided for @breastExamIndentation.
  ///
  /// In en, this message translates to:
  /// **'Indentation'**
  String get breastExamIndentation;

  /// No description provided for @breastExamRedness.
  ///
  /// In en, this message translates to:
  /// **'Redness'**
  String get breastExamRedness;

  /// No description provided for @breastExamCrackedNipple.
  ///
  /// In en, this message translates to:
  /// **'Cracked nipple'**
  String get breastExamCrackedNipple;

  /// No description provided for @breastExamDischarge.
  ///
  /// In en, this message translates to:
  /// **'Discharge'**
  String get breastExamDischarge;

  /// No description provided for @cervixPositionLabel.
  ///
  /// In en, this message translates to:
  /// **'Cervix position'**
  String get cervixPositionLabel;

  /// No description provided for @cervixPositionLow.
  ///
  /// In en, this message translates to:
  /// **'Low'**
  String get cervixPositionLow;

  /// No description provided for @cervixPositionMedium.
  ///
  /// In en, this message translates to:
  /// **'Medium'**
  String get cervixPositionMedium;

  /// No description provided for @cervixPositionHigh.
  ///
  /// In en, this message translates to:
  /// **'High'**
  String get cervixPositionHigh;

  /// No description provided for @cervixOpeningLabel.
  ///
  /// In en, this message translates to:
  /// **'Cervix opening'**
  String get cervixOpeningLabel;

  /// No description provided for @cervixOpeningClosed.
  ///
  /// In en, this message translates to:
  /// **'Closed'**
  String get cervixOpeningClosed;

  /// No description provided for @cervixOpeningMedium.
  ///
  /// In en, this message translates to:
  /// **'Medium'**
  String get cervixOpeningMedium;

  /// No description provided for @cervixOpeningOpen.
  ///
  /// In en, this message translates to:
  /// **'Open'**
  String get cervixOpeningOpen;

  /// No description provided for @cervixFirmnessLabel.
  ///
  /// In en, this message translates to:
  /// **'Cervix firmness'**
  String get cervixFirmnessLabel;

  /// No description provided for @cervixFirmnessSoft.
  ///
  /// In en, this message translates to:
  /// **'Soft'**
  String get cervixFirmnessSoft;

  /// No description provided for @cervixFirmnessMedium.
  ///
  /// In en, this message translates to:
  /// **'Medium'**
  String get cervixFirmnessMedium;

  /// No description provided for @cervixFirmnessFirm.
  ///
  /// In en, this message translates to:
  /// **'Firm'**
  String get cervixFirmnessFirm;

  /// No description provided for @dayLogWaterLabel.
  ///
  /// In en, this message translates to:
  /// **'Water'**
  String get dayLogWaterLabel;

  /// No description provided for @dayLogSleepLabel.
  ///
  /// In en, this message translates to:
  /// **'Sleep'**
  String get dayLogSleepLabel;

  /// No description provided for @dayLogWeightLabel.
  ///
  /// In en, this message translates to:
  /// **'Weight'**
  String get dayLogWeightLabel;

  /// No description provided for @dayLogMedicationsLabel.
  ///
  /// In en, this message translates to:
  /// **'Medication'**
  String get dayLogMedicationsLabel;

  /// No description provided for @dayLogAddMedication.
  ///
  /// In en, this message translates to:
  /// **'Add medication'**
  String get dayLogAddMedication;

  /// No description provided for @dayLogMedicationNameHint.
  ///
  /// In en, this message translates to:
  /// **'Medication name'**
  String get dayLogMedicationNameHint;

  /// No description provided for @navAssistant.
  ///
  /// In en, this message translates to:
  /// **'Assistant'**
  String get navAssistant;

  /// No description provided for @assistantTitle.
  ///
  /// In en, this message translates to:
  /// **'Vera Assistant'**
  String get assistantTitle;

  /// No description provided for @assistantInputHint.
  ///
  /// In en, this message translates to:
  /// **'Ask about your cycle…'**
  String get assistantInputHint;

  /// No description provided for @assistantIntro.
  ///
  /// In en, this message translates to:
  /// **'Hi! I can answer questions about periods, cycles, and how Vera works — right here on your phone, nothing leaves your device. I\'m not a doctor and this isn\'t medical advice.'**
  String get assistantIntro;

  /// No description provided for @insightMenstrual3.
  ///
  /// In en, this message translates to:
  /// **'Period blood isn\'t \"dirty blood\" — it\'s a mix of blood and uterine lining, a completely normal part of the cycle.'**
  String get insightMenstrual3;

  /// No description provided for @insightMenstrual4.
  ///
  /// In en, this message translates to:
  /// **'Gentle heat on the lower belly genuinely eases cramps — a warm water bottle is an evidence-backed classic.'**
  String get insightMenstrual4;

  /// No description provided for @insightMenstrual5.
  ///
  /// In en, this message translates to:
  /// **'Flow is often heaviest in the first two days and tapers off after — that pattern is typical.'**
  String get insightMenstrual5;

  /// No description provided for @insightMenstrual6.
  ///
  /// In en, this message translates to:
  /// **'Feeling a bit more tired during your period is common — iron leaves the body with menstrual blood.'**
  String get insightMenstrual6;

  /// No description provided for @insightFollicular3.
  ///
  /// In en, this message translates to:
  /// **'Estrogen is rebuilding your uterine lining after your period — your body is prepping fresh.'**
  String get insightFollicular3;

  /// No description provided for @insightFollicular4.
  ///
  /// In en, this message translates to:
  /// **'Skin often looks its clearest in this phase as hormone levels settle.'**
  String get insightFollicular4;

  /// No description provided for @insightFollicular5.
  ///
  /// In en, this message translates to:
  /// **'Endurance and reaction times peak in the late follicular phase for many people.'**
  String get insightFollicular5;

  /// No description provided for @insightFollicular6.
  ///
  /// In en, this message translates to:
  /// **'This phase\'s length is what varies most between people — the luteal phase is far more constant.'**
  String get insightFollicular6;

  /// No description provided for @insightFertile3.
  ///
  /// In en, this message translates to:
  /// **'An egg lives about 12–24 hours, but sperm can wait up to 5 days — that\'s why the fertile window spans several days.'**
  String get insightFertile3;

  /// No description provided for @insightFertile4.
  ///
  /// In en, this message translates to:
  /// **'Around ovulation, cervical mucus often turns clear and stretchy — like raw egg white.'**
  String get insightFertile4;

  /// No description provided for @insightFertile5.
  ///
  /// In en, this message translates to:
  /// **'Some people feel a brief one-sided twinge at ovulation — it even has a name: mittelschmerz.'**
  String get insightFertile5;

  /// No description provided for @insightFertile6.
  ///
  /// In en, this message translates to:
  /// **'Basal body temperature rises slightly *after* ovulation — it confirms it happened rather than predicting it.'**
  String get insightFertile6;

  /// No description provided for @insightLuteal3.
  ///
  /// In en, this message translates to:
  /// **'Progesterone peaks about a week after ovulation — bloating and breast tenderness around then are common.'**
  String get insightLuteal3;

  /// No description provided for @insightLuteal4.
  ///
  /// In en, this message translates to:
  /// **'Craving carbs before your period is real — energy needs rise slightly in the luteal phase.'**
  String get insightLuteal4;

  /// No description provided for @insightLuteal5.
  ///
  /// In en, this message translates to:
  /// **'PMS symptoms usually ease within a day or two after bleeding starts.'**
  String get insightLuteal5;

  /// No description provided for @insightLuteal6.
  ///
  /// In en, this message translates to:
  /// **'A consistent sleep routine can noticeably soften late-luteal mood dips.'**
  String get insightLuteal6;

  /// No description provided for @insightUnknown2.
  ///
  /// In en, this message translates to:
  /// **'Tracking just three cycles is often enough to see your own pattern emerge.'**
  String get insightUnknown2;

  /// No description provided for @insightUnknown3.
  ///
  /// In en, this message translates to:
  /// **'Cycles are personal — comparing yours to a friend\'s rarely tells you anything useful.'**
  String get insightUnknown3;

  /// No description provided for @insightUnknown4.
  ///
  /// In en, this message translates to:
  /// **'Stress, travel, and illness can all shift ovulation — a \"late\" period often just means late ovulation.'**
  String get insightUnknown4;

  /// No description provided for @settingsThemeLabel.
  ///
  /// In en, this message translates to:
  /// **'Theme'**
  String get settingsThemeLabel;

  /// No description provided for @settingsThemeSystem.
  ///
  /// In en, this message translates to:
  /// **'System'**
  String get settingsThemeSystem;

  /// No description provided for @settingsThemeLight.
  ///
  /// In en, this message translates to:
  /// **'Light'**
  String get settingsThemeLight;

  /// No description provided for @settingsThemeDark.
  ///
  /// In en, this message translates to:
  /// **'Dark'**
  String get settingsThemeDark;

  /// No description provided for @settingsMascotLabel.
  ///
  /// In en, this message translates to:
  /// **'Companion mascot'**
  String get settingsMascotLabel;

  /// No description provided for @mascotDroplet.
  ///
  /// In en, this message translates to:
  /// **'Droplet'**
  String get mascotDroplet;

  /// No description provided for @mascotFlower.
  ///
  /// In en, this message translates to:
  /// **'Flower'**
  String get mascotFlower;

  /// No description provided for @mascotMoon.
  ///
  /// In en, this message translates to:
  /// **'Moon'**
  String get mascotMoon;

  /// No description provided for @mascotNone.
  ///
  /// In en, this message translates to:
  /// **'None'**
  String get mascotNone;

  /// No description provided for @homeWindowCountdown.
  ///
  /// In en, this message translates to:
  /// **'Predicted window starts in about {days} days'**
  String homeWindowCountdown(int days);

  /// No description provided for @homeOvulationCountdown.
  ///
  /// In en, this message translates to:
  /// **'Estimated ovulation in about {days} days'**
  String homeOvulationCountdown(int days);

  /// No description provided for @homeQuickLogTitle.
  ///
  /// In en, this message translates to:
  /// **'How does your body feel today?'**
  String get homeQuickLogTitle;

  /// No description provided for @actionSave.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get actionSave;

  /// No description provided for @insightsTrackerHubTitle.
  ///
  /// In en, this message translates to:
  /// **'Your trackers'**
  String get insightsTrackerHubTitle;

  /// No description provided for @trackerHistoryEmpty.
  ///
  /// In en, this message translates to:
  /// **'No entries in this range yet'**
  String get trackerHistoryEmpty;

  /// No description provided for @rangeFilter1m.
  ///
  /// In en, this message translates to:
  /// **'1 mo'**
  String get rangeFilter1m;

  /// No description provided for @rangeFilter3m.
  ///
  /// In en, this message translates to:
  /// **'3 mo'**
  String get rangeFilter3m;

  /// No description provided for @rangeFilter6m.
  ///
  /// In en, this message translates to:
  /// **'6 mo'**
  String get rangeFilter6m;

  /// No description provided for @dayLogOvulationTestLabel.
  ///
  /// In en, this message translates to:
  /// **'Ovulation test'**
  String get dayLogOvulationTestLabel;

  /// No description provided for @ovulationTestNegative.
  ///
  /// In en, this message translates to:
  /// **'Negative'**
  String get ovulationTestNegative;

  /// No description provided for @ovulationTestPositive.
  ///
  /// In en, this message translates to:
  /// **'Positive'**
  String get ovulationTestPositive;

  /// No description provided for @settingsOvulationTestToggle.
  ///
  /// In en, this message translates to:
  /// **'Ovulation test'**
  String get settingsOvulationTestToggle;

  /// No description provided for @settingsRemindersOvulationLabel.
  ///
  /// In en, this message translates to:
  /// **'Fertile window heads-up'**
  String get settingsRemindersOvulationLabel;

  /// No description provided for @reminderOvulationTitle.
  ///
  /// In en, this message translates to:
  /// **'Estimated fertile window approaching'**
  String get reminderOvulationTitle;

  /// No description provided for @reminderOvulationBody.
  ///
  /// In en, this message translates to:
  /// **'Based on your logged cycles, your estimated fertile window may start soon.'**
  String get reminderOvulationBody;

  /// No description provided for @trackerEntriesCount.
  ///
  /// In en, this message translates to:
  /// **'{count} entries'**
  String trackerEntriesCount(int count);

  /// No description provided for @assistantTyping.
  ///
  /// In en, this message translates to:
  /// **'Vera is typing…'**
  String get assistantTyping;

  /// No description provided for @premiumTitle.
  ///
  /// In en, this message translates to:
  /// **'Vera Premium'**
  String get premiumTitle;

  /// No description provided for @premiumHeadline.
  ///
  /// In en, this message translates to:
  /// **'An ad-free Vera'**
  String get premiumHeadline;

  /// No description provided for @premiumSubhead.
  ///
  /// In en, this message translates to:
  /// **'Every tracking feature stays free forever. Premium simply removes the ads and supports development.'**
  String get premiumSubhead;

  /// No description provided for @premiumBenefitNoAds.
  ///
  /// In en, this message translates to:
  /// **'No ads, anywhere in the app'**
  String get premiumBenefitNoAds;

  /// No description provided for @premiumBenefitSupport.
  ///
  /// In en, this message translates to:
  /// **'Supports an independent, privacy-first app'**
  String get premiumBenefitSupport;

  /// No description provided for @premiumBenefitFuture.
  ///
  /// In en, this message translates to:
  /// **'Includes future Premium comfort features'**
  String get premiumBenefitFuture;

  /// No description provided for @premiumMonthly.
  ///
  /// In en, this message translates to:
  /// **'Monthly'**
  String get premiumMonthly;

  /// No description provided for @premiumYearly.
  ///
  /// In en, this message translates to:
  /// **'Yearly'**
  String get premiumYearly;

  /// No description provided for @premiumYearlyNote.
  ///
  /// In en, this message translates to:
  /// **'Billed once a year'**
  String get premiumYearlyNote;

  /// No description provided for @premiumSubscribeCta.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get premiumSubscribeCta;

  /// No description provided for @premiumRestore.
  ///
  /// In en, this message translates to:
  /// **'Restore purchase'**
  String get premiumRestore;

  /// No description provided for @premiumCancelNote.
  ///
  /// In en, this message translates to:
  /// **'Cancel anytime in your app store account. No countdowns, no pressure — if now isn\'t the time, the free version keeps working exactly as it does today.'**
  String get premiumCancelNote;

  /// No description provided for @premiumActiveBadge.
  ///
  /// In en, this message translates to:
  /// **'Premium is active'**
  String get premiumActiveBadge;

  /// No description provided for @premiumDevToggle.
  ///
  /// In en, this message translates to:
  /// **'Simulate Premium (development)'**
  String get premiumDevToggle;

  /// No description provided for @settingsPremiumEntry.
  ///
  /// In en, this message translates to:
  /// **'Vera Premium'**
  String get settingsPremiumEntry;

  /// No description provided for @adTestNotice.
  ///
  /// In en, this message translates to:
  /// **'Test ad — not a real placement yet'**
  String get adTestNotice;

  /// No description provided for @settingsPregnancyModeLabel.
  ///
  /// In en, this message translates to:
  /// **'Pregnancy mode'**
  String get settingsPregnancyModeLabel;

  /// No description provided for @pregnancyLmpLabel.
  ///
  /// In en, this message translates to:
  /// **'First day of last period'**
  String get pregnancyLmpLabel;

  /// No description provided for @pregnancyWeekLabel.
  ///
  /// In en, this message translates to:
  /// **'Week {weeks}, day {days}'**
  String pregnancyWeekLabel(int weeks, int days);

  /// No description provided for @pregnancyDueDateLabel.
  ///
  /// In en, this message translates to:
  /// **'Estimated due date'**
  String get pregnancyDueDateLabel;

  /// No description provided for @pregnancyDaysLeft.
  ///
  /// In en, this message translates to:
  /// **'About {days} days to go'**
  String pregnancyDaysLeft(int days);

  /// No description provided for @pregnancyTrimesterLabel.
  ///
  /// In en, this message translates to:
  /// **'Trimester {n}'**
  String pregnancyTrimesterLabel(int n);

  /// No description provided for @pregnancyDisclaimer.
  ///
  /// In en, this message translates to:
  /// **'Dates are estimated from your last period using the standard 280-day rule. An ultrasound gives a more accurate date, and late ovulation shifts these numbers — this is information, not medical care.'**
  String get pregnancyDisclaimer;

  /// No description provided for @pregnancyWeeklyNoteTitle.
  ///
  /// In en, this message translates to:
  /// **'This week'**
  String get pregnancyWeeklyNoteTitle;

  /// No description provided for @pregnancyNeedsLmp.
  ///
  /// In en, this message translates to:
  /// **'Add the first day of your last period to start tracking.'**
  String get pregnancyNeedsLmp;

  /// No description provided for @pregnancyOutOfRange.
  ///
  /// In en, this message translates to:
  /// **'That date is more than 42 weeks ago — update it or turn pregnancy mode off.'**
  String get pregnancyOutOfRange;

  /// No description provided for @partnerShareTitle.
  ///
  /// In en, this message translates to:
  /// **'Share a summary with a partner'**
  String get partnerShareTitle;

  /// No description provided for @partnerShareBody.
  ///
  /// In en, this message translates to:
  /// **'Creates a short text summary — your current phase and estimated window — that you send yourself through any app. There\'s no live sync and no partner account: nothing is shared unless you send it.'**
  String get partnerShareBody;

  /// No description provided for @partnerShareCta.
  ///
  /// In en, this message translates to:
  /// **'Create summary'**
  String get partnerShareCta;

  /// No description provided for @partnerSummaryHeader.
  ///
  /// In en, this message translates to:
  /// **'Cycle summary from Vera'**
  String get partnerSummaryHeader;

  /// No description provided for @settingsHomeThemeLabel.
  ///
  /// In en, this message translates to:
  /// **'Home theme'**
  String get settingsHomeThemeLabel;

  /// No description provided for @homeThemeWheat.
  ///
  /// In en, this message translates to:
  /// **'Wheat'**
  String get homeThemeWheat;

  /// No description provided for @homeThemeSky.
  ///
  /// In en, this message translates to:
  /// **'Sky'**
  String get homeThemeSky;

  /// No description provided for @homeThemeField.
  ///
  /// In en, this message translates to:
  /// **'Field'**
  String get homeThemeField;

  /// No description provided for @homeThemeBlossom.
  ///
  /// In en, this message translates to:
  /// **'Blossom'**
  String get homeThemeBlossom;

  /// No description provided for @homeThemePlain.
  ///
  /// In en, this message translates to:
  /// **'Plain'**
  String get homeThemePlain;

  /// No description provided for @backupNudgeTitle.
  ///
  /// In en, this message translates to:
  /// **'Keep a copy of your data'**
  String get backupNudgeTitle;

  /// No description provided for @backupNudgeBody.
  ///
  /// In en, this message translates to:
  /// **'Everything lives only on this phone. If it\'s lost, broken, or reset, your history goes with it — an encrypted backup takes a moment and only you can open it.'**
  String get backupNudgeBody;

  /// No description provided for @backupNudgeCta.
  ///
  /// In en, this message translates to:
  /// **'Back up now'**
  String get backupNudgeCta;

  /// No description provided for @backupNudgeDismiss.
  ///
  /// In en, this message translates to:
  /// **'Later'**
  String get backupNudgeDismiss;

  /// No description provided for @backupLastDone.
  ///
  /// In en, this message translates to:
  /// **'Last backup: {date}'**
  String backupLastDone(String date);

  /// No description provided for @backupNever.
  ///
  /// In en, this message translates to:
  /// **'No backup yet'**
  String get backupNever;

  /// No description provided for @settingsRemindersBackupLabel.
  ///
  /// In en, this message translates to:
  /// **'Remind me to back up'**
  String get settingsRemindersBackupLabel;

  /// No description provided for @reminderBackupTitle.
  ///
  /// In en, this message translates to:
  /// **'Time to back up Vera'**
  String get reminderBackupTitle;

  /// No description provided for @reminderBackupBody.
  ///
  /// In en, this message translates to:
  /// **'Your history only exists on this phone. A quick encrypted backup keeps it safe.'**
  String get reminderBackupBody;

  /// No description provided for @calendarDayDetailTitle.
  ///
  /// In en, this message translates to:
  /// **'This day'**
  String get calendarDayDetailTitle;

  /// No description provided for @calendarDayNothingLogged.
  ///
  /// In en, this message translates to:
  /// **'Nothing logged for this day yet'**
  String get calendarDayNothingLogged;

  /// No description provided for @calendarDayOpenLog.
  ///
  /// In en, this message translates to:
  /// **'Open day log'**
  String get calendarDayOpenLog;

  /// No description provided for @cycleHistoryTitle.
  ///
  /// In en, this message translates to:
  /// **'Past cycles'**
  String get cycleHistoryTitle;

  /// No description provided for @cycleHistoryEmpty.
  ///
  /// In en, this message translates to:
  /// **'Log a couple of periods and your cycle history shows up here.'**
  String get cycleHistoryEmpty;

  /// No description provided for @cycleHistoryOngoing.
  ///
  /// In en, this message translates to:
  /// **'Ongoing'**
  String get cycleHistoryOngoing;

  /// No description provided for @cycleHistoryLength.
  ///
  /// In en, this message translates to:
  /// **'{days} day cycle'**
  String cycleHistoryLength(int days);

  /// No description provided for @cycleHistoryPeriodLength.
  ///
  /// In en, this message translates to:
  /// **'{days} days of bleeding'**
  String cycleHistoryPeriodLength(int days);

  /// No description provided for @cycleHistoryVsAverage.
  ///
  /// In en, this message translates to:
  /// **'{diff} vs your average'**
  String cycleHistoryVsAverage(String diff);

  /// No description provided for @insightsCycleHistoryEntry.
  ///
  /// In en, this message translates to:
  /// **'Past cycles'**
  String get insightsCycleHistoryEntry;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>[
    'ar',
    'de',
    'en',
    'es',
    'fr',
    'hi',
    'id',
    'it',
    'ja',
    'ko',
    'pt',
    'ru',
    'tr',
    'ur',
    'zh',
  ].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'de':
      return AppLocalizationsDe();
    case 'en':
      return AppLocalizationsEn();
    case 'es':
      return AppLocalizationsEs();
    case 'fr':
      return AppLocalizationsFr();
    case 'hi':
      return AppLocalizationsHi();
    case 'id':
      return AppLocalizationsId();
    case 'it':
      return AppLocalizationsIt();
    case 'ja':
      return AppLocalizationsJa();
    case 'ko':
      return AppLocalizationsKo();
    case 'pt':
      return AppLocalizationsPt();
    case 'ru':
      return AppLocalizationsRu();
    case 'tr':
      return AppLocalizationsTr();
    case 'ur':
      return AppLocalizationsUr();
    case 'zh':
      return AppLocalizationsZh();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
