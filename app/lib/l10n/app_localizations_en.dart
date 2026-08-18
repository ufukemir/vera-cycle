// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Vera';

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
  String get commonYes => 'Yes';

  @override
  String get commonNo => 'No';

  @override
  String get commonNotSure => 'Not sure';

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
      'Your cycle data stays only on this device, encrypted. There\'s no account and no cloud sync — nothing you log is ever uploaded. The key lives in your phone\'s secure hardware, and you can export or erase everything whenever you want.';

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
  String get onboardingGoalTitle => 'What brings you here?';

  @override
  String get onboardingGoalBody =>
      'This just helps us show you the right things first — you can change your mind anytime in Settings.';

  @override
  String get goalTrackPeriod => 'Track my period';

  @override
  String get goalTryingToConceive => 'Trying to conceive';

  @override
  String get goalPregnancyTracking => 'Tracking a pregnancy';

  @override
  String get onboardingRegularityTitle => 'Are your periods usually regular?';

  @override
  String get onboardingRegularityBody =>
      'No wrong answer here — this just helps us get to know your body a little.';

  @override
  String get onboardingCrampsTitle => 'Do you usually get cramps?';

  @override
  String get onboardingCrampsBody =>
      'We\'ll make sure it\'s easy to log how you\'re feeling on days like that.';

  @override
  String get onboardingNotificationTitle => 'Would you like gentle reminders?';

  @override
  String get onboardingNotificationBody =>
      'We can nudge you before your period is expected.';

  @override
  String get onboardingNotificationMockTitle => 'Your period may start soon';

  @override
  String get onboardingNotificationMockBody => 'Based on your logged cycles';

  @override
  String get onboardingNotificationAllow => 'Turn on reminders';

  @override
  String get onboardingNotificationNotNow => 'Not now';

  @override
  String get onboardingBuildingPlanTitle => 'Setting things up for you';

  @override
  String get onboardingBuildingPlanStep1 => 'Securing your data on this device';

  @override
  String get onboardingBuildingPlanStep2 => 'Saving your preferences';

  @override
  String get onboardingBuildingPlanStep3 => 'Getting your calendar ready';

  @override
  String get onboardingBuildingPlanDone => 'All set';

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
  String get symptomPelvicPain => 'Pelvic pain';

  @override
  String get symptomDizziness => 'Dizziness';

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
  String get moodHappy => 'Happy';

  @override
  String get moodContent => 'Content';

  @override
  String get moodSad => 'Sad';

  @override
  String get moodDepressed => 'Depressed';

  @override
  String get moodEmotional => 'Emotional';

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
  String get calendarLegendOvulation => 'Estimated ovulation';

  @override
  String get dayDetailFertileTitle => 'In your estimated fertile window';

  @override
  String get dayDetailOvulationTitle => 'Estimated ovulation day';

  @override
  String get dayDetailOvulationBody =>
      'Pregnancy is typically more likely around this day, based on usual timing — this is an estimate, not a guarantee.';

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
  String get settingsLanguageSystem => 'System language';

  @override
  String get settingsLanguageEnglish => 'English';

  @override
  String get settingsLanguageTurkish => 'Türkçe';

  @override
  String get settingsLanguageArabic => 'العربية';

  @override
  String get settingsLanguageSpanish => 'Español';

  @override
  String get settingsLanguageFrench => 'Français';

  @override
  String get settingsLanguageGerman => 'Deutsch';

  @override
  String get settingsLanguageIndonesian => 'Bahasa Indonesia';

  @override
  String get settingsLanguagePortuguese => 'Português';

  @override
  String get settingsLanguageItalian => 'Italiano';

  @override
  String get settingsLanguageRussian => 'Русский';

  @override
  String get settingsLanguageHindi => 'हिन्दी';

  @override
  String get settingsLanguageJapanese => '日本語';

  @override
  String get settingsLanguageKorean => '한국어';

  @override
  String get settingsLanguageChinese => '简体中文';

  @override
  String get settingsLanguageUrdu => 'اردو';

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
  String get settingsRemindersPeriodEndLabel =>
      'Check in when my period should be ending';

  @override
  String get settingsRemindersMedicationLabel => 'Medication reminder';

  @override
  String get settingsRemindersWaterLabel => 'Water reminder';

  @override
  String get settingsRemindersAppointmentLabel => 'Appointment reminder';

  @override
  String get settingsRemindersAppointmentSet => 'Set date & time';

  @override
  String get settingsRemindersAppointmentClear => 'Clear';

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
  String get settingsBreastExamToggle => 'Self breast exam';

  @override
  String get settingsCervixToggle => 'Cervix position & firmness';

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
      'This app has no server of its own and no account system — your logs are never uploaded. The free version does include Google ads, which connect to the internet; they never receive anything you log.';

  @override
  String get privacyScreenNoThirdParty =>
      'There\'s no analytics, no crash reporting, and no tracking SDK. The only third-party component is Google\'s ad SDK in the free version — Premium removes it entirely.';

  @override
  String get privacyScreenExport =>
      'The only way your data ever leaves this device is if you export it yourself, and that export is encrypted with a password only you know.';

  @override
  String get privacyScreenDelete =>
      'Deleting your data is real and immediate. There\'s no account and no backup on our end — once it\'s gone, it\'s gone.';

  @override
  String get adPlaceholderLabel => 'Ad space';

  @override
  String get adPlaceholderUpgradeCta => 'Go ad-free with Premium';

  @override
  String get reminderNotificationTitle => 'Your period may be starting soon';

  @override
  String get reminderNotificationBody =>
      'Based on your logged cycles, your estimated window is coming up.';

  @override
  String get reminderPeriodEndTitle => 'Your period may be wrapping up';

  @override
  String get reminderPeriodEndBody =>
      'If it\'s still going, that\'s completely normal — just a gentle check-in.';

  @override
  String get reminderMedicationTitle => 'Medication reminder';

  @override
  String get reminderMedicationBody => 'Time to take your medication.';

  @override
  String get reminderWaterTitle => 'Stay hydrated';

  @override
  String get reminderWaterBody => 'A little water reminder.';

  @override
  String get reminderAppointmentTitle => 'Upcoming appointment';

  @override
  String get reminderAppointmentBody => 'You have an appointment coming up.';

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
  String get exportInvalidFile => 'That file doesn\'t look like a Vera backup';

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
      'Generated by Vera from user-entered data. Not a medical diagnosis.';

  @override
  String get doctorReportGeneratedOn => 'Generated on';

  @override
  String get doctorReportSummaryHeading => 'Summary';

  @override
  String get doctorReportDailyLogHeading => 'Daily log';

  @override
  String get doctorReportColumnDate => 'Date';

  @override
  String get doctorReportTimelineHeading => 'Cycle timeline';

  @override
  String get doctorReportCycleLabel => 'Cycle';

  @override
  String get doctorReportTimelineLegendPeriod => 'Period';

  @override
  String get doctorReportTimelineLegendCycle => 'Rest of cycle';

  @override
  String get doctorReportTimelineOngoing => 'Ongoing';

  @override
  String get dailyInsightLabel => 'Did you know?';

  @override
  String get insightMenstrual1 =>
      'Your uterine lining is shedding right now — most periods last 3 to 7 days, and that\'s completely normal.';

  @override
  String get insightMenstrual2 =>
      'Iron-rich foods like leafy greens and lentils can help offset what your body loses this week.';

  @override
  String get insightFollicular1 =>
      'Estrogen is rising, and many people notice more energy and better focus starting around now.';

  @override
  String get insightFollicular2 =>
      'Your body is preparing an egg for release — this phase can last anywhere from a week to a few weeks.';

  @override
  String get insightFertile1 =>
      'This is your estimated fertile window — the days around ovulation when pregnancy is most likely, based on typical timing.';

  @override
  String get insightFertile2 =>
      'Some people notice a slight rise in basal body temperature or changes in cervical mucus around ovulation.';

  @override
  String get insightLuteal1 =>
      'Progesterone rises after ovulation — this is often when PMS symptoms like mood changes or bloating show up.';

  @override
  String get insightLuteal2 =>
      'If a pregnancy hasn\'t implanted, hormone levels drop near the end of this phase, triggering your next period.';

  @override
  String get insightUnknown1 =>
      'Cycle lengths vary a lot from person to person — anywhere from 21 to 35 days is considered typical.';

  @override
  String get insightsPhaseTipsTitle => 'May feel good in this phase';

  @override
  String get tipFitnessLabel => 'Movement';

  @override
  String get tipNutritionLabel => 'Nutrition';

  @override
  String get tipFitnessMenstrual =>
      'Gentle movement — walking, stretching, or restorative yoga — can feel better than intense workouts right now.';

  @override
  String get tipFitnessFollicular =>
      'Energy often climbs in this phase — a good window to try a new workout or push a bit harder.';

  @override
  String get tipFitnessFertile =>
      'Many people feel at their most energetic here — a good phase for higher-intensity training if that appeals to you.';

  @override
  String get tipFitnessLuteal =>
      'If energy dips later in this phase, lower-intensity strength work or swimming can feel more sustainable.';

  @override
  String get tipFitnessUnknown =>
      'Whatever movement feels good today is a good choice — there\'s no single \"right\" routine for every day.';

  @override
  String get tipNutritionMenstrual =>
      'Iron-rich foods like leafy greens, lentils, and red meat can help offset what your body loses this week.';

  @override
  String get tipNutritionFollicular =>
      'Lighter, fresh meals often sit well as energy rises — but there\'s no single \"right\" way to eat in this phase.';

  @override
  String get tipNutritionFertile =>
      'Staying hydrated and keeping meals balanced supports energy through this more active-feeling phase.';

  @override
  String get tipNutritionLuteal =>
      'Cravings can shift here — complex carbs and magnesium-rich foods like nuts and dark chocolate are common go-tos.';

  @override
  String get tipNutritionUnknown =>
      'Balanced, regular meals are a solid default whenever your phase isn\'t clear yet.';

  @override
  String get predictionSettingsEntry => 'Prediction settings';

  @override
  String get predictionSettingsIntro =>
      'These are assumptions, shown openly. Once you\'ve logged 2 full cycles, your real prediction on Home is calculated from your own data — these numbers stop being used for that.';

  @override
  String get predictionSettingsPeriodLengthLabel => 'Typical period length';

  @override
  String get predictionSettingsCycleLengthLabel => 'Typical cycle length';

  @override
  String get predictionSettingsCycleLengthHint =>
      'Used to scale the ring on Home until we have real data.';

  @override
  String get predictionSettingsLutealLabel => 'Luteal phase length';

  @override
  String get predictionSettingsLutealHint =>
      'The typical days between ovulation and your next period. Used to place the estimated fertile window — this one keeps being used even after real predictions start.';

  @override
  String get dayLogEnergyLabel => 'Energy';

  @override
  String get energyLevelLow => 'Low';

  @override
  String get energyLevelMedium => 'Medium';

  @override
  String get energyLevelHigh => 'High';

  @override
  String get energyLevelEnergetic => 'Energized';

  @override
  String get dayLogSkinHairLabel => 'Skin & hair';

  @override
  String get skinHealthyGlow => 'Healthy glow';

  @override
  String get skinRedness => 'Redness';

  @override
  String get skinDryness => 'Dryness';

  @override
  String get skinOiliness => 'Oiliness';

  @override
  String get hairGoodDay => 'Good hair day';

  @override
  String get hairBadDay => 'Bad hair day';

  @override
  String get hairLoss => 'Hair loss';

  @override
  String get scalpOily => 'Oily scalp';

  @override
  String get dayLogBreastExamLabel => 'Self breast exam';

  @override
  String get breastExamAllNormal => 'Nothing unusual';

  @override
  String get breastExamLump => 'Lump';

  @override
  String get breastExamIndentation => 'Indentation';

  @override
  String get breastExamRedness => 'Redness';

  @override
  String get breastExamCrackedNipple => 'Cracked nipple';

  @override
  String get breastExamDischarge => 'Discharge';

  @override
  String get cervixPositionLabel => 'Cervix position';

  @override
  String get cervixPositionLow => 'Low';

  @override
  String get cervixPositionMedium => 'Medium';

  @override
  String get cervixPositionHigh => 'High';

  @override
  String get cervixOpeningLabel => 'Cervix opening';

  @override
  String get cervixOpeningClosed => 'Closed';

  @override
  String get cervixOpeningMedium => 'Medium';

  @override
  String get cervixOpeningOpen => 'Open';

  @override
  String get cervixFirmnessLabel => 'Cervix firmness';

  @override
  String get cervixFirmnessSoft => 'Soft';

  @override
  String get cervixFirmnessMedium => 'Medium';

  @override
  String get cervixFirmnessFirm => 'Firm';

  @override
  String get dayLogWaterLabel => 'Water';

  @override
  String get dayLogSleepLabel => 'Sleep';

  @override
  String get dayLogWeightLabel => 'Weight';

  @override
  String get dayLogMedicationsLabel => 'Medication';

  @override
  String get dayLogAddMedication => 'Add medication';

  @override
  String get dayLogMedicationNameHint => 'Medication name';

  @override
  String get navAssistant => 'Assistant';

  @override
  String get assistantTitle => 'Vera Assistant';

  @override
  String get assistantInputHint => 'Ask about your cycle…';

  @override
  String get assistantIntro =>
      'Hi! I can answer questions about periods, cycles, and how Vera works — right here on your phone, nothing leaves your device. I\'m not a doctor and this isn\'t medical advice.';

  @override
  String get insightMenstrual3 =>
      'Period blood isn\'t \"dirty blood\" — it\'s a mix of blood and uterine lining, a completely normal part of the cycle.';

  @override
  String get insightMenstrual4 =>
      'Gentle heat on the lower belly genuinely eases cramps — a warm water bottle is an evidence-backed classic.';

  @override
  String get insightMenstrual5 =>
      'Flow is often heaviest in the first two days and tapers off after — that pattern is typical.';

  @override
  String get insightMenstrual6 =>
      'Feeling a bit more tired during your period is common — iron leaves the body with menstrual blood.';

  @override
  String get insightFollicular3 =>
      'Estrogen is rebuilding your uterine lining after your period — your body is prepping fresh.';

  @override
  String get insightFollicular4 =>
      'Skin often looks its clearest in this phase as hormone levels settle.';

  @override
  String get insightFollicular5 =>
      'Endurance and reaction times peak in the late follicular phase for many people.';

  @override
  String get insightFollicular6 =>
      'This phase\'s length is what varies most between people — the luteal phase is far more constant.';

  @override
  String get insightFertile3 =>
      'An egg lives about 12–24 hours, but sperm can wait up to 5 days — that\'s why the fertile window spans several days.';

  @override
  String get insightFertile4 =>
      'Around ovulation, cervical mucus often turns clear and stretchy — like raw egg white.';

  @override
  String get insightFertile5 =>
      'Some people feel a brief one-sided twinge at ovulation — it even has a name: mittelschmerz.';

  @override
  String get insightFertile6 =>
      'Basal body temperature rises slightly *after* ovulation — it confirms it happened rather than predicting it.';

  @override
  String get insightLuteal3 =>
      'Progesterone peaks about a week after ovulation — bloating and breast tenderness around then are common.';

  @override
  String get insightLuteal4 =>
      'Craving carbs before your period is real — energy needs rise slightly in the luteal phase.';

  @override
  String get insightLuteal5 =>
      'PMS symptoms usually ease within a day or two after bleeding starts.';

  @override
  String get insightLuteal6 =>
      'A consistent sleep routine can noticeably soften late-luteal mood dips.';

  @override
  String get insightUnknown2 =>
      'Tracking just three cycles is often enough to see your own pattern emerge.';

  @override
  String get insightUnknown3 =>
      'Cycles are personal — comparing yours to a friend\'s rarely tells you anything useful.';

  @override
  String get insightUnknown4 =>
      'Stress, travel, and illness can all shift ovulation — a \"late\" period often just means late ovulation.';

  @override
  String get settingsThemeLabel => 'Theme';

  @override
  String get settingsThemeSystem => 'System';

  @override
  String get settingsThemeLight => 'Light';

  @override
  String get settingsThemeDark => 'Dark';

  @override
  String get settingsMascotLabel => 'Companion mascot';

  @override
  String get mascotDroplet => 'Droplet';

  @override
  String get mascotFlower => 'Flower';

  @override
  String get mascotMoon => 'Moon';

  @override
  String get mascotNone => 'None';

  @override
  String homeWindowCountdown(int days) {
    return 'Predicted window starts in about $days days';
  }

  @override
  String homeOvulationCountdown(int days) {
    return 'Estimated ovulation in about $days days';
  }

  @override
  String get homeQuickLogTitle => 'How does your body feel today?';

  @override
  String get actionSave => 'Save';

  @override
  String get insightsTrackerHubTitle => 'Your trackers';

  @override
  String get trackerHistoryEmpty => 'No entries in this range yet';

  @override
  String get rangeFilter1m => '1 mo';

  @override
  String get rangeFilter3m => '3 mo';

  @override
  String get rangeFilter6m => '6 mo';

  @override
  String get dayLogOvulationTestLabel => 'Ovulation test';

  @override
  String get ovulationTestNegative => 'Negative';

  @override
  String get ovulationTestPositive => 'Positive';

  @override
  String get settingsOvulationTestToggle => 'Ovulation test';

  @override
  String get settingsRemindersOvulationLabel => 'Fertile window heads-up';

  @override
  String get reminderOvulationTitle => 'Estimated fertile window approaching';

  @override
  String get reminderOvulationBody =>
      'Based on your logged cycles, your estimated fertile window may start soon.';

  @override
  String trackerEntriesCount(int count) {
    return '$count entries';
  }

  @override
  String get assistantTyping => 'Vera is typing…';

  @override
  String get premiumTitle => 'Vera Premium';

  @override
  String get premiumHeadline => 'Vera Premium';

  @override
  String get premiumSubhead =>
      'Every tracking feature stays free forever — your history is never locked away. Premium adds your own trackers, deeper insights, your own reminders and extra looks, and removes the ads.';

  @override
  String get premiumBenefitNoAds => 'No ads, anywhere in the app';

  @override
  String get premiumBenefitSupport =>
      'Supports an independent, privacy-first app';

  @override
  String get premiumMonthly => 'Monthly';

  @override
  String get premiumYearly => 'Yearly';

  @override
  String get premiumYearlyNote => 'Billed once a year';

  @override
  String get premiumSubscribeCta => 'Continue';

  @override
  String get premiumRestore => 'Restore purchase';

  @override
  String get premiumCancelNote =>
      'Cancel anytime in your app store account. No countdowns, no pressure — if now isn\'t the time, the free version keeps working exactly as it does today.';

  @override
  String get premiumActiveBadge => 'Premium is active';

  @override
  String get premiumDevToggle => 'Simulate Premium (development)';

  @override
  String get settingsPremiumEntry => 'Vera Premium';

  @override
  String get adTestNotice => 'Test ad — not a real placement yet';

  @override
  String get settingsPregnancyModeLabel => 'Pregnancy mode';

  @override
  String get pregnancyLmpLabel => 'First day of last period';

  @override
  String pregnancyWeekLabel(int weeks, int days) {
    return 'Week $weeks, day $days';
  }

  @override
  String get pregnancyDueDateLabel => 'Estimated due date';

  @override
  String pregnancyDaysLeft(int days) {
    return 'About $days days to go';
  }

  @override
  String pregnancyTrimesterLabel(int n) {
    return 'Trimester $n';
  }

  @override
  String get pregnancyDisclaimer =>
      'Dates are estimated from your last period using the standard 280-day rule. An ultrasound gives a more accurate date, and late ovulation shifts these numbers — this is information, not medical care.';

  @override
  String get pregnancyWeeklyNoteTitle => 'This week';

  @override
  String get pregnancyNeedsLmp =>
      'Add the first day of your last period to start tracking.';

  @override
  String get pregnancyOutOfRange =>
      'That date is more than 42 weeks ago — update it or turn pregnancy mode off.';

  @override
  String get partnerShareTitle => 'Share a summary with a partner';

  @override
  String get partnerShareBody =>
      'Creates a short text summary — your current phase and estimated window — that you send yourself through any app. There\'s no live sync and no partner account: nothing is shared unless you send it.';

  @override
  String get partnerShareCta => 'Create summary';

  @override
  String get partnerSummaryHeader => 'Cycle summary from Vera';

  @override
  String get settingsHomeThemeLabel => 'Home background';

  @override
  String get homeThemeWheat => 'Wheat';

  @override
  String get homeThemeSky => 'Sky';

  @override
  String get homeThemeField => 'Field';

  @override
  String get homeThemeBlossom => 'Blossom';

  @override
  String get homeThemePlain => 'Plain';

  @override
  String get backupNudgeTitle => 'Keep a copy of your data';

  @override
  String get backupNudgeBody =>
      'Everything lives only on this phone. If it\'s lost, broken, or reset, your history goes with it — an encrypted backup takes a moment and only you can open it.';

  @override
  String get backupNudgeCta => 'Back up now';

  @override
  String get backupNudgeDismiss => 'Later';

  @override
  String backupLastDone(String date) {
    return 'Last backup: $date';
  }

  @override
  String get backupNever => 'No backup yet';

  @override
  String get settingsRemindersBackupLabel => 'Remind me to back up';

  @override
  String get reminderBackupTitle => 'Time to back up Vera';

  @override
  String get reminderBackupBody =>
      'Your history only exists on this phone. A quick encrypted backup keeps it safe.';

  @override
  String get calendarDayDetailTitle => 'This day';

  @override
  String get calendarDayNothingLogged => 'Nothing logged for this day yet';

  @override
  String get calendarDayOpenLog => 'Open day log';

  @override
  String get cycleHistoryTitle => 'Past cycles';

  @override
  String get cycleHistoryEmpty =>
      'Log a couple of periods and your cycle history shows up here.';

  @override
  String get cycleHistoryOngoing => 'Ongoing';

  @override
  String cycleHistoryLength(int days) {
    return '$days day cycle';
  }

  @override
  String cycleHistoryPeriodLength(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: 'Period lasted $days days',
      one: 'Period lasted 1 day',
    );
    return '$_temp0';
  }

  @override
  String cycleHistoryVsAverage(String diff) {
    return '$diff vs your average';
  }

  @override
  String get insightsCycleHistoryEntry => 'Past cycles';

  @override
  String get homeEmptyTitle => 'Let\'s start with your last period';

  @override
  String get homeEmptyBody =>
      'Tap the button above on the day your period starts. After two full cycles Vera can start estimating — until then it won\'t pretend to know.';

  @override
  String get homeEmptyBackdate => 'It already started earlier';

  @override
  String get settingsAdPrivacyEntry => 'Ad privacy options';

  @override
  String a11yCycleRing(int day, int length) {
    return 'Cycle day $day of about $length';
  }

  @override
  String a11yChartSummary(int count, String min, String max) {
    return 'Chart with $count entries, from $min to $max';
  }

  @override
  String a11yPhaseBar(int day, int length) {
    return 'Cycle progress: day $day of about $length';
  }

  @override
  String a11yFrequencyItem(String label, int count) {
    return '$label: $count times';
  }

  @override
  String get importTitle => 'Import from another app';

  @override
  String get importBody =>
      'Export your history from your old tracker as a CSV, then pick the file here. Only dates and flow are imported — symptom and mood wording differs between apps, and Vera won\'t guess what you meant.';

  @override
  String get importPickFile => 'Choose CSV file';

  @override
  String importPreview(int count) {
    return 'Found $count days of history';
  }

  @override
  String importSkipped(int count) {
    return '$count rows couldn\'t be read and will be left out';
  }

  @override
  String get importConfirm => 'Add to my history';

  @override
  String get importMergeNote =>
      'Imported days are merged in. Days you already logged in Vera are kept as they are.';

  @override
  String importDone(int count) {
    return 'Imported $count days';
  }

  @override
  String get importErrorEmpty => 'That file looks empty.';

  @override
  String get importErrorNoDate => 'Couldn\'t find a date column in that file.';

  @override
  String get settingsImportEntry => 'Import from another app';

  @override
  String get settingsHealthSyncLabel => 'Sync to Apple Health / Health Connect';

  @override
  String get settingsHealthSyncBody =>
      'Writes only period flow, weight, and basal temperature to your phone\'s health app. Symptoms, moods, and notes stay in Vera. Nothing is read back.';

  @override
  String healthSyncBackfilled(int count) {
    return 'Sent $count days to your health app';
  }

  @override
  String get healthSyncDenied =>
      'Permission wasn\'t granted, so sync stays off.';

  @override
  String get settingsDiagnosticsEntry => 'Diagnostics';

  @override
  String get diagnosticsBody =>
      'If the app misbehaves, the technical details are recorded here — on this device only. Nothing is sent anywhere unless you choose to send it, and you can read exactly what you\'d be sending first.';

  @override
  String get diagnosticsEmpty =>
      'Nothing recorded — no problems have been detected.';

  @override
  String get diagnosticsShare => 'Send to the developer';

  @override
  String get diagnosticsClear => 'Clear';

  @override
  String get unitHoursShort => 'h';

  @override
  String get unitMinutesShort => 'm';

  @override
  String get unitHoursLong => 'hours';

  @override
  String get unitMinutesLong => 'minutes';

  @override
  String get unitMilliliters => 'ml';

  @override
  String get unitKilograms => 'kg';

  @override
  String get calendarJumpTitle => 'Jump to month';

  @override
  String get calendarJumpYearLabel => 'Year';

  @override
  String get settingsAdPrivacyUnavailable =>
      'Ad personalisation choices aren\'t offered in your region — ads here are already non-personalised.';

  @override
  String get settingsGroupAppearance => 'Appearance';

  @override
  String get settingsGroupTracking => 'Tracking preferences';

  @override
  String get dayLogCustomTagsLabel => 'My own trackers';

  @override
  String get customTagAddButton => 'Add a tracker';

  @override
  String get customTagDialogTitle => 'New tracker';

  @override
  String get customTagDialogHint => 'e.g. migraine, gym, insomnia';

  @override
  String get customTagManageEntry => 'Manage my trackers';

  @override
  String get customTagRenameTitle => 'Rename tracker';

  @override
  String get customTagDeleteTitle => 'Delete this tracker?';

  @override
  String get customTagDeleteBody =>
      'It will be removed from every day you used it. Your other entries stay as they are.';

  @override
  String get customTagEmpty => 'No trackers of your own yet.';

  @override
  String get premiumLockedTitle => 'Premium feature';

  @override
  String get premiumLockedAction => 'See Premium';

  @override
  String get premiumBenefitCustomTrackers =>
      'Track anything you want, in your own words';

  @override
  String get premiumBenefitAdvancedInsights =>
      'Advanced insights: what tends to happen, and when';

  @override
  String get premiumBenefitPersonalisation =>
      'Extra backgrounds and companions';

  @override
  String get premiumBenefitAdvancedReminders =>
      'Reminders on your own schedule';

  @override
  String get advancedInsightsTitle => 'Advanced insights';

  @override
  String get advancedInsightsEntry => 'Advanced insights';

  @override
  String get advancedInsightsNotEnough =>
      'Log three full cycles and your patterns will appear here. Fewer than that and any \"pattern\" would just be coincidence.';

  @override
  String get advancedInsightsPatternsTitle => 'When things tend to show up';

  @override
  String advancedInsightsPatternLine(String label, String segment) {
    return '$label — most often $segment';
  }

  @override
  String advancedInsightsPatternDetail(int count, int day) {
    return '$count days logged, around day $day of your cycle';
  }

  @override
  String advancedInsightsNoPattern(String label) {
    return '$label — no clear timing yet';
  }

  @override
  String get advancedInsightsTrendTitle => 'Cycle length over time';

  @override
  String advancedInsightsDriftLonger(String days, String cycles) {
    return 'Comparing your earliest $cycles cycles with your latest $cycles, the recent ones run about $days days longer.';
  }

  @override
  String advancedInsightsDriftShorter(String days, String cycles) {
    return 'Comparing your earliest $cycles cycles with your latest $cycles, the recent ones run about $days days shorter.';
  }

  @override
  String advancedInsightsDriftStable(String cycles) {
    return 'Comparing your earliest $cycles cycles with your latest $cycles, your cycle length has stayed about the same.';
  }

  @override
  String get advancedInsightsDriftNotEnough =>
      'Once you have six full cycles, Vera can compare your earliest ones with your most recent to see whether your cycle length is drifting.';

  @override
  String get advancedInsightsMoodTitle => 'Mood by part of the cycle';

  @override
  String get advancedInsightsDisclaimer =>
      'These are counts of what you logged, nothing more. They are not a diagnosis, and a pattern here is not a cause.';

  @override
  String get segmentPeriod => 'during your period';

  @override
  String get segmentAfterPeriod => 'after your period';

  @override
  String get segmentMidCycle => 'mid-cycle';

  @override
  String get segmentBeforePeriod => 'before your period';

  @override
  String get customRemindersEntry => 'My own reminders';

  @override
  String get customRemindersTitle => 'My own reminders';

  @override
  String get customRemindersEmpty => 'No reminders of your own yet.';

  @override
  String get customRemindersAdd => 'Add a reminder';

  @override
  String get customReminderLabelHint => 'e.g. take my pill, drink water';

  @override
  String get customReminderLockScreenNote =>
      'Reminder text appears on your lock screen, so keep it as private as you want it to be.';

  @override
  String get customReminderDelete => 'Delete reminder';

  @override
  String get homeThemeDusk => 'Dusk';

  @override
  String get homeThemeMeadow => 'Meadow';

  @override
  String get homeThemePetal => 'Petal';

  @override
  String get homeThemeBloom => 'Bloom';

  @override
  String get mascotStar => 'Star';

  @override
  String get mascotLeaf => 'Leaf';

  @override
  String get tipDetailWhatsHappening => 'What\'s happening in your body';

  @override
  String get tipDetailDisclaimer =>
      'This is general information, not personal medical advice. Every body responds differently, and how you actually feel matters more than anything suggested here. If something worries you, talk to a clinician.';

  @override
  String get phaseExplainerMenstrual =>
      'You are bleeding as the uterine lining sheds. Estrogen and progesterone are at their lowest point of the cycle, which is why many people feel more tired and more inward in the first days. Cramps come from the uterus contracting. Bleeding also costs you iron — which explains part of the fatigue.';

  @override
  String get phaseExplainerFollicular =>
      'After bleeding ends, estrogen starts climbing again. Most people notice energy, mood and stamina picking back up. Follicles are maturing in the ovaries; the body is preparing for the next ovulation.';

  @override
  String get phaseExplainerFertile =>
      'Estrogen is near its peak and ovulation is expected around these days. Cervical mucus typically turns clear and slippery, some people notice higher libido, and some feel a brief twinge on one side. Energy is often at its highest point in the cycle.';

  @override
  String get phaseExplainerLuteal =>
      'After ovulation progesterone rises, then drops sharply as your period approaches. That drop can trigger PMS symptoms: bloating, breast tenderness, appetite changes, broken sleep and mood swings. Your body temperature runs slightly higher.';

  @override
  String get phaseExplainerUnknown =>
      'There is not enough logged yet to say which phase you are in. Vera would rather say so than invent a phase. Once you have logged a few cycles this section fills in with your own data — until then, the suggestions below are general ones that apply at any point.';

  @override
  String get tipFitnessDetailMenstrual =>
      'Hard training does not suit most people in the first days, and that is not a discipline problem — your energy genuinely is lower. Walking, gentle stretching, restorative yoga and breathwork improve blood flow and can take the edge off cramps. If you feel good, there is no reason to avoid hard sessions: bleeding is not a reason to stop exercising. One practical note: long, demanding sessions on heavy days can deepen the fatigue, so adjust by how your body actually feels.';

  @override
  String get tipFitnessDetailFollicular =>
      'As estrogen rises most people feel stronger and more durable; this is usually the best stretch of the cycle to start something new, add weight, or push the pace. Muscle repair is relatively efficient here too. Still, build up gradually: high energy does not mean zero injury risk.';

  @override
  String get tipFitnessDetailFertile =>
      'Energy and motivation are usually at their peak, so demanding sessions tend to land well. Some people have slightly looser joints around ovulation, so a longer warm-up makes sense for sports with sharp changes of direction. A brief twinge on one side of the abdomen is common — but if it is severe or lasts, rest and check with a clinician.';

  @override
  String get tipFitnessDetailLuteal =>
      'As your period approaches, energy can drop, your heart rate can sit higher for the same effort, and recovery can take longer. That is an expected swing, not a decline. Moderate sessions, a slightly lighter version of your strength work, and walking are usually more sustainable here. With bloating and breast tenderness, a supportive bra and a longer warm-up make a real difference.';

  @override
  String get tipFitnessDetailUnknown =>
      'Even without knowing your phase, movement helps at any point: moderate activity spread across most days of the week beats occasional very intense sessions. Adjust to how you feel — on tired days, a walk counts. Once you have logged a few cycles you will see phase-specific suggestions here.';

  @override
  String get tipNutritionDetailMenstrual =>
      'Bleeding costs you iron; red meat, lentils, chickpeas, dark leafy greens and molasses help replace it. Plant iron absorbs markedly better alongside vitamin C — squeezing lemon over a lentil dish is the most practical version of that. Tea and coffee with a meal reduce iron absorption, so leaving an hour between them is enough. Drinking plenty of water can ease the fatigue and headaches that come with bleeding.';

  @override
  String get tipNutritionDetailFollicular =>
      'With energy recovering, the body is in rebuild mode: enough protein, whole grains and vegetables support that. It also makes sense to keep refilling iron stores after bleeding. Not skipping meals is usually easier in this phase, and it sets you up to enter the appetite swings of the next one more evenly.';

  @override
  String get tipNutritionDetailFertile =>
      'No special diet is needed here; balanced meals and enough water do the most work. Some people feel bloated, which is usually hormonal and passing. If you are planning a pregnancy, this is a sensible time to ask a clinician about folic acid — but that is a conversation with them, not advice an app should give.';

  @override
  String get tipNutritionDetailLuteal =>
      'Increased appetite and sugar cravings as progesterone rises are very common; that is a hormonal shift, not a willpower problem. Adding protein and fibre to meals keeps blood sugar steadier and softens the craving. Less salt and more water can ease bloating. Magnesium-rich foods (almonds, walnuts, dark greens, dark chocolate) reduce cramps and tension for some people. Cutting back on caffeine helps the broken sleep of this phase.';

  @override
  String get tipNutritionDetailUnknown =>
      'Whatever the phase, the same things help most: regular meals, enough protein, plenty of vegetables, enough water, and iron-rich foods. Since bleeding costs iron, paying a little more attention on those days is enough. Once you have logged a few cycles you will see phase-specific suggestions here.';
}
