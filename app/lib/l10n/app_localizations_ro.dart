// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Romanian Moldavian Moldovan (`ro`).
class AppLocalizationsRo extends AppLocalizations {
  AppLocalizationsRo([String locale = 'ro']) : super(locale);

  @override
  String get appTitle => 'Vera';

  @override
  String get actionSkip => 'Sari peste';

  @override
  String get actionContinue => 'Continuă';

  @override
  String get actionDone => 'Gata';

  @override
  String get actionCancel => 'Anulează';

  @override
  String get actionClear => 'Șterge';

  @override
  String get actionDelete => 'Șterge';

  @override
  String get actionEnable => 'Activează';

  @override
  String get commonIDontKnow => 'Nu știu';

  @override
  String get commonYes => 'Da';

  @override
  String get commonNo => 'Nu';

  @override
  String get commonNotSure => 'Nu știu sigur';

  @override
  String get pinSetupTitle => 'Configurează un PIN';

  @override
  String get pinSetupEnterPrompt =>
      'Alege un PIN din 6 cifre pentru a bloca aplicația';

  @override
  String get pinSetupConfirmPrompt => 'Introdu-l din nou pentru confirmare';

  @override
  String get pinSetupMismatch => 'Nu s-au potrivit — hai să încercăm din nou';

  @override
  String get pinSetupBiometricTitle => 'Deblocare mai rapidă?';

  @override
  String get pinSetupBiometricBody =>
      'Poți folosi și amprenta sau chipul pentru deblocare — PIN-ul rămâne ca variantă de rezervă.';

  @override
  String get lockScreenTitle => 'Blocat';

  @override
  String get lockScreenEnterPin => 'Introdu PIN-ul';

  @override
  String get lockScreenWrongPin => 'PIN-ul nu se potrivește';

  @override
  String get lockScreenUseBiometrics => 'Folosește datele biometrice';

  @override
  String get lockScreenUseFaceId => 'Folosește Face ID';

  @override
  String get lockScreenUseFingerprint => 'Folosește amprenta';

  @override
  String get lockScreenForgotPin => 'Ai uitat PIN-ul?';

  @override
  String get lockScreenForgotPinChoiceTitle => 'Cum vrei să îl resetezi?';

  @override
  String get lockScreenResetViaDevice => 'Verifică cu acest dispozitiv';

  @override
  String get lockScreenResetViaDeviceBody =>
      'Datele tale rămân. E suficient să confirmi cu blocarea proprie a telefonului — Face ID, amprentă sau cod.';

  @override
  String get lockScreenResetViaDeviceReason =>
      'Verifică-te pentru a seta un PIN nou';

  @override
  String lockScreenThrottled(int seconds) {
    return 'Prea multe încercări. Încearcă din nou peste ${seconds}s';
  }

  @override
  String get lockScreenEraseTitle => 'Ștergi toate datele?';

  @override
  String get lockScreenEraseBody =>
      'Această acțiune șterge definitiv tot ce se află pe acest dispozitiv. Nu există cont și nici copie de rezervă pe server, deci nu se poate reveni.';

  @override
  String get lockScreenEraseConfirm => 'Șterge tot';

  @override
  String get onboardingPrivacyTitle => 'Bun venit';

  @override
  String get onboardingPrivacyBody =>
      'Datele despre ciclu rămân doar pe acest dispozitiv, criptate. Nu există cont și nici sincronizare în cloud — nimic din ce notezi nu se încarcă nicăieri. Cheia stă în componenta securizată a telefonului, iar tot conținutul poate fi exportat sau șters oricând.';

  @override
  String get onboardingLastPeriodTitle => 'Când a început ultima menstruație?';

  @override
  String get onboardingLastPeriodBody =>
      'Așa avem de unde porni — poți corecta data oricând din calendar.';

  @override
  String get onboardingPickDate => 'Alege o dată';

  @override
  String get onboardingCycleLengthTitle => 'Cât durează de obicei ciclul tău?';

  @override
  String get onboardingCycleLengthBody =>
      'O cifră aproximativă e suficientă. Estimările reale încep după ce vedem câteva cicluri complete.';

  @override
  String get onboardingPeriodLengthTitle =>
      'Câte zile durează de obicei menstruația?';

  @override
  String get onboardingPeriodLengthBody =>
      'Folosim asta pentru a completa ultima menstruație, ca să nu pornești de la zero.';

  @override
  String get onboardingDaysUnit => 'zile';

  @override
  String get onboardingGoalTitle => 'Ce te aduce aici?';

  @override
  String get onboardingGoalBody =>
      'Asta ne ajută doar să îți arătăm întâi lucrurile potrivite — te poți răzgândi oricând din Setări.';

  @override
  String get goalTrackPeriod => 'Urmărirea menstruației';

  @override
  String get goalTryingToConceive => 'Încercarea de a concepe';

  @override
  String get goalPregnancyTracking => 'Urmărirea unei sarcini';

  @override
  String get onboardingRegularityTitle =>
      'Menstruațiile sunt de obicei regulate?';

  @override
  String get onboardingRegularityBody =>
      'Nu există răspuns greșit — ne ajută doar să cunoaștem puțin mai bine corpul tău.';

  @override
  String get onboardingCrampsTitle => 'Ai de obicei crampe?';

  @override
  String get onboardingCrampsBody =>
      'Ne asigurăm că e ușor de notat cum te simți în zilele acelea.';

  @override
  String get onboardingBirthYearTitle => 'În ce an te-ai născut?';

  @override
  String get onboardingBirthYearBody =>
      'Doar pentru o imagine mai completă — nu este folosit niciodată în vreo predicție.';

  @override
  String get onboardingPmsTitle => 'Apare de obicei ceva înainte?';

  @override
  String get onboardingPmsBody =>
      'Alege câte se potrivesc. Nu se salvează nicăieri, nu există răspuns greșit.';

  @override
  String get onboardingNotificationTitle => 'Vrei mementouri discrete?';

  @override
  String get onboardingNotificationBody =>
      'Îți putem da un semn înainte de data estimată a menstruației.';

  @override
  String get onboardingNotificationMockTitle =>
      'Menstruația ar putea începe în curând';

  @override
  String get onboardingNotificationMockBody => 'Pe baza ciclurilor notate';

  @override
  String get onboardingNotificationAllow => 'Activează mementourile';

  @override
  String get onboardingNotificationNotNow => 'Nu acum';

  @override
  String get onboardingBuildingPlanTitle => 'Pregătim totul pentru tine';

  @override
  String get onboardingBuildingPlanStep1 =>
      'Securizăm datele pe acest dispozitiv';

  @override
  String get onboardingBuildingPlanStep2 => 'Salvăm preferințele';

  @override
  String get onboardingBuildingPlanStep3 => 'Pregătim calendarul';

  @override
  String get onboardingBuildingPlanDone => 'Totul e gata';

  @override
  String get navHome => 'Acasă';

  @override
  String get navCalendar => 'Calendar';

  @override
  String get navInsights => 'Analize';

  @override
  String get navSettings => 'Setări';

  @override
  String get navReminders => 'Remindere';

  @override
  String get navProfile => 'Profil';

  @override
  String get navTrack => 'Înregistrează';

  @override
  String homeCycleDayLabel(int day) {
    return 'Ziua $day';
  }

  @override
  String get homeNoCycleYet => 'Nicio menstruație notată încă';

  @override
  String get homePhaseMenstrual => 'Menstruație';

  @override
  String get homePhaseFollicular => 'Faza foliculară';

  @override
  String get homePhaseFertileWindow => 'Fereastră fertilă estimată';

  @override
  String get homePhaseLuteal => 'Faza luteală';

  @override
  String get homePhaseUnknown => 'Date recente insuficiente';

  @override
  String get homePredictionInsufficientTitle => 'Încă nu sunt destule date';

  @override
  String get homePredictionInsufficientBody =>
      'Notează următoarea menstruație și începem să estimăm.';

  @override
  String homePredictionRangeLabel(String start, String end) {
    return '$start – $end';
  }

  @override
  String get homeConfidenceHigh => 'Încredere ridicată';

  @override
  String get homeConfidenceMedium => 'Încredere medie';

  @override
  String get homeConfidenceLow => 'Încredere scăzută';

  @override
  String get homeIrregularNote =>
      'Durata ciclului a variat mai mult decât de obicei în ultima vreme. Dacă e ceva nou pentru tine, ar putea merita menționat la un control medical.';

  @override
  String get homeFertileWindowDisclaimer =>
      'Pe baza ritmului obișnuit al ciclului — nu este o metodă de contracepție.';

  @override
  String get homePeriodStartedButton => 'Menstruația a început azi';

  @override
  String get homePeriodStartedSnackbar => 'Notat — menstruația a început azi';

  @override
  String get actionUndo => 'Anulează acțiunea';

  @override
  String get comingSoon => 'În curând';

  @override
  String get dayLogFlowLabel => 'Flux';

  @override
  String get flowSpotting => 'Sângerare intermenstruală';

  @override
  String get flowLight => 'Redus';

  @override
  String get flowMedium => 'Moderat';

  @override
  String get flowHeavy => 'Abundent';

  @override
  String get flowNone => 'Absent';

  @override
  String get dayLogSymptomsLabel => 'Simptome';

  @override
  String get symptomCramps => 'Crampe';

  @override
  String get symptomHeadache => 'Durere de cap';

  @override
  String get symptomBloating => 'Balonare';

  @override
  String get symptomBreastTenderness => 'Sensibilitate la nivelul sânilor';

  @override
  String get symptomAcne => 'Acnee';

  @override
  String get symptomFatigue => 'Oboseală';

  @override
  String get symptomNausea => 'Greață';

  @override
  String get symptomBackPain => 'Durere de spate';

  @override
  String get symptomAppetiteChange => 'Modificarea apetitului';

  @override
  String get symptomSleepTrouble => 'Somn dificil';

  @override
  String get symptomPelvicPain => 'Durere pelvină';

  @override
  String get symptomDizziness => 'Amețeală';

  @override
  String get symptomMigraine => 'Migrenă';

  @override
  String get symptomHighFever => 'Febră mare';

  @override
  String get symptomNeckPain => 'Durere de gât';

  @override
  String get symptomShoulderPain => 'Durere de umăr';

  @override
  String get symptomLimbPain => 'Durere la membre';

  @override
  String get symptomMuscleAche => 'Durere musculară';

  @override
  String get symptomChills => 'Frisoane';

  @override
  String get symptomNightSweats => 'Transpirații nocturne';

  @override
  String get symptomHotFlashes => 'Bufeuri';

  @override
  String get symptomWeightGain => 'Creștere în greutate';

  @override
  String get symptomConstipation => 'Constipație';

  @override
  String get symptomDiarrhea => 'Diaree';

  @override
  String get symptomIndigestion => 'Indigestie';

  @override
  String get symptomGasPain => 'Durere de balonare';

  @override
  String get symptomFeelingUnwell => 'Stare de rău';

  @override
  String get symptomItching => 'Mâncărime';

  @override
  String get symptomTroubleFocusing => 'Dificultate de concentrare';

  @override
  String get symptomForgetfulness => 'Uitare';

  @override
  String get symptomGroupHead => 'Cap';

  @override
  String get symptomGroupBody => 'Corp';

  @override
  String get symptomGroupAbdomen => 'Abdomen';

  @override
  String get symptomGroupGeneral => 'General';

  @override
  String get symptomGroupCognitive => 'Cognitiv';

  @override
  String get dayLogMoodLabel => 'Dispoziție';

  @override
  String get moodCalm => 'Calm';

  @override
  String get moodAnxious => 'Anxietate';

  @override
  String get moodIrritable => 'Iritabilitate';

  @override
  String get moodLow => 'Moral scăzut';

  @override
  String get moodEnergetic => 'Energie';

  @override
  String get moodHappy => 'Bucurie';

  @override
  String get moodContent => 'Mulțumire';

  @override
  String get moodSad => 'Tristețe';

  @override
  String get moodDepressed => 'Stare depresivă';

  @override
  String get moodEmotional => 'Sensibilitate emoțională';

  @override
  String get moodExcited => 'Entuziasmată';

  @override
  String get moodHopeful => 'Plină de speranță';

  @override
  String get moodProud => 'Mândră';

  @override
  String get moodDisappointed => 'Dezamăgită';

  @override
  String get moodConfident => 'Încrezătoare';

  @override
  String get moodSurprised => 'Surprinsă';

  @override
  String get moodIndifferent => 'Indiferentă';

  @override
  String get moodPeaceful => 'Împăcată';

  @override
  String get moodInLove => 'Îndrăgostită';

  @override
  String get moodShy => 'Timidă';

  @override
  String get moodPlayful => 'Jucăușă';

  @override
  String get moodExhausted => 'Epuizată';

  @override
  String get moodLonely => 'Singură';

  @override
  String get moodOverwhelmed => 'Copleșită';

  @override
  String get moodGrateful => 'Recunoscătoare';

  @override
  String get moodNostalgic => 'Nostalgică';

  @override
  String get dayLogNoteLabel => 'Notiță';

  @override
  String get dayLogNoteHint => 'Orice vrei să reții despre ziua de azi';

  @override
  String get dayLogOptionalTrackersLabel => 'Urmăriri opționale';

  @override
  String get dayLogSexualActivityLabel => 'Activitate sexuală';

  @override
  String get sexLifeNone => 'Nimic';

  @override
  String get sexLifeUnprotected => 'Sex neprotejat';

  @override
  String get sexLifeProtected => 'Sex protejat';

  @override
  String get sexLifeMasturbation => 'Masturbare';

  @override
  String get sexLifeNoOrgasm => 'Fără orgasm';

  @override
  String get sexLifeOrgasm => 'Orgasm';

  @override
  String get sexLifeHighDesire => 'Dorință crescută';

  @override
  String get dayLogBbtLabel => 'Temperatură bazală';

  @override
  String get dayLogMucusLabel => 'Mucus cervical';

  @override
  String get mucusDry => 'Uscat';

  @override
  String get mucusSticky => 'Lipicios';

  @override
  String get mucusCreamy => 'Cremos';

  @override
  String get mucusWatery => 'Apos';

  @override
  String get mucusEggWhite => 'Albuș de ou';

  @override
  String get dayLogSavedIndicator => 'Salvat';

  @override
  String get homeOpenTodayLog => 'Adaugă detalii pentru azi';

  @override
  String get calendarLegendActual => 'Menstruație notată';

  @override
  String get calendarLegendPredicted => 'Interval estimat al menstruației';

  @override
  String get calendarLegendFertile => 'Fereastră fertilă estimată';

  @override
  String get calendarLegendOvulation => 'Ovulație estimată';

  @override
  String get dayDetailFertileTitle => 'În fereastra fertilă estimată';

  @override
  String get dayDetailOvulationTitle => 'Zi estimată de ovulație';

  @override
  String get dayDetailOvulationBody =>
      'Sarcina este de obicei mai probabilă în jurul acestei zile, pe baza ritmului obișnuit — este o estimare, nu o certitudine.';

  @override
  String get insightsCyclesLoggedLabel => 'Cicluri notate';

  @override
  String get insightsAveragePeriodLengthLabel => 'Durata medie a menstruației';

  @override
  String get insightsAverageCycleLengthLabel => 'Durata medie a ciclului';

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
      other: 'Variază cu aproximativ $daysString de zile',
      few: 'Variază cu aproximativ $daysString zile',
      one: 'Variază cu aproximativ o zi',
    );
    return '$_temp0';
  }

  @override
  String get insightsNotEnoughDataTitle => 'Încă nu sunt destule date';

  @override
  String get insightsNotEnoughDataBody =>
      'Notează câteva cicluri complete și mediile vor apărea aici.';

  @override
  String get insightsSymptomFrequencyTitle => 'Simptome după ziua din ciclu';

  @override
  String get insightsNoSymptomsLogged => 'Niciun simptom notat încă';

  @override
  String get settingsLanguageLabel => 'Limbă';

  @override
  String get settingsLanguageSystem => 'Limba sistemului';

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
  String get tourSkip => 'Sari peste';

  @override
  String get tourNext => 'Următorul';

  @override
  String get tourStart => 'Să începem';

  @override
  String get tourHomeTitle => 'Acasă';

  @override
  String get tourHomeBody =>
      'Vezi dintr-o privire unde ești astăzi — ziua ta din ciclu, cât mai este până la fereastra estimată și companionul tău sunt mereu aici.';

  @override
  String get tourCalendarTitle => 'Calendar';

  @override
  String get tourCalendarBody =>
      'Vezi ciclurile tale trecute și viitoare în calendar. Atinge orice zi pentru a-i deschide jurnalul.';

  @override
  String get tourTrackTitle => 'Înregistrează';

  @override
  String get tourTrackBody =>
      'Butonul + din mijloc deschide jurnalul zilei de oriunde — flux, simptome, dispoziție și altele.';

  @override
  String get tourRemindersTitle => 'Mementouri';

  @override
  String get tourRemindersBody =>
      'Setează mementouri pentru menstruația care urmează, medicamente sau consumul de apă — totul rămâne pe telefonul tău și nu ajunge nicăieri altundeva.';

  @override
  String get tourProfileTitle => 'Profil';

  @override
  String get tourProfileBody =>
      'Găsește aici informațiile tale, tot ce urmărești și setările tale.';

  @override
  String get settingsWeekStartLabel => 'Săptămâna începe';

  @override
  String get settingsWeekStartMonday => 'Luni';

  @override
  String get settingsWeekStartSunday => 'Duminică';

  @override
  String get settingsTemperatureUnitLabel => 'Unitate de temperatură';

  @override
  String get settingsTemperatureCelsius => 'Celsius';

  @override
  String get settingsTemperatureFahrenheit => 'Fahrenheit';

  @override
  String get settingsRemindersLabel => 'Amintește-mi înainte de menstruație';

  @override
  String get remindersScreenTitle => 'Mementouri';

  @override
  String get reminderDetailNotification => 'Notificare';

  @override
  String get reminderDetailAlert => 'Alertă';

  @override
  String get reminderDetailAlertToday => 'În ziua respectivă';

  @override
  String get reminderDetailTime => 'Ora';

  @override
  String get reminderDetailMessage => 'Mesaj';

  @override
  String get reminderDetailMessageEditTitle => 'Editează mesajul';

  @override
  String get reminderDetailMessageHint => 'Scrie-ți propriul mesaj';

  @override
  String reminderDetailAlertDaysBefore(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count de zile mai devreme',
      few: '$count zile mai devreme',
      one: '$count zi mai devreme',
    );
    return '$_temp0';
  }

  @override
  String optionsShowMore(int count) {
    return '+$count în plus';
  }

  @override
  String get optionsShowLess => 'Afișează mai puțin';

  @override
  String get trackerHistoryEntry => 'Istoric';

  @override
  String get actionSend => 'Trimite';

  @override
  String get actionRemove => 'Elimină';

  @override
  String get feedbackEntry => 'Feedback';

  @override
  String get cloudBackupEntry => 'Backup cu cont';

  @override
  String get cloudBackupTitle => 'Backup cu cont';

  @override
  String get cloudBackupNotConfiguredTitle =>
      'Încă indisponibil în această versiune';

  @override
  String get cloudBackupNotConfiguredBody =>
      'Backup-ul în cloud are nevoie de un serviciu de conturi care nu a fost încă configurat pentru această versiune. Nimic de aici nu poate fi folosit până atunci.';

  @override
  String get cloudBackupIntro1Title => 'Nu-ți pierde niciodată istoricul';

  @override
  String get cloudBackupIntro1Body =>
      'Istoricul ciclului tău rămâne în siguranță chiar dacă îți pierzi telefonul sau treci la unul nou.';

  @override
  String get cloudBackupIntro2Title => 'Doar tu îl poți deschide';

  @override
  String get cloudBackupIntro2Body =>
      'Backup-ul tău este criptat cu o parolă înainte să părăsească telefonul — noi nu-l putem citi, și nici altcineva.';

  @override
  String get cloudBackupIntro3Title => 'Restaurează în câteva secunde';

  @override
  String get cloudBackupIntro3Body =>
      'Conectează-te pe un dispozitiv nou și adu-ți înapoi istoricul cu aceeași parolă.';

  @override
  String get cloudBackupSignedInTitle => 'Conectat';

  @override
  String get cloudBackupUploadButton => 'Fă backup acum';

  @override
  String get cloudBackupDownloadButton => 'Restaurează din cloud';

  @override
  String get cloudBackupUploadSuccess => 'Backup salvat în contul tău';

  @override
  String get cloudBackupNoBackupFound =>
      'Nu a fost găsit încă niciun backup în cloud pentru acest cont.';

  @override
  String get partnerModeEntry => 'Mod Partener';

  @override
  String get partnerModeTitle => 'Mod Partener';

  @override
  String get partnerModeNotConfiguredTitle =>
      'Încă indisponibil în această versiune';

  @override
  String get partnerModeNotConfiguredBody =>
      'Modul Partener are nevoie de un serviciu de conturi care nu a fost încă configurat pentru această versiune. Nimic de aici nu poate fi folosit până atunci.';

  @override
  String get partnerModeHeroTitle => 'Distribuie puțin, în condițiile tale';

  @override
  String get partnerModeHeroBody =>
      'Asociază-te cu partenerul tău și distribuie doar ce activezi mai jos — niciodată tot istoricul tău, niciodată automat.';

  @override
  String get partnerModeSignInGoogle => 'Continuă cu Google';

  @override
  String get partnerModeSignInApple => 'Continuă cu Apple';

  @override
  String get partnerModeFaqTitle => 'Înainte să te conectezi';

  @override
  String get partnerModeFaq1Q => 'Ce va vedea de fapt partenerul meu?';

  @override
  String get partnerModeFaq1A =>
      'Doar câmpurile pe care le activezi în Modul Partener, și doar starea ta actuală — niciodată istoricul tău salvat, nici nimic ce nu ai distribuit explicit.';

  @override
  String get partnerModeFaq2Q => 'Pot dezactiva asta mai târziu?';

  @override
  String get partnerModeFaq2A =>
      'Da. Anularea asocierii oprește imediat distribuirea pentru amândoi, iar orice comutator poate fi dezactivat oricând fără a anula asocierea.';

  @override
  String get partnerModeFaq3Q =>
      'Are partenerul meu nevoie de această aplicație?';

  @override
  String get partnerModeFaq3A =>
      'Da — se conectează la fel și se asociază cu un cod pe care i-l trimiți.';

  @override
  String get partnerModeNotPairedTitle => 'Încă neasociat';

  @override
  String get partnerModeNotPairedBody =>
      'Invită-ți partenerul cu un cod de unică folosință, sau introdu codul pe care ți l-a trimis.';

  @override
  String get partnerModeInviteButton => 'Invită-mi partenerul';

  @override
  String get partnerModeEnterCodeButton => 'Introdu un cod';

  @override
  String get partnerModeSignOut => 'Deconectare';

  @override
  String get partnerModePairedTitle => 'Asociat';

  @override
  String get partnerModePairedBody =>
      'Tu și partenerul tău sunteți conectați. Distribuirea rămâne limitată la ce activezi mai jos.';

  @override
  String get partnerModeShareSectionTitle => 'Ce distribui';

  @override
  String get partnerModeShareCyclePhase => 'Faza și ziua ciclului';

  @override
  String get partnerModeShareMood => 'Starea de azi';

  @override
  String get partnerModeShareSymptoms => 'Simptomele de azi';

  @override
  String get partnerModeShareHighDesire => 'Dorință de apropiere azi';

  @override
  String get partnerModeShareNow => 'Distribuie acum';

  @override
  String get partnerModeShareSuccess => 'Distribuit partenerului tău';

  @override
  String get partnerModeUnpair => 'Anulează asocierea';

  @override
  String get partnerModeUnpairConfirmTitle =>
      'Anulezi asocierea cu partenerul tău?';

  @override
  String get partnerModeUnpairConfirmBody =>
      'Aceasta oprește imediat distribuirea pentru amândoi. Puteți asocia din nou mai târziu cu un cod nou.';

  @override
  String get partnerModePartnerSnapshotEmpty =>
      'Partenerul tău nu a distribuit încă nimic.';

  @override
  String get partnerModeErrorNotConfigured =>
      'Modul Partener nu este încă configurat în această versiune.';

  @override
  String get partnerModeErrorCodeNotFound =>
      'Codul nu a fost găsit. Verifică-l și încearcă din nou.';

  @override
  String get partnerModeErrorCodeExpired =>
      'Acest cod a expirat. Cere unul nou.';

  @override
  String get partnerModeErrorCodeIsOwn =>
      'Acesta este propriul tău cod — cere-i partenerului codul lui.';

  @override
  String get partnerModeErrorNotSignedIn => 'Conectează-te mai întâi.';

  @override
  String get partnerModeErrorUnknown =>
      'Ceva nu a mers bine. Te rugăm încearcă din nou.';

  @override
  String get partnerModeInviteTitle => 'Invită-ți partenerul';

  @override
  String get partnerModeInviteBody =>
      'Trimite acest cod partenerului tău. Îl va introduce în propria aplicație pentru a se asocia cu tine.';

  @override
  String get partnerModeInviteExpiry => 'Valabil 7 zile';

  @override
  String get partnerModeInviteShare => 'Distribuie codul';

  @override
  String partnerModeInviteMessage(String code) {
    return 'Iată codul meu de asociere Vera: $code';
  }

  @override
  String get partnerModeEnterTitle => 'Introdu un cod';

  @override
  String get partnerModeEnterBody =>
      'Introdu codul pe care ți l-a trimis partenerul tău.';

  @override
  String get partnerModeEnterHint => 'Cod din 6 caractere';

  @override
  String get partnerModeEnterSubmit => 'Asociază';

  @override
  String get homeInvitePartnerTitle => 'Distribuie partenerului tău';

  @override
  String get homeInvitePartnerBody =>
      'Asociați-vă și distribuie doar ce alegi — istoricul tău rămâne al tău.';

  @override
  String get homeInvitePartnerCta => 'Configurează Modul Partener';

  @override
  String get feedbackTitle => 'Ce nu ți-a plăcut?';

  @override
  String get feedbackSubtitle =>
      'Alege un subiect și scrie mai multe dacă vrei.';

  @override
  String get feedbackCategoryPredictions => 'Predicții';

  @override
  String get feedbackCategoryBackup => 'Backup și restaurare';

  @override
  String get feedbackCategorySubscription => 'Abonament';

  @override
  String get feedbackCategoryAds => 'Reclame';

  @override
  String get feedbackCategoryDesign => 'Design';

  @override
  String get feedbackCategoryTranslation => 'Traducere';

  @override
  String get feedbackCategoryOther => 'Altele';

  @override
  String get feedbackDescriptionLabel => 'Spune-ne mai multe (opțional)';

  @override
  String get feedbackDescriptionHint =>
      'Ce s-a întâmplat? Când apeși Trimite, alegi tu unde îl distribui — aplicația de mail sau altundeva.';

  @override
  String get feedbackAttachPhoto => 'Adaugă o fotografie';

  @override
  String get feedbackPhotoAttached => 'Fotografie atașată';

  @override
  String get remindersGroupCycle => 'Menstruație și fertilitate';

  @override
  String get remindersGroupMedication => 'Medicație';

  @override
  String get remindersGroupLifestyle => 'Stil de viață';

  @override
  String get remindersGroupAppointment => 'Consultații medicale';

  @override
  String get settingsRemindersPeriodEndLabel =>
      'Întreabă-mă când menstruația ar trebui să se încheie';

  @override
  String get settingsRemindersMedicationLabel => 'Memento pentru medicamente';

  @override
  String get settingsRemindersWaterLabel => 'Memento pentru hidratare';

  @override
  String get settingsRemindersAppointmentLabel =>
      'Memento consultație medicală';

  @override
  String get settingsRemindersAppointmentSet => 'Setează data și ora';

  @override
  String get settingsRemindersAppointmentClear => 'Șterge';

  @override
  String get settingsOptionalTrackersHeading => 'Urmăriri opționale';

  @override
  String get settingsOptionalTrackersBody =>
      'Dezactivate implicit. Activarea uneia o adaugă în ecranul de notare a zilei.';

  @override
  String get settingsSexualActivityToggle => 'Activitate sexuală';

  @override
  String get settingsBbtToggle => 'Temperatură bazală';

  @override
  String get settingsMucusToggle => 'Mucus cervical';

  @override
  String get settingsBreastExamToggle => 'Autoexaminarea sânilor';

  @override
  String get settingsCervixToggle => 'Poziția și consistența colului uterin';

  @override
  String get settingsPrivacyEntry => 'Confidențialitate';

  @override
  String get settingsRateEntry => 'Evaluează-ne';

  @override
  String get rateAppTitle => 'Îți este de folos Vera?';

  @override
  String get rateAppBody =>
      'Dacă da, câteva secunde pentru a o evalua în magazin ajută alte persoane care caută ceva similar să o găsească.';

  @override
  String get rateAppCta => 'Evaluează Vera';

  @override
  String get rateAppDismiss => 'Nu acum';

  @override
  String get settingsDeleteAllData => 'Șterge toate datele';

  @override
  String get privacyScreenTitle => 'Confidențialitate';

  @override
  String get privacyScreenIntro =>
      'Iată exact ce se întâmplă cu datele tale, pe înțelesul tuturor.';

  @override
  String get privacyScreenStorageTitle => 'Criptat pe acest dispozitiv';

  @override
  String get privacyScreenNoNetworkTitle => 'Fără server, fără cont';

  @override
  String get privacyScreenNoThirdPartyTitle => 'Fără urmărire';

  @override
  String get privacyScreenExportTitle => 'Doar tu poți exporta';

  @override
  String get privacyScreenDeleteTitle => 'Ștergerea este definitivă';

  @override
  String get privacyScreenStorage =>
      'Tot ce notezi este criptat și stocat doar pe acest dispozitiv, într-un singur fișier. Cheia de criptare stă în componenta securizată a telefonului — Keychain pe iOS, Keystore pe Android — nu în fișierul propriu-zis.';

  @override
  String get privacyScreenNoNetwork =>
      'Această aplicație nu are server propriu și nici sistem de conturi — notările tale nu se încarcă nicăieri. Versiunea gratuită include reclame Google, care se conectează la internet; ele nu primesc niciodată nimic din ce notezi.';

  @override
  String get privacyScreenNoThirdParty =>
      'Nu există analiză de utilizare, raportare a erorilor sau SDK de urmărire. Singura componentă terță este SDK-ul de reclame Google din versiunea gratuită — Premium îl elimină complet.';

  @override
  String get privacyScreenExport =>
      'Singurul mod în care datele tale părăsesc acest dispozitiv este exportul făcut de tine, iar acel export este criptat cu o parolă știută doar de tine.';

  @override
  String get privacyScreenDelete =>
      'Ștergerea datelor este reală și imediată. Nu există cont și nicio copie de rezervă la noi — odată dispărute, sunt dispărute.';

  @override
  String get adPlaceholderLabel => 'Spațiu publicitar';

  @override
  String get adPlaceholderUpgradeCta => 'Treci la Premium, fără reclame';

  @override
  String get reminderNotificationTitle =>
      'Menstruația ar putea începe în curând';

  @override
  String get reminderNotificationBody =>
      'Pe baza ciclurilor notate, intervalul estimat se apropie.';

  @override
  String get reminderPeriodEndTitle => 'Menstruația ar putea fi pe sfârșite';

  @override
  String get reminderPeriodEndBody =>
      'Dacă încă durează, este absolut normal — e doar o verificare discretă.';

  @override
  String get reminderMedicationTitle => 'Memento pentru medicamente';

  @override
  String get reminderMedicationBody => 'E momentul pentru medicamente.';

  @override
  String get reminderWaterTitle => 'Hidratare';

  @override
  String get reminderWaterBody => 'Un mic memento pentru apă.';

  @override
  String get reminderAppointmentTitle => 'Consultație medicală viitoare';

  @override
  String get reminderAppointmentBody => 'Ai o consultație medicală în curând.';

  @override
  String get settingsExportEntry => 'Export și copie de rezervă';

  @override
  String get exportBackupHeading => 'Copie de rezervă criptată';

  @override
  String get exportBackupBody =>
      'Salvează o copie criptată a istoricului pentru a-l muta pe un dispozitiv nou. Vei avea nevoie din nou de parolă pentru restaurare — altfel nu există nicio cale de recuperare.';

  @override
  String get exportCreateBackupButton => 'Creează copie de rezervă';

  @override
  String get exportRestoreBackupButton =>
      'Restaurează dintr-o copie de rezervă';

  @override
  String get exportPasswordLabel => 'Parolă';

  @override
  String get exportPasswordConfirmLabel => 'Confirmă parola';

  @override
  String get exportPasswordMismatch => 'Parolele nu se potrivesc';

  @override
  String get exportPasswordTooShort => 'Folosește cel puțin 8 caractere';

  @override
  String get exportRestoreConfirmTitle =>
      'Înlocuiești toate datele de pe acest dispozitiv?';

  @override
  String get exportRestoreConfirmBody =>
      'Restaurarea unei copii de rezervă înlocuiește tot ce este notat acum pe acest dispozitiv. Nu se poate reveni.';

  @override
  String get exportRestoreConfirmAction => 'Restaurează';

  @override
  String get exportWrongPassword =>
      'Parola nu se potrivește cu această copie de rezervă';

  @override
  String get exportInvalidFile =>
      'Fișierul nu pare să fie o copie de rezervă Vera';

  @override
  String get exportBackupCreated => 'Copia de rezervă e gata de partajat';

  @override
  String get exportRestoreSuccess => 'Copie de rezervă restaurată';

  @override
  String get exportDoctorReportHeading => 'Raport pentru medic';

  @override
  String get exportDoctorReportBody =>
      'Un rezumat care poate fi arătat unui medic.';

  @override
  String get exportIncludeNotesToggle => 'Include notițele personale';

  @override
  String get exportShareCsvButton => 'Partajează ca CSV';

  @override
  String get exportPrintPdfButton => 'Printează / Salvează ca PDF';

  @override
  String get doctorReportDisclaimer =>
      'Generat de Vera pe baza datelor introduse de utilizator. Nu este un diagnostic medical.';

  @override
  String get doctorReportGeneratedOn => 'Generat la';

  @override
  String get doctorReportSummaryHeading => 'Rezumat';

  @override
  String get doctorReportDailyLogHeading => 'Jurnal zilnic';

  @override
  String get doctorReportColumnDate => 'Data';

  @override
  String get doctorReportTimelineHeading => 'Cronologia ciclurilor';

  @override
  String get doctorReportCycleLabel => 'Ciclu';

  @override
  String get doctorReportTimelineLegendPeriod => 'Menstruație';

  @override
  String get doctorReportTimelineLegendCycle => 'Restul ciclului';

  @override
  String get doctorReportTimelineOngoing => 'În desfășurare';

  @override
  String get dailyInsightLabel => 'Știai că?';

  @override
  String get insightMenstrual1 =>
      'Mucoasa uterină se elimină chiar acum — majoritatea menstruațiilor durează între 3 și 7 zile, iar asta e absolut normal.';

  @override
  String get insightMenstrual2 =>
      'Alimentele bogate în fier, precum legumele cu frunze verzi și lintea, pot compensa ce pierde corpul în această săptămână.';

  @override
  String get insightFollicular1 =>
      'Estrogenul crește, iar multe persoane observă mai multă energie și o concentrare mai bună începând cam de acum.';

  @override
  String get insightFollicular2 =>
      'Corpul pregătește un ovul pentru eliberare — această fază poate dura de la o săptămână la câteva săptămâni.';

  @override
  String get insightFertile1 =>
      'Aceasta este fereastra fertilă estimată — zilele din jurul ovulației în care sarcina este cel mai probabilă, pe baza ritmului obișnuit.';

  @override
  String get insightFertile2 =>
      'Unele persoane observă o ușoară creștere a temperaturii bazale sau modificări ale mucusului cervical în jurul ovulației.';

  @override
  String get insightLuteal1 =>
      'Progesteronul crește după ovulație — atunci apar adesea simptome de SPM, precum schimbările de dispoziție sau balonarea.';

  @override
  String get insightLuteal2 =>
      'Dacă nu s-a implantat o sarcină, nivelurile hormonale scad spre finalul acestei faze, declanșând menstruația următoare.';

  @override
  String get insightUnknown1 =>
      'Durata ciclului variază mult de la o persoană la alta — între 21 și 35 de zile este considerat obișnuit.';

  @override
  String get insightsPhaseTipsTitle => 'Ar putea face bine în această fază';

  @override
  String get tipFitnessLabel => 'Mișcare';

  @override
  String get tipNutritionLabel => 'Alimentație';

  @override
  String get tipFitnessMenstrual =>
      'Mișcarea blândă — plimbare, întindere sau yoga restaurativă — poate fi mai plăcută acum decât antrenamentele intense.';

  @override
  String get tipFitnessFollicular =>
      'Energia crește adesea în această fază — un moment bun pentru un antrenament nou sau pentru un pic mai mult efort.';

  @override
  String get tipFitnessFertile =>
      'Multe persoane se simt cel mai energice aici — o fază bună pentru antrenamente de intensitate mai mare, dacă asta îți place.';

  @override
  String get tipFitnessLuteal =>
      'Dacă energia scade spre finalul acestei faze, lucrul de forță cu intensitate mai mică sau înotul pot fi mai ușor de susținut.';

  @override
  String get tipFitnessUnknown =>
      'Orice mișcare care îți face bine azi este o alegere bună — nu există o singură rutină „corectă” pentru fiecare zi.';

  @override
  String get tipNutritionMenstrual =>
      'Alimentele bogate în fier, precum legumele cu frunze verzi, lintea și carnea roșie, pot compensa ce pierde corpul în această săptămână.';

  @override
  String get tipNutritionFollicular =>
      'Mesele mai ușoare și proaspete cad adesea bine pe măsură ce energia crește — dar nu există un singur mod „corect” de a mânca în această fază.';

  @override
  String get tipNutritionFertile =>
      'Hidratarea și mesele echilibrate susțin energia în această fază, care se simte mai activă.';

  @override
  String get tipNutritionLuteal =>
      'Poftele se pot schimba aici — carbohidrații complecși și alimentele bogate în magneziu, precum nucile și ciocolata neagră, sunt alegeri frecvente.';

  @override
  String get tipNutritionUnknown =>
      'Mesele echilibrate și regulate sunt o bază solidă atunci când faza nu este încă clară.';

  @override
  String get predictionSettingsEntry => 'Setări de estimare';

  @override
  String get predictionSettingsIntro =>
      'Acestea sunt presupuneri, arătate deschis. După 2 cicluri complete notate, estimarea reală de pe ecranul Acasă se calculează din datele tale — aceste cifre nu mai sunt folosite pentru asta.';

  @override
  String get predictionSettingsPeriodLengthLabel =>
      'Durata obișnuită a menstruației';

  @override
  String get predictionSettingsCycleLengthLabel =>
      'Durata obișnuită a ciclului';

  @override
  String get predictionSettingsCycleLengthHint =>
      'Se folosește pentru a scala inelul de pe ecranul Acasă până când există date reale.';

  @override
  String get predictionSettingsLutealLabel => 'Durata fazei luteale';

  @override
  String get predictionSettingsLutealHint =>
      'Numărul obișnuit de zile dintre ovulație și menstruația următoare. Se folosește pentru a plasa fereastra fertilă estimată — aceasta rămâne în uz chiar și după ce încep estimările reale.';

  @override
  String get dayLogEnergyLabel => 'Energie';

  @override
  String get energyLevelLow => 'Scăzută';

  @override
  String get energyLevelMedium => 'Medie';

  @override
  String get energyLevelHigh => 'Ridicată';

  @override
  String get energyLevelEnergetic => 'Debordantă';

  @override
  String get dayLogSkinHairLabel => 'Piele și păr';

  @override
  String get skinHealthyGlow => 'Aspect sănătos';

  @override
  String get skinRedness => 'Roșeață';

  @override
  String get skinDryness => 'Uscăciune';

  @override
  String get skinOiliness => 'Piele grasă';

  @override
  String get hairGoodDay => 'Păr în formă bună';

  @override
  String get hairBadDay => 'Păr greu de aranjat';

  @override
  String get hairLoss => 'Cădere a părului';

  @override
  String get scalpOily => 'Scalp gras';

  @override
  String get dayLogBreastExamLabel => 'Autoexaminarea sânilor';

  @override
  String get breastExamAllNormal => 'Nimic neobișnuit';

  @override
  String get breastExamLump => 'Nodul';

  @override
  String get breastExamIndentation => 'Înfundare a pielii';

  @override
  String get breastExamRedness => 'Roșeață';

  @override
  String get breastExamCrackedNipple => 'Mamelon fisurat';

  @override
  String get breastExamDischarge => 'Secreție';

  @override
  String get cervixPositionLabel => 'Poziția colului uterin';

  @override
  String get cervixPositionLow => 'Joasă';

  @override
  String get cervixPositionMedium => 'Medie';

  @override
  String get cervixPositionHigh => 'Înaltă';

  @override
  String get cervixOpeningLabel => 'Deschiderea colului uterin';

  @override
  String get cervixOpeningClosed => 'Închis';

  @override
  String get cervixOpeningMedium => 'Întredeschis';

  @override
  String get cervixOpeningOpen => 'Deschis';

  @override
  String get cervixFirmnessLabel => 'Consistența colului uterin';

  @override
  String get cervixFirmnessSoft => 'Moale';

  @override
  String get cervixFirmnessMedium => 'Intermediar';

  @override
  String get cervixFirmnessFirm => 'Ferm';

  @override
  String get dayLogWaterLabel => 'Apă';

  @override
  String get dayLogSleepLabel => 'Somn';

  @override
  String get dayLogWeightLabel => 'Greutate';

  @override
  String get dayLogMedicationsLabel => 'Medicamente';

  @override
  String get dayLogAddMedication => 'Adaugă un medicament';

  @override
  String get dayLogMedicationNameHint => 'Denumirea medicamentului';

  @override
  String get dayLogBirthControlLabel => 'Contracepție';

  @override
  String get dayLogOtherMedicationsLabel => 'Alte medicamente';

  @override
  String get birthControlPillTaken => 'Pilulă luată';

  @override
  String get birthControlPillLate => 'Pilulă luată târziu';

  @override
  String get birthControlPillMissed => 'Pilulă uitată';

  @override
  String get birthControlPatch => 'Plasture';

  @override
  String get birthControlRing => 'Inel';

  @override
  String get birthControlInjection => 'Injecție';

  @override
  String get birthControlImplant => 'Implant';

  @override
  String get birthControlIud => 'Sterilet';

  @override
  String get navAssistant => 'Întrebări';

  @override
  String get assistantTitle => 'Vera: întrebări și răspunsuri';

  @override
  String get assistantEndChatTitle => 'Închei această conversație?';

  @override
  String get assistantEndChatBody =>
      'Mesajele sunt doar în memorie și nu se salvează nicăieri, așa că nu pot fi recuperate.';

  @override
  String get assistantEndChatConfirm => 'Încheie conversația';

  @override
  String get assistantInputHint => 'Întreabă despre ciclul tău…';

  @override
  String get assistantIntro =>
      'Bine ai venit! Aici găsești răspunsuri despre menstruație, cicluri și despre felul în care funcționează Vera — chiar pe telefonul tău, fără ca nimic să părăsească dispozitivul. Răspunsurile vin din baza de cunoștințe de pe telefon și nu sunt sfaturi medicale.';

  @override
  String get insightMenstrual3 =>
      'Sângele menstrual nu este „sânge murdar” — este un amestec de sânge și mucoasă uterină, o parte absolut normală a ciclului.';

  @override
  String get insightMenstrual4 =>
      'Căldura blândă pe abdomenul inferior chiar ameliorează crampele — sticla cu apă caldă este un clasic susținut de dovezi.';

  @override
  String get insightMenstrual5 =>
      'Fluxul este adesea cel mai abundent în primele două zile și scade după aceea — acest tipar este obișnuit.';

  @override
  String get insightMenstrual6 =>
      'Oboseala ceva mai mare în timpul menstruației este frecventă — fierul părăsește corpul odată cu sângele menstrual.';

  @override
  String get insightFollicular3 =>
      'Estrogenul reconstruiește mucoasa uterină după menstruație — corpul se pregătește din nou.';

  @override
  String get insightFollicular4 =>
      'Pielea arată adesea cel mai curat în această fază, pe măsură ce nivelurile hormonale se stabilizează.';

  @override
  String get insightFollicular5 =>
      'Rezistența și timpii de reacție ating un vârf la finalul fazei foliculare, pentru multe persoane.';

  @override
  String get insightFollicular6 =>
      'Durata acestei faze este cea care variază cel mai mult între persoane — faza luteală este mult mai constantă.';

  @override
  String get insightFertile3 =>
      'Un ovul trăiește aproximativ 12–24 de ore, dar spermatozoizii pot aștepta până la 5 zile — de aceea fereastra fertilă se întinde pe mai multe zile.';

  @override
  String get insightFertile4 =>
      'În jurul ovulației, mucusul cervical devine adesea transparent și elastic — ca albușul de ou crud.';

  @override
  String get insightFertile5 =>
      'Unele persoane simt o înțepătură scurtă pe o singură parte la ovulație — are chiar și un nume: mittelschmerz.';

  @override
  String get insightFertile6 =>
      'Temperatura bazală crește ușor *după* ovulație — o confirmă mai degrabă decât să o prezică.';

  @override
  String get insightLuteal3 =>
      'Progesteronul atinge un vârf la aproximativ o săptămână după ovulație — balonarea și sensibilitatea sânilor sunt frecvente atunci.';

  @override
  String get insightLuteal4 =>
      'Pofta de carbohidrați înainte de menstruație este reală — nevoia de energie crește ușor în faza luteală.';

  @override
  String get insightLuteal5 =>
      'Simptomele de SPM se atenuează de obicei într-o zi sau două după începerea sângerării.';

  @override
  String get insightLuteal6 =>
      'Un program de somn constant poate atenua vizibil scăderile de dispoziție de la finalul fazei luteale.';

  @override
  String get insightUnknown2 =>
      'Urmărirea a doar trei cicluri este adesea suficientă pentru a vedea cum se conturează tiparul propriu.';

  @override
  String get insightUnknown3 =>
      'Ciclurile sunt personale — comparația cu ciclul altcuiva spune rareori ceva util.';

  @override
  String get insightUnknown4 =>
      'Stresul, călătoriile și bolile pot deplasa ovulația — o menstruație „întârziată” înseamnă adesea doar o ovulație întârziată.';

  @override
  String get settingsThemeLabel => 'Temă';

  @override
  String get settingsThemeSystem => 'Sistem';

  @override
  String get settingsThemeLight => 'Luminoasă';

  @override
  String get settingsThemeDark => 'Întunecată';

  @override
  String get settingsMascotLabel => 'Mascotă însoțitoare';

  @override
  String get mascotDroplet => 'Picătură';

  @override
  String get mascotFlower => 'Floare';

  @override
  String get mascotMoon => 'Lună';

  @override
  String get mascotNone => 'Niciuna';

  @override
  String homeWindowCountdown(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: 'Intervalul estimat începe peste aproximativ $days de zile',
      few: 'Intervalul estimat începe peste aproximativ $days zile',
      one: 'Intervalul estimat începe peste aproximativ o zi',
    );
    return '$_temp0';
  }

  @override
  String homeOvulationCountdown(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: 'Ovulație estimată peste aproximativ $days de zile',
      few: 'Ovulație estimată peste aproximativ $days zile',
      one: 'Ovulație estimată peste aproximativ o zi',
    );
    return '$_temp0';
  }

  @override
  String get homeQuickLogTitle => 'Cum se simte corpul tău azi?';

  @override
  String get actionSave => 'Salvează';

  @override
  String get insightsTrackerHubTitle => 'Urmăririle tale';

  @override
  String get trackerHistoryEmpty => 'Nicio intrare în acest interval încă';

  @override
  String get trackerStatAverage => 'Medie';

  @override
  String get trackerStatLowest => 'Minim';

  @override
  String get trackerStatHighest => 'Maxim';

  @override
  String get trackerStatLatest => 'Ultimul';

  @override
  String get rangeFilter1m => '1 lună';

  @override
  String get rangeFilter3m => '3 luni';

  @override
  String get rangeFilter6m => '6 luni';

  @override
  String get dayLogOvulationTestLabel => 'Test de ovulație';

  @override
  String get ovulationTestNegative => 'Negativ';

  @override
  String get ovulationTestPositive => 'Pozitiv';

  @override
  String get ovulationTestLow => 'Scăzut';

  @override
  String get ovulationTestHigh => 'Ridicat';

  @override
  String get ovulationTestPeak => 'Vârf';

  @override
  String get pregnancyTestLabel => 'Test de sarcină';

  @override
  String get pregnancyTestPositive => 'Pozitiv';

  @override
  String get pregnancyTestFaint => 'Linie slabă';

  @override
  String get pregnancyTestNegative => 'Negativ';

  @override
  String get settingsOvulationTestToggle => 'Test de ovulație';

  @override
  String get settingsRemindersOvulationLabel =>
      'Anunț despre fereastra fertilă';

  @override
  String get reminderOvulationTitle => 'Fereastra fertilă estimată se apropie';

  @override
  String get reminderOvulationBody =>
      'Pe baza ciclurilor notate, fereastra fertilă estimată ar putea începe în curând.';

  @override
  String trackerEntriesCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count de intrări',
      few: '$count intrări',
      one: 'o intrare',
    );
    return '$_temp0';
  }

  @override
  String get trackerLowSampleNote =>
      'Cu atât de puține înregistrări, procentele nu sunt încă fiabile — vor deveni mai precise pe măsură ce înregistrezi mai multe.';

  @override
  String get assistantTyping => 'Vera scrie…';

  @override
  String get premiumTitle => 'Vera Premium';

  @override
  String get premiumHeadline => 'Vera Premium';

  @override
  String get premiumSubhead =>
      'Toate funcțiile de urmărire rămân gratuite pentru totdeauna — istoricul nu este niciodată blocat. Premium adaugă urmăririle tale, analize mai profunde, mementourile tale și aspecte suplimentare, și elimină reclamele.';

  @override
  String get premiumBenefitNoAds => 'Fără reclame, nicăieri în aplicație';

  @override
  String get premiumBenefitSupport =>
      'Susține o aplicație independentă, cu confidențialitatea pe primul loc';

  @override
  String get premiumMonthly => 'Lunar';

  @override
  String get premiumYearly => 'Anual';

  @override
  String get premiumYearlyNote => 'Facturare o dată pe an';

  @override
  String premiumPerMonth(String price) {
    return '$price / lună';
  }

  @override
  String get premiumBilledMonthly => 'Facturat lunar';

  @override
  String get premiumStaysFreeTitle => 'Ce rămâne gratuit';

  @override
  String get premiumStaysFreeBody =>
      'Calendarul, tot istoricul tău, statisticile de bază și exportul rămân gratuite pentru totdeauna. Premium adaugă lucruri, nu ia niciodată nimic înapoi.';

  @override
  String get premiumSubscribeCta => 'Continuă';

  @override
  String get premiumRestore => 'Restaurează achiziția';

  @override
  String get premiumCancelNote =>
      'Anulare oricând din contul tău din magazinul de aplicații. Fără numărători inverse, fără presiune — dacă acum nu e momentul, versiunea gratuită continuă să funcționeze exact ca astăzi.';

  @override
  String get premiumActiveBadge => 'Premium este activ';

  @override
  String get premiumDevToggle => 'Simulează Premium (dezvoltare)';

  @override
  String get settingsPremiumEntry => 'Vera Premium';

  @override
  String get adTestNotice => 'Reclamă de test — nu este încă o afișare reală';

  @override
  String get settingsPregnancyModeLabel => 'Mod sarcină';

  @override
  String get pregnancyLmpLabel => 'Prima zi a ultimei menstruații';

  @override
  String pregnancyWeekLabel(int weeks, int days) {
    return 'Săptămâna $weeks, ziua $days';
  }

  @override
  String get pregnancyDueDateLabel => 'Data estimată a nașterii';

  @override
  String pregnancyDaysLeft(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: 'Au mai rămas aproximativ $days de zile',
      few: 'Au mai rămas aproximativ $days zile',
      one: 'A mai rămas aproximativ o zi',
    );
    return '$_temp0';
  }

  @override
  String pregnancyTrimesterLabel(int n) {
    return 'Trimestrul $n';
  }

  @override
  String get pregnancyDisclaimer =>
      'Datele sunt estimate pornind de la ultima menstruație, cu regula standard de 280 de zile. O ecografie oferă o dată mai exactă, iar o ovulație târzie deplasează aceste cifre — aceasta este informație, nu îngrijire medicală.';

  @override
  String get pregnancySizeLabel => 'Dimensiunea bebelușului';

  @override
  String get pregnancySizeUnder5 => 'Sămânță de mac (~2 mm)';

  @override
  String get pregnancySizeUnder9 => 'Afină (~1.6 cm)';

  @override
  String get pregnancySizeUnder13 => 'Lime (~5.4 cm)';

  @override
  String get pregnancySizeUnder20 => 'Avocado (~11.6 cm)';

  @override
  String get pregnancySizeUnder28 => 'Mango (~30 cm)';

  @override
  String get pregnancySizeUnder34 => 'Ananas (~44 cm)';

  @override
  String get pregnancySizeUnder38 => 'Pepene galben (~46 cm)';

  @override
  String get pregnancySizeTerm => 'Pepene verde mic (~51 cm)';

  @override
  String get pregnancyNoteUnder5 =>
      'Majoritatea persoanelor nu observă nimic încă — pentru că vârsta gestațională se numără de la ultima menstruație, primele două săptămâni sunt de fapt anterioare concepției.';

  @override
  String get pregnancyNoteUnder9 =>
      'Greața, sensibilitatea sânilor și oboseala sunt frecvente acum. Un moment bun pentru a stabili o primă consultație.';

  @override
  String get pregnancyNoteUnder13 =>
      'Se apropie finalul primului trimestru; pentru multe persoane greața începe să se atenueze cam de acum.';

  @override
  String get pregnancyNoteUnder20 =>
      'Energia revine adesea în această perioadă. Primele mișcări pot fi simțite oricând între săptămânile 16 și 22.';

  @override
  String get pregnancyNoteUnder28 =>
      'Mișcările devin distincte și încep să formeze un tipar. Durerea de spate și arsurile la stomac sunt frecvente în această perioadă.';

  @override
  String get pregnancyNoteUnder34 =>
      'Este al treilea trimestru. Respirația scurtă, urinarea frecventă și contracțiile Braxton-Hicks sunt frecvente.';

  @override
  String get pregnancyNoteUnder38 =>
      'Bebelușul se pregătește pentru naștere. Un moment bun pentru bagajul de maternitate și pentru un plan de naștere.';

  @override
  String get pregnancyNoteTerm =>
      'Sarcina este la termen — nașterea poate avea loc oricând între săptămânile 37 și 42; săptămâna 40 este o medie, nu un termen limită.';

  @override
  String get pregnancyWeeklyNoteTitle => 'Săptămâna aceasta';

  @override
  String get pregnancyNeedsLmp =>
      'Adaugă prima zi a ultimei menstruații pentru a începe urmărirea.';

  @override
  String get pregnancyOutOfRange =>
      'Data respectivă este mai veche de 42 de săptămâni — actualizeaz-o sau dezactivează modul sarcină.';

  @override
  String get partnerShareTitle => 'Partajează un rezumat cu partenerul';

  @override
  String get partnerShareBody =>
      'Creează un scurt rezumat text — faza curentă și intervalul estimat — pe care îl trimiți chiar tu prin orice aplicație. Nu există sincronizare live și nici cont de partener: nimic nu este partajat decât dacă îl trimiți.';

  @override
  String get partnerShareCta => 'Creează rezumatul';

  @override
  String get partnerSummaryHeader => 'Rezumatul ciclului din Vera';

  @override
  String get settingsHomeThemeLabel => 'Fundal ecran principal';

  @override
  String get homeThemeWheat => 'Grâu';

  @override
  String get homeThemeSky => 'Cer';

  @override
  String get homeThemeField => 'Câmp';

  @override
  String get homeThemeBlossom => 'Floare de pom';

  @override
  String get homeThemePlain => 'Simplu';

  @override
  String get backupNudgeTitle => 'Păstrează o copie a datelor tale';

  @override
  String get backupNudgeBody =>
      'Totul există doar pe acest telefon. Dacă se pierde, se strică sau este resetat, istoricul dispare odată cu el — o copie de rezervă criptată durează o clipă și doar tu o poți deschide.';

  @override
  String get backupNudgeCta => 'Fă o copie acum';

  @override
  String get backupNudgeDismiss => 'Mai târziu';

  @override
  String backupLastDone(String date) {
    return 'Ultima copie de rezervă: $date';
  }

  @override
  String get backupNever => 'Nicio copie de rezervă încă';

  @override
  String get settingsRemindersBackupLabel =>
      'Amintește-mi să fac o copie de rezervă';

  @override
  String get reminderBackupTitle => 'E momentul pentru o copie de rezervă Vera';

  @override
  String get reminderBackupBody =>
      'Istoricul tău există doar pe acest telefon. O copie de rezervă criptată rapidă îl păstrează în siguranță.';

  @override
  String get notificationChannelPeriodStart => 'Menstruație apropiată';

  @override
  String get notificationChannelPeriodEnd =>
      'Verificare la finalul menstruației';

  @override
  String get notificationChannelMedication => 'Medicamente';

  @override
  String get notificationChannelWater => 'Apă';

  @override
  String get notificationChannelAppointment => 'Programare';

  @override
  String get notificationChannelOvulation => 'Fereastră fertilă';

  @override
  String get notificationChannelBackup => 'Memento pentru copia de rezervă';

  @override
  String get calendarDayDetailTitle => 'Ziua aceasta';

  @override
  String get calendarDayNothingLogged => 'Nimic notat pentru această zi încă';

  @override
  String get calendarDayOpenLog => 'Deschide jurnalul zilei';

  @override
  String get cycleHistoryTitle => 'Cicluri anterioare';

  @override
  String get cycleTrendsTitle => 'Tendințele ciclului';

  @override
  String get cycleHistoryEmpty =>
      'Notează câteva menstruații și istoricul ciclurilor apare aici.';

  @override
  String get cycleHistoryOngoing => 'În desfășurare';

  @override
  String cycleHistoryLength(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: 'Ciclu de $days de zile',
      few: 'Ciclu de $days zile',
      one: 'Ciclu de o zi',
    );
    return '$_temp0';
  }

  @override
  String cycleHistoryPeriodLength(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: 'Menstruația a durat $days de zile',
      few: 'Menstruația a durat $days zile',
      one: 'Menstruația a durat o zi',
    );
    return '$_temp0';
  }

  @override
  String cycleHistoryVsAverage(String diff) {
    return '$diff față de media ta';
  }

  @override
  String get insightsCycleHistoryEntry => 'Cicluri anterioare';

  @override
  String get homeEmptyTitle => 'Să începem cu ultima menstruație';

  @override
  String get homeEmptyBody =>
      'Apasă butonul de mai sus în ziua în care începe menstruația. După două cicluri complete, Vera poate începe să estimeze — până atunci nu se preface că știe.';

  @override
  String get homeEmptyBackdate => 'A început deja mai devreme';

  @override
  String get settingsAdPrivacyEntry =>
      'Opțiuni de confidențialitate pentru reclame';

  @override
  String a11yCycleRing(int day, int length) {
    return 'Ziua $day din aproximativ $length ale ciclului';
  }

  @override
  String a11yChartSummary(int count, String min, String max) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Grafic cu $count de intrări, de la $min la $max',
      few: 'Grafic cu $count intrări, de la $min la $max',
      one: 'Grafic cu o intrare, de la $min la $max',
    );
    return '$_temp0';
  }

  @override
  String a11yPhaseBar(int day, int length) {
    return 'Progresul ciclului: ziua $day din aproximativ $length';
  }

  @override
  String a11yFrequencyItem(String label, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'de $count de ori',
      few: 'de $count ori',
      one: 'o dată',
    );
    return '$label: $_temp0';
  }

  @override
  String get importTitle => 'Importă din altă aplicație';

  @override
  String get importBody =>
      'Exportă istoricul din aplicația veche sub formă de CSV, apoi alege fișierul aici. Se importă doar datele și fluxul — formularea simptomelor și a dispoziției diferă de la o aplicație la alta, iar Vera nu ghicește ce ai vrut să spui.';

  @override
  String get importPickFile => 'Alege fișierul CSV';

  @override
  String importPreview(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'S-au găsit $count de zile de istoric',
      few: 'S-au găsit $count zile de istoric',
      one: 'S-a găsit o zi de istoric',
    );
    return '$_temp0';
  }

  @override
  String importSkipped(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count de rânduri nu au putut fi citite și vor fi omise',
      few: '$count rânduri nu au putut fi citite și vor fi omise',
      one: 'Un rând nu a putut fi citit și va fi omis',
    );
    return '$_temp0';
  }

  @override
  String get importConfirm => 'Adaugă în istoricul meu';

  @override
  String get importMergeNote =>
      'Zilele importate sunt îmbinate. Zilele deja notate în Vera rămân neschimbate.';

  @override
  String importDone(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'S-au importat $count de zile',
      few: 'S-au importat $count zile',
      one: 'S-a importat o zi',
    );
    return '$_temp0';
  }

  @override
  String get importErrorEmpty => 'Fișierul pare gol.';

  @override
  String get importErrorNoDate =>
      'Nu s-a găsit o coloană cu date în acel fișier.';

  @override
  String get settingsImportEntry => 'Importă din altă aplicație';

  @override
  String get settingsHealthSyncLabel =>
      'Sincronizare cu Apple Health / Health Connect';

  @override
  String get settingsHealthSyncBody =>
      'Scrie doar fluxul menstrual, greutatea și temperatura bazală în aplicația de sănătate a telefonului. Simptomele, dispozițiile și notițele rămân în Vera. Nu se citește nimic înapoi.';

  @override
  String healthSyncBackfilled(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'S-au trimis $count de zile către aplicația de sănătate',
      few: 'S-au trimis $count zile către aplicația de sănătate',
      one: 'S-a trimis o zi către aplicația de sănătate',
    );
    return '$_temp0';
  }

  @override
  String get healthSyncDenied =>
      'Permisiunea nu a fost acordată, așa că sincronizarea rămâne dezactivată.';

  @override
  String get settingsDiagnosticsEntry => 'Diagnosticare';

  @override
  String get diagnosticsBody =>
      'Dacă aplicația se comportă ciudat, detaliile tehnice sunt înregistrate aici — doar pe acest dispozitiv. Nimic nu se trimite nicăieri decât dacă alegi să trimiți, iar întâi poți citi exact ce ai trimite.';

  @override
  String get diagnosticsEmpty =>
      'Nimic înregistrat — nu au fost detectate probleme.';

  @override
  String get diagnosticsShare => 'Trimite către dezvoltator';

  @override
  String get diagnosticsClear => 'Golește';

  @override
  String get diagnosticsNoteLabel => 'Ce s-a întâmplat? (opțional)';

  @override
  String get diagnosticsTechnicalDetail => 'Detalii tehnice';

  @override
  String get unitHoursShort => 'h';

  @override
  String get unitMinutesShort => 'm';

  @override
  String get unitHoursLong => 'ore';

  @override
  String get unitMinutesLong => 'minute';

  @override
  String get unitMilliliters => 'ml';

  @override
  String get unitKilograms => 'kg';

  @override
  String get calendarJumpTitle => 'Sari la o lună';

  @override
  String get calendarJumpYearLabel => 'An';

  @override
  String get settingsAdPrivacyUnavailable =>
      'Opțiunile de personalizare a reclamelor nu sunt oferite în regiunea ta — reclamele de aici sunt deja nepersonalizate.';

  @override
  String get settingsGroupAppearance => 'Aspect';

  @override
  String get settingsGroupTracking => 'Preferințe de urmărire';

  @override
  String get dayLogCustomTagsLabel => 'Urmăririle mele';

  @override
  String get customTagAddButton => 'Adaugă o urmărire';

  @override
  String get customTagDialogTitle => 'Urmărire nouă';

  @override
  String get customTagDialogHint => 'de ex. migrenă, sală, insomnie';

  @override
  String get customTagManageEntry => 'Gestionează urmăririle mele';

  @override
  String get customTagRenameTitle => 'Redenumește urmărirea';

  @override
  String get customTagDeleteTitle => 'Ștergi această urmărire?';

  @override
  String get customTagDeleteBody =>
      'Va fi eliminată din fiecare zi în care a fost folosită. Celelalte notări rămân neschimbate.';

  @override
  String get customTagEmpty => 'Nicio urmărire proprie încă.';

  @override
  String get premiumLockedTitle => 'Funcție Premium';

  @override
  String get premiumLockedAction => 'Vezi Premium';

  @override
  String get premiumBenefitCustomTrackers =>
      'Urmărește orice vrei, în propriile cuvinte';

  @override
  String get premiumBenefitAdvancedInsights =>
      'Analize avansate: ce tinde să se întâmple și când';

  @override
  String get premiumBenefitPersonalisation =>
      'Fundaluri și mascote suplimentare';

  @override
  String get premiumBenefitAdvancedReminders => 'Mementouri după programul tău';

  @override
  String get advancedInsightsTitle => 'Analize avansate';

  @override
  String get advancedInsightsEntry => 'Analize avansate';

  @override
  String get advancedInsightsNotEnough =>
      'Notează trei cicluri complete și tiparele tale vor apărea aici. Cu mai puține, orice „tipar” ar fi doar o coincidență.';

  @override
  String get advancedInsightsPatternsTitle => 'Când tind să apară lucrurile';

  @override
  String advancedInsightsPatternLine(String label, String segment) {
    return '$label — cel mai des $segment';
  }

  @override
  String advancedInsightsPatternDetail(int count, int day) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count de zile notate, în jurul zilei $day a ciclului',
      few: '$count zile notate, în jurul zilei $day a ciclului',
      one: 'o zi notată, în jurul zilei $day a ciclului',
    );
    return '$_temp0';
  }

  @override
  String advancedInsightsNoPattern(String label) {
    return '$label — încă niciun ritm clar';
  }

  @override
  String get advancedInsightsTrendTitle => 'Durata ciclului în timp';

  @override
  String advancedInsightsDriftLonger(String days, String cycles) {
    return 'Comparând primele tale $cycles cicluri cu ultimele $cycles, cele recente sunt cu aproximativ $days zile mai lungi.';
  }

  @override
  String advancedInsightsDriftShorter(String days, String cycles) {
    return 'Comparând primele tale $cycles cicluri cu ultimele $cycles, cele recente sunt cu aproximativ $days zile mai scurte.';
  }

  @override
  String advancedInsightsDriftStable(String cycles) {
    return 'Comparând primele tale $cycles cicluri cu ultimele $cycles, durata ciclului a rămas aproximativ aceeași.';
  }

  @override
  String get advancedInsightsDriftNotEnough =>
      'După șase cicluri complete, Vera poate compara primele cicluri cu cele mai recente, pentru a vedea dacă durata ciclului se schimbă treptat.';

  @override
  String get advancedInsightsMoodTitle =>
      'Dispoziția în funcție de partea ciclului';

  @override
  String get advancedInsightsDisclaimer =>
      'Acestea sunt doar numărători ale lucrurilor notate, nimic mai mult. Nu sunt un diagnostic, iar un tipar de aici nu este o cauză.';

  @override
  String get segmentPeriod => 'în timpul menstruației';

  @override
  String get segmentAfterPeriod => 'după menstruație';

  @override
  String get segmentMidCycle => 'la mijlocul ciclului';

  @override
  String get segmentBeforePeriod => 'înainte de menstruație';

  @override
  String get customRemindersEntry => 'Mementourile mele';

  @override
  String get customRemindersTitle => 'Mementourile mele';

  @override
  String get customRemindersEmpty => 'Niciun memento propriu încă.';

  @override
  String get customRemindersAdd => 'Adaugă un memento';

  @override
  String get customReminderLabelHint => 'de ex. ia pastila, bea apă';

  @override
  String get customReminderLockScreenNote =>
      'Textul mementoului apare pe ecranul de blocare, așa că păstrează-l atât de discret pe cât vrei să fie.';

  @override
  String get customReminderDelete => 'Șterge mementoul';

  @override
  String get homeThemeDusk => 'Amurg';

  @override
  String get homeThemeMeadow => 'Pajiște';

  @override
  String get homeThemePetal => 'Petală';

  @override
  String get homeThemeBloom => 'Înflorire';

  @override
  String get homeThemeOcean => 'Ocean';

  @override
  String get homeThemeAutumn => 'Toamnă';

  @override
  String get homeThemeNight => 'Noapte';

  @override
  String get mascotStar => 'Stea';

  @override
  String get mascotLeaf => 'Frunză';

  @override
  String get mascotCat => 'Pisică';

  @override
  String get mascotRabbit => 'Iepuraș';

  @override
  String get mascotBird => 'Pasăre';

  @override
  String get tipDetailWhatsHappening => 'Ce se întâmplă în corpul tău';

  @override
  String get tipDetailGeneralHeading => 'Sugestii generale';

  @override
  String get tipDetailDisclaimer =>
      'Acestea sunt informații generale, nu sfaturi medicale personale. Fiecare corp reacționează diferit, iar felul în care te simți contează mai mult decât orice sugestie de aici. Dacă ceva te îngrijorează, discută cu un medic.';

  @override
  String get phaseExplainerMenstrual =>
      'Sângerezi pentru că mucoasa uterină se desprinde. Estrogenul și progesteronul sunt la cel mai scăzut nivel din ciclu, și de aceea multe persoane se simt mai obosite și mai retrase în primele zile. Sângerarea durează de obicei între trei și șapte zile și este cea mai abundentă la început. Crampele vin din contracțiile uterului, declanșate de prostaglandine — compuși asemănători hormonilor, eliberați pe măsură ce mucoasa se descompune, și motivul pentru care unele persoane au în același timp dureri lombare sau tranzit accelerat. Sângerarea costă și fier, iar asta explică o parte din oboseală. Căldura, mișcarea și somnul ajută de obicei. Dacă însă protecția se îmbibă din oră în oră, dacă sângerarea depășește clar o săptămână sau dacă durerea te împiedică să faci lucruri obișnuite, merită discutat cu un medic în loc să aștepți să treacă.';

  @override
  String get phaseExplainerFollicular =>
      'După ce se termină sângerarea, estrogenul începe din nou să crească. În ovare se maturizează un grup de foliculi, fiecare cu câte un ovul, și de regulă doar unul ajunge să fie eliberat. Estrogenul reconstruiește mucoasa tocmai eliminată, iar majoritatea observă că energia, dispoziția, pielea și rezistența revin odată cu el. Aceasta este și partea ciclului care variază cel mai mult de la o persoană la alta și de la o lună la alta — stresul, boala, călătoriile și somnul se văd mai ales aici, lungind-o sau scurtând-o. Ăsta e motivul onest pentru care o predicție este un interval și nu o dată: a doua jumătate a ciclului stă destul de stabilă, iar jumătatea asta este cea care se mișcă.';

  @override
  String get phaseExplainerFertile =>
      'Estrogenul este aproape de vârf, iar ovulația este așteptată în jurul acestor zile. Un vârf de hormon luteinizant declanșează eliberarea ovulului cam la o zi — o zi și jumătate după aceea. Ovulul în sine supraviețuiește aproximativ 12 până la 24 de ore, dar spermatozoizii pot trăi câteva zile într-un mucus cervical fertil — de aceea fereastra se numără în mai multe zile și nu într-una singură. Mucusul devine de obicei transparent, elastic și alunecos, puțin ca albușul crud; unele persoane observă mai multă dorință, sâni sensibili sau o înțepătură scurtă într-o parte. Energia este adesea la cel mai înalt punct al ciclului. Ține minte că fereastra asta este o estimare din propriul tău istoric, nu o măsurătoare, și nu este o metodă de contracepție.';

  @override
  String get phaseExplainerLuteal =>
      'După ovulație, foliculul golit devine corp galben și începe să producă progesteron, care menține mucoasa stabilă în caz că se implantează o sarcină. Dacă nu se întâmplă, progesteronul și estrogenul scad brusc și începe menstruația. Această jumătate a ciclului este cea mai constantă, de obicei în jur de 12 până la 14 zile. Progesteronul ridică ușor temperatura de repaus — exact schimbarea pe care o prinde un termometru bazal — și poate încetini digestia, ceea ce explică o parte din balonare. Scăderea de la final este cea care declanșează sindromul premenstrual la multe persoane: sâni tensionați, modificări de apetit, somn întrerupt, dureri de cap și schimbări de dispoziție, care de obicei se atenuează odată ce începe sângerarea. Dacă simptomele îți perturbă munca sau relațiile în majoritatea lunilor, merită discutat cu un medic.';

  @override
  String get phaseExplainerUnknown =>
      'Nu s-a înregistrat încă suficient pentru a spune în ce fază ești. Vera are nevoie de cel puțin două cicluri complete — un început de menstruație și apoi următorul — ca să calculeze media și variația ta, și preferă să spună asta decât să inventeze o fază. Între timp nimic nu se pierde: fiecare zi pe care o înregistrezi face parte din acel prim calcul, iar estimarea se îngustează pe măsură ce istoricul crește. Până atunci, sugestiile de mai jos sunt generale și se aplică în orice punct al ciclului.';

  @override
  String get tipFitnessDetailMenstrual =>
      'Antrenamentul intens nu li se potrivește multora în primele zile, și nu e o chestiune de disciplină — energia chiar este mai scăzută, iar fierul pierdut cu sângerarea face munca de rezistență mai grea decât s-a simțit aceeași ședință săptămâna trecută. Mersul pe jos, întinderile blânde, yoga restaurativă și lucrul cu respirația îmbunătățesc circulația și pot atenua crampele; la unele persoane, mișcarea regulată de-a lungul întregii luni reduce intensitatea crampelor mai mult decât orice fac în ziua respectivă. Dacă te simți bine, nu există motiv să eviți ședințele grele: sângerarea nu e un motiv să te oprești din sport, iar multe sportive concurează chiar atunci. Câteva note practice: ședințele lungi și solicitante în zilele cu flux abundent pot adânci oboseala, căldura pe abdomenul inferior înainte de start face mișcarea mai confortabilă, iar puțină apă în plus față de obicei ajută la durerile de cap din aceste zile. Judecă ședința după cum se simte pe parcurs, nu după cum arăta cea mai bună săptămână a ta.';

  @override
  String get tipFitnessDetailFollicular =>
      'Pe măsură ce estrogenul crește, majoritatea se simt mai puternice și mai rezistente; de obicei aceasta este cea mai bună perioadă din ciclu pentru a începe ceva nou, a adăuga greutate sau a mări ritmul. Refacerea musculară este relativ eficientă aici, așa că ședințele grele sunt absorbite mai bine și lasă mai puțină durere persistentă. Este și o fereastră bună pentru ce cere minte limpede, nu doar corp puternic — să înveți o mișcare nouă, să corectezi tehnica sau să faci o distanță mai lungă decât până acum. Două rezerve merită păstrate: crește gradual, pentru că multă energie nu înseamnă risc zero de accidentare, iar majoritatea accidentărilor de suprasolicitare încep într-o săptămână bună, nu într-una proastă. Și protejează-ți somnul — adaptarea se produce în refacere, nu în timpul ședinței.';

  @override
  String get tipFitnessDetailFertile =>
      'Energia și motivația sunt de obicei la maxim, așa că ședințele solicitante merg bine — recordurile personale cad adesea aici. Unele studii sugerează că articulațiile sunt puțin mai laxe în jurul ovulației; efectul practic este discutat, dar o încălzire mai lungă rămâne o precauție ieftină în sporturile cu schimbări bruște de direcție, sărituri și aterizări. Temperatura corpului este încă scăzută față de a doua jumătate a ciclului, deci căldura limitează aici mai puțin decât o va face peste o săptămână sau două. O înțepătură scurtă într-o parte a abdomenului inferior în jurul ovulației este frecventă și trece de obicei în câteva ore. Dacă durerea este puternică, pe o singură parte și persistentă, apare febră sau te simți leșinată, oprește-te și cere un consult în loc să continui.';

  @override
  String get tipFitnessDetailLuteal =>
      'Pe măsură ce se apropie menstruația, energia poate scădea, pulsul poate fi mai ridicat la același efort, iar refacerea poate dura mai mult. Este o oscilație așteptată, nu un regres, și nu șterge munca ultimelor două săptămâni. Progesteronul ridică ușor temperatura de repaus și îngreunează eliminarea căldurii, așa că ședințele pe caniculă sau umezeală par disproporționat de grele aici — antrenamentul mai devreme sau mai târziu în zi și hidratarea peste ce pare necesar ajută amândouă. Ședințele moderate, o versiune puțin mai ușoară a lucrului de forță și mersul pe jos sunt de obicei mai sustenabile. Cu balonare și sâni sensibili, un sutien sport care susține bine și o încălzire mai lungă fac o diferență reală. Dacă dispoziția e scăzută, fă ședința scurtă și ușoară în loc să o sari de tot — pragul de la care contează este mai jos decât pare.';

  @override
  String get tipFitnessDetailUnknown =>
      'Chiar fără să știi faza, mișcarea ajută oricând: recomandarea generală este în jur de 150 de minute de activitate moderată pe săptămână, împărțite în majoritatea zilelor, plus lucru de tonifiere de două ori pe săptămână — iar tiparul acesta dă aproape tuturor mai mult decât ședințele foarte intense ocazionale. Consecvența cântărește mai mult decât intensitatea, iar cea mai bună ședință este cea pe care chiar o repeți săptămâna viitoare. Ajustează după cum te simți: în zilele obosite contează și o plimbare, iar o ședință scurtă făcută valorează mai mult decât una lungă sărită. După ce înregistrezi câteva cicluri, aici vor apărea sugestii pe faze.';

  @override
  String get tipNutritionDetailMenstrual =>
      'Sângerarea te costă fier; carnea roșie, lintea, năutul, legumele cu frunze verzi închise și melasa ajută la refacere. Fierul vegetal se absoarbe considerabil mai bine împreună cu vitamina C — să storci lămâie peste o mâncare de linte este varianta cea mai practică, iar o salată de roșii alături face același lucru. Ceaiul și cafeaua la masă reduc absorbția fierului din cauza taninurilor, așa că e suficient să lași aproximativ o oră între ele; nu trebuie să renunți la niciunul. Consumul suficient de apă poate ușura oboseala și durerile de cap care însoțesc sângerarea, iar alimentele bogate în magneziu, ca nucile, semințele și verdețurile închise la culoare, ajută unele persoane cu crampele. În zilele în care digestia merge greu, mesele mici și regulate cad mai bine decât cele copioase. Dacă în jurul menstruației simți des lipsă de aer, amețeli sau o oboseală neobișnuită, merită menționat unui medic — fierul scăzut este frecvent, ușor de verificat, și nu ceva ce ar trebui să diagnosticheze o aplicație.';

  @override
  String get tipNutritionDetailFollicular =>
      'Odată cu revenirea energiei, corpul este în modul reconstrucție: suficiente proteine, cereale integrale și legume susțin asta, iar în această fază apetitul este de obicei cel mai stabil și cel mai ușor de gestionat. Are sens și să continui refacerea rezervelor de fier după sângerare, în loc să tratezi asta ca pe o sarcină doar a săptămânii de menstruație — rezervele se refac în săptămâni, nu în zile. Să nu sari peste mese este mai ușor aici, iar asta te face să intri mai echilibrată în oscilațiile de apetit ale fazei următoare. Dacă vrei să schimbi felul în care mănânci, perioada aceasta e de obicei mai blândă pentru un început decât săptămâna dinaintea menstruației, când poftele și dispoziția scăzută fac orice rutină nouă să pară mai grea decât este.';

  @override
  String get tipNutritionDetailFertile =>
      'Aici nu e nevoie de nicio dietă specială; mesele echilibrate și apa suficientă fac cea mai mare parte din treabă. Unele persoane se simt balonate în jurul ovulației, ceea ce e de obicei hormonal și trecător, nu urmarea a ce au mâncat. Apetitul scade ușor la unele și crește la altele — ambele sunt obișnuite. Menținerea proteinelor și a fibrelor în mese stabilizează energia în ceea ce e adesea perioada cea mai activă a lunii. Dacă plănuiești o sarcină, este un moment potrivit să întrebi un medic despre acidul folic, recomandat în general înainte de concepție și nu după — dar aceea e o discuție cu el, nu un sfat pe care ar trebui să-l dea o aplicație.';

  @override
  String get tipNutritionDetailLuteal =>
      'Apetitul crescut și pofta de dulce pe măsură ce progesteronul urcă sunt foarte frecvente; e o deplasare hormonală, nu o problemă de voință, iar corpul chiar consumă puțin mai multă energie în această fază. Adăugarea de proteine și fibre la mese menține glicemia mai stabilă și îmblânzește pofta mult mai bine decât încercarea de a o ignora — o poftă întâmpinată cu ceva consistent se termină de obicei mai devreme decât una cu care te lupți o oră. Mai puțină sare și mai multă apă pot ușura balonarea; sună invers, dar nu este: bine hidratat, corpul reține mai puțin. Alimentele bogate în magneziu (migdale, nuci, verdețuri închise la culoare, ciocolată neagră) reduc crampele și tensiunea la unele persoane. Reducerea cofeinei după prânz ajută la somnul întrerupt al acestei faze, iar alcoolul merită și el atenție, pentru că fragmentează somnul exact în punctul ciclului în care este deja mai superficial.';

  @override
  String get tipNutritionDetailUnknown =>
      'Indiferent de fază, aceleași lucruri ajută cel mai mult: mese regulate, suficiente proteine, multe legume, apă suficientă și alimente bogate în fier. Fiindcă sângerarea costă fier, e de ajuns să fii puțin mai atentă în acele zile — nu e nevoie de o alimentație diferită pentru fiecare săptămână din lună. Să mănânci la ore aproximativ constante face mai mult pentru o energie stabilă decât orice aliment luat separat, și nu trebuie eliminat niciun ingredient ca un ciclu să fie sănătos. După ce înregistrezi câteva cicluri, aici vor apărea sugestii pe faze.';

  @override
  String get tipSleepLabel => 'Somn';

  @override
  String get tipSleepMenstrual =>
      'Crampele și disconfortul pot fragmenta somnul; un duș cald sau o pernă termică înainte de culcare pot ajuta.';

  @override
  String get tipSleepFollicular =>
      'Odată cu energia crescută, multe se simt mai treze — nevoia reală de somn însă nu scade cu adevărat.';

  @override
  String get tipSleepFertile =>
      'Ușoara creștere a temperaturii corpului aproape de ovulație poate îngreuna puțin adormirea; o cameră mai răcoroasă poate ajuta.';

  @override
  String get tipSleepLuteal =>
      'Progesteronul crește ușor temperatura de repaus și poate face somnul profund mai ușor; o cameră răcoroasă și întunecată și o oră fixă de culcare ajută cel mai mult aici.';

  @override
  String get tipSleepUnknown =>
      'Calitatea somnului tinde să varieze pe parcursul ciclului — de obicei cea mai fragilă chiar înainte și în timpul menstruației. O oră de culcare constantă este cea mai fiabilă bază indiferent de fază.';

  @override
  String get tipSleepDetailMenstrual =>
      'În timpul menstruației, somnul este adesea mai fragmentat — crampele, disconfortul și, pentru unele, vizitele mai frecvente la baie pot trezi noaptea. Un duș cald, o pernă termică sau întinderi ușoare înainte de culcare pot calma crampele. Dacă iei analgezice, sincronizarea astfel încât efectul să acopere prima parte a nopții poate proteja somnul timpuriu.';

  @override
  String get tipSleepDetailFollicular =>
      'Odată cu creșterea estrogenului, multe se simt mai alerte și mai energice, ceea ce poate părea o nevoie mai mică de somn. Nu este chiar așa — starea de veghe vine doar mai ușor. Menținerea unei ore de culcare constante aici dă roade mai târziu, când somnul devine mai fragil în alte faze.';

  @override
  String get tipSleepDetailFertile =>
      'Ușoara creștere a temperaturii corpului aproape de ovulație poate îngreuna puțin adormirea, deoarece corpul vrea natural să se răcească înainte de somn. O cameră mai răcoroasă, o pătură mai ușoară sau un duș cald înainte de culcare pot compensa. Cine observă dorință sau energie socială mai mare în această perioadă poate alege și să stea trează mai târziu.';

  @override
  String get tipSleepDetailLuteal =>
      'Progesteronul care crește după ovulație ridică ușor temperatura de repaus, ceea ce poate face somnul profund mai ușor — uneori ca o ușoară bufeu de căldură, alteori doar ca somn mai puțin odihnitor. Pe măsură ce menstruația se apropie, tensiunea premenstruală se poate adăuga. O cameră răcoroasă și întunecată, mai puțin ecran înainte de culcare și o oră fixă de culcare ajută cel mai mult aici.';

  @override
  String get tipSleepDetailUnknown =>
      'Nu sunt încă suficiente date pentru a stabili faza actuală, dar variația calității somnului pe parcursul ciclului este un tipar comun — de obicei mai fragilă chiar înainte și în timpul menstruației, mai stabilă în prima jumătate. Cea mai fiabilă bază indiferent de fază: ore constante de culcare și trezire, mai puțin ecran înainte de culcare și o cameră răcoroasă și întunecată.';
}
