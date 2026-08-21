// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Polish (`pl`).
class AppLocalizationsPl extends AppLocalizations {
  AppLocalizationsPl([String locale = 'pl']) : super(locale);

  @override
  String get appTitle => 'Vera';

  @override
  String get actionSkip => 'Pomiń';

  @override
  String get actionContinue => 'Dalej';

  @override
  String get actionDone => 'Gotowe';

  @override
  String get actionCancel => 'Anuluj';

  @override
  String get actionClear => 'Wyczyść';

  @override
  String get actionDelete => 'Usuń';

  @override
  String get actionEnable => 'Włącz';

  @override
  String get commonIDontKnow => 'Nie wiem';

  @override
  String get commonYes => 'Tak';

  @override
  String get commonNo => 'Nie';

  @override
  String get commonNotSure => 'Nie mam pewności';

  @override
  String get pinSetupTitle => 'Ustaw PIN';

  @override
  String get pinSetupEnterPrompt =>
      'Wybierz 6-cyfrowy PIN, aby zablokować aplikację';

  @override
  String get pinSetupConfirmPrompt => 'Wpisz go ponownie, aby potwierdzić';

  @override
  String get pinSetupMismatch =>
      'Kody się nie zgadzają — spróbujmy jeszcze raz';

  @override
  String get pinSetupBiometricTitle => 'Szybsze odblokowanie?';

  @override
  String get pinSetupBiometricBody =>
      'Do odblokowania możesz też użyć odcisku palca lub twarzy — PIN nadal działa jako rozwiązanie zapasowe.';

  @override
  String get lockScreenTitle => 'Zablokowane';

  @override
  String get lockScreenEnterPin => 'Wpisz swój PIN';

  @override
  String get lockScreenWrongPin => 'Ten PIN się nie zgadza';

  @override
  String get lockScreenUseBiometrics => 'Użyj biometrii';

  @override
  String get lockScreenUseFaceId => 'Użyj Face ID';

  @override
  String get lockScreenUseFingerprint => 'Użyj odcisku palca';

  @override
  String get lockScreenForgotPin => 'Nie pamiętasz PIN-u?';

  @override
  String get lockScreenForgotPinChoiceTitle => 'Jak chcesz go zresetować?';

  @override
  String get lockScreenResetViaDevice => 'Zweryfikuj tym urządzeniem';

  @override
  String get lockScreenResetViaDeviceBody =>
      'Twoje dane pozostają. Wystarczy zweryfikować się własną blokadą telefonu — Face ID, odciskiem palca lub kodem.';

  @override
  String get lockScreenResetViaDeviceReason =>
      'Zweryfikuj się, aby ustawić nowy PIN';

  @override
  String lockScreenThrottled(int seconds) {
    return 'Za dużo prób. Spróbuj ponownie za $seconds s';
  }

  @override
  String get lockScreenEraseTitle => 'Usunąć wszystkie dane?';

  @override
  String get lockScreenEraseBody =>
      'To trwale usuwa wszystko z tego urządzenia. Nie ma konta ani kopii na serwerze, więc tej operacji nie da się cofnąć.';

  @override
  String get lockScreenEraseConfirm => 'Usuń wszystko';

  @override
  String get onboardingPrivacyTitle => 'Witaj';

  @override
  String get onboardingPrivacyBody =>
      'Dane o Twoim cyklu pozostają wyłącznie na tym urządzeniu, w formie zaszyfrowanej. Nie ma konta ani synchronizacji w chmurze — nic, co zapiszesz, nie jest nigdzie wysyłane. Klucz znajduje się w bezpiecznym module telefonu, a wszystko możesz wyeksportować lub usunąć, kiedy tylko chcesz.';

  @override
  String get onboardingLastPeriodTitle =>
      'Kiedy zaczęła się Twoja ostatnia miesiączka?';

  @override
  String get onboardingLastPeriodBody =>
      'To pomoże nam zacząć — zawsze możesz to później poprawić w kalendarzu.';

  @override
  String get onboardingPickDate => 'Wybierz datę';

  @override
  String get onboardingCycleLengthTitle => 'Ile zwykle trwa Twój cykl?';

  @override
  String get onboardingCycleLengthBody =>
      'Przybliżona liczba w zupełności wystarczy. Prawdziwe szacunki zaczniemy podawać, gdy zobaczymy kilka pełnych cykli.';

  @override
  String get onboardingPeriodLengthTitle =>
      'Ile dni zwykle trwa Twoja miesiączka?';

  @override
  String get onboardingPeriodLengthBody =>
      'Na tej podstawie uzupełnimy ostatnią miesiączkę, żeby nie zaczynać od zera.';

  @override
  String get onboardingDaysUnit => 'dni';

  @override
  String get onboardingGoalTitle => 'Co Cię tu sprowadza?';

  @override
  String get onboardingGoalBody =>
      'To pomaga nam pokazać najpierw właściwe rzeczy — zdanie możesz zmienić w każdej chwili w Ustawieniach.';

  @override
  String get goalTrackPeriod => 'Śledzenie miesiączki';

  @override
  String get goalTryingToConceive => 'Starania o dziecko';

  @override
  String get goalPregnancyTracking => 'Śledzenie ciąży';

  @override
  String get onboardingRegularityTitle =>
      'Czy Twoje miesiączki są zwykle regularne?';

  @override
  String get onboardingRegularityBody =>
      'Nie ma tu złej odpowiedzi — to tylko pomaga nam trochę lepiej poznać Twój organizm.';

  @override
  String get onboardingCrampsTitle => 'Czy zwykle miewasz bolesne skurcze?';

  @override
  String get onboardingCrampsBody =>
      'Zadbamy o to, żeby w takie dni łatwo było zapisać swoje samopoczucie.';

  @override
  String get onboardingBirthYearTitle => 'W którym roku się urodziłaś?';

  @override
  String get onboardingBirthYearBody =>
      'Tylko dla pełniejszego obrazu — nigdy nie służy do żadnej prognozy.';

  @override
  String get onboardingPmsTitle => 'Czy zwykle coś pojawia się wcześniej?';

  @override
  String get onboardingPmsBody =>
      'Wybierz tyle, ile pasuje. Nigdzie się to nie zapisuje, nie ma złej odpowiedzi.';

  @override
  String get onboardingNotificationTitle => 'Włączyć delikatne przypomnienia?';

  @override
  String get onboardingNotificationBody =>
      'Możemy dać znać, zanim spodziewana jest miesiączka.';

  @override
  String get onboardingNotificationMockTitle =>
      'Twoja miesiączka może się niedługo zacząć';

  @override
  String get onboardingNotificationMockBody => 'Na podstawie zapisanych cykli';

  @override
  String get onboardingNotificationAllow => 'Włącz przypomnienia';

  @override
  String get onboardingNotificationNotNow => 'Nie teraz';

  @override
  String get onboardingBuildingPlanTitle =>
      'Przygotowujemy wszystko dla Ciebie';

  @override
  String get onboardingBuildingPlanStep1 =>
      'Zabezpieczanie danych na tym urządzeniu';

  @override
  String get onboardingBuildingPlanStep2 => 'Zapisywanie preferencji';

  @override
  String get onboardingBuildingPlanStep3 => 'Przygotowywanie kalendarza';

  @override
  String get onboardingBuildingPlanDone => 'Wszystko gotowe';

  @override
  String get navHome => 'Start';

  @override
  String get navCalendar => 'Kalendarz';

  @override
  String get navInsights => 'Analizy';

  @override
  String get navSettings => 'Ustawienia';

  @override
  String get navReminders => 'Przypomnienia';

  @override
  String get navProfile => 'Profil';

  @override
  String get navTrack => 'Zapisz';

  @override
  String homeCycleDayLabel(int day) {
    return 'Dzień $day';
  }

  @override
  String get homeNoCycleYet => 'Nie zapisano jeszcze żadnej miesiączki';

  @override
  String get homePhaseMenstrual => 'Miesiączka';

  @override
  String get homePhaseFollicular => 'Faza folikularna';

  @override
  String get homePhaseFertileWindow => 'Szacowane okno płodne';

  @override
  String get homePhaseLuteal => 'Faza lutealna';

  @override
  String get homePhaseUnknown => 'Za mało bieżących danych';

  @override
  String get homePredictionInsufficientTitle => 'Wciąż za mało danych';

  @override
  String get homePredictionInsufficientBody =>
      'Zapisz kolejną miesiączkę, a zaczniemy szacować.';

  @override
  String homePredictionRangeLabel(String start, String end) {
    return '$start – $end';
  }

  @override
  String get homeConfidenceHigh => 'Wysoka pewność';

  @override
  String get homeConfidenceMedium => 'Średnia pewność';

  @override
  String get homeConfidenceLow => 'Niska pewność';

  @override
  String get homeIrregularNote =>
      'Długość Twojego cyklu wahała się ostatnio bardziej niż zwykle. Jeśli to dla Ciebie coś nowego, warto o tym wspomnieć podczas wizyty kontrolnej.';

  @override
  String get homeFertileWindowDisclaimer =>
      'Na podstawie typowego przebiegu cyklu — to nie jest metoda antykoncepcji.';

  @override
  String get homePeriodStartedButton => 'Miesiączka zaczęła się dzisiaj';

  @override
  String get homePeriodStartedSnackbar =>
      'Zapisano — miesiączka zaczęła się dzisiaj';

  @override
  String get actionUndo => 'Cofnij';

  @override
  String get comingSoon => 'Wkrótce';

  @override
  String get dayLogFlowLabel => 'Krwawienie';

  @override
  String get flowSpotting => 'Plamienie';

  @override
  String get flowLight => 'Słabe';

  @override
  String get flowMedium => 'Umiarkowane';

  @override
  String get flowHeavy => 'Obfite';

  @override
  String get flowNone => 'Brak';

  @override
  String get dayLogSymptomsLabel => 'Objawy';

  @override
  String get symptomCramps => 'Bolesne skurcze';

  @override
  String get symptomHeadache => 'Ból głowy';

  @override
  String get symptomBloating => 'Wzdęcia';

  @override
  String get symptomBreastTenderness => 'Tkliwość piersi';

  @override
  String get symptomAcne => 'Trądzik';

  @override
  String get symptomFatigue => 'Zmęczenie';

  @override
  String get symptomNausea => 'Nudności';

  @override
  String get symptomBackPain => 'Ból pleców';

  @override
  String get symptomAppetiteChange => 'Zmiana apetytu';

  @override
  String get symptomSleepTrouble => 'Problemy ze snem';

  @override
  String get symptomPelvicPain => 'Ból w podbrzuszu';

  @override
  String get symptomDizziness => 'Zawroty głowy';

  @override
  String get symptomMigraine => 'Migrena';

  @override
  String get symptomHighFever => 'Wysoka gorączka';

  @override
  String get symptomNeckPain => 'Ból szyi';

  @override
  String get symptomShoulderPain => 'Ból barku';

  @override
  String get symptomLimbPain => 'Ból kończyn';

  @override
  String get symptomMuscleAche => 'Ból mięśni';

  @override
  String get symptomChills => 'Dreszcze';

  @override
  String get symptomNightSweats => 'Nocne poty';

  @override
  String get symptomHotFlashes => 'Uderzenia gorąca';

  @override
  String get symptomWeightGain => 'Przyrost wagi';

  @override
  String get symptomConstipation => 'Zaparcie';

  @override
  String get symptomDiarrhea => 'Biegunka';

  @override
  String get symptomIndigestion => 'Niestrawność';

  @override
  String get symptomGasPain => 'Ból od wzdęć';

  @override
  String get symptomFeelingUnwell => 'Złe samopoczucie';

  @override
  String get symptomItching => 'Swędzenie';

  @override
  String get symptomTroubleFocusing => 'Trudności z koncentracją';

  @override
  String get symptomForgetfulness => 'Zapominalstwo';

  @override
  String get symptomGroupHead => 'Głowa';

  @override
  String get symptomGroupBody => 'Ciało';

  @override
  String get symptomGroupAbdomen => 'Brzuch';

  @override
  String get symptomGroupGeneral => 'Ogólne';

  @override
  String get symptomGroupCognitive => 'Poznawcze';

  @override
  String get dayLogMoodLabel => 'Nastrój';

  @override
  String get moodCalm => 'Spokój';

  @override
  String get moodAnxious => 'Niepokój';

  @override
  String get moodIrritable => 'Rozdrażnienie';

  @override
  String get moodLow => 'Obniżony nastrój';

  @override
  String get moodEnergetic => 'Przypływ energii';

  @override
  String get moodHappy => 'Radość';

  @override
  String get moodContent => 'Zadowolenie';

  @override
  String get moodSad => 'Smutek';

  @override
  String get moodDepressed => 'Przygnębienie';

  @override
  String get moodEmotional => 'Wrażliwość emocjonalna';

  @override
  String get moodExcited => 'Podekscytowana';

  @override
  String get moodHopeful => 'Pełna nadziei';

  @override
  String get moodProud => 'Dumna';

  @override
  String get moodDisappointed => 'Rozczarowana';

  @override
  String get moodConfident => 'Pewna siebie';

  @override
  String get moodSurprised => 'Zaskoczona';

  @override
  String get moodIndifferent => 'Obojętna';

  @override
  String get moodPeaceful => 'Spokojna';

  @override
  String get moodInLove => 'Zakochana';

  @override
  String get moodShy => 'Nieśmiała';

  @override
  String get moodPlayful => 'Figlarna';

  @override
  String get moodExhausted => 'Wyczerpana';

  @override
  String get moodLonely => 'Samotna';

  @override
  String get moodOverwhelmed => 'Przytłoczona';

  @override
  String get moodGrateful => 'Wdzięczna';

  @override
  String get moodNostalgic => 'Nostalgiczna';

  @override
  String get dayLogNoteLabel => 'Notatka';

  @override
  String get dayLogNoteHint => 'Wszystko, co chcesz zapamiętać z dzisiaj';

  @override
  String get dayLogOptionalTrackersLabel => 'Opcjonalne parametry';

  @override
  String get dayLogSexualActivityLabel => 'Aktywność seksualna';

  @override
  String get sexLifeNone => 'Nic';

  @override
  String get sexLifeUnprotected => 'Seks bez zabezpieczenia';

  @override
  String get sexLifeProtected => 'Seks z zabezpieczeniem';

  @override
  String get sexLifeMasturbation => 'Masturbacja';

  @override
  String get sexLifeNoOrgasm => 'Bez orgazmu';

  @override
  String get sexLifeOrgasm => 'Orgazm';

  @override
  String get sexLifeHighDesire => 'Duża ochota';

  @override
  String get dayLogBbtLabel => 'Podstawowa temperatura ciała';

  @override
  String get dayLogMucusLabel => 'Śluz szyjkowy';

  @override
  String get mucusDry => 'Sucho';

  @override
  String get mucusSticky => 'Kleisty';

  @override
  String get mucusCreamy => 'Kremowy';

  @override
  String get mucusWatery => 'Wodnisty';

  @override
  String get mucusEggWhite => 'Jak białko jaja';

  @override
  String get dayLogSavedIndicator => 'Zapisano';

  @override
  String get homeOpenTodayLog => 'Dodaj szczegóły dzisiejszego dnia';

  @override
  String get calendarLegendActual => 'Zapisana miesiączka';

  @override
  String get calendarLegendPredicted => 'Przewidywane okno';

  @override
  String get calendarLegendFertile => 'Szacowane okno płodne';

  @override
  String get calendarLegendOvulation => 'Szacowana owulacja';

  @override
  String get dayDetailFertileTitle => 'W szacowanym oknie płodnym';

  @override
  String get dayDetailOvulationTitle => 'Szacowany dzień owulacji';

  @override
  String get dayDetailOvulationBody =>
      'W okolicach tego dnia zajście w ciążę jest zwykle bardziej prawdopodobne, sądząc po typowym przebiegu cyklu — to szacunek, a nie pewnik.';

  @override
  String get insightsCyclesLoggedLabel => 'Zapisane cykle';

  @override
  String get insightsAveragePeriodLengthLabel => 'Średnia długość miesiączki';

  @override
  String get insightsAverageCycleLengthLabel => 'Średnia długość cyklu';

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
      other: 'Waha się o około $daysString dnia',
      many: 'Waha się o około $daysString dni',
      few: 'Waha się o około $daysString dni',
      one: 'Waha się o około $daysString dzień',
    );
    return '$_temp0';
  }

  @override
  String get insightsNotEnoughDataTitle => 'Wciąż za mało danych';

  @override
  String get insightsNotEnoughDataBody =>
      'Zapisz kilka pełnych cykli, a Twoje średnie pojawią się tutaj.';

  @override
  String get insightsSymptomFrequencyTitle => 'Objawy według dnia cyklu';

  @override
  String get insightsNoSymptomsLogged => 'Nie zapisano jeszcze żadnych objawów';

  @override
  String get settingsLanguageLabel => 'Język';

  @override
  String get settingsLanguageSystem => 'Język systemu';

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
  String get tourSkip => 'Pomiń';

  @override
  String get tourNext => 'Dalej';

  @override
  String get tourStart => 'Zaczynajmy';

  @override
  String get tourHomeTitle => 'Strona główna';

  @override
  String get tourHomeBody =>
      'Zobacz od razu, gdzie dziś jesteś — dzień cyklu, ile zostało do szacowanego okna i twój towarzysz są zawsze tutaj.';

  @override
  String get tourCalendarTitle => 'Kalendarz';

  @override
  String get tourCalendarBody =>
      'Zobacz swoje minione i nadchodzące cykle w kalendarzu. Dotknij dowolnego dnia, aby otworzyć jego wpis.';

  @override
  String get tourTrackTitle => 'Zapisz';

  @override
  String get tourTrackBody =>
      'Przycisk + na środku otwiera dzisiejszy wpis z dowolnego miejsca — przepływ, objawy, nastrój i więcej.';

  @override
  String get tourRemindersTitle => 'Przypomnienia';

  @override
  String get tourRemindersBody =>
      'Ustaw przypomnienia o nadchodzącej miesiączce, lekach lub piciu wody — wszystko zostaje w telefonie i nigdzie nie jest wysyłane.';

  @override
  String get tourProfileTitle => 'Profil';

  @override
  String get tourProfileBody =>
      'Znajdź tu swoje statystyki, wszystko, co śledzisz, i swoje ustawienia.';

  @override
  String get settingsWeekStartLabel => 'Tydzień zaczyna się od';

  @override
  String get settingsWeekStartMonday => 'Poniedziałek';

  @override
  String get settingsWeekStartSunday => 'Niedziela';

  @override
  String get settingsTemperatureUnitLabel => 'Jednostka temperatury';

  @override
  String get settingsTemperatureCelsius => 'Celsjusz';

  @override
  String get settingsTemperatureFahrenheit => 'Fahrenheit';

  @override
  String get settingsRemindersLabel => 'Przypominaj przed miesiączką';

  @override
  String get remindersScreenTitle => 'Przypomnienia';

  @override
  String get reminderDetailNotification => 'Powiadomienie';

  @override
  String get reminderDetailAlert => 'Alarm';

  @override
  String get reminderDetailAlertToday => 'Tego samego dnia';

  @override
  String get reminderDetailTime => 'Czas';

  @override
  String get reminderDetailMessage => 'Wiadomość';

  @override
  String get reminderDetailMessageEditTitle => 'Edytuj wiadomość';

  @override
  String get reminderDetailMessageHint => 'Napisz własną wiadomość';

  @override
  String reminderDetailAlertDaysBefore(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count dnia wcześniej',
      many: '$count dni wcześniej',
      few: '$count dni wcześniej',
      one: '$count dzień wcześniej',
    );
    return '$_temp0';
  }

  @override
  String optionsShowMore(int count) {
    return '+$count więcej';
  }

  @override
  String get optionsShowLess => 'Pokaż mniej';

  @override
  String get trackerHistoryEntry => 'Historia';

  @override
  String get actionSend => 'Wyślij';

  @override
  String get actionRemove => 'Usuń';

  @override
  String get feedbackEntry => 'Opinia';

  @override
  String get cloudBackupEntry => 'Kopia zapasowa z kontem';

  @override
  String get cloudBackupTitle => 'Kopia zapasowa z kontem';

  @override
  String get cloudBackupNotConfiguredTitle =>
      'Niedostępne jeszcze w tej wersji';

  @override
  String get cloudBackupNotConfiguredBody =>
      'Kopia zapasowa w chmurze wymaga usługi kont, która nie została jeszcze skonfigurowana dla tej wersji. Nic tutaj nie może być używane, dopóki nie zostanie.';

  @override
  String get cloudBackupIntro1Title => 'Nigdy nie trać historii';

  @override
  String get cloudBackupIntro1Body =>
      'Twoja historia cyklu pozostaje bezpieczna, nawet jeśli zgubisz telefon albo przesiądziesz się na nowy.';

  @override
  String get cloudBackupIntro2Title => 'Tylko ty możesz ją otworzyć';

  @override
  String get cloudBackupIntro2Body =>
      'Twoja kopia zapasowa jest szyfrowana hasłem, zanim jeszcze opuści twój telefon — my nie możemy jej odczytać, nikt inny też nie.';

  @override
  String get cloudBackupIntro3Title => 'Przywróć w kilka sekund';

  @override
  String get cloudBackupIntro3Body =>
      'Zaloguj się na nowym urządzeniu i odzyskaj swoją historię tym samym hasłem.';

  @override
  String get cloudBackupSignedInTitle => 'Zalogowano';

  @override
  String get cloudBackupUploadButton => 'Wykonaj kopię teraz';

  @override
  String get cloudBackupDownloadButton => 'Przywróć z chmury';

  @override
  String get cloudBackupUploadSuccess => 'Zapisano kopię na twoim koncie';

  @override
  String get cloudBackupNoBackupFound =>
      'Nie znaleziono jeszcze kopii zapasowej w chmurze dla tego konta.';

  @override
  String get partnerModeEntry => 'Tryb partnera';

  @override
  String get partnerModeTitle => 'Tryb partnera';

  @override
  String get partnerModeNotConfiguredTitle =>
      'Niedostępne jeszcze w tej wersji';

  @override
  String get partnerModeNotConfiguredBody =>
      'Tryb partnera wymaga usługi kont, która nie została jeszcze skonfigurowana dla tej wersji. Nic tutaj nie może być używane, dopóki nie zostanie.';

  @override
  String get partnerModeHeroTitle =>
      'Dziel się odrobiną, na własnych warunkach';

  @override
  String get partnerModeHeroBody =>
      'Połącz się z partnerem i udostępniaj tylko to, co włączysz poniżej — nigdy całej historii, nigdy automatycznie.';

  @override
  String get partnerModeSignInGoogle => 'Kontynuuj z Google';

  @override
  String get partnerModeSignInApple => 'Kontynuuj z Apple';

  @override
  String get partnerModeFaqTitle => 'Zanim się zalogujesz';

  @override
  String get partnerModeFaq1Q => 'Co tak naprawdę zobaczy mój partner?';

  @override
  String get partnerModeFaq1A =>
      'Tylko pola, które włączysz w Trybie partnera, i tylko twój bieżący stan — nigdy zapisaną historię, ani niczego, czym wyraźnie się nie podzieliłaś.';

  @override
  String get partnerModeFaq2Q => 'Czy mogę to później wyłączyć?';

  @override
  String get partnerModeFaq2A =>
      'Tak. Rozłączenie natychmiast kończy udostępnianie dla was obojga, a dowolny pojedynczy przełącznik możesz wyłączyć w każdej chwili bez rozłączania.';

  @override
  String get partnerModeFaq3Q => 'Czy mój partner potrzebuje tej aplikacji?';

  @override
  String get partnerModeFaq3A =>
      'Tak — loguje się w ten sam sposób i łączy się kodem, który mu wyślesz.';

  @override
  String get partnerModeNotPairedTitle => 'Jeszcze nie połączono';

  @override
  String get partnerModeNotPairedBody =>
      'Zaproś partnera jednorazowym kodem albo wpisz kod, który od niego dostałaś.';

  @override
  String get partnerModeInviteButton => 'Zaproś mojego partnera';

  @override
  String get partnerModeEnterCodeButton => 'Wpisz kod';

  @override
  String get partnerModeSignOut => 'Wyloguj się';

  @override
  String get partnerModePairedTitle => 'Połączono';

  @override
  String get partnerModePairedBody =>
      'Ty i twój partner jesteście połączeni. Udostępniane jest nadal tylko to, co włączysz poniżej.';

  @override
  String get partnerModeShareSectionTitle => 'Co udostępniasz';

  @override
  String get partnerModeShareCyclePhase => 'Faza i dzień cyklu';

  @override
  String get partnerModeShareMood => 'Dzisiejszy nastrój';

  @override
  String get partnerModeShareSymptoms => 'Dzisiejsze objawy';

  @override
  String get partnerModeShareHighDesire => 'Chęć bliskości dzisiaj';

  @override
  String get partnerModeShareNow => 'Udostępnij teraz';

  @override
  String get partnerModeShareSuccess => 'Udostępniono partnerowi';

  @override
  String get partnerModeUnpair => 'Rozłącz';

  @override
  String get partnerModeUnpairConfirmTitle => 'Rozłączyć się z partnerem?';

  @override
  String get partnerModeUnpairConfirmBody =>
      'To natychmiast kończy udostępnianie dla was obojga. Możecie połączyć się ponownie później nowym kodem.';

  @override
  String get partnerModePartnerSnapshotEmpty =>
      'Twój partner jeszcze niczego nie udostępnił.';

  @override
  String get partnerModeErrorNotConfigured =>
      'Tryb partnera nie został jeszcze skonfigurowany w tej wersji.';

  @override
  String get partnerModeErrorCodeNotFound =>
      'Nie znaleziono tego kodu. Sprawdź go i spróbuj ponownie.';

  @override
  String get partnerModeErrorCodeExpired => 'Ten kod wygasł. Poproś o nowy.';

  @override
  String get partnerModeErrorCodeIsOwn =>
      'To twój własny kod — poproś partnera o jego kod.';

  @override
  String get partnerModeErrorNotSignedIn => 'Najpierw się zaloguj.';

  @override
  String get partnerModeErrorUnknown => 'Coś poszło nie tak. Spróbuj ponownie.';

  @override
  String get partnerModeInviteTitle => 'Zaproś partnera';

  @override
  String get partnerModeInviteBody =>
      'Wyślij ten kod partnerowi. Wpisze go we własnej aplikacji, aby się z tobą połączyć.';

  @override
  String get partnerModeInviteExpiry => 'Ważny przez 7 dni';

  @override
  String get partnerModeInviteShare => 'Udostępnij kod';

  @override
  String partnerModeInviteMessage(String code) {
    return 'Oto mój kod parowania Vera: $code';
  }

  @override
  String get partnerModeEnterTitle => 'Wpisz kod';

  @override
  String get partnerModeEnterBody => 'Wpisz kod, który przysłał ci partner.';

  @override
  String get partnerModeEnterHint => '6-znakowy kod';

  @override
  String get partnerModeEnterSubmit => 'Połącz';

  @override
  String get homeInvitePartnerTitle => 'Udostępnij partnerowi';

  @override
  String get homeInvitePartnerBody =>
      'Połączcie się i udostępniaj tylko to, co wybierzesz — twoja historia pozostaje twoja.';

  @override
  String get homeInvitePartnerCta => 'Skonfiguruj Tryb partnera';

  @override
  String get feedbackTitle => 'Co ci się nie podobało?';

  @override
  String get feedbackSubtitle => 'Wybierz temat i napisz więcej, jeśli chcesz.';

  @override
  String get feedbackCategoryPredictions => 'Prognozy';

  @override
  String get feedbackCategoryBackup => 'Kopia zapasowa i przywracanie';

  @override
  String get feedbackCategorySubscription => 'Subskrypcja';

  @override
  String get feedbackCategoryAds => 'Reklamy';

  @override
  String get feedbackCategoryDesign => 'Design';

  @override
  String get feedbackCategoryTranslation => 'Tłumaczenie';

  @override
  String get feedbackCategoryOther => 'Inne';

  @override
  String get feedbackDescriptionLabel => 'Napisz więcej (opcjonalnie)';

  @override
  String get feedbackDescriptionHint =>
      'Co się stało? Po dotknięciu Wyślij sam wybierzesz, gdzie to udostępnić — swoją aplikację pocztową lub gdzie indziej.';

  @override
  String get feedbackAttachPhoto => 'Dodaj zdjęcie';

  @override
  String get feedbackPhotoAttached => 'Zdjęcie dołączone';

  @override
  String get remindersGroupCycle => 'Miesiączka i płodność';

  @override
  String get remindersGroupMedication => 'Leki';

  @override
  String get remindersGroupLifestyle => 'Styl życia';

  @override
  String get remindersGroupAppointment => 'Wizyty u lekarza';

  @override
  String get settingsRemindersPeriodEndLabel =>
      'Przypomnij, gdy miesiączka powinna się kończyć';

  @override
  String get settingsRemindersMedicationLabel => 'Przypomnienie o lekach';

  @override
  String get settingsRemindersWaterLabel => 'Przypomnienie o piciu wody';

  @override
  String get settingsRemindersAppointmentLabel =>
      'Przypomnienie o wizycie u lekarza';

  @override
  String get settingsRemindersAppointmentSet => 'Ustaw datę i godzinę';

  @override
  String get settingsRemindersAppointmentClear => 'Wyczyść';

  @override
  String get settingsOptionalTrackersHeading => 'Opcjonalne parametry';

  @override
  String get settingsOptionalTrackersBody =>
      'Domyślnie wyłączone. Włączenie dodaje dany parametr do ekranu dziennego wpisu.';

  @override
  String get settingsSexualActivityToggle => 'Aktywność seksualna';

  @override
  String get settingsBbtToggle => 'Podstawowa temperatura ciała';

  @override
  String get settingsMucusToggle => 'Śluz szyjkowy';

  @override
  String get settingsBreastExamToggle => 'Samobadanie piersi';

  @override
  String get settingsCervixToggle => 'Położenie i twardość szyjki macicy';

  @override
  String get settingsPrivacyEntry => 'Prywatność';

  @override
  String get settingsRateEntry => 'Oceń nas';

  @override
  String get rateAppTitle => 'Czy Vera Ci pomaga?';

  @override
  String get rateAppBody =>
      'Jeśli tak, kilka sekund na ocenę w sklepie pomoże innym szukającym czegoś podobnego w ogóle to znaleźć.';

  @override
  String get rateAppCta => 'Oceń Vera';

  @override
  String get rateAppDismiss => 'Nie teraz';

  @override
  String get settingsDeleteAllData => 'Usuń wszystkie dane';

  @override
  String get privacyScreenTitle => 'Prywatność';

  @override
  String get privacyScreenIntro =>
      'Oto dokładnie to, co dzieje się z Twoimi danymi, opisane prostym językiem.';

  @override
  String get privacyScreenStorageTitle => 'Zaszyfrowane na tym urządzeniu';

  @override
  String get privacyScreenNoNetworkTitle => 'Bez serwera, bez konta';

  @override
  String get privacyScreenNoThirdPartyTitle => 'Bez śledzenia';

  @override
  String get privacyScreenExportTitle => 'Eksport tylko z twojej inicjatywy';

  @override
  String get privacyScreenDeleteTitle => 'Usunięcie jest nieodwracalne';

  @override
  String get privacyScreenStorage =>
      'Wszystko, co zapisujesz, jest szyfrowane i przechowywane wyłącznie na tym urządzeniu, w jednym pliku. Klucz szyfrowania znajduje się w bezpiecznym module telefonu — Keychain w iOS, Keystore w Androidzie — a nie w samym pliku.';

  @override
  String get privacyScreenNoNetwork =>
      'Ta aplikacja nie ma własnego serwera ani systemu kont — Twoje wpisy nigdy nie są nigdzie wysyłane. Darmowa wersja zawiera reklamy Google, które łączą się z internetem; nigdy nie otrzymują one niczego, co zapisujesz.';

  @override
  String get privacyScreenNoThirdParty =>
      'Nie ma tu analityki, raportowania awarii ani żadnego SDK śledzącego. Jedynym komponentem zewnętrznym jest reklamowe SDK Google w wersji darmowej — Premium usuwa je całkowicie.';

  @override
  String get privacyScreenExport =>
      'Twoje dane opuszczają to urządzenie tylko wtedy, gdy samodzielnie je wyeksportujesz, a taki eksport jest zaszyfrowany hasłem, które znasz tylko Ty.';

  @override
  String get privacyScreenDelete =>
      'Usunięcie danych jest prawdziwe i natychmiastowe. Po naszej stronie nie ma konta ani kopii zapasowej — gdy dane znikną, znikają na dobre.';

  @override
  String get adPlaceholderLabel => 'Miejsce na reklamę';

  @override
  String get adPlaceholderUpgradeCta => 'Wyłącz reklamy dzięki Premium';

  @override
  String get reminderNotificationTitle =>
      'Twoja miesiączka może się niedługo zacząć';

  @override
  String get reminderNotificationBody =>
      'Na podstawie zapisanych cykli — zbliża się szacowane okno.';

  @override
  String get reminderPeriodEndTitle => 'Twoja miesiączka może się kończyć';

  @override
  String get reminderPeriodEndBody =>
      'Jeśli nadal trwa, to zupełnie normalne — to tylko delikatne pytanie o samopoczucie.';

  @override
  String get reminderMedicationTitle => 'Przypomnienie o lekach';

  @override
  String get reminderMedicationBody => 'Czas przyjąć lek.';

  @override
  String get reminderWaterTitle => 'Pamiętaj o nawodnieniu';

  @override
  String get reminderWaterBody => 'Małe przypomnienie o wodzie.';

  @override
  String get reminderAppointmentTitle => 'Nadchodząca wizyta u lekarza';

  @override
  String get reminderAppointmentBody => 'Zbliża się twoja wizyta u lekarza.';

  @override
  String get settingsExportEntry => 'Eksport i kopia zapasowa';

  @override
  String get exportBackupHeading => 'Zaszyfrowana kopia zapasowa';

  @override
  String get exportBackupBody =>
      'Zapisz zaszyfrowaną kopię swojej historii, aby przenieść ją na nowe urządzenie. Do przywrócenia potrzebne będzie to samo hasło — nie da się go odzyskać w żaden inny sposób.';

  @override
  String get exportCreateBackupButton => 'Utwórz kopię zapasową';

  @override
  String get exportRestoreBackupButton => 'Przywróć z kopii zapasowej';

  @override
  String get exportPasswordLabel => 'Hasło';

  @override
  String get exportPasswordConfirmLabel => 'Potwierdź hasło';

  @override
  String get exportPasswordMismatch => 'Hasła nie są takie same';

  @override
  String get exportPasswordTooShort => 'Użyj co najmniej 8 znaków';

  @override
  String get exportRestoreConfirmTitle =>
      'Zastąpić wszystkie dane na tym urządzeniu?';

  @override
  String get exportRestoreConfirmBody =>
      'Przywrócenie kopii zapasowej zastępuje wszystko, co jest obecnie zapisane na tym urządzeniu. Tego nie da się cofnąć.';

  @override
  String get exportRestoreConfirmAction => 'Przywróć';

  @override
  String get exportWrongPassword =>
      'To hasło nie pasuje do tej kopii zapasowej';

  @override
  String get exportInvalidFile =>
      'Ten plik nie wygląda na kopię zapasową z aplikacji Vera';

  @override
  String get exportBackupCreated => 'Kopia zapasowa gotowa do udostępnienia';

  @override
  String get exportRestoreSuccess => 'Przywrócono kopię zapasową';

  @override
  String get exportDoctorReportHeading => 'Raport dla lekarza';

  @override
  String get exportDoctorReportBody =>
      'Podsumowanie, które możesz udostępnić lekarzowi.';

  @override
  String get exportIncludeNotesToggle => 'Dołącz osobiste notatki';

  @override
  String get exportShareCsvButton => 'Udostępnij jako CSV';

  @override
  String get exportPrintPdfButton => 'Drukuj / zapisz jako PDF';

  @override
  String get doctorReportDisclaimer =>
      'Wygenerowano w aplikacji Vera na podstawie samodzielnie wprowadzonych danych. To nie jest diagnoza medyczna.';

  @override
  String get doctorReportGeneratedOn => 'Wygenerowano';

  @override
  String get doctorReportSummaryHeading => 'Podsumowanie';

  @override
  String get doctorReportDailyLogHeading => 'Zapisy dzienne';

  @override
  String get doctorReportColumnDate => 'Data';

  @override
  String get doctorReportTimelineHeading => 'Oś czasu cykli';

  @override
  String get doctorReportCycleLabel => 'Cykl';

  @override
  String get doctorReportTimelineLegendPeriod => 'Miesiączka';

  @override
  String get doctorReportTimelineLegendCycle => 'Reszta cyklu';

  @override
  String get doctorReportTimelineOngoing => 'Trwa';

  @override
  String get dailyInsightLabel => 'Czy wiesz, że…';

  @override
  String get insightMenstrual1 =>
      'Właśnie złuszcza się błona śluzowa macicy — większość miesiączek trwa od 3 do 7 dni i jest to zupełnie normalne.';

  @override
  String get insightMenstrual2 =>
      'Produkty bogate w żelazo, takie jak zielone warzywa liściaste i soczewica, pomagają uzupełnić to, co organizm traci w tym tygodniu.';

  @override
  String get insightFollicular1 =>
      'Poziom estrogenu rośnie, a wiele osób zauważa mniej więcej od teraz więcej energii i lepszą koncentrację.';

  @override
  String get insightFollicular2 =>
      'Organizm przygotowuje komórkę jajową do uwolnienia — ta faza może trwać od tygodnia do kilku tygodni.';

  @override
  String get insightFertile1 =>
      'To Twoje szacowane okno płodne — dni wokół owulacji, w których zajście w ciążę jest najbardziej prawdopodobne według typowego przebiegu cyklu.';

  @override
  String get insightFertile2 =>
      'Niektóre osoby zauważają wokół owulacji lekki wzrost podstawowej temperatury ciała albo zmiany śluzu szyjkowego.';

  @override
  String get insightLuteal1 =>
      'Po owulacji rośnie progesteron — to często wtedy pojawiają się objawy PMS, takie jak zmiany nastroju czy wzdęcia.';

  @override
  String get insightLuteal2 =>
      'Jeśli nie doszło do zagnieżdżenia ciąży, pod koniec tej fazy poziomy hormonów spadają, co uruchamia kolejną miesiączkę.';

  @override
  String get insightUnknown1 =>
      'Długość cyklu bardzo różni się między osobami — za typową uznaje się każdą wartość od 21 do 35 dni.';

  @override
  String get insightsPhaseTipsTitle => 'Może dobrze zrobić w tej fazie';

  @override
  String get tipFitnessLabel => 'Ruch';

  @override
  String get tipNutritionLabel => 'Odżywianie';

  @override
  String get tipFitnessMenstrual =>
      'Łagodny ruch — spacer, rozciąganie albo joga regeneracyjna — może teraz sprawiać lepsze wrażenie niż intensywny trening.';

  @override
  String get tipFitnessFollicular =>
      'W tej fazie energia często rośnie — to dobry moment, żeby spróbować nowego treningu albo trochę mocniej przycisnąć.';

  @override
  String get tipFitnessFertile =>
      'Wiele osób czuje się tutaj najbardziej energicznie — to dobra faza na bardziej intensywny trening, jeśli masz na to ochotę.';

  @override
  String get tipFitnessLuteal =>
      'Jeśli energia spada pod koniec tej fazy, lżejszy trening siłowy albo pływanie mogą być łatwiejsze do utrzymania.';

  @override
  String get tipFitnessUnknown =>
      'Każdy ruch, który dziś sprawia przyjemność, jest dobrym wyborem — nie ma jednej „właściwej” rutyny na każdy dzień.';

  @override
  String get tipNutritionMenstrual =>
      'Produkty bogate w żelazo — zielone warzywa liściaste, soczewica i czerwone mięso — pomagają uzupełnić to, co organizm traci w tym tygodniu.';

  @override
  String get tipNutritionFollicular =>
      'Lżejsze, świeże posiłki często dobrze się sprawdzają, gdy energia rośnie — ale nie ma jednego „właściwego” sposobu odżywiania w tej fazie.';

  @override
  String get tipNutritionFertile =>
      'Odpowiednie nawodnienie i zbilansowane posiłki wspierają energię w tej bardziej aktywnej fazie.';

  @override
  String get tipNutritionLuteal =>
      'Ochoty na jedzenie mogą się tutaj zmieniać — węglowodany złożone i produkty bogate w magnez, takie jak orzechy i gorzka czekolada, to częste wybory.';

  @override
  String get tipNutritionUnknown =>
      'Zbilansowane, regularne posiłki to solidny domyślny wybór, dopóki faza nie jest jeszcze jasna.';

  @override
  String get predictionSettingsEntry => 'Ustawienia prognozy';

  @override
  String get predictionSettingsIntro =>
      'To są założenia, pokazane otwarcie. Po zapisaniu 2 pełnych cykli prawdziwa prognoza na ekranie Start jest liczona z Twoich własnych danych — te liczby przestają być do tego używane.';

  @override
  String get predictionSettingsPeriodLengthLabel => 'Typowa długość miesiączki';

  @override
  String get predictionSettingsCycleLengthLabel => 'Typowa długość cyklu';

  @override
  String get predictionSettingsCycleLengthHint =>
      'Służy do skalowania pierścienia na ekranie Start, dopóki nie ma prawdziwych danych.';

  @override
  String get predictionSettingsLutealLabel => 'Długość fazy lutealnej';

  @override
  String get predictionSettingsLutealHint =>
      'Typowa liczba dni między owulacją a kolejną miesiączką. Służy do umiejscowienia szacowanego okna płodnego — ta wartość jest używana także po rozpoczęciu prawdziwych prognoz.';

  @override
  String get dayLogEnergyLabel => 'Energia';

  @override
  String get energyLevelLow => 'Niska';

  @override
  String get energyLevelMedium => 'Średnia';

  @override
  String get energyLevelHigh => 'Wysoka';

  @override
  String get energyLevelEnergetic => 'Pełnia energii';

  @override
  String get dayLogSkinHairLabel => 'Skóra i włosy';

  @override
  String get skinHealthyGlow => 'Zdrowy blask';

  @override
  String get skinRedness => 'Zaczerwienienie';

  @override
  String get skinDryness => 'Suchość';

  @override
  String get skinOiliness => 'Przetłuszczanie';

  @override
  String get hairGoodDay => 'Dobry dzień dla włosów';

  @override
  String get hairBadDay => 'Gorszy dzień dla włosów';

  @override
  String get hairLoss => 'Wypadanie włosów';

  @override
  String get scalpOily => 'Przetłuszczająca się skóra głowy';

  @override
  String get dayLogBreastExamLabel => 'Samobadanie piersi';

  @override
  String get breastExamAllNormal => 'Nic nietypowego';

  @override
  String get breastExamLump => 'Guzek';

  @override
  String get breastExamIndentation => 'Wciągnięcie skóry';

  @override
  String get breastExamRedness => 'Zaczerwienienie';

  @override
  String get breastExamCrackedNipple => 'Pęknięta brodawka';

  @override
  String get breastExamDischarge => 'Wyciek z brodawki';

  @override
  String get cervixPositionLabel => 'Położenie szyjki macicy';

  @override
  String get cervixPositionLow => 'Nisko';

  @override
  String get cervixPositionMedium => 'Średnio';

  @override
  String get cervixPositionHigh => 'Wysoko';

  @override
  String get cervixOpeningLabel => 'Rozwarcie szyjki macicy';

  @override
  String get cervixOpeningClosed => 'Zamknięta';

  @override
  String get cervixOpeningMedium => 'Częściowo otwarta';

  @override
  String get cervixOpeningOpen => 'Otwarta';

  @override
  String get cervixFirmnessLabel => 'Twardość szyjki macicy';

  @override
  String get cervixFirmnessSoft => 'Miękka';

  @override
  String get cervixFirmnessMedium => 'Średnio twarda';

  @override
  String get cervixFirmnessFirm => 'Twarda';

  @override
  String get dayLogWaterLabel => 'Woda';

  @override
  String get dayLogSleepLabel => 'Sen';

  @override
  String get dayLogWeightLabel => 'Masa ciała';

  @override
  String get dayLogMedicationsLabel => 'Leki';

  @override
  String get dayLogAddMedication => 'Dodaj lek';

  @override
  String get dayLogMedicationNameHint => 'Nazwa leku';

  @override
  String get dayLogBirthControlLabel => 'Antykoncepcja';

  @override
  String get dayLogOtherMedicationsLabel => 'Inne leki';

  @override
  String get birthControlPillTaken => 'Tabletka wzięta';

  @override
  String get birthControlPillLate => 'Tabletka wzięta z opóźnieniem';

  @override
  String get birthControlPillMissed => 'Tabletka pominięta';

  @override
  String get birthControlPatch => 'Plaster';

  @override
  String get birthControlRing => 'Krążek';

  @override
  String get birthControlInjection => 'Zastrzyk';

  @override
  String get birthControlImplant => 'Implant';

  @override
  String get birthControlIud => 'Wkładka';

  @override
  String get navAssistant => 'Asystent';

  @override
  String get assistantTitle => 'Asystent Vera';

  @override
  String get assistantEndChatTitle => 'Zakończyć tę rozmowę?';

  @override
  String get assistantEndChatBody =>
      'Wiadomości są tylko w pamięci i nigdzie nie są zapisywane, więc nie da się ich przywrócić.';

  @override
  String get assistantEndChatConfirm => 'Zakończ rozmowę';

  @override
  String get assistantInputHint => 'Zapytaj o swój cykl…';

  @override
  String get assistantIntro =>
      'Cześć! Odpowiem na pytania o miesiączkę, cykl i o to, jak działa Vera — tutaj, na Twoim telefonie, nic nie opuszcza urządzenia. Nie zastępuję lekarza i nie są to porady medyczne.';

  @override
  String get insightMenstrual3 =>
      'Krew miesiączkowa to nie „brudna krew” — to mieszanina krwi i błony śluzowej macicy, zupełnie normalna część cyklu.';

  @override
  String get insightMenstrual4 =>
      'Delikatne ciepło na podbrzuszu naprawdę łagodzi bolesne skurcze — termofor to klasyk potwierdzony badaniami.';

  @override
  String get insightMenstrual5 =>
      'Krwawienie jest często najobfitsze w pierwszych dwóch dniach, a potem słabnie — taki przebieg jest typowy.';

  @override
  String get insightMenstrual6 =>
      'Większe zmęczenie w czasie miesiączki jest częste — wraz z krwią menstruacyjną organizm traci żelazo.';

  @override
  String get insightFollicular3 =>
      'Estrogen odbudowuje błonę śluzową macicy po miesiączce — organizm przygotowuje się od nowa.';

  @override
  String get insightFollicular4 =>
      'W tej fazie skóra bywa najczystsza, gdy poziomy hormonów się stabilizują.';

  @override
  String get insightFollicular5 =>
      'Wytrzymałość i czas reakcji osiągają u wielu osób szczyt w późnej fazie folikularnej.';

  @override
  String get insightFollicular6 =>
      'To długość tej fazy różni się najbardziej między osobami — faza lutealna jest znacznie bardziej stała.';

  @override
  String get insightFertile3 =>
      'Komórka jajowa żyje około 12–24 godzin, ale plemniki mogą czekać nawet 5 dni — dlatego okno płodne obejmuje kilka dni.';

  @override
  String get insightFertile4 =>
      'W okolicach owulacji śluz szyjkowy często staje się przejrzysty i rozciągliwy — jak surowe białko jaja.';

  @override
  String get insightFertile5 =>
      'Niektóre osoby czują przy owulacji krótkie ukłucie po jednej stronie — ma to nawet swoją nazwę: ból owulacyjny (mittelschmerz).';

  @override
  String get insightFertile6 =>
      'Podstawowa temperatura ciała rośnie nieznacznie *po* owulacji — potwierdza ją, zamiast ją przewidywać.';

  @override
  String get insightLuteal3 =>
      'Progesteron osiąga szczyt mniej więcej tydzień po owulacji — wzdęcia i tkliwość piersi są wtedy częste.';

  @override
  String get insightLuteal4 =>
      'Ochota na węglowodany przed miesiączką jest prawdziwa — zapotrzebowanie na energię lekko rośnie w fazie lutealnej.';

  @override
  String get insightLuteal5 =>
      'Objawy PMS zwykle ustępują w ciągu dnia lub dwóch od początku krwawienia.';

  @override
  String get insightLuteal6 =>
      'Stały rytm snu potrafi wyraźnie złagodzić spadki nastroju w późnej fazie lutealnej.';

  @override
  String get insightUnknown2 =>
      'Zapisanie zaledwie trzech cykli często wystarczy, żeby zobaczyć swój własny wzorzec.';

  @override
  String get insightUnknown3 =>
      'Cykle są indywidualne — porównywanie swojego z czyimś innym rzadko cokolwiek wyjaśnia.';

  @override
  String get insightUnknown4 =>
      'Stres, podróże i choroba mogą przesunąć owulację — „spóźniona” miesiączka często oznacza po prostu późniejszą owulację.';

  @override
  String get settingsThemeLabel => 'Motyw';

  @override
  String get settingsThemeSystem => 'Systemowy';

  @override
  String get settingsThemeLight => 'Jasny';

  @override
  String get settingsThemeDark => 'Ciemny';

  @override
  String get settingsMascotLabel => 'Maskotka towarzysząca';

  @override
  String get mascotDroplet => 'Kropelka';

  @override
  String get mascotFlower => 'Kwiatek';

  @override
  String get mascotMoon => 'Księżyc';

  @override
  String get mascotNone => 'Brak';

  @override
  String homeWindowCountdown(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: 'Przewidywane okno zacznie się za około $days dnia',
      many: 'Przewidywane okno zacznie się za około $days dni',
      few: 'Przewidywane okno zacznie się za około $days dni',
      one: 'Przewidywane okno zacznie się za około $days dzień',
    );
    return '$_temp0';
  }

  @override
  String homeOvulationCountdown(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: 'Szacowana owulacja za około $days dnia',
      many: 'Szacowana owulacja za około $days dni',
      few: 'Szacowana owulacja za około $days dni',
      one: 'Szacowana owulacja za około $days dzień',
    );
    return '$_temp0';
  }

  @override
  String get homeQuickLogTitle => 'Jak się dziś czuje Twoje ciało?';

  @override
  String get actionSave => 'Zapisz';

  @override
  String get insightsTrackerHubTitle => 'Twoje parametry';

  @override
  String get trackerHistoryEmpty => 'Brak wpisów w tym zakresie';

  @override
  String get trackerStatAverage => 'Średnia';

  @override
  String get trackerStatLowest => 'Najniższa';

  @override
  String get trackerStatHighest => 'Najwyższa';

  @override
  String get trackerStatLatest => 'Ostatnia';

  @override
  String get rangeFilter1m => '1 mies.';

  @override
  String get rangeFilter3m => '3 mies.';

  @override
  String get rangeFilter6m => '6 mies.';

  @override
  String get dayLogOvulationTestLabel => 'Test owulacyjny';

  @override
  String get ovulationTestNegative => 'Negatywny';

  @override
  String get ovulationTestPositive => 'Pozytywny';

  @override
  String get ovulationTestLow => 'Niski';

  @override
  String get ovulationTestHigh => 'Wysoki';

  @override
  String get ovulationTestPeak => 'Szczyt';

  @override
  String get pregnancyTestLabel => 'Test ciążowy';

  @override
  String get pregnancyTestPositive => 'Pozytywny';

  @override
  String get pregnancyTestFaint => 'Słaba kreska';

  @override
  String get pregnancyTestNegative => 'Negatywny';

  @override
  String get settingsOvulationTestToggle => 'Test owulacyjny';

  @override
  String get settingsRemindersOvulationLabel => 'Zapowiedź okna płodnego';

  @override
  String get reminderOvulationTitle => 'Zbliża się szacowane okno płodne';

  @override
  String get reminderOvulationBody =>
      'Na podstawie zapisanych cykli szacowane okno płodne może się wkrótce zacząć.';

  @override
  String trackerEntriesCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count wpisu',
      many: '$count wpisów',
      few: '$count wpisy',
      one: '$count wpis',
    );
    return '$_temp0';
  }

  @override
  String get trackerLowSampleNote =>
      'Przy tak małej liczbie wpisów procenty nie są jeszcze wiarygodne — staną się dokładniejsze wraz z kolejnymi wpisami.';

  @override
  String get assistantTyping => 'Vera pisze…';

  @override
  String get premiumTitle => 'Vera Premium';

  @override
  String get premiumHeadline => 'Vera Premium';

  @override
  String get premiumSubhead =>
      'Wszystkie funkcje śledzenia pozostają darmowe na zawsze — Twoja historia nigdy nie zostaje zamknięta na klucz. Premium dodaje własne parametry, głębsze analizy, własne przypomnienia i dodatkowe wyglądy oraz usuwa reklamy.';

  @override
  String get premiumBenefitNoAds =>
      'Żadnych reklam, w żadnym miejscu aplikacji';

  @override
  String get premiumBenefitSupport =>
      'Wspiera niezależną aplikację, w której prywatność jest na pierwszym miejscu';

  @override
  String get premiumMonthly => 'Miesięcznie';

  @override
  String get premiumYearly => 'Rocznie';

  @override
  String get premiumYearlyNote => 'Płatność raz w roku';

  @override
  String premiumPerMonth(String price) {
    return '$price / miesiąc';
  }

  @override
  String get premiumBilledMonthly => 'Płatność co miesiąc';

  @override
  String get premiumStaysFreeTitle => 'Co zostaje za darmo';

  @override
  String get premiumStaysFreeBody =>
      'Kalendarz, cała twoja historia, podstawowe statystyki i eksport zostają darmowe na zawsze. Premium coś dodaje i nigdy niczego nie odbiera.';

  @override
  String get premiumSubscribeCta => 'Dalej';

  @override
  String get premiumRestore => 'Przywróć zakup';

  @override
  String get premiumCancelNote =>
      'Możesz anulować w każdej chwili na swoim koncie w sklepie z aplikacjami. Żadnych odliczań, żadnej presji — jeśli to nie jest dobry moment, darmowa wersja działa dokładnie tak samo jak dziś.';

  @override
  String get premiumActiveBadge => 'Premium jest aktywne';

  @override
  String get premiumDevToggle => 'Symuluj Premium (tryb deweloperski)';

  @override
  String get settingsPremiumEntry => 'Vera Premium';

  @override
  String get adTestNotice =>
      'Reklama testowa — to jeszcze nie prawdziwa emisja';

  @override
  String get settingsPregnancyModeLabel => 'Tryb ciąży';

  @override
  String get pregnancyLmpLabel => 'Pierwszy dzień ostatniej miesiączki';

  @override
  String pregnancyWeekLabel(int weeks, int days) {
    return 'Tydzień $weeks, dzień $days';
  }

  @override
  String get pregnancyDueDateLabel => 'Szacowany termin porodu';

  @override
  String pregnancyDaysLeft(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: 'Pozostało około $days dnia',
      many: 'Pozostało około $days dni',
      few: 'Pozostały około $days dni',
      one: 'Pozostał około $days dzień',
    );
    return '$_temp0';
  }

  @override
  String pregnancyTrimesterLabel(int n) {
    return 'Trymestr $n';
  }

  @override
  String get pregnancyDisclaimer =>
      'Daty są szacowane na podstawie ostatniej miesiączki według standardowej reguły 280 dni. USG daje dokładniejszą datę, a późna owulacja przesuwa te liczby — to informacja, a nie opieka medyczna.';

  @override
  String get pregnancySizeLabel => 'Wielkość dziecka';

  @override
  String get pregnancySizeUnder5 => 'Ziarno maku (~2 mm)';

  @override
  String get pregnancySizeUnder9 => 'Borówka (~1.6 cm)';

  @override
  String get pregnancySizeUnder13 => 'Limonka (~5.4 cm)';

  @override
  String get pregnancySizeUnder20 => 'Awokado (~11.6 cm)';

  @override
  String get pregnancySizeUnder28 => 'Mango (~30 cm)';

  @override
  String get pregnancySizeUnder34 => 'Ananas (~44 cm)';

  @override
  String get pregnancySizeUnder38 => 'Melon (~46 cm)';

  @override
  String get pregnancySizeTerm => 'Mały arbuz (~51 cm)';

  @override
  String get pregnancyNoteUnder5 =>
      'Większość osób nie zauważa jeszcze niczego: wiek ciąży liczy się od ostatniej miesiączki, więc pierwsze dwa tygodnie wypadają jeszcze przed zapłodnieniem.';

  @override
  String get pregnancyNoteUnder9 =>
      'Nudności, tkliwość piersi i zmęczenie są teraz częste. To dobry moment, aby umówić pierwszą wizytę.';

  @override
  String get pregnancyNoteUnder13 =>
      'Pierwszy trymestr dobiega końca; u wielu osób nudności zaczynają mniej więcej teraz ustępować.';

  @override
  String get pregnancyNoteUnder20 =>
      'W tym okresie energia często wraca. Pierwsze ruchy można poczuć w dowolnym momencie między 16. a 22. tygodniem.';

  @override
  String get pregnancyNoteUnder28 =>
      'Ruchy stają się wyraźne i układają się we własny rytm. Ból pleców i zgaga są w tym okresie częste.';

  @override
  String get pregnancyNoteUnder34 =>
      'Zaczął się trzeci trymestr. Duszność, częste oddawanie moczu i skurcze Braxtona-Hicksa są częste.';

  @override
  String get pregnancyNoteUnder38 =>
      'Dziecko przygotowuje się do porodu. To dobry moment na torbę do szpitala i plan porodu.';

  @override
  String get pregnancyNoteTerm =>
      'To już ciąża donoszona: poród może zacząć się w dowolnym momencie między 37. a 42. tygodniem; 40. tydzień to średnia, a nie ostateczny termin.';

  @override
  String get pregnancyWeeklyNoteTitle => 'W tym tygodniu';

  @override
  String get pregnancyNeedsLmp =>
      'Dodaj pierwszy dzień ostatniej miesiączki, aby zacząć śledzenie.';

  @override
  String get pregnancyOutOfRange =>
      'Ta data jest starsza niż 42 tygodnie — zaktualizuj ją albo wyłącz tryb ciąży.';

  @override
  String get partnerShareTitle =>
      'Udostępnij podsumowanie partnerowi lub partnerce';

  @override
  String get partnerShareBody =>
      'Tworzy krótkie podsumowanie tekstowe — Twoja obecna faza i szacowane okno — które wysyłasz samodzielnie przez dowolną aplikację. Nie ma synchronizacji na żywo ani konta partnerskiego: nic nie zostaje udostępnione, dopóki tego nie wyślesz.';

  @override
  String get partnerShareCta => 'Utwórz podsumowanie';

  @override
  String get partnerSummaryHeader => 'Podsumowanie cyklu z aplikacji Vera';

  @override
  String get settingsHomeThemeLabel => 'Tło ekranu głównego';

  @override
  String get homeThemeWheat => 'Pszenica';

  @override
  String get homeThemeSky => 'Niebo';

  @override
  String get homeThemeField => 'Pole';

  @override
  String get homeThemeBlossom => 'Kwiecie';

  @override
  String get homeThemePlain => 'Gładkie';

  @override
  String get backupNudgeTitle => 'Zachowaj kopię swoich danych';

  @override
  String get backupNudgeBody =>
      'Wszystko istnieje tylko na tym telefonie. Jeśli się zgubi, zepsuje albo zostanie zresetowany, historia zniknie razem z nim — zaszyfrowana kopia zapasowa zajmuje chwilę i tylko Ty możesz ją otworzyć.';

  @override
  String get backupNudgeCta => 'Zrób kopię teraz';

  @override
  String get backupNudgeDismiss => 'Później';

  @override
  String backupLastDone(String date) {
    return 'Ostatnia kopia zapasowa: $date';
  }

  @override
  String get backupNever => 'Brak kopii zapasowej';

  @override
  String get settingsRemindersBackupLabel => 'Przypominaj o kopii zapasowej';

  @override
  String get reminderBackupTitle =>
      'Czas na kopię zapasową danych z aplikacji Vera';

  @override
  String get reminderBackupBody =>
      'Twoja historia istnieje tylko na tym telefonie. Szybka zaszyfrowana kopia zapasowa ją zabezpieczy.';

  @override
  String get notificationChannelPeriodStart => 'Zbliżająca się miesiączka';

  @override
  String get notificationChannelPeriodEnd => 'Koniec miesiączki';

  @override
  String get notificationChannelMedication => 'Leki';

  @override
  String get notificationChannelWater => 'Woda';

  @override
  String get notificationChannelAppointment => 'Wizyty';

  @override
  String get notificationChannelOvulation => 'Okno płodne';

  @override
  String get notificationChannelBackup => 'Przypomnienie o kopii zapasowej';

  @override
  String get calendarDayDetailTitle => 'Ten dzień';

  @override
  String get calendarDayNothingLogged => 'Nic jeszcze nie zapisano w tym dniu';

  @override
  String get calendarDayOpenLog => 'Otwórz wpis dnia';

  @override
  String get cycleHistoryTitle => 'Poprzednie cykle';

  @override
  String get cycleTrendsTitle => 'Trendy cyklu';

  @override
  String get cycleHistoryEmpty =>
      'Zapisz kilka miesiączek, a historia cykli pojawi się tutaj.';

  @override
  String get cycleHistoryOngoing => 'Trwa';

  @override
  String cycleHistoryLength(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: 'Cykl $days dnia',
      many: 'Cykl $days dni',
      few: 'Cykl $days dni',
      one: 'Cykl $days dzień',
    );
    return '$_temp0';
  }

  @override
  String cycleHistoryPeriodLength(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: 'Miesiączka trwała $days dnia',
      many: 'Miesiączka trwała $days dni',
      few: 'Miesiączka trwała $days dni',
      one: 'Miesiączka trwała $days dzień',
    );
    return '$_temp0';
  }

  @override
  String cycleHistoryVsAverage(String diff) {
    return '$diff względem Twojej średniej';
  }

  @override
  String get insightsCycleHistoryEntry => 'Poprzednie cykle';

  @override
  String get homeEmptyTitle => 'Zacznijmy od Twojej ostatniej miesiączki';

  @override
  String get homeEmptyBody =>
      'W dniu, w którym zacznie się miesiączka, naciśnij przycisk powyżej. Po dwóch pełnych cyklach Vera może zacząć szacować — do tego czasu nie będzie udawać, że wie.';

  @override
  String get homeEmptyBackdate => 'Zaczęła się wcześniej';

  @override
  String get settingsAdPrivacyEntry => 'Opcje prywatności reklam';

  @override
  String a11yCycleRing(int day, int length) {
    return 'Dzień cyklu $day z około $length';
  }

  @override
  String a11yChartSummary(int count, String min, String max) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Wykres: $count wpisu, od $min do $max',
      many: 'Wykres: $count wpisów, od $min do $max',
      few: 'Wykres: $count wpisy, od $min do $max',
      one: 'Wykres: $count wpis, od $min do $max',
    );
    return '$_temp0';
  }

  @override
  String a11yPhaseBar(int day, int length) {
    return 'Postęp cyklu: dzień $day z około $length';
  }

  @override
  String a11yFrequencyItem(String label, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count razy',
      many: '$count razy',
      few: '$count razy',
      one: '$count raz',
    );
    return '$label: $_temp0';
  }

  @override
  String get importTitle => 'Import z innej aplikacji';

  @override
  String get importBody =>
      'Wyeksportuj historię z poprzedniej aplikacji do pliku CSV, a potem wybierz go tutaj. Importowane są tylko daty i obfitość krwawienia — nazwy objawów i nastrojów różnią się między aplikacjami, a Vera nie zgaduje, co miały oznaczać.';

  @override
  String get importPickFile => 'Wybierz plik CSV';

  @override
  String importPreview(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Znaleziono $count dnia historii',
      many: 'Znaleziono $count dni historii',
      few: 'Znaleziono $count dni historii',
      one: 'Znaleziono $count dzień historii',
    );
    return '$_temp0';
  }

  @override
  String importSkipped(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Nie udało się odczytać $count wiersza — zostanie pominięty',
      many: 'Nie udało się odczytać $count wierszy — zostaną pominięte',
      few: 'Nie udało się odczytać $count wierszy — zostaną pominięte',
      one: 'Nie udało się odczytać $count wiersza — zostanie pominięty',
    );
    return '$_temp0';
  }

  @override
  String get importConfirm => 'Dodaj do mojej historii';

  @override
  String get importMergeNote =>
      'Zaimportowane dni są scalane. Dni już zapisane w aplikacji Vera pozostają bez zmian.';

  @override
  String importDone(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Zaimportowano $count dnia',
      many: 'Zaimportowano $count dni',
      few: 'Zaimportowano $count dni',
      one: 'Zaimportowano $count dzień',
    );
    return '$_temp0';
  }

  @override
  String get importErrorEmpty => 'Ten plik wygląda na pusty.';

  @override
  String get importErrorNoDate => 'Nie znaleziono w tym pliku kolumny z datą.';

  @override
  String get settingsImportEntry => 'Import z innej aplikacji';

  @override
  String get settingsHealthSyncLabel =>
      'Synchronizuj z Apple Health / Health Connect';

  @override
  String get settingsHealthSyncBody =>
      'Zapisuje w aplikacji zdrowotnej telefonu wyłącznie obfitość krwawienia, masę ciała i podstawową temperaturę ciała. Objawy, nastroje i notatki zostają w aplikacji Vera. Nic nie jest odczytywane z powrotem.';

  @override
  String healthSyncBackfilled(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Wysłano $count dnia do aplikacji zdrowotnej',
      many: 'Wysłano $count dni do aplikacji zdrowotnej',
      few: 'Wysłano $count dni do aplikacji zdrowotnej',
      one: 'Wysłano $count dzień do aplikacji zdrowotnej',
    );
    return '$_temp0';
  }

  @override
  String get healthSyncDenied =>
      'Nie przyznano uprawnienia, więc synchronizacja pozostaje wyłączona.';

  @override
  String get settingsDiagnosticsEntry => 'Diagnostyka';

  @override
  String get diagnosticsBody =>
      'Jeśli aplikacja zachowa się niepoprawnie, szczegóły techniczne są zapisywane tutaj — wyłącznie na tym urządzeniu. Nic nie jest nigdzie wysyłane, chyba że zdecydujesz się to wysłać, a wcześniej możesz dokładnie przeczytać, co zostałoby wysłane.';

  @override
  String get diagnosticsEmpty =>
      'Nic nie zapisano — nie wykryto żadnych problemów.';

  @override
  String get diagnosticsShare => 'Wyślij do twórców aplikacji';

  @override
  String get diagnosticsClear => 'Wyczyść';

  @override
  String get diagnosticsNoteLabel => 'Co się stało? (opcjonalnie)';

  @override
  String get diagnosticsTechnicalDetail => 'Szczegóły techniczne';

  @override
  String get unitHoursShort => 'g';

  @override
  String get unitMinutesShort => 'min';

  @override
  String get unitHoursLong => 'godziny';

  @override
  String get unitMinutesLong => 'minuty';

  @override
  String get unitMilliliters => 'ml';

  @override
  String get unitKilograms => 'kg';

  @override
  String get calendarJumpTitle => 'Przejdź do miesiąca';

  @override
  String get calendarJumpYearLabel => 'Rok';

  @override
  String get settingsAdPrivacyUnavailable =>
      'W Twoim regionie nie ma opcji wyboru personalizacji reklam — reklamy są tu i tak niespersonalizowane.';

  @override
  String get settingsGroupAppearance => 'Wygląd';

  @override
  String get settingsGroupTracking => 'Preferencje śledzenia';

  @override
  String get dayLogCustomTagsLabel => 'Moje własne parametry';

  @override
  String get customTagAddButton => 'Dodaj parametr';

  @override
  String get customTagDialogTitle => 'Nowy parametr';

  @override
  String get customTagDialogHint => 'np. migrena, siłownia, bezsenność';

  @override
  String get customTagManageEntry => 'Zarządzaj moimi parametrami';

  @override
  String get customTagRenameTitle => 'Zmień nazwę parametru';

  @override
  String get customTagDeleteTitle => 'Usunąć ten parametr?';

  @override
  String get customTagDeleteBody =>
      'Zostanie usunięty z każdego dnia, w którym był używany. Pozostałe wpisy zostają bez zmian.';

  @override
  String get customTagEmpty => 'Nie masz jeszcze własnych parametrów.';

  @override
  String get premiumLockedTitle => 'Funkcja Premium';

  @override
  String get premiumLockedAction => 'Zobacz Premium';

  @override
  String get premiumBenefitCustomTrackers =>
      'Śledź, co tylko chcesz, własnymi słowami';

  @override
  String get premiumBenefitAdvancedInsights =>
      'Zaawansowane analizy: co zwykle się dzieje i kiedy';

  @override
  String get premiumBenefitPersonalisation => 'Dodatkowe tła i maskotki';

  @override
  String get premiumBenefitAdvancedReminders =>
      'Przypomnienia w Twoim własnym rytmie';

  @override
  String get advancedInsightsTitle => 'Zaawansowane analizy';

  @override
  String get advancedInsightsEntry => 'Zaawansowane analizy';

  @override
  String get advancedInsightsNotEnough =>
      'Zapisz trzy pełne cykle, a Twoje wzorce pojawią się tutaj. Przy mniejszej liczbie każdy „wzorzec” byłby po prostu przypadkiem.';

  @override
  String get advancedInsightsPatternsTitle => 'Kiedy zwykle się to pojawia';

  @override
  String advancedInsightsPatternLine(String label, String segment) {
    return '$label — najczęściej $segment';
  }

  @override
  String advancedInsightsPatternDetail(int count, int day) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Zapisano $count dnia, mniej więcej w $day. dniu cyklu',
      many: 'Zapisano $count dni, mniej więcej w $day. dniu cyklu',
      few: 'Zapisano $count dni, mniej więcej w $day. dniu cyklu',
      one: 'Zapisano $count dzień, mniej więcej w $day. dniu cyklu',
    );
    return '$_temp0';
  }

  @override
  String advancedInsightsNoPattern(String label) {
    return '$label — brak wyraźnego wzorca czasowego';
  }

  @override
  String get advancedInsightsTrendTitle => 'Długość cyklu w czasie';

  @override
  String advancedInsightsDriftLonger(String days, String cycles) {
    return 'Porównując Twoje najwcześniejsze cykle ($cycles) z najnowszymi ($cycles), te ostatnie są dłuższe o około $days dni.';
  }

  @override
  String advancedInsightsDriftShorter(String days, String cycles) {
    return 'Porównując Twoje najwcześniejsze cykle ($cycles) z najnowszymi ($cycles), te ostatnie są krótsze o około $days dni.';
  }

  @override
  String advancedInsightsDriftStable(String cycles) {
    return 'Porównując Twoje najwcześniejsze cykle ($cycles) z najnowszymi ($cycles), długość cyklu pozostaje mniej więcej taka sama.';
  }

  @override
  String get advancedInsightsDriftNotEnough =>
      'Gdy uzbiera się sześć pełnych cykli, Vera porówna te najwcześniejsze z najnowszymi i sprawdzi, czy długość cyklu się zmienia.';

  @override
  String get advancedInsightsMoodTitle => 'Nastrój według części cyklu';

  @override
  String get advancedInsightsDisclaimer =>
      'To tylko zliczenia tego, co zostało zapisane — nic więcej. Nie są diagnozą, a wzorzec widoczny tutaj nie jest przyczyną.';

  @override
  String get segmentPeriod => 'w czasie miesiączki';

  @override
  String get segmentAfterPeriod => 'po miesiączce';

  @override
  String get segmentMidCycle => 'w środku cyklu';

  @override
  String get segmentBeforePeriod => 'przed miesiączką';

  @override
  String get customRemindersEntry => 'Moje własne przypomnienia';

  @override
  String get customRemindersTitle => 'Moje własne przypomnienia';

  @override
  String get customRemindersEmpty => 'Nie masz jeszcze własnych przypomnień.';

  @override
  String get customRemindersAdd => 'Dodaj przypomnienie';

  @override
  String get customReminderLabelHint => 'np. wziąć tabletkę, wypić wodę';

  @override
  String get customReminderLockScreenNote =>
      'Tekst przypomnienia pojawia się na ekranie blokady, więc sformułuj go tak dyskretnie, jak chcesz.';

  @override
  String get customReminderDelete => 'Usuń przypomnienie';

  @override
  String get homeThemeDusk => 'Zmierzch';

  @override
  String get homeThemeMeadow => 'Łąka';

  @override
  String get homeThemePetal => 'Płatek';

  @override
  String get homeThemeBloom => 'Rozkwit';

  @override
  String get homeThemeOcean => 'Ocean';

  @override
  String get homeThemeAutumn => 'Jesień';

  @override
  String get homeThemeNight => 'Noc';

  @override
  String get mascotStar => 'Gwiazdka';

  @override
  String get mascotLeaf => 'Listek';

  @override
  String get mascotCat => 'Kot';

  @override
  String get mascotRabbit => 'Królik';

  @override
  String get mascotBird => 'Ptak';

  @override
  String get tipDetailWhatsHappening => 'Co dzieje się teraz w Twoim ciele';

  @override
  String get tipDetailGeneralHeading => 'Ogólne sugestie';

  @override
  String get tipDetailDisclaimer =>
      'To ogólne informacje, a nie osobista porada medyczna. Każdy organizm reaguje inaczej, a to, jak naprawdę się czujesz, znaczy więcej niż cokolwiek zasugerowanego tutaj. Jeśli coś Cię niepokoi, porozmawiaj z lekarzem.';

  @override
  String get phaseExplainerMenstrual =>
      'Krwawisz, ponieważ złuszcza się błona śluzowa macicy. Estrogen i progesteron są na najniższym poziomie w cyklu i dlatego wiele osób czuje się w pierwszych dniach bardziej zmęczonych i zwróconych do wewnątrz. Krwawienie trwa zwykle od trzech do siedmiu dni i jest najobfitsze na początku. Skurcze biorą się z kurczenia macicy, napędzanego przez prostaglandyny — związki podobne do hormonów, uwalniane przy rozpadzie błony śluzowej, co tłumaczy też, dlaczego u części osób pojawia się jednocześnie ból krzyża albo luźniejsze wypróżnienia. Krwawienie kosztuje też żelazo, a to wyjaśnia część zmęczenia. Ciepło, ruch i sen zwykle pomagają. Jeśli jednak zabezpieczenie przesiąka co godzinę, krwawienie wyraźnie przekracza tydzień albo ból uniemożliwia zwykłe czynności, warto to omówić ze specjalistą, zamiast przeczekiwać.';

  @override
  String get phaseExplainerFollicular =>
      'Po zakończeniu krwawienia estrogen znów zaczyna rosnąć. W jajnikach dojrzewa grupa pęcherzyków, każdy z komórką jajową, i zwykle uwalniany jest tylko jeden. Estrogen odbudowuje dopiero co złuszczoną błonę śluzową, a większość osób zauważa, że wraz z nim wracają energia, nastrój, skóra i wytrzymałość. To także ta część cyklu, która najbardziej różni się między osobami i między miesiącami — stres, choroba, podróże i sen ujawniają się najczęściej właśnie tutaj, wydłużając ją lub skracając. To uczciwy powód, dla którego prognoza jest przedziałem, a nie datą: druga połowa cyklu jest dość stała, a rusza się właśnie ta połowa.';

  @override
  String get phaseExplainerFertile =>
      'Estrogen jest blisko szczytu, a owulacji spodziewamy się w okolicach tych dni. Wyrzut hormonu luteinizującego uruchamia uwolnienie komórki jajowej mniej więcej dobę do półtorej doby później. Sama komórka jajowa przeżywa około 12 do 24 godzin, ale plemniki potrafią przetrwać kilka dni w płodnym śluzie szyjkowym — dlatego okno liczy się w kilku dniach, a nie w jednym. Śluz staje się zwykle przejrzysty, rozciągliwy i śliski, trochę jak surowe białko jaja; część osób zauważa większą ochotę, tkliwość piersi albo krótkie ukłucie po jednej stronie. Energia jest często najwyższa w całym cyklu. Pamiętaj, że to okno jest oszacowaniem z twojej własnej historii, nie pomiarem, i nie jest metodą antykoncepcji.';

  @override
  String get phaseExplainerLuteal =>
      'Po owulacji opróżniony pęcherzyk staje się ciałkiem żółtym i zaczyna wytwarzać progesteron, który utrzymuje błonę śluzową w stabilnym stanie na wypadek zagnieżdżenia się ciąży. Jeśli do tego nie dojdzie, progesteron i estrogen gwałtownie spadają i zaczyna się miesiączka. Ta połowa cyklu jest bardziej stała, zwykle około 12 do 14 dni. Progesteron nieznacznie podnosi temperaturę spoczynkową — to właśnie tę zmianę wychwytuje termometr bazalny — i może spowalniać trawienie, co tłumaczy część wzdęć. Spadek na końcu wywołuje u wielu osób objawy PMS: tkliwe piersi, zmiany apetytu, przerywany sen, bóle głowy i wahania nastroju, które zwykle łagodnieją, gdy zaczyna się krwawienie. Jeśli te objawy zakłócają pracę albo relacje w większości miesięcy, warto porozmawiać o tym ze specjalistą.';

  @override
  String get phaseExplainerUnknown =>
      'Nie ma jeszcze dość zapisów, żeby powiedzieć, w której fazie jesteś. Vera potrzebuje co najmniej dwóch pełnych cykli — początku miesiączki, a potem następnego — żeby wyliczyć twoją własną średnią i zmienność, i woli to powiedzieć, niż wymyślić fazę. W międzyczasie nic się nie marnuje: każdy zapisany dzień należy do tego pierwszego wyliczenia, a oszacowanie zawęża się w miarę, jak rośnie historia. Do tego czasu poniższe sugestie są ogólne i sprawdzają się w każdym punkcie cyklu.';

  @override
  String get tipFitnessDetailMenstrual =>
      'Ciężki trening nie służy większości osób w pierwszych dniach i nie chodzi o dyscyplinę — energia naprawdę jest niższa, a żelazo tracone z krwawieniem sprawia, że praca wytrzymałościowa wydaje się cięższa niż ten sam trening w zeszłym tygodniu. Spacer, delikatne rozciąganie, joga regeneracyjna i praca z oddechem poprawiają krążenie i mogą złagodzić skurcze; u części osób regularny ruch przez cały miesiąc obniża natężenie skurczów bardziej niż cokolwiek, co robią w danym dniu. Jeśli czujesz się dobrze, nie ma powodu unikać ciężkich jednostek: krwawienie nie jest powodem, by przestać trenować, a wiele zawodniczek startuje w jego trakcie. Kilka praktycznych uwag: długie, wymagające treningi w dniach obfitego krwawienia mogą pogłębić zmęczenie, ciepło na podbrzuszu przed startem sprawia, że ruch jest wygodniejszy, a picie nieco więcej niż zwykle pomaga na bóle głowy tych dni. Oceniaj trening po tym, jak się czujesz w jego trakcie, a nie po tym, jak wyglądał twój najlepszy tydzień.';

  @override
  String get tipFitnessDetailFollicular =>
      'Gdy estrogen rośnie, większość osób czuje się silniejsza i bardziej wytrzymała; to zwykle najlepszy odcinek cyklu, by zacząć coś nowego, dołożyć ciężaru albo przyspieszyć. Regeneracja mięśni jest tu stosunkowo sprawna, więc ciężkie jednostki są lepiej przyswajane i zostawiają mniej długotrwałych zakwasów. To też dobre okno na to, co wymaga jasnej głowy, a nie tylko silnego ciała — nauka nowego ruchu, poprawa techniki albo dłuższy dystans niż dotąd. Dwa zastrzeżenia warto zachować: zwiększaj stopniowo, bo dużo energii nie znaczy zerowego ryzyka kontuzji, a większość urazów przeciążeniowych zaczyna się w dobrym tygodniu, nie w złym. I chroń sen — adaptacja zachodzi podczas regeneracji, a nie podczas treningu.';

  @override
  String get tipFitnessDetailFertile =>
      'Energia i motywacja są zwykle na szczycie, więc wymagające treningi dobrze siadają — rekordy życiowe często padają właśnie tutaj. Część badań sugeruje, że stawy są w okolicach owulacji nieco luźniejsze; praktyczny efekt bywa dyskutowany, ale dłuższa rozgrzewka to tania ostrożność w sportach z gwałtownymi zmianami kierunku, skokami i lądowaniami. Temperatura ciała jest wciąż niska w porównaniu z drugą połową cyklu, więc upał ogranicza tu mniej niż za tydzień czy dwa. Krótkie ukłucie po jednej stronie podbrzusza w okolicach owulacji jest częste i zwykle mija w ciągu kilku godzin. Jeśli jednak ból jest silny, jednostronny i uporczywy, towarzyszy mu gorączka albo czujesz, że możesz zemdleć — przerwij i zbadaj to, zamiast trenować dalej.';

  @override
  String get tipFitnessDetailLuteal =>
      'Gdy zbliża się miesiączka, energia może spaść, tętno przy tym samym wysiłku może być wyższe, a regeneracja dłuższa. To spodziewane wahanie, nie regres, i nie wymazuje pracy z ostatnich dwóch tygodni. Progesteron nieco podnosi temperaturę spoczynkową i utrudnia oddawanie ciepła, więc treningi w upale lub wilgoci wydają się tutaj nieproporcjonalnie ciężkie — trening wcześniej albo później w ciągu dnia i picie więcej, niż wydaje się konieczne, pomagają w obu przypadkach. Umiarkowane jednostki, nieco lżejsza wersja treningu siłowego i spacery są zwykle bardziej do utrzymania. Przy wzdęciach i tkliwości piersi dobrze podtrzymujący stanik sportowy i dłuższa rozgrzewka robią realną różnicę. Jeśli nastrój jest niski, zrób trening krótki i łatwy, zamiast rezygnować z niego całkiem — próg, od którego się liczy, jest niżej, niż się wydaje.';

  @override
  String get tipFitnessDetailUnknown =>
      'Nawet nie znając fazy, ruch pomaga w każdym momencie: ogólne zalecenie to około 150 minut umiarkowanej aktywności tygodniowo, rozłożonej na większość dni, plus wzmacnianie dwa razy w tygodniu — i ten schemat daje niemal każdemu więcej niż okazjonalne bardzo intensywne jednostki. Regularność waży więcej niż intensywność, a najlepszy trening to ten, który naprawdę powtórzysz w przyszłym tygodniu. Dostosuj do tego, jak się czujesz: w zmęczone dni liczy się spacer, a krótki wykonany trening jest wart więcej niż długi opuszczony. Gdy zapiszesz kilka cykli, pojawią się tu sugestie dla konkretnej fazy.';

  @override
  String get tipNutritionDetailMenstrual =>
      'Krwawienie kosztuje żelazo; czerwone mięso, soczewica, ciecierzyca, ciemnozielone warzywa liściaste i melasa pomagają je uzupełnić. Żelazo roślinne wchłania się wyraźnie lepiej razem z witaminą C — wyciśnięcie cytryny na danie z soczewicy to najbardziej praktyczna wersja, a sałatka z pomidorów obok robi to samo. Herbata i kawa do posiłku obniżają wchłanianie żelaza przez taniny, więc wystarczy zostawić około godziny przerwy; nie trzeba rezygnować z żadnego z nich. Picie odpowiedniej ilości wody może złagodzić zmęczenie i bóle głowy towarzyszące krwawieniu, a produkty bogate w magnez, jak orzechy, nasiona i ciemne warzywa liściaste, u części osób pomagają na skurcze. W dni, gdy trawienie zwalnia, małe i regularne posiłki leżą lepiej niż obfite. Jeśli w okolicach miesiączki często czujesz zadyszkę, zawroty głowy albo nietypowe wyczerpanie, warto wspomnieć o tym specjaliście — niskie żelazo jest częste, łatwe do sprawdzenia i nie jest czymś, co ma diagnozować aplikacja.';

  @override
  String get tipNutritionDetailFollicular =>
      'Gdy energia wraca, ciało jest w trybie odbudowy: wystarczająca ilość białka, pełne ziarna i warzywa to wspierają, a w tej fazie apetyt jest zwykle najbardziej stabilny i najłatwiejszy do prowadzenia. Ma też sens dalsze uzupełnianie zapasów żelaza po krwawieniu, zamiast traktować to jako zadanie wyłącznie tygodnia miesiączki — zapasy odbudowują się tygodniami, nie dniami. Nieopuszczanie posiłków jest tu łatwiejsze i pozwala wejść w wahania apetytu następnej fazy bardziej wyrównaną. Jeśli zamierzasz zmienić sposób jedzenia, ten odcinek jest zwykle łaskawszy na start niż tydzień przed miesiączką, kiedy zachcianki i obniżony nastrój sprawiają, że każda nowa rutyna wydaje się trudniejsza, niż jest.';

  @override
  String get tipNutritionDetailFertile =>
      'Tutaj nie potrzeba żadnej specjalnej diety; zbilansowane posiłki i wystarczająca ilość wody robią większość roboty. Część osób czuje wzdęcie w okolicach owulacji, co zwykle jest hormonalne i przemijające, a nie skutkiem tego, co zjadły. U jednych apetyt lekko spada, u innych rośnie — obie rzeczy są zwyczajne. Utrzymanie białka i błonnika w posiłkach stabilizuje energię w tym, co często bywa najbardziej aktywnym odcinkiem miesiąca. Jeśli planujesz ciążę, to rozsądny moment, żeby zapytać specjalistę o kwas foliowy, który zaleca się zwykle przed poczęciem, a nie po nim — ale to rozmowa z nim, a nie porada, której ma udzielać aplikacja.';

  @override
  String get tipNutritionDetailLuteal =>
      'Wzmożony apetyt i ochota na słodkie, gdy rośnie progesteron, są bardzo częste; to przesunięcie hormonalne, nie kwestia siły woli, a organizm rzeczywiście zużywa w tej fazie trochę więcej energii. Dodanie białka i błonnika do posiłków utrzymuje stabilniejszy poziom cukru i łagodzi zachciankę o wiele lepiej niż próba jej zignorowania — zachcianka zaspokojona czymś sytym zwykle kończy się szybciej niż taka, z którą walczy się godzinę. Mniej soli i więcej wody mogą złagodzić wzdęcia; brzmi to na odwrót, ale takie nie jest: dobrze nawodniony organizm zatrzymuje mniej. Produkty bogate w magnez (migdały, orzechy włoskie, ciemne warzywa liściaste, gorzka czekolada) u części osób zmniejszają skurcze i napięcie. Ograniczenie kofeiny po południu pomaga na przerywany sen tej fazy, a na alkohol też warto uważać, bo rozbija sen dokładnie w tym punkcie cyklu, w którym i tak jest już płytszy.';

  @override
  String get tipNutritionDetailUnknown =>
      'Niezależnie od fazy najbardziej pomagają te same rzeczy: regularne posiłki, wystarczająca ilość białka, dużo warzyw, wystarczająca ilość wody i produkty bogate w żelazo. Ponieważ krwawienie kosztuje żelazo, w te dni wystarczy zwrócić na nie trochę więcej uwagi — nie trzeba osobnej diety na każdy tydzień miesiąca. Jedzenie mniej więcej o stałych porach robi dla równej energii więcej niż jakikolwiek pojedynczy produkt, i nic nie musi być wykreślone, żeby cykl był zdrowy. Gdy zapiszesz kilka cykli, pojawią się tu sugestie dla konkretnej fazy.';

  @override
  String get tipSleepLabel => 'Sen';

  @override
  String get tipSleepMenstrual =>
      'Skurcze i dyskomfort mogą przerywać sen; ciepły prysznic lub termofor przed snem mogą pomóc.';

  @override
  String get tipSleepFollicular =>
      'Wraz ze wzrostem energii wiele osób czuje się bardziej rozbudzonych — rzeczywista potrzeba snu jednak się nie zmniejsza.';

  @override
  String get tipSleepFertile =>
      'Lekki wzrost temperatury ciała w okolicach owulacji może nieco utrudnić zasypianie; chłodniejszy pokój może pomóc.';

  @override
  String get tipSleepLuteal =>
      'Progesteron lekko podnosi temperaturę spoczynkową i może spłycać sen głęboki; chłodny, ciemny pokój i stała pora snu pomagają tu najbardziej.';

  @override
  String get tipSleepUnknown =>
      'Jakość snu często zmienia się w trakcie cyklu — zwykle najbardziej krucha tuż przed i podczas okresu. Stała pora snu jest najbardziej wiarygodną podstawą niezależnie od fazy.';

  @override
  String get tipSleepDetailMenstrual =>
      'Podczas okresu sen jest często bardziej fragmentaryczny — skurcze, dyskomfort, a u niektórych częstsze wizyty w toalecie mogą budzić w nocy. Ciepły prysznic, termofor lub delikatne rozciąganie przed snem mogą złagodzić skurcze. Jeśli bierzesz leki przeciwbólowe, dobranie czasu tak, by działanie obejmowało pierwszą część nocy, może chronić wczesny sen.';

  @override
  String get tipSleepDetailFollicular =>
      'Wraz ze wzrostem estrogenu wiele osób czuje się bardziej czujnych i energicznych, co może wyglądać jak mniejsza potrzeba snu. To nie do końca prawda — czuwanie po prostu przychodzi łatwiej. Utrzymanie stałej pory snu opłaca się później, gdy sen staje się bardziej kruchy w innych fazach.';

  @override
  String get tipSleepDetailFertile =>
      'Lekki wzrost temperatury ciała w okolicach owulacji może nieco utrudnić zasypianie, ponieważ organizm naturalnie chce się ochłodzić przed snem. Chłodniejszy pokój, lżejszy koc lub ciepły prysznic przed snem mogą to zrównoważyć. Osoby zauważające większe pożądanie lub energię towarzyską w tym okresie mogą też świadomie dłużej nie spać.';

  @override
  String get tipSleepDetailLuteal =>
      'Progesteron rosnący po owulacji lekko podnosi temperaturę spoczynkową, co może spłycać sen głęboki — czasem jako łagodne uderzenie gorąca, czasem po prostu jako mniej regenerujący sen. W miarę zbliżania się okresu może dołączyć napięcie przedmiesiączkowe. Chłodny, ciemny pokój, mniej czasu przed ekranem przed snem i stała pora snu pomagają tu najbardziej.';

  @override
  String get tipSleepDetailUnknown =>
      'Nie ma jeszcze wystarczających danych, by określić fazę, ale zmieniająca się jakość snu w trakcie cyklu to powszechny wzorzec — zwykle bardziej krucha tuż przed i podczas okresu, stabilniejsza w pierwszej połowie. Najbardziej wiarygodna podstawa niezależnie od fazy: stałe pory snu i budzenia, mniej czasu przed ekranem przed snem i chłodny, ciemny pokój.';
}
