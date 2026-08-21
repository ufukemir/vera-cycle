// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Hungarian (`hu`).
class AppLocalizationsHu extends AppLocalizations {
  AppLocalizationsHu([String locale = 'hu']) : super(locale);

  @override
  String get appTitle => 'Vera';

  @override
  String get actionSkip => 'Kihagyás';

  @override
  String get actionContinue => 'Tovább';

  @override
  String get actionDone => 'Kész';

  @override
  String get actionCancel => 'Mégse';

  @override
  String get actionClear => 'Törlés';

  @override
  String get actionDelete => 'Törlés';

  @override
  String get actionEnable => 'Bekapcsolás';

  @override
  String get commonIDontKnow => 'Nem tudom';

  @override
  String get commonYes => 'Igen';

  @override
  String get commonNo => 'Nem';

  @override
  String get commonNotSure => 'Nem vagyok biztos benne';

  @override
  String get pinSetupTitle => 'PIN beállítása';

  @override
  String get pinSetupEnterPrompt =>
      'Válassz egy 6 jegyű PIN-kódot az alkalmazás zárolásához';

  @override
  String get pinSetupConfirmPrompt => 'Írd be újra a megerősítéshez';

  @override
  String get pinSetupMismatch => 'Ez a kettő nem egyezett — próbáljuk meg újra';

  @override
  String get pinSetupBiometricTitle => 'Gyorsabb feloldás?';

  @override
  String get pinSetupBiometricBody =>
      'Ujjlenyomattal vagy arcfelismeréssel is feloldhatod — a PIN továbbra is működik tartalékként.';

  @override
  String get lockScreenTitle => 'Zárolva';

  @override
  String get lockScreenEnterPin => 'Add meg a PIN-kódot';

  @override
  String get lockScreenWrongPin => 'Ez a PIN nem egyezik';

  @override
  String get lockScreenUseBiometrics => 'Biometrikus feloldás';

  @override
  String get lockScreenUseFaceId => 'Face ID használata';

  @override
  String get lockScreenUseFingerprint => 'Ujjlenyomat használata';

  @override
  String get lockScreenForgotPin => 'Elfelejtetted a PIN-kódot?';

  @override
  String get lockScreenForgotPinChoiceTitle =>
      'Hogyan szeretnéd visszaállítani?';

  @override
  String get lockScreenResetViaDevice => 'Ellenőrzés ezzel az eszközzel';

  @override
  String get lockScreenResetViaDeviceBody =>
      'Az adataid megmaradnak. Elég a telefonod saját zárával — Face ID, ujjlenyomat vagy jelkód — igazolnod magad.';

  @override
  String get lockScreenResetViaDeviceReason =>
      'Igazold magad új PIN beállításához';

  @override
  String lockScreenThrottled(int seconds) {
    return 'Túl sok próbálkozás. Próbáld újra $seconds mp múlva';
  }

  @override
  String get lockScreenEraseTitle => 'Törlöd az összes adatot?';

  @override
  String get lockScreenEraseBody =>
      'Ez véglegesen töröl mindent ezen az eszközön. Nincs fiók és nincs szerveroldali biztonsági mentés, ezért ez nem vonható vissza.';

  @override
  String get lockScreenEraseConfirm => 'Minden törlése';

  @override
  String get onboardingPrivacyTitle => 'Üdv';

  @override
  String get onboardingPrivacyBody =>
      'A ciklusadataid titkosítva, kizárólag ezen az eszközön maradnak. Nincs fiók és nincs felhőszinkron — amit rögzítesz, soha nem kerül feltöltésre. A kulcs a telefonod biztonságos hardverében van, és bármikor exportálhatsz vagy törölhetsz mindent.';

  @override
  String get onboardingLastPeriodTitle =>
      'Mikor kezdődött a legutóbbi menstruációd?';

  @override
  String get onboardingLastPeriodBody =>
      'Ez segít az induláshoz — később bármikor javíthatod a naptárban.';

  @override
  String get onboardingPickDate => 'Válassz dátumot';

  @override
  String get onboardingCycleLengthTitle =>
      'Jellemzően milyen hosszú a ciklusod?';

  @override
  String get onboardingCycleLengthBody =>
      'Egy hozzávetőleges szám is megteszi. Valódi becslést akkor kezdünk adni, ha már láttunk néhány teljes ciklust.';

  @override
  String get onboardingPeriodLengthTitle =>
      'Hány napig tart általában a menstruációd?';

  @override
  String get onboardingPeriodLengthBody =>
      'Ezzel töltjük ki a legutóbbi menstruációdat, hogy ne a nulláról indulj.';

  @override
  String get onboardingDaysUnit => 'nap';

  @override
  String get onboardingGoalTitle => 'Mi hozott ide?';

  @override
  String get onboardingGoalBody =>
      'Ez csak abban segít, hogy a számodra fontos dolgokat mutassuk elöl — a Beállításokban bármikor meggondolhatod magad.';

  @override
  String get goalTrackPeriod => 'A menstruációm követése';

  @override
  String get goalTryingToConceive => 'Babát tervezek';

  @override
  String get goalPregnancyTracking => 'Terhesség követése';

  @override
  String get onboardingRegularityTitle =>
      'Általában rendszeres a menstruációd?';

  @override
  String get onboardingRegularityBody =>
      'Itt nincs rossz válasz — ez csak segít egy kicsit jobban megismerni a tested.';

  @override
  String get onboardingCrampsTitle => 'Szoktak görcseid lenni?';

  @override
  String get onboardingCrampsBody =>
      'Gondoskodunk róla, hogy az ilyen napokon könnyű legyen rögzíteni, hogyan érzed magad.';

  @override
  String get onboardingBirthYearTitle => 'Melyik évben születtél?';

  @override
  String get onboardingBirthYearBody =>
      'Csak a teljesebb kép kedvéért — ez soha nem kerül bele semmilyen előrejelzésbe.';

  @override
  String get onboardingPmsTitle => 'Szokott előtte valami jelentkezni?';

  @override
  String get onboardingPmsBody =>
      'Válassz annyit, amennyi illik. Sehol nem tárolódik, nincs rossz válasz.';

  @override
  String get onboardingNotificationTitle => 'Szeretnél finom emlékeztetőket?';

  @override
  String get onboardingNotificationBody =>
      'Szólhatunk, mielőtt a menstruációd várható.';

  @override
  String get onboardingNotificationMockTitle =>
      'Hamarosan megkezdődhet a menstruációd';

  @override
  String get onboardingNotificationMockBody => 'A rögzített ciklusaid alapján';

  @override
  String get onboardingNotificationAllow => 'Emlékeztetők bekapcsolása';

  @override
  String get onboardingNotificationNotNow => 'Most nem';

  @override
  String get onboardingBuildingPlanTitle => 'Beállítjuk neked a dolgokat';

  @override
  String get onboardingBuildingPlanStep1 => 'Adataid védelme ezen az eszközön';

  @override
  String get onboardingBuildingPlanStep2 => 'Beállításaid mentése';

  @override
  String get onboardingBuildingPlanStep3 => 'A naptárad előkészítése';

  @override
  String get onboardingBuildingPlanDone => 'Minden kész';

  @override
  String get navHome => 'Kezdőlap';

  @override
  String get navCalendar => 'Naptár';

  @override
  String get navInsights => 'Elemzések';

  @override
  String get navSettings => 'Beállítások';

  @override
  String get navReminders => 'Emlékeztetők';

  @override
  String get navProfile => 'Profil';

  @override
  String get navTrack => 'Rögzítés';

  @override
  String homeCycleDayLabel(int day) {
    return '$day. nap';
  }

  @override
  String get homeNoCycleYet => 'Még nincs rögzített menstruáció';

  @override
  String get homePhaseMenstrual => 'Menstruáció';

  @override
  String get homePhaseFollicular => 'Follikuláris fázis';

  @override
  String get homePhaseFertileWindow => 'Becsült termékeny időszak';

  @override
  String get homePhaseLuteal => 'Luteális fázis';

  @override
  String get homePhaseUnknown => 'Nincs elég friss adat';

  @override
  String get homePredictionInsufficientTitle => 'Még nincs elég adat';

  @override
  String get homePredictionInsufficientBody =>
      'Rögzítsd a következő menstruációdat, és elkezdünk becslést adni.';

  @override
  String homePredictionRangeLabel(String start, String end) {
    return '$start – $end';
  }

  @override
  String get homeConfidenceHigh => 'Magas megbízhatóság';

  @override
  String get homeConfidenceMedium => 'Közepes megbízhatóság';

  @override
  String get homeConfidenceLow => 'Alacsony megbízhatóság';

  @override
  String get homeIrregularNote =>
      'A ciklusod hossza az utóbbi időben a szokásosnál jobban ingadozott. Ha ez új nálad, érdemes lehet szóba hozni egy vizsgálaton.';

  @override
  String get homeFertileWindowDisclaimer =>
      'A szokásos ciklusidőzítés alapján — nem fogamzásgátlási módszer.';

  @override
  String get homePeriodStartedButton => 'Ma kezdődött a menstruáció';

  @override
  String get homePeriodStartedSnackbar =>
      'Rögzítve — a menstruáció ma kezdődött';

  @override
  String get actionUndo => 'Visszavonás';

  @override
  String get comingSoon => 'Hamarosan';

  @override
  String get dayLogFlowLabel => 'Vérzés erőssége';

  @override
  String get flowSpotting => 'Pecsételő vérzés';

  @override
  String get flowLight => 'Gyenge';

  @override
  String get flowMedium => 'Közepes';

  @override
  String get flowHeavy => 'Erős';

  @override
  String get flowNone => 'Nincs';

  @override
  String get dayLogSymptomsLabel => 'Tünetek';

  @override
  String get symptomCramps => 'Görcsök';

  @override
  String get symptomHeadache => 'Fejfájás';

  @override
  String get symptomBloating => 'Puffadás';

  @override
  String get symptomBreastTenderness => 'Mellérzékenység';

  @override
  String get symptomAcne => 'Pattanások';

  @override
  String get symptomFatigue => 'Fáradtság';

  @override
  String get symptomNausea => 'Hányinger';

  @override
  String get symptomBackPain => 'Hátfájás';

  @override
  String get symptomAppetiteChange => 'Étvágyváltozás';

  @override
  String get symptomSleepTrouble => 'Alvászavar';

  @override
  String get symptomPelvicPain => 'Kismedencei fájdalom';

  @override
  String get symptomDizziness => 'Szédülés';

  @override
  String get symptomMigraine => 'Migrén';

  @override
  String get symptomHighFever => 'Magas láz';

  @override
  String get symptomNeckPain => 'Nyakfájás';

  @override
  String get symptomShoulderPain => 'Vállfájdalom';

  @override
  String get symptomLimbPain => 'Végtagfájdalom';

  @override
  String get symptomMuscleAche => 'Izomfájdalom';

  @override
  String get symptomChills => 'Hidegrázás';

  @override
  String get symptomNightSweats => 'Éjszakai izzadás';

  @override
  String get symptomHotFlashes => 'Hőhullámok';

  @override
  String get symptomWeightGain => 'Súlygyarapodás';

  @override
  String get symptomConstipation => 'Székrekedés';

  @override
  String get symptomDiarrhea => 'Hasmenés';

  @override
  String get symptomIndigestion => 'Emésztési zavar';

  @override
  String get symptomGasPain => 'Puffadásos fájdalom';

  @override
  String get symptomFeelingUnwell => 'Rossz közérzet';

  @override
  String get symptomItching => 'Viszketés';

  @override
  String get symptomTroubleFocusing => 'Koncentrációs nehézség';

  @override
  String get symptomForgetfulness => 'Feledékenység';

  @override
  String get symptomGroupHead => 'Fej';

  @override
  String get symptomGroupBody => 'Test';

  @override
  String get symptomGroupAbdomen => 'Has';

  @override
  String get symptomGroupGeneral => 'Általános';

  @override
  String get symptomGroupCognitive => 'Kognitív';

  @override
  String get dayLogMoodLabel => 'Hangulat';

  @override
  String get moodCalm => 'Nyugodt';

  @override
  String get moodAnxious => 'Szorongó';

  @override
  String get moodIrritable => 'Ingerlékeny';

  @override
  String get moodLow => 'Lehangolt';

  @override
  String get moodEnergetic => 'Energikus';

  @override
  String get moodHappy => 'Boldog';

  @override
  String get moodContent => 'Elégedett';

  @override
  String get moodSad => 'Szomorú';

  @override
  String get moodDepressed => 'Nyomott hangulatú';

  @override
  String get moodEmotional => 'Érzelmes';

  @override
  String get moodExcited => 'Izgatott';

  @override
  String get moodHopeful => 'Reménykedő';

  @override
  String get moodProud => 'Büszke';

  @override
  String get moodDisappointed => 'Csalódott';

  @override
  String get moodConfident => 'Magabiztos';

  @override
  String get moodSurprised => 'Meglepett';

  @override
  String get moodIndifferent => 'Közömbös';

  @override
  String get moodPeaceful => 'Békés';

  @override
  String get moodInLove => 'Szerelmes';

  @override
  String get moodShy => 'Félénk';

  @override
  String get moodPlayful => 'Játékos';

  @override
  String get moodExhausted => 'Kimerült';

  @override
  String get moodLonely => 'Magányos';

  @override
  String get moodOverwhelmed => 'Túlterhelt';

  @override
  String get moodGrateful => 'Hálás';

  @override
  String get moodNostalgic => 'Nosztalgikus';

  @override
  String get dayLogNoteLabel => 'Jegyzet';

  @override
  String get dayLogNoteHint => 'Bármi, amire emlékezni szeretnél a mai napról';

  @override
  String get dayLogOptionalTrackersLabel => 'Választható követők';

  @override
  String get dayLogSexualActivityLabel => 'Szexuális együttlét';

  @override
  String get sexLifeNone => 'Semmi';

  @override
  String get sexLifeUnprotected => 'Védekezés nélküli szex';

  @override
  String get sexLifeProtected => 'Védekezéssel';

  @override
  String get sexLifeMasturbation => 'Önkielégítés';

  @override
  String get sexLifeNoOrgasm => 'Nem volt orgazmus';

  @override
  String get sexLifeOrgasm => 'Orgazmus';

  @override
  String get sexLifeHighDesire => 'Erős vágy';

  @override
  String get dayLogBbtLabel => 'Bazális testhőmérséklet';

  @override
  String get dayLogMucusLabel => 'Méhnyaknyák';

  @override
  String get mucusDry => 'Száraz';

  @override
  String get mucusSticky => 'Ragadós';

  @override
  String get mucusCreamy => 'Krémes';

  @override
  String get mucusWatery => 'Vizes';

  @override
  String get mucusEggWhite => 'Tojásfehérje-szerű';

  @override
  String get dayLogSavedIndicator => 'Mentve';

  @override
  String get homeOpenTodayLog => 'Részletek hozzáadása a mai naphoz';

  @override
  String get calendarLegendActual => 'Rögzített menstruáció';

  @override
  String get calendarLegendPredicted => 'Előrejelzett időszak';

  @override
  String get calendarLegendFertile => 'Becsült termékeny időszak';

  @override
  String get calendarLegendOvulation => 'Becsült ovuláció';

  @override
  String get dayDetailFertileTitle => 'A becsült termékeny időszakodban';

  @override
  String get dayDetailOvulationTitle => 'A becsült ovuláció napja';

  @override
  String get dayDetailOvulationBody =>
      'A szokásos időzítés alapján a teherbe esés jellemzően e nap környékén valószínűbb — ez becslés, nem garancia.';

  @override
  String get insightsCyclesLoggedLabel => 'Rögzített ciklusok';

  @override
  String get insightsAveragePeriodLengthLabel => 'Átlagos menstruációhossz';

  @override
  String get insightsAverageCycleLengthLabel => 'Átlagos ciklushossz';

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
      other: 'Kb. $daysString nappal ingadozik',
      one: 'Kb. $daysString nappal ingadozik',
    );
    return '$_temp0';
  }

  @override
  String get insightsNotEnoughDataTitle => 'Még nincs elég adat';

  @override
  String get insightsNotEnoughDataBody =>
      'Rögzíts néhány teljes ciklust, és itt megjelennek az átlagaid.';

  @override
  String get insightsSymptomFrequencyTitle => 'Tünetek ciklusnapok szerint';

  @override
  String get insightsNoSymptomsLogged => 'Még nincs rögzített tünet';

  @override
  String get settingsLanguageLabel => 'Nyelv';

  @override
  String get settingsLanguageSystem => 'Rendszernyelv';

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
  String get tourSkip => 'Kihagyás';

  @override
  String get tourNext => 'Tovább';

  @override
  String get tourStart => 'Kezdjük';

  @override
  String get tourHomeTitle => 'Kezdőlap';

  @override
  String get tourHomeBody =>
      'Egy pillantással lásd, hol tartasz ma — ciklusnapod, mennyi van hátra a becsült időszakodig, és a társad mindig itt van.';

  @override
  String get tourCalendarTitle => 'Naptár';

  @override
  String get tourCalendarBody =>
      'Nézd meg múltbeli és közelgő ciklusaidat a naptárban. Koppints bármelyik napra a bejegyzés megnyitásához.';

  @override
  String get tourTrackTitle => 'Rögzítés';

  @override
  String get tourTrackBody =>
      'A középső + gomb bárhonnan megnyitja a mai bejegyzést — folyás, tünetek, hangulat és más.';

  @override
  String get tourRemindersTitle => 'Emlékeztetők';

  @override
  String get tourRemindersBody =>
      'Állíts be emlékeztetőket a közelgő menstruációdhoz, gyógyszeredhez vagy a vízivásra — minden a telefonodon marad, sehova sem kerül.';

  @override
  String get tourProfileTitle => 'Profil';

  @override
  String get tourProfileBody =>
      'Itt találod meglátásaidat, mindent, amit követsz, és a beállításaidat.';

  @override
  String get settingsWeekStartLabel => 'A hét kezdőnapja';

  @override
  String get settingsWeekStartMonday => 'Hétfő';

  @override
  String get settingsWeekStartSunday => 'Vasárnap';

  @override
  String get settingsTemperatureUnitLabel => 'Hőmérséklet mértékegysége';

  @override
  String get settingsTemperatureCelsius => 'Celsius';

  @override
  String get settingsTemperatureFahrenheit => 'Fahrenheit';

  @override
  String get settingsRemindersLabel => 'Emlékeztessen a menstruációm előtt';

  @override
  String get remindersScreenTitle => 'Emlékeztetők';

  @override
  String get reminderDetailNotification => 'Értesítés';

  @override
  String get reminderDetailAlert => 'Figyelmeztetés';

  @override
  String get reminderDetailAlertToday => 'Aznap';

  @override
  String get reminderDetailTime => 'Idő';

  @override
  String get reminderDetailMessage => 'Üzenet';

  @override
  String get reminderDetailMessageEditTitle => 'Üzenet szerkesztése';

  @override
  String get reminderDetailMessageHint => 'Írd meg saját üzeneted';

  @override
  String reminderDetailAlertDaysBefore(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count nappal korábban',
    );
    return '$_temp0';
  }

  @override
  String optionsShowMore(int count) {
    return '+$count további';
  }

  @override
  String get optionsShowLess => 'Kevesebb megjelenítése';

  @override
  String get trackerHistoryEntry => 'Előzmények';

  @override
  String get actionSend => 'Küldés';

  @override
  String get actionRemove => 'Eltávolítás';

  @override
  String get feedbackEntry => 'Visszajelzés';

  @override
  String get cloudBackupEntry => 'Mentés fiókkal';

  @override
  String get cloudBackupTitle => 'Mentés fiókkal';

  @override
  String get cloudBackupNotConfiguredTitle =>
      'Ebben a verzióban még nem elérhető';

  @override
  String get cloudBackupNotConfiguredBody =>
      'A felhőmentéshez egy fiókszolgáltatás szükséges, amely még nincs beállítva ehhez a verzióhoz. Addig itt semmi sem használható.';

  @override
  String get cloudBackupIntro1Title => 'Sose veszítsd el az előzményeidet';

  @override
  String get cloudBackupIntro1Body =>
      'A ciklustörténeted biztonságban marad akkor is, ha elveszíted a telefonodat, vagy újra váltasz.';

  @override
  String get cloudBackupIntro2Title => 'Csak te nyithatod meg';

  @override
  String get cloudBackupIntro2Body =>
      'A mentésed jelszóval titkosítva van, mielőtt elhagyná a telefonodat — mi sem tudjuk elolvasni, más sem.';

  @override
  String get cloudBackupIntro3Title => 'Állítsd vissza másodpercek alatt';

  @override
  String get cloudBackupIntro3Body =>
      'Jelentkezz be egy új eszközön, és hozd vissza az előzményeidet ugyanazzal a jelszóval.';

  @override
  String get cloudBackupSignedInTitle => 'Bejelentkezve';

  @override
  String get cloudBackupUploadButton => 'Mentés most';

  @override
  String get cloudBackupDownloadButton => 'Visszaállítás a felhőből';

  @override
  String get cloudBackupUploadSuccess => 'Elmentve a fiókodba';

  @override
  String get cloudBackupNoBackupFound =>
      'Ehhez a fiókhoz még nem található felhőmentés.';

  @override
  String get partnerModeEntry => 'Partner mód';

  @override
  String get partnerModeTitle => 'Partner mód';

  @override
  String get partnerModeNotConfiguredTitle =>
      'Ebben a verzióban még nem elérhető';

  @override
  String get partnerModeNotConfiguredBody =>
      'A Partner módhoz egy fiókszolgáltatás szükséges, amely még nincs beállítva ehhez a verzióhoz. Addig itt semmi sem használható.';

  @override
  String get partnerModeHeroTitle =>
      'Oszd meg egy kicsit, a saját feltételeid szerint';

  @override
  String get partnerModeHeroBody =>
      'Párosodj a partnereddel, és csak azt oszd meg, amit lent bekapcsolsz — soha a teljes előzményedet, soha automatikusan.';

  @override
  String get partnerModeSignInGoogle => 'Folytatás Google-lel';

  @override
  String get partnerModeSignInApple => 'Folytatás Apple-lel';

  @override
  String get partnerModeFaqTitle => 'Mielőtt bejelentkezel';

  @override
  String get partnerModeFaq1Q => 'Mit lát valójában a partnerem?';

  @override
  String get partnerModeFaq1A =>
      'Csak azokat a mezőket, amelyeket a Partner módban bekapcsolsz, és csak a jelenlegi állapotodat — soha a mentett előzményedet, és semmit, amit kifejezetten nem osztottál meg.';

  @override
  String get partnerModeFaq2Q => 'Kikapcsolhatom ezt később?';

  @override
  String get partnerModeFaq2A =>
      'Igen. A párosítás megszüntetése azonnal leállítja a megosztást mindkettőtöknél, és bármelyik kapcsolót bármikor kikapcsolhatod párosítás megszüntetése nélkül.';

  @override
  String get partnerModeFaq3Q =>
      'Szüksége van a partneremnek erre az alkalmazásra?';

  @override
  String get partnerModeFaq3A =>
      'Igen — ugyanúgy jelentkezik be, és egy kóddal párosodik, amit te küldesz neki.';

  @override
  String get partnerModeNotPairedTitle => 'Még nincs párosítva';

  @override
  String get partnerModeNotPairedBody =>
      'Hívd meg a partneredet egy egyszer használatos kóddal, vagy add meg a kódot, amit ő küldött.';

  @override
  String get partnerModeInviteButton => 'Partnerem meghívása';

  @override
  String get partnerModeEnterCodeButton => 'Kód megadása';

  @override
  String get partnerModeSignOut => 'Kijelentkezés';

  @override
  String get partnerModePairedTitle => 'Párosítva';

  @override
  String get partnerModePairedBody =>
      'Te és a partnered össze vagytok kapcsolva. A megosztás továbbra is csak arra vonatkozik, amit lent bekapcsolsz.';

  @override
  String get partnerModeShareSectionTitle => 'Mit osztasz meg';

  @override
  String get partnerModeShareCyclePhase => 'Ciklus fázisa és napja';

  @override
  String get partnerModeShareMood => 'Mai hangulat';

  @override
  String get partnerModeShareSymptoms => 'Mai tünetek';

  @override
  String get partnerModeShareHighDesire => 'Vágy a közelségre ma';

  @override
  String get partnerModeShareNow => 'Megosztás most';

  @override
  String get partnerModeShareSuccess => 'Megosztva a partnereddel';

  @override
  String get partnerModeUnpair => 'Párosítás megszüntetése';

  @override
  String get partnerModeUnpairConfirmTitle =>
      'Megszünteted a párosítást a partnereddel?';

  @override
  String get partnerModeUnpairConfirmBody =>
      'Ez azonnal leállítja a megosztást mindkettőtöknél. Később új kóddal újra párosodhattok.';

  @override
  String get partnerModePartnerSnapshotEmpty =>
      'A partnered még nem osztott meg semmit.';

  @override
  String get partnerModeErrorNotConfigured =>
      'A Partner mód még nincs beállítva ebben a verzióban.';

  @override
  String get partnerModeErrorCodeNotFound =>
      'Ez a kód nem található. Ellenőrizd, és próbáld újra.';

  @override
  String get partnerModeErrorCodeExpired =>
      'Ennek a kódnak lejárt az érvényessége. Kérj egy újat.';

  @override
  String get partnerModeErrorCodeIsOwn =>
      'Ez a saját kódod — kérd el a partneredét.';

  @override
  String get partnerModeErrorNotSignedIn => 'Először jelentkezz be.';

  @override
  String get partnerModeErrorUnknown =>
      'Valami hiba történt. Kérjük, próbáld újra.';

  @override
  String get partnerModeInviteTitle => 'Hívd meg a partneredet';

  @override
  String get partnerModeInviteBody =>
      'Küldd el ezt a kódot a partnerednek. Ő a saját alkalmazásában adja meg, hogy párosodjon veled.';

  @override
  String get partnerModeInviteExpiry => '7 napig érvényes';

  @override
  String get partnerModeInviteShare => 'Kód megosztása';

  @override
  String partnerModeInviteMessage(String code) {
    return 'Íme a Vera párosítási kódom: $code';
  }

  @override
  String get partnerModeEnterTitle => 'Kód megadása';

  @override
  String get partnerModeEnterBody =>
      'Add meg a kódot, amit a partnered küldött.';

  @override
  String get partnerModeEnterHint => '6 karakteres kód';

  @override
  String get partnerModeEnterSubmit => 'Párosítás';

  @override
  String get homeInvitePartnerTitle => 'Oszd meg a partnereddel';

  @override
  String get homeInvitePartnerBody =>
      'Párosodjatok, és csak azt oszd meg, amit kiválasztasz — az előzményed a tiéd marad.';

  @override
  String get homeInvitePartnerCta => 'Partner mód beállítása';

  @override
  String get feedbackTitle => 'Mi nem tetszett?';

  @override
  String get feedbackSubtitle =>
      'Válassz egy témát, és írj róla bővebben, ha szeretnél.';

  @override
  String get feedbackCategoryPredictions => 'Előrejelzések';

  @override
  String get feedbackCategoryBackup => 'Biztonsági mentés';

  @override
  String get feedbackCategorySubscription => 'Előfizetés';

  @override
  String get feedbackCategoryAds => 'Hirdetések';

  @override
  String get feedbackCategoryDesign => 'Design';

  @override
  String get feedbackCategoryTranslation => 'Fordítás';

  @override
  String get feedbackCategoryOther => 'Egyéb';

  @override
  String get feedbackDescriptionLabel => 'Mondj el többet (opcionális)';

  @override
  String get feedbackDescriptionHint =>
      'Mi történt? A Küldés gombra koppintva magad választod ki, hova osztod meg — a levelezőalkalmazásodat vagy mást.';

  @override
  String get feedbackAttachPhoto => 'Fénykép hozzáadása';

  @override
  String get feedbackPhotoAttached => 'Fénykép csatolva';

  @override
  String get remindersGroupCycle => 'Menstruáció és termékenység';

  @override
  String get remindersGroupMedication => 'Gyógyszer';

  @override
  String get remindersGroupLifestyle => 'Életmód';

  @override
  String get remindersGroupAppointment => 'Orvosi időpontok';

  @override
  String get settingsRemindersPeriodEndLabel =>
      'Kérdezzen rá, amikor a menstruációmnak a végéhez kellene érnie';

  @override
  String get settingsRemindersMedicationLabel => 'Gyógyszeremlékeztető';

  @override
  String get settingsRemindersWaterLabel => 'Vízemlékeztető';

  @override
  String get settingsRemindersAppointmentLabel =>
      'Emlékeztető orvosi időpontra';

  @override
  String get settingsRemindersAppointmentSet => 'Dátum és időpont beállítása';

  @override
  String get settingsRemindersAppointmentClear => 'Törlés';

  @override
  String get settingsOptionalTrackersHeading => 'Választható követők';

  @override
  String get settingsOptionalTrackersBody =>
      'Alapból ki vannak kapcsolva. Ha bekapcsolsz egyet, megjelenik a napi napló képernyőn.';

  @override
  String get settingsSexualActivityToggle => 'Szexuális együttlét';

  @override
  String get settingsBbtToggle => 'Bazális testhőmérséklet';

  @override
  String get settingsMucusToggle => 'Méhnyaknyák';

  @override
  String get settingsBreastExamToggle => 'Mell önvizsgálata';

  @override
  String get settingsCervixToggle => 'A méhnyak helyzete és keménysége';

  @override
  String get settingsPrivacyEntry => 'Adatvédelem';

  @override
  String get settingsRateEntry => 'Értékelj minket';

  @override
  String get rateAppTitle => 'Beválik neked a Vera?';

  @override
  String get rateAppBody =>
      'Ha igen, egy pár másodperces értékelés az áruházban segít másoknak, akik hasonlót keresnek, hogy egyáltalán megtalálják.';

  @override
  String get rateAppCta => 'Vera értékelése';

  @override
  String get rateAppDismiss => 'Most nem';

  @override
  String get settingsDeleteAllData => 'Minden adat törlése';

  @override
  String get privacyScreenTitle => 'Adatvédelem';

  @override
  String get privacyScreenIntro =>
      'Íme pontosan az, ami az adataiddal történik, egyszerű nyelven.';

  @override
  String get privacyScreenStorageTitle => 'Titkosítva ezen az eszközön';

  @override
  String get privacyScreenNoNetworkTitle => 'Nincs szerver, nincs fiók';

  @override
  String get privacyScreenNoThirdPartyTitle => 'Nincs nyomkövetés';

  @override
  String get privacyScreenExportTitle => 'Csak te indíthatsz exportot';

  @override
  String get privacyScreenDeleteTitle => 'A törlés végleges';

  @override
  String get privacyScreenStorage =>
      'Minden, amit rögzítesz, titkosítva és kizárólag ezen az eszközön tárolódik, egyetlen fájlban. A titkosítási kulcs a telefonod biztonságos hardverében van — iOS-en a Keychainben, Androidon a Keystore-ban —, nem magában a fájlban.';

  @override
  String get privacyScreenNoNetwork =>
      'Ennek az alkalmazásnak nincs saját szervere és nincs fiókrendszer — a bejegyzéseid soha nem kerülnek feltöltésre. Az ingyenes változat tartalmaz Google-hirdetéseket, amelyek csatlakoznak az internethez; ezek soha nem kapnak meg semmit abból, amit rögzítesz.';

  @override
  String get privacyScreenNoThirdParty =>
      'Nincs analitika, nincs összeomlás-jelentés és nincs nyomkövető SDK. Az egyetlen külső komponens a Google hirdetési SDK-ja az ingyenes változatban — a Premium teljesen eltávolítja.';

  @override
  String get privacyScreenExport =>
      'Az adataid egyetlen módon hagyják el ezt az eszközt: ha te magad exportálod őket, és az az export olyan jelszóval van titkosítva, amelyet csak te ismersz.';

  @override
  String get privacyScreenDelete =>
      'Az adataid törlése valódi és azonnali. Nálunk nincs fiók és nincs biztonsági mentés — ami egyszer eltűnt, az eltűnt.';

  @override
  String get adPlaceholderLabel => 'Hirdetési hely';

  @override
  String get adPlaceholderUpgradeCta => 'Hirdetésmentes élmény a Premiummal';

  @override
  String get reminderNotificationTitle =>
      'Hamarosan megkezdődhet a menstruációd';

  @override
  String get reminderNotificationBody =>
      'A rögzített ciklusaid alapján közeleg a becsült időszakod.';

  @override
  String get reminderPeriodEndTitle =>
      'Lehet, hogy a menstruációd a végéhez közeledik';

  @override
  String get reminderPeriodEndBody =>
      'Ha még tart, az teljesen normális — ez csak egy kedves rákérdezés.';

  @override
  String get reminderMedicationTitle => 'Gyógyszeremlékeztető';

  @override
  String get reminderMedicationBody => 'Ideje bevenni a gyógyszered.';

  @override
  String get reminderWaterTitle => 'Igyál eleget';

  @override
  String get reminderWaterBody => 'Egy kis vízemlékeztető.';

  @override
  String get reminderAppointmentTitle => 'Közelgő orvosi időpont';

  @override
  String get reminderAppointmentBody => 'Közeleg egy orvosi időpontod.';

  @override
  String get settingsExportEntry => 'Exportálás és mentés';

  @override
  String get exportBackupHeading => 'Titkosított biztonsági mentés';

  @override
  String get exportBackupBody =>
      'Ments el egy titkosított másolatot az előzményeidről, hogy át tudd vinni egy új eszközre. A visszaállításhoz újra szükség lesz a jelszóra — másképp nincs mód a helyreállítására.';

  @override
  String get exportCreateBackupButton => 'Mentés készítése';

  @override
  String get exportRestoreBackupButton => 'Visszaállítás mentésből';

  @override
  String get exportPasswordLabel => 'Jelszó';

  @override
  String get exportPasswordConfirmLabel => 'Jelszó megerősítése';

  @override
  String get exportPasswordMismatch => 'A jelszavak nem egyeznek';

  @override
  String get exportPasswordTooShort => 'Használj legalább 8 karaktert';

  @override
  String get exportRestoreConfirmTitle =>
      'Lecseréled az összes adatot ezen az eszközön?';

  @override
  String get exportRestoreConfirmBody =>
      'A mentés visszaállítása lecserél mindent, ami jelenleg rögzítve van ezen az eszközön. Ez nem vonható vissza.';

  @override
  String get exportRestoreConfirmAction => 'Visszaállítás';

  @override
  String get exportWrongPassword => 'Ez a jelszó nem illik ehhez a mentéshez';

  @override
  String get exportInvalidFile => 'Ez a fájl nem tűnik Vera-mentésnek';

  @override
  String get exportBackupCreated => 'A mentés megosztásra kész';

  @override
  String get exportRestoreSuccess => 'A mentés visszaállítva';

  @override
  String get exportDoctorReportHeading => 'Orvosi összefoglaló';

  @override
  String get exportDoctorReportBody =>
      'Összefoglaló, amelyet megoszthatsz egy szakemberrel.';

  @override
  String get exportIncludeNotesToggle => 'Személyes jegyzetek is';

  @override
  String get exportShareCsvButton => 'Megosztás CSV-ként';

  @override
  String get exportPrintPdfButton => 'Nyomtatás / Mentés PDF-ként';

  @override
  String get doctorReportDisclaimer =>
      'A Vera készítette a felhasználó által megadott adatokból. Nem orvosi diagnózis.';

  @override
  String get doctorReportGeneratedOn => 'Készült';

  @override
  String get doctorReportSummaryHeading => 'Összefoglaló';

  @override
  String get doctorReportDailyLogHeading => 'Napi napló';

  @override
  String get doctorReportColumnDate => 'Dátum';

  @override
  String get doctorReportTimelineHeading => 'A ciklus idővonala';

  @override
  String get doctorReportCycleLabel => 'Ciklus';

  @override
  String get doctorReportTimelineLegendPeriod => 'Menstruáció';

  @override
  String get doctorReportTimelineLegendCycle => 'A ciklus többi része';

  @override
  String get doctorReportTimelineOngoing => 'Folyamatban';

  @override
  String get dailyInsightLabel => 'Tudtad?';

  @override
  String get insightMenstrual1 =>
      'A méhnyálkahártyád éppen leválik — a legtöbb menstruáció 3–7 napig tart, és ez teljesen normális.';

  @override
  String get insightMenstrual2 =>
      'A vasban gazdag ételek, például a leveles zöldségek és a lencse, segíthetnek pótolni azt, amit a szervezeted ezen a héten veszít.';

  @override
  String get insightFollicular1 =>
      'Az ösztrogénszint emelkedik, és sokan nagyjából mostantól több energiát és jobb összpontosítást tapasztalnak.';

  @override
  String get insightFollicular2 =>
      'A szervezeted egy petesejt kilökődésére készül — ez a fázis egy héttől akár néhány hétig is tarthat.';

  @override
  String get insightFertile1 =>
      'Ez a becsült termékeny időszakod — az ovuláció körüli napok, amikor a szokásos időzítés alapján a teherbe esés a legvalószínűbb.';

  @override
  String get insightFertile2 =>
      'Egyeseknél az ovuláció körül enyhén emelkedik a bazális testhőmérséklet, vagy megváltozik a méhnyaknyák.';

  @override
  String get insightLuteal1 =>
      'Az ovuláció után emelkedik a progeszteronszint — gyakran ilyenkor jelentkeznek a PMS-tünetek, például a hangulatváltozás vagy a puffadás.';

  @override
  String get insightLuteal2 =>
      'Ha nem történt beágyazódás, a hormonszintek a fázis vége felé leesnek, ami elindítja a következő menstruációt.';

  @override
  String get insightUnknown1 =>
      'A ciklushossz emberenként nagyon eltérő — a 21 és 35 nap közötti érték szokásosnak számít.';

  @override
  String get insightsPhaseTipsTitle => 'Ebben a fázisban jóleshet';

  @override
  String get tipFitnessLabel => 'Mozgás';

  @override
  String get tipNutritionLabel => 'Táplálkozás';

  @override
  String get tipFitnessMenstrual =>
      'A kíméletes mozgás — séta, nyújtás vagy regeneráló jóga — most jobban eshet, mint az intenzív edzés.';

  @override
  String get tipFitnessFollicular =>
      'Ebben a fázisban az energia gyakran emelkedik — jó alkalom új edzést kipróbálni vagy kicsit erősebben nyomni.';

  @override
  String get tipFitnessFertile =>
      'Sokan itt érzik magukat a legenergikusabbnak — jó fázis a nagyobb intenzitású edzéshez, ha ez vonzó számodra.';

  @override
  String get tipFitnessLuteal =>
      'Ha a fázis vége felé csökken az energiád, az alacsonyabb intenzitású erősítés vagy az úszás fenntarthatóbbnak érződhet.';

  @override
  String get tipFitnessUnknown =>
      'Bármilyen mozgás jó választás, ami ma jólesik — nincs egyetlen „helyes” rutin minden napra.';

  @override
  String get tipNutritionMenstrual =>
      'A vasban gazdag ételek, például a leveles zöldségek, a lencse és a vörös hús, segíthetnek pótolni azt, amit a szervezeted ezen a héten veszít.';

  @override
  String get tipNutritionFollicular =>
      'Ahogy nő az energia, a könnyebb, friss ételek gyakran jól esnek — de nincs egyetlen „helyes” étkezési mód ebben a fázisban.';

  @override
  String get tipNutritionFertile =>
      'A megfelelő folyadékbevitel és a kiegyensúlyozott étkezés támogatja az energiát ebben az aktívabbnak érződő fázisban.';

  @override
  String get tipNutritionLuteal =>
      'Az étvágy itt megváltozhat — az összetett szénhidrátok és a magnéziumban gazdag ételek, például a diófélék és az étcsokoládé, gyakori választások.';

  @override
  String get tipNutritionUnknown =>
      'A kiegyensúlyozott, rendszeres étkezés jó alapértelmezés, amíg a fázisod még nem egyértelmű.';

  @override
  String get predictionSettingsEntry => 'Előrejelzési beállítások';

  @override
  String get predictionSettingsIntro =>
      'Ezek feltételezések, nyíltan megmutatva. Ha már rögzítettél 2 teljes ciklust, a Kezdőlapon látható valódi előrejelzés a saját adataidból számolódik — ezeket a számokat onnantól nem használjuk hozzá.';

  @override
  String get predictionSettingsPeriodLengthLabel => 'Jellemző menstruációhossz';

  @override
  String get predictionSettingsCycleLengthLabel => 'Jellemző ciklushossz';

  @override
  String get predictionSettingsCycleLengthHint =>
      'A Kezdőlap gyűrűjének méretezésére szolgál, amíg nincs valódi adat.';

  @override
  String get predictionSettingsLutealLabel => 'A luteális fázis hossza';

  @override
  String get predictionSettingsLutealHint =>
      'A jellemző napok száma az ovuláció és a következő menstruáció között. A becsült termékeny időszak elhelyezésére szolgál — ezt a valódi előrejelzések indulása után is használjuk.';

  @override
  String get dayLogEnergyLabel => 'Energia';

  @override
  String get energyLevelLow => 'Alacsony';

  @override
  String get energyLevelMedium => 'Közepes';

  @override
  String get energyLevelHigh => 'Magas';

  @override
  String get energyLevelEnergetic => 'Feltöltődött';

  @override
  String get dayLogSkinHairLabel => 'Bőr és haj';

  @override
  String get skinHealthyGlow => 'Üde bőr';

  @override
  String get skinRedness => 'Bőrpír';

  @override
  String get skinDryness => 'Szárazság';

  @override
  String get skinOiliness => 'Zsírosodás';

  @override
  String get hairGoodDay => 'Jó hajnap';

  @override
  String get hairBadDay => 'Rossz hajnap';

  @override
  String get hairLoss => 'Hajhullás';

  @override
  String get scalpOily => 'Zsíros fejbőr';

  @override
  String get dayLogBreastExamLabel => 'Mell önvizsgálata';

  @override
  String get breastExamAllNormal => 'Semmi szokatlan';

  @override
  String get breastExamLump => 'Csomó';

  @override
  String get breastExamIndentation => 'Behúzódás';

  @override
  String get breastExamRedness => 'Bőrpír';

  @override
  String get breastExamCrackedNipple => 'Berepedt mellbimbó';

  @override
  String get breastExamDischarge => 'Váladékozás';

  @override
  String get cervixPositionLabel => 'A méhnyak helyzete';

  @override
  String get cervixPositionLow => 'Alacsony';

  @override
  String get cervixPositionMedium => 'Közepes';

  @override
  String get cervixPositionHigh => 'Magas';

  @override
  String get cervixOpeningLabel => 'A méhnyak nyitottsága';

  @override
  String get cervixOpeningClosed => 'Zárt';

  @override
  String get cervixOpeningMedium => 'Közepes';

  @override
  String get cervixOpeningOpen => 'Nyitott';

  @override
  String get cervixFirmnessLabel => 'A méhnyak keménysége';

  @override
  String get cervixFirmnessSoft => 'Puha';

  @override
  String get cervixFirmnessMedium => 'Közepes';

  @override
  String get cervixFirmnessFirm => 'Kemény';

  @override
  String get dayLogWaterLabel => 'Víz';

  @override
  String get dayLogSleepLabel => 'Alvás';

  @override
  String get dayLogWeightLabel => 'Testsúly';

  @override
  String get dayLogMedicationsLabel => 'Gyógyszer';

  @override
  String get dayLogAddMedication => 'Gyógyszer hozzáadása';

  @override
  String get dayLogMedicationNameHint => 'A gyógyszer neve';

  @override
  String get dayLogBirthControlLabel => 'Fogamzásgátlás';

  @override
  String get dayLogOtherMedicationsLabel => 'Egyéb gyógyszer';

  @override
  String get birthControlPillTaken => 'Tabletta bevéve';

  @override
  String get birthControlPillLate => 'Tabletta későn bevéve';

  @override
  String get birthControlPillMissed => 'Tabletta kimaradt';

  @override
  String get birthControlPatch => 'Tapasz';

  @override
  String get birthControlRing => 'Gyűrű';

  @override
  String get birthControlInjection => 'Injekció';

  @override
  String get birthControlImplant => 'Implantátum';

  @override
  String get birthControlIud => 'Spirál';

  @override
  String get navAssistant => 'Asszisztens';

  @override
  String get assistantTitle => 'Vera asszisztens';

  @override
  String get assistantEndChatTitle => 'Befejezed ezt a beszélgetést?';

  @override
  String get assistantEndChatBody =>
      'Az üzenetek csak a memóriában vannak, sehol nem tárolódnak, így nem hozhatók vissza.';

  @override
  String get assistantEndChatConfirm => 'Beszélgetés vége';

  @override
  String get assistantInputHint => 'Kérdezz a ciklusodról…';

  @override
  String get assistantIntro =>
      'Üdv! A Vera válaszol a menstruációval, a ciklussal és az alkalmazás működésével kapcsolatos kérdésekre — itt, a telefonodon; semmi nem hagyja el az eszközt. A válaszok a készüléken tárolt tudásbázisból származnak, és nem minősülnek orvosi tanácsnak.';

  @override
  String get insightMenstrual3 =>
      'A menstruációs vér nem „piszkos vér” — vér és méhnyálkahártya keveréke, a ciklus teljesen normális része.';

  @override
  String get insightMenstrual4 =>
      'Az alhasra tett enyhe meleg valóban enyhíti a görcsöket — a melegvizes palack bizonyítékokkal alátámasztott klasszikus.';

  @override
  String get insightMenstrual5 =>
      'A vérzés gyakran az első két napon a legerősebb, utána mérséklődik — ez a mintázat szokásos.';

  @override
  String get insightMenstrual6 =>
      'Gyakori, hogy a menstruáció alatt kicsit fáradtabbnak érzed magad — a vérzéssel vas is távozik a szervezetből.';

  @override
  String get insightFollicular3 =>
      'Az ösztrogén a menstruáció után újraépíti a méhnyálkahártyát — a szervezeted frissen készülődik.';

  @override
  String get insightFollicular4 =>
      'A bőr ebben a fázisban gyakran a legtisztább, ahogy a hormonszintek rendeződnek.';

  @override
  String get insightFollicular5 =>
      'Az állóképesség és a reakcióidő sokaknál a késői follikuláris fázisban tetőzik.';

  @override
  String get insightFollicular6 =>
      'Emberek között ennek a fázisnak a hossza változik a leginkább — a luteális fázis sokkal állandóbb.';

  @override
  String get insightFertile3 =>
      'A petesejt körülbelül 12–24 óráig él, a hímivarsejt viszont akár 5 napig is várhat — ezért ölel fel több napot a termékeny időszak.';

  @override
  String get insightFertile4 =>
      'Az ovuláció körül a méhnyaknyák gyakran áttetszővé és nyúlóssá válik — mint a nyers tojásfehérje.';

  @override
  String get insightFertile5 =>
      'Egyesek rövid, féloldali szúrást éreznek az ovuláció idején — ennek neve is van: mittelschmerz.';

  @override
  String get insightFertile6 =>
      'A bazális testhőmérséklet az ovuláció *után* emelkedik enyhén — nem előrejelzi, hanem megerősíti, hogy megtörtént.';

  @override
  String get insightLuteal3 =>
      'A progeszteron nagyjából egy héttel az ovuláció után tetőzik — a puffadás és a mellérzékenység ilyenkor gyakori.';

  @override
  String get insightLuteal4 =>
      'A menstruáció előtti szénhidrátéhség valós — a luteális fázisban az energiaigény enyhén megnő.';

  @override
  String get insightLuteal5 =>
      'A PMS-tünetek általában a vérzés megindulása után egy-két napon belül enyhülnek.';

  @override
  String get insightLuteal6 =>
      'A következetes alvási rutin érezhetően tompíthatja a késői luteális fázis hangulati mélypontjait.';

  @override
  String get insightUnknown2 =>
      'Már három ciklus követése is gyakran elég ahhoz, hogy kirajzolódjon a saját mintázatod.';

  @override
  String get insightUnknown3 =>
      'A ciklusok személyesek — a sajátodat egy barátodéhoz hasonlítani ritkán árul el bármi hasznosat.';

  @override
  String get insightUnknown4 =>
      'A stressz, az utazás és a betegség is eltolhatja az ovulációt — a „késő” menstruáció gyakran csak késői ovulációt jelent.';

  @override
  String get settingsThemeLabel => 'Téma';

  @override
  String get settingsThemeSystem => 'Rendszer';

  @override
  String get settingsThemeLight => 'Világos';

  @override
  String get settingsThemeDark => 'Sötét';

  @override
  String get settingsMascotLabel => 'Társ kabala';

  @override
  String get mascotDroplet => 'Csepp';

  @override
  String get mascotFlower => 'Virág';

  @override
  String get mascotMoon => 'Hold';

  @override
  String get mascotNone => 'Nincs';

  @override
  String homeWindowCountdown(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: 'Az előrejelzett időszak kb. $days nap múlva kezdődik',
      one: 'Az előrejelzett időszak kb. $days nap múlva kezdődik',
    );
    return '$_temp0';
  }

  @override
  String homeOvulationCountdown(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: 'A becsült ovuláció kb. $days nap múlva várható',
      one: 'A becsült ovuláció kb. $days nap múlva várható',
    );
    return '$_temp0';
  }

  @override
  String get homeQuickLogTitle => 'Hogyan érzi magát ma a tested?';

  @override
  String get actionSave => 'Mentés';

  @override
  String get insightsTrackerHubTitle => 'A követőid';

  @override
  String get trackerHistoryEmpty => 'Ebben az időszakban még nincs bejegyzés';

  @override
  String get trackerStatAverage => 'Átlag';

  @override
  String get trackerStatLowest => 'Legalacsonyabb';

  @override
  String get trackerStatHighest => 'Legmagasabb';

  @override
  String get trackerStatLatest => 'Legutóbbi';

  @override
  String get rangeFilter1m => '1 hó';

  @override
  String get rangeFilter3m => '3 hó';

  @override
  String get rangeFilter6m => '6 hó';

  @override
  String get dayLogOvulationTestLabel => 'Ovulációs teszt';

  @override
  String get ovulationTestNegative => 'Negatív';

  @override
  String get ovulationTestPositive => 'Pozitív';

  @override
  String get ovulationTestLow => 'Alacsony';

  @override
  String get ovulationTestHigh => 'Magas';

  @override
  String get ovulationTestPeak => 'Csúcs';

  @override
  String get pregnancyTestLabel => 'Terhességi teszt';

  @override
  String get pregnancyTestPositive => 'Pozitív';

  @override
  String get pregnancyTestFaint => 'Halvány csík';

  @override
  String get pregnancyTestNegative => 'Negatív';

  @override
  String get settingsOvulationTestToggle => 'Ovulációs teszt';

  @override
  String get settingsRemindersOvulationLabel => 'Jelzés a termékeny időszakról';

  @override
  String get reminderOvulationTitle => 'Közeleg a becsült termékeny időszak';

  @override
  String get reminderOvulationBody =>
      'A rögzített ciklusaid alapján a becsült termékeny időszakod hamarosan elkezdődhet.';

  @override
  String trackerEntriesCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count bejegyzés',
      one: '$count bejegyzés',
    );
    return '$_temp0';
  }

  @override
  String get trackerLowSampleNote =>
      'Ilyen kevés bejegyzéssel a százalékok még nem megbízhatóak — pontosabbak lesznek, ahogy többet rögzítesz.';

  @override
  String get assistantTyping => 'A Vera gépel…';

  @override
  String get premiumTitle => 'Vera Premium';

  @override
  String get premiumHeadline => 'Vera Premium';

  @override
  String get premiumSubhead =>
      'Minden követési funkció örökre ingyenes marad — az előzményeidet soha nem zárjuk el. A Premium saját követőket, mélyebb elemzéseket, saját emlékeztetőket és extra megjelenéseket ad hozzá, és eltávolítja a hirdetéseket.';

  @override
  String get premiumBenefitNoAds =>
      'Semmilyen hirdetés, sehol az alkalmazásban';

  @override
  String get premiumBenefitSupport =>
      'Egy független, adatvédelem-központú alkalmazást támogat';

  @override
  String get premiumMonthly => 'Havi';

  @override
  String get premiumYearly => 'Éves';

  @override
  String get premiumYearlyNote => 'Évente egyszer terhelve';

  @override
  String premiumPerMonth(String price) {
    return '$price / hó';
  }

  @override
  String get premiumBilledMonthly => 'Havi számlázás';

  @override
  String get premiumStaysFreeTitle => 'Ami ingyenes marad';

  @override
  String get premiumStaysFreeBody =>
      'A naptár, a teljes előzményed, az alapstatisztikák és az exportálás örökre ingyenes. A Premium hozzáad, sosem vesz el semmit.';

  @override
  String get premiumSubscribeCta => 'Tovább';

  @override
  String get premiumRestore => 'Vásárlás visszaállítása';

  @override
  String get premiumCancelNote =>
      'Bármikor lemondhatod az alkalmazásbolt-fiókodban. Nincs visszaszámlálás, nincs nyomásgyakorlás — ha most nem alkalmas, az ingyenes változat pontosan ugyanúgy működik tovább, mint ma.';

  @override
  String get premiumActiveBadge => 'A Premium aktív';

  @override
  String get premiumDevToggle => 'Premium szimulálása (fejlesztés)';

  @override
  String get settingsPremiumEntry => 'Vera Premium';

  @override
  String get adTestNotice => 'Teszthirdetés — még nem valódi megjelenés';

  @override
  String get settingsPregnancyModeLabel => 'Terhességi mód';

  @override
  String get pregnancyLmpLabel => 'A legutóbbi menstruáció első napja';

  @override
  String pregnancyWeekLabel(int weeks, int days) {
    return '$weeks. hét, $days. nap';
  }

  @override
  String get pregnancyDueDateLabel => 'Becsült szülési időpont';

  @override
  String pregnancyDaysLeft(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: 'Kb. $days nap van hátra',
      one: 'Kb. $days nap van hátra',
    );
    return '$_temp0';
  }

  @override
  String pregnancyTrimesterLabel(int n) {
    return '$n. trimeszter';
  }

  @override
  String get pregnancyDisclaimer =>
      'A dátumok a legutóbbi menstruációdból, a szokásos 280 napos szabállyal becsültek. Az ultrahang pontosabb dátumot ad, a késői ovuláció pedig eltolja ezeket a számokat — ez tájékoztatás, nem orvosi ellátás.';

  @override
  String get pregnancySizeLabel => 'Baba mérete';

  @override
  String get pregnancySizeUnder5 => 'Mákszem (~2 mm)';

  @override
  String get pregnancySizeUnder9 => 'Áfonya (~1.6 cm)';

  @override
  String get pregnancySizeUnder13 => 'Lime (~5.4 cm)';

  @override
  String get pregnancySizeUnder20 => 'Avokádó (~11.6 cm)';

  @override
  String get pregnancySizeUnder28 => 'Mangó (~30 cm)';

  @override
  String get pregnancySizeUnder34 => 'Ananász (~44 cm)';

  @override
  String get pregnancySizeUnder38 => 'Sárgadinnye (~46 cm)';

  @override
  String get pregnancySizeTerm => 'Kis görögdinnye (~51 cm)';

  @override
  String get pregnancyNoteUnder5 =>
      'A legtöbben még semmit nem vesznek észre — mivel a terhességi kort a legutóbbi menstruációtól számolják, az első két hét valójában a fogantatás előtti.';

  @override
  String get pregnancyNoteUnder9 =>
      'A hányinger, a mellérzékenység és a fáradtság most gyakori. Jó alkalom egyeztetni az első vizsgálat időpontját.';

  @override
  String get pregnancyNoteUnder13 =>
      'Közeledsz az első trimeszter végéhez; sokaknál a hányinger nagyjából ilyenkor kezd enyhülni.';

  @override
  String get pregnancyNoteUnder20 =>
      'Ebben a szakaszban gyakran visszatér az energia. Az első mozgások a 16. és a 22. hét között bármikor érezhetők lehetnek.';

  @override
  String get pregnancyNoteUnder28 =>
      'A mozgások határozottabbá válnak, és kezdenek mintázatot alkotni. A hátfájás és a gyomorégés ebben a szakaszban gyakori.';

  @override
  String get pregnancyNoteUnder34 =>
      'A harmadik trimeszterben jársz. A légszomj, a gyakori vizelés és a Braxton-Hicks összehúzódások gyakoriak.';

  @override
  String get pregnancyNoteUnder38 =>
      'A baba készül a születésre. Jó alkalom a kórházi táskára és a szülési tervre.';

  @override
  String get pregnancyNoteTerm =>
      'Elérted az érett terhességet — a szülés a 37. és a 42. hét között bármikor megtörténhet; a 40. hét átlag, nem határidő.';

  @override
  String get pregnancyWeeklyNoteTitle => 'Ezen a héten';

  @override
  String get pregnancyNeedsLmp =>
      'Add meg a legutóbbi menstruációd első napját a követés elindításához.';

  @override
  String get pregnancyOutOfRange =>
      'Ez a dátum több mint 42 hete volt — frissítsd, vagy kapcsold ki a terhességi módot.';

  @override
  String get partnerShareTitle => 'Összefoglaló megosztása a pároddal';

  @override
  String get partnerShareBody =>
      'Rövid szöveges összefoglalót készít — a jelenlegi fázisodat és a becsült időszakodat —, amelyet bármelyik alkalmazással te magad küldesz el. Nincs élő szinkron és nincs partnerfiók: semmi nem kerül megosztásra, amíg el nem küldöd.';

  @override
  String get partnerShareCta => 'Összefoglaló készítése';

  @override
  String get partnerSummaryHeader => 'Ciklus-összefoglaló a Verából';

  @override
  String get settingsHomeThemeLabel => 'A Kezdőlap háttere';

  @override
  String get homeThemeWheat => 'Búza';

  @override
  String get homeThemeSky => 'Égbolt';

  @override
  String get homeThemeField => 'Mező';

  @override
  String get homeThemeBlossom => 'Virágzás';

  @override
  String get homeThemePlain => 'Egyszerű';

  @override
  String get backupNudgeTitle => 'Őrizz meg egy másolatot az adataidról';

  @override
  String get backupNudgeBody =>
      'Minden kizárólag ezen a telefonon van. Ha elveszik, elromlik vagy visszaáll a gyári állapotra, az előzményeid is odavesznek — egy titkosított mentés csak egy pillanat, és csak te tudod megnyitni.';

  @override
  String get backupNudgeCta => 'Mentés most';

  @override
  String get backupNudgeDismiss => 'Később';

  @override
  String backupLastDone(String date) {
    return 'Legutóbbi mentés: $date';
  }

  @override
  String get backupNever => 'Még nincs mentés';

  @override
  String get settingsRemindersBackupLabel => 'Emlékeztessen a mentésre';

  @override
  String get reminderBackupTitle => 'Ideje menteni a Verát';

  @override
  String get reminderBackupBody =>
      'Az előzményeid csak ezen a telefonon léteznek. Egy gyors titkosított mentés biztonságban tartja őket.';

  @override
  String get notificationChannelPeriodStart => 'Közelgő menstruáció';

  @override
  String get notificationChannelPeriodEnd => 'Menstruáció végi rákérdezés';

  @override
  String get notificationChannelMedication => 'Gyógyszer';

  @override
  String get notificationChannelWater => 'Víz';

  @override
  String get notificationChannelAppointment => 'Időpont';

  @override
  String get notificationChannelOvulation => 'Termékeny időszak';

  @override
  String get notificationChannelBackup => 'Mentési emlékeztető';

  @override
  String get calendarDayDetailTitle => 'Ez a nap';

  @override
  String get calendarDayNothingLogged =>
      'Ehhez a naphoz még nincs rögzítve semmi';

  @override
  String get calendarDayOpenLog => 'Napi napló megnyitása';

  @override
  String get cycleHistoryTitle => 'Korábbi ciklusok';

  @override
  String get cycleTrendsTitle => 'Ciklustrendek';

  @override
  String get cycleHistoryEmpty =>
      'Rögzíts néhány menstruációt, és itt megjelenik a ciklusaid előzménye.';

  @override
  String get cycleHistoryOngoing => 'Folyamatban';

  @override
  String cycleHistoryLength(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days napos ciklus',
      one: '$days napos ciklus',
    );
    return '$_temp0';
  }

  @override
  String cycleHistoryPeriodLength(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: 'A menstruáció $days napig tartott',
      one: 'A menstruáció $days napig tartott',
    );
    return '$_temp0';
  }

  @override
  String cycleHistoryVsAverage(String diff) {
    return '$diff az átlagodhoz képest';
  }

  @override
  String get insightsCycleHistoryEntry => 'Korábbi ciklusok';

  @override
  String get homeEmptyTitle => 'Kezdjük a legutóbbi menstruációddal';

  @override
  String get homeEmptyBody =>
      'Érintsd meg a fenti gombot azon a napon, amikor a menstruációd elkezdődik. Két teljes ciklus után a Vera elkezdhet becslést adni — addig nem tesz úgy, mintha tudná.';

  @override
  String get homeEmptyBackdate => 'Már korábban elkezdődött';

  @override
  String get settingsAdPrivacyEntry => 'Hirdetési adatvédelmi beállítások';

  @override
  String a11yCycleRing(int day, int length) {
    return 'A ciklus $day. napja, kb. $length napból';
  }

  @override
  String a11yChartSummary(int count, String min, String max) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Diagram $count bejegyzéssel, $min és $max között',
      one: 'Diagram $count bejegyzéssel, $min és $max között',
    );
    return '$_temp0';
  }

  @override
  String a11yPhaseBar(int day, int length) {
    return 'A ciklus haladása: $day. nap, kb. $length napból';
  }

  @override
  String a11yFrequencyItem(String label, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count alkalom',
      one: '$count alkalom',
    );
    return '$label: $_temp0';
  }

  @override
  String get importTitle => 'Importálás másik alkalmazásból';

  @override
  String get importBody =>
      'Exportáld az előzményeidet a régi követő alkalmazásodból CSV-ként, majd válaszd ki itt a fájlt. Csak a dátumok és a vérzés erőssége kerül be — a tünetek és a hangulatok megnevezése alkalmazásonként eltér, és a Vera nem találgatja, mire gondoltál.';

  @override
  String get importPickFile => 'CSV-fájl kiválasztása';

  @override
  String importPreview(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count napnyi előzmény található',
      one: '$count napnyi előzmény található',
    );
    return '$_temp0';
  }

  @override
  String importSkipped(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count sort nem sikerült beolvasni, ezért kimarad',
      one: '$count sort nem sikerült beolvasni, ezért kimarad',
    );
    return '$_temp0';
  }

  @override
  String get importConfirm => 'Hozzáadás az előzményeimhez';

  @override
  String get importMergeNote =>
      'Az importált napok összefésülődnek. Azok a napok, amelyeket már rögzítettél a Verában, változatlanok maradnak.';

  @override
  String importDone(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count nap importálva',
      one: '$count nap importálva',
    );
    return '$_temp0';
  }

  @override
  String get importErrorEmpty => 'Ez a fájl üresnek tűnik.';

  @override
  String get importErrorNoDate => 'Nem található dátumoszlop ebben a fájlban.';

  @override
  String get settingsImportEntry => 'Importálás másik alkalmazásból';

  @override
  String get settingsHealthSyncLabel =>
      'Szinkronizálás az Apple Health / Health Connect felé';

  @override
  String get settingsHealthSyncBody =>
      'Csak a menstruációs vérzést, a testsúlyt és a bazális testhőmérsékletet írja a telefonod egészségügyi alkalmazásába. A tünetek, a hangulatok és a jegyzetek a Verában maradnak. Semmit nem olvas vissza.';

  @override
  String healthSyncBackfilled(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count nap elküldve az egészségügyi alkalmazásba',
      one: '$count nap elküldve az egészségügyi alkalmazásba',
    );
    return '$_temp0';
  }

  @override
  String get healthSyncDenied =>
      'Az engedélyt nem kapta meg, ezért a szinkronizálás kikapcsolva marad.';

  @override
  String get settingsDiagnosticsEntry => 'Diagnosztika';

  @override
  String get diagnosticsBody =>
      'Ha az alkalmazás hibásan működik, a technikai részletek ide kerülnek — kizárólag ezen az eszközön. Semmi nem megy sehová, hacsak nem te küldöd el, és előtte pontosan elolvashatod, mit küldenél.';

  @override
  String get diagnosticsEmpty =>
      'Nincs rögzített bejegyzés — nem észleltünk problémát.';

  @override
  String get diagnosticsShare => 'Küldés a fejlesztőnek';

  @override
  String get diagnosticsClear => 'Törlés';

  @override
  String get diagnosticsNoteLabel => 'Mi történt? (nem kötelező)';

  @override
  String get diagnosticsTechnicalDetail => 'Technikai részletek';

  @override
  String get unitHoursShort => 'ó';

  @override
  String get unitMinutesShort => 'p';

  @override
  String get unitHoursLong => 'óra';

  @override
  String get unitMinutesLong => 'perc';

  @override
  String get unitMilliliters => 'ml';

  @override
  String get unitKilograms => 'kg';

  @override
  String get calendarJumpTitle => 'Ugrás hónapra';

  @override
  String get calendarJumpYearLabel => 'Év';

  @override
  String get settingsAdPrivacyUnavailable =>
      'A hirdetés-személyre szabási beállítások a te régiódban nem érhetők el — az itteni hirdetések eleve nem személyre szabottak.';

  @override
  String get settingsGroupAppearance => 'Megjelenés';

  @override
  String get settingsGroupTracking => 'Követési beállítások';

  @override
  String get dayLogCustomTagsLabel => 'Saját követőim';

  @override
  String get customTagAddButton => 'Követő hozzáadása';

  @override
  String get customTagDialogTitle => 'Új követő';

  @override
  String get customTagDialogHint => 'pl. migrén, edzés, álmatlanság';

  @override
  String get customTagManageEntry => 'Követőim kezelése';

  @override
  String get customTagRenameTitle => 'Követő átnevezése';

  @override
  String get customTagDeleteTitle => 'Törlöd ezt a követőt?';

  @override
  String get customTagDeleteBody =>
      'Minden napról eltávolítjuk, ahol használtad. A többi bejegyzésed változatlan marad.';

  @override
  String get customTagEmpty => 'Még nincs saját követőd.';

  @override
  String get premiumLockedTitle => 'Premium funkció';

  @override
  String get premiumLockedAction => 'A Premium megtekintése';

  @override
  String get premiumBenefitCustomTrackers =>
      'Kövess bármit, a saját szavaiddal';

  @override
  String get premiumBenefitAdvancedInsights =>
      'Haladó elemzések: mi szokott történni, és mikor';

  @override
  String get premiumBenefitPersonalisation => 'Extra hátterek és társak';

  @override
  String get premiumBenefitAdvancedReminders =>
      'Emlékeztetők a saját beosztásod szerint';

  @override
  String get advancedInsightsTitle => 'Haladó elemzések';

  @override
  String get advancedInsightsEntry => 'Haladó elemzések';

  @override
  String get advancedInsightsNotEnough =>
      'Rögzíts három teljes ciklust, és itt megjelennek a mintázataid. Ennél kevesebbnél bármilyen „mintázat” csak véletlen lenne.';

  @override
  String get advancedInsightsPatternsTitle => 'Mikor szoktak jelentkezni';

  @override
  String advancedInsightsPatternLine(String label, String segment) {
    return '$label — leggyakrabban $segment';
  }

  @override
  String advancedInsightsPatternDetail(int count, int day) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count napon rögzítve, a ciklusod $day. napja körül',
      one: '$count napon rögzítve, a ciklusod $day. napja körül',
    );
    return '$_temp0';
  }

  @override
  String advancedInsightsNoPattern(String label) {
    return '$label — még nincs egyértelmű időzítés';
  }

  @override
  String get advancedInsightsTrendTitle => 'A ciklushossz az idő során';

  @override
  String advancedInsightsDriftLonger(String days, String cycles) {
    return 'A legkorábbi $cycles ciklusodat a legutóbbi $cycles ciklusoddal összevetve a friss ciklusok kb. $days nappal hosszabbak.';
  }

  @override
  String advancedInsightsDriftShorter(String days, String cycles) {
    return 'A legkorábbi $cycles ciklusodat a legutóbbi $cycles ciklusoddal összevetve a friss ciklusok kb. $days nappal rövidebbek.';
  }

  @override
  String advancedInsightsDriftStable(String cycles) {
    return 'A legkorábbi $cycles ciklusodat a legutóbbi $cycles ciklusoddal összevetve a ciklushosszod nagyjából változatlan maradt.';
  }

  @override
  String get advancedInsightsDriftNotEnough =>
      'Ha már megvan hat teljes ciklusod, a Vera összevetheti a legkorábbiakat a legutóbbiakkal, hogy látszódjon, elmozdul-e a ciklushosszod.';

  @override
  String get advancedInsightsMoodTitle => 'Hangulat a ciklus szakaszai szerint';

  @override
  String get advancedInsightsDisclaimer =>
      'Ezek pusztán annak a megszámolásai, amit rögzítettél, semmi több. Nem diagnózis, és az itt látható mintázat nem ok-okozati összefüggés.';

  @override
  String get segmentPeriod => 'a menstruációd alatt';

  @override
  String get segmentAfterPeriod => 'a menstruációd után';

  @override
  String get segmentMidCycle => 'a ciklus közepén';

  @override
  String get segmentBeforePeriod => 'a menstruációd előtt';

  @override
  String get customRemindersEntry => 'Saját emlékeztetőim';

  @override
  String get customRemindersTitle => 'Saját emlékeztetőim';

  @override
  String get customRemindersEmpty => 'Még nincs saját emlékeztetőd.';

  @override
  String get customRemindersAdd => 'Emlékeztető hozzáadása';

  @override
  String get customReminderLabelHint => 'pl. bevenni a tablettát, vizet inni';

  @override
  String get customReminderLockScreenNote =>
      'Az emlékeztető szövege megjelenik a zárképernyődön, ezért csak annyit írj bele, amennyit vállalsz.';

  @override
  String get customReminderDelete => 'Emlékeztető törlése';

  @override
  String get homeThemeDusk => 'Alkony';

  @override
  String get homeThemeMeadow => 'Rét';

  @override
  String get homeThemePetal => 'Szirom';

  @override
  String get homeThemeBloom => 'Virágpompa';

  @override
  String get homeThemeOcean => 'Óceán';

  @override
  String get homeThemeAutumn => 'Ősz';

  @override
  String get homeThemeNight => 'Éjszaka';

  @override
  String get mascotStar => 'Csillag';

  @override
  String get mascotLeaf => 'Levél';

  @override
  String get mascotCat => 'Macska';

  @override
  String get mascotRabbit => 'Nyúl';

  @override
  String get mascotBird => 'Madár';

  @override
  String get tipDetailWhatsHappening => 'Mi történik a testedben';

  @override
  String get tipDetailGeneralHeading => 'Általános javaslatok';

  @override
  String get tipDetailDisclaimer =>
      'Ez általános tájékoztatás, nem személyre szabott orvosi tanács. Minden test másképp reagál, és az, hogy valójában hogyan érzed magad, többet számít bárminél, ami itt szerepel. Ha valami aggaszt, beszélj szakemberrel.';

  @override
  String get phaseExplainerMenstrual =>
      'Azért vérzel, mert leválik a méhnyálkahártya. Az ösztrogén és a progeszteron a ciklus legalacsonyabb pontján van, ezért sokan fáradtabbnak és befelé fordulóbbnak érzik magukat az első napokban. A vérzés általában három-hét napig tart, és a legerősebb az elején. A görcsök a méh összehúzódásából erednek, amit a prosztaglandinok hajtanak — hormonszerű vegyületek, amelyek a nyálkahártya lebomlásakor szabadulnak fel, és emiatt jelentkezik egyeseknél egyszerre derékfájás vagy lazább széklet is. A vérzés vasat is felemészt, és ez magyarázza a fáradtság egy részét. A meleg, a mozgás és az alvás általában segít. Ha viszont a betét óránként átázik, ha a vérzés jóval túlmegy egy héten, vagy ha a fájdalom megakadályoz a hétköznapi dolgokban, azt érdemes orvossal megbeszélni ahelyett, hogy kivárnád.';

  @override
  String get phaseExplainerFollicular =>
      'A vérzés végeztével az ösztrogén újra emelkedni kezd. A petefészkekben tüszők csoportja érik, mindegyikben egy petesejt, és rendszerint csak egy szabadul fel. Az ösztrogén újraépíti az imént levált nyálkahártyát, és a legtöbben azt veszik észre, hogy vele együtt tér vissza az energia, a hangulat, a bőr állapota és az állóképesség. Ez egyben a ciklus leginkább változó szakasza emberenként és hónaponként — a stressz, a betegség, az utazás és az alvás többnyire itt mutatkozik meg azzal, hogy megnyújtja vagy lerövidíti. Ez az őszinte oka annak, hogy az előrejelzés tartomány és nem dátum: a ciklus második fele elég stabil, és ez a fele az, ami mozog.';

  @override
  String get phaseExplainerFertile =>
      'Az ösztrogén a csúcsa közelében jár, és a peteérés ezekre a napokra várható. A luteinizáló hormon kiugrása körülbelül egy-másfél nappal később indítja el a petesejt kilökődését. Maga a petesejt nagyjából 12–24 óráig marad életben, de a hímivarsejtek több napig is elélhetnek termékeny méhnyaknyákban — ezért számoljuk az ablakot több napban, nem egyben. A nyák jellemzően átlátszóvá, nyúlóssá és síkossá válik, kicsit olyanná, mint a nyers tojásfehérje; egyesek erősebb vágyat, érzékeny melleket vagy rövid, féloldali szúrást vesznek észre. Az energia gyakran a ciklus legmagasabb pontján van. Ne feledd: ez az ablak a saját előzményeidből számolt becslés, nem mérés, és nem fogamzásgátló módszer.';

  @override
  String get phaseExplainerLuteal =>
      'A peteérés után a kiürült tüszőből sárgatest lesz, és progeszteront kezd termelni, ami stabilan tartja a nyálkahártyát arra az esetre, ha terhesség ágyazódna be. Ha ez nem történik meg, a progeszteron és az ösztrogén meredeken zuhan, és megjön a menstruáció. A ciklusnak ez a fele a kiegyensúlyozottabb, általában 12–14 nap. A progeszteron kissé megemeli a nyugalmi hőmérsékletet — pontosan ezt a változást fogja meg a bazális hőmérő —, és lassíthatja az emésztést, ami magyarázza a puffadás egy részét. A végén jövő zuhanás váltja ki sokaknál a PMS-t: feszülő mell, étvágyváltozás, megszakadó alvás, fejfájás és hangulatingadozás, amelyek a vérzés megindulásával általában enyhülnek. Ha ezek a panaszok a hónapok többségében megzavarják a munkát vagy a kapcsolatokat, érdemes orvossal beszélni róluk.';

  @override
  String get phaseExplainerUnknown =>
      'Még nincs elég rögzített adat ahhoz, hogy megmondható legyen, melyik fázisban vagy. A Verának legalább két teljes ciklusra van szüksége — egy menstruációkezdetre, majd a következőre —, hogy kiszámolja a saját átlagodat és ingadozásodat, és inkább ezt mondja, mint hogy kitaláljon egy fázist. Közben semmi nem vész el: minden rögzített nap része annak az első számításnak, és a becslés szűkül, ahogy az előzmény gyarapszik. Addig az alábbi javaslatok általánosak, és a ciklus bármely pontján érvényesek.';

  @override
  String get tipFitnessDetailMenstrual =>
      'A kemény edzés az első napokban a legtöbbeknek nem tesz jót, és ez nem fegyelem kérdése — az energia tényleg alacsonyabb, és a vérzéssel távozó vas nehezebbé teszi az állóképességi munkát, mint amilyennek ugyanaz az edzés a múlt héten érződött. A séta, a lágy nyújtás, a helyreállító jóga és a légzőgyakorlatok javítják a vérkeringést, és tompíthatják a görcsöket; egyeseknél az egész hónapon át tartó rendszeres mozgás jobban csökkenti a görcsök erősségét, mint bármi, amit aznap tesznek. Ha jól érzed magad, semmi ok kerülni a kemény edzéseket: a vérzés nem indok abbahagyni a sportot, és sok sportoló épp ilyenkor versenyez. Néhány gyakorlati megjegyzés: a hosszú, megterhelő edzések az erős vérzésű napokon mélyíthetik a fáradtságot, meleg az alhasra indulás előtt kényelmesebbé teszi a mozgást, és a szokásosnál kicsit több folyadék segít az ilyenkori fejfájáson. Az edzést aszerint ítéld meg, milyen érzés közben, ne aszerint, milyen volt a legjobb heted.';

  @override
  String get tipFitnessDetailFollicular =>
      'Ahogy az ösztrogén emelkedik, a legtöbben erősebbnek és terhelhetőbbnek érzik magukat; ez általában a ciklus legjobb szakasza valami újat kezdeni, súlyt tenni rá vagy tempót emelni. Az izmok helyreállása itt viszonylag hatékony, így a kemény edzések jobban beépülnek, és kevesebb elhúzódó izomlázat hagynak. Jó ablak arra is, ami tiszta fejet kíván, nem csak erős testet — új mozdulatot tanulni, technikát javítani, vagy hosszabb távot menni, mint eddig. Két fenntartást érdemes megtartani: fokozatosan haladj, mert a sok energia nem jelent nulla sérülési kockázatot, és a túlterheléses sérülések többsége jó héten kezdődik, nem rosszon. És védd az alvásodat — az alkalmazkodás a regenerálódás alatt történik, nem edzés közben.';

  @override
  String get tipFitnessDetailFertile =>
      'Az energia és a motiváció rendszerint a csúcson van, így a megterhelő edzések jól ülnek — az egyéni csúcsok gyakran ide esnek. Egyes kutatások szerint az ízületek a peteérés körül kissé lazábbak; a gyakorlati hatásról vita van, de a hosszabb bemelegítés olcsó óvintézkedés az éles irányváltásokkal, ugrásokkal és érkezésekkel járó sportokban. A testhőmérséklet a ciklus második feléhez képest még alacsony, így a meleg itt kevésbé korlátoz, mint egy-két hét múlva fog. Rövid, féloldali szúrás az alhasban a peteérés körül gyakori, és általában órákon belül elmúlik. Ha viszont a fájdalom erős, féloldali és tartós, láz kíséri, vagy ájulásérzés van, állj le, és nézesd meg, ahelyett hogy végigedzenéd.';

  @override
  String get tipFitnessDetailLuteal =>
      'Ahogy közeledik a menstruáció, az energia csökkenhet, a pulzus ugyanannál a terhelésnél magasabb lehet, és a regenerálódás elhúzódhat. Ez várható ingadozás, nem visszaesés, és nem törli az elmúlt két hét munkáját. A progeszteron kissé megemeli a nyugalmi hőmérsékletet, és megnehezíti a hőleadást, ezért a meleg vagy párás edzések itt aránytalanul nehéznek érződnek — segít, ha korábban vagy később edzel a napban, és ha többet iszol, mint amennyi szükségesnek tűnik. A közepes edzések, az erőmunkád kissé könnyített változata és a séta általában fenntarthatóbbak. Puffadás és mellérzékenység mellett egy jól tartó sportmelltartó és hosszabb bemelegítés valódi különbséget jelent. Ha a hangulat mélyen van, inkább rövid és könnyű legyen az edzés, mint hogy teljesen kimaradjon — a küszöb, ahol már számít, alacsonyabban van, mint amilyennek érződik.';

  @override
  String get tipFitnessDetailUnknown =>
      'A fázis ismerete nélkül is segít a mozgás bármikor: az általános ajánlás heti nagyjából 150 perc közepes intenzitású tevékenység, a napok többségére elosztva, plusz heti kétszer erősítés — és ez a minta majdnem mindenkinek többet ad, mint az alkalmi, nagyon intenzív edzések. A rendszeresség többet nyom a latban, mint az intenzitás, és a legjobb edzés az, amit jövő héten tényleg megismételsz. Igazítsd ahhoz, hogyan érzed magad: fáradt napokon a séta is számít, és egy megcsinált rövid edzés többet ér egy kihagyott hosszúnál. Ha rögzítesz néhány ciklust, itt fázisra szabott javaslatok jelennek meg.';

  @override
  String get tipNutritionDetailMenstrual =>
      'A vérzés vasat visz el; a vörös hús, a lencse, a csicseriborsó, a sötétzöld leveles zöldségek és a melasz segít pótolni. A növényi vas jelentősen jobban szívódik fel C-vitaminnal együtt — citromot facsarni a lencsefőzelékre ennek a legegyszerűbb módja, és egy paradicsomsaláta mellé ugyanezt teszi. A tea és a kávé étkezés közben a tanninok miatt csökkenti a vasfelszívódást, így elég körülbelül egy órát hagyni köztük; egyikről sem kell lemondanod. Az elegendő víz enyhítheti a vérzéssel járó fáradtságot és fejfájást, a magnéziumban gazdag ételek pedig — diófélék, magvak, sötét leveles zöldek — egyeseknél segítenek a görcsökön. Azokon a napokon, amikor az emésztés lassú, a kisebb, gyakori étkezések jobban esnek a bőségeseknél. Ha a menstruáció körül gyakran érzel légszomjat, szédülést vagy szokatlan kimerültséget, azt érdemes orvosnak megemlíteni — a vashiány gyakori, könnyen ellenőrizhető, és nem olyasmi, amit egy alkalmazásnak kellene megállapítania.';

  @override
  String get tipNutritionDetailFollicular =>
      'Ahogy visszatér az energia, a test építkező üzemmódban van: elegendő fehérje, teljes értékű gabona és zöldség támogatja ezt, és ebben a fázisban az étvágy általában a legkiegyensúlyozottabb és a legkönnyebben kezelhető. Van értelme a vérzés után is tovább tölteni a vasraktárakat, ahelyett hogy ezt csak a menstruációs hét feladatának tekintenéd — a raktárak hetek alatt épülnek fel, nem napok alatt. Az étkezések kihagyásának elkerülése itt egyszerűbb, és így kiegyensúlyozottabban lépsz a következő fázis étvágyingadozásaiba. Ha változtatni akarsz azon, ahogy eszel, ez a szakasz általában barátságosabb a kezdéshez, mint a menstruáció előtti hét, amikor a sóvárgás és a lehangoltság minden új szokást nehezebbnek mutat, mint amilyen.';

  @override
  String get tipNutritionDetailFertile =>
      'Itt nincs szükség különleges étrendre; a kiegyensúlyozott étkezések és az elegendő víz teszik a munka nagy részét. Egyesek puffadtnak érzik magukat a peteérés körül, ami általában hormonális és múló, nem pedig annak a következménye, amit ettek. Az étvágy némelyeknél kissé csökken, másoknál nő — mindkettő megszokott. A fehérje és a rost megtartása az étkezésekben egyenletesen tartja az energiát a hónap gyakran legmozgalmasabb szakaszában. Ha terhességet tervezel, ez ésszerű pillanat orvostól kérdezni a folsavról, amit általában a fogantatás előtt ajánlanak, nem utána — de ez vele folytatott beszélgetés, nem tanács, amit egy alkalmazásnak kellene adnia.';

  @override
  String get tipNutritionDetailLuteal =>
      'A megnövekedett étvágy és az édesség utáni vágy, ahogy a progeszteron emelkedik, nagyon gyakori; hormonális elmozdulás ez, nem akaraterő kérdése, és a test ebben a fázisban tényleg valamivel több energiát használ. Fehérje és rost hozzáadása az étkezésekhez egyenletesebben tartja a vércukrot, és sokkal jobban tompítja a sóvárgást, mint ha megpróbálnád figyelmen kívül hagyni — egy laktató dologgal megválaszolt sóvárgás általában hamarabb ér véget, mint amelyikkel egy órán át küzdesz. Kevesebb só és több víz enyhítheti a puffadást; fordítottnak hangzik, de nem az: jól hidratálva a test kevesebbet tart vissza. A magnéziumban gazdag ételek (mandula, dió, sötét leveles zöldek, étcsokoládé) egyeseknél csökkentik a görcsöket és a feszültséget. A koffein visszafogása dél után segít e fázis megszakadó alvásán, és az alkoholra is érdemes figyelni, mert épp azon a ponton darabolja szét az alvást, ahol az amúgy is felszínesebb.';

  @override
  String get tipNutritionDetailUnknown =>
      'Bármelyik fázisban is vagy, ugyanazok segítenek a legtöbbet: rendszeres étkezés, elegendő fehérje, sok zöldség, elegendő víz és vasban gazdag ételek. Mivel a vérzés vasat visz el, azokon a napokon elég valamivel jobban figyelni rá — nem kell külön étrend a hónap minden hetére. A nagyjából állandó időpontokban való étkezés többet tesz az egyenletes energiáért, mint bármelyik egyes élelmiszer, és semmit sem kell kihagyni ahhoz, hogy egy ciklus egészséges legyen. Ha rögzítesz néhány ciklust, itt fázisra szabott javaslatok jelennek meg.';

  @override
  String get tipSleepLabel => 'Alvás';

  @override
  String get tipSleepMenstrual =>
      'A görcsök és a kellemetlenség megszakíthatják az alvást; egy meleg zuhany vagy melegítőpárna lefekvés előtt segíthet.';

  @override
  String get tipSleepFollicular =>
      'A növekvő energiával sokan éberebbnek érzik magukat — a tényleges alvásigény viszont nem igazán csökken.';

  @override
  String get tipSleepFertile =>
      'A testhőmérséklet enyhe emelkedése a peteérés körül kicsit megnehezítheti az elalvást; hűvösebb szoba segíthet.';

  @override
  String get tipSleepLuteal =>
      'A progeszteron enyhén emeli a nyugalmi hőmérsékletet, és könnyebbé teheti a mély alvást; hűvös, sötét szoba és rendszeres lefekvési idő segít itt a legtöbbet.';

  @override
  String get tipSleepUnknown =>
      'Az alvás minősége gyakran változik a ciklus során — általában a legtörékenyebb közvetlenül a menstruáció előtt és alatt. A rendszeres lefekvési idő a legmegbízhatóbb alap, fázistól függetlenül.';

  @override
  String get tipSleepDetailMenstrual =>
      'Menstruáció alatt az alvás gyakran töredezettebb — görcsök, kellemetlenség, és néhányaknál gyakoribb vécézés éjszaka felébreszthet. Meleg zuhany, melegítőpárna vagy enyhe nyújtás lefekvés előtt enyhítheti a görcsöket. Ha fájdalomcsillapítót szedsz, az időzítése úgy, hogy hatása lefedje az éjszaka első részét, védheti a korai alvást. Ha az alvás továbbra is nehéz, ez normális.';

  @override
  String get tipSleepDetailFollicular =>
      'A növekvő ösztrogénnel sokan éberebbnek és energikusabbnak érzik magukat, ami kevesebb alvásigénynek tűnhet. Ez nem teljesen pontos — csak az éberség jön könnyebben. A rendszeres lefekvési idő megtartása itt később kifizetődik, amikor az alvás más fázisokban törékenyebbé válik.';

  @override
  String get tipSleepDetailFertile =>
      'A testhőmérséklet enyhe emelkedése a peteérés körül kicsit megnehezítheti az elalvást, mivel a test természetesen lehűlni akar alvás előtt. Hűvösebb szoba, könnyebb takaró vagy meleg zuhany lefekvés előtt kiegyenlítheti ezt. Akik nagyobb vágyat vagy társasági energiát tapasztalnak ebben az időszakban, szándékosan is fennmaradhatnak tovább.';

  @override
  String get tipSleepDetailLuteal =>
      'A peteérés után emelkedő progeszteron enyhén megemeli a nyugalmi hőmérsékletet, ami könnyebbé teheti a mély alvást — néha enyhe hőhullámként, néha csak kevésbé pihentető alvásként. A menstruáció közeledtével premenstruációs feszültség is társulhat ehhez. Hűvös, sötét szoba, kevesebb képernyőidő lefekvés előtt és rendszeres lefekvési idő segít itt a legtöbbet.';

  @override
  String get tipSleepDetailUnknown =>
      'Még nincs elég adat a fázis meghatározásához, de az alvásminőség változása a ciklus során gyakori mintázat — általában törékenyebb közvetlenül a menstruáció előtt és alatt, stabilabb az első félben. A legmegbízhatóbb alap fázistól függetlenül: rendszeres lefekvési és ébredési idő, kevesebb képernyőidő lefekvés előtt, hűvös, sötét szoba.';
}
