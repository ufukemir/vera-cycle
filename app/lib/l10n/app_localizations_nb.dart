// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Norwegian Bokmål (`nb`).
class AppLocalizationsNb extends AppLocalizations {
  AppLocalizationsNb([String locale = 'nb']) : super(locale);

  @override
  String get appTitle => 'Vera';

  @override
  String get actionSkip => 'Hopp over';

  @override
  String get actionContinue => 'Fortsett';

  @override
  String get actionDone => 'Ferdig';

  @override
  String get actionCancel => 'Avbryt';

  @override
  String get actionClear => 'Fjern';

  @override
  String get actionDelete => 'Slett';

  @override
  String get actionEnable => 'Slå på';

  @override
  String get commonIDontKnow => 'Jeg vet ikke';

  @override
  String get commonYes => 'Ja';

  @override
  String get commonNo => 'Nei';

  @override
  String get commonNotSure => 'Usikker';

  @override
  String get pinSetupTitle => 'Lag en PIN';

  @override
  String get pinSetupEnterPrompt => 'Velg en 6-sifret PIN for å låse appen';

  @override
  String get pinSetupConfirmPrompt =>
      'Skriv den inn en gang til for å bekrefte';

  @override
  String get pinSetupMismatch => 'De var ikke like — prøv en gang til';

  @override
  String get pinSetupBiometricTitle => 'Raskere opplåsing?';

  @override
  String get pinSetupBiometricBody =>
      'Du kan også bruke fingeravtrykk eller ansikt for å låse opp — PIN-en fungerer fortsatt som reserve.';

  @override
  String get lockScreenTitle => 'Låst';

  @override
  String get lockScreenEnterPin => 'Skriv inn PIN-en din';

  @override
  String get lockScreenWrongPin => 'Den PIN-en stemmer ikke';

  @override
  String get lockScreenUseBiometrics => 'Bruk biometri';

  @override
  String get lockScreenUseFaceId => 'Bruk Face ID';

  @override
  String get lockScreenUseFingerprint => 'Bruk fingeravtrykk';

  @override
  String get lockScreenForgotPin => 'Glemt PIN-en?';

  @override
  String get lockScreenForgotPinChoiceTitle =>
      'Hvordan vil du tilbakestille den?';

  @override
  String get lockScreenResetViaDevice => 'Bekreft med denne enheten';

  @override
  String get lockScreenResetViaDeviceBody =>
      'Dataene dine blir værende. Det holder å bekrefte med telefonens egen lås — Face ID, fingeravtrykk eller kode.';

  @override
  String get lockScreenResetViaDeviceReason => 'Bekreft for å angi en ny PIN';

  @override
  String lockScreenThrottled(int seconds) {
    return 'For mange forsøk. Prøv igjen om $seconds s';
  }

  @override
  String get lockScreenEraseTitle => 'Slette alle data?';

  @override
  String get lockScreenEraseBody =>
      'Dette sletter alt på denne enheten permanent. Det finnes ingen konto og ingen sikkerhetskopi på server, så dette kan ikke angres.';

  @override
  String get lockScreenEraseConfirm => 'Slett alt';

  @override
  String get onboardingPrivacyTitle => 'Velkommen';

  @override
  String get onboardingPrivacyBody =>
      'Syklusdataene dine blir liggende kryptert kun på denne enheten. Det finnes ingen konto og ingen skysynkronisering — ingenting du registrerer blir lastet opp. Nøkkelen ligger i telefonens sikre maskinvare, og du kan eksportere eller slette alt når du vil.';

  @override
  String get onboardingLastPeriodTitle => 'Når startet forrige mensen?';

  @override
  String get onboardingLastPeriodBody =>
      'Dette hjelper oss i gang — du kan alltid rette det opp senere fra kalenderen.';

  @override
  String get onboardingPickDate => 'Velg en dato';

  @override
  String get onboardingCycleLengthTitle =>
      'Hvor lang er syklusen din vanligvis?';

  @override
  String get onboardingCycleLengthBody =>
      'Et omtrentlig tall holder. Vi begynner å gi deg et reelt estimat når vi har sett et par hele sykluser.';

  @override
  String get onboardingPeriodLengthTitle =>
      'Hvor mange dager varer mensen din vanligvis?';

  @override
  String get onboardingPeriodLengthBody =>
      'Vi bruker dette til å fylle inn forrige mensen, så du ikke starter helt på null.';

  @override
  String get onboardingDaysUnit => 'dager';

  @override
  String get onboardingGoalTitle => 'Hva bringer deg hit?';

  @override
  String get onboardingGoalBody =>
      'Dette hjelper oss bare med å vise deg de riktige tingene først — du kan ombestemme deg når som helst i Innstillinger.';

  @override
  String get goalTrackPeriod => 'Følge med på mensen';

  @override
  String get goalTryingToConceive => 'Prøver å bli gravid';

  @override
  String get goalPregnancyTracking => 'Følge et svangerskap';

  @override
  String get onboardingRegularityTitle =>
      'Er mensen din vanligvis regelmessig?';

  @override
  String get onboardingRegularityBody =>
      'Det finnes ikke noe galt svar her — dette hjelper oss bare å bli litt kjent med kroppen din.';

  @override
  String get onboardingCrampsTitle => 'Pleier du å få menssmerter?';

  @override
  String get onboardingCrampsBody =>
      'Vi sørger for at det er enkelt å registrere hvordan du har det på slike dager.';

  @override
  String get onboardingBirthYearTitle => 'Hvilket år er du født?';

  @override
  String get onboardingBirthYearBody =>
      'Bare for et fyldigere bilde — brukes aldri til noen prediksjon.';

  @override
  String get onboardingPmsTitle => 'Pleier noe å vise seg på forhånd?';

  @override
  String get onboardingPmsBody =>
      'Velg så mange som passer. Lagres ingen steder, det finnes ikke noe feil svar.';

  @override
  String get onboardingNotificationTitle => 'Vil du ha rolige påminnelser?';

  @override
  String get onboardingNotificationBody =>
      'Vi kan gi deg et lite varsel før mensen er ventet.';

  @override
  String get onboardingNotificationMockTitle => 'Mensen din kan starte snart';

  @override
  String get onboardingNotificationMockBody =>
      'Basert på syklusene du har registrert';

  @override
  String get onboardingNotificationAllow => 'Slå på påminnelser';

  @override
  String get onboardingNotificationNotNow => 'Ikke nå';

  @override
  String get onboardingBuildingPlanTitle => 'Gjør klart for deg';

  @override
  String get onboardingBuildingPlanStep1 =>
      'Sikrer dataene dine på denne enheten';

  @override
  String get onboardingBuildingPlanStep2 => 'Lagrer innstillingene dine';

  @override
  String get onboardingBuildingPlanStep3 => 'Gjør kalenderen din klar';

  @override
  String get onboardingBuildingPlanDone => 'Alt klart';

  @override
  String get navHome => 'Hjem';

  @override
  String get navCalendar => 'Kalender';

  @override
  String get navInsights => 'Innsikt';

  @override
  String get navSettings => 'Innstillinger';

  @override
  String get navReminders => 'Påminnelser';

  @override
  String get navProfile => 'Profil';

  @override
  String get navTrack => 'Registrer';

  @override
  String homeCycleDayLabel(int day) {
    return 'Dag $day';
  }

  @override
  String get homeNoCycleYet => 'Ingen mens registrert ennå';

  @override
  String get homePhaseMenstrual => 'Mens';

  @override
  String get homePhaseFollicular => 'Follikkelfase';

  @override
  String get homePhaseFertileWindow => 'Estimert fruktbart vindu';

  @override
  String get homePhaseLuteal => 'Lutealfase';

  @override
  String get homePhaseUnknown => 'Ikke nok ferske data';

  @override
  String get homePredictionInsufficientTitle => 'Ikke nok data ennå';

  @override
  String get homePredictionInsufficientBody =>
      'Registrer neste mens, så begynner vi å estimere.';

  @override
  String homePredictionRangeLabel(String start, String end) {
    return '$start – $end';
  }

  @override
  String get homeConfidenceHigh => 'Høy sikkerhet';

  @override
  String get homeConfidenceMedium => 'Middels sikkerhet';

  @override
  String get homeConfidenceLow => 'Lav sikkerhet';

  @override
  String get homeIrregularNote =>
      'Sykluslengden din har variert mer enn vanlig i det siste. Hvis det er nytt for deg, kan det være verdt å nevne på en kontroll.';

  @override
  String get homeFertileWindowDisclaimer =>
      'Basert på vanlig syklustiming — ikke en prevensjonsmetode.';

  @override
  String get homePeriodStartedButton => 'Mensen startet i dag';

  @override
  String get homePeriodStartedSnackbar => 'Registrert — mensen startet i dag';

  @override
  String get actionUndo => 'Angre';

  @override
  String get comingSoon => 'Kommer snart';

  @override
  String get dayLogFlowLabel => 'Blødning';

  @override
  String get flowSpotting => 'Sporblødning';

  @override
  String get flowLight => 'Lett';

  @override
  String get flowMedium => 'Middels';

  @override
  String get flowHeavy => 'Kraftig';

  @override
  String get flowNone => 'Ingen';

  @override
  String get dayLogSymptomsLabel => 'Symptomer';

  @override
  String get symptomCramps => 'Menssmerter';

  @override
  String get symptomHeadache => 'Hodepine';

  @override
  String get symptomBloating => 'Oppblåsthet';

  @override
  String get symptomBreastTenderness => 'Ømme bryster';

  @override
  String get symptomAcne => 'Kviser';

  @override
  String get symptomFatigue => 'Slitenhet';

  @override
  String get symptomNausea => 'Kvalme';

  @override
  String get symptomBackPain => 'Ryggsmerter';

  @override
  String get symptomAppetiteChange => 'Endret appetitt';

  @override
  String get symptomSleepTrouble => 'Søvnproblemer';

  @override
  String get symptomPelvicPain => 'Bekkensmerter';

  @override
  String get symptomDizziness => 'Svimmelhet';

  @override
  String get symptomMigraine => 'Migrene';

  @override
  String get symptomHighFever => 'Høy feber';

  @override
  String get symptomNeckPain => 'Nakkesmerter';

  @override
  String get symptomShoulderPain => 'Skuldersmerter';

  @override
  String get symptomLimbPain => 'Smerter i lemmer';

  @override
  String get symptomMuscleAche => 'Muskelsmerter';

  @override
  String get symptomChills => 'Frysninger';

  @override
  String get symptomNightSweats => 'Nattesvette';

  @override
  String get symptomHotFlashes => 'Hetetokter';

  @override
  String get symptomWeightGain => 'Vektøkning';

  @override
  String get symptomConstipation => 'Forstoppelse';

  @override
  String get symptomDiarrhea => 'Diaré';

  @override
  String get symptomIndigestion => 'Fordøyelsesbesvær';

  @override
  String get symptomGasPain => 'Luftsmerter';

  @override
  String get symptomFeelingUnwell => 'Uvelhet';

  @override
  String get symptomItching => 'Kløe';

  @override
  String get symptomTroubleFocusing => 'Konsentrasjonsvansker';

  @override
  String get symptomForgetfulness => 'Glemsomhet';

  @override
  String get symptomGroupHead => 'Hode';

  @override
  String get symptomGroupBody => 'Kropp';

  @override
  String get symptomGroupAbdomen => 'Mage';

  @override
  String get symptomGroupGeneral => 'Generelt';

  @override
  String get symptomGroupCognitive => 'Kognitivt';

  @override
  String get dayLogMoodLabel => 'Humør';

  @override
  String get moodCalm => 'Rolig';

  @override
  String get moodAnxious => 'Engstelig';

  @override
  String get moodIrritable => 'Irritabel';

  @override
  String get moodLow => 'Nedstemt';

  @override
  String get moodEnergetic => 'Energisk';

  @override
  String get moodHappy => 'Glad';

  @override
  String get moodContent => 'Tilfreds';

  @override
  String get moodSad => 'Trist';

  @override
  String get moodDepressed => 'Deprimert';

  @override
  String get moodEmotional => 'Følelsesladd';

  @override
  String get moodExcited => 'Spent';

  @override
  String get moodHopeful => 'Håpefull';

  @override
  String get moodProud => 'Stolt';

  @override
  String get moodDisappointed => 'Skuffet';

  @override
  String get moodConfident => 'Selvsikker';

  @override
  String get moodSurprised => 'Overrasket';

  @override
  String get moodIndifferent => 'Likegyldig';

  @override
  String get moodPeaceful => 'Fredfull';

  @override
  String get moodInLove => 'Forelsket';

  @override
  String get moodShy => 'Sjenert';

  @override
  String get moodPlayful => 'Leken';

  @override
  String get moodExhausted => 'Utmattet';

  @override
  String get moodLonely => 'Ensom';

  @override
  String get moodOverwhelmed => 'Overveldet';

  @override
  String get moodGrateful => 'Takknemlig';

  @override
  String get moodNostalgic => 'Nostalgisk';

  @override
  String get dayLogNoteLabel => 'Notat';

  @override
  String get dayLogNoteHint => 'Noe du vil huske om dagen i dag';

  @override
  String get dayLogOptionalTrackersLabel => 'Valgfrie målinger';

  @override
  String get dayLogSexualActivityLabel => 'Seksuell aktivitet';

  @override
  String get sexLifeNone => 'Ingenting';

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
  String get sexLifeHighDesire => 'Høy lyst';

  @override
  String get dayLogBbtLabel => 'Basaltemperatur';

  @override
  String get dayLogMucusLabel => 'Livmorhalsslim';

  @override
  String get mucusDry => 'Tørt';

  @override
  String get mucusSticky => 'Klissete';

  @override
  String get mucusCreamy => 'Kremaktig';

  @override
  String get mucusWatery => 'Vannaktig';

  @override
  String get mucusEggWhite => 'Eggehvite';

  @override
  String get dayLogSavedIndicator => 'Lagret';

  @override
  String get homeOpenTodayLog => 'Legg til detaljer for i dag';

  @override
  String get calendarLegendActual => 'Registrert mens';

  @override
  String get calendarLegendPredicted => 'Forventet vindu';

  @override
  String get calendarLegendFertile => 'Estimert fruktbart vindu';

  @override
  String get calendarLegendOvulation => 'Estimert eggløsning';

  @override
  String get dayDetailFertileTitle => 'I det estimerte fruktbare vinduet ditt';

  @override
  String get dayDetailOvulationTitle => 'Estimert eggløsningsdag';

  @override
  String get dayDetailOvulationBody =>
      'Graviditet er vanligvis mer sannsynlig rundt denne dagen, ut fra vanlig timing — dette er et estimat, ikke en garanti.';

  @override
  String get insightsCyclesLoggedLabel => 'Registrerte sykluser';

  @override
  String get insightsAveragePeriodLengthLabel => 'Gjennomsnittlig menslengde';

  @override
  String get insightsAverageCycleLengthLabel => 'Gjennomsnittlig sykluslengde';

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
      other: 'Varierer med omtrent $daysString dager',
      one: 'Varierer med omtrent $daysString dag',
    );
    return '$_temp0';
  }

  @override
  String get insightsNotEnoughDataTitle => 'Ikke nok data ennå';

  @override
  String get insightsNotEnoughDataBody =>
      'Registrer et par hele sykluser, så dukker gjennomsnittene dine opp her.';

  @override
  String get insightsSymptomFrequencyTitle => 'Symptomer etter syklusdag';

  @override
  String get insightsNoSymptomsLogged => 'Ingen symptomer registrert ennå';

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
  String get tourSkip => 'Hopp over';

  @override
  String get tourNext => 'Neste';

  @override
  String get tourStart => 'La oss starte';

  @override
  String get tourHomeTitle => 'Hjem';

  @override
  String get tourHomeBody =>
      'Se på et blikk hvor du er i dag — syklusdagen din, hvor lenge det er til det anslåtte vinduet ditt, og følgesvennen din er alltid her.';

  @override
  String get tourCalendarTitle => 'Kalender';

  @override
  String get tourCalendarBody =>
      'Se tidligere og kommende sykluser i kalenderen. Trykk på en hvilken som helst dag for å åpne loggen.';

  @override
  String get tourTrackTitle => 'Registrer';

  @override
  String get tourTrackBody =>
      '+-knappen i midten åpner dagens logg uansett hvor du er — flyt, symptomer, humør og mer.';

  @override
  String get tourRemindersTitle => 'Påminnelser';

  @override
  String get tourRemindersBody =>
      'Sett påminnelser for kommende mensen, medisiner eller det å drikke vann — alt blir på telefonen din og sendes ingen andre steder.';

  @override
  String get tourProfileTitle => 'Profil';

  @override
  String get tourProfileBody =>
      'Finn innsiktene dine, alt du sporer, og innstillingene dine her.';

  @override
  String get settingsWeekStartLabel => 'Uken starter på';

  @override
  String get settingsWeekStartMonday => 'Mandag';

  @override
  String get settingsWeekStartSunday => 'Søndag';

  @override
  String get settingsTemperatureUnitLabel => 'Temperaturenhet';

  @override
  String get settingsTemperatureCelsius => 'Celsius';

  @override
  String get settingsTemperatureFahrenheit => 'Fahrenheit';

  @override
  String get settingsRemindersLabel => 'Minn meg på før mensen';

  @override
  String get remindersScreenTitle => 'Påminnelser';

  @override
  String get reminderDetailNotification => 'Varsel';

  @override
  String get reminderDetailAlert => 'Advarsel';

  @override
  String get reminderDetailAlertToday => 'Samme dag';

  @override
  String get reminderDetailTime => 'Tid';

  @override
  String get reminderDetailMessage => 'Melding';

  @override
  String get reminderDetailMessageEditTitle => 'Rediger melding';

  @override
  String get reminderDetailMessageHint => 'Skriv din egen melding';

  @override
  String reminderDetailAlertDaysBefore(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count dager tidligere',
      one: '$count dag tidligere',
    );
    return '$_temp0';
  }

  @override
  String optionsShowMore(int count) {
    return '+$count til';
  }

  @override
  String get optionsShowLess => 'Vis færre';

  @override
  String get trackerHistoryEntry => 'Historikk';

  @override
  String get actionSend => 'Send';

  @override
  String get actionRemove => 'Fjern';

  @override
  String get feedbackEntry => 'Tilbakemelding';

  @override
  String get cloudBackupEntry => 'Sikkerhetskopiér med konto';

  @override
  String get cloudBackupTitle => 'Sikkerhetskopiér med konto';

  @override
  String get cloudBackupNotConfiguredTitle =>
      'Ikke tilgjengelig i denne versjonen ennå';

  @override
  String get cloudBackupNotConfiguredBody =>
      'Sky-sikkerhetskopiering trenger en kontotjeneste som ikke er satt opp for denne versjonen ennå. Ingenting her kan brukes før den er det.';

  @override
  String get cloudBackupIntro1Title => 'Mist aldri historikken din';

  @override
  String get cloudBackupIntro1Body =>
      'Syklushistorikken din forblir trygg selv om du mister telefonen eller bytter til en ny.';

  @override
  String get cloudBackupIntro2Title => 'Bare du kan åpne den';

  @override
  String get cloudBackupIntro2Body =>
      'Sikkerhetskopien din krypteres med et passord før den forlater telefonen din — vi kan ikke lese den, og det kan ingen andre heller.';

  @override
  String get cloudBackupIntro3Title => 'Gjenopprett på sekunder';

  @override
  String get cloudBackupIntro3Body =>
      'Logg inn på en ny enhet og hent historikken din tilbake med samme passord.';

  @override
  String get cloudBackupSignedInTitle => 'Logget inn';

  @override
  String get cloudBackupUploadButton => 'Sikkerhetskopiér nå';

  @override
  String get cloudBackupDownloadButton => 'Gjenopprett fra skyen';

  @override
  String get cloudBackupUploadSuccess => 'Sikkerhetskopiert til kontoen din';

  @override
  String get cloudBackupNoBackupFound =>
      'Ingen sky-sikkerhetskopi funnet for denne kontoen ennå.';

  @override
  String get partnerModeEntry => 'Partnermodus';

  @override
  String get partnerModeTitle => 'Partnermodus';

  @override
  String get partnerModeNotConfiguredTitle =>
      'Ikke tilgjengelig i denne versjonen ennå';

  @override
  String get partnerModeNotConfiguredBody =>
      'Partnermodus trenger en kontotjeneste som ikke er satt opp for denne versjonen ennå. Ingenting her kan brukes før den er det.';

  @override
  String get partnerModeHeroTitle => 'Del litt, på dine egne premisser';

  @override
  String get partnerModeHeroBody =>
      'Par deg med partneren din og del bare det du slår på nedenfor — aldri hele historikken din, aldri automatisk.';

  @override
  String get partnerModeSignInGoogle => 'Fortsett med Google';

  @override
  String get partnerModeSignInApple => 'Fortsett med Apple';

  @override
  String get partnerModeFaqTitle => 'Før du logger inn';

  @override
  String get partnerModeFaq1Q => 'Hva vil partneren min faktisk se?';

  @override
  String get partnerModeFaq1A =>
      'Bare feltene du slår på i Partnermodus, og bare den nåværende tilstanden din — aldri den lagrede historikken din, og aldri noe du ikke uttrykkelig har delt.';

  @override
  String get partnerModeFaq2Q => 'Kan jeg slå det av senere?';

  @override
  String get partnerModeFaq2A =>
      'Ja. Å oppheve paringen stopper delingen umiddelbart for dere begge, og du kan slå av enhver bryter når som helst uten å oppheve paringen.';

  @override
  String get partnerModeFaq3Q => 'Trenger partneren min denne appen?';

  @override
  String get partnerModeFaq3A =>
      'Ja — de logger inn på samme måte og parer seg med en kode du sender dem.';

  @override
  String get partnerModeNotPairedTitle => 'Ikke paret ennå';

  @override
  String get partnerModeNotPairedBody =>
      'Inviter partneren din med en engangskode, eller angi koden de sendte deg.';

  @override
  String get partnerModeInviteButton => 'Inviter partneren min';

  @override
  String get partnerModeEnterCodeButton => 'Angi en kode';

  @override
  String get partnerModeSignOut => 'Logg ut';

  @override
  String get partnerModePairedTitle => 'Paret';

  @override
  String get partnerModePairedBody =>
      'Du og partneren din er koblet sammen. Deling gjelder fortsatt bare det du slår på nedenfor.';

  @override
  String get partnerModeShareSectionTitle => 'Hva du deler';

  @override
  String get partnerModeShareCyclePhase => 'Syklusfase og -dag';

  @override
  String get partnerModeShareMood => 'Dagens humør';

  @override
  String get partnerModeShareSymptoms => 'Dagens symptomer';

  @override
  String get partnerModeShareHighDesire => 'Lyst på nærhet i dag';

  @override
  String get partnerModeShareNow => 'Del nå';

  @override
  String get partnerModeShareSuccess => 'Delt med partneren din';

  @override
  String get partnerModeUnpair => 'Opphev paring';

  @override
  String get partnerModeUnpairConfirmTitle =>
      'Oppheve paring med partneren din?';

  @override
  String get partnerModeUnpairConfirmBody =>
      'Dette stopper delingen umiddelbart for dere begge. Dere kan pare dere igjen senere med en ny kode.';

  @override
  String get partnerModePartnerSnapshotEmpty =>
      'Partneren din har ikke delt noe ennå.';

  @override
  String get partnerModeErrorNotConfigured =>
      'Partnermodus er ikke satt opp i denne versjonen ennå.';

  @override
  String get partnerModeErrorCodeNotFound =>
      'Fant ikke den koden. Sjekk den og prøv igjen.';

  @override
  String get partnerModeErrorCodeExpired => 'Den koden er utløpt. Be om en ny.';

  @override
  String get partnerModeErrorCodeIsOwn =>
      'Det er din egen kode — be partneren din om deres.';

  @override
  String get partnerModeErrorNotSignedIn => 'Logg inn først.';

  @override
  String get partnerModeErrorUnknown => 'Noe gikk galt. Prøv igjen.';

  @override
  String get partnerModeInviteTitle => 'Inviter partneren din';

  @override
  String get partnerModeInviteBody =>
      'Send denne koden til partneren din. De taster den inn i sin egen app for å pare seg med deg.';

  @override
  String get partnerModeInviteExpiry => 'Gyldig i 7 dager';

  @override
  String get partnerModeInviteShare => 'Del kode';

  @override
  String partnerModeInviteMessage(String code) {
    return 'Her er min Vera-paringskode: $code';
  }

  @override
  String get partnerModeEnterTitle => 'Angi en kode';

  @override
  String get partnerModeEnterBody => 'Angi koden partneren din sendte deg.';

  @override
  String get partnerModeEnterHint => '6-tegns kode';

  @override
  String get partnerModeEnterSubmit => 'Par';

  @override
  String get homeInvitePartnerTitle => 'Del med partneren din';

  @override
  String get homeInvitePartnerBody =>
      'Par dere, og del bare det du velger — historikken din forblir din.';

  @override
  String get homeInvitePartnerCta => 'Sett opp Partnermodus';

  @override
  String get feedbackTitle => 'Hva likte du ikke?';

  @override
  String get feedbackSubtitle => 'Velg et tema, og skriv mer hvis du vil.';

  @override
  String get feedbackCategoryPredictions => 'Prognoser';

  @override
  String get feedbackCategoryBackup => 'Sikkerhetskopiering';

  @override
  String get feedbackCategorySubscription => 'Abonnement';

  @override
  String get feedbackCategoryAds => 'Annonser';

  @override
  String get feedbackCategoryDesign => 'Design';

  @override
  String get feedbackCategoryTranslation => 'Oversettelse';

  @override
  String get feedbackCategoryOther => 'Annet';

  @override
  String get feedbackDescriptionLabel => 'Fortell oss mer (valgfritt)';

  @override
  String get feedbackDescriptionHint =>
      'Hva skjedde? Når du trykker Send, velger du selv hvor du deler det — e-postappen din eller et annet sted.';

  @override
  String get feedbackAttachPhoto => 'Legg til bilde';

  @override
  String get feedbackPhotoAttached => 'Bilde lagt ved';

  @override
  String get remindersGroupCycle => 'Menstruasjon og fruktbarhet';

  @override
  String get remindersGroupMedication => 'Medisin';

  @override
  String get remindersGroupLifestyle => 'Livsstil';

  @override
  String get remindersGroupAppointment => 'Legetimer';

  @override
  String get settingsRemindersPeriodEndLabel =>
      'Sjekk inn når mensen skal være over';

  @override
  String get settingsRemindersMedicationLabel => 'Påminnelse om medisiner';

  @override
  String get settingsRemindersWaterLabel => 'Påminnelse om vann';

  @override
  String get settingsRemindersAppointmentLabel => 'Påminnelse om legetime';

  @override
  String get settingsRemindersAppointmentSet => 'Velg dato og tid';

  @override
  String get settingsRemindersAppointmentClear => 'Fjern';

  @override
  String get settingsOptionalTrackersHeading => 'Valgfrie målinger';

  @override
  String get settingsOptionalTrackersBody =>
      'Av som standard. Slår du på én, legges den til i dagsloggen.';

  @override
  String get settingsSexualActivityToggle => 'Seksuell aktivitet';

  @override
  String get settingsBbtToggle => 'Basaltemperatur';

  @override
  String get settingsMucusToggle => 'Livmorhalsslim';

  @override
  String get settingsBreastExamToggle => 'Egenundersøkelse av brystene';

  @override
  String get settingsCervixToggle => 'Livmorhalsens posisjon og fasthet';

  @override
  String get settingsPrivacyEntry => 'Personvern';

  @override
  String get settingsRateEntry => 'Vurder oss';

  @override
  String get rateAppTitle => 'Fungerer Vera for deg?';

  @override
  String get rateAppBody =>
      'Hvis ja, hjelper noen sekunders vurdering i butikken andre som leter etter noe lignende med å faktisk finne den.';

  @override
  String get rateAppCta => 'Vurder Vera';

  @override
  String get rateAppDismiss => 'Ikke nå';

  @override
  String get settingsDeleteAllData => 'Slett alle data';

  @override
  String get privacyScreenTitle => 'Personvern';

  @override
  String get privacyScreenIntro =>
      'Her er nøyaktig hva som skjer med dataene dine, i klart språk.';

  @override
  String get privacyScreenStorageTitle => 'Kryptert på denne enheten';

  @override
  String get privacyScreenNoNetworkTitle => 'Ingen server, ingen konto';

  @override
  String get privacyScreenNoThirdPartyTitle => 'Ingen sporing';

  @override
  String get privacyScreenExportTitle => 'Bare du kan eksportere';

  @override
  String get privacyScreenDeleteTitle => 'Sletting er endelig';

  @override
  String get privacyScreenStorage =>
      'Alt du registrerer krypteres og lagres kun på denne enheten, i én enkelt fil. Krypteringsnøkkelen ligger i telefonens sikre maskinvare — Keychain på iOS, Keystore på Android — ikke i filen selv.';

  @override
  String get privacyScreenNoNetwork =>
      'Denne appen har ingen egen server og ikke noe kontosystem — det du registrerer, blir aldri lastet opp. Gratisversjonen inneholder annonser fra Google, som kobler seg til internett; de får aldri noe av det du registrerer.';

  @override
  String get privacyScreenNoThirdParty =>
      'Det finnes ingen analyseverktøy, ingen krasjrapportering og ingen sporings-SDK. Den eneste tredjepartskomponenten er Googles annonse-SDK i gratisversjonen — Premium fjerner den helt.';

  @override
  String get privacyScreenExport =>
      'Den eneste måten dataene dine noen gang forlater denne enheten på, er hvis du eksporterer dem selv, og den eksporten er kryptert med et passord bare du kjenner.';

  @override
  String get privacyScreenDelete =>
      'Sletting av dataene dine er reell og skjer umiddelbart. Det finnes ingen konto og ingen sikkerhetskopi hos oss — når det er borte, er det borte.';

  @override
  String get adPlaceholderLabel => 'Annonseplass';

  @override
  String get adPlaceholderUpgradeCta => 'Bli annonsefri med Premium';

  @override
  String get reminderNotificationTitle => 'Mensen din kan starte snart';

  @override
  String get reminderNotificationBody =>
      'Basert på syklusene du har registrert nærmer det estimerte vinduet ditt seg.';

  @override
  String get reminderPeriodEndTitle =>
      'Mensen din kan være i ferd med å avsluttes';

  @override
  String get reminderPeriodEndBody =>
      'Hvis den fortsatt pågår, er det helt normalt — bare en vennlig sjekk.';

  @override
  String get reminderMedicationTitle => 'Påminnelse om medisiner';

  @override
  String get reminderMedicationBody => 'På tide å ta medisinen din.';

  @override
  String get reminderWaterTitle => 'Husk å drikke vann';

  @override
  String get reminderWaterBody => 'En liten vannpåminnelse.';

  @override
  String get reminderAppointmentTitle => 'Kommende legetime';

  @override
  String get reminderAppointmentBody => 'Du har en legetime på vei.';

  @override
  String get settingsExportEntry => 'Eksport og sikkerhetskopi';

  @override
  String get exportBackupHeading => 'Kryptert sikkerhetskopi';

  @override
  String get exportBackupBody =>
      'Lagre en kryptert kopi av historikken din for å flytte til en ny enhet. Du trenger passordet igjen for å gjenopprette den — det finnes ingen annen måte å hente det tilbake på.';

  @override
  String get exportCreateBackupButton => 'Lag sikkerhetskopi';

  @override
  String get exportRestoreBackupButton => 'Gjenopprett fra sikkerhetskopi';

  @override
  String get exportPasswordLabel => 'Passord';

  @override
  String get exportPasswordConfirmLabel => 'Bekreft passord';

  @override
  String get exportPasswordMismatch => 'Passordene er ikke like';

  @override
  String get exportPasswordTooShort => 'Bruk minst 8 tegn';

  @override
  String get exportRestoreConfirmTitle =>
      'Erstatte alle data på denne enheten?';

  @override
  String get exportRestoreConfirmBody =>
      'Å gjenopprette en sikkerhetskopi erstatter alt som er registrert på denne enheten nå. Dette kan ikke angres.';

  @override
  String get exportRestoreConfirmAction => 'Gjenopprett';

  @override
  String get exportWrongPassword =>
      'Det passordet passer ikke til denne sikkerhetskopien';

  @override
  String get exportInvalidFile =>
      'Den filen ser ikke ut som en Vera-sikkerhetskopi';

  @override
  String get exportBackupCreated => 'Sikkerhetskopien er klar til deling';

  @override
  String get exportRestoreSuccess => 'Sikkerhetskopi gjenopprettet';

  @override
  String get exportDoctorReportHeading => 'Legerapport';

  @override
  String get exportDoctorReportBody =>
      'Et sammendrag du kan dele med helsepersonell.';

  @override
  String get exportIncludeNotesToggle => 'Ta med personlige notater';

  @override
  String get exportShareCsvButton => 'Del som CSV';

  @override
  String get exportPrintPdfButton => 'Skriv ut / lagre som PDF';

  @override
  String get doctorReportDisclaimer =>
      'Generert av Vera fra data lagt inn av brukeren. Ikke en medisinsk diagnose.';

  @override
  String get doctorReportGeneratedOn => 'Generert';

  @override
  String get doctorReportSummaryHeading => 'Sammendrag';

  @override
  String get doctorReportDailyLogHeading => 'Daglig logg';

  @override
  String get doctorReportColumnDate => 'Dato';

  @override
  String get doctorReportTimelineHeading => 'Syklustidslinje';

  @override
  String get doctorReportCycleLabel => 'Syklus';

  @override
  String get doctorReportTimelineLegendPeriod => 'Mens';

  @override
  String get doctorReportTimelineLegendCycle => 'Resten av syklusen';

  @override
  String get doctorReportTimelineOngoing => 'Pågår';

  @override
  String get dailyInsightLabel => 'Visste du at?';

  @override
  String get insightMenstrual1 =>
      'Livmorslimhinnen din støtes ut akkurat nå — de fleste menstruasjoner varer 3 til 7 dager, og det er helt normalt.';

  @override
  String get insightMenstrual2 =>
      'Jernrik mat som mørkegrønne bladgrønnsaker og linser kan bidra til å erstatte det kroppen mister denne uken.';

  @override
  String get insightFollicular1 =>
      'Østrogenet stiger, og mange merker mer energi og bedre konsentrasjon omtrent fra nå.';

  @override
  String get insightFollicular2 =>
      'Kroppen din gjør klar et egg for eggløsning — denne fasen kan vare alt fra en uke til noen uker.';

  @override
  String get insightFertile1 =>
      'Dette er det estimerte fruktbare vinduet ditt — dagene rundt eggløsningen der graviditet er mest sannsynlig, ut fra vanlig timing.';

  @override
  String get insightFertile2 =>
      'Noen merker en liten økning i basaltemperaturen eller endringer i livmorhalsslimet rundt eggløsningen.';

  @override
  String get insightLuteal1 =>
      'Progesteronet stiger etter eggløsningen — det er ofte da PMS-symptomer som humørsvingninger eller oppblåsthet dukker opp.';

  @override
  String get insightLuteal2 =>
      'Hvis et svangerskap ikke har festet seg, faller hormonnivåene mot slutten av denne fasen, og det utløser neste mens.';

  @override
  String get insightUnknown1 =>
      'Sykluslengder varierer mye fra person til person — alt fra 21 til 35 dager regnes som vanlig.';

  @override
  String get insightsPhaseTipsTitle => 'Kan føles godt i denne fasen';

  @override
  String get tipFitnessLabel => 'Bevegelse';

  @override
  String get tipNutritionLabel => 'Ernæring';

  @override
  String get tipFitnessMenstrual =>
      'Rolig bevegelse — gåturer, tøying eller restorativ yoga — kan føles bedre enn harde økter akkurat nå.';

  @override
  String get tipFitnessFollicular =>
      'Energien stiger ofte i denne fasen — et godt tidsrom for å prøve en ny treningsform eller pushe litt hardere.';

  @override
  String get tipFitnessFertile =>
      'Mange føler seg på sitt mest energiske her — en god fase for hardere trening hvis det frister deg.';

  @override
  String get tipFitnessLuteal =>
      'Hvis energien synker senere i denne fasen, kan roligere styrketrening eller svømming føles mer bærekraftig.';

  @override
  String get tipFitnessUnknown =>
      'Den bevegelsen som føles bra i dag, er et godt valg — det finnes ingen enkelt «riktig» rutine for hver dag.';

  @override
  String get tipNutritionMenstrual =>
      'Jernrik mat som mørkegrønne bladgrønnsaker, linser og rødt kjøtt kan bidra til å erstatte det kroppen mister denne uken.';

  @override
  String get tipNutritionFollicular =>
      'Lettere, ferske måltider faller ofte godt når energien stiger — men det finnes ingen enkelt «riktig» måte å spise på i denne fasen.';

  @override
  String get tipNutritionFertile =>
      'Å drikke nok og holde måltidene balanserte støtter energien gjennom denne mer aktive fasen.';

  @override
  String get tipNutritionLuteal =>
      'Suget kan endre seg her — komplekse karbohydrater og magnesiumrik mat som nøtter og mørk sjokolade er vanlige favoritter.';

  @override
  String get tipNutritionUnknown =>
      'Balanserte, regelmessige måltider er et godt utgangspunkt når fasen din ennå ikke er klar.';

  @override
  String get predictionSettingsEntry => 'Innstillinger for prediksjon';

  @override
  String get predictionSettingsIntro =>
      'Dette er antakelser, vist åpent. Når du har registrert 2 hele sykluser, regnes den reelle prediksjonen på Hjem ut fra dine egne data — disse tallene brukes ikke lenger til det.';

  @override
  String get predictionSettingsPeriodLengthLabel => 'Vanlig menslengde';

  @override
  String get predictionSettingsCycleLengthLabel => 'Vanlig sykluslengde';

  @override
  String get predictionSettingsCycleLengthHint =>
      'Brukes til å skalere ringen på Hjem inntil vi har reelle data.';

  @override
  String get predictionSettingsLutealLabel => 'Lengde på lutealfasen';

  @override
  String get predictionSettingsLutealHint =>
      'De typiske dagene mellom eggløsning og neste mens. Brukes til å plassere det estimerte fruktbare vinduet — denne fortsetter å bli brukt også etter at reelle prediksjoner starter.';

  @override
  String get dayLogEnergyLabel => 'Energi';

  @override
  String get energyLevelLow => 'Lav';

  @override
  String get energyLevelMedium => 'Middels';

  @override
  String get energyLevelHigh => 'Høy';

  @override
  String get energyLevelEnergetic => 'Full av energi';

  @override
  String get dayLogSkinHairLabel => 'Hud og hår';

  @override
  String get skinHealthyGlow => 'Frisk glød';

  @override
  String get skinRedness => 'Rødhet';

  @override
  String get skinDryness => 'Tørrhet';

  @override
  String get skinOiliness => 'Fet hud';

  @override
  String get hairGoodDay => 'God hårdag';

  @override
  String get hairBadDay => 'Dårlig hårdag';

  @override
  String get hairLoss => 'Hårtap';

  @override
  String get scalpOily => 'Fet hodebunn';

  @override
  String get dayLogBreastExamLabel => 'Egenundersøkelse av brystene';

  @override
  String get breastExamAllNormal => 'Ingenting uvanlig';

  @override
  String get breastExamLump => 'Kul';

  @override
  String get breastExamIndentation => 'Innsynkning';

  @override
  String get breastExamRedness => 'Rødhet';

  @override
  String get breastExamCrackedNipple => 'Sprukken brystvorte';

  @override
  String get breastExamDischarge => 'Utflod fra brystvorten';

  @override
  String get cervixPositionLabel => 'Livmorhalsens posisjon';

  @override
  String get cervixPositionLow => 'Lav';

  @override
  String get cervixPositionMedium => 'Middels';

  @override
  String get cervixPositionHigh => 'Høy';

  @override
  String get cervixOpeningLabel => 'Livmorhalsens åpning';

  @override
  String get cervixOpeningClosed => 'Lukket';

  @override
  String get cervixOpeningMedium => 'Middels';

  @override
  String get cervixOpeningOpen => 'Åpen';

  @override
  String get cervixFirmnessLabel => 'Livmorhalsens fasthet';

  @override
  String get cervixFirmnessSoft => 'Myk';

  @override
  String get cervixFirmnessMedium => 'Middels';

  @override
  String get cervixFirmnessFirm => 'Fast';

  @override
  String get dayLogWaterLabel => 'Vann';

  @override
  String get dayLogSleepLabel => 'Søvn';

  @override
  String get dayLogWeightLabel => 'Vekt';

  @override
  String get dayLogMedicationsLabel => 'Medisiner';

  @override
  String get dayLogAddMedication => 'Legg til medisin';

  @override
  String get dayLogMedicationNameHint => 'Navn på medisin';

  @override
  String get dayLogBirthControlLabel => 'Prevensjon';

  @override
  String get dayLogOtherMedicationsLabel => 'Andre medisiner';

  @override
  String get birthControlPillTaken => 'Pille tatt';

  @override
  String get birthControlPillLate => 'Pille tatt for sent';

  @override
  String get birthControlPillMissed => 'Pille glemt';

  @override
  String get birthControlPatch => 'Plaster';

  @override
  String get birthControlRing => 'Ring';

  @override
  String get birthControlInjection => 'Injeksjon';

  @override
  String get birthControlImplant => 'Implantat';

  @override
  String get birthControlIud => 'Spiral';

  @override
  String get navAssistant => 'Assistent';

  @override
  String get assistantTitle => 'Vera-assistent';

  @override
  String get assistantEndChatTitle => 'Avslutte denne samtalen?';

  @override
  String get assistantEndChatBody =>
      'Meldingene finnes bare i minnet og lagres ingen steder, så de kan ikke hentes tilbake.';

  @override
  String get assistantEndChatConfirm => 'Avslutt samtale';

  @override
  String get assistantInputHint => 'Spør om syklusen din…';

  @override
  String get assistantIntro =>
      'Hei! Her kan du stille spørsmål om mensen, sykluser og hvordan Vera fungerer — svarene kommer fra kunnskapsbasen på telefonen din, og ingenting forlater enheten. Dette er ikke medisinske råd.';

  @override
  String get insightMenstrual3 =>
      'Mensblod er ikke «urent blod» — det er en blanding av blod og livmorslimhinne, en helt normal del av syklusen.';

  @override
  String get insightMenstrual4 =>
      'Mild varme på nedre del av magen lindrer faktisk menssmerter — en varmeflaske er en klassiker med forskning bak seg.';

  @override
  String get insightMenstrual5 =>
      'Blødningen er ofte kraftigst de første to dagene og avtar etterpå — det mønsteret er vanlig.';

  @override
  String get insightMenstrual6 =>
      'Å føle seg litt mer sliten under mensen er vanlig — jern forlater kroppen med mensblodet.';

  @override
  String get insightFollicular3 =>
      'Østrogenet bygger opp livmorslimhinnen igjen etter mensen — kroppen din gjør klar på nytt.';

  @override
  String get insightFollicular4 =>
      'Huden ser ofte klarest ut i denne fasen når hormonnivåene faller til ro.';

  @override
  String get insightFollicular5 =>
      'Utholdenhet og reaksjonstid er på topp sent i follikkelfasen for mange.';

  @override
  String get insightFollicular6 =>
      'Lengden på denne fasen er det som varierer mest mellom folk — lutealfasen er langt mer konstant.';

  @override
  String get insightFertile3 =>
      'Et egg lever omtrent 12–24 timer, men sædceller kan vente i opptil 5 dager — det er derfor det fruktbare vinduet strekker seg over flere dager.';

  @override
  String get insightFertile4 =>
      'Rundt eggløsningen blir livmorhalsslimet ofte klart og trådtrekkende — som rå eggehvite.';

  @override
  String get insightFertile5 =>
      'Noen kjenner en kort ensidig stikking ved eggløsning — det har til og med et navn: mittelschmerz.';

  @override
  String get insightFertile6 =>
      'Basaltemperaturen stiger litt *etter* eggløsningen — den bekrefter at den har skjedd, i stedet for å forutsi den.';

  @override
  String get insightLuteal3 =>
      'Progesteronet er på topp omtrent en uke etter eggløsningen — oppblåsthet og ømme bryster rundt da er vanlig.';

  @override
  String get insightLuteal4 =>
      'Å ha sug etter karbohydrater før mensen er reelt — energibehovet stiger litt i lutealfasen.';

  @override
  String get insightLuteal5 =>
      'PMS-symptomer avtar vanligvis i løpet av en dag eller to etter at blødningen starter.';

  @override
  String get insightLuteal6 =>
      'En jevn søvnrutine kan merkbart dempe humørdipper sent i lutealfasen.';

  @override
  String get insightUnknown2 =>
      'Å følge med på bare tre sykluser er ofte nok til å se ditt eget mønster tre frem.';

  @override
  String get insightUnknown3 =>
      'Sykluser er personlige — å sammenligne din med en venns forteller sjelden noe nyttig.';

  @override
  String get insightUnknown4 =>
      'Stress, reiser og sykdom kan alle forskyve eggløsningen — en «forsinket» mens betyr ofte bare forsinket eggløsning.';

  @override
  String get settingsThemeLabel => 'Tema';

  @override
  String get settingsThemeSystem => 'System';

  @override
  String get settingsThemeLight => 'Lyst';

  @override
  String get settingsThemeDark => 'Mørkt';

  @override
  String get settingsMascotLabel => 'Følgesvenn';

  @override
  String get mascotDroplet => 'Dråpe';

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
      other: 'Det forventede vinduet starter om omtrent $days dager',
      one: 'Det forventede vinduet starter om omtrent $days dag',
    );
    return '$_temp0';
  }

  @override
  String homeOvulationCountdown(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: 'Estimert eggløsning om omtrent $days dager',
      one: 'Estimert eggløsning om omtrent $days dag',
    );
    return '$_temp0';
  }

  @override
  String get homeQuickLogTitle => 'Hvordan føles kroppen din i dag?';

  @override
  String get actionSave => 'Lagre';

  @override
  String get insightsTrackerHubTitle => 'Målingene dine';

  @override
  String get trackerHistoryEmpty => 'Ingen oppføringer i dette tidsrommet ennå';

  @override
  String get trackerStatAverage => 'Gjennomsnitt';

  @override
  String get trackerStatLowest => 'Laveste';

  @override
  String get trackerStatHighest => 'Høyeste';

  @override
  String get trackerStatLatest => 'Siste';

  @override
  String get rangeFilter1m => '1 mnd';

  @override
  String get rangeFilter3m => '3 mnd';

  @override
  String get rangeFilter6m => '6 mnd';

  @override
  String get dayLogOvulationTestLabel => 'Eggløsningstest';

  @override
  String get ovulationTestNegative => 'Negativ';

  @override
  String get ovulationTestPositive => 'Positiv';

  @override
  String get ovulationTestLow => 'Lav';

  @override
  String get ovulationTestHigh => 'Høy';

  @override
  String get ovulationTestPeak => 'Topp';

  @override
  String get pregnancyTestLabel => 'Graviditetstest';

  @override
  String get pregnancyTestPositive => 'Positiv';

  @override
  String get pregnancyTestFaint => 'Svak strek';

  @override
  String get pregnancyTestNegative => 'Negativ';

  @override
  String get settingsOvulationTestToggle => 'Eggløsningstest';

  @override
  String get settingsRemindersOvulationLabel => 'Varsel om fruktbart vindu';

  @override
  String get reminderOvulationTitle => 'Estimert fruktbart vindu nærmer seg';

  @override
  String get reminderOvulationBody =>
      'Basert på syklusene du har registrert kan det estimerte fruktbare vinduet ditt starte snart.';

  @override
  String trackerEntriesCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count oppføringer',
      one: '$count oppføring',
    );
    return '$_temp0';
  }

  @override
  String get trackerLowSampleNote =>
      'Med så få oppføringer er prosentene ikke pålitelige ennå — de blir skarpere etter hvert som du logger mer.';

  @override
  String get assistantTyping => 'Vera skriver…';

  @override
  String get premiumTitle => 'Vera Premium';

  @override
  String get premiumHeadline => 'Vera Premium';

  @override
  String get premiumSubhead =>
      'Alle registreringsfunksjoner er gratis for alltid — historikken din blir aldri låst inne. Premium legger til dine egne målinger, dypere innsikt, dine egne påminnelser og flere utseender, og fjerner annonsene.';

  @override
  String get premiumBenefitNoAds => 'Ingen annonser, ingen steder i appen';

  @override
  String get premiumBenefitSupport =>
      'Støtter en uavhengig app som setter personvern først';

  @override
  String get premiumMonthly => 'Månedlig';

  @override
  String get premiumYearly => 'Årlig';

  @override
  String get premiumYearlyNote => 'Faktureres én gang i året';

  @override
  String premiumPerMonth(String price) {
    return '$price / måned';
  }

  @override
  String get premiumBilledMonthly => 'Faktureres månedlig';

  @override
  String get premiumStaysFreeTitle => 'Det som forblir gratis';

  @override
  String get premiumStaysFreeBody =>
      'Kalenderen, hele historikken din, grunnleggende statistikk og eksport er gratis for alltid. Premium legger til noe – det tar aldri noe bort.';

  @override
  String get premiumSubscribeCta => 'Fortsett';

  @override
  String get premiumRestore => 'Gjenopprett kjøp';

  @override
  String get premiumCancelNote =>
      'Avslutt når som helst i app-butikkontoen din. Ingen nedtellinger, ingen press — hvis tiden ikke er inne nå, fortsetter gratisversjonen å fungere nøyaktig som i dag.';

  @override
  String get premiumActiveBadge => 'Premium er aktivt';

  @override
  String get premiumDevToggle => 'Simuler Premium (utvikling)';

  @override
  String get settingsPremiumEntry => 'Vera Premium';

  @override
  String get adTestNotice => 'Testannonse — ikke en ekte plassering ennå';

  @override
  String get settingsPregnancyModeLabel => 'Svangerskapsmodus';

  @override
  String get pregnancyLmpLabel => 'Første dag i siste mens';

  @override
  String pregnancyWeekLabel(int weeks, int days) {
    return 'Uke $weeks, dag $days';
  }

  @override
  String get pregnancyDueDateLabel => 'Estimert termin';

  @override
  String pregnancyDaysLeft(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: 'Omtrent $days dager igjen',
      one: 'Omtrent $days dag igjen',
    );
    return '$_temp0';
  }

  @override
  String pregnancyTrimesterLabel(int n) {
    return 'Trimester $n';
  }

  @override
  String get pregnancyDisclaimer =>
      'Datoene er estimert fra siste mens etter standardregelen på 280 dager. En ultralyd gir en mer nøyaktig dato, og sen eggløsning forskyver disse tallene — dette er informasjon, ikke medisinsk oppfølging.';

  @override
  String get pregnancySizeLabel => 'Babyens størrelse';

  @override
  String get pregnancySizeUnder5 => 'Valmuefrø (~2 mm)';

  @override
  String get pregnancySizeUnder9 => 'Blåbær (~1.6 cm)';

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
  String get pregnancySizeTerm => 'Liten vannmelon (~51 cm)';

  @override
  String get pregnancyNoteUnder5 =>
      'De fleste merker ingenting ennå — fordi svangerskapsuken telles fra siste mens, er de første to ukene faktisk før unnfangelsen.';

  @override
  String get pregnancyNoteUnder9 =>
      'Kvalme, ømme bryster og slitenhet er vanlig akkurat nå. Et godt tidspunkt for å avtale en første time.';

  @override
  String get pregnancyNoteUnder13 =>
      'Du nærmer deg slutten av første trimester; for mange begynner kvalmen å avta omtrent nå.';

  @override
  String get pregnancyNoteUnder20 =>
      'Energien kommer ofte tilbake i denne perioden. De første bevegelsene kan kjennes et sted mellom uke 16 og 22.';

  @override
  String get pregnancyNoteUnder28 =>
      'Bevegelsene blir tydelige og begynner å danne et mønster. Ryggsmerter og halsbrann er vanlig i denne perioden.';

  @override
  String get pregnancyNoteUnder34 =>
      'Du er i tredje trimester. Tungpust, hyppig vannlating og Braxton-Hicks-sammentrekninger er vanlig.';

  @override
  String get pregnancyNoteUnder38 =>
      'Babyen gjør seg klar til fødselen. Et godt tidspunkt for sykehusbag og fødselsplan.';

  @override
  String get pregnancyNoteTerm =>
      'Du er ved termin — fødselen kan skje når som helst mellom uke 37 og 42; uke 40 er et gjennomsnitt, ikke en frist.';

  @override
  String get pregnancyWeeklyNoteTitle => 'Denne uken';

  @override
  String get pregnancyNeedsLmp =>
      'Legg til første dag i siste mens for å begynne å følge med.';

  @override
  String get pregnancyOutOfRange =>
      'Den datoen er mer enn 42 uker siden — oppdater den eller slå av svangerskapsmodus.';

  @override
  String get partnerShareTitle => 'Del et sammendrag med en partner';

  @override
  String get partnerShareBody =>
      'Lager et kort tekstsammendrag — nåværende fase og estimert vindu — som du sender selv gjennom hvilken som helst app. Det finnes ingen løpende synkronisering og ingen partnerkonto: ingenting deles med mindre du sender det.';

  @override
  String get partnerShareCta => 'Lag sammendrag';

  @override
  String get partnerSummaryHeader => 'Syklussammendrag fra Vera';

  @override
  String get settingsHomeThemeLabel => 'Bakgrunn på Hjem';

  @override
  String get homeThemeWheat => 'Hvete';

  @override
  String get homeThemeSky => 'Himmel';

  @override
  String get homeThemeField => 'Eng';

  @override
  String get homeThemeBlossom => 'Blomstring';

  @override
  String get homeThemePlain => 'Enkel';

  @override
  String get backupNudgeTitle => 'Ta vare på en kopi av dataene dine';

  @override
  String get backupNudgeBody =>
      'Alt finnes kun på denne telefonen. Hvis den mistes, går i stykker eller nullstilles, forsvinner historikken din med den — en kryptert sikkerhetskopi tar et øyeblikk, og bare du kan åpne den.';

  @override
  String get backupNudgeCta => 'Ta sikkerhetskopi nå';

  @override
  String get backupNudgeDismiss => 'Senere';

  @override
  String backupLastDone(String date) {
    return 'Siste sikkerhetskopi: $date';
  }

  @override
  String get backupNever => 'Ingen sikkerhetskopi ennå';

  @override
  String get settingsRemindersBackupLabel => 'Minn meg på å ta sikkerhetskopi';

  @override
  String get reminderBackupTitle => 'På tide å ta sikkerhetskopi av Vera';

  @override
  String get reminderBackupBody =>
      'Historikken din finnes bare på denne telefonen. En rask kryptert sikkerhetskopi holder den trygg.';

  @override
  String get notificationChannelPeriodStart => 'Kommende mens';

  @override
  String get notificationChannelPeriodEnd => 'Sjekk ved slutten av mensen';

  @override
  String get notificationChannelMedication => 'Medisiner';

  @override
  String get notificationChannelWater => 'Vann';

  @override
  String get notificationChannelAppointment => 'Time';

  @override
  String get notificationChannelOvulation => 'Fruktbart vindu';

  @override
  String get notificationChannelBackup => 'Påminnelse om sikkerhetskopi';

  @override
  String get calendarDayDetailTitle => 'Denne dagen';

  @override
  String get calendarDayNothingLogged =>
      'Ingenting registrert for denne dagen ennå';

  @override
  String get calendarDayOpenLog => 'Åpne dagsloggen';

  @override
  String get cycleHistoryTitle => 'Tidligere sykluser';

  @override
  String get cycleTrendsTitle => 'Syklustrender';

  @override
  String get cycleHistoryEmpty =>
      'Registrer et par menstruasjoner, så dukker syklushistorikken din opp her.';

  @override
  String get cycleHistoryOngoing => 'Pågår';

  @override
  String cycleHistoryLength(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: 'Syklus på $days dager',
      one: 'Syklus på $days dag',
    );
    return '$_temp0';
  }

  @override
  String cycleHistoryPeriodLength(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: 'Mensen varte $days dager',
      one: 'Mensen varte $days dag',
    );
    return '$_temp0';
  }

  @override
  String cycleHistoryVsAverage(String diff) {
    return '$diff mot gjennomsnittet ditt';
  }

  @override
  String get insightsCycleHistoryEntry => 'Tidligere sykluser';

  @override
  String get homeEmptyTitle => 'La oss starte med forrige mens';

  @override
  String get homeEmptyBody =>
      'Trykk på knappen over den dagen mensen din starter. Etter to hele sykluser kan Vera begynne å estimere — inntil da later den ikke som om den vet.';

  @override
  String get homeEmptyBackdate => 'Den startet allerede tidligere';

  @override
  String get settingsAdPrivacyEntry => 'Personvernvalg for annonser';

  @override
  String a11yCycleRing(int day, int length) {
    return 'Syklusdag $day av omtrent $length';
  }

  @override
  String a11yChartSummary(int count, String min, String max) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Diagram med $count oppføringer, fra $min til $max',
      one: 'Diagram med $count oppføring, fra $min til $max',
    );
    return '$_temp0';
  }

  @override
  String a11yPhaseBar(int day, int length) {
    return 'Syklusforløp: dag $day av omtrent $length';
  }

  @override
  String a11yFrequencyItem(String label, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ganger',
      one: '$count gang',
    );
    return '$label: $_temp0';
  }

  @override
  String get importTitle => 'Importer fra en annen app';

  @override
  String get importBody =>
      'Eksporter historikken din fra den gamle appen som en CSV, og velg deretter filen her. Bare datoer og blødning importeres — ordbruken for symptomer og humør er ulik fra app til app, og Vera gjetter ikke hva du mente.';

  @override
  String get importPickFile => 'Velg CSV-fil';

  @override
  String importPreview(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Fant $count dager med historikk',
      one: 'Fant $count dag med historikk',
    );
    return '$_temp0';
  }

  @override
  String importSkipped(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count rader kunne ikke leses og blir utelatt',
      one: '$count rad kunne ikke leses og blir utelatt',
    );
    return '$_temp0';
  }

  @override
  String get importConfirm => 'Legg til i historikken min';

  @override
  String get importMergeNote =>
      'Importerte dager slås sammen. Dager du allerede har registrert i Vera, beholdes som de er.';

  @override
  String importDone(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Importerte $count dager',
      one: 'Importerte $count dag',
    );
    return '$_temp0';
  }

  @override
  String get importErrorEmpty => 'Den filen ser tom ut.';

  @override
  String get importErrorNoDate => 'Fant ingen datokolonne i den filen.';

  @override
  String get settingsImportEntry => 'Importer fra en annen app';

  @override
  String get settingsHealthSyncLabel =>
      'Synkroniser til Apple Health / Health Connect';

  @override
  String get settingsHealthSyncBody =>
      'Skriver bare mensblødning, vekt og basaltemperatur til helseappen på telefonen din. Symptomer, humør og notater blir værende i Vera. Ingenting leses tilbake.';

  @override
  String healthSyncBackfilled(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Sendte $count dager til helseappen din',
      one: 'Sendte $count dag til helseappen din',
    );
    return '$_temp0';
  }

  @override
  String get healthSyncDenied =>
      'Tillatelsen ble ikke gitt, så synkroniseringen forblir av.';

  @override
  String get settingsDiagnosticsEntry => 'Diagnostikk';

  @override
  String get diagnosticsBody =>
      'Hvis appen oppfører seg rart, blir de tekniske detaljene registrert her — kun på denne enheten. Ingenting sendes noe sted med mindre du velger å sende det, og du kan lese nøyaktig hva du eventuelt sender først.';

  @override
  String get diagnosticsEmpty =>
      'Ingenting registrert — ingen problemer er oppdaget.';

  @override
  String get diagnosticsShare => 'Send til utvikleren';

  @override
  String get diagnosticsClear => 'Tøm';

  @override
  String get diagnosticsNoteLabel => 'Hva skjedde? (valgfritt)';

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
      'Valg for personaliserte annonser tilbys ikke i din region — annonsene her er allerede ikke-personaliserte.';

  @override
  String get settingsGroupAppearance => 'Utseende';

  @override
  String get settingsGroupTracking => 'Registreringsinnstillinger';

  @override
  String get dayLogCustomTagsLabel => 'Mine egne målinger';

  @override
  String get customTagAddButton => 'Legg til en måling';

  @override
  String get customTagDialogTitle => 'Ny måling';

  @override
  String get customTagDialogHint => 'f.eks. migrene, trening, søvnløshet';

  @override
  String get customTagManageEntry => 'Administrer målingene mine';

  @override
  String get customTagRenameTitle => 'Gi målingen nytt navn';

  @override
  String get customTagDeleteTitle => 'Slette denne målingen?';

  @override
  String get customTagDeleteBody =>
      'Den fjernes fra hver dag du har brukt den. De andre oppføringene dine blir som de er.';

  @override
  String get customTagEmpty => 'Ingen egne målinger ennå.';

  @override
  String get premiumLockedTitle => 'Premium-funksjon';

  @override
  String get premiumLockedAction => 'Se Premium';

  @override
  String get premiumBenefitCustomTrackers =>
      'Følg med på hva du vil, med dine egne ord';

  @override
  String get premiumBenefitAdvancedInsights =>
      'Avansert innsikt: hva som pleier å skje, og når';

  @override
  String get premiumBenefitPersonalisation =>
      'Flere bakgrunner og følgesvenner';

  @override
  String get premiumBenefitAdvancedReminders =>
      'Påminnelser etter din egen plan';

  @override
  String get advancedInsightsTitle => 'Avansert innsikt';

  @override
  String get advancedInsightsEntry => 'Avansert innsikt';

  @override
  String get advancedInsightsNotEnough =>
      'Registrer tre hele sykluser, så dukker mønstrene dine opp her. Med færre enn det ville ethvert «mønster» bare vært tilfeldig.';

  @override
  String get advancedInsightsPatternsTitle => 'Når ting pleier å dukke opp';

  @override
  String advancedInsightsPatternLine(String label, String segment) {
    return '$label — oftest $segment';
  }

  @override
  String advancedInsightsPatternDetail(int count, int day) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count dager registrert, rundt dag $day i syklusen din',
      one: '$count dag registrert, rundt dag $day i syklusen din',
    );
    return '$_temp0';
  }

  @override
  String advancedInsightsNoPattern(String label) {
    return '$label — ingen tydelig timing ennå';
  }

  @override
  String get advancedInsightsTrendTitle => 'Sykluslengde over tid';

  @override
  String advancedInsightsDriftLonger(String days, String cycles) {
    return 'Sammenligner du de tidligste $cycles syklusene dine med de siste $cycles, er de nyeste omtrent $days dager lengre.';
  }

  @override
  String advancedInsightsDriftShorter(String days, String cycles) {
    return 'Sammenligner du de tidligste $cycles syklusene dine med de siste $cycles, er de nyeste omtrent $days dager kortere.';
  }

  @override
  String advancedInsightsDriftStable(String cycles) {
    return 'Sammenligner du de tidligste $cycles syklusene dine med de siste $cycles, har sykluslengden din holdt seg omtrent den samme.';
  }

  @override
  String get advancedInsightsDriftNotEnough =>
      'Når du har seks hele sykluser, kan Vera sammenligne de tidligste med de nyeste for å se om sykluslengden din er i endring.';

  @override
  String get advancedInsightsMoodTitle => 'Humør etter del av syklusen';

  @override
  String get advancedInsightsDisclaimer =>
      'Dette er tellinger av det du har registrert, ikke noe mer. De er ikke en diagnose, og et mønster her er ikke en årsak.';

  @override
  String get segmentPeriod => 'under mensen';

  @override
  String get segmentAfterPeriod => 'etter mensen';

  @override
  String get segmentMidCycle => 'midt i syklusen';

  @override
  String get segmentBeforePeriod => 'før mensen';

  @override
  String get customRemindersEntry => 'Mine egne påminnelser';

  @override
  String get customRemindersTitle => 'Mine egne påminnelser';

  @override
  String get customRemindersEmpty => 'Ingen egne påminnelser ennå.';

  @override
  String get customRemindersAdd => 'Legg til en påminnelse';

  @override
  String get customReminderLabelHint => 'f.eks. ta p-pillen, drikke vann';

  @override
  String get customReminderLockScreenNote =>
      'Påminnelsesteksten vises på låseskjermen, så hold den så privat som du vil at den skal være.';

  @override
  String get customReminderDelete => 'Slett påminnelse';

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
  String get homeThemeAutumn => 'Høst';

  @override
  String get homeThemeNight => 'Natt';

  @override
  String get mascotStar => 'Stjerne';

  @override
  String get mascotLeaf => 'Blad';

  @override
  String get mascotCat => 'Katt';

  @override
  String get mascotRabbit => 'Kanin';

  @override
  String get mascotBird => 'Fugl';

  @override
  String get tipDetailWhatsHappening => 'Hva som skjer i kroppen din';

  @override
  String get tipDetailGeneralHeading => 'Generelle forslag';

  @override
  String get tipDetailDisclaimer =>
      'Dette er generell informasjon, ikke personlige medisinske råd. Hver kropp reagerer ulikt, og hvordan du faktisk føler deg betyr mer enn noe som foreslås her. Hvis noe bekymrer deg, snakk med helsepersonell.';

  @override
  String get phaseExplainerMenstrual =>
      'Du blør fordi livmorslimhinnen støtes ut. Østrogen og progesteron er på syklusens laveste punkt, og det er derfor mange kjenner seg mer slitne og mer innadvendte de første dagene. Blødningen varer som regel tre til sju dager og er kraftigst i starten. Kramper kommer av at livmoren trekker seg sammen, drevet av prostaglandiner — hormonliknende stoffer som frigjøres når slimhinnen brytes ned, og også grunnen til at noen samtidig får vondt i korsryggen eller løsere mage. Blødningen koster dessuten jern, og det forklarer en del av trettheten. Varme, bevegelse og søvn pleier å hjelpe. Men hvis beskyttelsen blir gjennomblødd hver time, hvis blødningen tydelig varer over en uke, eller hvis smerten hindrer deg i vanlige ting, er det verdt å ta opp med helsepersonell heller enn å vente det ut.';

  @override
  String get phaseExplainerFollicular =>
      'Når blødningen er over, begynner østrogenet å stige igjen. I eggstokkene modnes en gruppe follikler, hver med et egg, og normalt er det bare ett som slippes. Østrogen bygger opp igjen slimhinnen som nettopp ble støtt ut, og de fleste merker at energi, humør, hud og utholdenhet kommer tilbake med den. Dette er også den delen av syklusen som varierer mest mellom personer og mellom måneder — stress, sykdom, reiser og søvn viser seg oftest her, ved å gjøre den lengre eller kortere. Det er den ærlige grunnen til at en prognose er et intervall og ikke en dato: andre halvdel av syklusen ligger ganske fast, og det er denne halvdelen som beveger seg.';

  @override
  String get phaseExplainerFertile =>
      'Østrogenet er nær toppen, og eggløsning ventes rundt disse dagene. En bølge av luteiniserende hormon utløser eggløsningen omtrent ett til halvannet døgn senere. Selve egget overlever rundt 12 til 24 timer, men sædceller kan leve flere dager i fruktbar livmorhalsslim — derfor telles vinduet i flere dager og ikke i én. Slimet blir vanligvis klart, trådaktig og glatt, litt som rå eggehvite; noen merker økt lyst, ømme bryster eller et kort stikk på den ene siden. Energien er ofte på syklusens høyeste punkt. Husk at vinduet er et anslag ut fra din egen historikk, ikke en måling, og det er ingen prevensjonsmetode.';

  @override
  String get phaseExplainerLuteal =>
      'Etter eggløsningen blir den tomme follikkelen til gulkroppen og begynner å produsere progesteron, som holder slimhinnen stabil i tilfelle et svangerskap fester seg. Skjer ikke det, faller progesteron og østrogen kraftig, og menstruasjonen begynner. Denne halvdelen av syklusen er den jevneste, som regel rundt 12 til 14 dager. Progesteron løfter hviletemperaturen litt — nettopp det et basaltermometer fanger opp — og kan gjøre fordøyelsen tregere, noe som forklarer en del av oppblåstheten. Fallet på slutten er det som utløser PMS hos mange: ømme bryster, endret appetitt, avbrutt søvn, hodepine og humørsvingninger, som vanligvis letter når blødningen begynner. Er plagene sterke nok til å forstyrre jobb eller relasjoner de fleste måneder, er det verdt å snakke med helsepersonell om det.';

  @override
  String get phaseExplainerUnknown =>
      'Det er ennå ikke registrert nok til å si hvilken fase du er i. Vera trenger minst to hele sykluser — en menstruasjonsstart og så den neste — for å regne ut ditt eget snitt og din variasjon, og sier heller det enn å finne på en fase. I mellomtiden går ingenting tapt: hver dag du registrerer hører med i den første beregningen, og anslaget blir smalere etter hvert som historikken vokser. Inntil da er forslagene under generelle og gjelder når som helst i syklusen.';

  @override
  String get tipFitnessDetailMenstrual =>
      'Hard trening passer de fleste dårlig de første dagene, og det handler ikke om disiplin — energien er faktisk lavere, og jernet du mister med blødningen gjør utholdenhetsarbeid tyngre enn den samme økten kjentes forrige uke. Gåturer, myk tøying, restorativ yoga og pusteøvelser bedrer blodgjennomstrømningen og kan dempe kramper; hos noen senker jevn bevegelse gjennom hele måneden krampeintensiteten mer enn noe de gjør på selve dagen. Har du det bra, er det ingen grunn til å unngå harde økter: å blø er ingen grunn til å slutte å trene, og mange utøvere konkurrerer midt i det. Noen praktiske ting: lange, krevende økter på dager med kraftig blødning kan forsterke trettheten, varme på nedre del av magen før du starter gjør bevegelsen mer behagelig, og å drikke litt mer enn vanlig hjelper mot hodepinen disse dagene. Vurder økten etter hvordan den kjennes underveis, ikke etter hvordan din beste uke så ut.';

  @override
  String get tipFitnessDetailFollicular =>
      'Mens østrogenet stiger, kjenner de fleste seg sterkere og mer robuste; dette er som regel den beste perioden i syklusen for å begynne på noe nytt, legge på vekt eller øke tempoet. Muskelreparasjonen er relativt effektiv her, så harde økter tas bedre imot og etterlater mindre langvarig stølhet. Det er også et godt vindu for det som krever klart hode og ikke bare sterk kropp — å lære et nytt løft, rette teknikken, eller løpe lengre enn du har gjort før. To forbehold å holde fast ved: bygg opp gradvis, for høy energi betyr ikke null skaderisiko, og de fleste belastningsskader begynner i en god uke, ikke i en dårlig. Og beskytt søvnen — tilpasningen skjer under restitusjonen, ikke under økten.';

  @override
  String get tipFitnessDetailFertile =>
      'Energi og motivasjon er som regel på topp, så krevende økter sitter godt — personlige rekorder faller ofte her. Noe forskning antyder at leddene er litt løsere rundt eggløsningen; den praktiske betydningen diskuteres, men en lengre oppvarming er en billig forsiktighetsregel i idretter med brå retningsforandringer, hopp og landinger. Kroppstemperaturen er fortsatt lav sammenliknet med andre halvdel av syklusen, så varme begrenser mindre her enn den vil gjøre om en uke eller to. Et kort stikk på den ene siden av nedre del av magen rundt eggløsningen er vanlig og går som regel over i løpet av timer. Er smerten sterk, ensidig og vedvarende, følges av feber, eller kjenner du deg svimmel — stopp og få det sjekket heller enn å trene videre.';

  @override
  String get tipFitnessDetailLuteal =>
      'Når menstruasjonen nærmer seg, kan energien synke, pulsen ligge høyere ved samme innsats, og restitusjonen ta lengre tid. Det er en ventet svingning, ikke en tilbakegang, og det sletter ikke arbeidet fra de siste to ukene. Progesteron løfter hviletemperaturen litt og gjør det vanskeligere å kvitte seg med varme, så varme eller fuktige økter kjennes uforholdsmessig tunge her — å trene tidligere eller senere på dagen og drikke mer enn det kjennes nødvendig hjelper begge deler. Moderate økter, en litt lettere utgave av styrketreningen og gåturer holder som regel bedre. Ved oppblåsthet og ømme bryster gjør en støttende sports-BH og en lengre oppvarming en reell forskjell. Er humøret lavt, gjør økten kort og lett i stedet for å hoppe over den helt — terskelen for at den teller ligger lavere enn det kjennes.';

  @override
  String get tipFitnessDetailUnknown =>
      'Selv uten å vite fasen din hjelper bevegelse når som helst: den generelle anbefalingen er rundt 150 minutter moderat aktivitet i uken, fordelt over de fleste dagene, pluss styrkearbeid to ganger i uken — og det mønsteret gir nesten alle mer enn enkeltstående svært harde økter. Jevnhet veier tyngre enn intensitet, og den beste økten er den du faktisk gjentar neste uke. Tilpass etter hvordan du kjenner deg: på slitne dager teller en gåtur, og en kort gjennomført økt er verdt mer enn en lang som ble hoppet over. Når du har registrert et par sykluser, dukker faseinndelte forslag opp her.';

  @override
  String get tipNutritionDetailMenstrual =>
      'Blødningen koster deg jern; rødt kjøtt, linser, kikerter, mørkegrønne bladgrønnsaker og sirup hjelper med å fylle på. Plantejern tas opp merkbart bedre sammen med C-vitamin — å presse sitron over linsegryta er den mest praktiske varianten, og en tomatsalat ved siden av gjør det samme. Te og kaffe til maten senker jernopptaket på grunn av tanninene, så det holder å la det gå omtrent en time imellom; du trenger ikke gi opp noen av delene. Å drikke nok vann kan lindre trettheten og hodepinen som følger blødningen, og magnesiumrik mat som nøtter, frø og mørke bladgrønnsaker hjelper noen mot kramper. På dager der fordøyelsen går tregt, sitter små, jevne måltider bedre enn store. Kjenner du deg ofte andpusten, svimmel eller uvanlig utmattet rundt menstruasjonen, er det verdt å nevne for helsepersonell — lavt jern er vanlig, enkelt å teste, og ikke noe en app skal stille diagnose på.';

  @override
  String get tipNutritionDetailFollicular =>
      'Når energien kommer tilbake, er kroppen i oppbyggingsmodus: nok protein, fullkorn og grønnsaker støtter det, og det er i denne fasen appetitten som regel er jevnest og enklest å styre. Det gir også mening å fortsette å fylle jernlagrene etter blødningen i stedet for å behandle det som noe som bare hører menstruasjonsuken til — lagrene bygges opp over uker, ikke dager. Å ikke hoppe over måltider er lettere her, og det gjør at du går mer i balanse inn i neste fases appetittsvingninger. Skal du endre på hvordan du spiser, er denne perioden som regel snillere å begynne i enn uken før menstruasjonen, når søtsug og lavt humør får enhver ny rutine til å kjennes vanskeligere enn den er.';

  @override
  String get tipNutritionDetailFertile =>
      'Her trengs ingen spesiell kost; balanserte måltider og nok vann gjør mesteparten av jobben. Noen kjenner seg oppblåste rundt eggløsningen, noe som som regel er hormonelt og forbigående heller enn noe du har spist. Appetitten synker litt hos noen og stiger hos andre — begge deler er vanlig. Å holde protein og fiber i måltidene holder energien jevn gjennom det som ofte er månedens mest aktive periode. Planlegger du et svangerskap, er dette et fornuftig tidspunkt å spørre helsepersonell om folat, som vanligvis anbefales før unnfangelsen og ikke etter — men det er en samtale med dem, ikke et råd en app skal gi.';

  @override
  String get tipNutritionDetailLuteal =>
      'Økt appetitt og søtsug mens progesteronet stiger er svært vanlig; det er en hormonell forskyvning, ikke et viljespørsmål, og kroppen bruker faktisk litt mer energi i denne fasen. Å legge protein og fiber til måltidene holder blodsukkeret jevnere og demper suget langt bedre enn å prøve å overse det — et sug som møtes med noe mettende tar som regel slutt tidligere enn ett du kjemper mot i en time. Mindre salt og mer vann kan lindre oppblåstheten; det høres bakvendt ut, men er det ikke: godt hydrert holder kroppen mindre tilbake. Magnesiumrik mat (mandler, valnøtter, mørke bladgrønnsaker, mørk sjokolade) demper kramper og spenninger hos noen. Å kutte ned på koffein etter formiddagen hjelper mot den avbrutte søvnen i denne fasen, og alkohol er også verdt å følge med på, siden den splitter opp søvnen nettopp der i syklusen hvor den allerede er lettere.';

  @override
  String get tipNutritionDetailUnknown =>
      'Uansett fase er det de samme tingene som hjelper mest: jevne måltider, nok protein, mye grønnsaker, nok vann og jernrik mat. Siden blødningen koster jern, holder det å være litt mer oppmerksom de dagene — det trengs ikke et eget kosthold for hver uke i måneden. Å spise til omtrent faste tider gjør mer for jevn energi enn noen enkelt matvare, og ingenting må kuttes ut for at en syklus skal være sunn. Når du har registrert et par sykluser, dukker faseinndelte forslag opp her.';

  @override
  String get tipSleepLabel => 'Søvn';

  @override
  String get tipSleepMenstrual =>
      'Kramper og ubehag kan forstyrre søvnen; en varm dusj eller varmepute før leggetid kan hjelpe.';

  @override
  String get tipSleepFollicular =>
      'Med økende energi føler mange seg mer våkne — det faktiske søvnbehovet synker likevel ikke.';

  @override
  String get tipSleepFertile =>
      'Den lette temperaturøkningen rundt eggløsning kan gjøre det litt vanskeligere å sovne; et kjøligere rom kan hjelpe.';

  @override
  String get tipSleepLuteal =>
      'Progesteron hever hviletemperaturen litt og kan gjøre dyp søvn lettere; et kjølig, mørkt rom og en fast leggetid hjelper mest her.';

  @override
  String get tipSleepUnknown =>
      'Søvnkvaliteten svinger ofte gjennom syklusen — vanligvis mest skjør rett før og under menstruasjonen. En fast leggetid er det mest pålitelige grunnlaget uansett fase.';

  @override
  String get tipSleepDetailMenstrual =>
      'Under menstruasjonen er søvnen ofte mer fragmentert — kramper, ubehag og for noen hyppigere toalettbesøk kan vekke om natten. En varm dusj, varmepute eller lett tøying før leggetid kan lindre kramper. Tar du smertestillende, kan riktig timing beskytte den tidlige søvnen.';

  @override
  String get tipSleepDetailFollicular =>
      'Med stigende østrogen føler mange seg våkne og energiske, noe som kan oppleves som mindre søvnbehov. Det stemmer ikke helt — våkenhet kommer bare lettere. Å holde fast leggetid her lønner seg senere, når søvnen blir mer skjør i andre faser.';

  @override
  String get tipSleepDetailFertile =>
      'Den lette temperaturøkningen rundt eggløsning kan gjøre det litt vanskeligere å sovne, fordi kroppen naturlig vil kjøle seg ned før søvn. Et kjøligere rom, et lettere teppe eller en varm dusj før leggetid kan veie opp for dette.';

  @override
  String get tipSleepDetailLuteal =>
      'Progesteron som stiger etter eggløsning hever hviletemperaturen litt, noe som kan gjøre dyp søvn lettere — noen ganger som et mildt hetetokt, andre ganger bare som mindre gjenopprettende søvn. Et kjølig, mørkt rom, mindre skjermtid før leggetid og en fast leggetid hjelper mest her.';

  @override
  String get tipSleepDetailUnknown =>
      'Det er ikke nok data ennå til å avgjøre fasen, men skiftende søvnkvalitet gjennom syklusen er et vanlig mønster — vanligvis mer skjør rett før og under menstruasjonen. Det mest pålitelige grunnlaget uansett fase: faste sove- og våknetider, mindre skjermtid før leggetid og et kjølig, mørkt rom.';
}
