// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Dutch Flemish (`nl`).
class AppLocalizationsNl extends AppLocalizations {
  AppLocalizationsNl([String locale = 'nl']) : super(locale);

  @override
  String get appTitle => 'Vera';

  @override
  String get actionSkip => 'Overslaan';

  @override
  String get actionContinue => 'Doorgaan';

  @override
  String get actionDone => 'Klaar';

  @override
  String get actionCancel => 'Annuleren';

  @override
  String get actionClear => 'Wissen';

  @override
  String get actionDelete => 'Verwijderen';

  @override
  String get actionEnable => 'Inschakelen';

  @override
  String get commonIDontKnow => 'Ik weet het niet';

  @override
  String get commonYes => 'Ja';

  @override
  String get commonNo => 'Nee';

  @override
  String get commonNotSure => 'Niet zeker';

  @override
  String get pinSetupTitle => 'Stel een PIN in';

  @override
  String get pinSetupEnterPrompt =>
      'Kies een 6-cijferige PIN om de app te vergrendelen';

  @override
  String get pinSetupConfirmPrompt => 'Voer hem nogmaals in ter bevestiging';

  @override
  String get pinSetupMismatch =>
      'Die kwamen niet overeen — probeer het opnieuw';

  @override
  String get pinSetupBiometricTitle => 'Sneller ontgrendelen?';

  @override
  String get pinSetupBiometricBody =>
      'Je kunt ook je vingerafdruk of gezicht gebruiken om te ontgrendelen — je PIN blijft werken als reserve.';

  @override
  String get lockScreenTitle => 'Vergrendeld';

  @override
  String get lockScreenEnterPin => 'Voer je PIN in';

  @override
  String get lockScreenWrongPin => 'Die PIN klopt niet';

  @override
  String get lockScreenUseBiometrics => 'Biometrie gebruiken';

  @override
  String get lockScreenUseFaceId => 'Face ID gebruiken';

  @override
  String get lockScreenUseFingerprint => 'Vingerafdruk gebruiken';

  @override
  String get lockScreenForgotPin => 'PIN vergeten?';

  @override
  String get lockScreenForgotPinChoiceTitle => 'Hoe wil je hem resetten?';

  @override
  String get lockScreenResetViaDevice => 'Verifiëren met dit apparaat';

  @override
  String get lockScreenResetViaDeviceBody =>
      'Je gegevens blijven bewaard. Bevestigen met de eigen vergrendeling van je telefoon — Face ID, vingerafdruk of toegangscode — is genoeg.';

  @override
  String get lockScreenResetViaDeviceReason =>
      'Verifieer om een nieuwe pincode in te stellen';

  @override
  String lockScreenThrottled(int seconds) {
    return 'Te veel pogingen. Probeer het over $seconds s opnieuw';
  }

  @override
  String get lockScreenEraseTitle => 'Alle gegevens wissen?';

  @override
  String get lockScreenEraseBody =>
      'Hiermee verwijder je alles op dit apparaat definitief. Er is geen account en geen back-up op een server, dus dit kan niet ongedaan worden gemaakt.';

  @override
  String get lockScreenEraseConfirm => 'Alles wissen';

  @override
  String get onboardingPrivacyTitle => 'Welkom';

  @override
  String get onboardingPrivacyBody =>
      'Je cyclusgegevens blijven versleuteld op dit apparaat. Er is geen account en geen cloudsynchronisatie — niets van wat je vastlegt wordt geüpload. De sleutel staat in de beveiligde hardware van je telefoon, en je kunt alles exporteren of wissen wanneer je wilt.';

  @override
  String get onboardingLastPeriodTitle =>
      'Wanneer begon je laatste menstruatie?';

  @override
  String get onboardingLastPeriodBody =>
      'Zo kunnen we van start — je kunt het later altijd aanpassen via de kalender.';

  @override
  String get onboardingPickDate => 'Kies een datum';

  @override
  String get onboardingCycleLengthTitle => 'Hoe lang is je cyclus meestal?';

  @override
  String get onboardingCycleLengthBody =>
      'Een ruwe schatting is prima. We geven je een echte schatting zodra we een paar volledige cycli hebben gezien.';

  @override
  String get onboardingPeriodLengthTitle =>
      'Hoeveel dagen duurt je menstruatie meestal?';

  @override
  String get onboardingPeriodLengthBody =>
      'Hiermee vullen we je laatste menstruatie alvast in, zodat je niet bij nul begint.';

  @override
  String get onboardingDaysUnit => 'dagen';

  @override
  String get onboardingGoalTitle => 'Wat brengt je hier?';

  @override
  String get onboardingGoalBody =>
      'Dit helpt ons alleen om je eerst de juiste dingen te laten zien — je kunt je keuze altijd wijzigen in Instellingen.';

  @override
  String get goalTrackPeriod => 'Mijn menstruatie bijhouden';

  @override
  String get goalTryingToConceive => 'Ik probeer zwanger te worden';

  @override
  String get goalPregnancyTracking => 'Een zwangerschap volgen';

  @override
  String get onboardingRegularityTitle =>
      'Is je menstruatie meestal regelmatig?';

  @override
  String get onboardingRegularityBody =>
      'Er is hier geen fout antwoord — dit helpt ons alleen om je lichaam wat beter te leren kennen.';

  @override
  String get onboardingCrampsTitle => 'Heb je meestal krampen?';

  @override
  String get onboardingCrampsBody =>
      'We zorgen dat je op zulke dagen makkelijk kunt vastleggen hoe je je voelt.';

  @override
  String get onboardingBirthYearTitle => 'In welk jaar ben je geboren?';

  @override
  String get onboardingBirthYearBody =>
      'Alleen voor een vollediger beeld — wordt nooit gebruikt voor een voorspelling.';

  @override
  String get onboardingPmsTitle => 'Merk je meestal iets van tevoren?';

  @override
  String get onboardingPmsBody =>
      'Kies er zoveel als van toepassing zijn. Wordt nergens opgeslagen, er is geen fout antwoord.';

  @override
  String get onboardingNotificationTitle =>
      'Wil je vriendelijke herinneringen?';

  @override
  String get onboardingNotificationBody =>
      'We kunnen je een seintje geven voordat je menstruatie wordt verwacht.';

  @override
  String get onboardingNotificationMockTitle =>
      'Je menstruatie begint mogelijk binnenkort';

  @override
  String get onboardingNotificationMockBody =>
      'Op basis van je vastgelegde cycli';

  @override
  String get onboardingNotificationAllow => 'Herinneringen inschakelen';

  @override
  String get onboardingNotificationNotNow => 'Nu niet';

  @override
  String get onboardingBuildingPlanTitle => 'We zetten alles voor je klaar';

  @override
  String get onboardingBuildingPlanStep1 =>
      'Je gegevens beveiligen op dit apparaat';

  @override
  String get onboardingBuildingPlanStep2 => 'Je voorkeuren opslaan';

  @override
  String get onboardingBuildingPlanStep3 => 'Je kalender klaarzetten';

  @override
  String get onboardingBuildingPlanDone => 'Klaar';

  @override
  String get navHome => 'Start';

  @override
  String get navCalendar => 'Kalender';

  @override
  String get navInsights => 'Inzichten';

  @override
  String get navSettings => 'Instellingen';

  @override
  String get navReminders => 'Herinneringen';

  @override
  String get navProfile => 'Profiel';

  @override
  String get navTrack => 'Vastleggen';

  @override
  String homeCycleDayLabel(int day) {
    return 'Dag $day';
  }

  @override
  String get homeNoCycleYet => 'Nog geen menstruatie vastgelegd';

  @override
  String get homePhaseMenstrual => 'Menstruatie';

  @override
  String get homePhaseFollicular => 'Folliculaire fase';

  @override
  String get homePhaseFertileWindow => 'Geschatte vruchtbare periode';

  @override
  String get homePhaseLuteal => 'Luteale fase';

  @override
  String get homePhaseUnknown => 'Niet genoeg recente gegevens';

  @override
  String get homePredictionInsufficientTitle => 'Nog niet genoeg gegevens';

  @override
  String get homePredictionInsufficientBody =>
      'Leg je volgende menstruatie vast, dan beginnen we met schatten.';

  @override
  String homePredictionRangeLabel(String start, String end) {
    return '$start – $end';
  }

  @override
  String get homeConfidenceHigh => 'Hoge betrouwbaarheid';

  @override
  String get homeConfidenceMedium => 'Gemiddelde betrouwbaarheid';

  @override
  String get homeConfidenceLow => 'Lage betrouwbaarheid';

  @override
  String get homeIrregularNote =>
      'Je cycluslengte wisselt de laatste tijd meer dan gebruikelijk. Als dat nieuw voor je is, kan het de moeite waard zijn om het bij een controle te noemen.';

  @override
  String get homeFertileWindowDisclaimer =>
      'Gebaseerd op een gebruikelijk cyclusverloop — geen anticonceptiemethode.';

  @override
  String get homePeriodStartedButton => 'Menstruatie vandaag begonnen';

  @override
  String get homePeriodStartedSnackbar =>
      'Vastgelegd — menstruatie vandaag begonnen';

  @override
  String get actionUndo => 'Ongedaan maken';

  @override
  String get comingSoon => 'Binnenkort beschikbaar';

  @override
  String get dayLogFlowLabel => 'Bloedverlies';

  @override
  String get flowSpotting => 'Spotting';

  @override
  String get flowLight => 'Licht';

  @override
  String get flowMedium => 'Matig';

  @override
  String get flowHeavy => 'Hevig';

  @override
  String get flowNone => 'Geen';

  @override
  String get dayLogSymptomsLabel => 'Symptomen';

  @override
  String get symptomCramps => 'Krampen';

  @override
  String get symptomHeadache => 'Hoofdpijn';

  @override
  String get symptomBloating => 'Opgeblazen gevoel';

  @override
  String get symptomBreastTenderness => 'Gevoelige borsten';

  @override
  String get symptomAcne => 'Acne';

  @override
  String get symptomFatigue => 'Vermoeidheid';

  @override
  String get symptomNausea => 'Misselijkheid';

  @override
  String get symptomBackPain => 'Rugpijn';

  @override
  String get symptomAppetiteChange => 'Veranderde eetlust';

  @override
  String get symptomSleepTrouble => 'Slaapproblemen';

  @override
  String get symptomPelvicPain => 'Bekkenpijn';

  @override
  String get symptomDizziness => 'Duizeligheid';

  @override
  String get symptomMigraine => 'Migraine';

  @override
  String get symptomHighFever => 'Hoge koorts';

  @override
  String get symptomNeckPain => 'Nekpijn';

  @override
  String get symptomShoulderPain => 'Schouderpijn';

  @override
  String get symptomLimbPain => 'Pijn in ledematen';

  @override
  String get symptomMuscleAche => 'Spierpijn';

  @override
  String get symptomChills => 'Koude rillingen';

  @override
  String get symptomNightSweats => 'Nachtelijk zweten';

  @override
  String get symptomHotFlashes => 'Opvliegers';

  @override
  String get symptomWeightGain => 'Gewichtstoename';

  @override
  String get symptomConstipation => 'Obstipatie';

  @override
  String get symptomDiarrhea => 'Diarree';

  @override
  String get symptomIndigestion => 'Indigestie';

  @override
  String get symptomGasPain => 'Winderigheidspijn';

  @override
  String get symptomFeelingUnwell => 'Onwel voelen';

  @override
  String get symptomItching => 'Jeuk';

  @override
  String get symptomTroubleFocusing => 'Concentratieproblemen';

  @override
  String get symptomForgetfulness => 'Vergeetachtigheid';

  @override
  String get symptomGroupHead => 'Hoofd';

  @override
  String get symptomGroupBody => 'Lichaam';

  @override
  String get symptomGroupAbdomen => 'Buik';

  @override
  String get symptomGroupGeneral => 'Algemeen';

  @override
  String get symptomGroupCognitive => 'Cognitief';

  @override
  String get dayLogMoodLabel => 'Stemming';

  @override
  String get moodCalm => 'Kalm';

  @override
  String get moodAnxious => 'Angstig';

  @override
  String get moodIrritable => 'Prikkelbaar';

  @override
  String get moodLow => 'Somber';

  @override
  String get moodEnergetic => 'Energiek';

  @override
  String get moodHappy => 'Blij';

  @override
  String get moodContent => 'Tevreden';

  @override
  String get moodSad => 'Verdrietig';

  @override
  String get moodDepressed => 'Neerslachtig';

  @override
  String get moodEmotional => 'Emotioneel';

  @override
  String get moodExcited => 'Opgewonden';

  @override
  String get moodHopeful => 'Hoopvol';

  @override
  String get moodProud => 'Trots';

  @override
  String get moodDisappointed => 'Teleurgesteld';

  @override
  String get moodConfident => 'Zelfverzekerd';

  @override
  String get moodSurprised => 'Verrast';

  @override
  String get moodIndifferent => 'Onverschillig';

  @override
  String get moodPeaceful => 'Vredig';

  @override
  String get moodInLove => 'Verliefd';

  @override
  String get moodShy => 'Verlegen';

  @override
  String get moodPlayful => 'Speels';

  @override
  String get moodExhausted => 'Uitgeput';

  @override
  String get moodLonely => 'Eenzaam';

  @override
  String get moodOverwhelmed => 'Overweldigd';

  @override
  String get moodGrateful => 'Dankbaar';

  @override
  String get moodNostalgic => 'Nostalgisch';

  @override
  String get dayLogNoteLabel => 'Notitie';

  @override
  String get dayLogNoteHint => 'Alles wat je over vandaag wilt onthouden';

  @override
  String get dayLogOptionalTrackersLabel => 'Optionele trackers';

  @override
  String get dayLogSexualActivityLabel => 'Seksuele activiteit';

  @override
  String get sexLifeNone => 'Niets';

  @override
  String get sexLifeUnprotected => 'Onbeschermde seks';

  @override
  String get sexLifeProtected => 'Beschermde seks';

  @override
  String get sexLifeMasturbation => 'Masturbatie';

  @override
  String get sexLifeNoOrgasm => 'Geen orgasme';

  @override
  String get sexLifeOrgasm => 'Orgasme';

  @override
  String get sexLifeHighDesire => 'Veel zin';

  @override
  String get dayLogBbtLabel => 'Basale lichaamstemperatuur';

  @override
  String get dayLogMucusLabel => 'Baarmoederhalsslijm';

  @override
  String get mucusDry => 'Droog';

  @override
  String get mucusSticky => 'Plakkerig';

  @override
  String get mucusCreamy => 'Romig';

  @override
  String get mucusWatery => 'Waterig';

  @override
  String get mucusEggWhite => 'Eiwitachtig';

  @override
  String get dayLogSavedIndicator => 'Opgeslagen';

  @override
  String get homeOpenTodayLog => 'Details voor vandaag toevoegen';

  @override
  String get calendarLegendActual => 'Vastgelegde menstruatie';

  @override
  String get calendarLegendPredicted => 'Voorspelde periode';

  @override
  String get calendarLegendFertile => 'Geschatte vruchtbare periode';

  @override
  String get calendarLegendOvulation => 'Geschatte eisprong';

  @override
  String get dayDetailFertileTitle => 'In je geschatte vruchtbare periode';

  @override
  String get dayDetailOvulationTitle => 'Geschatte dag van de eisprong';

  @override
  String get dayDetailOvulationBody =>
      'Rond deze dag is een zwangerschap doorgaans waarschijnlijker, op basis van het gebruikelijke verloop — dit is een schatting, geen garantie.';

  @override
  String get insightsCyclesLoggedLabel => 'Vastgelegde cycli';

  @override
  String get insightsAveragePeriodLengthLabel =>
      'Gemiddelde duur van je menstruatie';

  @override
  String get insightsAverageCycleLengthLabel => 'Gemiddelde cycluslengte';

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
      other: 'Varieert met ongeveer $daysString dagen',
      one: 'Varieert met ongeveer $daysString dag',
    );
    return '$_temp0';
  }

  @override
  String get insightsNotEnoughDataTitle => 'Nog niet genoeg gegevens';

  @override
  String get insightsNotEnoughDataBody =>
      'Leg een paar volledige cycli vast, dan verschijnen je gemiddelden hier.';

  @override
  String get insightsSymptomFrequencyTitle => 'Symptomen per cyclusdag';

  @override
  String get insightsNoSymptomsLogged => 'Nog geen symptomen vastgelegd';

  @override
  String get settingsLanguageLabel => 'Taal';

  @override
  String get settingsLanguageSystem => 'Systeemtaal';

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
  String get tourSkip => 'Overslaan';

  @override
  String get tourNext => 'Volgende';

  @override
  String get tourStart => 'Laten we beginnen';

  @override
  String get tourHomeTitle => 'Home';

  @override
  String get tourHomeBody =>
      'Zie in één oogopslag waar je vandaag staat — je cyclusdag, hoelang het nog duurt tot je geschatte venster, en je metgezel zijn altijd hier.';

  @override
  String get tourCalendarTitle => 'Kalender';

  @override
  String get tourCalendarBody =>
      'Bekijk je afgelopen en aankomende cycli in de kalender. Tik op een dag om het logboek te openen.';

  @override
  String get tourTrackTitle => 'Registreren';

  @override
  String get tourTrackBody =>
      'De +-knop in het midden opent overal vandaan het logboek van vandaag — bloedverlies, symptomen, stemming en meer.';

  @override
  String get tourRemindersTitle => 'Herinneringen';

  @override
  String get tourRemindersBody =>
      'Stel herinneringen in voor je aankomende menstruatie, medicatie of water drinken — alles blijft op je telefoon en gaat nergens anders heen.';

  @override
  String get tourProfileTitle => 'Profiel';

  @override
  String get tourProfileBody =>
      'Vind hier je inzichten, alles wat je bijhoudt en je instellingen.';

  @override
  String get settingsWeekStartLabel => 'Week begint op';

  @override
  String get settingsWeekStartMonday => 'Maandag';

  @override
  String get settingsWeekStartSunday => 'Zondag';

  @override
  String get settingsTemperatureUnitLabel => 'Temperatuureenheid';

  @override
  String get settingsTemperatureCelsius => 'Celsius';

  @override
  String get settingsTemperatureFahrenheit => 'Fahrenheit';

  @override
  String get settingsRemindersLabel => 'Herinner me vóór mijn menstruatie';

  @override
  String get remindersScreenTitle => 'Herinneringen';

  @override
  String get reminderDetailNotification => 'Melding';

  @override
  String get reminderDetailAlert => 'Waarschuwing';

  @override
  String get reminderDetailAlertToday => 'Op de dag zelf';

  @override
  String get reminderDetailTime => 'Tijd';

  @override
  String get reminderDetailMessage => 'Bericht';

  @override
  String get reminderDetailMessageEditTitle => 'Bericht bewerken';

  @override
  String get reminderDetailMessageHint => 'Schrijf je eigen bericht';

  @override
  String reminderDetailAlertDaysBefore(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count dagen eerder',
      one: '$count dag eerder',
    );
    return '$_temp0';
  }

  @override
  String optionsShowMore(int count) {
    return '+$count meer';
  }

  @override
  String get optionsShowLess => 'Minder weergeven';

  @override
  String get trackerHistoryEntry => 'Geschiedenis';

  @override
  String get actionSend => 'Verzenden';

  @override
  String get actionRemove => 'Verwijderen';

  @override
  String get feedbackEntry => 'Feedback';

  @override
  String get cloudBackupEntry => 'Back-uppen met account';

  @override
  String get cloudBackupTitle => 'Back-uppen met account';

  @override
  String get cloudBackupNotConfiguredTitle =>
      'Nog niet beschikbaar in deze versie';

  @override
  String get cloudBackupNotConfiguredBody =>
      'Cloudback-up heeft een accountservice nodig die nog niet is ingesteld voor deze versie. Tot die tijd kan hier niets worden gebruikt.';

  @override
  String get cloudBackupIntro1Title => 'Verlies je geschiedenis nooit';

  @override
  String get cloudBackupIntro1Body =>
      'Je cyclusgeschiedenis blijft veilig, zelfs als je je telefoon verliest of overstapt naar een nieuwe.';

  @override
  String get cloudBackupIntro2Title => 'Alleen jij kunt hem openen';

  @override
  String get cloudBackupIntro2Body =>
      'Je back-up wordt versleuteld met een wachtwoord voordat hij je telefoon verlaat — wij kunnen hem niet lezen, en niemand anders ook niet.';

  @override
  String get cloudBackupIntro3Title => 'Herstel in enkele seconden';

  @override
  String get cloudBackupIntro3Body =>
      'Log in op een nieuw apparaat en haal je geschiedenis terug met hetzelfde wachtwoord.';

  @override
  String get cloudBackupSignedInTitle => 'Ingelogd';

  @override
  String get cloudBackupUploadButton => 'Nu back-uppen';

  @override
  String get cloudBackupDownloadButton => 'Herstellen vanuit de cloud';

  @override
  String get cloudBackupUploadSuccess => 'Back-up gemaakt naar je account';

  @override
  String get cloudBackupNoBackupFound =>
      'Nog geen cloudback-up gevonden voor dit account.';

  @override
  String get partnerModeEntry => 'Partnermodus';

  @override
  String get partnerModeTitle => 'Partnermodus';

  @override
  String get partnerModeNotConfiguredTitle =>
      'Nog niet beschikbaar in deze versie';

  @override
  String get partnerModeNotConfiguredBody =>
      'Partnermodus heeft een accountservice nodig die nog niet is ingesteld voor deze versie. Tot die tijd kan hier niets worden gebruikt.';

  @override
  String get partnerModeHeroTitle => 'Deel een beetje, op jouw voorwaarden';

  @override
  String get partnerModeHeroBody =>
      'Koppel met je partner en deel alleen wat je hieronder inschakelt — nooit je volledige geschiedenis, nooit automatisch.';

  @override
  String get partnerModeSignInGoogle => 'Doorgaan met Google';

  @override
  String get partnerModeSignInApple => 'Doorgaan met Apple';

  @override
  String get partnerModeFaqTitle => 'Voordat je inlogt';

  @override
  String get partnerModeFaq1Q => 'Wat ziet mijn partner precies?';

  @override
  String get partnerModeFaq1A =>
      'Alleen de velden die je inschakelt in Partnermodus, en alleen je huidige momentopname — nooit je opgeslagen geschiedenis, en nooit iets wat je niet expliciet hebt gedeeld.';

  @override
  String get partnerModeFaq2Q => 'Kan ik dit later uitzetten?';

  @override
  String get partnerModeFaq2A =>
      'Ja. Ontkoppelen stopt het delen meteen voor jullie beiden, en je kunt op elk moment een afzonderlijke schakelaar uitzetten zonder te ontkoppelen.';

  @override
  String get partnerModeFaq3Q => 'Heeft mijn partner deze app nodig?';

  @override
  String get partnerModeFaq3A =>
      'Ja — die logt op dezelfde manier in en koppelt met een code die jij stuurt.';

  @override
  String get partnerModeNotPairedTitle => 'Nog niet gekoppeld';

  @override
  String get partnerModeNotPairedBody =>
      'Nodig je partner uit met een eenmalige code, of voer de code in die je hebt ontvangen.';

  @override
  String get partnerModeInviteButton => 'Nodig mijn partner uit';

  @override
  String get partnerModeEnterCodeButton => 'Voer een code in';

  @override
  String get partnerModeSignOut => 'Uitloggen';

  @override
  String get partnerModePairedTitle => 'Gekoppeld';

  @override
  String get partnerModePairedBody =>
      'Jij en je partner zijn verbonden. Er wordt nog steeds alleen gedeeld wat je hieronder inschakelt.';

  @override
  String get partnerModeShareSectionTitle => 'Wat je deelt';

  @override
  String get partnerModeShareCyclePhase => 'Cyclusfase en -dag';

  @override
  String get partnerModeShareMood => 'Stemming van vandaag';

  @override
  String get partnerModeShareSymptoms => 'Symptomen van vandaag';

  @override
  String get partnerModeShareHighDesire => 'Behoefte aan nabijheid vandaag';

  @override
  String get partnerModeShareNow => 'Nu delen';

  @override
  String get partnerModeShareSuccess => 'Gedeeld met je partner';

  @override
  String get partnerModeUnpair => 'Ontkoppelen';

  @override
  String get partnerModeUnpairConfirmTitle => 'Ontkoppelen van je partner?';

  @override
  String get partnerModeUnpairConfirmBody =>
      'Dit stopt het delen meteen voor jullie beiden. Je kunt later opnieuw koppelen met een nieuwe code.';

  @override
  String get partnerModePartnerSnapshotEmpty =>
      'Je partner heeft nog niets gedeeld.';

  @override
  String get partnerModeErrorNotConfigured =>
      'Partnermodus is nog niet ingesteld in deze versie.';

  @override
  String get partnerModeErrorCodeNotFound =>
      'Die code is niet gevonden. Controleer hem en probeer opnieuw.';

  @override
  String get partnerModeErrorCodeExpired =>
      'Die code is verlopen. Vraag een nieuwe aan.';

  @override
  String get partnerModeErrorCodeIsOwn =>
      'Dat is je eigen code — vraag je partner om die van hem of haar.';

  @override
  String get partnerModeErrorNotSignedIn => 'Log eerst in.';

  @override
  String get partnerModeErrorUnknown =>
      'Er is iets misgegaan. Probeer het opnieuw.';

  @override
  String get partnerModeInviteTitle => 'Nodig je partner uit';

  @override
  String get partnerModeInviteBody =>
      'Stuur deze code naar je partner. Die voert hem in de eigen app in om met jou te koppelen.';

  @override
  String get partnerModeInviteExpiry => '7 dagen geldig';

  @override
  String get partnerModeInviteShare => 'Code delen';

  @override
  String partnerModeInviteMessage(String code) {
    return 'Hier is mijn Vera-koppelcode: $code';
  }

  @override
  String get partnerModeEnterTitle => 'Voer een code in';

  @override
  String get partnerModeEnterBody =>
      'Voer de code in die je partner je heeft gestuurd.';

  @override
  String get partnerModeEnterHint => '6-tekens code';

  @override
  String get partnerModeEnterSubmit => 'Koppelen';

  @override
  String get homeInvitePartnerTitle => 'Deel met je partner';

  @override
  String get homeInvitePartnerBody =>
      'Koppel en deel alleen wat je kiest — je geschiedenis blijft van jou.';

  @override
  String get homeInvitePartnerCta => 'Partnermodus instellen';

  @override
  String get feedbackTitle => 'Wat vond je niet fijn?';

  @override
  String get feedbackSubtitle =>
      'Kies een onderwerp en schrijf meer als je wilt.';

  @override
  String get feedbackCategoryPredictions => 'Voorspellingen';

  @override
  String get feedbackCategoryBackup => 'Back-up en herstel';

  @override
  String get feedbackCategorySubscription => 'Abonnement';

  @override
  String get feedbackCategoryAds => 'Advertenties';

  @override
  String get feedbackCategoryDesign => 'Ontwerp';

  @override
  String get feedbackCategoryTranslation => 'Vertaling';

  @override
  String get feedbackCategoryOther => 'Overig';

  @override
  String get feedbackDescriptionLabel => 'Vertel ons meer (optioneel)';

  @override
  String get feedbackDescriptionHint =>
      'Wat is er gebeurd? Als je op Verzenden tikt, kies je zelf waar je het deelt — je mailapp of ergens anders.';

  @override
  String get feedbackAttachPhoto => 'Foto toevoegen';

  @override
  String get feedbackPhotoAttached => 'Foto toegevoegd';

  @override
  String get remindersGroupCycle => 'Menstruatie en vruchtbaarheid';

  @override
  String get remindersGroupMedication => 'Medicatie';

  @override
  String get remindersGroupLifestyle => 'Leefstijl';

  @override
  String get remindersGroupAppointment => 'Doktersafspraken';

  @override
  String get settingsRemindersPeriodEndLabel =>
      'Laat iets weten wanneer mijn menstruatie zou moeten eindigen';

  @override
  String get settingsRemindersMedicationLabel => 'Medicatieherinnering';

  @override
  String get settingsRemindersWaterLabel => 'Drinkherinnering';

  @override
  String get settingsRemindersAppointmentLabel => 'Herinnering doktersafspraak';

  @override
  String get settingsRemindersAppointmentSet => 'Datum en tijd instellen';

  @override
  String get settingsRemindersAppointmentClear => 'Wissen';

  @override
  String get settingsOptionalTrackersHeading => 'Optionele trackers';

  @override
  String get settingsOptionalTrackersBody =>
      'Standaard uit. Zet je er een aan, dan verschijnt hij in het dagoverzicht.';

  @override
  String get settingsSexualActivityToggle => 'Seksuele activiteit';

  @override
  String get settingsBbtToggle => 'Basale lichaamstemperatuur';

  @override
  String get settingsMucusToggle => 'Baarmoederhalsslijm';

  @override
  String get settingsBreastExamToggle => 'Zelfonderzoek borsten';

  @override
  String get settingsCervixToggle =>
      'Stand en stevigheid van de baarmoedermond';

  @override
  String get settingsPrivacyEntry => 'Privacy';

  @override
  String get settingsRateEntry => 'Beoordeel ons';

  @override
  String get rateAppTitle => 'Werkt Vera voor jou?';

  @override
  String get rateAppBody =>
      'Zo ja, een paar seconden beoordelen in de store helpt anderen die iets soortgelijks zoeken om het daadwerkelijk te vinden.';

  @override
  String get rateAppCta => 'Beoordeel Vera';

  @override
  String get rateAppDismiss => 'Niet nu';

  @override
  String get settingsDeleteAllData => 'Alle gegevens verwijderen';

  @override
  String get privacyScreenTitle => 'Privacy';

  @override
  String get privacyScreenIntro =>
      'Hier lees je in gewone taal precies wat er met je gegevens gebeurt.';

  @override
  String get privacyScreenStorageTitle => 'Versleuteld op dit apparaat';

  @override
  String get privacyScreenNoNetworkTitle => 'Geen server, geen account';

  @override
  String get privacyScreenNoThirdPartyTitle => 'Geen tracking';

  @override
  String get privacyScreenExportTitle => 'Alleen jij exporteert';

  @override
  String get privacyScreenDeleteTitle => 'Verwijderen is definitief';

  @override
  String get privacyScreenStorage =>
      'Alles wat je vastlegt wordt versleuteld en alleen op dit apparaat opgeslagen, in één bestand. De versleutelingssleutel staat in de beveiligde hardware van je telefoon — Keychain op iOS, Keystore op Android — niet in het bestand zelf.';

  @override
  String get privacyScreenNoNetwork =>
      'Deze app heeft geen eigen server en geen accountsysteem — wat je vastlegt wordt nooit geüpload. De gratis versie bevat wel advertenties van Google, die verbinding maken met internet; die krijgen nooit iets van wat je vastlegt.';

  @override
  String get privacyScreenNoThirdParty =>
      'Er is geen analytics, geen crashrapportage en geen tracking-SDK. Het enige onderdeel van derden is de advertentie-SDK van Google in de gratis versie — Premium verwijdert die volledig.';

  @override
  String get privacyScreenExport =>
      'De enige manier waarop je gegevens dit apparaat ooit verlaten, is als je ze zelf exporteert, en die export is versleuteld met een wachtwoord dat alleen jij kent.';

  @override
  String get privacyScreenDelete =>
      'Je gegevens verwijderen is echt en direct. Er is geen account en geen back-up aan onze kant — weg is weg.';

  @override
  String get adPlaceholderLabel => 'Advertentieruimte';

  @override
  String get adPlaceholderUpgradeCta => 'Advertentievrij met Premium';

  @override
  String get reminderNotificationTitle =>
      'Je menstruatie begint mogelijk binnenkort';

  @override
  String get reminderNotificationBody =>
      'Op basis van je vastgelegde cycli komt je geschatte periode eraan.';

  @override
  String get reminderPeriodEndTitle =>
      'Je menstruatie loopt mogelijk ten einde';

  @override
  String get reminderPeriodEndBody =>
      'Als hij nog doorgaat, is dat helemaal normaal — dit is alleen een vriendelijk berichtje.';

  @override
  String get reminderMedicationTitle => 'Medicatieherinnering';

  @override
  String get reminderMedicationBody => 'Tijd om je medicatie in te nemen.';

  @override
  String get reminderWaterTitle => 'Drink genoeg water';

  @override
  String get reminderWaterBody => 'Een kleine drinkherinnering.';

  @override
  String get reminderAppointmentTitle => 'Aankomende doktersafspraak';

  @override
  String get reminderAppointmentBody =>
      'Je hebt binnenkort een doktersafspraak.';

  @override
  String get settingsExportEntry => 'Exporteren en back-up';

  @override
  String get exportBackupHeading => 'Versleutelde back-up';

  @override
  String get exportBackupBody =>
      'Bewaar een versleutelde kopie van je geschiedenis om over te zetten naar een nieuw apparaat. Je hebt het wachtwoord opnieuw nodig om hem terug te zetten — er is geen andere manier om erbij te komen.';

  @override
  String get exportCreateBackupButton => 'Back-up maken';

  @override
  String get exportRestoreBackupButton => 'Terugzetten uit back-up';

  @override
  String get exportPasswordLabel => 'Wachtwoord';

  @override
  String get exportPasswordConfirmLabel => 'Wachtwoord bevestigen';

  @override
  String get exportPasswordMismatch => 'Wachtwoorden komen niet overeen';

  @override
  String get exportPasswordTooShort => 'Gebruik minstens 8 tekens';

  @override
  String get exportRestoreConfirmTitle =>
      'Alle gegevens op dit apparaat vervangen?';

  @override
  String get exportRestoreConfirmBody =>
      'Een back-up terugzetten vervangt alles wat nu op dit apparaat is vastgelegd. Dit kan niet ongedaan worden gemaakt.';

  @override
  String get exportRestoreConfirmAction => 'Terugzetten';

  @override
  String get exportWrongPassword =>
      'Dat wachtwoord hoort niet bij deze back-up';

  @override
  String get exportInvalidFile => 'Dat bestand lijkt geen Vera-back-up te zijn';

  @override
  String get exportBackupCreated => 'Back-up klaar om te delen';

  @override
  String get exportRestoreSuccess => 'Back-up teruggezet';

  @override
  String get exportDoctorReportHeading => 'Rapport voor je arts';

  @override
  String get exportDoctorReportBody =>
      'Een samenvatting die je met een zorgverlener kunt delen.';

  @override
  String get exportIncludeNotesToggle => 'Persoonlijke notities meenemen';

  @override
  String get exportShareCsvButton => 'Delen als CSV';

  @override
  String get exportPrintPdfButton => 'Afdrukken / Opslaan als PDF';

  @override
  String get doctorReportDisclaimer =>
      'Gegenereerd door Vera op basis van door de gebruiker ingevoerde gegevens. Geen medische diagnose.';

  @override
  String get doctorReportGeneratedOn => 'Gegenereerd op';

  @override
  String get doctorReportSummaryHeading => 'Samenvatting';

  @override
  String get doctorReportDailyLogHeading => 'Dagoverzicht';

  @override
  String get doctorReportColumnDate => 'Datum';

  @override
  String get doctorReportTimelineHeading => 'Cyclustijdlijn';

  @override
  String get doctorReportCycleLabel => 'Cyclus';

  @override
  String get doctorReportTimelineLegendPeriod => 'Menstruatie';

  @override
  String get doctorReportTimelineLegendCycle => 'Rest van de cyclus';

  @override
  String get doctorReportTimelineOngoing => 'Loopt nog';

  @override
  String get dailyInsightLabel => 'Wist je dat?';

  @override
  String get insightMenstrual1 =>
      'Je baarmoederslijmvlies wordt nu afgestoten — de meeste menstruaties duren 3 tot 7 dagen, en dat is helemaal normaal.';

  @override
  String get insightMenstrual2 =>
      'IJzerrijke voeding zoals bladgroenten en linzen kan helpen aan te vullen wat je lichaam deze week verliest.';

  @override
  String get insightFollicular1 =>
      'Het oestrogeen stijgt, en veel mensen merken vanaf ongeveer nu meer energie en betere concentratie.';

  @override
  String get insightFollicular2 =>
      'Je lichaam maakt een eicel klaar voor de eisprong — deze fase kan van een week tot een paar weken duren.';

  @override
  String get insightFertile1 =>
      'Dit is je geschatte vruchtbare periode — de dagen rond de eisprong waarin een zwangerschap het waarschijnlijkst is, op basis van het gebruikelijke verloop.';

  @override
  String get insightFertile2 =>
      'Sommige mensen merken rond de eisprong een lichte stijging van de basale lichaamstemperatuur of veranderingen in het baarmoederhalsslijm.';

  @override
  String get insightLuteal1 =>
      'Na de eisprong stijgt het progesteron — dit is vaak het moment waarop PMS-klachten zoals stemmingswisselingen of een opgeblazen gevoel opduiken.';

  @override
  String get insightLuteal2 =>
      'Als er geen zwangerschap is ingenesteld, dalen de hormoonspiegels tegen het einde van deze fase, wat je volgende menstruatie op gang brengt.';

  @override
  String get insightUnknown1 =>
      'Cycluslengtes verschillen sterk van persoon tot persoon — alles tussen 21 en 35 dagen geldt als gebruikelijk.';

  @override
  String get insightsPhaseTipsTitle => 'Kan goed voelen in deze fase';

  @override
  String get tipFitnessLabel => 'Beweging';

  @override
  String get tipNutritionLabel => 'Voeding';

  @override
  String get tipFitnessMenstrual =>
      'Rustige beweging — wandelen, rekken of herstellende yoga — kan nu prettiger voelen dan intensieve trainingen.';

  @override
  String get tipFitnessFollicular =>
      'De energie stijgt vaak in deze fase — een goed moment om iets nieuws te proberen of het net iets zwaarder te maken.';

  @override
  String get tipFitnessFertile =>
      'Veel mensen voelen zich hier het energiekst — een goede fase voor intensievere training, als dat je aanspreekt.';

  @override
  String get tipFitnessLuteal =>
      'Als je energie later in deze fase afneemt, zijn rustiger krachttraining of zwemmen vaak beter vol te houden.';

  @override
  String get tipFitnessUnknown =>
      'Welke beweging vandaag goed voelt, is een goede keuze — er is geen enkele \"juiste\" routine voor elke dag.';

  @override
  String get tipNutritionMenstrual =>
      'IJzerrijke voeding zoals bladgroenten, linzen en rood vlees kan helpen aan te vullen wat je lichaam deze week verliest.';

  @override
  String get tipNutritionFollicular =>
      'Lichtere, frisse maaltijden vallen vaak goed als je energie stijgt — maar er is geen enkele \"juiste\" manier van eten in deze fase.';

  @override
  String get tipNutritionFertile =>
      'Genoeg drinken en evenwichtige maaltijden ondersteunen je energie in deze actiever aanvoelende fase.';

  @override
  String get tipNutritionLuteal =>
      'Je trek kan hier verschuiven — complexe koolhydraten en magnesiumrijke voeding zoals noten en pure chocolade zijn veelgekozen opties.';

  @override
  String get tipNutritionUnknown =>
      'Evenwichtige, regelmatige maaltijden zijn een prima uitgangspunt zolang je fase nog niet duidelijk is.';

  @override
  String get predictionSettingsEntry => 'Voorspellingsinstellingen';

  @override
  String get predictionSettingsIntro =>
      'Dit zijn aannames, open getoond. Zodra je 2 volledige cycli hebt vastgelegd, wordt je echte voorspelling op Start berekend uit je eigen gegevens — deze getallen worden daar dan niet meer voor gebruikt.';

  @override
  String get predictionSettingsPeriodLengthLabel =>
      'Gebruikelijke duur van je menstruatie';

  @override
  String get predictionSettingsCycleLengthLabel => 'Gebruikelijke cycluslengte';

  @override
  String get predictionSettingsCycleLengthHint =>
      'Wordt gebruikt om de ring op Start te schalen totdat er echte gegevens zijn.';

  @override
  String get predictionSettingsLutealLabel => 'Lengte van de luteale fase';

  @override
  String get predictionSettingsLutealHint =>
      'Het gebruikelijke aantal dagen tussen de eisprong en je volgende menstruatie. Wordt gebruikt om de geschatte vruchtbare periode te plaatsen — deze waarde blijft in gebruik, ook nadat echte voorspellingen zijn begonnen.';

  @override
  String get dayLogEnergyLabel => 'Energie';

  @override
  String get energyLevelLow => 'Laag';

  @override
  String get energyLevelMedium => 'Gemiddeld';

  @override
  String get energyLevelHigh => 'Hoog';

  @override
  String get energyLevelEnergetic => 'Vol energie';

  @override
  String get dayLogSkinHairLabel => 'Huid en haar';

  @override
  String get skinHealthyGlow => 'Gezonde gloed';

  @override
  String get skinRedness => 'Roodheid';

  @override
  String get skinDryness => 'Droogheid';

  @override
  String get skinOiliness => 'Vettigheid';

  @override
  String get hairGoodDay => 'Goede haardag';

  @override
  String get hairBadDay => 'Slechte haardag';

  @override
  String get hairLoss => 'Haaruitval';

  @override
  String get scalpOily => 'Vette hoofdhuid';

  @override
  String get dayLogBreastExamLabel => 'Zelfonderzoek borsten';

  @override
  String get breastExamAllNormal => 'Niets bijzonders';

  @override
  String get breastExamLump => 'Knobbeltje';

  @override
  String get breastExamIndentation => 'Intrekking';

  @override
  String get breastExamRedness => 'Roodheid';

  @override
  String get breastExamCrackedNipple => 'Gebarsten tepel';

  @override
  String get breastExamDischarge => 'Afscheiding';

  @override
  String get cervixPositionLabel => 'Stand van de baarmoedermond';

  @override
  String get cervixPositionLow => 'Laag';

  @override
  String get cervixPositionMedium => 'Gemiddeld';

  @override
  String get cervixPositionHigh => 'Hoog';

  @override
  String get cervixOpeningLabel => 'Opening van de baarmoedermond';

  @override
  String get cervixOpeningClosed => 'Gesloten';

  @override
  String get cervixOpeningMedium => 'Gemiddeld';

  @override
  String get cervixOpeningOpen => 'Open';

  @override
  String get cervixFirmnessLabel => 'Stevigheid van de baarmoedermond';

  @override
  String get cervixFirmnessSoft => 'Zacht';

  @override
  String get cervixFirmnessMedium => 'Gemiddeld';

  @override
  String get cervixFirmnessFirm => 'Stevig';

  @override
  String get dayLogWaterLabel => 'Water';

  @override
  String get dayLogSleepLabel => 'Slaap';

  @override
  String get dayLogWeightLabel => 'Gewicht';

  @override
  String get dayLogMedicationsLabel => 'Medicatie';

  @override
  String get dayLogAddMedication => 'Medicatie toevoegen';

  @override
  String get dayLogMedicationNameHint => 'Naam van het medicijn';

  @override
  String get dayLogBirthControlLabel => 'Anticonceptie';

  @override
  String get dayLogOtherMedicationsLabel => 'Andere medicijnen';

  @override
  String get birthControlPillTaken => 'Pil ingenomen';

  @override
  String get birthControlPillLate => 'Pil te laat ingenomen';

  @override
  String get birthControlPillMissed => 'Pil vergeten';

  @override
  String get birthControlPatch => 'Pleister';

  @override
  String get birthControlRing => 'Ring';

  @override
  String get birthControlInjection => 'Injectie';

  @override
  String get birthControlImplant => 'Implantaat';

  @override
  String get birthControlIud => 'Spiraaltje';

  @override
  String get navAssistant => 'Assistent';

  @override
  String get assistantTitle => 'Vera-assistent';

  @override
  String get assistantEndChatTitle => 'Dit gesprek beëindigen?';

  @override
  String get assistantEndChatBody =>
      'De berichten staan alleen in het geheugen en worden nergens bewaard, dus ze zijn niet terug te halen.';

  @override
  String get assistantEndChatConfirm => 'Gesprek beëindigen';

  @override
  String get assistantInputHint => 'Stel een vraag over je cyclus…';

  @override
  String get assistantIntro =>
      'Hoi! Ik kan vragen beantwoorden over menstruatie, cycli en hoe Vera werkt — hier op je telefoon, er verlaat niets je apparaat. Ik ben geen arts en dit is geen medisch advies.';

  @override
  String get insightMenstrual3 =>
      'Menstruatiebloed is geen \"vuil bloed\" — het is een mengsel van bloed en baarmoederslijmvlies, een volkomen normaal onderdeel van de cyclus.';

  @override
  String get insightMenstrual4 =>
      'Zachte warmte op de onderbuik verlicht krampen echt — een warme kruik is een klassieker met onderbouwing.';

  @override
  String get insightMenstrual5 =>
      'Het bloedverlies is vaak het hevigst in de eerste twee dagen en neemt daarna af — dat patroon is gebruikelijk.';

  @override
  String get insightMenstrual6 =>
      'Je wat vermoeider voelen tijdens je menstruatie komt vaak voor — met menstruatiebloed verlaat ijzer het lichaam.';

  @override
  String get insightFollicular3 =>
      'Oestrogeen bouwt je baarmoederslijmvlies na je menstruatie weer op — je lichaam begint opnieuw.';

  @override
  String get insightFollicular4 =>
      'De huid oogt in deze fase vaak het rustigst, terwijl de hormoonspiegels zich instellen.';

  @override
  String get insightFollicular5 =>
      'Uithoudingsvermogen en reactietijd pieken bij veel mensen in de late folliculaire fase.';

  @override
  String get insightFollicular6 =>
      'De lengte van deze fase verschilt het meest van persoon tot persoon — de luteale fase is veel constanter.';

  @override
  String get insightFertile3 =>
      'Een eicel leeft ongeveer 12–24 uur, maar zaadcellen kunnen tot 5 dagen wachten — daarom beslaat de vruchtbare periode meerdere dagen.';

  @override
  String get insightFertile4 =>
      'Rond de eisprong wordt baarmoederhalsslijm vaak helder en rekbaar — als rauw eiwit.';

  @override
  String get insightFertile5 =>
      'Sommige mensen voelen bij de eisprong een korte steek aan één kant — het heeft zelfs een naam: mittelschmerz.';

  @override
  String get insightFertile6 =>
      'De basale lichaamstemperatuur stijgt licht *na* de eisprong — het bevestigt dus dat die heeft plaatsgevonden, in plaats van hem te voorspellen.';

  @override
  String get insightLuteal3 =>
      'Progesteron piekt ongeveer een week na de eisprong — een opgeblazen gevoel en gevoelige borsten komen rond dat moment vaak voor.';

  @override
  String get insightLuteal4 =>
      'Trek in koolhydraten vóór je menstruatie is echt — de energiebehoefte stijgt licht in de luteale fase.';

  @override
  String get insightLuteal5 =>
      'PMS-klachten nemen meestal binnen een dag of twee af nadat het bloedverlies begint.';

  @override
  String get insightLuteal6 =>
      'Een vast slaapritme kan stemmingsdips in de late luteale fase merkbaar verzachten.';

  @override
  String get insightUnknown2 =>
      'Slechts drie cycli bijhouden is vaak al genoeg om je eigen patroon te zien ontstaan.';

  @override
  String get insightUnknown3 =>
      'Cycli zijn persoonlijk — de jouwe vergelijken met die van iemand anders levert zelden iets nuttigs op.';

  @override
  String get insightUnknown4 =>
      'Stress, reizen en ziekte kunnen de eisprong verschuiven — een \"late\" menstruatie betekent vaak gewoon een late eisprong.';

  @override
  String get settingsThemeLabel => 'Thema';

  @override
  String get settingsThemeSystem => 'Systeem';

  @override
  String get settingsThemeLight => 'Licht';

  @override
  String get settingsThemeDark => 'Donker';

  @override
  String get settingsMascotLabel => 'Begeleidende mascotte';

  @override
  String get mascotDroplet => 'Druppel';

  @override
  String get mascotFlower => 'Bloem';

  @override
  String get mascotMoon => 'Maan';

  @override
  String get mascotNone => 'Geen';

  @override
  String homeWindowCountdown(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: 'De voorspelde periode begint over ongeveer $days dagen',
      one: 'De voorspelde periode begint over ongeveer $days dag',
    );
    return '$_temp0';
  }

  @override
  String homeOvulationCountdown(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: 'Geschatte eisprong over ongeveer $days dagen',
      one: 'Geschatte eisprong over ongeveer $days dag',
    );
    return '$_temp0';
  }

  @override
  String get homeQuickLogTitle => 'Hoe voelt je lichaam vandaag?';

  @override
  String get actionSave => 'Opslaan';

  @override
  String get insightsTrackerHubTitle => 'Jouw trackers';

  @override
  String get trackerHistoryEmpty => 'Nog geen gegevens in deze periode';

  @override
  String get trackerStatAverage => 'Gemiddelde';

  @override
  String get trackerStatLowest => 'Laagste';

  @override
  String get trackerStatHighest => 'Hoogste';

  @override
  String get trackerStatLatest => 'Laatste';

  @override
  String get rangeFilter1m => '1 mnd';

  @override
  String get rangeFilter3m => '3 mnd';

  @override
  String get rangeFilter6m => '6 mnd';

  @override
  String get dayLogOvulationTestLabel => 'Ovulatietest';

  @override
  String get ovulationTestNegative => 'Negatief';

  @override
  String get ovulationTestPositive => 'Positief';

  @override
  String get ovulationTestLow => 'Laag';

  @override
  String get ovulationTestHigh => 'Hoog';

  @override
  String get ovulationTestPeak => 'Piek';

  @override
  String get pregnancyTestLabel => 'Zwangerschapstest';

  @override
  String get pregnancyTestPositive => 'Positief';

  @override
  String get pregnancyTestFaint => 'Vage streep';

  @override
  String get pregnancyTestNegative => 'Negatief';

  @override
  String get settingsOvulationTestToggle => 'Ovulatietest';

  @override
  String get settingsRemindersOvulationLabel =>
      'Seintje voor de vruchtbare periode';

  @override
  String get reminderOvulationTitle =>
      'Geschatte vruchtbare periode komt eraan';

  @override
  String get reminderOvulationBody =>
      'Op basis van je vastgelegde cycli kan je geschatte vruchtbare periode binnenkort beginnen.';

  @override
  String trackerEntriesCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count items',
      one: '$count item',
    );
    return '$_temp0';
  }

  @override
  String get trackerLowSampleNote =>
      'Met zo weinig items zijn percentages nog niet betrouwbaar — ze worden nauwkeuriger naarmate je meer registreert.';

  @override
  String get assistantTyping => 'Vera typt…';

  @override
  String get premiumTitle => 'Vera Premium';

  @override
  String get premiumHeadline => 'Vera Premium';

  @override
  String get premiumSubhead =>
      'Elke functie om iets bij te houden blijft voor altijd gratis — je geschiedenis wordt nooit achter een slot gezet. Premium voegt je eigen trackers toe, diepere inzichten, je eigen herinneringen en extra looks, en haalt de advertenties weg.';

  @override
  String get premiumBenefitNoAds => 'Geen advertenties, nergens in de app';

  @override
  String get premiumBenefitSupport =>
      'Steunt een onafhankelijke app die privacy vooropstelt';

  @override
  String get premiumMonthly => 'Maandelijks';

  @override
  String get premiumYearly => 'Jaarlijks';

  @override
  String get premiumYearlyNote => 'Eén keer per jaar in rekening gebracht';

  @override
  String premiumPerMonth(String price) {
    return '$price / maand';
  }

  @override
  String get premiumBilledMonthly => 'Maandelijks gefactureerd';

  @override
  String get premiumStaysFreeTitle => 'Wat gratis blijft';

  @override
  String get premiumStaysFreeBody =>
      'De kalender, je volledige geschiedenis, de basisstatistieken en export blijven altijd gratis. Premium voegt iets toe en neemt nooit iets weg.';

  @override
  String get premiumSubscribeCta => 'Doorgaan';

  @override
  String get premiumRestore => 'Aankoop herstellen';

  @override
  String get premiumCancelNote =>
      'Je kunt op elk moment opzeggen via je appstore-account. Geen aftelklokken, geen druk — als het nu niet uitkomt, blijft de gratis versie precies werken zoals vandaag.';

  @override
  String get premiumActiveBadge => 'Premium is actief';

  @override
  String get premiumDevToggle => 'Premium simuleren (ontwikkeling)';

  @override
  String get settingsPremiumEntry => 'Vera Premium';

  @override
  String get adTestNotice => 'Testadvertentie — nog geen echte plaatsing';

  @override
  String get settingsPregnancyModeLabel => 'Zwangerschapsmodus';

  @override
  String get pregnancyLmpLabel => 'Eerste dag van je laatste menstruatie';

  @override
  String pregnancyWeekLabel(int weeks, int days) {
    return 'Week $weeks, dag $days';
  }

  @override
  String get pregnancyDueDateLabel => 'Geschatte uitgerekende datum';

  @override
  String pregnancyDaysLeft(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: 'Nog ongeveer $days dagen te gaan',
      one: 'Nog ongeveer $days dag te gaan',
    );
    return '$_temp0';
  }

  @override
  String pregnancyTrimesterLabel(int n) {
    return 'Trimester $n';
  }

  @override
  String get pregnancyDisclaimer =>
      'De data zijn geschat op basis van je laatste menstruatie met de gebruikelijke 280-dagenregel. Een echo geeft een nauwkeurigere datum, en een late eisprong verschuift deze getallen — dit is informatie, geen medische zorg.';

  @override
  String get pregnancySizeLabel => 'Grootte van je baby';

  @override
  String get pregnancySizeUnder5 => 'Papaverzaad (~2 mm)';

  @override
  String get pregnancySizeUnder9 => 'Bosbes (~1.6 cm)';

  @override
  String get pregnancySizeUnder13 => 'Limoen (~5.4 cm)';

  @override
  String get pregnancySizeUnder20 => 'Avocado (~11.6 cm)';

  @override
  String get pregnancySizeUnder28 => 'Mango (~30 cm)';

  @override
  String get pregnancySizeUnder34 => 'Ananas (~44 cm)';

  @override
  String get pregnancySizeUnder38 => 'Meloen (~46 cm)';

  @override
  String get pregnancySizeTerm => 'Kleine watermeloen (~51 cm)';

  @override
  String get pregnancyNoteUnder5 =>
      'De meeste mensen merken nog niets — omdat de zwangerschapsduur vanaf je laatste menstruatie wordt geteld, liggen de eerste twee weken eigenlijk vóór de bevruchting.';

  @override
  String get pregnancyNoteUnder9 =>
      'Misselijkheid, gevoelige borsten en vermoeidheid komen nu vaak voor. Een goed moment om een eerste afspraak te maken.';

  @override
  String get pregnancyNoteUnder13 =>
      'Het einde van het eerste trimester komt in zicht; bij veel mensen begint de misselijkheid rond deze tijd af te nemen.';

  @override
  String get pregnancyNoteUnder20 =>
      'In deze fase komt de energie vaak terug. De eerste bewegingen kunnen ergens tussen week 16 en 22 voelbaar worden.';

  @override
  String get pregnancyNoteUnder28 =>
      'De bewegingen worden duidelijker en gaan een patroon vormen. Rugpijn en brandend maagzuur komen in deze fase vaak voor.';

  @override
  String get pregnancyNoteUnder34 =>
      'Je bent in het derde trimester. Kortademigheid, vaak plassen en Braxton-Hicks-weeën komen vaak voor.';

  @override
  String get pregnancyNoteUnder38 =>
      'De baby bereidt zich voor op de geboorte. Een goed moment voor een ziekenhuistas en een geboorteplan.';

  @override
  String get pregnancyNoteTerm =>
      'Je bent à terme — de bevalling kan elk moment tussen week 37 en 42 plaatsvinden; week 40 is een gemiddelde, geen uiterste datum.';

  @override
  String get pregnancyWeeklyNoteTitle => 'Deze week';

  @override
  String get pregnancyNeedsLmp =>
      'Voeg de eerste dag van je laatste menstruatie toe om te beginnen met bijhouden.';

  @override
  String get pregnancyOutOfRange =>
      'Die datum ligt meer dan 42 weken terug — pas hem aan of zet de zwangerschapsmodus uit.';

  @override
  String get partnerShareTitle => 'Een samenvatting delen met een partner';

  @override
  String get partnerShareBody =>
      'Maakt een korte tekstsamenvatting — je huidige fase en geschatte periode — die je zelf via een willekeurige app verstuurt. Er is geen live synchronisatie en geen partneraccount: er wordt niets gedeeld tenzij jij het verstuurt.';

  @override
  String get partnerShareCta => 'Samenvatting maken';

  @override
  String get partnerSummaryHeader => 'Cyclussamenvatting van Vera';

  @override
  String get settingsHomeThemeLabel => 'Achtergrond van Start';

  @override
  String get homeThemeWheat => 'Tarwe';

  @override
  String get homeThemeSky => 'Lucht';

  @override
  String get homeThemeField => 'Veld';

  @override
  String get homeThemeBlossom => 'Bloesem';

  @override
  String get homeThemePlain => 'Effen';

  @override
  String get backupNudgeTitle => 'Bewaar een kopie van je gegevens';

  @override
  String get backupNudgeBody =>
      'Alles staat alleen op deze telefoon. Raak je hem kwijt, gaat hij kapot of wordt hij gewist, dan gaat je geschiedenis mee — een versleutelde back-up kost even en alleen jij kunt hem openen.';

  @override
  String get backupNudgeCta => 'Nu een back-up maken';

  @override
  String get backupNudgeDismiss => 'Later';

  @override
  String backupLastDone(String date) {
    return 'Laatste back-up: $date';
  }

  @override
  String get backupNever => 'Nog geen back-up';

  @override
  String get settingsRemindersBackupLabel => 'Herinner me aan een back-up';

  @override
  String get reminderBackupTitle => 'Tijd voor een Vera-back-up';

  @override
  String get reminderBackupBody =>
      'Je geschiedenis bestaat alleen op deze telefoon. Een snelle versleutelde back-up houdt hem veilig.';

  @override
  String get notificationChannelPeriodStart => 'Aankomende menstruatie';

  @override
  String get notificationChannelPeriodEnd => 'Seintje einde menstruatie';

  @override
  String get notificationChannelMedication => 'Medicatie';

  @override
  String get notificationChannelWater => 'Water';

  @override
  String get notificationChannelAppointment => 'Afspraak';

  @override
  String get notificationChannelOvulation => 'Vruchtbare periode';

  @override
  String get notificationChannelBackup => 'Back-upherinnering';

  @override
  String get calendarDayDetailTitle => 'Deze dag';

  @override
  String get calendarDayNothingLogged => 'Nog niets vastgelegd voor deze dag';

  @override
  String get calendarDayOpenLog => 'Dagoverzicht openen';

  @override
  String get cycleHistoryTitle => 'Eerdere cycli';

  @override
  String get cycleTrendsTitle => 'Cyclustrends';

  @override
  String get cycleHistoryEmpty =>
      'Leg een paar menstruaties vast, dan verschijnt je cyclusgeschiedenis hier.';

  @override
  String get cycleHistoryOngoing => 'Loopt nog';

  @override
  String cycleHistoryLength(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: 'Cyclus van $days dagen',
      one: 'Cyclus van $days dag',
    );
    return '$_temp0';
  }

  @override
  String cycleHistoryPeriodLength(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: 'Menstruatie duurde $days dagen',
      one: 'Menstruatie duurde 1 dag',
    );
    return '$_temp0';
  }

  @override
  String cycleHistoryVsAverage(String diff) {
    return '$diff ten opzichte van je gemiddelde';
  }

  @override
  String get insightsCycleHistoryEntry => 'Eerdere cycli';

  @override
  String get homeEmptyTitle => 'Laten we beginnen met je laatste menstruatie';

  @override
  String get homeEmptyBody =>
      'Tik op de knop hierboven op de dag dat je menstruatie begint. Na twee volledige cycli kan Vera beginnen met schatten — tot die tijd doet Vera niet alsof ze het weet.';

  @override
  String get homeEmptyBackdate => 'Die is al eerder begonnen';

  @override
  String get settingsAdPrivacyEntry => 'Privacyopties voor advertenties';

  @override
  String a11yCycleRing(int day, int length) {
    return 'Cyclusdag $day van ongeveer $length';
  }

  @override
  String a11yChartSummary(int count, String min, String max) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Grafiek met $count items, van $min tot $max',
      one: 'Grafiek met $count item, van $min tot $max',
    );
    return '$_temp0';
  }

  @override
  String a11yPhaseBar(int day, int length) {
    return 'Cyclusvoortgang: dag $day van ongeveer $length';
  }

  @override
  String a11yFrequencyItem(String label, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count keer',
      one: '$count keer',
    );
    return '$label: $_temp0';
  }

  @override
  String get importTitle => 'Importeren uit een andere app';

  @override
  String get importBody =>
      'Exporteer je geschiedenis uit je oude app als CSV en kies het bestand hier. Alleen datums en bloedverlies worden geïmporteerd — de woorden voor symptomen en stemmingen verschillen per app, en Vera gaat niet raden wat je bedoelde.';

  @override
  String get importPickFile => 'CSV-bestand kiezen';

  @override
  String importPreview(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count dagen geschiedenis gevonden',
      one: '$count dag geschiedenis gevonden',
    );
    return '$_temp0';
  }

  @override
  String importSkipped(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          '$count regels konden niet worden gelezen en blijven buiten beschouwing',
      one: '$count regel kon niet worden gelezen en blijft buiten beschouwing',
    );
    return '$_temp0';
  }

  @override
  String get importConfirm => 'Toevoegen aan mijn geschiedenis';

  @override
  String get importMergeNote =>
      'Geïmporteerde dagen worden samengevoegd. Dagen die je al in Vera hebt vastgelegd blijven zoals ze zijn.';

  @override
  String importDone(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count dagen geïmporteerd',
      one: '$count dag geïmporteerd',
    );
    return '$_temp0';
  }

  @override
  String get importErrorEmpty => 'Dat bestand lijkt leeg te zijn.';

  @override
  String get importErrorNoDate => 'Kon geen datumkolom vinden in dat bestand.';

  @override
  String get settingsImportEntry => 'Importeren uit een andere app';

  @override
  String get settingsHealthSyncLabel =>
      'Synchroniseren met Apple Health / Health Connect';

  @override
  String get settingsHealthSyncBody =>
      'Schrijft alleen bloedverlies, gewicht en basale temperatuur naar de gezondheidsapp van je telefoon. Symptomen, stemmingen en notities blijven in Vera. Er wordt niets teruggelezen.';

  @override
  String healthSyncBackfilled(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count dagen naar je gezondheidsapp gestuurd',
      one: '$count dag naar je gezondheidsapp gestuurd',
    );
    return '$_temp0';
  }

  @override
  String get healthSyncDenied =>
      'De toestemming is niet gegeven, dus synchroniseren blijft uit.';

  @override
  String get settingsDiagnosticsEntry => 'Diagnostiek';

  @override
  String get diagnosticsBody =>
      'Als de app zich vreemd gedraagt, worden de technische details hier vastgelegd — alleen op dit apparaat. Er wordt niets verstuurd tenzij je daarvoor kiest, en je kunt eerst precies lezen wat je zou versturen.';

  @override
  String get diagnosticsEmpty =>
      'Niets vastgelegd — er zijn geen problemen gevonden.';

  @override
  String get diagnosticsShare => 'Naar de ontwikkelaar sturen';

  @override
  String get diagnosticsClear => 'Wissen';

  @override
  String get diagnosticsNoteLabel => 'Wat is er gebeurd? (optioneel)';

  @override
  String get diagnosticsTechnicalDetail => 'Technische details';

  @override
  String get unitHoursShort => 'u';

  @override
  String get unitMinutesShort => 'm';

  @override
  String get unitHoursLong => 'uur';

  @override
  String get unitMinutesLong => 'minuten';

  @override
  String get unitMilliliters => 'ml';

  @override
  String get unitKilograms => 'kg';

  @override
  String get calendarJumpTitle => 'Ga naar maand';

  @override
  String get calendarJumpYearLabel => 'Jaar';

  @override
  String get settingsAdPrivacyUnavailable =>
      'In jouw regio worden geen keuzes voor advertentiepersonalisatie aangeboden — advertenties hier zijn sowieso niet gepersonaliseerd.';

  @override
  String get settingsGroupAppearance => 'Weergave';

  @override
  String get settingsGroupTracking => 'Voorkeuren voor bijhouden';

  @override
  String get dayLogCustomTagsLabel => 'Mijn eigen trackers';

  @override
  String get customTagAddButton => 'Tracker toevoegen';

  @override
  String get customTagDialogTitle => 'Nieuwe tracker';

  @override
  String get customTagDialogHint =>
      'bijv. migraine, sportschool, slapeloosheid';

  @override
  String get customTagManageEntry => 'Mijn trackers beheren';

  @override
  String get customTagRenameTitle => 'Tracker hernoemen';

  @override
  String get customTagDeleteTitle => 'Deze tracker verwijderen?';

  @override
  String get customTagDeleteBody =>
      'Hij wordt verwijderd van elke dag waarop je hem gebruikt hebt. Je andere gegevens blijven zoals ze zijn.';

  @override
  String get customTagEmpty => 'Nog geen eigen trackers.';

  @override
  String get premiumLockedTitle => 'Premium-functie';

  @override
  String get premiumLockedAction => 'Bekijk Premium';

  @override
  String get premiumBenefitCustomTrackers =>
      'Houd alles bij wat je wilt, in je eigen woorden';

  @override
  String get premiumBenefitAdvancedInsights =>
      'Geavanceerde inzichten: wat er vaak gebeurt, en wanneer';

  @override
  String get premiumBenefitPersonalisation =>
      'Extra achtergronden en metgezellen';

  @override
  String get premiumBenefitAdvancedReminders =>
      'Herinneringen op je eigen schema';

  @override
  String get advancedInsightsTitle => 'Geavanceerde inzichten';

  @override
  String get advancedInsightsEntry => 'Geavanceerde inzichten';

  @override
  String get advancedInsightsNotEnough =>
      'Leg drie volledige cycli vast, dan verschijnen je patronen hier. Met minder zou elk \"patroon\" gewoon toeval zijn.';

  @override
  String get advancedInsightsPatternsTitle => 'Wanneer dingen meestal opduiken';

  @override
  String advancedInsightsPatternLine(String label, String segment) {
    return '$label — meestal $segment';
  }

  @override
  String advancedInsightsPatternDetail(int count, int day) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count dagen vastgelegd, rond dag $day van je cyclus',
      one: '$count dag vastgelegd, rond dag $day van je cyclus',
    );
    return '$_temp0';
  }

  @override
  String advancedInsightsNoPattern(String label) {
    return '$label — nog geen duidelijk moment';
  }

  @override
  String get advancedInsightsTrendTitle => 'Cycluslengte in de tijd';

  @override
  String advancedInsightsDriftLonger(String days, String cycles) {
    return 'Vergeleken met je eerste $cycles cycli duren je laatste $cycles ongeveer $days dagen langer.';
  }

  @override
  String advancedInsightsDriftShorter(String days, String cycles) {
    return 'Vergeleken met je eerste $cycles cycli duren je laatste $cycles ongeveer $days dagen korter.';
  }

  @override
  String advancedInsightsDriftStable(String cycles) {
    return 'Vergeleken met je eerste $cycles cycli en je laatste $cycles is je cycluslengte ongeveer gelijk gebleven.';
  }

  @override
  String get advancedInsightsDriftNotEnough =>
      'Zodra je zes volledige cycli hebt, kan Vera je vroegste cycli met je meest recente vergelijken om te zien of je cycluslengte verschuift.';

  @override
  String get advancedInsightsMoodTitle => 'Stemming per deel van de cyclus';

  @override
  String get advancedInsightsDisclaimer =>
      'Dit zijn tellingen van wat je hebt vastgelegd, niets meer. Het is geen diagnose, en een patroon hier is geen oorzaak.';

  @override
  String get segmentPeriod => 'tijdens je menstruatie';

  @override
  String get segmentAfterPeriod => 'na je menstruatie';

  @override
  String get segmentMidCycle => 'midden in je cyclus';

  @override
  String get segmentBeforePeriod => 'vóór je menstruatie';

  @override
  String get customRemindersEntry => 'Mijn eigen herinneringen';

  @override
  String get customRemindersTitle => 'Mijn eigen herinneringen';

  @override
  String get customRemindersEmpty => 'Nog geen eigen herinneringen.';

  @override
  String get customRemindersAdd => 'Herinnering toevoegen';

  @override
  String get customReminderLabelHint => 'bijv. pil innemen, water drinken';

  @override
  String get customReminderLockScreenNote =>
      'De tekst van de herinnering verschijnt op je vergrendelscherm, dus houd hem zo privé als jij zelf wilt.';

  @override
  String get customReminderDelete => 'Herinnering verwijderen';

  @override
  String get homeThemeDusk => 'Schemer';

  @override
  String get homeThemeMeadow => 'Weide';

  @override
  String get homeThemePetal => 'Bloemblad';

  @override
  String get homeThemeBloom => 'Bloei';

  @override
  String get homeThemeOcean => 'Oceaan';

  @override
  String get homeThemeAutumn => 'Herfst';

  @override
  String get homeThemeNight => 'Nacht';

  @override
  String get mascotStar => 'Ster';

  @override
  String get mascotLeaf => 'Blad';

  @override
  String get mascotCat => 'Kat';

  @override
  String get mascotRabbit => 'Konijn';

  @override
  String get mascotBird => 'Vogel';

  @override
  String get tipDetailWhatsHappening => 'Wat er in je lichaam gebeurt';

  @override
  String get tipDetailGeneralHeading => 'Algemene suggesties';

  @override
  String get tipDetailDisclaimer =>
      'Dit is algemene informatie, geen persoonlijk medisch advies. Elk lichaam reageert anders, en hoe jij je werkelijk voelt telt zwaarder dan wat hier wordt gesuggereerd. Als iets je zorgen baart, bespreek het dan met een zorgverlener.';

  @override
  String get phaseExplainerMenstrual =>
      'Je bloedt doordat het baarmoederslijmvlies loslaat. Oestrogeen en progesteron staan op hun laagste punt van de cyclus, en daarom voelen veel mensen zich de eerste dagen vermoeider en meer naar binnen gekeerd. De bloeding duurt meestal drie tot zeven dagen en is aan het begin het hevigst. Krampen komen van het samentrekken van de baarmoeder, aangestuurd door prostaglandinen — hormoonachtige stoffen die vrijkomen terwijl het slijmvlies loslaat, en ook de reden dat sommige mensen er tegelijk rugpijn of een lossere stoelgang bij hebben. De bloeding kost ook ijzer, en dat verklaart een deel van de vermoeidheid. Warmte, beweging en slaap helpen meestal. Loopt je bescherming elk uur vol, duurt de bloeding duidelijk langer dan een week, of houdt de pijn je van gewone dingen af, leg dat dan voor aan een zorgverlener in plaats van het uit te zitten.';

  @override
  String get phaseExplainerFollicular =>
      'Als de bloeding voorbij is, begint oestrogeen weer te stijgen. In de eierstokken rijpt een groep follikels, elk met een eicel, en meestal komt er maar één vrij. Oestrogeen bouwt het net afgestoten slijmvlies weer op, en de meeste mensen merken dat energie, stemming, huid en uithoudingsvermogen mee terugkomen. Dit is ook het deel van de cyclus dat het sterkst verschilt tussen mensen en tussen maanden — stress, ziekte, reizen en slaap laten zich hier zien door het langer of korter te maken. Dat is de eerlijke reden dat een voorspelling een periode is en geen datum: de tweede helft van de cyclus ligt redelijk vast, en deze helft is de beweeglijke.';

  @override
  String get phaseExplainerFertile =>
      'Oestrogeen zit tegen zijn piek aan en de eisprong wordt rond deze dagen verwacht. Een piek in het luteïniserend hormoon zet ongeveer een tot anderhalve dag later de eisprong in gang. De eicel zelf blijft zo\'n 12 tot 24 uur in leven, maar zaadcellen kunnen meerdere dagen overleven in vruchtbaar baarmoederhalsslijm — daarom telt het venster meerdere dagen en niet één. Het slijm wordt meestal helder, rekbaar en glad, een beetje als rauw eiwit; sommige mensen merken meer zin, gevoelige borsten of een korte steek aan één kant. De energie zit vaak op het hoogste punt van de cyclus. Onthoud dat dit venster een schatting is uit je eigen geschiedenis, geen meting, en het is geen anticonceptiemethode.';

  @override
  String get phaseExplainerLuteal =>
      'Na de eisprong wordt de lege follikel het gele lichaam en begint progesteron te maken, dat het slijmvlies stabiel houdt voor het geval er een zwangerschap innestelt. Gebeurt dat niet, dan dalen progesteron en oestrogeen scherp en begint je menstruatie. Deze helft van de cyclus is de meest constante, meestal zo\'n 12 tot 14 dagen. Progesteron duwt je rusttemperatuur iets omhoog — precies wat een basaalthermometer oppikt — en kan de spijsvertering vertragen, wat een deel van het opgeblazen gevoel verklaart. De daling aan het eind is wat bij veel mensen PMS oproept: gespannen borsten, veranderende eetlust, onderbroken slaap, hoofdpijn en stemmingswisselingen, die meestal afnemen zodra de bloeding begint. Verstoren die klachten de meeste maanden je werk of je relaties, dan is het de moeite waard er met een zorgverlener over te praten.';

  @override
  String get phaseExplainerUnknown =>
      'Er is nog niet genoeg vastgelegd om te zeggen in welke fase je zit. Vera heeft minstens twee volledige cycli nodig — een start van je menstruatie en dan de volgende — om je eigen gemiddelde en spreiding te berekenen, en zegt dat liever dan een fase te verzinnen. Ondertussen gaat er niets verloren: elke dag die je vastlegt hoort bij die eerste berekening, en de schatting wordt smaller naarmate je geschiedenis groeit. Tot die tijd zijn de suggesties hieronder algemeen en gelden ze op elk punt in de cyclus.';

  @override
  String get tipFitnessDetailMenstrual =>
      'Hard trainen past de eerste dagen bij de meeste mensen niet, en dat is geen kwestie van discipline — je energie is echt lager, en ijzerverlies door de bloeding maakt duurwerk zwaarder dan dezelfde training vorige week aanvoelde. Wandelen, rustig rekken, herstellende yoga en ademwerk verbeteren de doorbloeding en kunnen krampen verzachten; bij sommige mensen verlaagt regelmatig bewegen over de hele maand de krampintensiteit meer dan wat ze op de dag zelf doen. Voel je je goed, dan is er geen reden om zware trainingen te vermijden: bloeden is geen reden om te stoppen met sporten, en veel sporters doen gewoon mee aan wedstrijden. Een paar praktische punten: lange, veeleisende sessies op dagen met veel bloedverlies kunnen de vermoeidheid verdiepen, warmte op de onderbuik voor je begint maakt bewegen comfortabeler, en iets meer drinken dan normaal helpt tegen de hoofdpijn van deze dagen. Beoordeel de training op hoe hij aanvoelt, niet op hoe je beste week eruitzag.';

  @override
  String get tipFitnessDetailFollicular =>
      'Terwijl oestrogeen stijgt voelen de meeste mensen zich sterker en belastbaarder; dit is meestal het beste stuk van de cyclus om iets nieuws te beginnen, gewicht toe te voegen of het tempo op te voeren. Spierherstel verloopt hier relatief efficiënt, dus zware sessies worden beter verwerkt en laten minder aanhoudende spierpijn achter. Het is ook een goed venster voor wat een helder hoofd vraagt en niet alleen een sterk lichaam — een nieuwe oefening leren, techniek verbeteren, of een langere afstand dan je eerder deed. Twee kanttekeningen om vast te houden: bouw geleidelijk op, want veel energie betekent geen nul blessurerisico en de meeste overbelastingsblessures beginnen in een goede week, niet in een slechte. En bescherm je slaap: aanpassing gebeurt tijdens herstel, niet tijdens de training.';

  @override
  String get tipFitnessDetailFertile =>
      'Energie en motivatie zitten meestal op hun hoogst, dus veeleisende sessies vallen goed — persoonlijke records vallen hier vaak. Sommig onderzoek suggereert dat gewrichten rond de eisprong iets losser zijn; over het praktische effect wordt gediscussieerd, maar een langere warming-up is een goedkope voorzorg bij sporten met scherpe richtingsveranderingen, sprongen en landingen. De lichaamstemperatuur is nog laag vergeleken met de tweede helft van de cyclus, dus warmte remt hier minder dan over een week of twee. Een korte steek aan één kant van de onderbuik rond de eisprong komt vaak voor en gaat meestal binnen uren over. Is de pijn hevig, eenzijdig en aanhoudend, komt er koorts bij of voel je je flauw, stop dan en laat het nakijken in plaats van door te trainen.';

  @override
  String get tipFitnessDetailLuteal =>
      'Als je menstruatie nadert kan je energie dalen, kan je hartslag bij dezelfde inspanning hoger liggen en kan herstel langer duren. Dat is een verwachte schommeling, geen achteruitgang, en het wist het werk van de afgelopen twee weken niet uit. Progesteron verhoogt je rusttemperatuur iets en maakt het lastiger om warmte kwijt te raken, dus warme of vochtige sessies voelen hier onevenredig zwaar — vroeger of later op de dag trainen en meer drinken dan nodig lijkt helpen allebei. Matige sessies, een wat lichtere versie van je krachtwerk en wandelen zijn hier meestal beter vol te houden. Bij een opgeblazen gevoel en gevoelige borsten maken een goed ondersteunende sportbeha en een langere warming-up echt verschil. Zit je stemming laag, houd de sessie dan kort en makkelijk in plaats van hem over te slaan — de drempel om mee te tellen ligt lager dan het voelt.';

  @override
  String get tipFitnessDetailUnknown =>
      'Ook zonder je fase te kennen helpt bewegen op elk moment: het algemene advies is ongeveer 150 minuten matige activiteit per week, verspreid over de meeste dagen, plus twee keer per week versterkend werk — en dat patroon levert bijna iedereen meer op dan af en toe een heel zware sessie. Regelmaat telt zwaarder dan intensiteit, en de beste training is die je volgende week echt herhaalt. Stem af op hoe je je voelt: op moeie dagen telt een wandeling, en een korte gedane sessie is meer waard dan een lange overgeslagen sessie. Zodra je een paar cycli hebt vastgelegd verschijnen hier suggesties per fase.';

  @override
  String get tipNutritionDetailMenstrual =>
      'Bloeden kost je ijzer; rood vlees, linzen, kikkererwten, donkergroene bladgroenten en melasse helpen het aan te vullen. Plantaardig ijzer wordt duidelijk beter opgenomen samen met vitamine C — citroen over een linzengerecht is daarvan de praktischste versie, en een tomatensalade ernaast doet hetzelfde. Thee en koffie bij de maaltijd verlagen de ijzeropname door hun tannines, dus ongeveer een uur ertussen laten is genoeg; je hoeft er geen van beide op te geven. Genoeg water drinken kan de vermoeidheid en hoofdpijn rond de bloeding verzachten, en magnesiumrijke producten als noten, zaden en donkere bladgroenten helpen sommige mensen bij krampen. Op dagen dat de spijsvertering traag is liggen kleine, regelmatige maaltijden beter dan grote. Voel je je rond je menstruatie vaak kortademig, duizelig of ongewoon uitgeput, noem dat dan bij een zorgverlener: een laag ijzergehalte komt veel voor, is eenvoudig te testen, en is niets wat een app moet vaststellen.';

  @override
  String get tipNutritionDetailFollicular =>
      'Nu de energie terugkomt staat het lichaam in de opbouwstand: genoeg eiwit, volkoren producten en groenten ondersteunen dat, en in deze fase is de eetlust meestal het stabielst en het makkelijkst te sturen. Het is ook zinvol om de ijzervoorraad na de bloeding te blijven aanvullen in plaats van dat als een klus van alleen de menstruatieweek te zien — voorraden bouwen zich op in weken, niet in dagen. Maaltijden niet overslaan gaat hier makkelijker, en het laat je evenwichtiger de eetlustschommelingen van de volgende fase in gaan. Wil je iets veranderen aan hoe je eet, dan is dit stuk daar meestal vriendelijker voor dan de week voor je menstruatie, waarin trek en een lage stemming elke nieuwe routine moeilijker laten lijken dan hij is.';

  @override
  String get tipNutritionDetailFertile =>
      'Hier is geen speciaal dieet nodig; evenwichtige maaltijden en genoeg water doen het meeste werk. Sommige mensen voelen zich rond de eisprong opgeblazen, wat meestal hormonaal en voorbijgaand is en niet komt door wat je gegeten hebt. De eetlust daalt bij de een licht en stijgt bij de ander — allebei gewoon. Eiwit en vezels in je maaltijden houden je energie stabiel in wat vaak het drukste, actiefste stuk van de maand is. Plan je een zwangerschap, dan is dit een verstandig moment om een zorgverlener naar foliumzuur te vragen, dat doorgaans vóór de conceptie wordt geadviseerd en niet erna — maar dat is een gesprek met hen, geen advies dat een app hoort te geven.';

  @override
  String get tipNutritionDetailLuteal =>
      'Meer trek en zin in zoet terwijl progesteron stijgt komt heel vaak voor; dat is een hormonale verschuiving, geen wilskrachtprobleem, en je lichaam verbruikt in deze fase echt iets meer energie. Eiwit en vezels aan maaltijden toevoegen houdt je bloedsuiker stabieler en verzacht de trek veel beter dan proberen hem te negeren — trek die met iets stevigs beantwoord wordt is meestal eerder voorbij dan trek waar je een uur tegen vecht. Minder zout en meer water kunnen het opgeblazen gevoel verlichten; dat klinkt omgekeerd maar is het niet: goed gehydrateerd houdt je lichaam minder vast. Magnesiumrijke producten (amandelen, walnoten, donkere bladgroenten, pure chocolade) verminderen bij sommige mensen krampen en spanning. Cafeïne na het middaguur beperken helpt tegen de onderbroken slaap van deze fase, en alcohol is ook het bekijken waard, omdat het de slaap juist versnippert op het punt in de cyclus waar die al lichter is.';

  @override
  String get tipNutritionDetailUnknown =>
      'Wat de fase ook is, dezelfde dingen helpen het meest: regelmatige maaltijden, genoeg eiwit, veel groenten, genoeg water en ijzerrijke producten. Omdat bloeden ijzer kost, is er op die dagen wat extra aandacht genoeg — je hebt geen ander eetpatroon nodig voor elke week van de maand. Op ongeveer vaste tijden eten doet meer voor stabiele energie dan welk afzonderlijk voedingsmiddel ook, en er hoeft niets geschrapt te worden om een cyclus gezond te laten zijn. Zodra je een paar cycli hebt vastgelegd verschijnen hier suggesties per fase.';

  @override
  String get tipSleepLabel => 'Slaap';

  @override
  String get tipSleepMenstrual =>
      'Krampen en ongemak kunnen de slaap verstoren; een warme douche of warmwaterkruik voor het slapen kan helpen.';

  @override
  String get tipSleepFollicular =>
      'Met stijgende energie voelen velen zich alerter — de werkelijke slaapbehoefte daalt echter niet echt.';

  @override
  String get tipSleepFertile =>
      'De lichte temperatuurstijging rond de eisprong kan het inslapen iets moeilijker maken; een koelere kamer kan helpen.';

  @override
  String get tipSleepLuteal =>
      'Progesteron verhoogt de rusttemperatuur licht en kan diepe slaap lichter maken; een koele, donkere kamer en een vaste bedtijd helpen hier het meest.';

  @override
  String get tipSleepUnknown =>
      'De slaapkwaliteit verandert vaak gedurende de cyclus — meestal het meest kwetsbaar vlak voor en tijdens de menstruatie. Een vaste bedtijd is de betrouwbaarste basis, ongeacht de fase.';

  @override
  String get tipSleepDetailMenstrual =>
      'Tijdens de menstruatie is slaap vaak meer gefragmenteerd — krampen, ongemak en bij sommigen vaker naar het toilet kunnen \'s nachts wekken. Een warme douche, warmwaterkruik of lichte stretching voor het slapen kan krampen verlichten. Neem je pijnstillers, dan kan de timing zo dat het effect het eerste deel van de nacht dekt de vroege slaap beschermen.';

  @override
  String get tipSleepDetailFollicular =>
      'Met stijgend oestrogeen voelen velen zich alerter en energieker, wat kan aanvoelen als minder slaapbehoefte. Dat klopt niet helemaal — wakker blijven gaat gewoon makkelijker. Een vaste bedtijd aanhouden loont later, wanneer slaap in andere fasen kwetsbaarder wordt.';

  @override
  String get tipSleepDetailFertile =>
      'De lichte temperatuurstijging rond de eisprong kan het inslapen iets moeilijker maken, omdat het lichaam van nature wil afkoelen voor het slapen. Een koelere kamer, een lichtere deken of een warme douche voor het slapen kan dit compenseren. Wie meer verlangen of sociale energie merkt in dit venster blijft misschien ook bewust langer op.';

  @override
  String get tipSleepDetailLuteal =>
      'Progesteron dat na de eisprong stijgt, verhoogt de rusttemperatuur licht, wat diepe slaap lichter kan maken — soms als een milde opvlieger, soms gewoon als minder herstellende slaap. Naarmate de menstruatie nadert, kan premenstruele spanning zich hierbij voegen. Een koele, donkere kamer, minder schermtijd voor het slapen en een vaste bedtijd helpen hier het meest.';

  @override
  String get tipSleepDetailUnknown =>
      'Er is nog niet genoeg data om de fase te bepalen, maar wisselende slaapkwaliteit gedurende de cyclus is een veelvoorkomend patroon — meestal kwetsbaarder vlak voor en tijdens de menstruatie, stabieler in de eerste helft. De betrouwbaarste basis ongeacht de fase: vaste slaap- en waaktijden, minder schermtijd voor het slapen en een koele, donkere kamer.';
}
