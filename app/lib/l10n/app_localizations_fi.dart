// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Finnish (`fi`).
class AppLocalizationsFi extends AppLocalizations {
  AppLocalizationsFi([String locale = 'fi']) : super(locale);

  @override
  String get appTitle => 'Vera';

  @override
  String get actionSkip => 'Ohita';

  @override
  String get actionContinue => 'Jatka';

  @override
  String get actionDone => 'Valmis';

  @override
  String get actionCancel => 'Peruuta';

  @override
  String get actionClear => 'Tyhjennä';

  @override
  String get actionDelete => 'Poista';

  @override
  String get actionEnable => 'Ota käyttöön';

  @override
  String get commonIDontKnow => 'En tiedä';

  @override
  String get commonYes => 'Kyllä';

  @override
  String get commonNo => 'Ei';

  @override
  String get commonNotSure => 'En ole varma';

  @override
  String get pinSetupTitle => 'Aseta PIN-koodi';

  @override
  String get pinSetupEnterPrompt =>
      'Valitse 6-numeroinen PIN-koodi, jolla lukitset sovelluksen';

  @override
  String get pinSetupConfirmPrompt => 'Vahvista syöttämällä se uudelleen';

  @override
  String get pinSetupMismatch =>
      'Koodit eivät täsmänneet — kokeillaan uudelleen';

  @override
  String get pinSetupBiometricTitle => 'Nopeampi avaus?';

  @override
  String get pinSetupBiometricBody =>
      'Voit avata lukituksen myös sormenjäljellä tai kasvoilla — PIN-koodi toimii edelleen varavaihtoehtona.';

  @override
  String get lockScreenTitle => 'Lukittu';

  @override
  String get lockScreenEnterPin => 'Syötä PIN-koodisi';

  @override
  String get lockScreenWrongPin => 'PIN-koodi ei täsmää';

  @override
  String get lockScreenUseBiometrics => 'Käytä biometristä tunnistusta';

  @override
  String get lockScreenUseFaceId => 'Käytä Face ID:tä';

  @override
  String get lockScreenUseFingerprint => 'Käytä sormenjälkeä';

  @override
  String get lockScreenForgotPin => 'Unohditko PIN-koodisi?';

  @override
  String get lockScreenForgotPinChoiceTitle => 'Miten haluat nollata sen?';

  @override
  String get lockScreenResetViaDevice => 'Vahvista tällä laitteella';

  @override
  String get lockScreenResetViaDeviceBody =>
      'Tietosi säilyvät. Riittää, että vahvistat puhelimesi omalla lukituksella — Face ID, sormenjälki tai koodi.';

  @override
  String get lockScreenResetViaDeviceReason =>
      'Vahvista asettaaksesi uuden PIN-koodin';

  @override
  String lockScreenThrottled(int seconds) {
    return 'Liian monta yritystä. Yritä uudelleen $seconds s kuluttua';
  }

  @override
  String get lockScreenEraseTitle => 'Poistetaanko kaikki tiedot?';

  @override
  String get lockScreenEraseBody =>
      'Tämä poistaa pysyvästi kaiken tältä laitteelta. Tiliä eikä palvelinvarmuuskopiota ei ole, joten tätä ei voi perua.';

  @override
  String get lockScreenEraseConfirm => 'Poista kaikki';

  @override
  String get onboardingPrivacyTitle => 'Tervetuloa';

  @override
  String get onboardingPrivacyBody =>
      'Kiertotietosi pysyvät vain tällä laitteella, salattuina. Tiliä eikä pilvisynkronointia ole — mitään kirjaamaasi ei lähetetä mihinkään. Avain on puhelimesi suojatussa laitteistossa, ja voit viedä tai poistaa kaiken milloin haluat.';

  @override
  String get onboardingLastPeriodTitle =>
      'Milloin viimeiset kuukautisesi alkoivat?';

  @override
  String get onboardingLastPeriodBody =>
      'Tämä auttaa pääsemään alkuun — voit aina korjata sen myöhemmin kalenterista.';

  @override
  String get onboardingPickDate => 'Valitse päivä';

  @override
  String get onboardingCycleLengthTitle =>
      'Kuinka pitkä kiertosi tyypillisesti on?';

  @override
  String get onboardingCycleLengthBody =>
      'Karkea luku riittää. Alamme antaa todellisen arvion, kun olemme nähneet pari kokonaista kiertoa.';

  @override
  String get onboardingPeriodLengthTitle =>
      'Kuinka monta päivää kuukautisesi yleensä kestävät?';

  @override
  String get onboardingPeriodLengthBody =>
      'Käytämme tätä täydentääksemme viimeiset kuukautisesi, jotta et aloita nollasta.';

  @override
  String get onboardingDaysUnit => 'päivää';

  @override
  String get onboardingGoalTitle => 'Mikä tuo sinut tänne?';

  @override
  String get onboardingGoalBody =>
      'Tämä auttaa vain näyttämään sinulle oikeat asiat ensin — voit muuttaa mielesi milloin tahansa asetuksissa.';

  @override
  String get goalTrackPeriod => 'Seurata kuukautisiani';

  @override
  String get goalTryingToConceive => 'Yritän tulla raskaaksi';

  @override
  String get goalPregnancyTracking => 'Seurata raskautta';

  @override
  String get onboardingRegularityTitle =>
      'Ovatko kuukautisesi yleensä säännölliset?';

  @override
  String get onboardingRegularityBody =>
      'Väärää vastausta ei ole — tämä auttaa vain tuntemaan kehoasi vähän paremmin.';

  @override
  String get onboardingCrampsTitle => 'Onko sinulla yleensä kramppeja?';

  @override
  String get onboardingCrampsBody =>
      'Huolehdimme siitä, että sellaisina päivinä on helppo kirjata, miltä sinusta tuntuu.';

  @override
  String get onboardingBirthYearTitle => 'Minä vuonna olet syntynyt?';

  @override
  String get onboardingBirthYearBody =>
      'Vain täydemmän kuvan vuoksi — tätä ei koskaan käytetä mihinkään ennusteeseen.';

  @override
  String get onboardingPmsTitle => 'Ilmeneekö yleensä jotain etukäteen?';

  @override
  String get onboardingPmsBody =>
      'Valitse niin monta kuin sopii. Tätä ei tallenneta minnekään, väärää vastausta ei ole.';

  @override
  String get onboardingNotificationTitle =>
      'Haluaisitko hienovaraisia muistutuksia?';

  @override
  String get onboardingNotificationBody =>
      'Voimme muistuttaa sinua ennen kuin kuukautisia odotetaan.';

  @override
  String get onboardingNotificationMockTitle =>
      'Kuukautisesi voivat alkaa pian';

  @override
  String get onboardingNotificationMockBody =>
      'Kirjaamiesi kiertojen perusteella';

  @override
  String get onboardingNotificationAllow => 'Ota muistutukset käyttöön';

  @override
  String get onboardingNotificationNotNow => 'Ei nyt';

  @override
  String get onboardingBuildingPlanTitle => 'Valmistellaan asioita sinulle';

  @override
  String get onboardingBuildingPlanStep1 =>
      'Suojataan tietosi tällä laitteella';

  @override
  String get onboardingBuildingPlanStep2 => 'Tallennetaan asetuksesi';

  @override
  String get onboardingBuildingPlanStep3 => 'Valmistellaan kalenteriasi';

  @override
  String get onboardingBuildingPlanDone => 'Kaikki valmista';

  @override
  String get navHome => 'Etusivu';

  @override
  String get navCalendar => 'Kalenteri';

  @override
  String get navInsights => 'Havainnot';

  @override
  String get navSettings => 'Asetukset';

  @override
  String get navReminders => 'Muistutukset';

  @override
  String get navProfile => 'Profiili';

  @override
  String get navTrack => 'Kirjaa';

  @override
  String homeCycleDayLabel(int day) {
    return 'Päivä $day';
  }

  @override
  String get homeNoCycleYet => 'Kuukautisia ei ole vielä kirjattu';

  @override
  String get homePhaseMenstrual => 'Kuukautiset';

  @override
  String get homePhaseFollicular => 'Follikkelivaihe';

  @override
  String get homePhaseFertileWindow => 'Arvioitu hedelmällinen ikkuna';

  @override
  String get homePhaseLuteal => 'Luteaalivaihe';

  @override
  String get homePhaseUnknown => 'Tuoretta tietoa ei ole tarpeeksi';

  @override
  String get homePredictionInsufficientTitle => 'Tietoa ei ole vielä tarpeeksi';

  @override
  String get homePredictionInsufficientBody =>
      'Kirjaa seuraavat kuukautisesi, niin alamme arvioida.';

  @override
  String homePredictionRangeLabel(String start, String end) {
    return '$start – $end';
  }

  @override
  String get homeConfidenceHigh => 'Korkea luottamus';

  @override
  String get homeConfidenceMedium => 'Keskitason luottamus';

  @override
  String get homeConfidenceLow => 'Matala luottamus';

  @override
  String get homeIrregularNote =>
      'Kiertosi pituus on vaihdellut viime aikoina tavallista enemmän. Jos se on sinulle uutta, siitä voi olla syytä mainita tarkastuskäynnillä.';

  @override
  String get homeFertileWindowDisclaimer =>
      'Perustuu tyypilliseen kierron ajoitukseen — ei ole ehkäisymenetelmä.';

  @override
  String get homePeriodStartedButton => 'Kuukautiset alkoivat tänään';

  @override
  String get homePeriodStartedSnackbar =>
      'Kirjattu — kuukautiset alkoivat tänään';

  @override
  String get actionUndo => 'Kumoa';

  @override
  String get comingSoon => 'Tulossa pian';

  @override
  String get dayLogFlowLabel => 'Vuoto';

  @override
  String get flowSpotting => 'Tiputteluvuoto';

  @override
  String get flowLight => 'Niukka';

  @override
  String get flowMedium => 'Kohtalainen';

  @override
  String get flowHeavy => 'Runsas';

  @override
  String get flowNone => 'Ei vuotoa';

  @override
  String get dayLogSymptomsLabel => 'Oireet';

  @override
  String get symptomCramps => 'Kramppeja';

  @override
  String get symptomHeadache => 'Päänsärkyä';

  @override
  String get symptomBloating => 'Turvotusta';

  @override
  String get symptomBreastTenderness => 'Rintojen arkuutta';

  @override
  String get symptomAcne => 'Aknea';

  @override
  String get symptomFatigue => 'Väsymystä';

  @override
  String get symptomNausea => 'Pahoinvointia';

  @override
  String get symptomBackPain => 'Selkäkipua';

  @override
  String get symptomAppetiteChange => 'Ruokahalun muutosta';

  @override
  String get symptomSleepTrouble => 'Univaikeuksia';

  @override
  String get symptomPelvicPain => 'Lantion kipua';

  @override
  String get symptomDizziness => 'Huimausta';

  @override
  String get symptomMigraine => 'Migreeni';

  @override
  String get symptomHighFever => 'Korkea kuume';

  @override
  String get symptomNeckPain => 'Niskakipu';

  @override
  String get symptomShoulderPain => 'Olkapääkipu';

  @override
  String get symptomLimbPain => 'Raajakipu';

  @override
  String get symptomMuscleAche => 'Lihaskipu';

  @override
  String get symptomChills => 'Vilunväristykset';

  @override
  String get symptomNightSweats => 'Yöhikoilu';

  @override
  String get symptomHotFlashes => 'Kuumat aallot';

  @override
  String get symptomWeightGain => 'Painonnousu';

  @override
  String get symptomConstipation => 'Ummetus';

  @override
  String get symptomDiarrhea => 'Ripuli';

  @override
  String get symptomIndigestion => 'Ruoansulatushäiriö';

  @override
  String get symptomGasPain => 'Ilmavaivat';

  @override
  String get symptomFeelingUnwell => 'Huonovointisuus';

  @override
  String get symptomItching => 'Kutina';

  @override
  String get symptomTroubleFocusing => 'Keskittymisvaikeudet';

  @override
  String get symptomForgetfulness => 'Unohtelu';

  @override
  String get symptomGroupHead => 'Pää';

  @override
  String get symptomGroupBody => 'Keho';

  @override
  String get symptomGroupAbdomen => 'Vatsa';

  @override
  String get symptomGroupGeneral => 'Yleinen';

  @override
  String get symptomGroupCognitive => 'Kognitiivinen';

  @override
  String get dayLogMoodLabel => 'Mieliala';

  @override
  String get moodCalm => 'Rauhallinen';

  @override
  String get moodAnxious => 'Ahdistunut';

  @override
  String get moodIrritable => 'Ärtynyt';

  @override
  String get moodLow => 'Alavireinen';

  @override
  String get moodEnergetic => 'Energinen';

  @override
  String get moodHappy => 'Iloinen';

  @override
  String get moodContent => 'Tyytyväinen';

  @override
  String get moodSad => 'Surullinen';

  @override
  String get moodDepressed => 'Masentunut';

  @override
  String get moodEmotional => 'Herkkä';

  @override
  String get moodExcited => 'Innoissaan';

  @override
  String get moodHopeful => 'Toiveikas';

  @override
  String get moodProud => 'Ylpeä';

  @override
  String get moodDisappointed => 'Pettynyt';

  @override
  String get moodConfident => 'Itsevarma';

  @override
  String get moodSurprised => 'Yllättynyt';

  @override
  String get moodIndifferent => 'Välinpitämätön';

  @override
  String get moodPeaceful => 'Rauhallinen';

  @override
  String get moodInLove => 'Rakastunut';

  @override
  String get moodShy => 'Ujo';

  @override
  String get moodPlayful => 'Leikkisä';

  @override
  String get moodExhausted => 'Uupunut';

  @override
  String get moodLonely => 'Yksinäinen';

  @override
  String get moodOverwhelmed => 'Ylikuormittunut';

  @override
  String get moodGrateful => 'Kiitollinen';

  @override
  String get moodNostalgic => 'Nostalginen';

  @override
  String get dayLogNoteLabel => 'Muistiinpano';

  @override
  String get dayLogNoteHint =>
      'Mitä tahansa, minkä haluat muistaa tästä päivästä';

  @override
  String get dayLogOptionalTrackersLabel => 'Valinnaiset seurannat';

  @override
  String get dayLogSexualActivityLabel => 'Seksuaalinen aktiivisuus';

  @override
  String get sexLifeNone => 'Ei mitään';

  @override
  String get sexLifeUnprotected => 'Suojaamaton seksi';

  @override
  String get sexLifeProtected => 'Suojattu seksi';

  @override
  String get sexLifeMasturbation => 'Itsetyydytys';

  @override
  String get sexLifeNoOrgasm => 'Ei orgasmia';

  @override
  String get sexLifeOrgasm => 'Orgasmi';

  @override
  String get sexLifeHighDesire => 'Korkea halu';

  @override
  String get dayLogBbtLabel => 'Peruslämpö';

  @override
  String get dayLogMucusLabel => 'Kohdunkaulan lima';

  @override
  String get mucusDry => 'Kuiva';

  @override
  String get mucusSticky => 'Tahmea';

  @override
  String get mucusCreamy => 'Kermainen';

  @override
  String get mucusWatery => 'Vetinen';

  @override
  String get mucusEggWhite => 'Munanvalkuaismainen';

  @override
  String get dayLogSavedIndicator => 'Tallennettu';

  @override
  String get homeOpenTodayLog => 'Lisää tämän päivän tiedot';

  @override
  String get calendarLegendActual => 'Kirjatut kuukautiset';

  @override
  String get calendarLegendPredicted => 'Ennustettu ajanjakso';

  @override
  String get calendarLegendFertile => 'Arvioitu hedelmällinen ikkuna';

  @override
  String get calendarLegendOvulation => 'Arvioitu ovulaatio';

  @override
  String get dayDetailFertileTitle => 'Arvioidussa hedelmällisessä ikkunassasi';

  @override
  String get dayDetailOvulationTitle => 'Arvioitu ovulaatiopäivä';

  @override
  String get dayDetailOvulationBody =>
      'Raskaus on tyypillisen ajoituksen perusteella usein todennäköisempi tämän päivän tienoilla — tämä on arvio, ei takuu.';

  @override
  String get insightsCyclesLoggedLabel => 'Kirjattuja kiertoja';

  @override
  String get insightsAveragePeriodLengthLabel =>
      'Kuukautisten keskimääräinen kesto';

  @override
  String get insightsAverageCycleLengthLabel => 'Kierron keskimääräinen pituus';

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
      other: 'Vaihtelee noin $daysString päivän verran',
      one: 'Vaihtelee noin $daysString päivän verran',
    );
    return '$_temp0';
  }

  @override
  String get insightsNotEnoughDataTitle => 'Tietoa ei ole vielä tarpeeksi';

  @override
  String get insightsNotEnoughDataBody =>
      'Kirjaa pari kokonaista kiertoa, niin keskiarvosi näkyvät täällä.';

  @override
  String get insightsSymptomFrequencyTitle => 'Oireet kierron päivän mukaan';

  @override
  String get insightsNoSymptomsLogged => 'Oireita ei ole vielä kirjattu';

  @override
  String get settingsLanguageLabel => 'Kieli';

  @override
  String get settingsLanguageSystem => 'Järjestelmän kieli';

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
  String get tourSkip => 'Ohita';

  @override
  String get tourNext => 'Seuraava';

  @override
  String get tourStart => 'Aloitetaan';

  @override
  String get tourHomeTitle => 'Koti';

  @override
  String get tourHomeBody =>
      'Näe yhdellä silmäyksellä, missä olet tänään — kiertosi päivä, kuinka kauan arvioituun ikkunaasi on ja kumppanisi ovat aina täällä.';

  @override
  String get tourCalendarTitle => 'Kalenteri';

  @override
  String get tourCalendarBody =>
      'Näe menneet ja tulevat kiertosi kalenterissa. Napauta mitä tahansa päivää avataksesi sen merkinnän.';

  @override
  String get tourTrackTitle => 'Kirjaa';

  @override
  String get tourTrackBody =>
      'Keskellä oleva +-painike avaa päivän merkinnän mistä tahansa — vuoto, oireet, mieliala ja muuta.';

  @override
  String get tourRemindersTitle => 'Muistutukset';

  @override
  String get tourRemindersBody =>
      'Aseta muistutuksia tulevasta kuukautisestasi, lääkkeistä tai veden juomisesta — kaikki pysyy puhelimessasi eikä lähde minnekään.';

  @override
  String get tourProfileTitle => 'Profiili';

  @override
  String get tourProfileBody =>
      'Löydä täältä oivalluksesi, kaikki mitä seuraat, ja asetuksesi.';

  @override
  String get settingsWeekStartLabel => 'Viikko alkaa';

  @override
  String get settingsWeekStartMonday => 'Maanantai';

  @override
  String get settingsWeekStartSunday => 'Sunnuntai';

  @override
  String get settingsTemperatureUnitLabel => 'Lämpötilayksikkö';

  @override
  String get settingsTemperatureCelsius => 'Celsius';

  @override
  String get settingsTemperatureFahrenheit => 'Fahrenheit';

  @override
  String get settingsRemindersLabel => 'Muistuta minua ennen kuukautisia';

  @override
  String get remindersScreenTitle => 'Muistutukset';

  @override
  String get reminderDetailNotification => 'Ilmoitus';

  @override
  String get reminderDetailAlert => 'Hälytys';

  @override
  String get reminderDetailAlertToday => 'Samana päivänä';

  @override
  String get reminderDetailTime => 'Aika';

  @override
  String get reminderDetailMessage => 'Viesti';

  @override
  String get reminderDetailMessageEditTitle => 'Muokkaa viestiä';

  @override
  String get reminderDetailMessageHint => 'Kirjoita oma viestisi';

  @override
  String reminderDetailAlertDaysBefore(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count päivää aiemmin',
      one: '$count päivä aiemmin',
    );
    return '$_temp0';
  }

  @override
  String optionsShowMore(int count) {
    return '+$count lisää';
  }

  @override
  String get optionsShowLess => 'Näytä vähemmän';

  @override
  String get trackerHistoryEntry => 'Historia';

  @override
  String get actionSend => 'Lähetä';

  @override
  String get actionRemove => 'Poista';

  @override
  String get feedbackEntry => 'Palaute';

  @override
  String get cloudBackupEntry => 'Varmuuskopioi tilillä';

  @override
  String get cloudBackupTitle => 'Varmuuskopioi tilillä';

  @override
  String get cloudBackupNotConfiguredTitle =>
      'Ei vielä käytettävissä tässä versiossa';

  @override
  String get cloudBackupNotConfiguredBody =>
      'Pilvivarmuuskopiointi tarvitsee tilipalvelun, jota ei ole vielä otettu käyttöön tässä versiossa. Mitään tässä ei voi käyttää ennen sitä.';

  @override
  String get cloudBackupIntro1Title => 'Älä koskaan menetä historiaasi';

  @override
  String get cloudBackupIntro1Body =>
      'Syklihistoriasi pysyy turvassa, vaikka menettäisit puhelimesi tai vaihtaisit uuteen.';

  @override
  String get cloudBackupIntro2Title => 'Vain sinä voit avata sen';

  @override
  String get cloudBackupIntro2Body =>
      'Varmuuskopiosi salataan salasanalla ennen kuin se lähtee puhelimestasi — emme voi lukea sitä, eikä kukaan muukaan.';

  @override
  String get cloudBackupIntro3Title => 'Palauta sekunneissa';

  @override
  String get cloudBackupIntro3Body =>
      'Kirjaudu sisään uudella laitteella ja tuo historiasi takaisin samalla salasanalla.';

  @override
  String get cloudBackupSignedInTitle => 'Kirjautunut sisään';

  @override
  String get cloudBackupUploadButton => 'Varmuuskopioi nyt';

  @override
  String get cloudBackupDownloadButton => 'Palauta pilvestä';

  @override
  String get cloudBackupUploadSuccess => 'Varmuuskopioitu tilillesi';

  @override
  String get cloudBackupNoBackupFound =>
      'Tälle tilille ei löytynyt vielä pilvivarmuuskopiota.';

  @override
  String get partnerModeEntry => 'Kumppanitila';

  @override
  String get partnerModeTitle => 'Kumppanitila';

  @override
  String get partnerModeNotConfiguredTitle =>
      'Ei vielä käytettävissä tässä versiossa';

  @override
  String get partnerModeNotConfiguredBody =>
      'Kumppanitila tarvitsee tilipalvelun, jota ei ole vielä otettu käyttöön tässä versiossa. Mitään tässä ei voi käyttää ennen sitä.';

  @override
  String get partnerModeHeroTitle => 'Jaa vähän, omilla ehdoillasi';

  @override
  String get partnerModeHeroBody =>
      'Yhdistä kumppaniisi ja jaa vain se, minkä otat käyttöön alla — ei koskaan koko historiaasi, ei koskaan automaattisesti.';

  @override
  String get partnerModeSignInGoogle => 'Jatka Googlella';

  @override
  String get partnerModeSignInApple => 'Jatka Applella';

  @override
  String get partnerModeFaqTitle => 'Ennen kirjautumista';

  @override
  String get partnerModeFaq1Q => 'Mitä kumppanini oikeasti näkee?';

  @override
  String get partnerModeFaq1A =>
      'Vain ne kentät, jotka otat käyttöön Kumppanitilassa, ja vain senhetkisen tilanteesi — ei koskaan tallennettua historiaasi, eikä mitään mitä et ole nimenomaisesti jakanut.';

  @override
  String get partnerModeFaq2Q => 'Voinko ottaa tämän pois käytöstä myöhemmin?';

  @override
  String get partnerModeFaq2A =>
      'Kyllä. Parituksen purku lopettaa jakamisen heti teiltä molemmilta, ja voit kytkeä minkä tahansa yksittäisen kytkimen pois milloin tahansa purkamatta paritusta.';

  @override
  String get partnerModeFaq3Q => 'Tarvitseeko kumppanini tätä sovellusta?';

  @override
  String get partnerModeFaq3A =>
      'Kyllä — hän kirjautuu samalla tavalla ja parittuu koodilla, jonka lähetät hänelle.';

  @override
  String get partnerModeNotPairedTitle => 'Ei vielä parituksia';

  @override
  String get partnerModeNotPairedBody =>
      'Kutsu kumppanisi kertakäyttöisellä koodilla tai syötä koodi, jonka hän lähetti.';

  @override
  String get partnerModeInviteButton => 'Kutsu kumppanini';

  @override
  String get partnerModeEnterCodeButton => 'Syötä koodi';

  @override
  String get partnerModeSignOut => 'Kirjaudu ulos';

  @override
  String get partnerModePairedTitle => 'Paritettu';

  @override
  String get partnerModePairedBody =>
      'Sinä ja kumppanisi olette yhteydessä. Jakaminen koskee edelleen vain sitä, minkä otat käyttöön alla.';

  @override
  String get partnerModeShareSectionTitle => 'Mitä jaat';

  @override
  String get partnerModeShareCyclePhase => 'Syklin vaihe ja päivä';

  @override
  String get partnerModeShareMood => 'Tämän päivän mieliala';

  @override
  String get partnerModeShareSymptoms => 'Tämän päivän oireet';

  @override
  String get partnerModeShareHighDesire => 'Halu läheisyyteen tänään';

  @override
  String get partnerModeShareNow => 'Jaa nyt';

  @override
  String get partnerModeShareSuccess => 'Jaettu kumppanisi kanssa';

  @override
  String get partnerModeUnpair => 'Pura paritus';

  @override
  String get partnerModeUnpairConfirmTitle =>
      'Puretaanko paritus kumppanisi kanssa?';

  @override
  String get partnerModeUnpairConfirmBody =>
      'Tämä lopettaa jakamisen heti teiltä molemmilta. Voitte parittua uudelleen myöhemmin uudella koodilla.';

  @override
  String get partnerModePartnerSnapshotEmpty =>
      'Kumppanisi ei ole vielä jakanut mitään.';

  @override
  String get partnerModeErrorNotConfigured =>
      'Kumppanitilaa ei ole vielä otettu käyttöön tässä versiossa.';

  @override
  String get partnerModeErrorCodeNotFound =>
      'Koodia ei löytynyt. Tarkista se ja yritä uudelleen.';

  @override
  String get partnerModeErrorCodeExpired => 'Koodi on vanhentunut. Pyydä uusi.';

  @override
  String get partnerModeErrorCodeIsOwn =>
      'Tämä on oma koodisi — pyydä kumppaniltasi hänen omansa.';

  @override
  String get partnerModeErrorNotSignedIn => 'Kirjaudu ensin sisään.';

  @override
  String get partnerModeErrorUnknown => 'Jokin meni pieleen. Yritä uudelleen.';

  @override
  String get partnerModeInviteTitle => 'Kutsu kumppanisi';

  @override
  String get partnerModeInviteBody =>
      'Lähetä tämä koodi kumppanillesi. Hän syöttää sen omaan sovellukseensa paritutuakseen kanssasi.';

  @override
  String get partnerModeInviteExpiry => 'Voimassa 7 päivää';

  @override
  String get partnerModeInviteShare => 'Jaa koodi';

  @override
  String partnerModeInviteMessage(String code) {
    return 'Tässä Vera-parituskoodini: $code';
  }

  @override
  String get partnerModeEnterTitle => 'Syötä koodi';

  @override
  String get partnerModeEnterBody =>
      'Syötä koodi, jonka kumppanisi lähetti sinulle.';

  @override
  String get partnerModeEnterHint => '6-merkkinen koodi';

  @override
  String get partnerModeEnterSubmit => 'Parita';

  @override
  String get homeInvitePartnerTitle => 'Jaa kumppanisi kanssa';

  @override
  String get homeInvitePartnerBody =>
      'Parittukaa ja jaa vain se, minkä valitset — historiasi pysyy sinun omanasi.';

  @override
  String get homeInvitePartnerCta => 'Ota Kumppanitila käyttöön';

  @override
  String get feedbackTitle => 'Mikä ei miellyttänyt sinua?';

  @override
  String get feedbackSubtitle => 'Valitse aihe ja kirjoita lisää halutessasi.';

  @override
  String get feedbackCategoryPredictions => 'Ennusteet';

  @override
  String get feedbackCategoryBackup => 'Varmuuskopiointi';

  @override
  String get feedbackCategorySubscription => 'Tilaus';

  @override
  String get feedbackCategoryAds => 'Mainokset';

  @override
  String get feedbackCategoryDesign => 'Ulkoasu';

  @override
  String get feedbackCategoryTranslation => 'Käännös';

  @override
  String get feedbackCategoryOther => 'Muu';

  @override
  String get feedbackDescriptionLabel => 'Kerro lisää (valinnainen)';

  @override
  String get feedbackDescriptionHint =>
      'Mitä tapahtui? Kun napautat Lähetä, valitset itse mistä jaat sen — sähköpostisovelluksesi tai muualta.';

  @override
  String get feedbackAttachPhoto => 'Lisää kuva';

  @override
  String get feedbackPhotoAttached => 'Kuva liitetty';

  @override
  String get remindersGroupCycle => 'Kuukautiset ja hedelmällisyys';

  @override
  String get remindersGroupMedication => 'Lääkkeet';

  @override
  String get remindersGroupLifestyle => 'Elämäntavat';

  @override
  String get remindersGroupAppointment => 'Lääkäriajat';

  @override
  String get settingsRemindersPeriodEndLabel =>
      'Kysy kuulumisia, kun kuukautisten pitäisi olla loppumassa';

  @override
  String get settingsRemindersMedicationLabel => 'Lääkemuistutus';

  @override
  String get settingsRemindersWaterLabel => 'Vesimuistutus';

  @override
  String get settingsRemindersAppointmentLabel => 'Muistutus lääkäriajasta';

  @override
  String get settingsRemindersAppointmentSet => 'Aseta päivä ja aika';

  @override
  String get settingsRemindersAppointmentClear => 'Tyhjennä';

  @override
  String get settingsOptionalTrackersHeading => 'Valinnaiset seurannat';

  @override
  String get settingsOptionalTrackersBody =>
      'Pois päältä oletuksena. Yhden käyttöönotto lisää sen päiväkirjausnäkymään.';

  @override
  String get settingsSexualActivityToggle => 'Seksuaalinen aktiivisuus';

  @override
  String get settingsBbtToggle => 'Peruslämpö';

  @override
  String get settingsMucusToggle => 'Kohdunkaulan lima';

  @override
  String get settingsBreastExamToggle => 'Rintojen omatarkkailu';

  @override
  String get settingsCervixToggle => 'Kohdunkaulan asento ja kiinteys';

  @override
  String get settingsPrivacyEntry => 'Yksityisyys';

  @override
  String get settingsRateEntry => 'Arvostele meidät';

  @override
  String get rateAppTitle => 'Toimiiko Vera sinulle?';

  @override
  String get rateAppBody =>
      'Jos toimii, muutaman sekunnin arvostelu kaupassa auttaa muita samanlaista etsiviä löytämään sen.';

  @override
  String get rateAppCta => 'Arvostele Vera';

  @override
  String get rateAppDismiss => 'Ei nyt';

  @override
  String get settingsDeleteAllData => 'Poista kaikki tiedot';

  @override
  String get privacyScreenTitle => 'Yksityisyys';

  @override
  String get privacyScreenIntro =>
      'Tässä on selkokielisesti täsmälleen se, mitä tiedoillesi tapahtuu.';

  @override
  String get privacyScreenStorageTitle => 'Salattu tällä laitteella';

  @override
  String get privacyScreenNoNetworkTitle => 'Ei palvelinta, ei tiliä';

  @override
  String get privacyScreenNoThirdPartyTitle => 'Ei seurantaa';

  @override
  String get privacyScreenExportTitle => 'Vain sinä voit viedä tiedot';

  @override
  String get privacyScreenDeleteTitle => 'Poisto on lopullinen';

  @override
  String get privacyScreenStorage =>
      'Kaikki kirjaamasi salataan ja tallennetaan vain tälle laitteelle, yhteen tiedostoon. Salausavain on puhelimesi suojatussa laitteistossa — Keychain iOS:ssä, Keystore Androidissa — ei itse tiedostossa.';

  @override
  String get privacyScreenNoNetwork =>
      'Tällä sovelluksella ei ole omaa palvelinta eikä tilijärjestelmää — kirjauksiasi ei koskaan lähetetä. Ilmaisversio sisältää Googlen mainoksia, jotka ottavat yhteyden internetiin; ne eivät koskaan saa mitään kirjaamaasi.';

  @override
  String get privacyScreenNoThirdParty =>
      'Analytiikkaa, kaatumisraportointia tai seuranta-SDK:ta ei ole. Ainoa kolmannen osapuolen komponentti on Googlen mainos-SDK ilmaisversiossa — Premium poistaa sen kokonaan.';

  @override
  String get privacyScreenExport =>
      'Ainoa tapa, jolla tietosi koskaan lähtevät tältä laitteelta, on että viet ne itse, ja tuo vienti on salattu salasanalla, jonka vain sinä tiedät.';

  @override
  String get privacyScreenDelete =>
      'Tietojesi poisto on todellinen ja välitön. Tiliä eikä varmuuskopiota ei ole meidän päässämme — kun se on poissa, se on poissa.';

  @override
  String get adPlaceholderLabel => 'Mainostila';

  @override
  String get adPlaceholderUpgradeCta => 'Siirry mainoksettomaan Premiumiin';

  @override
  String get reminderNotificationTitle => 'Kuukautisesi voivat alkaa pian';

  @override
  String get reminderNotificationBody =>
      'Kirjaamiesi kiertojen perusteella arvioitu ajanjaksosi lähestyy.';

  @override
  String get reminderPeriodEndTitle => 'Kuukautisesi voivat olla päättymässä';

  @override
  String get reminderPeriodEndBody =>
      'Jos ne jatkuvat vielä, se on täysin normaalia — tämä on vain hienovarainen kysely kuulumisista.';

  @override
  String get reminderMedicationTitle => 'Lääkemuistutus';

  @override
  String get reminderMedicationBody => 'Aika ottaa lääkkeesi.';

  @override
  String get reminderWaterTitle => 'Muista juoda';

  @override
  String get reminderWaterBody => 'Pieni vesimuistutus.';

  @override
  String get reminderAppointmentTitle => 'Tuleva lääkäriaika';

  @override
  String get reminderAppointmentBody => 'Sinulla on tuleva lääkäriaika.';

  @override
  String get settingsExportEntry => 'Vienti ja varmuuskopiointi';

  @override
  String get exportBackupHeading => 'Salattu varmuuskopio';

  @override
  String get exportBackupBody =>
      'Tallenna salattu kopio historiastasi uudelle laitteelle siirtämistä varten. Tarvitset salasanan uudelleen palauttaaksesi sen — muuta tapaa sen palauttamiseen ei ole.';

  @override
  String get exportCreateBackupButton => 'Luo varmuuskopio';

  @override
  String get exportRestoreBackupButton => 'Palauta varmuuskopiosta';

  @override
  String get exportPasswordLabel => 'Salasana';

  @override
  String get exportPasswordConfirmLabel => 'Vahvista salasana';

  @override
  String get exportPasswordMismatch => 'Salasanat eivät täsmää';

  @override
  String get exportPasswordTooShort => 'Käytä vähintään 8 merkkiä';

  @override
  String get exportRestoreConfirmTitle =>
      'Korvataanko kaikki tämän laitteen tiedot?';

  @override
  String get exportRestoreConfirmBody =>
      'Varmuuskopion palautus korvaa kaiken, mitä tälle laitteelle on tällä hetkellä kirjattu. Tätä ei voi perua.';

  @override
  String get exportRestoreConfirmAction => 'Palauta';

  @override
  String get exportWrongPassword => 'Salasana ei täsmää tähän varmuuskopioon';

  @override
  String get exportInvalidFile => 'Tuo tiedosto ei näytä Veran varmuuskopiolta';

  @override
  String get exportBackupCreated => 'Varmuuskopio on valmis jaettavaksi';

  @override
  String get exportRestoreSuccess => 'Varmuuskopio palautettu';

  @override
  String get exportDoctorReportHeading => 'Lääkäriraportti';

  @override
  String get exportDoctorReportBody =>
      'Yhteenveto, jonka voit jakaa hoitavalle ammattilaiselle.';

  @override
  String get exportIncludeNotesToggle =>
      'Sisällytä henkilökohtaiset muistiinpanot';

  @override
  String get exportShareCsvButton => 'Jaa CSV-tiedostona';

  @override
  String get exportPrintPdfButton => 'Tulosta / tallenna PDF-tiedostona';

  @override
  String get doctorReportDisclaimer =>
      'Vera on luonut tämän käyttäjän syöttämistä tiedoista. Ei ole lääketieteellinen diagnoosi.';

  @override
  String get doctorReportGeneratedOn => 'Luotu';

  @override
  String get doctorReportSummaryHeading => 'Yhteenveto';

  @override
  String get doctorReportDailyLogHeading => 'Päivittäinen kirjaus';

  @override
  String get doctorReportColumnDate => 'Päivä';

  @override
  String get doctorReportTimelineHeading => 'Kierron aikajana';

  @override
  String get doctorReportCycleLabel => 'Kierto';

  @override
  String get doctorReportTimelineLegendPeriod => 'Kuukautiset';

  @override
  String get doctorReportTimelineLegendCycle => 'Kierron loppuosa';

  @override
  String get doctorReportTimelineOngoing => 'Kesken';

  @override
  String get dailyInsightLabel => 'Tiesitkö?';

  @override
  String get insightMenstrual1 =>
      'Kohdun limakalvosi irtoaa juuri nyt — useimmat kuukautiset kestävät 3–7 päivää, ja se on täysin normaalia.';

  @override
  String get insightMenstrual2 =>
      'Rautapitoiset ruoat, kuten lehtivihannekset ja linssit, voivat auttaa korvaamaan sitä, mitä keho menettää tällä viikolla.';

  @override
  String get insightFollicular1 =>
      'Estrogeeni nousee, ja moni huomaa enemmän energiaa ja parempaa keskittymistä suunnilleen tästä eteenpäin.';

  @override
  String get insightFollicular2 =>
      'Kehosi valmistelee munasolua irtoamista varten — tämä vaihe voi kestää viikosta muutamaan viikkoon.';

  @override
  String get insightFertile1 =>
      'Tämä on arvioitu hedelmällinen ikkunasi — ovulaation ympärillä olevat päivät, jolloin raskaus on tyypillisen ajoituksen perusteella todennäköisimmillään.';

  @override
  String get insightFertile2 =>
      'Jotkut huomaavat ovulaation aikoihin pienen nousun peruslämmössä tai muutoksia kohdunkaulan limassa.';

  @override
  String get insightLuteal1 =>
      'Progesteroni nousee ovulaation jälkeen — usein juuri silloin ilmaantuvat PMS-oireet, kuten mielialan muutokset tai turvotus.';

  @override
  String get insightLuteal2 =>
      'Jos raskaus ei ole kiinnittynyt, hormonitasot laskevat tämän vaiheen loppupuolella ja käynnistävät seuraavat kuukautisesi.';

  @override
  String get insightUnknown1 =>
      'Kierron pituudet vaihtelevat paljon ihmisestä toiseen — 21–35 päivää pidetään tyypillisenä.';

  @override
  String get insightsPhaseTipsTitle => 'Voi tuntua hyvältä tässä vaiheessa';

  @override
  String get tipFitnessLabel => 'Liikunta';

  @override
  String get tipNutritionLabel => 'Ravitsemus';

  @override
  String get tipFitnessMenstrual =>
      'Kevyt liikunta — kävely, venyttely tai palauttava jooga — voi tuntua juuri nyt paremmalta kuin rankat treenit.';

  @override
  String get tipFitnessFollicular =>
      'Energia nousee usein tässä vaiheessa — hyvä hetki kokeilla uutta treeniä tai puskea vähän kovempaa.';

  @override
  String get tipFitnessFertile =>
      'Moni tuntee olonsa energisimmillään täällä — hyvä vaihe kovatehoisemmalle harjoittelulle, jos se kiinnostaa sinua.';

  @override
  String get tipFitnessLuteal =>
      'Jos energia laskee tämän vaiheen loppupuolella, kevyempi voimaharjoittelu tai uinti voi tuntua kestävämmältä.';

  @override
  String get tipFitnessUnknown =>
      'Mikä tahansa liike tuntuu tänään hyvältä, on hyvä valinta — yhtä ”oikeaa” rutiinia joka päivälle ei ole.';

  @override
  String get tipNutritionMenstrual =>
      'Rautapitoiset ruoat, kuten lehtivihannekset, linssit ja punainen liha, voivat auttaa korvaamaan sitä, mitä keho menettää tällä viikolla.';

  @override
  String get tipNutritionFollicular =>
      'Kevyemmät, tuoreet ateriat maistuvat usein hyvin energian noustessa — mutta yhtä ”oikeaa” tapaa syödä tässä vaiheessa ei ole.';

  @override
  String get tipNutritionFertile =>
      'Riittävä nesteytys ja tasapainoiset ateriat tukevat energiaa tämän aktiivisemmalta tuntuvan vaiheen läpi.';

  @override
  String get tipNutritionLuteal =>
      'Mieliteot voivat muuttua täällä — hitaat hiilihydraatit ja magnesiumpitoiset ruoat, kuten pähkinät ja tumma suklaa, ovat yleisiä suosikkeja.';

  @override
  String get tipNutritionUnknown =>
      'Tasapainoiset, säännölliset ateriat ovat vankka lähtökohta aina, kun vaiheesi ei ole vielä selvä.';

  @override
  String get predictionSettingsEntry => 'Ennusteasetukset';

  @override
  String get predictionSettingsIntro =>
      'Nämä ovat oletuksia, jotka näytetään avoimesti. Kun olet kirjannut 2 kokonaista kiertoa, todellinen ennusteesi etusivulla lasketaan omista tiedoistasi — näitä lukuja ei enää käytetä siihen.';

  @override
  String get predictionSettingsPeriodLengthLabel =>
      'Kuukautisten tyypillinen kesto';

  @override
  String get predictionSettingsCycleLengthLabel => 'Kierron tyypillinen pituus';

  @override
  String get predictionSettingsCycleLengthHint =>
      'Käytetään etusivun renkaan mitoitukseen, kunnes todellista tietoa on.';

  @override
  String get predictionSettingsLutealLabel => 'Luteaalivaiheen pituus';

  @override
  String get predictionSettingsLutealHint =>
      'Tyypillinen päivien määrä ovulaation ja seuraavien kuukautisten välillä. Käytetään arvioidun hedelmällisen ikkunan sijoittamiseen — tätä käytetään edelleen myös sen jälkeen, kun todelliset ennusteet alkavat.';

  @override
  String get dayLogEnergyLabel => 'Energia';

  @override
  String get energyLevelLow => 'Matala';

  @override
  String get energyLevelMedium => 'Keskitaso';

  @override
  String get energyLevelHigh => 'Korkea';

  @override
  String get energyLevelEnergetic => 'Energinen';

  @override
  String get dayLogSkinHairLabel => 'Iho ja hiukset';

  @override
  String get skinHealthyGlow => 'Terve hehku';

  @override
  String get skinRedness => 'Punoitusta';

  @override
  String get skinDryness => 'Kuivuutta';

  @override
  String get skinOiliness => 'Rasvoittumista';

  @override
  String get hairGoodDay => 'Hyvä hiuspäivä';

  @override
  String get hairBadDay => 'Huono hiuspäivä';

  @override
  String get hairLoss => 'Hiustenlähtöä';

  @override
  String get scalpOily => 'Rasvoittuva päänahka';

  @override
  String get dayLogBreastExamLabel => 'Rintojen omatarkkailu';

  @override
  String get breastExamAllNormal => 'Ei mitään poikkeavaa';

  @override
  String get breastExamLump => 'Kyhmy';

  @override
  String get breastExamIndentation => 'Kuoppa';

  @override
  String get breastExamRedness => 'Punoitus';

  @override
  String get breastExamCrackedNipple => 'Haavautunut nänni';

  @override
  String get breastExamDischarge => 'Erite';

  @override
  String get cervixPositionLabel => 'Kohdunkaulan asento';

  @override
  String get cervixPositionLow => 'Matala';

  @override
  String get cervixPositionMedium => 'Keskitaso';

  @override
  String get cervixPositionHigh => 'Korkea';

  @override
  String get cervixOpeningLabel => 'Kohdunkaulan aukko';

  @override
  String get cervixOpeningClosed => 'Suljettu';

  @override
  String get cervixOpeningMedium => 'Keskitaso';

  @override
  String get cervixOpeningOpen => 'Avoin';

  @override
  String get cervixFirmnessLabel => 'Kohdunkaulan kiinteys';

  @override
  String get cervixFirmnessSoft => 'Pehmeä';

  @override
  String get cervixFirmnessMedium => 'Keskitaso';

  @override
  String get cervixFirmnessFirm => 'Kiinteä';

  @override
  String get dayLogWaterLabel => 'Vesi';

  @override
  String get dayLogSleepLabel => 'Uni';

  @override
  String get dayLogWeightLabel => 'Paino';

  @override
  String get dayLogMedicationsLabel => 'Lääkitys';

  @override
  String get dayLogAddMedication => 'Lisää lääke';

  @override
  String get dayLogMedicationNameHint => 'Lääkkeen nimi';

  @override
  String get dayLogBirthControlLabel => 'Ehkäisy';

  @override
  String get dayLogOtherMedicationsLabel => 'Muut lääkkeet';

  @override
  String get birthControlPillTaken => 'Pilleri otettu';

  @override
  String get birthControlPillLate => 'Pilleri otettu myöhässä';

  @override
  String get birthControlPillMissed => 'Pilleri unohtui';

  @override
  String get birthControlPatch => 'Laastari';

  @override
  String get birthControlRing => 'Rengas';

  @override
  String get birthControlInjection => 'Pistos';

  @override
  String get birthControlImplant => 'Implantti';

  @override
  String get birthControlIud => 'Kierukka';

  @override
  String get navAssistant => 'Avustaja';

  @override
  String get assistantTitle => 'Vera-avustaja';

  @override
  String get assistantEndChatTitle => 'Lopetetaanko tämä keskustelu?';

  @override
  String get assistantEndChatBody =>
      'Viestit ovat vain muistissa eikä niitä tallenneta minnekään, joten niitä ei saa takaisin.';

  @override
  String get assistantEndChatConfirm => 'Lopeta keskustelu';

  @override
  String get assistantInputHint => 'Kysy kierrostasi…';

  @override
  String get assistantIntro =>
      'Hei! Täällä voit kysyä kuukautisista, kierrosta ja Veran toiminnasta — vastaukset tulevat puhelimesi tietokannasta eikä mikään lähde laitteeltasi. Tämä ei ole lääketieteellistä neuvontaa.';

  @override
  String get insightMenstrual3 =>
      'Kuukautisveri ei ole ”likaista verta” — se on sekoitus verta ja kohdun limakalvoa, täysin normaali osa kiertoa.';

  @override
  String get insightMenstrual4 =>
      'Hellä lämpö alavatsalla helpottaa kramppeja aidosti — lämpöpullo on tutkimusnäyttöön nojaava klassikko.';

  @override
  String get insightMenstrual5 =>
      'Vuoto on usein runsainta kahtena ensimmäisenä päivänä ja vähenee sen jälkeen — tuo kaava on tyypillinen.';

  @override
  String get insightMenstrual6 =>
      'Hieman tavallista väsyneempi olo kuukautisten aikana on yleistä — rautaa poistuu kehosta kuukautisveren mukana.';

  @override
  String get insightFollicular3 =>
      'Estrogeeni rakentaa kohdun limakalvoa uudelleen kuukautisten jälkeen — kehosi valmistautuu uudestaan.';

  @override
  String get insightFollicular4 =>
      'Iho näyttää usein puhtaimmillaan tässä vaiheessa, kun hormonitasot asettuvat.';

  @override
  String get insightFollicular5 =>
      'Kestävyys ja reaktioajat ovat monella huipussaan follikkelivaiheen loppupuolella.';

  @override
  String get insightFollicular6 =>
      'Juuri tämän vaiheen pituus vaihtelee eniten ihmisten välillä — luteaalivaihe on paljon vakaampi.';

  @override
  String get insightFertile3 =>
      'Munasolu elää noin 12–24 tuntia, mutta siittiöt voivat odottaa jopa 5 päivää — siksi hedelmällinen ikkuna kattaa useita päiviä.';

  @override
  String get insightFertile4 =>
      'Ovulaation aikoihin kohdunkaulan lima muuttuu usein kirkkaaksi ja venyväksi — kuin raaka munanvalkuainen.';

  @override
  String get insightFertile5 =>
      'Jotkut tuntevat ovulaation aikaan lyhyen toispuoleisen pistoksen — sillä on jopa nimi: mittelschmerz.';

  @override
  String get insightFertile6 =>
      'Peruslämpö nousee hieman *ovulaation jälkeen* — se vahvistaa ovulaation tapahtuneen sen sijaan, että ennustaisi sitä.';

  @override
  String get insightLuteal3 =>
      'Progesteroni on huipussaan noin viikko ovulaation jälkeen — turvotus ja rintojen arkuus ovat silloin yleisiä.';

  @override
  String get insightLuteal4 =>
      'Hiilihydraattien himo ennen kuukautisia on todellinen — energiantarve nousee luteaalivaiheessa hieman.';

  @override
  String get insightLuteal5 =>
      'PMS-oireet helpottavat yleensä päivän tai parin kuluessa vuodon alkamisesta.';

  @override
  String get insightLuteal6 =>
      'Säännöllinen unirytmi voi pehmentää huomattavasti luteaalivaiheen loppupuolen mielialan laskuja.';

  @override
  String get insightUnknown2 =>
      'Jo kolmen kierron seuraaminen riittää usein siihen, että oma kaava alkaa näkyä.';

  @override
  String get insightUnknown3 =>
      'Kierrot ovat henkilökohtaisia — oman kierron vertaaminen ystävän kiertoon kertoo harvoin mitään hyödyllistä.';

  @override
  String get insightUnknown4 =>
      'Stressi, matkustaminen ja sairastelu voivat kaikki siirtää ovulaatiota — ”myöhässä olevat” kuukautiset tarkoittavat usein vain myöhässä ollutta ovulaatiota.';

  @override
  String get settingsThemeLabel => 'Teema';

  @override
  String get settingsThemeSystem => 'Järjestelmä';

  @override
  String get settingsThemeLight => 'Vaalea';

  @override
  String get settingsThemeDark => 'Tumma';

  @override
  String get settingsMascotLabel => 'Seuralaishahmo';

  @override
  String get mascotDroplet => 'Pisara';

  @override
  String get mascotFlower => 'Kukka';

  @override
  String get mascotMoon => 'Kuu';

  @override
  String get mascotNone => 'Ei mitään';

  @override
  String homeWindowCountdown(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: 'Ennustettu ajanjakso alkaa noin $days päivän kuluttua',
      one: 'Ennustettu ajanjakso alkaa noin $days päivän kuluttua',
    );
    return '$_temp0';
  }

  @override
  String homeOvulationCountdown(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: 'Arvioitu ovulaatio noin $days päivän kuluttua',
      one: 'Arvioitu ovulaatio noin $days päivän kuluttua',
    );
    return '$_temp0';
  }

  @override
  String get homeQuickLogTitle => 'Miltä kehossasi tuntuu tänään?';

  @override
  String get actionSave => 'Tallenna';

  @override
  String get insightsTrackerHubTitle => 'Seurantasi';

  @override
  String get trackerHistoryEmpty => 'Tällä aikavälillä ei ole vielä merkintöjä';

  @override
  String get trackerStatAverage => 'Keskiarvo';

  @override
  String get trackerStatLowest => 'Alin';

  @override
  String get trackerStatHighest => 'Ylin';

  @override
  String get trackerStatLatest => 'Viimeisin';

  @override
  String get rangeFilter1m => '1 kk';

  @override
  String get rangeFilter3m => '3 kk';

  @override
  String get rangeFilter6m => '6 kk';

  @override
  String get dayLogOvulationTestLabel => 'Ovulaatiotesti';

  @override
  String get ovulationTestNegative => 'Negatiivinen';

  @override
  String get ovulationTestPositive => 'Positiivinen';

  @override
  String get ovulationTestLow => 'Matala';

  @override
  String get ovulationTestHigh => 'Korkea';

  @override
  String get ovulationTestPeak => 'Huippu';

  @override
  String get pregnancyTestLabel => 'Raskaustesti';

  @override
  String get pregnancyTestPositive => 'Positiivinen';

  @override
  String get pregnancyTestFaint => 'Heikko viiva';

  @override
  String get pregnancyTestNegative => 'Negatiivinen';

  @override
  String get settingsOvulationTestToggle => 'Ovulaatiotesti';

  @override
  String get settingsRemindersOvulationLabel =>
      'Ennakkotieto hedelmällisestä ikkunasta';

  @override
  String get reminderOvulationTitle => 'Arvioitu hedelmällinen ikkuna lähestyy';

  @override
  String get reminderOvulationBody =>
      'Kirjaamiesi kiertojen perusteella arvioitu hedelmällinen ikkunasi voi alkaa pian.';

  @override
  String trackerEntriesCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count merkintää',
      one: '$count merkintä',
    );
    return '$_temp0';
  }

  @override
  String get trackerLowSampleNote =>
      'Näin harvalla merkinnällä prosentit eivät ole vielä luotettavia — ne tarkentuvat, kun kirjaat lisää.';

  @override
  String get assistantTyping => 'Vera kirjoittaa…';

  @override
  String get premiumTitle => 'Vera Premium';

  @override
  String get premiumHeadline => 'Vera Premium';

  @override
  String get premiumSubhead =>
      'Kaikki seurantaominaisuudet pysyvät ilmaisina ikuisesti — historiaasi ei koskaan lukita. Premium lisää omat seurantasi, syvemmät havainnot, omat muistutuksesi ja lisää ulkoasuja, sekä poistaa mainokset.';

  @override
  String get premiumBenefitNoAds => 'Ei mainoksia missään kohtaa sovellusta';

  @override
  String get premiumBenefitSupport =>
      'Tukee riippumatonta, yksityisyys edellä rakennettua sovellusta';

  @override
  String get premiumMonthly => 'Kuukausittain';

  @override
  String get premiumYearly => 'Vuosittain';

  @override
  String get premiumYearlyNote => 'Laskutetaan kerran vuodessa';

  @override
  String premiumPerMonth(String price) {
    return '$price / kk';
  }

  @override
  String get premiumBilledMonthly => 'Laskutetaan kuukausittain';

  @override
  String get premiumStaysFreeTitle => 'Mikä pysyy ilmaisena';

  @override
  String get premiumStaysFreeBody =>
      'Kalenteri, koko historiasi, perustilastot ja vienti pysyvät ilmaisina. Premium lisää asioita eikä koskaan ota mitään pois.';

  @override
  String get premiumSubscribeCta => 'Jatka';

  @override
  String get premiumRestore => 'Palauta ostos';

  @override
  String get premiumCancelNote =>
      'Peruuta milloin tahansa sovelluskauppatililtäsi. Ei lähtölaskentoja, ei painostusta — jos nyt ei ole oikea hetki, ilmaisversio toimii täsmälleen kuten tänäänkin.';

  @override
  String get premiumActiveBadge => 'Premium on käytössä';

  @override
  String get premiumDevToggle => 'Simuloi Premiumia (kehitys)';

  @override
  String get settingsPremiumEntry => 'Vera Premium';

  @override
  String get adTestNotice => 'Testimainos — ei vielä oikea sijoittelu';

  @override
  String get settingsPregnancyModeLabel => 'Raskaustila';

  @override
  String get pregnancyLmpLabel => 'Viimeisten kuukautisten ensimmäinen päivä';

  @override
  String pregnancyWeekLabel(int weeks, int days) {
    return 'Viikko $weeks, päivä $days';
  }

  @override
  String get pregnancyDueDateLabel => 'Arvioitu laskettu aika';

  @override
  String pregnancyDaysLeft(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: 'Noin $days päivää jäljellä',
      one: 'Noin $days päivä jäljellä',
    );
    return '$_temp0';
  }

  @override
  String pregnancyTrimesterLabel(int n) {
    return '$n. raskauskolmannes';
  }

  @override
  String get pregnancyDisclaimer =>
      'Päivät on arvioitu viimeisistä kuukautisistasi tavanomaisella 280 päivän säännöllä. Ultraääni antaa tarkemman päivän, ja myöhäinen ovulaatio siirtää näitä lukuja — tämä on tietoa, ei hoitoa.';

  @override
  String get pregnancySizeLabel => 'Vauvan koko';

  @override
  String get pregnancySizeUnder5 => 'Unikonsiemen (~2 mm)';

  @override
  String get pregnancySizeUnder9 => 'Mustikka (~1.6 cm)';

  @override
  String get pregnancySizeUnder13 => 'Limetti (~5.4 cm)';

  @override
  String get pregnancySizeUnder20 => 'Avokado (~11.6 cm)';

  @override
  String get pregnancySizeUnder28 => 'Mango (~30 cm)';

  @override
  String get pregnancySizeUnder34 => 'Ananas (~44 cm)';

  @override
  String get pregnancySizeUnder38 => 'Meloni (~46 cm)';

  @override
  String get pregnancySizeTerm => 'Pieni vesimeloni (~51 cm)';

  @override
  String get pregnancyNoteUnder5 =>
      'Useimmat eivät huomaa vielä mitään — koska raskausviikkoja lasketaan viimeisistä kuukautisista, kaksi ensimmäistä viikkoa ovat itse asiassa ennen hedelmöittymistä.';

  @override
  String get pregnancyNoteUnder9 =>
      'Pahoinvointi, rintojen arkuus ja väsymys ovat juuri nyt yleisiä. Hyvä hetki sopia ensimmäinen vastaanottoaika.';

  @override
  String get pregnancyNoteUnder13 =>
      'Olet lähestymässä ensimmäisen raskauskolmanneksen loppua; monella pahoinvointi alkaa helpottaa suunnilleen nyt.';

  @override
  String get pregnancyNoteUnder20 =>
      'Energia palaa usein tällä jaksolla. Ensimmäiset liikkeet voi tuntea milloin tahansa viikkojen 16 ja 22 välillä.';

  @override
  String get pregnancyNoteUnder28 =>
      'Liikkeet erottuvat selvemmin ja alkavat muodostaa kaavaa. Selkäkipu ja närästys ovat tällä jaksolla yleisiä.';

  @override
  String get pregnancyNoteUnder34 =>
      'Olet kolmannella raskauskolmanneksella. Hengenahdistus, tihentynyt virtsaamistarve ja Braxton-Hicks-supistukset ovat yleisiä.';

  @override
  String get pregnancyNoteUnder38 =>
      'Vauva valmistautuu syntymään. Hyvä hetki pakata sairaalalaukku ja tehdä synnytyssuunnitelma.';

  @override
  String get pregnancyNoteTerm =>
      'Olet täysiaikainen — synnytys voi tapahtua milloin tahansa viikkojen 37 ja 42 välillä; viikko 40 on keskiarvo, ei määräaika.';

  @override
  String get pregnancyWeeklyNoteTitle => 'Tällä viikolla';

  @override
  String get pregnancyNeedsLmp =>
      'Lisää viimeisten kuukautistesi ensimmäinen päivä aloittaaksesi seurannan.';

  @override
  String get pregnancyOutOfRange =>
      'Tuo päivä on yli 42 viikon takana — päivitä se tai kytke raskaustila pois.';

  @override
  String get partnerShareTitle => 'Jaa yhteenveto kumppanin kanssa';

  @override
  String get partnerShareBody =>
      'Luo lyhyen tekstiyhteenvedon — nykyisen vaiheesi ja arvioidun ajanjaksosi — jonka lähetät itse millä tahansa sovelluksella. Reaaliaikaista synkronointia tai kumppanitiliä ei ole: mitään ei jaeta, ellet lähetä sitä.';

  @override
  String get partnerShareCta => 'Luo yhteenveto';

  @override
  String get partnerSummaryHeader => 'Kiertoyhteenveto Verasta';

  @override
  String get settingsHomeThemeLabel => 'Etusivun tausta';

  @override
  String get homeThemeWheat => 'Vehnä';

  @override
  String get homeThemeSky => 'Taivas';

  @override
  String get homeThemeField => 'Niitty';

  @override
  String get homeThemeBlossom => 'Kukinta';

  @override
  String get homeThemePlain => 'Yksinkertainen';

  @override
  String get backupNudgeTitle => 'Säilytä kopio tiedoistasi';

  @override
  String get backupNudgeBody =>
      'Kaikki on vain tässä puhelimessa. Jos se katoaa, hajoaa tai nollataan, historiasi menee sen mukana — salattu varmuuskopio vie hetken, ja vain sinä voit avata sen.';

  @override
  String get backupNudgeCta => 'Varmuuskopioi nyt';

  @override
  String get backupNudgeDismiss => 'Myöhemmin';

  @override
  String backupLastDone(String date) {
    return 'Viimeisin varmuuskopio: $date';
  }

  @override
  String get backupNever => 'Ei vielä varmuuskopiota';

  @override
  String get settingsRemindersBackupLabel => 'Muistuta minua varmuuskopioimaan';

  @override
  String get reminderBackupTitle => 'Aika varmuuskopioida Vera';

  @override
  String get reminderBackupBody =>
      'Historiasi on olemassa vain tässä puhelimessa. Nopea salattu varmuuskopio pitää sen turvassa.';

  @override
  String get notificationChannelPeriodStart => 'Tulevat kuukautiset';

  @override
  String get notificationChannelPeriodEnd => 'Kuukautisten päättymisen kysely';

  @override
  String get notificationChannelMedication => 'Lääkitys';

  @override
  String get notificationChannelWater => 'Vesi';

  @override
  String get notificationChannelAppointment => 'Vastaanotto';

  @override
  String get notificationChannelOvulation => 'Hedelmällinen ikkuna';

  @override
  String get notificationChannelBackup => 'Varmuuskopiomuistutus';

  @override
  String get calendarDayDetailTitle => 'Tämä päivä';

  @override
  String get calendarDayNothingLogged =>
      'Tälle päivälle ei ole vielä kirjattu mitään';

  @override
  String get calendarDayOpenLog => 'Avaa päiväkirjaus';

  @override
  String get cycleHistoryTitle => 'Aiemmat kierrot';

  @override
  String get cycleTrendsTitle => 'Kierron kehitys';

  @override
  String get cycleHistoryEmpty =>
      'Kirjaa pari kuukautisia, niin kiertohistoriasi näkyy täällä.';

  @override
  String get cycleHistoryOngoing => 'Kesken';

  @override
  String cycleHistoryLength(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days päivän kierto',
      one: '$days päivän kierto',
    );
    return '$_temp0';
  }

  @override
  String cycleHistoryPeriodLength(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: 'Kuukautiset kestivät $days päivää',
      one: 'Kuukautiset kestivät $days päivän',
    );
    return '$_temp0';
  }

  @override
  String cycleHistoryVsAverage(String diff) {
    return '$diff keskiarvoosi verrattuna';
  }

  @override
  String get insightsCycleHistoryEntry => 'Aiemmat kierrot';

  @override
  String get homeEmptyTitle => 'Aloitetaan viimeisistä kuukautisistasi';

  @override
  String get homeEmptyBody =>
      'Napauta yllä olevaa painiketta sinä päivänä, kun kuukautisesi alkavat. Kahden kokonaisen kierron jälkeen Vera voi alkaa arvioida — siihen asti se ei teeskentele tietävänsä.';

  @override
  String get homeEmptyBackdate => 'Ne alkoivat jo aiemmin';

  @override
  String get settingsAdPrivacyEntry => 'Mainosten yksityisyysasetukset';

  @override
  String a11yCycleRing(int day, int length) {
    return 'Kierron päivä $day noin $length päivästä';
  }

  @override
  String a11yChartSummary(int count, String min, String max) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Kaaviossa $count merkintää, väliltä $min–$max',
      one: 'Kaaviossa $count merkintä, väliltä $min–$max',
    );
    return '$_temp0';
  }

  @override
  String a11yPhaseBar(int day, int length) {
    return 'Kierron eteneminen: päivä $day noin $length päivästä';
  }

  @override
  String a11yFrequencyItem(String label, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count kertaa',
      one: '$count kerta',
    );
    return '$label: $_temp0';
  }

  @override
  String get importTitle => 'Tuo toisesta sovelluksesta';

  @override
  String get importBody =>
      'Vie historiasi vanhasta seurantasovelluksestasi CSV-tiedostona ja valitse tiedosto tässä. Vain päivät ja vuoto tuodaan — oireiden ja mielialojen sanamuodot eroavat sovellusten välillä, eikä Vera arvaa, mitä tarkoitit.';

  @override
  String get importPickFile => 'Valitse CSV-tiedosto';

  @override
  String importPreview(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Löytyi $count päivää historiaa',
      one: 'Löytyi $count päivä historiaa',
    );
    return '$_temp0';
  }

  @override
  String importSkipped(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count riviä ei voitu lukea ja ne jätetään pois',
      one: '$count riviä ei voitu lukea ja se jätetään pois',
    );
    return '$_temp0';
  }

  @override
  String get importConfirm => 'Lisää historiaani';

  @override
  String get importMergeNote =>
      'Tuodut päivät yhdistetään mukaan. Päivät, jotka olet jo kirjannut Veraan, säilyvät sellaisinaan.';

  @override
  String importDone(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Tuotiin $count päivää',
      one: 'Tuotiin $count päivä',
    );
    return '$_temp0';
  }

  @override
  String get importErrorEmpty => 'Tuo tiedosto näyttää tyhjältä.';

  @override
  String get importErrorNoDate => 'Tiedostosta ei löytynyt päiväsaraketta.';

  @override
  String get settingsImportEntry => 'Tuo toisesta sovelluksesta';

  @override
  String get settingsHealthSyncLabel =>
      'Synkronoi Apple Healthiin / Health Connectiin';

  @override
  String get settingsHealthSyncBody =>
      'Kirjoittaa puhelimesi terveyssovellukseen vain kuukautisvuodon, painon ja peruslämmön. Oireet, mielialat ja muistiinpanot pysyvät Verassa. Mitään ei lueta takaisin.';

  @override
  String healthSyncBackfilled(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Lähetettiin $count päivää terveyssovellukseesi',
      one: 'Lähetettiin $count päivä terveyssovellukseesi',
    );
    return '$_temp0';
  }

  @override
  String get healthSyncDenied =>
      'Lupaa ei myönnetty, joten synkronointi pysyy pois päältä.';

  @override
  String get settingsDiagnosticsEntry => 'Diagnostiikka';

  @override
  String get diagnosticsBody =>
      'Jos sovellus käyttäytyy oudosti, tekniset tiedot tallentuvat tänne — vain tälle laitteelle. Mitään ei lähetetä minnekään, ellet valitse lähettää sitä, ja voit lukea ensin täsmälleen sen, mitä olisit lähettämässä.';

  @override
  String get diagnosticsEmpty =>
      'Mitään ei ole tallennettu — ongelmia ei ole havaittu.';

  @override
  String get diagnosticsShare => 'Lähetä kehittäjälle';

  @override
  String get diagnosticsClear => 'Tyhjennä';

  @override
  String get diagnosticsNoteLabel => 'Mitä tapahtui? (valinnainen)';

  @override
  String get diagnosticsTechnicalDetail => 'Tekniset tiedot';

  @override
  String get unitHoursShort => 't';

  @override
  String get unitMinutesShort => 'min';

  @override
  String get unitHoursLong => 'tuntia';

  @override
  String get unitMinutesLong => 'minuuttia';

  @override
  String get unitMilliliters => 'ml';

  @override
  String get unitKilograms => 'kg';

  @override
  String get calendarJumpTitle => 'Siirry kuukauteen';

  @override
  String get calendarJumpYearLabel => 'Vuosi';

  @override
  String get settingsAdPrivacyUnavailable =>
      'Mainosten personointivalintoja ei tarjota alueellasi — täällä näytettävät mainokset ovat jo personoimattomia.';

  @override
  String get settingsGroupAppearance => 'Ulkoasu';

  @override
  String get settingsGroupTracking => 'Seuranta-asetukset';

  @override
  String get dayLogCustomTagsLabel => 'Omat seurantani';

  @override
  String get customTagAddButton => 'Lisää seuranta';

  @override
  String get customTagDialogTitle => 'Uusi seuranta';

  @override
  String get customTagDialogHint => 'esim. migreeni, kuntosali, unettomuus';

  @override
  String get customTagManageEntry => 'Hallinnoi seurantojani';

  @override
  String get customTagRenameTitle => 'Nimeä seuranta uudelleen';

  @override
  String get customTagDeleteTitle => 'Poistetaanko tämä seuranta?';

  @override
  String get customTagDeleteBody =>
      'Se poistetaan jokaiselta päivältä, jolla käytit sitä. Muut merkintäsi säilyvät sellaisinaan.';

  @override
  String get customTagEmpty => 'Ei vielä omia seurantoja.';

  @override
  String get premiumLockedTitle => 'Premium-ominaisuus';

  @override
  String get premiumLockedAction => 'Katso Premium';

  @override
  String get premiumBenefitCustomTrackers =>
      'Seuraa mitä tahansa haluat, omin sanoin';

  @override
  String get premiumBenefitAdvancedInsights =>
      'Edistyneet havainnot: mitä tapahtuu yleensä ja milloin';

  @override
  String get premiumBenefitPersonalisation => 'Lisää taustoja ja seuralaisia';

  @override
  String get premiumBenefitAdvancedReminders =>
      'Muistutukset omalla aikataulullasi';

  @override
  String get advancedInsightsTitle => 'Edistyneet havainnot';

  @override
  String get advancedInsightsEntry => 'Edistyneet havainnot';

  @override
  String get advancedInsightsNotEnough =>
      'Kirjaa kolme kokonaista kiertoa, niin kaavasi ilmestyvät tänne. Sitä vähemmällä mikä tahansa ”kaava” olisi vain sattumaa.';

  @override
  String get advancedInsightsPatternsTitle => 'Milloin asioita yleensä ilmenee';

  @override
  String advancedInsightsPatternLine(String label, String segment) {
    return '$label — useimmiten $segment';
  }

  @override
  String advancedInsightsPatternDetail(int count, int day) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count päivää kirjattu, noin kiertosi päivänä $day',
      one: '$count päivä kirjattu, noin kiertosi päivänä $day',
    );
    return '$_temp0';
  }

  @override
  String advancedInsightsNoPattern(String label) {
    return '$label — ei vielä selvää ajoitusta';
  }

  @override
  String get advancedInsightsTrendTitle => 'Kierron pituus ajan myötä';

  @override
  String advancedInsightsDriftLonger(String days, String cycles) {
    return 'Kun verrataan varhaisimpia $cycles kiertoasi viimeisimpiin $cycles, viimeisimmät ovat noin $days päivää pidempiä.';
  }

  @override
  String advancedInsightsDriftShorter(String days, String cycles) {
    return 'Kun verrataan varhaisimpia $cycles kiertoasi viimeisimpiin $cycles, viimeisimmät ovat noin $days päivää lyhyempiä.';
  }

  @override
  String advancedInsightsDriftStable(String cycles) {
    return 'Kun verrataan varhaisimpia $cycles kiertoasi viimeisimpiin $cycles, kiertosi pituus on pysynyt suunnilleen samana.';
  }

  @override
  String get advancedInsightsDriftNotEnough =>
      'Kun sinulla on kuusi kokonaista kiertoa, Vera voi verrata varhaisimpia viimeisimpiin nähdäkseen, onko kiertosi pituus muuttumassa.';

  @override
  String get advancedInsightsMoodTitle => 'Mieliala kierron osan mukaan';

  @override
  String get advancedInsightsDisclaimer =>
      'Nämä ovat lukumääriä siitä, mitä olet kirjannut, ei sen enempää. Ne eivät ole diagnoosi, eikä täällä näkyvä kaava ole syy.';

  @override
  String get segmentPeriod => 'kuukautisten aikana';

  @override
  String get segmentAfterPeriod => 'kuukautisten jälkeen';

  @override
  String get segmentMidCycle => 'kierron puolivälissä';

  @override
  String get segmentBeforePeriod => 'ennen kuukautisia';

  @override
  String get customRemindersEntry => 'Omat muistutukseni';

  @override
  String get customRemindersTitle => 'Omat muistutukseni';

  @override
  String get customRemindersEmpty => 'Ei vielä omia muistutuksia.';

  @override
  String get customRemindersAdd => 'Lisää muistutus';

  @override
  String get customReminderLabelHint => 'esim. ota pillerini, juo vettä';

  @override
  String get customReminderLockScreenNote =>
      'Muistutuksen teksti näkyy lukitusnäytölläsi, joten pidä se niin yksityisenä kuin haluat.';

  @override
  String get customReminderDelete => 'Poista muistutus';

  @override
  String get homeThemeDusk => 'Hämärä';

  @override
  String get homeThemeMeadow => 'Keto';

  @override
  String get homeThemePetal => 'Terälehti';

  @override
  String get homeThemeBloom => 'Kukoistus';

  @override
  String get homeThemeOcean => 'Valtameri';

  @override
  String get homeThemeAutumn => 'Syksy';

  @override
  String get homeThemeNight => 'Yö';

  @override
  String get mascotStar => 'Tähti';

  @override
  String get mascotLeaf => 'Lehti';

  @override
  String get mascotCat => 'Kissa';

  @override
  String get mascotRabbit => 'Kani';

  @override
  String get mascotBird => 'Lintu';

  @override
  String get tipDetailWhatsHappening => 'Mitä kehossasi tapahtuu';

  @override
  String get tipDetailGeneralHeading => 'Yleisiä vinkkejä';

  @override
  String get tipDetailDisclaimer =>
      'Tämä on yleistä tietoa, ei henkilökohtaista lääketieteellistä neuvontaa. Jokainen keho reagoi eri tavalla, ja se, miltä sinusta oikeasti tuntuu, merkitsee enemmän kuin mikään täällä ehdotettu. Jos jokin huolestuttaa sinua, keskustele terveydenhuollon ammattilaisen kanssa.';

  @override
  String get phaseExplainerMenstrual =>
      'Vuodat, koska kohdun limakalvo irtoaa. Estrogeeni ja progesteroni ovat kierron alimmillaan, ja siksi moni tuntee olonsa ensimmäisinä päivinä väsyneemmäksi ja sisäänpäin kääntyneemmäksi. Vuoto kestää yleensä kolmesta seitsemään päivään ja on runsainta alussa. Kouristukset johtuvat kohdun supistelusta, jota ajavat prostaglandiinit — hormonin kaltaiset yhdisteet, joita vapautuu limakalvon hajotessa. Siksi osalla on samaan aikaan alaselkäkipua tai löysempi vatsa. Vuoto vie myös rautaa, ja se selittää osan väsymyksestä. Lämpö, liike ja uni auttavat yleensä. Jos suoja kuitenkin täyttyy tunnin välein, jos vuoto jatkuu selvästi yli viikon tai jos kipu estää tavallisia asioita, siitä kannattaa puhua ammattilaisen kanssa sen sijaan, että odottaa sen ohi.';

  @override
  String get phaseExplainerFollicular =>
      'Vuodon loputtua estrogeeni alkaa taas nousta. Munasarjoissa kypsyy joukko follikkeleita, joissa kussakin on munasolu, ja yleensä vain yksi päätyy irtoamaan. Estrogeeni rakentaa juuri irronneen limakalvon uudelleen, ja useimmat huomaavat energian, mielialan, ihon ja kestävyyden palaavan sen mukana. Tämä on myös kierron eniten vaihteleva osa ihmisten ja kuukausien välillä — stressi, sairastelu, matkat ja uni näkyvät useimmiten juuri täällä pidentämällä tai lyhentämällä sitä. Se on rehellinen syy siihen, että ennuste on aikaväli eikä päivämäärä: kierron jälkipuolisko pysyy melko vakaana, ja tämä puolisko on se, joka liikkuu.';

  @override
  String get phaseExplainerFertile =>
      'Estrogeeni on lähellä huippuaan ja ovulaatiota odotetaan näiden päivien tienoilla. Luteinisoivan hormonin piikki laukaisee munasolun irtoamisen noin vuorokauden tai puolentoista päästä. Munasolu itse säilyy elossa noin 12–24 tuntia, mutta siittiöt voivat elää useita päiviä hedelmällisessä kohdunkaulan limassa — siksi ikkuna lasketaan useissa päivissä eikä yhdessä. Lima muuttuu tyypillisesti kirkkaaksi, venyväksi ja liukkaaksi, vähän kuin raaka kananmunan valkuainen; osa huomaa halun lisääntyvän, rinnat aristavan tai lyhyen pistoksen toisella puolella. Energia on usein kierron korkeimmillaan. Muista, että ikkuna on arvio omasta historiastasi, ei mittaus, eikä se ole ehkäisymenetelmä.';

  @override
  String get phaseExplainerLuteal =>
      'Ovulaation jälkeen tyhjentyneestä follikkelista tulee keltarauhanen, joka alkaa tuottaa progesteronia pitäen limakalvon vakaana siltä varalta, että raskaus kiinnittyy. Jos näin ei käy, progesteroni ja estrogeeni laskevat jyrkästi ja kuukautiset alkavat. Tämä kierron puolisko on tasaisempi, yleensä noin 12–14 päivää. Progesteroni nostaa lepolämpöä hieman — juuri sen muutoksen perus­lämpömittari havaitsee — ja voi hidastaa ruoansulatusta, mikä selittää osan turvotuksesta. Lopun lasku laukaisee monilla PMS-oireet: rintojen arkuus, ruokahalun muutokset, katkonainen uni, päänsärky ja mielialan vaihtelut, jotka yleensä helpottavat vuodon alettua. Jos oireet häiritsevät työtä tai ihmissuhteita useimpina kuukausina, asiasta kannattaa keskustella ammattilaisen kanssa.';

  @override
  String get phaseExplainerUnknown =>
      'Merkintöjä ei ole vielä tarpeeksi, jotta voisi sanoa, missä vaiheessa olet. Vera tarvitsee vähintään kaksi kokonaista kiertoa — yhden kuukautisten alun ja sitten seuraavan — laskeakseen oman keskiarvosi ja vaihtelusi, ja sanoo sen mieluummin kuin keksii vaiheen. Mikään ei mene sillä välin hukkaan: jokainen merkitsemäsi päivä kuuluu siihen ensimmäiseen laskelmaan, ja arvio kapenee historian karttuessa. Siihen asti alla olevat ehdotukset ovat yleisiä ja pätevät missä tahansa kierron kohdassa.';

  @override
  String get tipFitnessDetailMenstrual =>
      'Kova treeni ei sovi useimmille ensimmäisinä päivinä, eikä kyse ole kurista — energia on aidosti matalampi, ja vuodon mukana menevä rauta tekee kestävyystyöstä raskaampaa kuin sama treeni tuntui viime viikolla. Kävely, kevyt venyttely, palauttava jooga ja hengitysharjoitukset parantavat verenkiertoa ja voivat lieventää kouristuksia; osalla säännöllinen liike koko kuukauden ajan vähentää kouristusten voimakkuutta enemmän kuin mikään, mitä he tekevät itse päivänä. Jos olo on hyvä, kovia treenejä ei ole syytä välttää: vuotaminen ei ole syy lopettaa liikuntaa, ja moni urheilija kilpailee sen aikana. Muutama käytännön huomio: pitkät ja vaativat treenit runsaan vuodon päivinä voivat syventää väsymystä, lämpö alavatsalle ennen aloitusta tekee liikkeestä mukavampaa, ja hieman tavallista runsaampi juominen auttaa näiden päivien päänsärkyyn. Arvioi treeni sen mukaan, miltä se tuntuu kesken kaiken, älä sen mukaan, millainen paras viikkosi oli.';

  @override
  String get tipFitnessDetailFollicular =>
      'Estrogeenin noustessa useimmat tuntevat itsensä vahvemmiksi ja kestävämmiksi; tämä on yleensä kierron paras jakso aloittaa jotain uutta, lisätä painoja tai nostaa vauhtia. Lihasten korjautuminen on täällä suhteellisen tehokasta, joten kovat treenit imeytyvät paremmin ja jättävät vähemmän pitkittynyttä lihaskipua. Se on hyvä ikkuna myös sille, mikä vaatii kirkasta päätä eikä vain vahvaa kehoa — uuden liikkeen opettelu, tekniikan korjaaminen tai aiempaa pidempi matka. Kaksi varausta kannattaa pitää mielessä: etene asteittain, sillä korkea energia ei tarkoita nollaa loukkaantumisriskiä ja useimmat rasitusvammat alkavat hyvänä viikkona, ei huonona. Ja suojele untasi — kehittyminen tapahtuu palautumisen aikana, ei treenissä.';

  @override
  String get tipFitnessDetailFertile =>
      'Energia ja motivaatio ovat yleensä huipussaan, joten vaativat treenit istuvat hyvin — ennätykset syntyvät usein juuri täällä. Osa tutkimuksista viittaa siihen, että nivelet ovat ovulaation tienoilla hieman löysemmät; käytännön vaikutuksesta kiistellään, mutta pidempi lämmittely on halpa varotoimi lajeissa, joissa on jyrkkiä suunnanmuutoksia, hyppyjä ja alastuloja. Kehon lämpötila on yhä matala kierron jälkipuoliskoon verrattuna, joten kuumuus rajoittaa täällä vähemmän kuin se rajoittaa viikon tai parin päästä. Lyhyt pistos alavatsan toisella puolella ovulaation aikaan on tavallinen ja menee yleensä ohi tunneissa. Jos kipu on voimakas, toispuoleinen ja jatkuva, siihen liittyy kuumetta tai olo on pyörryttävä, lopeta ja käy tarkistuttamassa sen sijaan, että treenaisit läpi.';

  @override
  String get tipFitnessDetailLuteal =>
      'Kuukautisten lähestyessä energia voi laskea, syke voi olla samalla teholla korkeampi ja palautuminen voi kestää pidempään. Se on odotettu heilahdus, ei taantuma, eikä se pyyhi pois kahden viime viikon työtä. Progesteroni nostaa lepolämpöä hieman ja vaikeuttaa lämmön luovuttamista, joten kuumat tai kosteat treenit tuntuvat täällä suhteettoman raskailta — aikaisemmin tai myöhemmin päivällä treenaaminen ja tarpeelliselta tuntuvaa runsaampi juominen auttavat molemmat. Kohtuulliset treenit, hieman kevennetty versio voimaharjoittelusta ja kävely ovat yleensä kestävämpiä. Turvotuksen ja rintojen arkuuden kanssa tukeva urheiluliivi ja pidempi lämmittely tekevät todellisen eron. Jos mieliala on matala, tee treenistä lyhyt ja helppo sen sijaan, että jättäisit sen kokonaan väliin — rima sille, että se lasketaan, on matalammalla kuin miltä tuntuu.';

  @override
  String get tipFitnessDetailUnknown =>
      'Vaikka vaihetta ei tiedettäisi, liike auttaa milloin tahansa: yleinen suositus on noin 150 minuuttia kohtuullista liikuntaa viikossa useimmille päiville jaettuna, ja lisäksi lihaskuntoa kahdesti viikossa — ja tämä kaava tuottaa lähes kaikille enemmän kuin satunnaiset erittäin rankat treenit. Säännöllisyys painaa enemmän kuin teho, ja paras treeni on se, jonka oikeasti toistat ensi viikolla. Sovita sen mukaan, miltä tuntuu: väsyneinä päivinä kävelykin lasketaan, ja tehty lyhyt treeni on arvokkaampi kuin väliin jätetty pitkä. Kun olet merkinnyt muutaman kierron, tähän ilmestyy vaihekohtaisia ehdotuksia.';

  @override
  String get tipNutritionDetailMenstrual =>
      'Vuoto vie rautaa; punainen liha, linssit, kikherneet, tummanvihreät lehtivihannekset ja siirappi auttavat täydentämään sitä. Kasvirauta imeytyy selvästi paremmin C-vitamiinin kanssa — sitruunan puristaminen linssiruoan päälle on siitä käytännöllisin versio, ja tomaattisalaatti vieressä tekee saman. Tee ja kahvi aterian kanssa vähentävät raudan imeytymistä tanniinien takia, joten noin tunnin väli riittää; kummastakaan ei tarvitse luopua. Riittävä veden juominen voi helpottaa vuotoon liittyvää väsymystä ja päänsärkyä, ja magnesiumpitoiset ruoat kuten pähkinät, siemenet ja tummat lehtivihannekset auttavat osaa kouristuksiin. Päivinä, joina ruoansulatus on hidas, pienet ja säännölliset ateriat istuvat paremmin kuin isot. Jos tunnet kuukautisten aikaan usein hengästymistä, huimausta tai epätavallista uupumusta, siitä kannattaa mainita ammattilaiselle — matala rauta on yleistä, helppo tutkia, eikä sellaista sovi sovelluksen diagnosoida.';

  @override
  String get tipNutritionDetailFollicular =>
      'Energian palatessa keho on rakennustilassa: riittävä proteiini, täysjyvä ja kasvikset tukevat sitä, ja tässä vaiheessa ruokahalu on yleensä tasaisin ja helpoiten hallittavissa. On myös järkevää jatkaa rautavarastojen täydentämistä vuodon jälkeen sen sijaan, että pitäisi sitä vain kuukautisviikon asiana — varastot rakentuvat viikoissa, ei päivissä. Aterioiden väliin jättämättä jättäminen on täällä helpompaa, ja se auttaa astumaan tasapainoisemmin seuraavan vaiheen ruokahalun heilahduksiin. Jos aiot muuttaa syömistäsi, tämä jakso on yleensä ystävällisempi aloitukselle kuin kuukautisia edeltävä viikko, jolloin mieliteot ja matala mieliala saavat jokaisen uuden rutiinin tuntumaan vaikeammalta kuin se on.';

  @override
  String get tipNutritionDetailFertile =>
      'Täällä ei tarvita erityistä ruokavaliota; tasapainoiset ateriat ja riittävä vesi tekevät suurimman osan työstä. Osa tuntee turvotusta ovulaation tienoilla, mikä on yleensä hormonaalista ja ohimenevää eikä johdu syödystä. Ruokahalu laskee joillakin hieman ja nousee toisilla — molemmat ovat tavallisia. Proteiinin ja kuidun pitäminen aterioilla tasaa energiaa kuukauden usein vilkkaimman ja aktiivisimman jakson läpi. Jos suunnittelet raskautta, tämä on järkevä hetki kysyä ammattilaiselta foolihaposta, jota yleensä suositellaan ennen hedelmöittymistä eikä sen jälkeen — mutta se on keskustelu hänen kanssaan, ei neuvo, jonka sovelluksen kuuluisi antaa.';

  @override
  String get tipNutritionDetailLuteal =>
      'Ruokahalun kasvu ja sokerinhimo progesteronin noustessa ovat hyvin yleisiä; kyse on hormonaalisesta siirtymästä, ei tahdonvoimasta, ja keho todella kuluttaa tässä vaiheessa hieman enemmän energiaa. Proteiinin ja kuidun lisääminen aterioihin pitää verensokerin tasaisempana ja pehmentää himoa paljon paremmin kuin sen sivuuttaminen — kunnollisella ruoalla vastattu himo loppuu yleensä aiemmin kuin sellainen, jota vastaan taistelee tunnin. Vähemmän suolaa ja enemmän vettä voivat helpottaa turvotusta; se kuulostaa nurinkuriselta mutta ei ole: hyvin nesteytettynä keho pidättää vähemmän. Magnesiumpitoiset ruoat (mantelit, saksanpähkinät, tummat lehtivihannekset, tumma suklaa) vähentävät osalla kouristuksia ja jännitystä. Kofeiinin vähentäminen iltapäivästä eteenpäin auttaa tämän vaiheen katkonaiseen uneen, ja alkoholiakin kannattaa pitää silmällä, koska se pirstoo unta juuri siinä kierron kohdassa, jossa se on jo valmiiksi kevyempää.';

  @override
  String get tipNutritionDetailUnknown =>
      'Vaiheesta riippumatta samat asiat auttavat eniten: säännölliset ateriat, riittävä proteiini, runsaasti kasviksia, riittävä vesi ja rautapitoinen ruoka. Koska vuoto vie rautaa, riittää kiinnittää siihen niinä päivinä hieman enemmän huomiota — jokaiselle kuukauden viikolle ei tarvita omaa ruokavaliota. Suunnilleen samoihin aikoihin syöminen tekee tasaiselle energialle enemmän kuin mikään yksittäinen ruoka, eikä mitään tarvitse jättää pois, jotta kierto olisi terve. Kun olet merkinnyt muutaman kierron, tähän ilmestyy vaihekohtaisia ehdotuksia.';

  @override
  String get tipSleepLabel => 'Uni';

  @override
  String get tipSleepMenstrual =>
      'Kramput ja epämukavuus voivat pirstoa unta; lämmin suihku tai lämpötyyny ennen nukkumaanmenoa voi auttaa.';

  @override
  String get tipSleepFollicular =>
      'Energian noustessa moni tuntee olonsa valppaammaksi — todellinen unentarve ei kuitenkaan juuri laske.';

  @override
  String get tipSleepFertile =>
      'Lievä lämpötilan nousu ovulaation aikoihin voi hieman vaikeuttaa nukahtamista; viileämpi huone voi auttaa.';

  @override
  String get tipSleepLuteal =>
      'Progesteroni nostaa lepolämpötilaa hieman ja voi keventää syvää unta; viileä, pimeä huone ja säännöllinen nukkumaanmenoaika auttavat tässä eniten.';

  @override
  String get tipSleepUnknown =>
      'Unen laatu vaihtelee usein kierron aikana — yleensä hauraimmillaan juuri ennen kuukautisia ja niiden aikana. Säännöllinen nukkumaanmenoaika on luotettavin perusta vaiheesta riippumatta.';

  @override
  String get tipSleepDetailMenstrual =>
      'Kuukautisten aikana uni on usein katkonaisempaa — kramput, epämukavuus ja joillakin tiheämmät vessakäynnit voivat herättää yöllä. Lämmin suihku, lämpötyyny tai kevyt venyttely ennen nukkumaanmenoa voi helpottaa kramppeja. Jos otat kipulääkettä, sen ajoittaminen niin että vaikutus kattaa yön ensimmäisen osan voi suojata alkuyön unta. Jos uni on yhä vaikeaa, se on normaalia — helpottuu yleensä vaiheen edetessä.';

  @override
  String get tipSleepDetailFollicular =>
      'Estrogeenin noustessa moni tuntee olonsa valppaammaksi ja energisemmäksi, mikä voi tuntua vähäisemmältä unentarpeelta. Se ei ole aivan tarkkaa — hereillä olo vain tulee helpommin. Säännöllisen nukkumaanmenoajan pitäminen kannattaa myöhemmin, kun uni muuttuu hauraammaksi muissa vaiheissa.';

  @override
  String get tipSleepDetailFertile =>
      'Pieni lämpötilan nousu ovulaation aikoihin voi hieman vaikeuttaa nukahtamista, koska keho haluaa luonnostaan viilentyä ennen unta. Viileämpi huone, kevyempi peitto tai lämmin suihku ennen nukkumaanmenoa voi tasapainottaa tätä. Ne, jotka huomaavat lisääntynyttä halua tai sosiaalista energiaa tänä aikana, saattavat myös valvoa myöhempään omasta valinnastaan.';

  @override
  String get tipSleepDetailLuteal =>
      'Ovulaation jälkeen nouseva progesteroni nostaa lepolämpötilaa hieman, mikä voi keventää syvää unta — joskus lievänä kuumana aaltoiluna, joskus vain vähemmän palauttavana unena. Kuukautisten lähestyessä premenstruaalinen jännitys voi lisätä tätä. Viileä, pimeä huone, vähemmän ruutuaikaa ennen nukkumaanmenoa ja säännöllinen nukkumaanmenoaika auttavat tässä eniten.';

  @override
  String get tipSleepDetailUnknown =>
      'Vaihetta ei voida vielä määrittää riittävän tiedon puutteessa, mutta unen laadun vaihtelu kierron aikana on yleinen kaava — yleensä hauraampi juuri ennen kuukautisia ja niiden aikana, vakaampi ensimmäisellä puoliskolla. Luotettavin perusta vaiheesta riippumatta: säännölliset nukkumaan- ja heräämisajat, vähemmän ruutuaikaa ennen nukkumaanmenoa ja viileä, pimeä huone.';
}
