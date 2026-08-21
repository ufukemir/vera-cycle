// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Swedish (`sv`).
class AppLocalizationsSv extends AppLocalizations {
  AppLocalizationsSv([String locale = 'sv']) : super(locale);

  @override
  String get appTitle => 'Vera';

  @override
  String get actionSkip => 'Hoppa över';

  @override
  String get actionContinue => 'Fortsätt';

  @override
  String get actionDone => 'Klar';

  @override
  String get actionCancel => 'Avbryt';

  @override
  String get actionClear => 'Rensa';

  @override
  String get actionDelete => 'Ta bort';

  @override
  String get actionEnable => 'Aktivera';

  @override
  String get commonIDontKnow => 'Jag vet inte';

  @override
  String get commonYes => 'Ja';

  @override
  String get commonNo => 'Nej';

  @override
  String get commonNotSure => 'Osäker';

  @override
  String get pinSetupTitle => 'Ställ in en PIN';

  @override
  String get pinSetupEnterPrompt => 'Välj en 6-siffrig PIN för att låsa appen';

  @override
  String get pinSetupConfirmPrompt => 'Ange den igen för att bekräfta';

  @override
  String get pinSetupMismatch => 'De stämde inte överens — vi provar igen';

  @override
  String get pinSetupBiometricTitle => 'Snabbare upplåsning?';

  @override
  String get pinSetupBiometricBody =>
      'Du kan också låsa upp med fingeravtryck eller ansikte — din PIN fungerar fortfarande som reserv.';

  @override
  String get lockScreenTitle => 'Låst';

  @override
  String get lockScreenEnterPin => 'Ange din PIN';

  @override
  String get lockScreenWrongPin => 'Den PIN-koden stämmer inte';

  @override
  String get lockScreenUseBiometrics => 'Använd biometri';

  @override
  String get lockScreenUseFaceId => 'Använd Face ID';

  @override
  String get lockScreenUseFingerprint => 'Använd fingeravtryck';

  @override
  String get lockScreenForgotPin => 'Glömt din PIN?';

  @override
  String get lockScreenForgotPinChoiceTitle => 'Hur vill du återställa den?';

  @override
  String get lockScreenResetViaDevice => 'Verifiera med den här enheten';

  @override
  String get lockScreenResetViaDeviceBody =>
      'Din data finns kvar. Det räcker att bekräfta med telefonens egna lås — Face ID, fingeravtryck eller kod.';

  @override
  String get lockScreenResetViaDeviceReason =>
      'Verifiera för att ange en ny PIN-kod';

  @override
  String lockScreenThrottled(int seconds) {
    return 'För många försök. Försök igen om $seconds s';
  }

  @override
  String get lockScreenEraseTitle => 'Radera all data?';

  @override
  String get lockScreenEraseBody =>
      'Det här tar permanent bort allt på den här enheten. Det finns inget konto och ingen säkerhetskopia på servern, så det går inte att ångra.';

  @override
  String get lockScreenEraseConfirm => 'Radera allt';

  @override
  String get onboardingPrivacyTitle => 'Välkommen';

  @override
  String get onboardingPrivacyBody =>
      'Dina cykeldata stannar bara på den här enheten, krypterade. Det finns inget konto och ingen molnsynkning — inget du loggar laddas någonsin upp. Nyckeln ligger i telefonens säkra hårdvara, och du kan exportera eller radera allt när du vill.';

  @override
  String get onboardingLastPeriodTitle => 'När började din senaste mens?';

  @override
  String get onboardingLastPeriodBody =>
      'Det här hjälper oss att komma igång — du kan alltid ändra det senare i kalendern.';

  @override
  String get onboardingPickDate => 'Välj ett datum';

  @override
  String get onboardingCycleLengthTitle =>
      'Hur lång är din cykel i vanliga fall?';

  @override
  String get onboardingCycleLengthBody =>
      'En ungefärlig siffra räcker. Vi börjar ge dig en riktig uppskattning när vi har sett ett par hela cykler.';

  @override
  String get onboardingPeriodLengthTitle =>
      'Hur många dagar brukar din mens vara?';

  @override
  String get onboardingPeriodLengthBody =>
      'Vi använder det för att fylla i din senaste mens, så att du inte börjar från noll.';

  @override
  String get onboardingDaysUnit => 'dagar';

  @override
  String get onboardingGoalTitle => 'Vad för dig hit?';

  @override
  String get onboardingGoalBody =>
      'Det hjälper oss bara att visa rätt saker först — du kan ändra dig när som helst i Inställningar.';

  @override
  String get goalTrackPeriod => 'Följa min mens';

  @override
  String get goalTryingToConceive => 'Försöker bli gravid';

  @override
  String get goalPregnancyTracking => 'Följa en graviditet';

  @override
  String get onboardingRegularityTitle => 'Brukar din mens vara regelbunden?';

  @override
  String get onboardingRegularityBody =>
      'Det finns inget fel svar här — det hjälper oss bara att lära känna din kropp lite.';

  @override
  String get onboardingCrampsTitle => 'Brukar du få mensvärk?';

  @override
  String get onboardingCrampsBody =>
      'Vi ser till att det blir enkelt att logga hur du mår sådana dagar.';

  @override
  String get onboardingBirthYearTitle => 'Vilket år är du född?';

  @override
  String get onboardingBirthYearBody =>
      'Bara för en fylligare bild — används aldrig för någon förutsägelse.';

  @override
  String get onboardingPmsTitle => 'Brukar något visa sig i förväg?';

  @override
  String get onboardingPmsBody =>
      'Välj så många som stämmer. Sparas ingenstans, det finns inget fel svar.';

  @override
  String get onboardingNotificationTitle => 'Vill du ha varsamma påminnelser?';

  @override
  String get onboardingNotificationBody =>
      'Vi kan påminna dig innan din mens väntas.';

  @override
  String get onboardingNotificationMockTitle => 'Din mens kan börja snart';

  @override
  String get onboardingNotificationMockBody => 'Baserat på dina loggade cykler';

  @override
  String get onboardingNotificationAllow => 'Slå på påminnelser';

  @override
  String get onboardingNotificationNotNow => 'Inte nu';

  @override
  String get onboardingBuildingPlanTitle => 'Vi gör i ordning allt åt dig';

  @override
  String get onboardingBuildingPlanStep1 =>
      'Säkrar dina data på den här enheten';

  @override
  String get onboardingBuildingPlanStep2 => 'Sparar dina inställningar';

  @override
  String get onboardingBuildingPlanStep3 => 'Gör din kalender redo';

  @override
  String get onboardingBuildingPlanDone => 'Klart';

  @override
  String get navHome => 'Hem';

  @override
  String get navCalendar => 'Kalender';

  @override
  String get navInsights => 'Insikter';

  @override
  String get navSettings => 'Inställningar';

  @override
  String get navReminders => 'Påminnelser';

  @override
  String get navProfile => 'Profil';

  @override
  String get navTrack => 'Registrera';

  @override
  String homeCycleDayLabel(int day) {
    return 'Dag $day';
  }

  @override
  String get homeNoCycleYet => 'Ingen mens loggad ännu';

  @override
  String get homePhaseMenstrual => 'Mens';

  @override
  String get homePhaseFollicular => 'Follikelfas';

  @override
  String get homePhaseFertileWindow => 'Uppskattat fertilt fönster';

  @override
  String get homePhaseLuteal => 'Lutealfas';

  @override
  String get homePhaseUnknown => 'Inte tillräckligt med färska data';

  @override
  String get homePredictionInsufficientTitle =>
      'Inte tillräckligt med data ännu';

  @override
  String get homePredictionInsufficientBody =>
      'Logga din nästa mens så börjar vi uppskatta.';

  @override
  String homePredictionRangeLabel(String start, String end) {
    return '$start – $end';
  }

  @override
  String get homeConfidenceHigh => 'Hög säkerhet';

  @override
  String get homeConfidenceMedium => 'Medelhög säkerhet';

  @override
  String get homeConfidenceLow => 'Låg säkerhet';

  @override
  String get homeIrregularNote =>
      'Din cykellängd har varierat mer än vanligt på sistone. Om det är nytt för dig kan det vara värt att nämna vid ett läkarbesök.';

  @override
  String get homeFertileWindowDisclaimer =>
      'Baserat på vanlig cykeltajming — inte en preventivmetod.';

  @override
  String get homePeriodStartedButton => 'Mensen började i dag';

  @override
  String get homePeriodStartedSnackbar => 'Loggat — mensen började i dag';

  @override
  String get actionUndo => 'Ångra';

  @override
  String get comingSoon => 'Kommer snart';

  @override
  String get dayLogFlowLabel => 'Blödning';

  @override
  String get flowSpotting => 'Stänkblödning';

  @override
  String get flowLight => 'Sparsam';

  @override
  String get flowMedium => 'Måttlig';

  @override
  String get flowHeavy => 'Riklig';

  @override
  String get flowNone => 'Ingen';

  @override
  String get dayLogSymptomsLabel => 'Symtom';

  @override
  String get symptomCramps => 'Mensvärk';

  @override
  String get symptomHeadache => 'Huvudvärk';

  @override
  String get symptomBloating => 'Uppblåsthet';

  @override
  String get symptomBreastTenderness => 'Ömma bröst';

  @override
  String get symptomAcne => 'Akne';

  @override
  String get symptomFatigue => 'Trötthet';

  @override
  String get symptomNausea => 'Illamående';

  @override
  String get symptomBackPain => 'Ryggsmärta';

  @override
  String get symptomAppetiteChange => 'Förändrad aptit';

  @override
  String get symptomSleepTrouble => 'Sömnsvårigheter';

  @override
  String get symptomPelvicPain => 'Smärta i bäckenet';

  @override
  String get symptomDizziness => 'Yrsel';

  @override
  String get symptomMigraine => 'Migrän';

  @override
  String get symptomHighFever => 'Hög feber';

  @override
  String get symptomNeckPain => 'Nacksmärta';

  @override
  String get symptomShoulderPain => 'Axelsmärta';

  @override
  String get symptomLimbPain => 'Smärta i lemmar';

  @override
  String get symptomMuscleAche => 'Muskelvärk';

  @override
  String get symptomChills => 'Frossa';

  @override
  String get symptomNightSweats => 'Nattliga svettningar';

  @override
  String get symptomHotFlashes => 'Värmevallningar';

  @override
  String get symptomWeightGain => 'Viktökning';

  @override
  String get symptomConstipation => 'Förstoppning';

  @override
  String get symptomDiarrhea => 'Diarré';

  @override
  String get symptomIndigestion => 'Matsmältningsbesvär';

  @override
  String get symptomGasPain => 'Gasrelaterad smärta';

  @override
  String get symptomFeelingUnwell => 'Obehag';

  @override
  String get symptomItching => 'Klåda';

  @override
  String get symptomTroubleFocusing => 'Koncentrationssvårigheter';

  @override
  String get symptomForgetfulness => 'Glömska';

  @override
  String get symptomGroupHead => 'Huvud';

  @override
  String get symptomGroupBody => 'Kropp';

  @override
  String get symptomGroupAbdomen => 'Mage';

  @override
  String get symptomGroupGeneral => 'Allmänt';

  @override
  String get symptomGroupCognitive => 'Kognitivt';

  @override
  String get dayLogMoodLabel => 'Sinnesstämning';

  @override
  String get moodCalm => 'Lugn';

  @override
  String get moodAnxious => 'Orolig';

  @override
  String get moodIrritable => 'Irriterad';

  @override
  String get moodLow => 'Nedstämd';

  @override
  String get moodEnergetic => 'Energisk';

  @override
  String get moodHappy => 'Glad';

  @override
  String get moodContent => 'Tillfreds';

  @override
  String get moodSad => 'Ledsen';

  @override
  String get moodDepressed => 'Nedstämd och tung';

  @override
  String get moodEmotional => 'Känslosam';

  @override
  String get moodExcited => 'Upprymd';

  @override
  String get moodHopeful => 'Hoppfull';

  @override
  String get moodProud => 'Stolt';

  @override
  String get moodDisappointed => 'Besviken';

  @override
  String get moodConfident => 'Självsäker';

  @override
  String get moodSurprised => 'Överraskad';

  @override
  String get moodIndifferent => 'Likgiltig';

  @override
  String get moodPeaceful => 'Fridfull';

  @override
  String get moodInLove => 'Kär';

  @override
  String get moodShy => 'Blyg';

  @override
  String get moodPlayful => 'Lekfull';

  @override
  String get moodExhausted => 'Utmattad';

  @override
  String get moodLonely => 'Ensam';

  @override
  String get moodOverwhelmed => 'Överväldigad';

  @override
  String get moodGrateful => 'Tacksam';

  @override
  String get moodNostalgic => 'Nostalgisk';

  @override
  String get dayLogNoteLabel => 'Anteckning';

  @override
  String get dayLogNoteHint => 'Något du vill minnas om i dag';

  @override
  String get dayLogOptionalTrackersLabel => 'Valfria mätvärden';

  @override
  String get dayLogSexualActivityLabel => 'Sexuell aktivitet';

  @override
  String get sexLifeNone => 'Inget';

  @override
  String get sexLifeUnprotected => 'Oskyddat sex';

  @override
  String get sexLifeProtected => 'Skyddat sex';

  @override
  String get sexLifeMasturbation => 'Onani';

  @override
  String get sexLifeNoOrgasm => 'Ingen orgasm';

  @override
  String get sexLifeOrgasm => 'Orgasm';

  @override
  String get sexLifeHighDesire => 'Hög lust';

  @override
  String get dayLogBbtLabel => 'Basal kroppstemperatur';

  @override
  String get dayLogMucusLabel => 'Livmoderhalssekret';

  @override
  String get mucusDry => 'Torrt';

  @override
  String get mucusSticky => 'Klibbigt';

  @override
  String get mucusCreamy => 'Krämigt';

  @override
  String get mucusWatery => 'Vattnigt';

  @override
  String get mucusEggWhite => 'Äggvitelikt';

  @override
  String get dayLogSavedIndicator => 'Sparat';

  @override
  String get homeOpenTodayLog => 'Lägg till detaljer för i dag';

  @override
  String get calendarLegendActual => 'Loggad mens';

  @override
  String get calendarLegendPredicted => 'Förutsagt fönster';

  @override
  String get calendarLegendFertile => 'Uppskattat fertilt fönster';

  @override
  String get calendarLegendOvulation => 'Uppskattad ägglossning';

  @override
  String get dayDetailFertileTitle => 'I ditt uppskattade fertila fönster';

  @override
  String get dayDetailOvulationTitle => 'Uppskattad ägglossningsdag';

  @override
  String get dayDetailOvulationBody =>
      'Graviditet är vanligtvis mer sannolik kring den här dagen, utifrån vanlig tajming — det här är en uppskattning, inte en garanti.';

  @override
  String get insightsCyclesLoggedLabel => 'Loggade cykler';

  @override
  String get insightsAveragePeriodLengthLabel => 'Genomsnittlig menslängd';

  @override
  String get insightsAverageCycleLengthLabel => 'Genomsnittlig cykellängd';

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
      other: 'Varierar med ungefär $daysString dagar',
      one: 'Varierar med ungefär $daysString dag',
    );
    return '$_temp0';
  }

  @override
  String get insightsNotEnoughDataTitle => 'Inte tillräckligt med data ännu';

  @override
  String get insightsNotEnoughDataBody =>
      'Logga ett par hela cykler så dyker dina genomsnitt upp här.';

  @override
  String get insightsSymptomFrequencyTitle => 'Symtom per cykeldag';

  @override
  String get insightsNoSymptomsLogged => 'Inga symtom loggade ännu';

  @override
  String get settingsLanguageLabel => 'Språk';

  @override
  String get settingsLanguageSystem => 'Systemspråk';

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
  String get tourSkip => 'Hoppa över';

  @override
  String get tourNext => 'Nästa';

  @override
  String get tourStart => 'Nu kör vi';

  @override
  String get tourHomeTitle => 'Hem';

  @override
  String get tourHomeBody =>
      'Se med en blick var du är idag — din cykeldag, hur länge det är kvar till ditt uppskattade fönster, och din följeslagare finns alltid här.';

  @override
  String get tourCalendarTitle => 'Kalender';

  @override
  String get tourCalendarBody =>
      'Se dina tidigare och kommande cykler i kalendern. Tryck på valfri dag för att öppna dess logg.';

  @override
  String get tourTrackTitle => 'Logga';

  @override
  String get tourTrackBody =>
      '+-knappen i mitten öppnar dagens logg var du än är — flöde, symtom, humör och mer.';

  @override
  String get tourRemindersTitle => 'Påminnelser';

  @override
  String get tourRemindersBody =>
      'Ställ in påminnelser för din kommande mens, medicin eller att dricka vatten — allt stannar på din telefon och skickas ingen annanstans.';

  @override
  String get tourProfileTitle => 'Profil';

  @override
  String get tourProfileBody =>
      'Hitta dina insikter, allt du spårar och dina inställningar här.';

  @override
  String get settingsWeekStartLabel => 'Veckan börjar på';

  @override
  String get settingsWeekStartMonday => 'Måndag';

  @override
  String get settingsWeekStartSunday => 'Söndag';

  @override
  String get settingsTemperatureUnitLabel => 'Temperaturenhet';

  @override
  String get settingsTemperatureCelsius => 'Celsius';

  @override
  String get settingsTemperatureFahrenheit => 'Fahrenheit';

  @override
  String get settingsRemindersLabel => 'Påminn mig innan min mens';

  @override
  String get remindersScreenTitle => 'Påminnelser';

  @override
  String get reminderDetailNotification => 'Avisering';

  @override
  String get reminderDetailAlert => 'Varning';

  @override
  String get reminderDetailAlertToday => 'Samma dag';

  @override
  String get reminderDetailTime => 'Tid';

  @override
  String get reminderDetailMessage => 'Meddelande';

  @override
  String get reminderDetailMessageEditTitle => 'Redigera meddelande';

  @override
  String get reminderDetailMessageHint => 'Skriv ditt eget meddelande';

  @override
  String reminderDetailAlertDaysBefore(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count dagar tidigare',
      one: '$count dag tidigare',
    );
    return '$_temp0';
  }

  @override
  String optionsShowMore(int count) {
    return '+$count till';
  }

  @override
  String get optionsShowLess => 'Visa färre';

  @override
  String get trackerHistoryEntry => 'Historik';

  @override
  String get actionSend => 'Skicka';

  @override
  String get actionRemove => 'Ta bort';

  @override
  String get feedbackEntry => 'Feedback';

  @override
  String get cloudBackupEntry => 'Säkerhetskopiera med konto';

  @override
  String get cloudBackupTitle => 'Säkerhetskopiera med konto';

  @override
  String get cloudBackupNotConfiguredTitle =>
      'Inte tillgängligt i den här versionen än';

  @override
  String get cloudBackupNotConfiguredBody =>
      'Molnsäkerhetskopiering behöver en kontotjänst som ännu inte är konfigurerad för den här versionen. Inget här kan användas förrän dess.';

  @override
  String get cloudBackupIntro1Title => 'Förlora aldrig din historik';

  @override
  String get cloudBackupIntro1Body =>
      'Din cykelhistorik förblir säker även om du tappar telefonen eller byter till en ny.';

  @override
  String get cloudBackupIntro2Title => 'Bara du kan öppna den';

  @override
  String get cloudBackupIntro2Body =>
      'Din säkerhetskopia krypteras med ett lösenord innan den lämnar telefonen — vi kan inte läsa den, och ingen annan heller.';

  @override
  String get cloudBackupIntro3Title => 'Återställ på några sekunder';

  @override
  String get cloudBackupIntro3Body =>
      'Logga in på en ny enhet och hämta tillbaka din historik med samma lösenord.';

  @override
  String get cloudBackupSignedInTitle => 'Inloggad';

  @override
  String get cloudBackupUploadButton => 'Säkerhetskopiera nu';

  @override
  String get cloudBackupDownloadButton => 'Återställ från molnet';

  @override
  String get cloudBackupUploadSuccess => 'Säkerhetskopierad till ditt konto';

  @override
  String get cloudBackupNoBackupFound =>
      'Ingen molnsäkerhetskopia hittades ännu för det här kontot.';

  @override
  String get partnerModeEntry => 'Partnerläge';

  @override
  String get partnerModeTitle => 'Partnerläge';

  @override
  String get partnerModeNotConfiguredTitle =>
      'Inte tillgängligt i den här versionen än';

  @override
  String get partnerModeNotConfiguredBody =>
      'Partnerläge behöver en kontotjänst som ännu inte är konfigurerad för den här versionen. Inget här kan användas förrän dess.';

  @override
  String get partnerModeHeroTitle => 'Dela lite, på dina egna villkor';

  @override
  String get partnerModeHeroBody =>
      'Parkoppla dig med din partner och dela bara det du aktiverar nedan — aldrig hela din historik, aldrig automatiskt.';

  @override
  String get partnerModeSignInGoogle => 'Fortsätt med Google';

  @override
  String get partnerModeSignInApple => 'Fortsätt med Apple';

  @override
  String get partnerModeFaqTitle => 'Innan du loggar in';

  @override
  String get partnerModeFaq1Q => 'Vad kommer min partner faktiskt att se?';

  @override
  String get partnerModeFaq1A =>
      'Bara fälten du aktiverar i Partnerläge, och bara din nuvarande status — aldrig din sparade historik, och aldrig något du inte uttryckligen har delat.';

  @override
  String get partnerModeFaq2Q => 'Kan jag stänga av det senare?';

  @override
  String get partnerModeFaq2A =>
      'Ja. Att koppla bort partnern stoppar delningen direkt för er båda, och du kan när som helst stänga av enskilda reglage utan att koppla bort.';

  @override
  String get partnerModeFaq3Q => 'Behöver min partner den här appen?';

  @override
  String get partnerModeFaq3A =>
      'Ja — hen loggar in på samma sätt och parkopplar med en kod du skickar.';

  @override
  String get partnerModeNotPairedTitle => 'Inte parkopplad än';

  @override
  String get partnerModeNotPairedBody =>
      'Bjud in din partner med en engångskod, eller ange koden hen skickade dig.';

  @override
  String get partnerModeInviteButton => 'Bjud in min partner';

  @override
  String get partnerModeEnterCodeButton => 'Ange en kod';

  @override
  String get partnerModeSignOut => 'Logga ut';

  @override
  String get partnerModePairedTitle => 'Parkopplad';

  @override
  String get partnerModePairedBody =>
      'Du och din partner är anslutna. Delning gäller fortfarande bara det du aktiverar nedan.';

  @override
  String get partnerModeShareSectionTitle => 'Vad du delar';

  @override
  String get partnerModeShareCyclePhase => 'Cykelfas och -dag';

  @override
  String get partnerModeShareMood => 'Dagens humör';

  @override
  String get partnerModeShareSymptoms => 'Dagens symtom';

  @override
  String get partnerModeShareHighDesire => 'Lust till närhet idag';

  @override
  String get partnerModeShareNow => 'Dela nu';

  @override
  String get partnerModeShareSuccess => 'Delat med din partner';

  @override
  String get partnerModeUnpair => 'Koppla bort';

  @override
  String get partnerModeUnpairConfirmTitle => 'Koppla bort din partner?';

  @override
  String get partnerModeUnpairConfirmBody =>
      'Detta stoppar delningen direkt för er båda. Ni kan parkoppla igen senare med en ny kod.';

  @override
  String get partnerModePartnerSnapshotEmpty =>
      'Din partner har inte delat något än.';

  @override
  String get partnerModeErrorNotConfigured =>
      'Partnerläge är inte konfigurerat i den här versionen än.';

  @override
  String get partnerModeErrorCodeNotFound =>
      'Den koden hittades inte. Kontrollera den och försök igen.';

  @override
  String get partnerModeErrorCodeExpired =>
      'Den koden har gått ut. Be om en ny.';

  @override
  String get partnerModeErrorCodeIsOwn =>
      'Det är din egen kod — be din partner om hens.';

  @override
  String get partnerModeErrorNotSignedIn => 'Logga in först.';

  @override
  String get partnerModeErrorUnknown => 'Något gick fel. Försök igen.';

  @override
  String get partnerModeInviteTitle => 'Bjud in din partner';

  @override
  String get partnerModeInviteBody =>
      'Skicka den här koden till din partner. Hen anger den i sin egen app för att parkoppla med dig.';

  @override
  String get partnerModeInviteExpiry => 'Giltig i 7 dagar';

  @override
  String get partnerModeInviteShare => 'Dela kod';

  @override
  String partnerModeInviteMessage(String code) {
    return 'Här är min Vera-parkopplingskod: $code';
  }

  @override
  String get partnerModeEnterTitle => 'Ange en kod';

  @override
  String get partnerModeEnterBody => 'Ange koden din partner skickade dig.';

  @override
  String get partnerModeEnterHint => '6-teckenskod';

  @override
  String get partnerModeEnterSubmit => 'Parkoppla';

  @override
  String get homeInvitePartnerTitle => 'Dela med din partner';

  @override
  String get homeInvitePartnerBody =>
      'Parkoppla er och dela bara det du väljer — din historik förblir din.';

  @override
  String get homeInvitePartnerCta => 'Konfigurera Partnerläge';

  @override
  String get feedbackTitle => 'Vad gillade du inte?';

  @override
  String get feedbackSubtitle => 'Välj ett ämne, och skriv mer om du vill.';

  @override
  String get feedbackCategoryPredictions => 'Prognoser';

  @override
  String get feedbackCategoryBackup => 'Säkerhetskopiering';

  @override
  String get feedbackCategorySubscription => 'Prenumeration';

  @override
  String get feedbackCategoryAds => 'Annonser';

  @override
  String get feedbackCategoryDesign => 'Design';

  @override
  String get feedbackCategoryTranslation => 'Översättning';

  @override
  String get feedbackCategoryOther => 'Annat';

  @override
  String get feedbackDescriptionLabel => 'Berätta mer (valfritt)';

  @override
  String get feedbackDescriptionHint =>
      'Vad hände? När du trycker på Skicka väljer du själv var du delar det — din mejlapp eller nåt annat.';

  @override
  String get feedbackAttachPhoto => 'Lägg till ett foto';

  @override
  String get feedbackPhotoAttached => 'Foto bifogat';

  @override
  String get remindersGroupCycle => 'Mens och fertilitet';

  @override
  String get remindersGroupMedication => 'Medicin';

  @override
  String get remindersGroupLifestyle => 'Livsstil';

  @override
  String get remindersGroupAppointment => 'Läkarbesök';

  @override
  String get settingsRemindersPeriodEndLabel =>
      'Hör av dig när min mens borde vara på väg att ta slut';

  @override
  String get settingsRemindersMedicationLabel => 'Påminnelse om medicin';

  @override
  String get settingsRemindersWaterLabel => 'Påminnelse om vatten';

  @override
  String get settingsRemindersAppointmentLabel => 'Påminnelse om läkarbesök';

  @override
  String get settingsRemindersAppointmentSet => 'Ange datum och tid';

  @override
  String get settingsRemindersAppointmentClear => 'Rensa';

  @override
  String get settingsOptionalTrackersHeading => 'Valfria mätvärden';

  @override
  String get settingsOptionalTrackersBody =>
      'Av som standard. Slår du på ett läggs det till på dagsloggens skärm.';

  @override
  String get settingsSexualActivityToggle => 'Sexuell aktivitet';

  @override
  String get settingsBbtToggle => 'Basal kroppstemperatur';

  @override
  String get settingsMucusToggle => 'Livmoderhalssekret';

  @override
  String get settingsBreastExamToggle => 'Egenundersökning av brösten';

  @override
  String get settingsCervixToggle => 'Livmoderhalsens läge och fasthet';

  @override
  String get settingsPrivacyEntry => 'Integritet';

  @override
  String get settingsRateEntry => 'Betygsätt oss';

  @override
  String get rateAppTitle => 'Fungerar Vera för dig?';

  @override
  String get rateAppBody =>
      'Om ja, hjälper några sekunders betyg i butiken andra som letar efter något liknande att faktiskt hitta det.';

  @override
  String get rateAppCta => 'Betygsätt Vera';

  @override
  String get rateAppDismiss => 'Inte nu';

  @override
  String get settingsDeleteAllData => 'Ta bort alla data';

  @override
  String get privacyScreenTitle => 'Integritet';

  @override
  String get privacyScreenIntro =>
      'Här är precis vad som händer med dina data, i klarspråk.';

  @override
  String get privacyScreenStorageTitle => 'Krypterat på den här enheten';

  @override
  String get privacyScreenNoNetworkTitle => 'Ingen server, inget konto';

  @override
  String get privacyScreenNoThirdPartyTitle => 'Ingen spårning';

  @override
  String get privacyScreenExportTitle => 'Bara du kan exportera';

  @override
  String get privacyScreenDeleteTitle => 'Radering är slutgiltig';

  @override
  String get privacyScreenStorage =>
      'Allt du loggar krypteras och lagras bara på den här enheten, i en enda fil. Krypteringsnyckeln ligger i telefonens säkra hårdvara — Keychain på iOS, Keystore på Android — inte i filen själv.';

  @override
  String get privacyScreenNoNetwork =>
      'Den här appen har ingen egen server och inget kontosystem — dina loggar laddas aldrig upp. Gratisversionen innehåller Google-annonser som ansluter till internet; de får aldrig något av det du loggar.';

  @override
  String get privacyScreenNoThirdParty =>
      'Det finns ingen analys, ingen kraschrapportering och inget spårnings-SDK. Den enda tredjepartskomponenten är Googles annons-SDK i gratisversionen — Premium tar bort den helt.';

  @override
  String get privacyScreenExport =>
      'Det enda sättet dina data någonsin lämnar den här enheten är om du exporterar dem själv, och den exporten krypteras med ett lösenord bara du känner till.';

  @override
  String get privacyScreenDelete =>
      'Att ta bort dina data är på riktigt och sker direkt. Det finns inget konto och ingen säkerhetskopia hos oss — när det är borta är det borta.';

  @override
  String get adPlaceholderLabel => 'Annonsutrymme';

  @override
  String get adPlaceholderUpgradeCta => 'Slipp annonser med Premium';

  @override
  String get reminderNotificationTitle => 'Din mens kan börja snart';

  @override
  String get reminderNotificationBody =>
      'Baserat på dina loggade cykler närmar sig ditt uppskattade fönster.';

  @override
  String get reminderPeriodEndTitle => 'Din mens kan vara på väg att ta slut';

  @override
  String get reminderPeriodEndBody =>
      'Om den fortfarande pågår är det helt normalt — det här är bara en vänlig avstämning.';

  @override
  String get reminderMedicationTitle => 'Påminnelse om medicin';

  @override
  String get reminderMedicationBody => 'Dags att ta din medicin.';

  @override
  String get reminderWaterTitle => 'Drick vatten';

  @override
  String get reminderWaterBody => 'En liten vattenpåminnelse.';

  @override
  String get reminderAppointmentTitle => 'Kommande läkarbesök';

  @override
  String get reminderAppointmentBody => 'Du har ett läkarbesök på gång.';

  @override
  String get settingsExportEntry => 'Export och säkerhetskopia';

  @override
  String get exportBackupHeading => 'Krypterad säkerhetskopia';

  @override
  String get exportBackupBody =>
      'Spara en krypterad kopia av din historik för att flytta till en ny enhet. Du behöver lösenordet igen för att återställa den — det finns inget annat sätt att få tillbaka den.';

  @override
  String get exportCreateBackupButton => 'Skapa säkerhetskopia';

  @override
  String get exportRestoreBackupButton => 'Återställ från säkerhetskopia';

  @override
  String get exportPasswordLabel => 'Lösenord';

  @override
  String get exportPasswordConfirmLabel => 'Bekräfta lösenord';

  @override
  String get exportPasswordMismatch => 'Lösenorden stämmer inte överens';

  @override
  String get exportPasswordTooShort => 'Använd minst 8 tecken';

  @override
  String get exportRestoreConfirmTitle =>
      'Ersätta alla data på den här enheten?';

  @override
  String get exportRestoreConfirmBody =>
      'Att återställa en säkerhetskopia ersätter allt som just nu är loggat på den här enheten. Det går inte att ångra.';

  @override
  String get exportRestoreConfirmAction => 'Återställ';

  @override
  String get exportWrongPassword =>
      'Lösenordet stämmer inte för den här säkerhetskopian';

  @override
  String get exportInvalidFile =>
      'Filen ser inte ut som en Vera-säkerhetskopia';

  @override
  String get exportBackupCreated => 'Säkerhetskopian är redo att delas';

  @override
  String get exportRestoreSuccess => 'Säkerhetskopian är återställd';

  @override
  String get exportDoctorReportHeading => 'Läkarrapport';

  @override
  String get exportDoctorReportBody =>
      'En sammanfattning du kan dela med en vårdgivare.';

  @override
  String get exportIncludeNotesToggle => 'Inkludera personliga anteckningar';

  @override
  String get exportShareCsvButton => 'Dela som CSV';

  @override
  String get exportPrintPdfButton => 'Skriv ut / spara som PDF';

  @override
  String get doctorReportDisclaimer =>
      'Skapad av Vera utifrån uppgifter som användaren angett. Inte en medicinsk diagnos.';

  @override
  String get doctorReportGeneratedOn => 'Skapad den';

  @override
  String get doctorReportSummaryHeading => 'Sammanfattning';

  @override
  String get doctorReportDailyLogHeading => 'Daglig logg';

  @override
  String get doctorReportColumnDate => 'Datum';

  @override
  String get doctorReportTimelineHeading => 'Cykeltidslinje';

  @override
  String get doctorReportCycleLabel => 'Cykel';

  @override
  String get doctorReportTimelineLegendPeriod => 'Mens';

  @override
  String get doctorReportTimelineLegendCycle => 'Resten av cykeln';

  @override
  String get doctorReportTimelineOngoing => 'Pågående';

  @override
  String get dailyInsightLabel => 'Visste du?';

  @override
  String get insightMenstrual1 =>
      'Din livmoderslemhinna stöts av just nu — de flesta menstruationer varar 3 till 7 dagar, och det är helt normalt.';

  @override
  String get insightMenstrual2 =>
      'Järnrik mat som gröna bladgrönsaker och linser kan hjälpa till att väga upp det kroppen förlorar den här veckan.';

  @override
  String get insightFollicular1 =>
      'Östrogenet stiger, och många märker mer energi och bättre fokus från ungefär nu.';

  @override
  String get insightFollicular2 =>
      'Kroppen förbereder ett ägg för ägglossning — den här fasen kan vara allt från en vecka till några veckor.';

  @override
  String get insightFertile1 =>
      'Det här är ditt uppskattade fertila fönster — dagarna kring ägglossningen då graviditet är mest sannolik, utifrån vanlig tajming.';

  @override
  String get insightFertile2 =>
      'Vissa märker en liten höjning av den basala kroppstemperaturen eller förändringar i livmoderhalssekretet kring ägglossningen.';

  @override
  String get insightLuteal1 =>
      'Progesteronet stiger efter ägglossningen — det är ofta då PMS-symtom som humörsvängningar eller uppblåsthet dyker upp.';

  @override
  String get insightLuteal2 =>
      'Om ingen graviditet har fäst sjunker hormonnivåerna mot slutet av den här fasen, vilket utlöser din nästa mens.';

  @override
  String get insightUnknown1 =>
      'Cykellängder varierar mycket från person till person — allt från 21 till 35 dagar räknas som vanligt.';

  @override
  String get insightsPhaseTipsTitle => 'Kan kännas bra i den här fasen';

  @override
  String get tipFitnessLabel => 'Rörelse';

  @override
  String get tipNutritionLabel => 'Kost';

  @override
  String get tipFitnessMenstrual =>
      'Mjuk rörelse — promenader, stretching eller återhämtande yoga — kan kännas bättre än hårda pass just nu.';

  @override
  String get tipFitnessFollicular =>
      'Energin stiger ofta i den här fasen — ett bra läge att prova ett nytt träningspass eller pressa på lite mer.';

  @override
  String get tipFitnessFertile =>
      'Många känner sig som mest energiska här — en bra fas för mer intensiv träning om det lockar dig.';

  @override
  String get tipFitnessLuteal =>
      'Om energin dippar senare i den här fasen kan lugnare styrketräning eller simning kännas mer hållbart.';

  @override
  String get tipFitnessUnknown =>
      'Vilken rörelse som än känns bra i dag är ett bra val — det finns ingen enda \"rätt\" rutin för varje dag.';

  @override
  String get tipNutritionMenstrual =>
      'Järnrik mat som gröna bladgrönsaker, linser och rött kött kan hjälpa till att väga upp det kroppen förlorar den här veckan.';

  @override
  String get tipNutritionFollicular =>
      'Lättare, färska måltider passar ofta bra när energin stiger — men det finns inget enda \"rätt\" sätt att äta i den här fasen.';

  @override
  String get tipNutritionFertile =>
      'Att dricka tillräckligt och hålla måltiderna balanserade stöttar energin genom den här mer aktiva fasen.';

  @override
  String get tipNutritionLuteal =>
      'Suget kan skifta här — komplexa kolhydrater och magnesiumrik mat som nötter och mörk choklad är vanliga val.';

  @override
  String get tipNutritionUnknown =>
      'Balanserade, regelbundna måltider är ett bra utgångsläge när din fas ännu inte är tydlig.';

  @override
  String get predictionSettingsEntry => 'Inställningar för förutsägelser';

  @override
  String get predictionSettingsIntro =>
      'Det här är antaganden, öppet redovisade. När du har loggat 2 hela cykler räknas din riktiga förutsägelse på Hem fram från dina egna data — de här siffrorna används då inte längre för det.';

  @override
  String get predictionSettingsPeriodLengthLabel => 'Vanlig menslängd';

  @override
  String get predictionSettingsCycleLengthLabel => 'Vanlig cykellängd';

  @override
  String get predictionSettingsCycleLengthHint =>
      'Används för att skala ringen på Hem tills vi har riktiga data.';

  @override
  String get predictionSettingsLutealLabel => 'Lutealfasens längd';

  @override
  String get predictionSettingsLutealHint =>
      'De vanliga dagarna mellan ägglossning och din nästa mens. Används för att placera det uppskattade fertila fönstret — den här fortsätter användas även efter att riktiga förutsägelser börjat.';

  @override
  String get dayLogEnergyLabel => 'Energi';

  @override
  String get energyLevelLow => 'Låg';

  @override
  String get energyLevelMedium => 'Medel';

  @override
  String get energyLevelHigh => 'Hög';

  @override
  String get energyLevelEnergetic => 'Full av energi';

  @override
  String get dayLogSkinHairLabel => 'Hud och hår';

  @override
  String get skinHealthyGlow => 'Frisk lyster';

  @override
  String get skinRedness => 'Rodnad';

  @override
  String get skinDryness => 'Torrhet';

  @override
  String get skinOiliness => 'Fetma i huden';

  @override
  String get hairGoodDay => 'Bra hårdag';

  @override
  String get hairBadDay => 'Dålig hårdag';

  @override
  String get hairLoss => 'Håravfall';

  @override
  String get scalpOily => 'Fet hårbotten';

  @override
  String get dayLogBreastExamLabel => 'Egenundersökning av brösten';

  @override
  String get breastExamAllNormal => 'Inget ovanligt';

  @override
  String get breastExamLump => 'Knöl';

  @override
  String get breastExamIndentation => 'Indragning';

  @override
  String get breastExamRedness => 'Rodnad';

  @override
  String get breastExamCrackedNipple => 'Sprucken bröstvårta';

  @override
  String get breastExamDischarge => 'Flytning';

  @override
  String get cervixPositionLabel => 'Livmoderhalsens läge';

  @override
  String get cervixPositionLow => 'Lågt';

  @override
  String get cervixPositionMedium => 'Mellan';

  @override
  String get cervixPositionHigh => 'Högt';

  @override
  String get cervixOpeningLabel => 'Livmoderhalsens öppning';

  @override
  String get cervixOpeningClosed => 'Stängd';

  @override
  String get cervixOpeningMedium => 'Mellan';

  @override
  String get cervixOpeningOpen => 'Öppen';

  @override
  String get cervixFirmnessLabel => 'Livmoderhalsens fasthet';

  @override
  String get cervixFirmnessSoft => 'Mjuk';

  @override
  String get cervixFirmnessMedium => 'Mellan';

  @override
  String get cervixFirmnessFirm => 'Fast';

  @override
  String get dayLogWaterLabel => 'Vatten';

  @override
  String get dayLogSleepLabel => 'Sömn';

  @override
  String get dayLogWeightLabel => 'Vikt';

  @override
  String get dayLogMedicationsLabel => 'Medicin';

  @override
  String get dayLogAddMedication => 'Lägg till medicin';

  @override
  String get dayLogMedicationNameHint => 'Medicinens namn';

  @override
  String get dayLogBirthControlLabel => 'Preventivmedel';

  @override
  String get dayLogOtherMedicationsLabel => 'Andra läkemedel';

  @override
  String get birthControlPillTaken => 'Piller taget';

  @override
  String get birthControlPillLate => 'Piller taget för sent';

  @override
  String get birthControlPillMissed => 'Piller glömt';

  @override
  String get birthControlPatch => 'Plåster';

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
  String get assistantTitle => 'Vera-assistenten';

  @override
  String get assistantEndChatTitle => 'Avsluta den här chatten?';

  @override
  String get assistantEndChatBody =>
      'Meddelandena finns bara i minnet och sparas ingenstans, så de går inte att få tillbaka.';

  @override
  String get assistantEndChatConfirm => 'Avsluta chatt';

  @override
  String get assistantInputHint => 'Fråga om din cykel…';

  @override
  String get assistantIntro =>
      'Hej! Här kan du ställa frågor om mens, cykler och hur Vera fungerar — svaren kommer från kunskapsbasen på din telefon och ingenting lämnar din enhet. Det här är inte medicinsk rådgivning.';

  @override
  String get insightMenstrual3 =>
      'Mensblod är inte \"smutsigt blod\" — det är en blandning av blod och livmoderslemhinna, en helt normal del av cykeln.';

  @override
  String get insightMenstrual4 =>
      'Mild värme på nedre delen av magen lindrar faktiskt mensvärk — en varm vattenflaska är en klassiker med stöd i forskningen.';

  @override
  String get insightMenstrual5 =>
      'Blödningen är ofta rikligast de två första dagarna och avtar sedan — det mönstret är vanligt.';

  @override
  String get insightMenstrual6 =>
      'Att känna sig lite tröttare under mensen är vanligt — järn lämnar kroppen med mensblodet.';

  @override
  String get insightFollicular3 =>
      'Östrogenet bygger upp livmoderslemhinnan igen efter mensen — kroppen förbereder sig på nytt.';

  @override
  String get insightFollicular4 =>
      'Huden ser ofta som klarast ut i den här fasen när hormonnivåerna lägger sig.';

  @override
  String get insightFollicular5 =>
      'Uthållighet och reaktionstid når sin topp i sen follikelfas för många.';

  @override
  String get insightFollicular6 =>
      'Den här fasens längd är det som varierar mest mellan personer — lutealfasen är betydligt mer konstant.';

  @override
  String get insightFertile3 =>
      'Ett ägg lever ungefär 12–24 timmar, men spermier kan vänta upp till 5 dagar — därför sträcker sig det fertila fönstret över flera dagar.';

  @override
  String get insightFertile4 =>
      'Kring ägglossningen blir livmoderhalssekretet ofta klart och trådigt — som rå äggvita.';

  @override
  String get insightFertile5 =>
      'Vissa känner ett kort ensidigt hugg vid ägglossningen — det har till och med ett namn: mittelschmerz.';

  @override
  String get insightFertile6 =>
      'Den basala kroppstemperaturen stiger något *efter* ägglossningen — den bekräftar att den har skett snarare än förutsäger den.';

  @override
  String get insightLuteal3 =>
      'Progesteronet når sin topp ungefär en vecka efter ägglossningen — uppblåsthet och ömma bröst kring då är vanligt.';

  @override
  String get insightLuteal4 =>
      'Suget efter kolhydrater före mensen är verkligt — energibehovet stiger något i lutealfasen.';

  @override
  String get insightLuteal5 =>
      'PMS-symtom brukar lätta inom en dag eller två efter att blödningen börjat.';

  @override
  String get insightLuteal6 =>
      'En jämn sömnrutin kan märkbart mildra humörsvackor i sen lutealfas.';

  @override
  String get insightUnknown2 =>
      'Att följa bara tre cykler räcker ofta för att se ditt eget mönster växa fram.';

  @override
  String get insightUnknown3 =>
      'Cykler är personliga — att jämföra din med en väns säger sällan något användbart.';

  @override
  String get insightUnknown4 =>
      'Stress, resor och sjukdom kan alla förskjuta ägglossningen — en \"sen\" mens betyder ofta bara sen ägglossning.';

  @override
  String get settingsThemeLabel => 'Tema';

  @override
  String get settingsThemeSystem => 'System';

  @override
  String get settingsThemeLight => 'Ljust';

  @override
  String get settingsThemeDark => 'Mörkt';

  @override
  String get settingsMascotLabel => 'Följeslagare';

  @override
  String get mascotDroplet => 'Droppe';

  @override
  String get mascotFlower => 'Blomma';

  @override
  String get mascotMoon => 'Måne';

  @override
  String get mascotNone => 'Ingen';

  @override
  String homeWindowCountdown(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: 'Det förutsagda fönstret börjar om ungefär $days dagar',
      one: 'Det förutsagda fönstret börjar om ungefär $days dag',
    );
    return '$_temp0';
  }

  @override
  String homeOvulationCountdown(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: 'Uppskattad ägglossning om ungefär $days dagar',
      one: 'Uppskattad ägglossning om ungefär $days dag',
    );
    return '$_temp0';
  }

  @override
  String get homeQuickLogTitle => 'Hur känns din kropp i dag?';

  @override
  String get actionSave => 'Spara';

  @override
  String get insightsTrackerHubTitle => 'Dina mätvärden';

  @override
  String get trackerHistoryEmpty => 'Inga poster i det här intervallet ännu';

  @override
  String get trackerStatAverage => 'Genomsnitt';

  @override
  String get trackerStatLowest => 'Lägsta';

  @override
  String get trackerStatHighest => 'Högsta';

  @override
  String get trackerStatLatest => 'Senaste';

  @override
  String get rangeFilter1m => '1 mån';

  @override
  String get rangeFilter3m => '3 mån';

  @override
  String get rangeFilter6m => '6 mån';

  @override
  String get dayLogOvulationTestLabel => 'Ägglossningstest';

  @override
  String get ovulationTestNegative => 'Negativt';

  @override
  String get ovulationTestPositive => 'Positivt';

  @override
  String get ovulationTestLow => 'Låg';

  @override
  String get ovulationTestHigh => 'Hög';

  @override
  String get ovulationTestPeak => 'Topp';

  @override
  String get pregnancyTestLabel => 'Graviditetstest';

  @override
  String get pregnancyTestPositive => 'Positiv';

  @override
  String get pregnancyTestFaint => 'Svag rand';

  @override
  String get pregnancyTestNegative => 'Negativ';

  @override
  String get settingsOvulationTestToggle => 'Ägglossningstest';

  @override
  String get settingsRemindersOvulationLabel => 'Förvarning om fertilt fönster';

  @override
  String get reminderOvulationTitle => 'Uppskattat fertilt fönster närmar sig';

  @override
  String get reminderOvulationBody =>
      'Baserat på dina loggade cykler kan ditt uppskattade fertila fönster börja snart.';

  @override
  String trackerEntriesCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count poster',
      one: '$count post',
    );
    return '$_temp0';
  }

  @override
  String get trackerLowSampleNote =>
      'Med så få inlägg är procentandelarna inte tillförlitliga än — de blir mer exakta när du loggar mer.';

  @override
  String get assistantTyping => 'Vera skriver…';

  @override
  String get premiumTitle => 'Vera Premium';

  @override
  String get premiumHeadline => 'Vera Premium';

  @override
  String get premiumSubhead =>
      'Alla funktioner för att följa din cykel förblir gratis för alltid — din historik låses aldrig in. Premium lägger till dina egna mätvärden, djupare insikter, dina egna påminnelser och extra utseenden, och tar bort annonserna.';

  @override
  String get premiumBenefitNoAds => 'Inga annonser, någonstans i appen';

  @override
  String get premiumBenefitSupport =>
      'Stöttar en oberoende app som sätter integritet först';

  @override
  String get premiumMonthly => 'Månadsvis';

  @override
  String get premiumYearly => 'Årsvis';

  @override
  String get premiumYearlyNote => 'Debiteras en gång om året';

  @override
  String premiumPerMonth(String price) {
    return '$price / månad';
  }

  @override
  String get premiumBilledMonthly => 'Faktureras varje månad';

  @override
  String get premiumStaysFreeTitle => 'Det som förblir gratis';

  @override
  String get premiumStaysFreeBody =>
      'Kalendern, hela din historik, grundstatistiken och exporten är gratis för alltid. Premium lägger till saker – det tar aldrig bort något.';

  @override
  String get premiumSubscribeCta => 'Fortsätt';

  @override
  String get premiumRestore => 'Återställ köp';

  @override
  String get premiumCancelNote =>
      'Avbryt när som helst i ditt appbutikskonto. Inga nedräkningar, ingen press — om det inte är rätt läge nu fungerar gratisversionen precis som i dag.';

  @override
  String get premiumActiveBadge => 'Premium är aktivt';

  @override
  String get premiumDevToggle => 'Simulera Premium (utveckling)';

  @override
  String get settingsPremiumEntry => 'Vera Premium';

  @override
  String get adTestNotice => 'Testannons — ännu ingen riktig placering';

  @override
  String get settingsPregnancyModeLabel => 'Graviditetsläge';

  @override
  String get pregnancyLmpLabel => 'Första dagen på senaste mens';

  @override
  String pregnancyWeekLabel(int weeks, int days) {
    return 'Vecka $weeks, dag $days';
  }

  @override
  String get pregnancyDueDateLabel => 'Beräknat förlossningsdatum';

  @override
  String pregnancyDaysLeft(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: 'Ungefär $days dagar kvar',
      one: 'Ungefär $days dag kvar',
    );
    return '$_temp0';
  }

  @override
  String pregnancyTrimesterLabel(int n) {
    return 'Trimester $n';
  }

  @override
  String get pregnancyDisclaimer =>
      'Datumen uppskattas utifrån din senaste mens med den vanliga 280-dagarsregeln. Ett ultraljud ger ett mer exakt datum, och sen ägglossning förskjuter de här siffrorna — det här är information, inte vård.';

  @override
  String get pregnancySizeLabel => 'Babyns storlek';

  @override
  String get pregnancySizeUnder5 => 'Vallmofrö (~2 mm)';

  @override
  String get pregnancySizeUnder9 => 'Blåbär (~1.6 cm)';

  @override
  String get pregnancySizeUnder13 => 'Lime (~5.4 cm)';

  @override
  String get pregnancySizeUnder20 => 'Avokado (~11.6 cm)';

  @override
  String get pregnancySizeUnder28 => 'Mango (~30 cm)';

  @override
  String get pregnancySizeUnder34 => 'Ananas (~44 cm)';

  @override
  String get pregnancySizeUnder38 => 'Melon (~46 cm)';

  @override
  String get pregnancySizeTerm => 'Liten vattenmelon (~51 cm)';

  @override
  String get pregnancyNoteUnder5 =>
      'De flesta märker inget ännu — eftersom graviditetslängden räknas från din senaste mens ligger de två första veckorna faktiskt före befruktningen.';

  @override
  String get pregnancyNoteUnder9 =>
      'Illamående, ömma bröst och trötthet är vanligt just nu. En bra tid att boka in ett första besök.';

  @override
  String get pregnancyNoteUnder13 =>
      'Du närmar dig slutet av första trimestern; för många börjar illamåendet lätta kring nu.';

  @override
  String get pregnancyNoteUnder20 =>
      'Energin kommer ofta tillbaka i den här perioden. De första rörelserna kan kännas någon gång mellan vecka 16 och 22.';

  @override
  String get pregnancyNoteUnder28 =>
      'Rörelserna blir tydliga och börjar följa ett mönster. Ryggsmärta och halsbränna är vanligt i den här perioden.';

  @override
  String get pregnancyNoteUnder34 =>
      'Du är i tredje trimestern. Andfåddhet, täta trängningar och Braxton-Hicks-sammandragningar är vanligt.';

  @override
  String get pregnancyNoteUnder38 =>
      'Barnet gör sig redo för födseln. En bra tid för en förlossningsväska och en förlossningsplan.';

  @override
  String get pregnancyNoteTerm =>
      'Du är fullgången — födseln kan ske när som helst mellan vecka 37 och 42; vecka 40 är ett genomsnitt, inte en tidsgräns.';

  @override
  String get pregnancyWeeklyNoteTitle => 'Den här veckan';

  @override
  String get pregnancyNeedsLmp =>
      'Lägg till första dagen på din senaste mens för att börja följa.';

  @override
  String get pregnancyOutOfRange =>
      'Det datumet är mer än 42 veckor sedan — uppdatera det eller stäng av graviditetsläget.';

  @override
  String get partnerShareTitle => 'Dela en sammanfattning med en partner';

  @override
  String get partnerShareBody =>
      'Skapar en kort textsammanfattning — din nuvarande fas och uppskattade fönster — som du själv skickar via valfri app. Det finns ingen live-synk och inget partnerkonto: ingenting delas om du inte skickar det.';

  @override
  String get partnerShareCta => 'Skapa sammanfattning';

  @override
  String get partnerSummaryHeader => 'Cykelsammanfattning från Vera';

  @override
  String get settingsHomeThemeLabel => 'Bakgrund på Hem';

  @override
  String get homeThemeWheat => 'Vete';

  @override
  String get homeThemeSky => 'Himmel';

  @override
  String get homeThemeField => 'Äng';

  @override
  String get homeThemeBlossom => 'Blom';

  @override
  String get homeThemePlain => 'Enkel';

  @override
  String get backupNudgeTitle => 'Behåll en kopia av dina data';

  @override
  String get backupNudgeBody =>
      'Allt finns bara på den här telefonen. Om den tappas bort, går sönder eller återställs följer din historik med — en krypterad säkerhetskopia tar en stund och bara du kan öppna den.';

  @override
  String get backupNudgeCta => 'Säkerhetskopiera nu';

  @override
  String get backupNudgeDismiss => 'Senare';

  @override
  String backupLastDone(String date) {
    return 'Senaste säkerhetskopia: $date';
  }

  @override
  String get backupNever => 'Ingen säkerhetskopia ännu';

  @override
  String get settingsRemindersBackupLabel =>
      'Påminn mig om att säkerhetskopiera';

  @override
  String get reminderBackupTitle => 'Dags att säkerhetskopiera Vera';

  @override
  String get reminderBackupBody =>
      'Din historik finns bara på den här telefonen. En snabb krypterad säkerhetskopia håller den trygg.';

  @override
  String get notificationChannelPeriodStart => 'Kommande mens';

  @override
  String get notificationChannelPeriodEnd => 'Avstämning i slutet av mensen';

  @override
  String get notificationChannelMedication => 'Medicin';

  @override
  String get notificationChannelWater => 'Vatten';

  @override
  String get notificationChannelAppointment => 'Besök';

  @override
  String get notificationChannelOvulation => 'Fertilt fönster';

  @override
  String get notificationChannelBackup => 'Påminnelse om säkerhetskopia';

  @override
  String get calendarDayDetailTitle => 'Den här dagen';

  @override
  String get calendarDayNothingLogged => 'Inget loggat för den här dagen ännu';

  @override
  String get calendarDayOpenLog => 'Öppna dagsloggen';

  @override
  String get cycleHistoryTitle => 'Tidigare cykler';

  @override
  String get cycleTrendsTitle => 'Cykeltrender';

  @override
  String get cycleHistoryEmpty =>
      'Logga ett par menstruationer så dyker din cykelhistorik upp här.';

  @override
  String get cycleHistoryOngoing => 'Pågående';

  @override
  String cycleHistoryLength(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: 'Cykel på $days dagar',
      one: 'Cykel på $days dag',
    );
    return '$_temp0';
  }

  @override
  String cycleHistoryPeriodLength(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: 'Mensen varade $days dagar',
      one: 'Mensen varade $days dag',
    );
    return '$_temp0';
  }

  @override
  String cycleHistoryVsAverage(String diff) {
    return '$diff mot ditt genomsnitt';
  }

  @override
  String get insightsCycleHistoryEntry => 'Tidigare cykler';

  @override
  String get homeEmptyTitle => 'Vi börjar med din senaste mens';

  @override
  String get homeEmptyBody =>
      'Tryck på knappen ovan den dag din mens börjar. Efter två hela cykler kan Vera börja uppskatta — fram till dess låtsas den inte veta.';

  @override
  String get homeEmptyBackdate => 'Den började redan tidigare';

  @override
  String get settingsAdPrivacyEntry => 'Integritetsval för annonser';

  @override
  String a11yCycleRing(int day, int length) {
    return 'Cykeldag $day av ungefär $length';
  }

  @override
  String a11yChartSummary(int count, String min, String max) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Diagram med $count poster, från $min till $max',
      one: 'Diagram med $count post, från $min till $max',
    );
    return '$_temp0';
  }

  @override
  String a11yPhaseBar(int day, int length) {
    return 'Cykelns förlopp: dag $day av ungefär $length';
  }

  @override
  String a11yFrequencyItem(String label, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count gånger',
      one: '$count gång',
    );
    return '$label: $_temp0';
  }

  @override
  String get importTitle => 'Importera från en annan app';

  @override
  String get importBody =>
      'Exportera din historik från din gamla app som en CSV-fil och välj sedan filen här. Bara datum och blödning importeras — formuleringar för symtom och sinnesstämning skiljer sig mellan appar, och Vera gissar inte vad du menade.';

  @override
  String get importPickFile => 'Välj CSV-fil';

  @override
  String importPreview(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Hittade $count dagar med historik',
      one: 'Hittade $count dag med historik',
    );
    return '$_temp0';
  }

  @override
  String importSkipped(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count rader kunde inte läsas och utelämnas',
      one: '$count rad kunde inte läsas och utelämnas',
    );
    return '$_temp0';
  }

  @override
  String get importConfirm => 'Lägg till i min historik';

  @override
  String get importMergeNote =>
      'Importerade dagar slås ihop med dina. Dagar du redan loggat i Vera behålls som de är.';

  @override
  String importDone(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Importerade $count dagar',
      one: 'Importerade $count dag',
    );
    return '$_temp0';
  }

  @override
  String get importErrorEmpty => 'Filen ser tom ut.';

  @override
  String get importErrorNoDate => 'Kunde inte hitta någon datumkolumn i filen.';

  @override
  String get settingsImportEntry => 'Importera från en annan app';

  @override
  String get settingsHealthSyncLabel =>
      'Synka till Apple Health / Health Connect';

  @override
  String get settingsHealthSyncBody =>
      'Skriver bara mensblödning, vikt och basal temperatur till telefonens hälsoapp. Symtom, sinnesstämningar och anteckningar stannar i Vera. Ingenting läses tillbaka.';

  @override
  String healthSyncBackfilled(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Skickade $count dagar till din hälsoapp',
      one: 'Skickade $count dag till din hälsoapp',
    );
    return '$_temp0';
  }

  @override
  String get healthSyncDenied =>
      'Behörighet gavs inte, så synkningen förblir avstängd.';

  @override
  String get settingsDiagnosticsEntry => 'Diagnostik';

  @override
  String get diagnosticsBody =>
      'Om appen krånglar registreras de tekniska detaljerna här — bara på den här enheten. Ingenting skickas någonstans om du inte väljer att skicka det, och du kan läsa exakt vad du skulle skicka först.';

  @override
  String get diagnosticsEmpty =>
      'Ingenting registrerat — inga problem har upptäckts.';

  @override
  String get diagnosticsShare => 'Skicka till utvecklaren';

  @override
  String get diagnosticsClear => 'Rensa';

  @override
  String get diagnosticsNoteLabel => 'Vad hände? (valfritt)';

  @override
  String get diagnosticsTechnicalDetail => 'Tekniska detaljer';

  @override
  String get unitHoursShort => 'h';

  @override
  String get unitMinutesShort => 'min';

  @override
  String get unitHoursLong => 'timmar';

  @override
  String get unitMinutesLong => 'minuter';

  @override
  String get unitMilliliters => 'ml';

  @override
  String get unitKilograms => 'kg';

  @override
  String get calendarJumpTitle => 'Hoppa till månad';

  @override
  String get calendarJumpYearLabel => 'År';

  @override
  String get settingsAdPrivacyUnavailable =>
      'Val för annonspersonalisering erbjuds inte i din region — annonserna här är redan opersonaliserade.';

  @override
  String get settingsGroupAppearance => 'Utseende';

  @override
  String get settingsGroupTracking => 'Inställningar för loggning';

  @override
  String get dayLogCustomTagsLabel => 'Mina egna mätvärden';

  @override
  String get customTagAddButton => 'Lägg till ett mätvärde';

  @override
  String get customTagDialogTitle => 'Nytt mätvärde';

  @override
  String get customTagDialogHint => 't.ex. migrän, gym, sömnlöshet';

  @override
  String get customTagManageEntry => 'Hantera mina mätvärden';

  @override
  String get customTagRenameTitle => 'Byt namn på mätvärde';

  @override
  String get customTagDeleteTitle => 'Ta bort det här mätvärdet?';

  @override
  String get customTagDeleteBody =>
      'Det tas bort från varje dag där du använt det. Dina övriga poster förblir som de är.';

  @override
  String get customTagEmpty => 'Inga egna mätvärden ännu.';

  @override
  String get premiumLockedTitle => 'Premiumfunktion';

  @override
  String get premiumLockedAction => 'Se Premium';

  @override
  String get premiumBenefitCustomTrackers =>
      'Följ vad du vill, med dina egna ord';

  @override
  String get premiumBenefitAdvancedInsights =>
      'Avancerade insikter: vad som brukar hända, och när';

  @override
  String get premiumBenefitPersonalisation =>
      'Extra bakgrunder och följeslagare';

  @override
  String get premiumBenefitAdvancedReminders =>
      'Påminnelser enligt ditt eget schema';

  @override
  String get advancedInsightsTitle => 'Avancerade insikter';

  @override
  String get advancedInsightsEntry => 'Avancerade insikter';

  @override
  String get advancedInsightsNotEnough =>
      'Logga tre hela cykler så dyker dina mönster upp här. Med färre än så vore varje \"mönster\" bara en slump.';

  @override
  String get advancedInsightsPatternsTitle => 'När saker brukar dyka upp';

  @override
  String advancedInsightsPatternLine(String label, String segment) {
    return '$label — oftast $segment';
  }

  @override
  String advancedInsightsPatternDetail(int count, int day) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count dagar loggade, kring dag $day i din cykel',
      one: '$count dag loggad, kring dag $day i din cykel',
    );
    return '$_temp0';
  }

  @override
  String advancedInsightsNoPattern(String label) {
    return '$label — ingen tydlig tajming ännu';
  }

  @override
  String get advancedInsightsTrendTitle => 'Cykellängd över tid';

  @override
  String advancedInsightsDriftLonger(String days, String cycles) {
    return 'Jämfört med dina tidigaste $cycles cykler är dina senaste $cycles ungefär $days dagar längre.';
  }

  @override
  String advancedInsightsDriftShorter(String days, String cycles) {
    return 'Jämfört med dina tidigaste $cycles cykler är dina senaste $cycles ungefär $days dagar kortare.';
  }

  @override
  String advancedInsightsDriftStable(String cycles) {
    return 'Jämfört med dina tidigaste $cycles cykler har din cykellängd hållit sig ungefär densamma.';
  }

  @override
  String get advancedInsightsDriftNotEnough =>
      'När du har sex hela cykler kan Vera jämföra dina tidigaste med dina senaste för att se om din cykellängd förskjuts.';

  @override
  String get advancedInsightsMoodTitle => 'Sinnesstämning per del av cykeln';

  @override
  String get advancedInsightsDisclaimer =>
      'Det här är räkningar av det du loggat, inget mer. De är ingen diagnos, och ett mönster här är inte en orsak.';

  @override
  String get segmentPeriod => 'under din mens';

  @override
  String get segmentAfterPeriod => 'efter din mens';

  @override
  String get segmentMidCycle => 'mitt i cykeln';

  @override
  String get segmentBeforePeriod => 'före din mens';

  @override
  String get customRemindersEntry => 'Mina egna påminnelser';

  @override
  String get customRemindersTitle => 'Mina egna påminnelser';

  @override
  String get customRemindersEmpty => 'Inga egna påminnelser ännu.';

  @override
  String get customRemindersAdd => 'Lägg till en påminnelse';

  @override
  String get customReminderLabelHint => 't.ex. ta mitt p-piller, dricka vatten';

  @override
  String get customReminderLockScreenNote =>
      'Påminnelsens text visas på din låsskärm, så håll den så privat som du vill att den ska vara.';

  @override
  String get customReminderDelete => 'Ta bort påminnelse';

  @override
  String get homeThemeDusk => 'Skymning';

  @override
  String get homeThemeMeadow => 'Hage';

  @override
  String get homeThemePetal => 'Kronblad';

  @override
  String get homeThemeBloom => 'Blomning';

  @override
  String get homeThemeOcean => 'Hav';

  @override
  String get homeThemeAutumn => 'Höst';

  @override
  String get homeThemeNight => 'Natt';

  @override
  String get mascotStar => 'Stjärna';

  @override
  String get mascotLeaf => 'Löv';

  @override
  String get mascotCat => 'Katt';

  @override
  String get mascotRabbit => 'Kanin';

  @override
  String get mascotBird => 'Fågel';

  @override
  String get tipDetailWhatsHappening => 'Vad som händer i din kropp';

  @override
  String get tipDetailGeneralHeading => 'Allmänna förslag';

  @override
  String get tipDetailDisclaimer =>
      'Det här är allmän information, inte personlig medicinsk rådgivning. Varje kropp reagerar olika, och hur du faktiskt mår väger tyngre än något som föreslås här. Om något oroar dig, prata med en vårdgivare.';

  @override
  String get phaseExplainerMenstrual =>
      'Du blöder eftersom livmoderslemhinnan stöts av. Östrogen och progesteron ligger på cykelns lägsta nivå, och det är därför många känner sig tröttare och mer inåtvända de första dagarna. Blödningen varar oftast tre till sju dagar och är kraftigast i början. Kramperna kommer av att livmodern drar ihop sig, drivet av prostaglandiner — hormonliknande ämnen som frigörs när slemhinnan bryts ner, vilket också är skälet till att en del samtidigt får ont i ländryggen eller lösare mage. Blödningen kostar dessutom järn, och det förklarar en del av tröttheten. Värme, rörelse och sömn brukar hjälpa. Men om skyddet blir genomblött varje timme, om blödningen tydligt går över en vecka eller om smärtan hindrar dig från vanliga saker, är det värt att ta upp med vården i stället för att vänta ut det.';

  @override
  String get phaseExplainerFollicular =>
      'När blödningen tagit slut börjar östrogenet stiga igen. I äggstockarna mognar en grupp folliklar, var och en med ett ägg, och normalt är det bara ett som släpps. Östrogenet bygger upp slemhinnan som just stötts av, och de flesta märker att energi, humör, hud och uthållighet kommer tillbaka med det. Det här är också den del av cykeln som varierar mest mellan personer och mellan månader — stress, sjukdom, resor och sömn visar sig oftast här, genom att förlänga eller förkorta den. Det är det ärliga skälet till att en prognos är ett intervall och inte ett datum: cykelns andra halva ligger ganska stadigt, och det är den här halvan som rör sig.';

  @override
  String get phaseExplainerFertile =>
      'Östrogenet är nära sin topp och ägglossning väntas runt de här dagarna. En puls av luteiniserande hormon utlöser ägglossningen ungefär ett till ett och ett halvt dygn senare. Ägget självt överlever omkring 12 till 24 timmar, men spermier kan leva flera dagar i fertil livmoderhalssekret — därför räknas fönstret i flera dagar och inte i en. Sekretet blir typiskt klart, trådigt och halt, ungefär som rå äggvita; en del märker ökad lust, ömma bröst eller ett kort stick på ena sidan. Energin ligger ofta på cykelns högsta nivå. Kom ihåg att fönstret är en uppskattning ur din egen historik, inte en mätning, och det är ingen preventivmetod.';

  @override
  String get phaseExplainerLuteal =>
      'Efter ägglossningen blir den tömda follikeln gulkroppen och börjar producera progesteron, som håller slemhinnan stabil ifall en graviditet fäster. Om det inte sker faller progesteron och östrogen kraftigt och mensen börjar. Den här halvan av cykeln är den jämnaste, oftast runt 12 till 14 dagar. Progesteron höjer vilotemperaturen något — det är just den förändringen en basaltermometer fångar — och kan sakta ner matsmältningen, vilket förklarar en del av uppblåstheten. Fallet på slutet är det som utlöser PMS hos många: ömma bröst, förändrad aptit, avbruten sömn, huvudvärk och humörsvängningar, som oftast lättar när blödningen börjar. Om besvären är så starka att de stör arbete eller relationer de flesta månader är det värt att prata med vården.';

  @override
  String get phaseExplainerUnknown =>
      'Det finns ännu inte tillräckligt registrerat för att säga vilken fas du är i. Vera behöver minst två fullständiga cykler — en mensstart och sedan nästa — för att räkna ut ditt eget snitt och din variation, och säger hellre det än hittar på en fas. Under tiden går inget förlorat: varje dag du registrerar hör till den första beräkningen, och uppskattningen smalnar av allteftersom historiken växer. Tills dess är förslagen nedan allmänna och gäller när som helst i cykeln.';

  @override
  String get tipFitnessDetailMenstrual =>
      'Hård träning passar de flesta dåligt de första dagarna, och det handlar inte om disciplin — energin är faktiskt lägre, och järnet du förlorar med blödningen gör konditionspass tyngre än samma pass kändes förra veckan. Promenader, mjuk stretch, återhämtande yoga och andningsarbete förbättrar blodflödet och kan mildra kramperna; hos en del sänker regelbunden rörelse över hela månaden krampstyrkan mer än något de gör på själva dagen. Känns det bra finns ingen anledning att undvika hårda pass: att blöda är inget skäl att sluta träna, och många idrottare tävlar rakt igenom. Några praktiska saker: långa, krävande pass under de blödningsrika dagarna kan fördjupa tröttheten, värme på nedre delen av magen innan du börjar gör rörelsen bekvämare, och att dricka lite mer än vanligt hjälper mot huvudvärken de här dagarna. Bedöm passet efter hur det känns under tiden, inte efter hur din bästa vecka såg ut.';

  @override
  String get tipFitnessDetailFollicular =>
      'När östrogenet stiger känner sig de flesta starkare och tåligare; det här är oftast den bästa perioden i cykeln för att börja något nytt, lägga på vikt eller höja tempot. Muskelreparationen är relativt effektiv här, så hårda pass tas emot bättre och lämnar mindre långdragen träningsvärk. Det är också ett bra fönster för sådant som kräver klart huvud och inte bara stark kropp — lära in ett nytt lyft, rätta tekniken, eller springa längre än du gjort förut. Två förbehåll att hålla fast vid: bygg upp gradvis, för hög energi betyder inte noll skaderisk och de flesta belastningsskador börjar en bra vecka, inte en dålig. Och skydda sömnen — anpassningen sker under återhämtningen, inte under passet.';

  @override
  String get tipFitnessDetailFertile =>
      'Energi och motivation ligger oftast på topp, så krävande pass sitter fint — personbästan brukar falla här. En del forskning antyder att lederna är något mer instabila kring ägglossningen; den praktiska effekten diskuteras, men en längre uppvärmning är en billig försiktighetsåtgärd i idrotter med snabba riktningsbyten, hopp och landningar. Kroppstemperaturen är fortfarande låg jämfört med cykelns andra halva, så värmen begränsar mindre här än den kommer att göra om en vecka eller två. Ett kort stick på ena sidan av nedre delen av magen kring ägglossningen är vanligt och går oftast över inom några timmar. Är smärtan stark, ensidig och ihållande, kommer med feber eller får dig att känna dig svimfärdig — sluta och få det undersökt i stället för att träna igenom.';

  @override
  String get tipFitnessDetailLuteal =>
      'När mensen närmar sig kan energin sjunka, pulsen ligga högre vid samma ansträngning och återhämtningen ta längre tid. Det är en väntad svängning, inte en tillbakagång, och det raderar inte arbetet från de senaste två veckorna. Progesteron höjer vilotemperaturen något och gör det svårare att göra sig av med värme, så varma eller fuktiga pass känns oproportionerligt tunga här — att träna tidigare eller senare på dagen och dricka mer än det känns nödvändigt hjälper båda. Måttliga pass, en något lättare version av styrketräningen och promenader håller oftast bättre. Vid uppblåsthet och ömma bröst gör en stödjande sport-bh och en längre uppvärmning verklig skillnad. Är humöret lågt, gör passet kort och lätt i stället för att hoppa över det helt — ribban för att det ska räknas ligger lägre än det känns.';

  @override
  String get tipFitnessDetailUnknown =>
      'Även utan att veta din fas hjälper rörelse när som helst: den allmänna rekommendationen är runt 150 minuter måttlig aktivitet i veckan, utspritt över de flesta dagarna, plus styrkearbete två gånger i veckan — och det mönstret ger nästan alla mer än enstaka mycket intensiva pass. Regelbundenhet väger tyngre än intensitet, och det bästa passet är det du faktiskt upprepar nästa vecka. Anpassa efter hur du känner dig: på trötta dagar räknas en promenad, och ett kort genomfört pass är värt mer än ett långt överhoppat. När du registrerat några cykler dyker fasspecifika förslag upp här.';

  @override
  String get tipNutritionDetailMenstrual =>
      'Blödningen kostar dig järn; rött kött, linser, kikärter, mörka bladgrönsaker och melass hjälper till att fylla på. Växtbaserat järn tas upp märkbart bättre tillsammans med C-vitamin — att pressa citron över linsgrytan är den mest praktiska varianten, och en tomatsallad bredvid gör samma sak. Te och kaffe till maten sänker järnupptaget på grund av tanninerna, så det räcker att lämna ungefär en timme emellan; du behöver inte avstå från något av dem. Att dricka tillräckligt med vatten kan lindra tröttheten och huvudvärken som följer med blödningen, och magnesiumrika livsmedel som nötter, frön och mörka bladgrönsaker hjälper en del mot kramper. De dagar matsmältningen går trögt sitter små, regelbundna måltider bättre än stora. Känner du dig ofta andfådd, yr eller ovanligt utmattad kring mensen är det värt att nämna för vården — järnbrist är vanligt, enkelt att testa, och inget en app ska ställa diagnos på.';

  @override
  String get tipNutritionDetailFollicular =>
      'När energin kommer tillbaka är kroppen i uppbyggnadsläge: tillräckligt med protein, fullkorn och grönsaker stöttar det, och det är i den här fasen aptiten oftast är jämnast och lättast att hantera. Det är också klokt att fortsätta fylla på järndepåerna efter blödningen i stället för att behandla det som något som bara hör mensveckan till — depåerna byggs upp under veckor, inte dagar. Att inte hoppa över måltider går lättare här, och det gör att du går in i nästa fas aptitsvängningar mer i balans. Ska du ändra hur du äter är den här perioden oftast snällare att börja i än veckan före mensen, då sug och nedstämdhet får varje ny rutin att kännas svårare än den är.';

  @override
  String get tipNutritionDetailFertile =>
      'Här behövs ingen särskild kost; balanserade måltider och tillräckligt med vatten gör det mesta av jobbet. En del känner sig uppblåsta kring ägglossningen, vilket oftast är hormonellt och övergående snarare än något du ätit. Aptiten sjunker något hos vissa och stiger hos andra — båda delarna är vanliga. Att hålla protein och fibrer i måltiderna håller energin jämn genom vad som ofta är månadens mest aktiva period. Planerar du en graviditet är det ett vettigt läge att fråga vården om folsyra, som generellt rekommenderas före befruktningen och inte efter — men det är ett samtal med dem, inte ett råd en app ska ge.';

  @override
  String get tipNutritionDetailLuteal =>
      'Ökad aptit och sockersug medan progesteronet stiger är mycket vanligt; det är en hormonell förskjutning, inte en viljestyrkefråga, och kroppen gör faktiskt av med lite mer energi i den här fasen. Att lägga till protein och fibrer i måltiderna håller blodsockret jämnare och mjukar upp suget långt bättre än att försöka ignorera det — ett sug som möts med något rejält tar oftast slut tidigare än ett du kämpar emot i en timme. Mindre salt och mer vatten kan lindra uppblåstheten; det låter bakvänt men är det inte: välvätskad håller kroppen kvar mindre. Magnesiumrika livsmedel (mandlar, valnötter, mörka bladgrönsaker, mörk choklad) minskar kramper och spänning hos vissa. Att dra ner på koffein efter middagstid hjälper mot den avbrutna sömnen i den här fasen, och alkohol är också värt att hålla ögonen på, eftersom den splittrar sömnen precis vid den punkt i cykeln där den redan är lättare.';

  @override
  String get tipNutritionDetailUnknown =>
      'Oavsett fas är det samma saker som hjälper mest: regelbundna måltider, tillräckligt med protein, mycket grönsaker, tillräckligt med vatten och järnrik mat. Eftersom blödningen kostar järn räcker det att vara lite mer uppmärksam de dagarna — det behövs ingen egen kost för varje vecka i månaden. Att äta på ungefär samma tider gör mer för jämn energi än något enskilt livsmedel, och inget behöver strykas för att en cykel ska vara frisk. När du registrerat några cykler dyker fasspecifika förslag upp här.';

  @override
  String get tipSleepLabel => 'Sömn';

  @override
  String get tipSleepMenstrual =>
      'Kramper och obehag kan splittra sömnen; en varm dusch eller värmedyna före sänggåendet kan hjälpa.';

  @override
  String get tipSleepFollicular =>
      'Med ökande energi känner sig många piggare — det egentliga sömnbehovet minskar dock inte särskilt mycket.';

  @override
  String get tipSleepFertile =>
      'Den lilla temperaturhöjningen kring ägglossning kan göra det lite svårare att somna; ett svalare rum kan hjälpa.';

  @override
  String get tipSleepLuteal =>
      'Progesteron höjer vilotemperaturen något och kan göra djupsömnen lättare; ett svalt, mörkt rum och en fast läggtid hjälper mest här.';

  @override
  String get tipSleepUnknown =>
      'Sömnkvaliteten brukar variera under cykeln — vanligtvis skörast strax före och under mens. En fast läggtid är den mest pålitliga grunden oavsett fas.';

  @override
  String get tipSleepDetailMenstrual =>
      'Under mens är sömnen ofta mer fragmenterad — kramper, obehag och för vissa tätare toalettbesök kan väcka på natten. En varm dusch, värmedyna eller lätt stretching före sänggåendet kan lindra kramper. Tar du smärtstillande kan rätt timing skydda den tidiga sömnen.';

  @override
  String get tipSleepDetailFollicular =>
      'Med stigande östrogen känner sig många piggare och mer energiska, vilket kan kännas som mindre sömnbehov. Det stämmer inte riktigt — att vara vaken kommer bara lättare. Att hålla fast läggtid här lönar sig senare, när sömnen blir skörare i andra faser.';

  @override
  String get tipSleepDetailFertile =>
      'Den lilla temperaturhöjningen kring ägglossning kan göra det lite svårare att somna, eftersom kroppen naturligt vill svalna före sömn. Ett svalare rum, ett lättare täcke eller en varm dusch före sänggåendet kan kompensera för det. Den som märker ökad lust eller social energi denna period kanske också väljer att vara uppe längre.';

  @override
  String get tipSleepDetailLuteal =>
      'Progesteron som stiger efter ägglossning höjer vilotemperaturen något, vilket kan göra djupsömnen lättare — ibland som en mild värmevallning, ibland bara som mindre återhämtande sömn. När mens närmar sig kan premenstruell spänning tillkomma. Ett svalt, mörkt rum, mindre skärmtid före sänggåendet och en fast läggtid hjälper mest här.';

  @override
  String get tipSleepDetailUnknown =>
      'Det finns ännu inte tillräckligt med data för att avgöra fasen, men skiftande sömnkvalitet under cykeln är ett vanligt mönster — vanligtvis skörare strax före och under mens, stabilare i första halvan. Den mest pålitliga grunden oavsett fas: fasta sov- och vakentider, mindre skärmtid före sänggåendet och ett svalt, mörkt rum.';
}
