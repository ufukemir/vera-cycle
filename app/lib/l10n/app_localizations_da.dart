// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Danish (`da`).
class AppLocalizationsDa extends AppLocalizations {
  AppLocalizationsDa([String locale = 'da']) : super(locale);

  @override
  String get appTitle => 'Vera';

  @override
  String get actionSkip => 'Spring over';

  @override
  String get actionContinue => 'Fortsæt';

  @override
  String get actionDone => 'Færdig';

  @override
  String get actionCancel => 'Annuller';

  @override
  String get actionClear => 'Ryd';

  @override
  String get actionDelete => 'Slet';

  @override
  String get actionEnable => 'Slå til';

  @override
  String get commonIDontKnow => 'Det ved jeg ikke';

  @override
  String get commonYes => 'Ja';

  @override
  String get commonNo => 'Nej';

  @override
  String get commonNotSure => 'Ikke sikker';

  @override
  String get pinSetupTitle => 'Opret en PIN';

  @override
  String get pinSetupEnterPrompt => 'Vælg en 6-cifret PIN til at låse appen';

  @override
  String get pinSetupConfirmPrompt => 'Indtast den igen for at bekræfte';

  @override
  String get pinSetupMismatch => 'De var ikke ens — lad os prøve igen';

  @override
  String get pinSetupBiometricTitle => 'Hurtigere oplåsning?';

  @override
  String get pinSetupBiometricBody =>
      'Du kan også bruge dit fingeraftryk eller ansigt til at låse op — din PIN virker stadig som reserve.';

  @override
  String get lockScreenTitle => 'Låst';

  @override
  String get lockScreenEnterPin => 'Indtast din PIN';

  @override
  String get lockScreenWrongPin => 'Den PIN passer ikke';

  @override
  String get lockScreenUseBiometrics => 'Brug biometri';

  @override
  String get lockScreenUseFaceId => 'Brug Face ID';

  @override
  String get lockScreenUseFingerprint => 'Brug fingeraftryk';

  @override
  String get lockScreenForgotPin => 'Glemt din PIN?';

  @override
  String get lockScreenForgotPinChoiceTitle => 'Hvordan vil du nulstille den?';

  @override
  String get lockScreenResetViaDevice => 'Bekræft med denne enhed';

  @override
  String get lockScreenResetViaDeviceBody =>
      'Dine data forbliver. Det er nok at bekræfte med telefonens egen lås — Face ID, fingeraftryk eller adgangskode.';

  @override
  String get lockScreenResetViaDeviceReason =>
      'Bekræft for at angive en ny PIN';

  @override
  String lockScreenThrottled(int seconds) {
    return 'For mange forsøg. Prøv igen om $seconds s';
  }

  @override
  String get lockScreenEraseTitle => 'Slet alle data?';

  @override
  String get lockScreenEraseBody =>
      'Dette sletter permanent alt på denne enhed. Der er ingen konto og ingen sikkerhedskopi på en server, så det kan ikke fortrydes.';

  @override
  String get lockScreenEraseConfirm => 'Slet alt';

  @override
  String get onboardingPrivacyTitle => 'Velkommen';

  @override
  String get onboardingPrivacyBody =>
      'Dine cyklusdata bliver kun på denne enhed, krypteret. Der er ingen konto og ingen skysynkronisering — intet af det, du noterer, bliver uploadet. Nøglen ligger i telefonens sikre hardware, og du kan eksportere eller slette alt, når du vil.';

  @override
  String get onboardingLastPeriodTitle =>
      'Hvornår begyndte din sidste menstruation?';

  @override
  String get onboardingLastPeriodBody =>
      'Det hjælper os i gang — du kan altid rette det senere fra kalenderen.';

  @override
  String get onboardingPickDate => 'Vælg en dato';

  @override
  String get onboardingCycleLengthTitle => 'Hvor lang er din cyklus typisk?';

  @override
  String get onboardingCycleLengthBody =>
      'Et omtrentligt tal er fint. Vi begynder at give dig et rigtigt estimat, når vi har set et par hele cyklusser.';

  @override
  String get onboardingPeriodLengthTitle =>
      'Hvor mange dage varer din menstruation som regel?';

  @override
  String get onboardingPeriodLengthBody =>
      'Vi bruger det til at udfylde din seneste menstruation, så du ikke starter fra nul.';

  @override
  String get onboardingDaysUnit => 'dage';

  @override
  String get onboardingGoalTitle => 'Hvad bringer dig hertil?';

  @override
  String get onboardingGoalBody =>
      'Det hjælper os bare med at vise dig det rigtige først — du kan skifte mening når som helst i Indstillinger.';

  @override
  String get goalTrackPeriod => 'Følge min menstruation';

  @override
  String get goalTryingToConceive => 'Prøver at blive gravid';

  @override
  String get goalPregnancyTracking => 'Følge en graviditet';

  @override
  String get onboardingRegularityTitle =>
      'Er din menstruation som regel regelmæssig?';

  @override
  String get onboardingRegularityBody =>
      'Der er ingen forkerte svar her — det hjælper os bare med at lære din krop lidt at kende.';

  @override
  String get onboardingCrampsTitle => 'Får du som regel menstruationssmerter?';

  @override
  String get onboardingCrampsBody =>
      'Vi sørger for, at det er nemt at notere, hvordan du har det på sådan nogle dage.';

  @override
  String get onboardingBirthYearTitle => 'Hvilket år er du født?';

  @override
  String get onboardingBirthYearBody =>
      'Kun for et mere fuldstændigt billede — bruges aldrig til nogen forudsigelse.';

  @override
  String get onboardingPmsTitle =>
      'Er der noget, der plejer at vise sig forinden?';

  @override
  String get onboardingPmsBody =>
      'Vælg lige så mange, som passer. Gemmes ingen steder, der er intet forkert svar.';

  @override
  String get onboardingNotificationTitle => 'Vil du have blide påmindelser?';

  @override
  String get onboardingNotificationBody =>
      'Vi kan give dig et lille praj, før din menstruation ventes.';

  @override
  String get onboardingNotificationMockTitle =>
      'Din menstruation begynder måske snart';

  @override
  String get onboardingNotificationMockBody =>
      'Baseret på de cyklusser, du har noteret';

  @override
  String get onboardingNotificationAllow => 'Slå påmindelser til';

  @override
  String get onboardingNotificationNotNow => 'Ikke nu';

  @override
  String get onboardingBuildingPlanTitle => 'Gør klar til dig';

  @override
  String get onboardingBuildingPlanStep1 => 'Sikrer dine data på denne enhed';

  @override
  String get onboardingBuildingPlanStep2 => 'Gemmer dine præferencer';

  @override
  String get onboardingBuildingPlanStep3 => 'Gør din kalender klar';

  @override
  String get onboardingBuildingPlanDone => 'Alt er klar';

  @override
  String get navHome => 'Hjem';

  @override
  String get navCalendar => 'Kalender';

  @override
  String get navInsights => 'Indsigt';

  @override
  String get navSettings => 'Indstillinger';

  @override
  String get navReminders => 'Påmindelser';

  @override
  String get navProfile => 'Profil';

  @override
  String get navTrack => 'Registrér';

  @override
  String homeCycleDayLabel(int day) {
    return 'Dag $day';
  }

  @override
  String get homeNoCycleYet => 'Ingen menstruation noteret endnu';

  @override
  String get homePhaseMenstrual => 'Menstruation';

  @override
  String get homePhaseFollicular => 'Follikelfase';

  @override
  String get homePhaseFertileWindow => 'Estimeret frugtbart vindue';

  @override
  String get homePhaseLuteal => 'Lutealfase';

  @override
  String get homePhaseUnknown => 'Ikke nok nye data';

  @override
  String get homePredictionInsufficientTitle => 'Ikke nok data endnu';

  @override
  String get homePredictionInsufficientBody =>
      'Notér din næste menstruation, så begynder vi at estimere.';

  @override
  String homePredictionRangeLabel(String start, String end) {
    return '$start – $end';
  }

  @override
  String get homeConfidenceHigh => 'Høj sikkerhed';

  @override
  String get homeConfidenceMedium => 'Middel sikkerhed';

  @override
  String get homeConfidenceLow => 'Lav sikkerhed';

  @override
  String get homeIrregularNote =>
      'Din cykluslængde har varieret mere end normalt på det seneste. Hvis det er nyt for dig, kan det være værd at nævne ved et lægebesøg.';

  @override
  String get homeFertileWindowDisclaimer =>
      'Baseret på et typisk cyklusforløb — ikke en præventionsmetode.';

  @override
  String get homePeriodStartedButton => 'Menstruation begyndte i dag';

  @override
  String get homePeriodStartedSnackbar =>
      'Noteret — menstruation begyndte i dag';

  @override
  String get actionUndo => 'Fortryd';

  @override
  String get comingSoon => 'Kommer snart';

  @override
  String get dayLogFlowLabel => 'Blødning';

  @override
  String get flowSpotting => 'Pletblødning';

  @override
  String get flowLight => 'Let';

  @override
  String get flowMedium => 'Moderat';

  @override
  String get flowHeavy => 'Kraftig';

  @override
  String get flowNone => 'Ingen';

  @override
  String get dayLogSymptomsLabel => 'Symptomer';

  @override
  String get symptomCramps => 'Menstruationssmerter';

  @override
  String get symptomHeadache => 'Hovedpine';

  @override
  String get symptomBloating => 'Oppustethed';

  @override
  String get symptomBreastTenderness => 'Ømme bryster';

  @override
  String get symptomAcne => 'Akne';

  @override
  String get symptomFatigue => 'Træthed';

  @override
  String get symptomNausea => 'Kvalme';

  @override
  String get symptomBackPain => 'Rygsmerter';

  @override
  String get symptomAppetiteChange => 'Ændret appetit';

  @override
  String get symptomSleepTrouble => 'Søvnbesvær';

  @override
  String get symptomPelvicPain => 'Smerter i underlivet';

  @override
  String get symptomDizziness => 'Svimmelhed';

  @override
  String get symptomMigraine => 'Migræne';

  @override
  String get symptomHighFever => 'Høj feber';

  @override
  String get symptomNeckPain => 'Nakkesmerter';

  @override
  String get symptomShoulderPain => 'Skuldersmerter';

  @override
  String get symptomLimbPain => 'Smerter i lemmer';

  @override
  String get symptomMuscleAche => 'Muskelsmerter';

  @override
  String get symptomChills => 'Kulderystelser';

  @override
  String get symptomNightSweats => 'Nattesved';

  @override
  String get symptomHotFlashes => 'Hedeture';

  @override
  String get symptomWeightGain => 'Vægtøgning';

  @override
  String get symptomConstipation => 'Forstoppelse';

  @override
  String get symptomDiarrhea => 'Diarré';

  @override
  String get symptomIndigestion => 'Fordøjelsesbesvær';

  @override
  String get symptomGasPain => 'Luftsmerter';

  @override
  String get symptomFeelingUnwell => 'Utilpashed';

  @override
  String get symptomItching => 'Kløe';

  @override
  String get symptomTroubleFocusing => 'Koncentrationsbesvær';

  @override
  String get symptomForgetfulness => 'Glemsomhed';

  @override
  String get symptomGroupHead => 'Hoved';

  @override
  String get symptomGroupBody => 'Krop';

  @override
  String get symptomGroupAbdomen => 'Mave';

  @override
  String get symptomGroupGeneral => 'Generelt';

  @override
  String get symptomGroupCognitive => 'Kognitiv';

  @override
  String get dayLogMoodLabel => 'Humør';

  @override
  String get moodCalm => 'Rolig';

  @override
  String get moodAnxious => 'Ængstelig';

  @override
  String get moodIrritable => 'Irritabel';

  @override
  String get moodLow => 'Nedtrykt';

  @override
  String get moodEnergetic => 'Energisk';

  @override
  String get moodHappy => 'Glad';

  @override
  String get moodContent => 'Tilfreds';

  @override
  String get moodSad => 'Ked af det';

  @override
  String get moodDepressed => 'Deprimeret';

  @override
  String get moodEmotional => 'Følelsesladet';

  @override
  String get moodExcited => 'Begejstret';

  @override
  String get moodHopeful => 'Håbefuld';

  @override
  String get moodProud => 'Stolt';

  @override
  String get moodDisappointed => 'Skuffet';

  @override
  String get moodConfident => 'Selvsikker';

  @override
  String get moodSurprised => 'Overrasket';

  @override
  String get moodIndifferent => 'Ligeglad';

  @override
  String get moodPeaceful => 'Fredfyldt';

  @override
  String get moodInLove => 'Forelsket';

  @override
  String get moodShy => 'Genert';

  @override
  String get moodPlayful => 'Legesyg';

  @override
  String get moodExhausted => 'Udmattet';

  @override
  String get moodLonely => 'Ensom';

  @override
  String get moodOverwhelmed => 'Overvældet';

  @override
  String get moodGrateful => 'Taknemmelig';

  @override
  String get moodNostalgic => 'Nostalgisk';

  @override
  String get dayLogNoteLabel => 'Note';

  @override
  String get dayLogNoteHint => 'Alt, du vil huske om i dag';

  @override
  String get dayLogOptionalTrackersLabel => 'Valgfri målinger';

  @override
  String get dayLogSexualActivityLabel => 'Seksuel aktivitet';

  @override
  String get sexLifeNone => 'Intet';

  @override
  String get sexLifeUnprotected => 'Ubeskyttet sex';

  @override
  String get sexLifeProtected => 'Beskyttet sex';

  @override
  String get sexLifeMasturbation => 'Onani';

  @override
  String get sexLifeNoOrgasm => 'Ingen orgasme';

  @override
  String get sexLifeOrgasm => 'Orgasme';

  @override
  String get sexLifeHighDesire => 'Høj lyst';

  @override
  String get dayLogBbtLabel => 'Basaltemperatur';

  @override
  String get dayLogMucusLabel => 'Cervixslim';

  @override
  String get mucusDry => 'Tørt';

  @override
  String get mucusSticky => 'Klistret';

  @override
  String get mucusCreamy => 'Cremet';

  @override
  String get mucusWatery => 'Vandigt';

  @override
  String get mucusEggWhite => 'Æggehvide';

  @override
  String get dayLogSavedIndicator => 'Gemt';

  @override
  String get homeOpenTodayLog => 'Tilføj detaljer for i dag';

  @override
  String get calendarLegendActual => 'Noteret menstruation';

  @override
  String get calendarLegendPredicted => 'Forudsagt vindue';

  @override
  String get calendarLegendFertile => 'Estimeret frugtbart vindue';

  @override
  String get calendarLegendOvulation => 'Estimeret ægløsning';

  @override
  String get dayDetailFertileTitle => 'I dit estimerede frugtbare vindue';

  @override
  String get dayDetailOvulationTitle => 'Estimeret ægløsningsdag';

  @override
  String get dayDetailOvulationBody =>
      'Graviditet er typisk mere sandsynlig omkring denne dag ud fra et sædvanligt forløb — det er et estimat, ikke en garanti.';

  @override
  String get insightsCyclesLoggedLabel => 'Noterede cyklusser';

  @override
  String get insightsAveragePeriodLengthLabel =>
      'Gennemsnitlig menstruationslængde';

  @override
  String get insightsAverageCycleLengthLabel => 'Gennemsnitlig cykluslængde';

  @override
  String insightsVariabilityLabel(num days) {
    final intl.NumberFormat daysNumberFormat =
        intl.NumberFormat.decimalPatternDigits(
          locale: localeName,
          decimalDigits: 1,
        );
    final String daysString = daysNumberFormat.format(days);

    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: 'Varierer med omkring $daysString dage',
      one: 'Varierer med omkring $daysString dag',
    );
    return '$_temp0';
  }

  @override
  String get insightsNotEnoughDataTitle => 'Ikke nok data endnu';

  @override
  String get insightsNotEnoughDataBody =>
      'Notér et par hele cyklusser, så dukker dine gennemsnit op her.';

  @override
  String get insightsSymptomFrequencyTitle => 'Symptomer efter cyklusdag';

  @override
  String get insightsNoSymptomsLogged => 'Ingen symptomer noteret endnu';

  @override
  String get settingsLanguageLabel => 'Sprog';

  @override
  String get settingsLanguageSystem => 'Systemsprog';

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
  String get settingsLanguageDutch => 'Nederlands';

  @override
  String get settingsLanguageSwedish => 'Svenska';

  @override
  String get settingsLanguageNorwegian => 'Norsk bokmål';

  @override
  String get settingsLanguageDanish => 'Dansk';

  @override
  String get settingsLanguagePolish => 'Polski';

  @override
  String get settingsLanguageUkrainian => 'Українська';

  @override
  String get settingsLanguageCzech => 'Čeština';

  @override
  String get settingsLanguageHungarian => 'Magyar';

  @override
  String get settingsLanguageRomanian => 'Română';

  @override
  String get settingsLanguageFinnish => 'Suomi';

  @override
  String get settingsLanguageGreek => 'Ελληνικά';

  @override
  String get settingsLanguageMalay => 'Bahasa Melayu';

  @override
  String get tourSkip => 'Spring over';

  @override
  String get tourNext => 'Næste';

  @override
  String get tourStart => 'Lad os starte';

  @override
  String get tourHomeTitle => 'Hjem';

  @override
  String get tourHomeBody =>
      'Se med det samme, hvor du er i dag — din cyklusdag, hvor lang tid der er til dit estimerede vindue, og din ledsager er altid her.';

  @override
  String get tourCalendarTitle => 'Kalender';

  @override
  String get tourCalendarBody =>
      'Se dine tidligere og kommende cyklusser i kalenderen. Tryk på en dag for at åbne dens log.';

  @override
  String get tourTrackTitle => 'Registrer';

  @override
  String get tourTrackBody =>
      '+-knappen i midten åbner dagens log uanset hvor du er — flow, symptomer, humør og mere.';

  @override
  String get tourRemindersTitle => 'Påmindelser';

  @override
  String get tourRemindersBody =>
      'Indstil påmindelser for din kommende menstruation, medicin eller det at drikke vand — alt bliver på din telefon og sendes ingen andre steder hen.';

  @override
  String get tourProfileTitle => 'Profil';

  @override
  String get tourProfileBody =>
      'Find dine indsigter, alt du sporer, og dine indstillinger her.';

  @override
  String get settingsWeekStartLabel => 'Ugen starter på';

  @override
  String get settingsWeekStartMonday => 'Mandag';

  @override
  String get settingsWeekStartSunday => 'Søndag';

  @override
  String get settingsTemperatureUnitLabel => 'Temperaturenhed';

  @override
  String get settingsTemperatureCelsius => 'Celsius';

  @override
  String get settingsTemperatureFahrenheit => 'Fahrenheit';

  @override
  String get settingsRemindersLabel => 'Mind mig om det før min menstruation';

  @override
  String get remindersScreenTitle => 'Påmindelser';

  @override
  String get reminderDetailNotification => 'Notifikation';

  @override
  String get reminderDetailAlert => 'Advarsel';

  @override
  String get reminderDetailAlertToday => 'På selve dagen';

  @override
  String get reminderDetailTime => 'Tid';

  @override
  String get reminderDetailMessage => 'Besked';

  @override
  String get reminderDetailMessageEditTitle => 'Rediger besked';

  @override
  String get reminderDetailMessageHint => 'Skriv din egen besked';

  @override
  String reminderDetailAlertDaysBefore(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count dage før',
      one: '$count dag før',
    );
    return '$_temp0';
  }

  @override
  String optionsShowMore(int count) {
    return '+$count mere';
  }

  @override
  String get optionsShowLess => 'Vis færre';

  @override
  String get trackerHistoryEntry => 'Historik';

  @override
  String get actionSend => 'Send';

  @override
  String get actionRemove => 'Fjern';

  @override
  String get feedbackEntry => 'Feedback';

  @override
  String get cloudBackupEntry => 'Sikkerhedskopiér med konto';

  @override
  String get cloudBackupTitle => 'Sikkerhedskopiér med konto';

  @override
  String get cloudBackupNotConfiguredTitle =>
      'Endnu ikke tilgængelig i denne version';

  @override
  String get cloudBackupNotConfiguredBody =>
      'Cloud-sikkerhedskopiering kræver en kontotjeneste, der endnu ikke er sat op til denne version. Intet her kan bruges, før det er.';

  @override
  String get cloudBackupIntro1Title => 'Mist aldrig din historik';

  @override
  String get cloudBackupIntro1Body =>
      'Din cyklushistorik forbliver sikker, selv hvis du mister din telefon eller skifter til en ny.';

  @override
  String get cloudBackupIntro2Title => 'Kun du kan åbne den';

  @override
  String get cloudBackupIntro2Body =>
      'Din sikkerhedskopi krypteres med en adgangskode, før den forlader din telefon — vi kan ikke læse den, og det kan ingen andre heller.';

  @override
  String get cloudBackupIntro3Title => 'Gendan på få sekunder';

  @override
  String get cloudBackupIntro3Body =>
      'Log ind på en ny enhed, og hent din historik tilbage med den samme adgangskode.';

  @override
  String get cloudBackupSignedInTitle => 'Logget ind';

  @override
  String get cloudBackupUploadButton => 'Sikkerhedskopiér nu';

  @override
  String get cloudBackupDownloadButton => 'Gendan fra skyen';

  @override
  String get cloudBackupUploadSuccess => 'Sikkerhedskopieret til din konto';

  @override
  String get cloudBackupNoBackupFound =>
      'Ingen cloud-sikkerhedskopi fundet for denne konto endnu.';

  @override
  String get partnerModeEntry => 'Partnertilstand';

  @override
  String get partnerModeTitle => 'Partnertilstand';

  @override
  String get partnerModeNotConfiguredTitle =>
      'Endnu ikke tilgængelig i denne version';

  @override
  String get partnerModeNotConfiguredBody =>
      'Partnertilstand kræver en kontotjeneste, der endnu ikke er sat op til denne version. Intet her kan bruges, før det er.';

  @override
  String get partnerModeHeroTitle => 'Del lidt, på dine betingelser';

  @override
  String get partnerModeHeroBody =>
      'Par dig med din partner og del kun det, du slår til nedenfor — aldrig hele din historik, aldrig automatisk.';

  @override
  String get partnerModeSignInGoogle => 'Fortsæt med Google';

  @override
  String get partnerModeSignInApple => 'Fortsæt med Apple';

  @override
  String get partnerModeFaqTitle => 'Før du logger ind';

  @override
  String get partnerModeFaq1Q => 'Hvad vil min partner faktisk se?';

  @override
  String get partnerModeFaq1A =>
      'Kun de felter, du slår til i Partnertilstand, og kun dit aktuelle øjebliksbillede — aldrig din gemte historik, og aldrig noget du ikke udtrykkeligt har delt.';

  @override
  String get partnerModeFaq2Q => 'Kan jeg slå det fra senere?';

  @override
  String get partnerModeFaq2A =>
      'Ja. At ophæve parringen stopper delingen med det samme for jer begge, og du kan til enhver tid slå enkelte kontakter fra uden at ophæve parringen.';

  @override
  String get partnerModeFaq3Q => 'Har min partner brug for denne app?';

  @override
  String get partnerModeFaq3A =>
      'Ja — de logger ind på samme måde og parres med en kode, du sender dem.';

  @override
  String get partnerModeNotPairedTitle => 'Ikke parret endnu';

  @override
  String get partnerModeNotPairedBody =>
      'Inviter din partner med en engangskode, eller indtast koden, de sendte dig.';

  @override
  String get partnerModeInviteButton => 'Inviter min partner';

  @override
  String get partnerModeEnterCodeButton => 'Indtast en kode';

  @override
  String get partnerModeSignOut => 'Log ud';

  @override
  String get partnerModePairedTitle => 'Parret';

  @override
  String get partnerModePairedBody =>
      'Du og din partner er forbundet. Der deles stadig kun det, du slår til nedenfor.';

  @override
  String get partnerModeShareSectionTitle => 'Hvad du deler';

  @override
  String get partnerModeShareCyclePhase => 'Cyklusfase og -dag';

  @override
  String get partnerModeShareMood => 'Dagens humør';

  @override
  String get partnerModeShareSymptoms => 'Dagens symptomer';

  @override
  String get partnerModeShareHighDesire => 'Lyst til nærhed i dag';

  @override
  String get partnerModeShareNow => 'Del nu';

  @override
  String get partnerModeShareSuccess => 'Delt med din partner';

  @override
  String get partnerModeUnpair => 'Ophæv parring';

  @override
  String get partnerModeUnpairConfirmTitle => 'Ophæve parring med din partner?';

  @override
  String get partnerModeUnpairConfirmBody =>
      'Dette stopper delingen med det samme for jer begge. I kan parres igen senere med en ny kode.';

  @override
  String get partnerModePartnerSnapshotEmpty =>
      'Din partner har endnu ikke delt noget.';

  @override
  String get partnerModeErrorNotConfigured =>
      'Partnertilstand er endnu ikke sat op i denne version.';

  @override
  String get partnerModeErrorCodeNotFound =>
      'Den kode blev ikke fundet. Tjek den, og prøv igen.';

  @override
  String get partnerModeErrorCodeExpired =>
      'Den kode er udløbet. Bed om en ny.';

  @override
  String get partnerModeErrorCodeIsOwn =>
      'Det er din egen kode — bed din partner om deres.';

  @override
  String get partnerModeErrorNotSignedIn => 'Log ind først.';

  @override
  String get partnerModeErrorUnknown => 'Noget gik galt. Prøv venligst igen.';

  @override
  String get partnerModeInviteTitle => 'Inviter din partner';

  @override
  String get partnerModeInviteBody =>
      'Send denne kode til din partner. De indtaster den i deres egen app for at parres med dig.';

  @override
  String get partnerModeInviteExpiry => 'Gyldig i 7 dage';

  @override
  String get partnerModeInviteShare => 'Del kode';

  @override
  String partnerModeInviteMessage(String code) {
    return 'Her er min Vera-parringskode: $code';
  }

  @override
  String get partnerModeEnterTitle => 'Indtast en kode';

  @override
  String get partnerModeEnterBody => 'Indtast koden, din partner sendte dig.';

  @override
  String get partnerModeEnterHint => '6-tegns kode';

  @override
  String get partnerModeEnterSubmit => 'Par';

  @override
  String get homeInvitePartnerTitle => 'Del med din partner';

  @override
  String get homeInvitePartnerBody =>
      'Par jer, og del kun det, du vælger — din historik forbliver din.';

  @override
  String get homeInvitePartnerCta => 'Konfigurer Partnertilstand';

  @override
  String get feedbackTitle => 'Hvad kunne du ikke lide?';

  @override
  String get feedbackSubtitle => 'Vælg et emne, og skriv mere, hvis du vil.';

  @override
  String get feedbackCategoryPredictions => 'Forudsigelser';

  @override
  String get feedbackCategoryBackup => 'Sikkerhedskopiering';

  @override
  String get feedbackCategorySubscription => 'Abonnement';

  @override
  String get feedbackCategoryAds => 'Annoncer';

  @override
  String get feedbackCategoryDesign => 'Design';

  @override
  String get feedbackCategoryTranslation => 'Oversættelse';

  @override
  String get feedbackCategoryOther => 'Andet';

  @override
  String get feedbackDescriptionLabel => 'Fortæl os mere (valgfrit)';

  @override
  String get feedbackDescriptionHint =>
      'Hvad skete der? Når du trykker Send, vælger du selv hvor du deler det — din mailapp eller andet sted.';

  @override
  String get feedbackAttachPhoto => 'Tilføj et foto';

  @override
  String get feedbackPhotoAttached => 'Foto vedhæftet';

  @override
  String get remindersGroupCycle => 'Menstruation og fertilitet';

  @override
  String get remindersGroupMedication => 'Medicin';

  @override
  String get remindersGroupLifestyle => 'Livsstil';

  @override
  String get remindersGroupAppointment => 'Lægebesøg';

  @override
  String get settingsRemindersPeriodEndLabel =>
      'Spørg til mig, når min menstruation burde slutte';

  @override
  String get settingsRemindersMedicationLabel => 'Påmindelse om medicin';

  @override
  String get settingsRemindersWaterLabel => 'Påmindelse om vand';

  @override
  String get settingsRemindersAppointmentLabel => 'Påmindelse om lægebesøg';

  @override
  String get settingsRemindersAppointmentSet => 'Vælg dato og tid';

  @override
  String get settingsRemindersAppointmentClear => 'Ryd';

  @override
  String get settingsOptionalTrackersHeading => 'Valgfri målinger';

  @override
  String get settingsOptionalTrackersBody =>
      'Slået fra som standard. Slår du en til, kommer den med på dagsnoteringen.';

  @override
  String get settingsSexualActivityToggle => 'Seksuel aktivitet';

  @override
  String get settingsBbtToggle => 'Basaltemperatur';

  @override
  String get settingsMucusToggle => 'Cervixslim';

  @override
  String get settingsBreastExamToggle => 'Selvundersøgelse af bryster';

  @override
  String get settingsCervixToggle => 'Livmoderhalsens placering og fasthed';

  @override
  String get settingsPrivacyEntry => 'Privatliv';

  @override
  String get settingsRateEntry => 'Bedøm os';

  @override
  String get rateAppTitle => 'Virker Vera for dig?';

  @override
  String get rateAppBody =>
      'Hvis ja, hjælper et par sekunders bedømmelse i butikken andre, der leder efter noget lignende, med rent faktisk at finde det.';

  @override
  String get rateAppCta => 'Bedøm Vera';

  @override
  String get rateAppDismiss => 'Ikke nu';

  @override
  String get settingsDeleteAllData => 'Slet alle data';

  @override
  String get privacyScreenTitle => 'Privatliv';

  @override
  String get privacyScreenIntro =>
      'Her er præcis, hvad der sker med dine data, i almindeligt sprog.';

  @override
  String get privacyScreenStorageTitle => 'Krypteret på denne enhed';

  @override
  String get privacyScreenNoNetworkTitle => 'Ingen server, ingen konto';

  @override
  String get privacyScreenNoThirdPartyTitle => 'Ingen sporing';

  @override
  String get privacyScreenExportTitle => 'Kun du kan eksportere';

  @override
  String get privacyScreenDeleteTitle => 'Sletning er endelig';

  @override
  String get privacyScreenStorage =>
      'Alt, du noterer, krypteres og gemmes kun på denne enhed, i én enkelt fil. Krypteringsnøglen ligger i telefonens sikre hardware — Keychain på iOS, Keystore på Android — ikke i filen selv.';

  @override
  String get privacyScreenNoNetwork =>
      'Denne app har ingen egen server og intet kontosystem — dine noteringer bliver aldrig uploadet. Gratisversionen indeholder Google-annoncer, som forbinder til internettet; de modtager aldrig noget af det, du noterer.';

  @override
  String get privacyScreenNoThirdParty =>
      'Der er ingen analyse, ingen nedbrudsrapportering og ingen sporings-SDK. Den eneste tredjepartskomponent er Googles annonce-SDK i gratisversionen — Premium fjerner den helt.';

  @override
  String get privacyScreenExport =>
      'Den eneste måde, dine data nogensinde forlader denne enhed på, er hvis du selv eksporterer dem, og den eksport er krypteret med en adgangskode, kun du kender.';

  @override
  String get privacyScreenDelete =>
      'Sletning af dine data er reel og øjeblikkelig. Der er ingen konto og ingen sikkerhedskopi hos os — når det er væk, er det væk.';

  @override
  String get adPlaceholderLabel => 'Annonceplads';

  @override
  String get adPlaceholderUpgradeCta => 'Bliv annoncefri med Premium';

  @override
  String get reminderNotificationTitle =>
      'Din menstruation begynder måske snart';

  @override
  String get reminderNotificationBody =>
      'Ud fra de cyklusser, du har noteret, nærmer dit estimerede vindue sig.';

  @override
  String get reminderPeriodEndTitle =>
      'Din menstruation er måske ved at være slut';

  @override
  String get reminderPeriodEndBody =>
      'Er den stadig i gang, er det helt normalt — bare et lille tjek ind.';

  @override
  String get reminderMedicationTitle => 'Påmindelse om medicin';

  @override
  String get reminderMedicationBody => 'Tid til at tage din medicin.';

  @override
  String get reminderWaterTitle => 'Husk at drikke vand';

  @override
  String get reminderWaterBody => 'En lille vandpåmindelse.';

  @override
  String get reminderAppointmentTitle => 'Kommende lægebesøg';

  @override
  String get reminderAppointmentBody => 'Du har et lægebesøg på vej.';

  @override
  String get settingsExportEntry => 'Eksport og sikkerhedskopi';

  @override
  String get exportBackupHeading => 'Krypteret sikkerhedskopi';

  @override
  String get exportBackupBody =>
      'Gem en krypteret kopi af din historik, så du kan flytte den til en ny enhed. Du skal bruge adgangskoden igen for at gendanne den — der er ingen anden måde at få den frem på.';

  @override
  String get exportCreateBackupButton => 'Opret sikkerhedskopi';

  @override
  String get exportRestoreBackupButton => 'Gendan fra sikkerhedskopi';

  @override
  String get exportPasswordLabel => 'Adgangskode';

  @override
  String get exportPasswordConfirmLabel => 'Bekræft adgangskode';

  @override
  String get exportPasswordMismatch => 'Adgangskoderne er ikke ens';

  @override
  String get exportPasswordTooShort => 'Brug mindst 8 tegn';

  @override
  String get exportRestoreConfirmTitle => 'Erstat alle data på denne enhed?';

  @override
  String get exportRestoreConfirmBody =>
      'Når du gendanner en sikkerhedskopi, erstattes alt, der er noteret på denne enhed nu. Det kan ikke fortrydes.';

  @override
  String get exportRestoreConfirmAction => 'Gendan';

  @override
  String get exportWrongPassword =>
      'Den adgangskode passer ikke til denne sikkerhedskopi';

  @override
  String get exportInvalidFile => 'Den fil ligner ikke en Vera-sikkerhedskopi';

  @override
  String get exportBackupCreated => 'Sikkerhedskopien er klar til at dele';

  @override
  String get exportRestoreSuccess => 'Sikkerhedskopi gendannet';

  @override
  String get exportDoctorReportHeading => 'Lægerapport';

  @override
  String get exportDoctorReportBody =>
      'En oversigt, du kan dele med en behandler.';

  @override
  String get exportIncludeNotesToggle => 'Inkludér personlige noter';

  @override
  String get exportShareCsvButton => 'Del som CSV';

  @override
  String get exportPrintPdfButton => 'Udskriv / Gem som PDF';

  @override
  String get doctorReportDisclaimer =>
      'Genereret af Vera ud fra data, brugeren selv har indtastet. Ikke en lægelig diagnose.';

  @override
  String get doctorReportGeneratedOn => 'Genereret den';

  @override
  String get doctorReportSummaryHeading => 'Oversigt';

  @override
  String get doctorReportDailyLogHeading => 'Daglig notering';

  @override
  String get doctorReportColumnDate => 'Dato';

  @override
  String get doctorReportTimelineHeading => 'Cyklustidslinje';

  @override
  String get doctorReportCycleLabel => 'Cyklus';

  @override
  String get doctorReportTimelineLegendPeriod => 'Menstruation';

  @override
  String get doctorReportTimelineLegendCycle => 'Resten af cyklussen';

  @override
  String get doctorReportTimelineOngoing => 'Igangværende';

  @override
  String get dailyInsightLabel => 'Vidste du det?';

  @override
  String get insightMenstrual1 =>
      'Din livmoderslimhinde løsner sig lige nu — de fleste menstruationer varer 3 til 7 dage, og det er helt normalt.';

  @override
  String get insightMenstrual2 =>
      'Jernrig mad som mørkegrønne bladgrøntsager og linser kan hjælpe med at opveje det, kroppen mister i denne uge.';

  @override
  String get insightFollicular1 =>
      'Østrogen stiger, og mange oplever mere energi og bedre fokus omkring nu.';

  @override
  String get insightFollicular2 =>
      'Kroppen gør et æg klar til at blive frigivet — denne fase kan vare fra en uge til et par uger.';

  @override
  String get insightFertile1 =>
      'Dette er dit estimerede frugtbare vindue — dagene omkring ægløsning, hvor graviditet er mest sandsynlig ud fra et typisk forløb.';

  @override
  String get insightFertile2 =>
      'Nogle oplever en let stigning i basaltemperaturen eller ændringer i cervixslimet omkring ægløsningen.';

  @override
  String get insightLuteal1 =>
      'Progesteron stiger efter ægløsningen — det er ofte her, PMS-symptomer som humørsvingninger eller oppustethed dukker op.';

  @override
  String get insightLuteal2 =>
      'Hvis en graviditet ikke har sat sig fast, falder hormonniveauerne mod slutningen af denne fase og udløser din næste menstruation.';

  @override
  String get insightUnknown1 =>
      'Cykluslængder varierer meget fra person til person — alt fra 21 til 35 dage regnes for typisk.';

  @override
  String get insightsPhaseTipsTitle => 'Kan føles godt i denne fase';

  @override
  String get tipFitnessLabel => 'Bevægelse';

  @override
  String get tipNutritionLabel => 'Ernæring';

  @override
  String get tipFitnessMenstrual =>
      'Blid bevægelse — gåture, udstrækning eller restorativ yoga — kan føles bedre end hård træning lige nu.';

  @override
  String get tipFitnessFollicular =>
      'Energien stiger ofte i denne fase — et godt tidspunkt at prøve en ny træningsform eller give lidt mere gas.';

  @override
  String get tipFitnessFertile =>
      'Mange føler sig mest energiske her — en god fase til træning med højere intensitet, hvis det tiltaler dig.';

  @override
  String get tipFitnessLuteal =>
      'Hvis energien daler senere i denne fase, kan styrketræning med lavere intensitet eller svømning føles mere bæredygtigt.';

  @override
  String get tipFitnessUnknown =>
      'Den bevægelse, der føles godt i dag, er et godt valg — der findes ikke én »rigtig« rutine til hver dag.';

  @override
  String get tipNutritionMenstrual =>
      'Jernrig mad som mørkegrønne bladgrøntsager, linser og rødt kød kan hjælpe med at opveje det, kroppen mister i denne uge.';

  @override
  String get tipNutritionFollicular =>
      'Lettere, friske måltider falder ofte godt, når energien stiger — men der findes ikke én »rigtig« måde at spise på i denne fase.';

  @override
  String get tipNutritionFertile =>
      'At drikke nok og holde måltiderne afbalancerede understøtter energien gennem denne mere aktive fase.';

  @override
  String get tipNutritionLuteal =>
      'Lysten til bestemte ting kan skifte her — komplekse kulhydrater og magnesiumrig mad som nødder og mørk chokolade er almindelige favoritter.';

  @override
  String get tipNutritionUnknown =>
      'Afbalancerede, regelmæssige måltider er et solidt udgangspunkt, når din fase endnu ikke er klar.';

  @override
  String get predictionSettingsEntry => 'Indstillinger for forudsigelser';

  @override
  String get predictionSettingsIntro =>
      'Dette er antagelser, vist åbent. Når du har noteret 2 hele cyklusser, beregnes din rigtige forudsigelse på Hjem ud fra dine egne data — så bliver disse tal ikke længere brugt til det.';

  @override
  String get predictionSettingsPeriodLengthLabel =>
      'Typisk menstruationslængde';

  @override
  String get predictionSettingsCycleLengthLabel => 'Typisk cykluslængde';

  @override
  String get predictionSettingsCycleLengthHint =>
      'Bruges til at skalere ringen på Hjem, indtil vi har rigtige data.';

  @override
  String get predictionSettingsLutealLabel => 'Lutealfasens længde';

  @override
  String get predictionSettingsLutealHint =>
      'De typiske dage mellem ægløsning og din næste menstruation. Bruges til at placere det estimerede frugtbare vindue — denne bliver ved med at blive brugt, også efter rigtige forudsigelser er begyndt.';

  @override
  String get dayLogEnergyLabel => 'Energi';

  @override
  String get energyLevelLow => 'Lav';

  @override
  String get energyLevelMedium => 'Middel';

  @override
  String get energyLevelHigh => 'Høj';

  @override
  String get energyLevelEnergetic => 'Fuld af energi';

  @override
  String get dayLogSkinHairLabel => 'Hud og hår';

  @override
  String get skinHealthyGlow => 'Sund glød';

  @override
  String get skinRedness => 'Rødme';

  @override
  String get skinDryness => 'Tørhed';

  @override
  String get skinOiliness => 'Fedtet hud';

  @override
  String get hairGoodDay => 'God hårdag';

  @override
  String get hairBadDay => 'Dårlig hårdag';

  @override
  String get hairLoss => 'Hårtab';

  @override
  String get scalpOily => 'Fedtet hovedbund';

  @override
  String get dayLogBreastExamLabel => 'Selvundersøgelse af bryster';

  @override
  String get breastExamAllNormal => 'Intet usædvanligt';

  @override
  String get breastExamLump => 'Knude';

  @override
  String get breastExamIndentation => 'Indtrækning';

  @override
  String get breastExamRedness => 'Rødme';

  @override
  String get breastExamCrackedNipple => 'Revnet brystvorte';

  @override
  String get breastExamDischarge => 'Sekret';

  @override
  String get cervixPositionLabel => 'Livmoderhalsens placering';

  @override
  String get cervixPositionLow => 'Lav';

  @override
  String get cervixPositionMedium => 'Middel';

  @override
  String get cervixPositionHigh => 'Høj';

  @override
  String get cervixOpeningLabel => 'Livmoderhalsens åbning';

  @override
  String get cervixOpeningClosed => 'Lukket';

  @override
  String get cervixOpeningMedium => 'Middel';

  @override
  String get cervixOpeningOpen => 'Åben';

  @override
  String get cervixFirmnessLabel => 'Livmoderhalsens fasthed';

  @override
  String get cervixFirmnessSoft => 'Blød';

  @override
  String get cervixFirmnessMedium => 'Middel';

  @override
  String get cervixFirmnessFirm => 'Fast';

  @override
  String get dayLogWaterLabel => 'Vand';

  @override
  String get dayLogSleepLabel => 'Søvn';

  @override
  String get dayLogWeightLabel => 'Vægt';

  @override
  String get dayLogMedicationsLabel => 'Medicin';

  @override
  String get dayLogAddMedication => 'Tilføj medicin';

  @override
  String get dayLogMedicationNameHint => 'Medicinens navn';

  @override
  String get dayLogBirthControlLabel => 'Prævention';

  @override
  String get dayLogOtherMedicationsLabel => 'Anden medicin';

  @override
  String get birthControlPillTaken => 'Pille taget';

  @override
  String get birthControlPillLate => 'Pille taget for sent';

  @override
  String get birthControlPillMissed => 'Pille glemt';

  @override
  String get birthControlPatch => 'Plaster';

  @override
  String get birthControlRing => 'Ring';

  @override
  String get birthControlInjection => 'Injektion';

  @override
  String get birthControlImplant => 'Implantat';

  @override
  String get birthControlIud => 'Spiral';

  @override
  String get navAssistant => 'Assistent';

  @override
  String get assistantTitle => 'Vera-assistent';

  @override
  String get assistantEndChatTitle => 'Afslut denne chat?';

  @override
  String get assistantEndChatBody =>
      'Beskederne findes kun i hukommelsen og gemmes ingen steder, så de kan ikke hentes tilbage.';

  @override
  String get assistantEndChatConfirm => 'Afslut chat';

  @override
  String get assistantInputHint => 'Spørg om din cyklus…';

  @override
  String get assistantIntro =>
      'Hej! Her kan du stille spørgsmål om menstruation, cyklus og hvordan Vera virker — svarene kommer fra videnbasen på din telefon, og intet forlader din enhed. Det er ikke lægelig rådgivning.';

  @override
  String get insightMenstrual3 =>
      'Menstruationsblod er ikke »urent blod« — det er en blanding af blod og livmoderslimhinde, en helt normal del af cyklussen.';

  @override
  String get insightMenstrual4 =>
      'Blid varme på den nedre del af maven lindrer faktisk menstruationssmerter — en varmedunk er en evidensunderstøttet klassiker.';

  @override
  String get insightMenstrual5 =>
      'Blødningen er ofte kraftigst de første to dage og aftager derefter — det mønster er typisk.';

  @override
  String get insightMenstrual6 =>
      'At føle sig lidt mere træt under menstruationen er almindeligt — jern forlader kroppen med menstruationsblodet.';

  @override
  String get insightFollicular3 =>
      'Østrogen genopbygger din livmoderslimhinde efter menstruationen — kroppen gør klar på ny.';

  @override
  String get insightFollicular4 =>
      'Huden ser ofte klarest ud i denne fase, når hormonniveauerne falder til ro.';

  @override
  String get insightFollicular5 =>
      'Udholdenhed og reaktionstid topper i den sene follikelfase for mange.';

  @override
  String get insightFollicular6 =>
      'Denne fases længde er det, der varierer mest fra person til person — lutealfasen er langt mere konstant.';

  @override
  String get insightFertile3 =>
      'Et æg lever omkring 12-24 timer, men sædceller kan vente op til 5 dage — derfor strækker det frugtbare vindue sig over flere dage.';

  @override
  String get insightFertile4 =>
      'Omkring ægløsningen bliver cervixslimet ofte klart og trævlet — som rå æggehvide.';

  @override
  String get insightFertile5 =>
      'Nogle mærker en kortvarig jag i den ene side ved ægløsning — det har endda et navn: mittelschmerz.';

  @override
  String get insightFertile6 =>
      'Basaltemperaturen stiger let *efter* ægløsningen — den bekræfter, at den er sket, snarere end at forudsige den.';

  @override
  String get insightLuteal3 =>
      'Progesteron topper omkring en uge efter ægløsningen — oppustethed og ømme bryster omkring da er almindeligt.';

  @override
  String get insightLuteal4 =>
      'Lysten til kulhydrater før menstruationen er reel — energibehovet stiger lidt i lutealfasen.';

  @override
  String get insightLuteal5 =>
      'PMS-symptomer aftager som regel inden for en dag eller to, efter blødningen begynder.';

  @override
  String get insightLuteal6 =>
      'En fast søvnrutine kan mærkbart dæmpe humørdyk sidst i lutealfasen.';

  @override
  String get insightUnknown2 =>
      'At følge bare tre cyklusser er ofte nok til at se dit eget mønster tegne sig.';

  @override
  String get insightUnknown3 =>
      'Cyklusser er personlige — at sammenligne din med en vens siger sjældent noget brugbart.';

  @override
  String get insightUnknown4 =>
      'Stress, rejser og sygdom kan alle forskyde ægløsningen — en »forsinket« menstruation betyder ofte bare forsinket ægløsning.';

  @override
  String get settingsThemeLabel => 'Tema';

  @override
  String get settingsThemeSystem => 'System';

  @override
  String get settingsThemeLight => 'Lyst';

  @override
  String get settingsThemeDark => 'Mørkt';

  @override
  String get settingsMascotLabel => 'Følgesvend';

  @override
  String get mascotDroplet => 'Dråbe';

  @override
  String get mascotFlower => 'Blomst';

  @override
  String get mascotMoon => 'Måne';

  @override
  String get mascotNone => 'Ingen';

  @override
  String homeWindowCountdown(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: 'Det forudsagte vindue begynder om cirka $days dage',
      one: 'Det forudsagte vindue begynder om cirka $days dag',
    );
    return '$_temp0';
  }

  @override
  String homeOvulationCountdown(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: 'Estimeret ægløsning om cirka $days dage',
      one: 'Estimeret ægløsning om cirka $days dag',
    );
    return '$_temp0';
  }

  @override
  String get homeQuickLogTitle => 'Hvordan føles din krop i dag?';

  @override
  String get actionSave => 'Gem';

  @override
  String get insightsTrackerHubTitle => 'Dine målinger';

  @override
  String get trackerHistoryEmpty =>
      'Ingen registreringer i dette interval endnu';

  @override
  String get trackerStatAverage => 'Gennemsnit';

  @override
  String get trackerStatLowest => 'Laveste';

  @override
  String get trackerStatHighest => 'Højeste';

  @override
  String get trackerStatLatest => 'Seneste';

  @override
  String get rangeFilter1m => '1 md.';

  @override
  String get rangeFilter3m => '3 md.';

  @override
  String get rangeFilter6m => '6 md.';

  @override
  String get dayLogOvulationTestLabel => 'Ægløsningstest';

  @override
  String get ovulationTestNegative => 'Negativ';

  @override
  String get ovulationTestPositive => 'Positiv';

  @override
  String get ovulationTestLow => 'Lav';

  @override
  String get ovulationTestHigh => 'Høj';

  @override
  String get ovulationTestPeak => 'Top';

  @override
  String get pregnancyTestLabel => 'Graviditetstest';

  @override
  String get pregnancyTestPositive => 'Positiv';

  @override
  String get pregnancyTestFaint => 'Svag streg';

  @override
  String get pregnancyTestNegative => 'Negativ';

  @override
  String get settingsOvulationTestToggle => 'Ægløsningstest';

  @override
  String get settingsRemindersOvulationLabel => 'Varsel om frugtbart vindue';

  @override
  String get reminderOvulationTitle => 'Estimeret frugtbart vindue nærmer sig';

  @override
  String get reminderOvulationBody =>
      'Ud fra de cyklusser, du har noteret, begynder dit estimerede frugtbare vindue måske snart.';

  @override
  String trackerEntriesCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count registreringer',
      one: '$count registrering',
    );
    return '$_temp0';
  }

  @override
  String get trackerLowSampleNote =>
      'Med så få indtastninger er procenterne endnu ikke pålidelige — de bliver skarpere, når du logger mere.';

  @override
  String get assistantTyping => 'Vera skriver…';

  @override
  String get premiumTitle => 'Vera Premium';

  @override
  String get premiumHeadline => 'Vera Premium';

  @override
  String get premiumSubhead =>
      'Alle funktioner til at følge din cyklus forbliver gratis for altid — din historik bliver aldrig låst inde. Premium tilføjer dine egne målinger, dybere indsigt, dine egne påmindelser og ekstra udseender, og fjerner annoncerne.';

  @override
  String get premiumBenefitNoAds => 'Ingen annoncer nogen steder i appen';

  @override
  String get premiumBenefitSupport =>
      'Støtter en uafhængig app, hvor privatliv kommer først';

  @override
  String get premiumMonthly => 'Månedligt';

  @override
  String get premiumYearly => 'Årligt';

  @override
  String get premiumYearlyNote => 'Betales én gang om året';

  @override
  String premiumPerMonth(String price) {
    return '$price / måned';
  }

  @override
  String get premiumBilledMonthly => 'Faktureres månedligt';

  @override
  String get premiumStaysFreeTitle => 'Det, der forbliver gratis';

  @override
  String get premiumStaysFreeBody =>
      'Kalenderen, hele din historik, de grundlæggende statistikker og eksport er gratis for altid. Premium tilføjer noget – det tager aldrig noget væk.';

  @override
  String get premiumSubscribeCta => 'Fortsæt';

  @override
  String get premiumRestore => 'Gendan køb';

  @override
  String get premiumCancelNote =>
      'Opsig når som helst i din app store-konto. Ingen nedtællinger, intet pres — er det ikke tiden nu, virker gratisversionen præcis som i dag.';

  @override
  String get premiumActiveBadge => 'Premium er aktiv';

  @override
  String get premiumDevToggle => 'Simulér Premium (udvikling)';

  @override
  String get settingsPremiumEntry => 'Vera Premium';

  @override
  String get adTestNotice => 'Testannonce — endnu ikke en rigtig placering';

  @override
  String get settingsPregnancyModeLabel => 'Graviditetstilstand';

  @override
  String get pregnancyLmpLabel => 'Første dag i sidste menstruation';

  @override
  String pregnancyWeekLabel(int weeks, int days) {
    return 'Uge $weeks, dag $days';
  }

  @override
  String get pregnancyDueDateLabel => 'Estimeret termin';

  @override
  String pregnancyDaysLeft(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: 'Cirka $days dage tilbage',
      one: 'Cirka $days dag tilbage',
    );
    return '$_temp0';
  }

  @override
  String pregnancyTrimesterLabel(int n) {
    return '$n. trimester';
  }

  @override
  String get pregnancyDisclaimer =>
      'Datoerne er estimeret ud fra din sidste menstruation efter standardreglen om 280 dage. En ultralydsscanning giver en mere præcis dato, og sen ægløsning forskyder disse tal — dette er information, ikke lægelig behandling.';

  @override
  String get pregnancySizeLabel => 'Babyens størrelse';

  @override
  String get pregnancySizeUnder5 => 'Birkes (~2 mm)';

  @override
  String get pregnancySizeUnder9 => 'Blåbær (~1.6 cm)';

  @override
  String get pregnancySizeUnder13 => 'Lime (~5.4 cm)';

  @override
  String get pregnancySizeUnder20 => 'Avocado (~11.6 cm)';

  @override
  String get pregnancySizeUnder28 => 'Mango (~30 cm)';

  @override
  String get pregnancySizeUnder34 => 'Ananas (~44 cm)';

  @override
  String get pregnancySizeUnder38 => 'Melon (~46 cm)';

  @override
  String get pregnancySizeTerm => 'Lille vandmelon (~51 cm)';

  @override
  String get pregnancyNoteUnder5 =>
      'De fleste mærker ikke noget endnu — fordi svangerskabsalderen tælles fra din sidste menstruation, ligger de første to uger faktisk før undfangelsen.';

  @override
  String get pregnancyNoteUnder9 =>
      'Kvalme, ømme bryster og træthed er almindeligt lige nu. Et godt tidspunkt at aftale den første konsultation.';

  @override
  String get pregnancyNoteUnder13 =>
      'Du nærmer dig slutningen af første trimester; for mange begynder kvalmen at aftage omkring nu.';

  @override
  String get pregnancyNoteUnder20 =>
      'Energien vender ofte tilbage i denne periode. De første bevægelser kan mærkes et sted mellem uge 16 og 22.';

  @override
  String get pregnancyNoteUnder28 =>
      'Bevægelserne bliver tydelige og begynder at danne et mønster. Rygsmerter og halsbrand er almindelige i denne periode.';

  @override
  String get pregnancyNoteUnder34 =>
      'Du er i tredje trimester. Åndenød, hyppig vandladning og Braxton-Hicks-veer er almindelige.';

  @override
  String get pregnancyNoteUnder38 =>
      'Barnet gør sig klar til fødslen. Et godt tidspunkt til hospitalstaske og fødselsplan.';

  @override
  String get pregnancyNoteTerm =>
      'Du er ved terminen — fødslen kan ske når som helst mellem uge 37 og 42; uge 40 er et gennemsnit, ikke en deadline.';

  @override
  String get pregnancyWeeklyNoteTitle => 'Denne uge';

  @override
  String get pregnancyNeedsLmp =>
      'Tilføj første dag i din sidste menstruation for at komme i gang.';

  @override
  String get pregnancyOutOfRange =>
      'Den dato er mere end 42 uger siden — opdatér den, eller slå graviditetstilstand fra.';

  @override
  String get partnerShareTitle => 'Del en oversigt med en partner';

  @override
  String get partnerShareBody =>
      'Laver en kort tekstoversigt — din nuværende fase og estimerede vindue — som du selv sender via en vilkårlig app. Der er ingen live-synkronisering og ingen partnerkonto: intet deles, medmindre du sender det.';

  @override
  String get partnerShareCta => 'Opret oversigt';

  @override
  String get partnerSummaryHeader => 'Cyklusoversigt fra Vera';

  @override
  String get settingsHomeThemeLabel => 'Baggrund på Hjem';

  @override
  String get homeThemeWheat => 'Hvede';

  @override
  String get homeThemeSky => 'Himmel';

  @override
  String get homeThemeField => 'Mark';

  @override
  String get homeThemeBlossom => 'Blomstring';

  @override
  String get homeThemePlain => 'Enkel';

  @override
  String get backupNudgeTitle => 'Gem en kopi af dine data';

  @override
  String get backupNudgeBody =>
      'Alt ligger kun på denne telefon. Bliver den væk, går i stykker eller nulstilles, følger din historik med — en krypteret sikkerhedskopi tager et øjeblik, og kun du kan åbne den.';

  @override
  String get backupNudgeCta => 'Tag sikkerhedskopi nu';

  @override
  String get backupNudgeDismiss => 'Senere';

  @override
  String backupLastDone(String date) {
    return 'Seneste sikkerhedskopi: $date';
  }

  @override
  String get backupNever => 'Ingen sikkerhedskopi endnu';

  @override
  String get settingsRemindersBackupLabel =>
      'Mind mig om at tage sikkerhedskopi';

  @override
  String get reminderBackupTitle => 'Tid til at sikkerhedskopiere Vera';

  @override
  String get reminderBackupBody =>
      'Din historik findes kun på denne telefon. En hurtig krypteret sikkerhedskopi holder den sikker.';

  @override
  String get notificationChannelPeriodStart => 'Kommende menstruation';

  @override
  String get notificationChannelPeriodEnd =>
      'Tjek ind ved menstruationens slutning';

  @override
  String get notificationChannelMedication => 'Medicin';

  @override
  String get notificationChannelWater => 'Vand';

  @override
  String get notificationChannelAppointment => 'Aftale';

  @override
  String get notificationChannelOvulation => 'Frugtbart vindue';

  @override
  String get notificationChannelBackup => 'Påmindelse om sikkerhedskopi';

  @override
  String get calendarDayDetailTitle => 'Denne dag';

  @override
  String get calendarDayNothingLogged => 'Intet noteret for denne dag endnu';

  @override
  String get calendarDayOpenLog => 'Åbn dagsnotering';

  @override
  String get cycleHistoryTitle => 'Tidligere cyklusser';

  @override
  String get cycleTrendsTitle => 'Cyklustendenser';

  @override
  String get cycleHistoryEmpty =>
      'Notér et par menstruationer, så dukker din cyklushistorik op her.';

  @override
  String get cycleHistoryOngoing => 'Igangværende';

  @override
  String cycleHistoryLength(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: 'Cyklus på $days dage',
      one: 'Cyklus på $days dag',
    );
    return '$_temp0';
  }

  @override
  String cycleHistoryPeriodLength(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: 'Menstruationen varede $days dage',
      one: 'Menstruationen varede $days dag',
    );
    return '$_temp0';
  }

  @override
  String cycleHistoryVsAverage(String diff) {
    return '$diff i forhold til dit gennemsnit';
  }

  @override
  String get insightsCycleHistoryEntry => 'Tidligere cyklusser';

  @override
  String get homeEmptyTitle => 'Lad os starte med din sidste menstruation';

  @override
  String get homeEmptyBody =>
      'Tryk på knappen ovenfor den dag, din menstruation begynder. Efter to hele cyklusser kan Vera begynde at estimere — indtil da lader den ikke, som om den ved det.';

  @override
  String get homeEmptyBackdate => 'Den er allerede begyndt tidligere';

  @override
  String get settingsAdPrivacyEntry =>
      'Valgmuligheder for annoncer og privatliv';

  @override
  String a11yCycleRing(int day, int length) {
    return 'Cyklusdag $day af cirka $length';
  }

  @override
  String a11yChartSummary(int count, String min, String max) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Diagram med $count registreringer, fra $min til $max',
      one: 'Diagram med $count registrering, fra $min til $max',
    );
    return '$_temp0';
  }

  @override
  String a11yPhaseBar(int day, int length) {
    return 'Cyklusforløb: dag $day af cirka $length';
  }

  @override
  String a11yFrequencyItem(String label, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count gange',
      one: '$count gang',
    );
    return '$label: $_temp0';
  }

  @override
  String get importTitle => 'Importér fra en anden app';

  @override
  String get importBody =>
      'Eksportér din historik fra din gamle app som en CSV, og vælg så filen her. Kun datoer og blødning importeres — ordlyden for symptomer og humør er forskellig fra app til app, og Vera gætter ikke på, hvad du mente.';

  @override
  String get importPickFile => 'Vælg CSV-fil';

  @override
  String importPreview(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Fandt $count dages historik',
      one: 'Fandt $count dags historik',
    );
    return '$_temp0';
  }

  @override
  String importSkipped(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count rækker kunne ikke læses og udelades',
      one: '$count række kunne ikke læses og udelades',
    );
    return '$_temp0';
  }

  @override
  String get importConfirm => 'Føj til min historik';

  @override
  String get importMergeNote =>
      'Importerede dage flettes ind. Dage, du allerede har noteret i Vera, bevares, som de er.';

  @override
  String importDone(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Importerede $count dage',
      one: 'Importerede $count dag',
    );
    return '$_temp0';
  }

  @override
  String get importErrorEmpty => 'Den fil ser tom ud.';

  @override
  String get importErrorNoDate => 'Kunne ikke finde en datokolonne i den fil.';

  @override
  String get settingsImportEntry => 'Importér fra en anden app';

  @override
  String get settingsHealthSyncLabel =>
      'Synkronisér til Apple Health / Health Connect';

  @override
  String get settingsHealthSyncBody =>
      'Skriver kun menstruationsblødning, vægt og basaltemperatur til telefonens sundhedsapp. Symptomer, humør og noter bliver i Vera. Intet læses tilbage.';

  @override
  String healthSyncBackfilled(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Sendte $count dage til din sundhedsapp',
      one: 'Sendte $count dag til din sundhedsapp',
    );
    return '$_temp0';
  }

  @override
  String get healthSyncDenied =>
      'Tilladelsen blev ikke givet, så synkroniseringen forbliver slået fra.';

  @override
  String get settingsDiagnosticsEntry => 'Diagnostik';

  @override
  String get diagnosticsBody =>
      'Hvis appen opfører sig forkert, registreres de tekniske detaljer her — kun på denne enhed. Intet sendes nogen steder, medmindre du vælger at sende det, og du kan læse præcis, hvad du ville sende, først.';

  @override
  String get diagnosticsEmpty =>
      'Intet registreret — der er ikke fundet nogen problemer.';

  @override
  String get diagnosticsShare => 'Send til udvikleren';

  @override
  String get diagnosticsClear => 'Ryd';

  @override
  String get diagnosticsNoteLabel => 'Hvad skete der? (valgfrit)';

  @override
  String get diagnosticsTechnicalDetail => 'Tekniske detaljer';

  @override
  String get unitHoursShort => 't';

  @override
  String get unitMinutesShort => 'min';

  @override
  String get unitHoursLong => 'timer';

  @override
  String get unitMinutesLong => 'minutter';

  @override
  String get unitMilliliters => 'ml';

  @override
  String get unitKilograms => 'kg';

  @override
  String get calendarJumpTitle => 'Gå til måned';

  @override
  String get calendarJumpYearLabel => 'År';

  @override
  String get settingsAdPrivacyUnavailable =>
      'Valgmuligheder for personlige annoncer tilbydes ikke i din region — annoncer her er allerede ikke-personlige.';

  @override
  String get settingsGroupAppearance => 'Udseende';

  @override
  String get settingsGroupTracking => 'Præferencer for notering';

  @override
  String get dayLogCustomTagsLabel => 'Mine egne målinger';

  @override
  String get customTagAddButton => 'Tilføj en måling';

  @override
  String get customTagDialogTitle => 'Ny måling';

  @override
  String get customTagDialogHint => 'f.eks. migræne, træning, søvnløshed';

  @override
  String get customTagManageEntry => 'Administrér mine målinger';

  @override
  String get customTagRenameTitle => 'Omdøb måling';

  @override
  String get customTagDeleteTitle => 'Slet denne måling?';

  @override
  String get customTagDeleteBody =>
      'Den fjernes fra alle de dage, du har brugt den. Dine øvrige registreringer bevares, som de er.';

  @override
  String get customTagEmpty => 'Ingen egne målinger endnu.';

  @override
  String get premiumLockedTitle => 'Premium-funktion';

  @override
  String get premiumLockedAction => 'Se Premium';

  @override
  String get premiumBenefitCustomTrackers =>
      'Følg lige det, du vil, med dine egne ord';

  @override
  String get premiumBenefitAdvancedInsights =>
      'Avanceret indsigt: hvad der plejer at ske, og hvornår';

  @override
  String get premiumBenefitPersonalisation => 'Ekstra baggrunde og følgesvende';

  @override
  String get premiumBenefitAdvancedReminders =>
      'Påmindelser efter din egen plan';

  @override
  String get advancedInsightsTitle => 'Avanceret indsigt';

  @override
  String get advancedInsightsEntry => 'Avanceret indsigt';

  @override
  String get advancedInsightsNotEnough =>
      'Notér tre hele cyklusser, så dukker dine mønstre op her. Med færre end det ville ethvert »mønster« bare være et tilfælde.';

  @override
  String get advancedInsightsPatternsTitle =>
      'Hvornår tingene plejer at dukke op';

  @override
  String advancedInsightsPatternLine(String label, String segment) {
    return '$label — oftest $segment';
  }

  @override
  String advancedInsightsPatternDetail(int count, int day) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count dage noteret, omkring dag $day i din cyklus',
      one: '$count dag noteret, omkring dag $day i din cyklus',
    );
    return '$_temp0';
  }

  @override
  String advancedInsightsNoPattern(String label) {
    return '$label — endnu intet klart tidspunkt';
  }

  @override
  String get advancedInsightsTrendTitle => 'Cykluslængde over tid';

  @override
  String advancedInsightsDriftLonger(String days, String cycles) {
    return 'Sammenligner man dine tidligste $cycles cyklusser med dine seneste $cycles, er de nyeste omkring $days dage længere.';
  }

  @override
  String advancedInsightsDriftShorter(String days, String cycles) {
    return 'Sammenligner man dine tidligste $cycles cyklusser med dine seneste $cycles, er de nyeste omkring $days dage kortere.';
  }

  @override
  String advancedInsightsDriftStable(String cycles) {
    return 'Sammenligner man dine tidligste $cycles cyklusser med dine seneste $cycles, har din cykluslængde holdt sig nogenlunde den samme.';
  }

  @override
  String get advancedInsightsDriftNotEnough =>
      'Når du har seks hele cyklusser, kan Vera sammenligne dine tidligste med dine seneste for at se, om din cykluslængde forskyder sig.';

  @override
  String get advancedInsightsMoodTitle => 'Humør efter del af cyklussen';

  @override
  String get advancedInsightsDisclaimer =>
      'Dette er optællinger af det, du har noteret, intet andet. Det er ikke en diagnose, og et mønster her er ikke en årsag.';

  @override
  String get segmentPeriod => 'under din menstruation';

  @override
  String get segmentAfterPeriod => 'efter din menstruation';

  @override
  String get segmentMidCycle => 'midt i cyklussen';

  @override
  String get segmentBeforePeriod => 'før din menstruation';

  @override
  String get customRemindersEntry => 'Mine egne påmindelser';

  @override
  String get customRemindersTitle => 'Mine egne påmindelser';

  @override
  String get customRemindersEmpty => 'Ingen egne påmindelser endnu.';

  @override
  String get customRemindersAdd => 'Tilføj en påmindelse';

  @override
  String get customReminderLabelHint => 'f.eks. tag min pille, drik vand';

  @override
  String get customReminderLockScreenNote =>
      'Påmindelsens tekst vises på din låseskærm, så hold den så privat, som du vil have den.';

  @override
  String get customReminderDelete => 'Slet påmindelse';

  @override
  String get homeThemeDusk => 'Skumring';

  @override
  String get homeThemeMeadow => 'Eng';

  @override
  String get homeThemePetal => 'Kronblad';

  @override
  String get homeThemeBloom => 'Blomst';

  @override
  String get homeThemeOcean => 'Hav';

  @override
  String get homeThemeAutumn => 'Efterår';

  @override
  String get homeThemeNight => 'Nat';

  @override
  String get mascotStar => 'Stjerne';

  @override
  String get mascotLeaf => 'Blad';

  @override
  String get mascotCat => 'Kat';

  @override
  String get mascotRabbit => 'Kanin';

  @override
  String get mascotBird => 'Fugl';

  @override
  String get tipDetailWhatsHappening => 'Hvad der sker i din krop';

  @override
  String get tipDetailGeneralHeading => 'Generelle forslag';

  @override
  String get tipDetailDisclaimer =>
      'Dette er generel information, ikke personlig lægelig rådgivning. Hver krop reagerer forskelligt, og hvordan du rent faktisk har det, betyder mere end noget, der foreslås her. Bekymrer noget dig, så tal med en behandler.';

  @override
  String get phaseExplainerMenstrual =>
      'Du bløder, fordi livmoderslimhinden stødes af. Østrogen og progesteron er på cyklussens laveste punkt, og derfor føler mange sig mere trætte og mere indadvendte de første dage. Blødningen varer som regel tre til syv dage og er kraftigst i starten. Kramperne kommer af, at livmoderen trækker sig sammen, drevet af prostaglandiner — hormonlignende stoffer, der frigives, mens slimhinden nedbrydes, og også grunden til at nogle samtidig får ondt i lænden eller løsere mave. Blødningen koster desuden jern, og det forklarer en del af trætheden. Varme, bevægelse og søvn plejer at hjælpe. Men hvis beskyttelsen bliver gennemblødt hver time, hvis blødningen tydeligt varer over en uge, eller hvis smerten forhindrer dig i almindelige ting, er det værd at tage op med en sundhedsperson frem for at vente det ud.';

  @override
  String get phaseExplainerFollicular =>
      'Når blødningen er ovre, begynder østrogen at stige igen. I æggestokkene modnes en gruppe follikler, hver med et æg, og normalt er det kun ét, der frigives. Østrogen genopbygger den slimhinde, der lige er stødt af, og de fleste mærker, at energi, humør, hud og udholdenhed kommer tilbage med den. Det er også den del af cyklussen, der varierer mest mellem personer og mellem måneder — stress, sygdom, rejser og søvn viser sig oftest her ved at forlænge eller forkorte den. Det er den ærlige grund til, at en forudsigelse er et interval og ikke en dato: cyklussens anden halvdel ligger ret fast, og det er denne halvdel, der flytter sig.';

  @override
  String get phaseExplainerFertile =>
      'Østrogen er tæt på sit toppunkt, og ægløsning forventes omkring disse dage. Et udslip af luteiniserende hormon udløser ægløsningen cirka et til halvandet døgn senere. Selve ægget overlever omkring 12 til 24 timer, men sædceller kan leve flere dage i frugtbart livmoderhalsslim — derfor tælles vinduet i flere dage og ikke i én. Slimet bliver typisk klart, trådet og glat, lidt som rå æggehvide; nogle mærker større lyst, ømme bryster eller et kort stik i den ene side. Energien er ofte på cyklussens højeste punkt. Husk, at vinduet er et skøn ud fra din egen historik, ikke en måling, og det er ikke en præventionsmetode.';

  @override
  String get phaseExplainerLuteal =>
      'Efter ægløsningen bliver den tomme follikel til det gule legeme og begynder at producere progesteron, som holder slimhinden stabil, hvis en graviditet sætter sig fast. Sker det ikke, falder progesteron og østrogen kraftigt, og menstruationen begynder. Denne halvdel af cyklussen er den mest konstante, som regel omkring 12 til 14 dage. Progesteron hæver din hviletemperatur en smule — netop det, et basaltermometer opfanger — og kan gøre fordøjelsen langsommere, hvilket forklarer en del af oppustetheden. Faldet til sidst er det, der udløser PMS hos mange: ømme bryster, ændret appetit, afbrudt søvn, hovedpine og humørsvingninger, som normalt letter, når blødningen begynder. Hvis de gener forstyrrer arbejde eller relationer de fleste måneder, er det værd at tale med en sundhedsperson om.';

  @override
  String get phaseExplainerUnknown =>
      'Der er endnu ikke registreret nok til at sige, hvilken fase du er i. Vera har brug for mindst to hele cyklusser — en menstruationsstart og så den næste — for at regne dit eget gennemsnit og din variation ud, og siger hellere det end at finde på en fase. Imens går intet tabt: hver dag, du registrerer, hører med til den første beregning, og skønnet bliver smallere, efterhånden som historikken vokser. Indtil da er forslagene nedenfor generelle og gælder på ethvert tidspunkt i cyklussen.';

  @override
  String get tipFitnessDetailMenstrual =>
      'Hård træning passer de fleste dårligt de første dage, og det handler ikke om disciplin — energien er faktisk lavere, og jernet, du mister med blødningen, gør konditionsarbejde tungere, end den samme træning føltes i sidste uge. Gåture, blid udstrækning, restorativ yoga og vejrtrækningsøvelser forbedrer blodgennemstrømningen og kan dæmpe kramper; hos nogle sænker regelmæssig bevægelse hen over hele måneden krampeintensiteten mere end noget, de gør på selve dagen. Har du det godt, er der ingen grund til at undgå hårde pas: at bløde er ikke en grund til at holde op med at træne, og mange atleter konkurrerer midt i det. Et par praktiske ting: lange, krævende pas på dage med kraftig blødning kan forstærke trætheden, varme på den nederste del af maven, før du starter, gør bevægelsen mere behagelig, og at drikke lidt mere end normalt hjælper mod hovedpinen i disse dage. Bedøm træningen på, hvordan den føles undervejs, ikke på hvordan din bedste uge så ud.';

  @override
  String get tipFitnessDetailFollicular =>
      'Mens østrogen stiger, føler de fleste sig stærkere og mere robuste; det er normalt den bedste del af cyklussen til at starte noget nyt, lægge vægt på eller sætte tempoet op. Muskelreparationen er forholdsvis effektiv her, så hårde pas optages bedre og efterlader mindre langvarig ømhed. Det er også et godt vindue til det, der kræver et klart hoved og ikke bare en stærk krop — at lære et nyt løft, rette teknikken eller løbe længere, end du har gjort før. To forbehold at holde fast i: byg gradvist op, for høj energi betyder ikke nul skadesrisiko, og de fleste overbelastningsskader begynder i en god uge, ikke i en dårlig. Og beskyt din søvn — tilpasningen sker under restitutionen, ikke under træningen.';

  @override
  String get tipFitnessDetailFertile =>
      'Energi og motivation er som regel på toppen, så krævende pas sidder godt — personlige rekorder falder ofte her. Nogle undersøgelser tyder på, at leddene er en smule løsere omkring ægløsningen; den praktiske betydning diskuteres, men en længere opvarmning er en billig forholdsregel i sportsgrene med skarpe retningsskift, hop og landinger. Kropstemperaturen er stadig lav sammenlignet med cyklussens anden halvdel, så varme begrænser mindre her, end den vil gøre om en uge eller to. Et kort stik i den ene side af den nederste del af maven omkring ægløsningen er almindeligt og går som regel over i løbet af timer. Er smerten kraftig, ensidig og vedvarende, følges af feber, eller får du det, som om du besvimer — så stop og få det undersøgt frem for at træne videre.';

  @override
  String get tipFitnessDetailLuteal =>
      'Når menstruationen nærmer sig, kan energien falde, pulsen ligge højere ved samme anstrengelse, og restitutionen tage længere tid. Det er en forventet udsving, ikke en tilbagegang, og det sletter ikke arbejdet fra de sidste to uger. Progesteron hæver hviletemperaturen en smule og gør det sværere at komme af med varme, så varme eller fugtige pas føles uforholdsmæssigt hårde her — at træne tidligere eller senere på dagen og drikke mere, end det føles nødvendigt, hjælper begge dele. Moderate pas, en lidt lettere udgave af styrketræningen og gåture er som regel mere holdbare. Ved oppustethed og ømme bryster gør en støttende sports-bh og en længere opvarmning en reel forskel. Er humøret lavt, så gør træningen kort og let i stedet for at springe den helt over — barren for, at den tæller, ligger lavere, end det føles.';

  @override
  String get tipFitnessDetailUnknown =>
      'Selv uden at kende din fase hjælper bevægelse på ethvert tidspunkt: den generelle anbefaling er omkring 150 minutters moderat aktivitet om ugen, fordelt over de fleste dage, plus styrkearbejde to gange om ugen — og det mønster giver næsten alle mere end enkeltstående meget hårde pas. Regelmæssighed vejer tungere end intensitet, og den bedste træning er den, du faktisk gentager i næste uge. Tilpas efter, hvordan du har det: på trætte dage tæller en gåtur, og et kort gennemført pas er mere værd end et langt, der blev sprunget over. Når du har registreret et par cyklusser, dukker faseopdelte forslag op her.';

  @override
  String get tipNutritionDetailMenstrual =>
      'Blødningen koster dig jern; rødt kød, linser, kikærter, mørkegrønne bladgrøntsager og sirup hjælper med at fylde op. Plantejern optages tydeligt bedre sammen med C-vitamin — at presse citron over linseretten er den mest praktiske udgave, og en tomatsalat ved siden af gør det samme. Te og kaffe til maden nedsætter jernoptagelsen på grund af tanninerne, så det er nok at lade der gå omkring en time imellem; du behøver ikke droppe nogen af delene. At drikke rigeligt vand kan lindre trætheden og hovedpinen, der følger med blødningen, og magnesiumrige fødevarer som nødder, frø og mørke bladgrøntsager hjælper nogle mod kramper. På dage, hvor fordøjelsen er træg, ligger små, regelmæssige måltider bedre end store. Føler du dig ofte forpustet, svimmel eller usædvanligt udmattet omkring menstruationen, er det værd at nævne for en sundhedsperson — lavt jern er almindeligt, nemt at teste for, og ikke noget en app skal stille diagnose på.';

  @override
  String get tipNutritionDetailFollicular =>
      'Når energien vender tilbage, er kroppen i opbygningstilstand: nok protein, fuldkorn og grøntsager understøtter det, og det er i denne fase, appetitten som regel er mest stabil og lettest at styre. Det giver også mening at blive ved med at fylde jerndepoterne op efter blødningen i stedet for at behandle det som noget, der kun hører menstruationsugen til — depoterne bygges op over uger, ikke dage. Ikke at springe måltider over er lettere her, og det gør, at du går mere i balance ind i næste fases appetitudsving. Skal du ændre på, hvordan du spiser, er denne periode som regel venligere at begynde i end ugen før menstruationen, hvor trang og lavt humør får enhver ny rutine til at føles sværere, end den er.';

  @override
  String get tipNutritionDetailFertile =>
      'Her er der ikke brug for nogen særlig kost; balancerede måltider og nok vand gør det meste af arbejdet. Nogle føler sig oppustede omkring ægløsningen, hvilket som regel er hormonelt og forbigående snarere end noget, du har spist. Appetitten falder lidt hos nogle og stiger hos andre — begge dele er almindelige. At holde protein og fibre i måltiderne holder energien stabil gennem det, der ofte er månedens mest aktive periode. Planlægger du en graviditet, er det et fornuftigt tidspunkt at spørge en sundhedsperson om folinsyre, som generelt anbefales før undfangelsen og ikke efter — men det er en samtale med dem, ikke et råd en app skal give.';

  @override
  String get tipNutritionDetailLuteal =>
      'Øget appetit og trang til sødt, mens progesteron stiger, er meget almindeligt; det er en hormonel forskydning, ikke et viljesspørgsmål, og kroppen bruger faktisk lidt mere energi i denne fase. At tilføje protein og fibre til måltiderne holder blodsukkeret mere stabilt og dæmper trangen langt bedre end at forsøge at ignorere den — en trang, der mødes med noget mættende, slutter som regel tidligere end en, du kæmper imod i en time. Mindre salt og mere vand kan lindre oppustetheden; det lyder omvendt, men er det ikke: godt hydreret holder kroppen mindre tilbage. Magnesiumrige fødevarer (mandler, valnødder, mørke bladgrøntsager, mørk chokolade) mindsker kramper og spændinger hos nogle. At skære ned på koffein efter middag hjælper mod den afbrudte søvn i denne fase, og alkohol er også værd at holde øje med, fordi den splitter søvnen netop på det punkt i cyklussen, hvor den i forvejen er lettere.';

  @override
  String get tipNutritionDetailUnknown =>
      'Uanset fasen er det de samme ting, der hjælper mest: regelmæssige måltider, nok protein, masser af grøntsager, nok vand og jernrig mad. Da blødningen koster jern, er det nok at være lidt mere opmærksom de dage — der er ikke brug for en ny kost til hver uge i måneden. At spise på nogenlunde faste tidspunkter gør mere for stabil energi end nogen enkelt fødevare, og intet skal skæres væk, for at en cyklus er sund. Når du har registreret et par cyklusser, dukker faseopdelte forslag op her.';

  @override
  String get tipSleepLabel => 'Søvn';

  @override
  String get tipSleepMenstrual =>
      'Kramper og ubehag kan afbryde søvnen; et varmt bad eller en varmepude før sengetid kan hjælpe.';

  @override
  String get tipSleepFollicular =>
      'Med stigende energi føler mange sig mere vågne — det reelle søvnbehov falder dog ikke.';

  @override
  String get tipSleepFertile =>
      'Den lette temperaturstigning omkring ægløsning kan gøre det lidt sværere at falde i søvn; et køligere værelse kan opveje det.';

  @override
  String get tipSleepLuteal =>
      'Progesteron hæver hviletemperaturen lidt og kan gøre den dybe søvn lettere; et køligt, mørkt værelse og en fast sengetid hjælper mest her.';

  @override
  String get tipSleepUnknown =>
      'Søvnkvaliteten svinger ofte gennem cyklussen — typisk skrøbeligst lige før og under menstruationen. En fast sengetid er det mest pålidelige udgangspunkt uanset fase.';

  @override
  String get tipSleepDetailMenstrual =>
      'Under menstruationen er søvnen ofte mere fragmenteret — kramper, ubehag og for nogle hyppigere toiletbesøg kan vække om natten. Et varmt bad, en varmepude eller lette strækøvelser før sengetid kan lindre kramperne. Tager du smertestillende, kan timing så effekten dækker den første del af natten beskytte den tidlige søvn. Er søvnen stadig svær, er det normalt — det plejer at aftage med fasen.';

  @override
  String get tipSleepDetailFollicular =>
      'Med stigende østrogen føler mange sig mere vågne og energiske, hvilket kan opleves som mindre søvnbehov. Det er ikke helt rigtigt — det er bare lettere at være vågen. At holde en fast sengetid her betaler sig senere, når søvnen bliver mere skrøbelig i andre faser. Dette kan også være et relativt let vindue til at prøve en ny søvnrutine.';

  @override
  String get tipSleepDetailFertile =>
      'Den lille temperaturstigning omkring ægløsning kan gøre det lidt sværere at falde i søvn, fordi kroppen naturligt vil køle af før søvn. Et køligere værelse, et lettere tæppe eller et varmt bad før sengetid kan opveje det. Den, der mærker mere lyst eller social energi i dette vindue, bliver måske også oppe længere af eget valg — et mønster værd at bemærke, ikke et problem at løse.';

  @override
  String get tipSleepDetailLuteal =>
      'Progesteron, der stiger efter ægløsning, hæver hviletemperaturen lidt, hvilket kan gøre den dybe søvn lettere — nogle gange som et mildt hedeblink, andre gange bare som mindre genoprettende søvn. Når menstruationen nærmer sig, kan præmenstruel spænding lægge sig oveni. Et køligt, mørkt værelse, mindre skærmtid før sengetid og en fast sengetid hjælper mest her. Er søvnen stadig svær, er det ikke en fiasko — det er en forventet del af fasen.';

  @override
  String get tipSleepDetailUnknown =>
      'Der er endnu ikke nok data til at afgøre fasen, men skiftende søvnkvalitet gennem cyklussen er et almindeligt mønster — typisk skrøbeligst lige før og under menstruationen, mere stabil i første halvdel. Det mest pålidelige udgangspunkt uanset fase: faste sove- og vågnetider, mindre skærmtid før sengetid og et køligt, mørkt værelse. Efter et par loggede cyklusser vil du se mere specifikke mønstre her.';
}
