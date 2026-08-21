// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Ukrainian (`uk`).
class AppLocalizationsUk extends AppLocalizations {
  AppLocalizationsUk([String locale = 'uk']) : super(locale);

  @override
  String get appTitle => 'Vera';

  @override
  String get actionSkip => 'Пропустити';

  @override
  String get actionContinue => 'Далі';

  @override
  String get actionDone => 'Готово';

  @override
  String get actionCancel => 'Скасувати';

  @override
  String get actionClear => 'Очистити';

  @override
  String get actionDelete => 'Видалити';

  @override
  String get actionEnable => 'Увімкнути';

  @override
  String get commonIDontKnow => 'Не знаю';

  @override
  String get commonYes => 'Так';

  @override
  String get commonNo => 'Ні';

  @override
  String get commonNotSure => 'Важко сказати';

  @override
  String get pinSetupTitle => 'Створи PIN-код';

  @override
  String get pinSetupEnterPrompt =>
      'Обери 6-значний PIN-код, щоб заблокувати застосунок';

  @override
  String get pinSetupConfirmPrompt => 'Введи його ще раз для підтвердження';

  @override
  String get pinSetupMismatch => 'Коди не збіглися — спробуймо ще раз';

  @override
  String get pinSetupBiometricTitle => 'Розблоковувати швидше?';

  @override
  String get pinSetupBiometricBody =>
      'Розблоковувати можна також відбитком пальця або обличчям — PIN-код лишається як запасний варіант.';

  @override
  String get lockScreenTitle => 'Заблоковано';

  @override
  String get lockScreenEnterPin => 'Введи PIN-код';

  @override
  String get lockScreenWrongPin => 'Цей PIN-код не збігається';

  @override
  String get lockScreenUseBiometrics => 'Використати біометрію';

  @override
  String get lockScreenUseFaceId => 'Використати Face ID';

  @override
  String get lockScreenUseFingerprint => 'Використати відбиток пальця';

  @override
  String get lockScreenForgotPin => 'Не пам’ятаєш PIN-код?';

  @override
  String get lockScreenForgotPinChoiceTitle => 'Як ти хочеш його скинути?';

  @override
  String get lockScreenResetViaDevice => 'Підтвердити цим пристроєм';

  @override
  String get lockScreenResetViaDeviceBody =>
      'Твої дані залишаться. Достатньо підтвердити власним блокуванням телефона — Face ID, відбитком або паролем.';

  @override
  String get lockScreenResetViaDeviceReason =>
      'Підтвердьте особу, щоб встановити новий PIN';

  @override
  String lockScreenThrottled(int seconds) {
    return 'Забагато спроб. Спробуй ще раз через $seconds с';
  }

  @override
  String get lockScreenEraseTitle => 'Стерти всі дані?';

  @override
  String get lockScreenEraseBody =>
      'Це назавжди видалить усе на цьому пристрої. Немає ні облікового запису, ні резервної копії на сервері, тож скасувати це неможливо.';

  @override
  String get lockScreenEraseConfirm => 'Стерти все';

  @override
  String get onboardingPrivacyTitle => 'Вітаємо';

  @override
  String get onboardingPrivacyBody =>
      'Дані про твій цикл зберігаються лише на цьому пристрої, у зашифрованому вигляді. Немає ні облікового запису, ні синхронізації з хмарою — нічого із записаного не вивантажується. Ключ шифрування зберігається в захищеному апаратному модулі телефона, а експортувати чи стерти все можна будь-коли.';

  @override
  String get onboardingLastPeriodTitle => 'Коли почалися останні місячні?';

  @override
  String get onboardingLastPeriodBody =>
      'Це допоможе нам почати — виправити дату завжди можна пізніше в календарі.';

  @override
  String get onboardingPickDate => 'Обрати дату';

  @override
  String get onboardingCycleLengthTitle => 'Скільки зазвичай триває твій цикл?';

  @override
  String get onboardingCycleLengthBody =>
      'Приблизного числа достатньо. Справжню оцінку ми почнемо давати, коли побачимо кілька повних циклів.';

  @override
  String get onboardingPeriodLengthTitle =>
      'Скільки днів зазвичай тривають місячні?';

  @override
  String get onboardingPeriodLengthBody =>
      'Ми використаємо це, щоб заповнити останні місячні — і ти почнеш не з нуля.';

  @override
  String get onboardingDaysUnit => 'дн.';

  @override
  String get onboardingGoalTitle => 'Що привело тебе сюди?';

  @override
  String get onboardingGoalBody =>
      'Це лише допомагає показати потрібне першим — змінити вибір можна будь-коли в Налаштуваннях.';

  @override
  String get goalTrackPeriod => 'Стежити за місячними';

  @override
  String get goalTryingToConceive => 'Намагатися завагітніти';

  @override
  String get goalPregnancyTracking => 'Стежити за вагітністю';

  @override
  String get onboardingRegularityTitle => 'Чи зазвичай твої місячні регулярні?';

  @override
  String get onboardingRegularityBody =>
      'Тут немає неправильної відповіді — це просто допоможе нам трохи краще зрозуміти твоє тіло.';

  @override
  String get onboardingCrampsTitle => 'Чи бувають у тебе спазми?';

  @override
  String get onboardingCrampsBody =>
      'Ми подбаємо, щоб у такі дні було легко записати своє самопочуття.';

  @override
  String get onboardingBirthYearTitle => 'У якому році ти народилася?';

  @override
  String get onboardingBirthYearBody =>
      'Лише для повнішої картини — це ніколи не використовується для жодного прогнозу.';

  @override
  String get onboardingPmsTitle => 'Зазвичай щось проявляється заздалегідь?';

  @override
  String get onboardingPmsBody =>
      'Обери стільки, скільки підходить. Ніде не зберігається, неправильної відповіді немає.';

  @override
  String get onboardingNotificationTitle => 'Хочеш делікатні нагадування?';

  @override
  String get onboardingNotificationBody =>
      'Ми можемо нагадати перед очікуваними місячними.';

  @override
  String get onboardingNotificationMockTitle => 'Місячні можуть скоро початися';

  @override
  String get onboardingNotificationMockBody => 'На основі записаних циклів';

  @override
  String get onboardingNotificationAllow => 'Увімкнути нагадування';

  @override
  String get onboardingNotificationNotNow => 'Не зараз';

  @override
  String get onboardingBuildingPlanTitle => 'Готуємо все для тебе';

  @override
  String get onboardingBuildingPlanStep1 =>
      'Захищаємо твої дані на цьому пристрої';

  @override
  String get onboardingBuildingPlanStep2 => 'Зберігаємо твої налаштування';

  @override
  String get onboardingBuildingPlanStep3 => 'Готуємо твій календар';

  @override
  String get onboardingBuildingPlanDone => 'Усе готово';

  @override
  String get navHome => 'Головна';

  @override
  String get navCalendar => 'Календар';

  @override
  String get navInsights => 'Аналітика';

  @override
  String get navSettings => 'Налаштування';

  @override
  String get navReminders => 'Нагадування';

  @override
  String get navProfile => 'Профіль';

  @override
  String get navTrack => 'Записати';

  @override
  String homeCycleDayLabel(int day) {
    return '$day-й день';
  }

  @override
  String get homeNoCycleYet => 'Місячні ще не записані';

  @override
  String get homePhaseMenstrual => 'Місячні';

  @override
  String get homePhaseFollicular => 'Фолікулярна фаза';

  @override
  String get homePhaseFertileWindow => 'Орієнтовне фертильне вікно';

  @override
  String get homePhaseLuteal => 'Лютеїнова фаза';

  @override
  String get homePhaseUnknown => 'Замало свіжих даних';

  @override
  String get homePredictionInsufficientTitle => 'Даних поки що замало';

  @override
  String get homePredictionInsufficientBody =>
      'Запиши наступні місячні — і ми почнемо прогнозувати.';

  @override
  String homePredictionRangeLabel(String start, String end) {
    return '$start – $end';
  }

  @override
  String get homeConfidenceHigh => 'Висока впевненість';

  @override
  String get homeConfidenceMedium => 'Середня впевненість';

  @override
  String get homeConfidenceLow => 'Низька впевненість';

  @override
  String get homeIrregularNote =>
      'Останнім часом довжина твого циклу коливається більше, ніж зазвичай. Якщо для тебе це нове, про це, можливо, варто згадати на плановому огляді.';

  @override
  String get homeFertileWindowDisclaimer =>
      'Ґрунтується на типовому перебігу циклу — це не метод контрацепції.';

  @override
  String get homePeriodStartedButton => 'Місячні почалися сьогодні';

  @override
  String get homePeriodStartedSnackbar =>
      'Записано — місячні почалися сьогодні';

  @override
  String get actionUndo => 'Повернути';

  @override
  String get comingSoon => 'Незабаром';

  @override
  String get dayLogFlowLabel => 'Виділення';

  @override
  String get flowSpotting => 'Мазкі виділення';

  @override
  String get flowLight => 'Незначні';

  @override
  String get flowMedium => 'Помірні';

  @override
  String get flowHeavy => 'Рясні';

  @override
  String get flowNone => 'Немає';

  @override
  String get dayLogSymptomsLabel => 'Симптоми';

  @override
  String get symptomCramps => 'Спазми';

  @override
  String get symptomHeadache => 'Головний біль';

  @override
  String get symptomBloating => 'Здуття';

  @override
  String get symptomBreastTenderness => 'Чутливість грудей';

  @override
  String get symptomAcne => 'Акне';

  @override
  String get symptomFatigue => 'Втома';

  @override
  String get symptomNausea => 'Нудота';

  @override
  String get symptomBackPain => 'Біль у спині';

  @override
  String get symptomAppetiteChange => 'Зміна апетиту';

  @override
  String get symptomSleepTrouble => 'Проблеми зі сном';

  @override
  String get symptomPelvicPain => 'Біль у тазу';

  @override
  String get symptomDizziness => 'Запаморочення';

  @override
  String get symptomMigraine => 'Мігрень';

  @override
  String get symptomHighFever => 'Висока температура';

  @override
  String get symptomNeckPain => 'Біль у шиї';

  @override
  String get symptomShoulderPain => 'Біль у плечі';

  @override
  String get symptomLimbPain => 'Біль у кінцівках';

  @override
  String get symptomMuscleAche => 'М\'язовий біль';

  @override
  String get symptomChills => 'Озноб';

  @override
  String get symptomNightSweats => 'Нічна пітливість';

  @override
  String get symptomHotFlashes => 'Припливи жару';

  @override
  String get symptomWeightGain => 'Набір ваги';

  @override
  String get symptomConstipation => 'Запор';

  @override
  String get symptomDiarrhea => 'Діарея';

  @override
  String get symptomIndigestion => 'Розлад травлення';

  @override
  String get symptomGasPain => 'Біль від газів';

  @override
  String get symptomFeelingUnwell => 'Нездужання';

  @override
  String get symptomItching => 'Свербіж';

  @override
  String get symptomTroubleFocusing => 'Труднощі з концентрацією';

  @override
  String get symptomForgetfulness => 'Забудькуватість';

  @override
  String get symptomGroupHead => 'Голова';

  @override
  String get symptomGroupBody => 'Тіло';

  @override
  String get symptomGroupAbdomen => 'Живіт';

  @override
  String get symptomGroupGeneral => 'Загальне';

  @override
  String get symptomGroupCognitive => 'Когнітивне';

  @override
  String get dayLogMoodLabel => 'Настрій';

  @override
  String get moodCalm => 'Спокій';

  @override
  String get moodAnxious => 'Тривога';

  @override
  String get moodIrritable => 'Дратівливість';

  @override
  String get moodLow => 'Пригніченість';

  @override
  String get moodEnergetic => 'Бадьорість';

  @override
  String get moodHappy => 'Радість';

  @override
  String get moodContent => 'Задоволеність';

  @override
  String get moodSad => 'Сум';

  @override
  String get moodDepressed => 'Депресивний стан';

  @override
  String get moodEmotional => 'Емоційність';

  @override
  String get moodExcited => 'Схвильована';

  @override
  String get moodHopeful => 'Сповнена надії';

  @override
  String get moodProud => 'Горда';

  @override
  String get moodDisappointed => 'Розчарована';

  @override
  String get moodConfident => 'Впевнена в собі';

  @override
  String get moodSurprised => 'Здивована';

  @override
  String get moodIndifferent => 'Байдужа';

  @override
  String get moodPeaceful => 'Умиротворена';

  @override
  String get moodInLove => 'Закохана';

  @override
  String get moodShy => 'Соромʼязлива';

  @override
  String get moodPlayful => 'Грайлива';

  @override
  String get moodExhausted => 'Виснажена';

  @override
  String get moodLonely => 'Самотня';

  @override
  String get moodOverwhelmed => 'Пригнічена';

  @override
  String get moodGrateful => 'Вдячна';

  @override
  String get moodNostalgic => 'Ностальгійна';

  @override
  String get dayLogNoteLabel => 'Нотатка';

  @override
  String get dayLogNoteHint => 'Те, що хочеться запам’ятати про сьогодні';

  @override
  String get dayLogOptionalTrackersLabel => 'Додаткові трекери';

  @override
  String get dayLogSexualActivityLabel => 'Статева активність';

  @override
  String get sexLifeNone => 'Нічого';

  @override
  String get sexLifeUnprotected => 'Секс без захисту';

  @override
  String get sexLifeProtected => 'Секс із захистом';

  @override
  String get sexLifeMasturbation => 'Мастурбація';

  @override
  String get sexLifeNoOrgasm => 'Без оргазму';

  @override
  String get sexLifeOrgasm => 'Оргазм';

  @override
  String get sexLifeHighDesire => 'Високий потяг';

  @override
  String get dayLogBbtLabel => 'Базальна температура тіла';

  @override
  String get dayLogMucusLabel => 'Цервікальний слиз';

  @override
  String get mucusDry => 'Сухий';

  @override
  String get mucusSticky => 'Липкий';

  @override
  String get mucusCreamy => 'Кремоподібний';

  @override
  String get mucusWatery => 'Водянистий';

  @override
  String get mucusEggWhite => 'Як яєчний білок';

  @override
  String get dayLogSavedIndicator => 'Збережено';

  @override
  String get homeOpenTodayLog => 'Додати деталі за сьогодні';

  @override
  String get calendarLegendActual => 'Записані місячні';

  @override
  String get calendarLegendPredicted => 'Прогнозоване вікно';

  @override
  String get calendarLegendFertile => 'Орієнтовне фертильне вікно';

  @override
  String get calendarLegendOvulation => 'Орієнтовна овуляція';

  @override
  String get dayDetailFertileTitle => 'У твоєму орієнтовному фертильному вікні';

  @override
  String get dayDetailOvulationTitle => 'Орієнтовний день овуляції';

  @override
  String get dayDetailOvulationBody =>
      'Зазвичай саме навколо цього дня ймовірність завагітніти вища — з огляду на типовий перебіг циклу. Це оцінка, а не гарантія.';

  @override
  String get insightsCyclesLoggedLabel => 'Записано циклів';

  @override
  String get insightsAveragePeriodLengthLabel => 'Середня тривалість місячних';

  @override
  String get insightsAverageCycleLengthLabel => 'Середня довжина циклу';

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
      other: 'Коливається приблизно на $daysString дня',
      many: 'Коливається приблизно на $daysString днів',
      few: 'Коливається приблизно на $daysString дні',
      one: 'Коливається приблизно на $daysString день',
    );
    return '$_temp0';
  }

  @override
  String get insightsNotEnoughDataTitle => 'Даних поки що замало';

  @override
  String get insightsNotEnoughDataBody =>
      'Запиши кілька повних циклів — і тут з’являться твої середні показники.';

  @override
  String get insightsSymptomFrequencyTitle => 'Симптоми за днями циклу';

  @override
  String get insightsNoSymptomsLogged => 'Симптоми ще не записані';

  @override
  String get settingsLanguageLabel => 'Мова';

  @override
  String get settingsLanguageSystem => 'Мова системи';

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
  String get tourSkip => 'Пропустити';

  @override
  String get tourNext => 'Далі';

  @override
  String get tourStart => 'Почнімо';

  @override
  String get tourHomeTitle => 'Головна';

  @override
  String get tourHomeBody =>
      'Дивись одним поглядом, де ти сьогодні — день циклу, скільки залишилось до орієнтовного вікна, і твій супутник завжди тут.';

  @override
  String get tourCalendarTitle => 'Календар';

  @override
  String get tourCalendarBody =>
      'Переглядай минулі й майбутні цикли в календарі. Торкнись будь-якого дня, щоб відкрити його запис.';

  @override
  String get tourTrackTitle => 'Запис';

  @override
  String get tourTrackBody =>
      'Кнопка + посередині відкриває сьогоднішній запис звідусіль — виділення, симптоми, настрій і більше.';

  @override
  String get tourRemindersTitle => 'Нагадування';

  @override
  String get tourRemindersBody =>
      'Налаштуй нагадування про наступну менструацію, ліки чи пиття води — усе залишається в твоєму телефоні й нікуди не надсилається.';

  @override
  String get tourProfileTitle => 'Профіль';

  @override
  String get tourProfileBody =>
      'Знайди тут свою аналітику, все, що ти відстежуєш, і свої налаштування.';

  @override
  String get settingsWeekStartLabel => 'Перший день тижня';

  @override
  String get settingsWeekStartMonday => 'Понеділок';

  @override
  String get settingsWeekStartSunday => 'Неділя';

  @override
  String get settingsTemperatureUnitLabel => 'Одиниця температури';

  @override
  String get settingsTemperatureCelsius => 'Цельсій';

  @override
  String get settingsTemperatureFahrenheit => 'Фаренгейт';

  @override
  String get settingsRemindersLabel => 'Нагадувати перед місячними';

  @override
  String get remindersScreenTitle => 'Нагадування';

  @override
  String get reminderDetailNotification => 'Сповіщення';

  @override
  String get reminderDetailAlert => 'Попередження';

  @override
  String get reminderDetailAlertToday => 'У той самий день';

  @override
  String get reminderDetailTime => 'Час';

  @override
  String get reminderDetailMessage => 'Повідомлення';

  @override
  String get reminderDetailMessageEditTitle => 'Редагувати повідомлення';

  @override
  String get reminderDetailMessageHint => 'Напишіть власне повідомлення';

  @override
  String reminderDetailAlertDaysBefore(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count дня раніше',
      many: '$count днів раніше',
      few: '$count дні раніше',
      one: '$count день раніше',
    );
    return '$_temp0';
  }

  @override
  String optionsShowMore(int count) {
    return '+$count ще';
  }

  @override
  String get optionsShowLess => 'Показати менше';

  @override
  String get trackerHistoryEntry => 'Історія';

  @override
  String get actionSend => 'Надіслати';

  @override
  String get actionRemove => 'Видалити';

  @override
  String get feedbackEntry => 'Відгук';

  @override
  String get cloudBackupEntry => 'Резервна копія з обліковим записом';

  @override
  String get cloudBackupTitle => 'Резервна копія з обліковим записом';

  @override
  String get cloudBackupNotConfiguredTitle => 'Поки що недоступно в цій версії';

  @override
  String get cloudBackupNotConfiguredBody =>
      'Хмарному резервному копіюванню потрібен сервіс облікових записів, який ще не налаштовано для цієї версії. До того часу тут нічого не можна використовувати.';

  @override
  String get cloudBackupIntro1Title => 'Ніколи не втрачай свою історію';

  @override
  String get cloudBackupIntro1Body =>
      'Історія твого циклу залишається в безпеці, навіть якщо ти загубиш телефон або перейдеш на новий.';

  @override
  String get cloudBackupIntro2Title => 'Лише ти можеш її відкрити';

  @override
  String get cloudBackupIntro2Body =>
      'Твоя резервна копія шифрується паролем ще до того, як покине телефон — ми не можемо її прочитати, і ніхто інший також.';

  @override
  String get cloudBackupIntro3Title => 'Віднови за секунди';

  @override
  String get cloudBackupIntro3Body =>
      'Увійди на новому пристрої й поверни свою історію тим самим паролем.';

  @override
  String get cloudBackupSignedInTitle => 'Увійдено';

  @override
  String get cloudBackupUploadButton => 'Створити копію зараз';

  @override
  String get cloudBackupDownloadButton => 'Відновити з хмари';

  @override
  String get cloudBackupUploadSuccess => 'Збережено у твоєму обліковому записі';

  @override
  String get cloudBackupNoBackupFound =>
      'Для цього облікового запису ще не знайдено хмарної резервної копії.';

  @override
  String get partnerModeEntry => 'Режим партнера';

  @override
  String get partnerModeTitle => 'Режим партнера';

  @override
  String get partnerModeNotConfiguredTitle => 'Поки що недоступно в цій версії';

  @override
  String get partnerModeNotConfiguredBody =>
      'Режим партнера потребує сервісу облікових записів, який ще не налаштовано для цієї версії. До того часу тут нічого не можна використовувати.';

  @override
  String get partnerModeHeroTitle => 'Ділись небагатьом, на своїх умовах';

  @override
  String get partnerModeHeroBody =>
      'Зв\'яжись зі своїм партнером і ділись лише тим, що ввімкнеш нижче — ніколи всією історією, ніколи автоматично.';

  @override
  String get partnerModeSignInGoogle => 'Продовжити через Google';

  @override
  String get partnerModeSignInApple => 'Продовжити через Apple';

  @override
  String get partnerModeFaqTitle => 'Перш ніж увійти';

  @override
  String get partnerModeFaq1Q => 'Що насправді побачить мій партнер?';

  @override
  String get partnerModeFaq1A =>
      'Лише поля, які ти ввімкнеш у Режимі партнера, і лише твій поточний стан — ніколи збережену історію, і ніколи нічого, чим ти явно не поділилася.';

  @override
  String get partnerModeFaq2Q => 'Чи можу я вимкнути це пізніше?';

  @override
  String get partnerModeFaq2A =>
      'Так. Розірвання зв\'язку негайно припиняє обмін даними для вас обох, і ти можеш будь-коли вимкнути будь-який окремий перемикач без розірвання зв\'язку.';

  @override
  String get partnerModeFaq3Q => 'Чи потрібен моєму партнеру цей застосунок?';

  @override
  String get partnerModeFaq3A =>
      'Так — він входить так само і з\'єднується за допомогою коду, який ти йому надішлеш.';

  @override
  String get partnerModeNotPairedTitle => 'Ще не з\'єднано';

  @override
  String get partnerModeNotPairedBody =>
      'Запроси свого партнера одноразовим кодом або введи код, який він тобі надіслав.';

  @override
  String get partnerModeInviteButton => 'Запросити партнера';

  @override
  String get partnerModeEnterCodeButton => 'Ввести код';

  @override
  String get partnerModeSignOut => 'Вийти';

  @override
  String get partnerModePairedTitle => 'З\'єднано';

  @override
  String get partnerModePairedBody =>
      'Ти і твій партнер зв\'язані. Обмін даними, як і раніше, обмежений тим, що ти ввімкнеш нижче.';

  @override
  String get partnerModeShareSectionTitle => 'Чим ти ділишся';

  @override
  String get partnerModeShareCyclePhase => 'Фаза і день циклу';

  @override
  String get partnerModeShareMood => 'Настрій сьогодні';

  @override
  String get partnerModeShareSymptoms => 'Симптоми сьогодні';

  @override
  String get partnerModeShareHighDesire => 'Бажання близькості сьогодні';

  @override
  String get partnerModeShareNow => 'Поділитися зараз';

  @override
  String get partnerModeShareSuccess => 'Надіслано партнеру';

  @override
  String get partnerModeUnpair => 'Розірвати зв\'язок';

  @override
  String get partnerModeUnpairConfirmTitle => 'Розірвати зв\'язок з партнером?';

  @override
  String get partnerModeUnpairConfirmBody =>
      'Це негайно припинить обмін даними для вас обох. Пізніше ви зможете знову з\'єднатися новим кодом.';

  @override
  String get partnerModePartnerSnapshotEmpty =>
      'Твій партнер ще нічим не поділився.';

  @override
  String get partnerModeErrorNotConfigured =>
      'Режим партнера ще не налаштовано в цій версії.';

  @override
  String get partnerModeErrorCodeNotFound =>
      'Цей код не знайдено. Перевір і спробуй ще раз.';

  @override
  String get partnerModeErrorCodeExpired =>
      'Термін дії цього коду минув. Попроси новий.';

  @override
  String get partnerModeErrorCodeIsOwn =>
      'Це твій власний код — попроси в партнера його код.';

  @override
  String get partnerModeErrorNotSignedIn => 'Спочатку увійди.';

  @override
  String get partnerModeErrorUnknown => 'Щось пішло не так. Спробуй ще раз.';

  @override
  String get partnerModeInviteTitle => 'Запроси свого партнера';

  @override
  String get partnerModeInviteBody =>
      'Надішли цей код своєму партнеру. Він введе його у власному застосунку, щоб з\'єднатися з тобою.';

  @override
  String get partnerModeInviteExpiry => 'Дійсний 7 днів';

  @override
  String get partnerModeInviteShare => 'Поділитися кодом';

  @override
  String partnerModeInviteMessage(String code) {
    return 'Ось мій код з\'єднання Vera: $code';
  }

  @override
  String get partnerModeEnterTitle => 'Ввести код';

  @override
  String get partnerModeEnterBody => 'Введи код, який надіслав тобі партнер.';

  @override
  String get partnerModeEnterHint => '6-значний код';

  @override
  String get partnerModeEnterSubmit => 'З\'єднати';

  @override
  String get homeInvitePartnerTitle => 'Поділись з партнером';

  @override
  String get homeInvitePartnerBody =>
      'З\'єднайтеся і ділись лише тим, що обереш — твоя історія залишається твоєю.';

  @override
  String get homeInvitePartnerCta => 'Налаштувати Режим партнера';

  @override
  String get feedbackTitle => 'Що тобі не сподобалось?';

  @override
  String get feedbackSubtitle => 'Обери тему і напиши більше, якщо хочеш.';

  @override
  String get feedbackCategoryPredictions => 'Прогнози';

  @override
  String get feedbackCategoryBackup => 'Резервне копіювання';

  @override
  String get feedbackCategorySubscription => 'Підписка';

  @override
  String get feedbackCategoryAds => 'Реклама';

  @override
  String get feedbackCategoryDesign => 'Дизайн';

  @override
  String get feedbackCategoryTranslation => 'Переклад';

  @override
  String get feedbackCategoryOther => 'Інше';

  @override
  String get feedbackDescriptionLabel => 'Розкажи більше (необов\'язково)';

  @override
  String get feedbackDescriptionHint =>
      'Що сталося? Натиснувши «Надіслати», ти сам обереш, де поділитися — поштовий застосунок чи інше місце.';

  @override
  String get feedbackAttachPhoto => 'Додати фото';

  @override
  String get feedbackPhotoAttached => 'Фото додано';

  @override
  String get remindersGroupCycle => 'Місячні та фертильність';

  @override
  String get remindersGroupMedication => 'Ліки';

  @override
  String get remindersGroupLifestyle => 'Спосіб життя';

  @override
  String get remindersGroupAppointment => 'Прийом у лікаря';

  @override
  String get settingsRemindersPeriodEndLabel =>
      'Запитати, коли місячні мають добігати кінця';

  @override
  String get settingsRemindersMedicationLabel => 'Нагадування про ліки';

  @override
  String get settingsRemindersWaterLabel => 'Нагадування про воду';

  @override
  String get settingsRemindersAppointmentLabel =>
      'Нагадування про прийом у лікаря';

  @override
  String get settingsRemindersAppointmentSet => 'Задати дату й час';

  @override
  String get settingsRemindersAppointmentClear => 'Очистити';

  @override
  String get settingsOptionalTrackersHeading => 'Додаткові трекери';

  @override
  String get settingsOptionalTrackersBody =>
      'Типово вимкнені. Якщо увімкнути трекер, він з’явиться на екрані запису дня.';

  @override
  String get settingsSexualActivityToggle => 'Статева активність';

  @override
  String get settingsBbtToggle => 'Базальна температура тіла';

  @override
  String get settingsMucusToggle => 'Цервікальний слиз';

  @override
  String get settingsBreastExamToggle => 'Самообстеження грудей';

  @override
  String get settingsCervixToggle => 'Положення та щільність шийки матки';

  @override
  String get settingsPrivacyEntry => 'Приватність';

  @override
  String get settingsRateEntry => 'Оцініть нас';

  @override
  String get rateAppTitle => 'Чи допомагає тобі Vera?';

  @override
  String get rateAppBody =>
      'Якщо так, кілька секунд на оцінку в магазині допоможуть іншим, хто шукає щось подібне, знайти це.';

  @override
  String get rateAppCta => 'Оцінити Vera';

  @override
  String get rateAppDismiss => 'Не зараз';

  @override
  String get settingsDeleteAllData => 'Видалити всі дані';

  @override
  String get privacyScreenTitle => 'Приватність';

  @override
  String get privacyScreenIntro =>
      'Ось що саме відбувається з твоїми даними, простими словами.';

  @override
  String get privacyScreenStorageTitle => 'Зашифровано на цьому пристрої';

  @override
  String get privacyScreenNoNetworkTitle => 'Без сервера, без акаунта';

  @override
  String get privacyScreenNoThirdPartyTitle => 'Без стеження';

  @override
  String get privacyScreenExportTitle => 'Експорт лише за твоєю командою';

  @override
  String get privacyScreenDeleteTitle => 'Видалення незворотне';

  @override
  String get privacyScreenStorage =>
      'Усе записане шифрується і зберігається лише на цьому пристрої, в одному файлі. Ключ шифрування зберігається в захищеному апаратному модулі телефона — Keychain на iOS, Keystore на Android — а не в самому файлі.';

  @override
  String get privacyScreenNoNetwork =>
      'У цього застосунку немає власного сервера й немає системи облікових записів — твої записи ніколи не вивантажуються. У безкоштовній версії є реклама Google, яка з’єднується з інтернетом; вона ніколи не отримує нічого із записаного тобою.';

  @override
  String get privacyScreenNoThirdParty =>
      'Тут немає аналітики, немає звітів про збої й немає жодного SDK для стеження. Єдиний сторонній компонент — рекламний SDK Google у безкоштовній версії; Premium прибирає його повністю.';

  @override
  String get privacyScreenExport =>
      'Твої дані можуть залишити цей пристрій єдиним способом — якщо ти експортуєш їх власноруч, і цей експорт зашифровано паролем, який знаєш тільки ти.';

  @override
  String get privacyScreenDelete =>
      'Видалення даних справжнє й миттєве. Немає ні облікового запису, ні резервної копії з нашого боку — щойно даних не стало, їх немає.';

  @override
  String get adPlaceholderLabel => 'Місце для реклами';

  @override
  String get adPlaceholderUpgradeCta => 'Прибрати рекламу з Premium';

  @override
  String get reminderNotificationTitle => 'Місячні можуть скоро початися';

  @override
  String get reminderNotificationBody =>
      'З огляду на записані цикли, орієнтовне вікно наближається.';

  @override
  String get reminderPeriodEndTitle => 'Місячні, можливо, добігають кінця';

  @override
  String get reminderPeriodEndBody =>
      'Якщо вони ще тривають, це цілком нормально — це просто делікатне нагадування.';

  @override
  String get reminderMedicationTitle => 'Нагадування про ліки';

  @override
  String get reminderMedicationBody => 'Час прийняти ліки.';

  @override
  String get reminderWaterTitle => 'Не забувай про воду';

  @override
  String get reminderWaterBody => 'Невелике нагадування про воду.';

  @override
  String get reminderAppointmentTitle => 'Незабаром прийом у лікаря';

  @override
  String get reminderAppointmentBody => 'У тебе незабаром прийом у лікаря.';

  @override
  String get settingsExportEntry => 'Експорт і резервна копія';

  @override
  String get exportBackupHeading => 'Зашифрована резервна копія';

  @override
  String get exportBackupBody =>
      'Збережи зашифровану копію своєї історії, щоб перенести її на новий пристрій. Для відновлення знадобиться той самий пароль — інакше відновити дані неможливо.';

  @override
  String get exportCreateBackupButton => 'Створити резервну копію';

  @override
  String get exportRestoreBackupButton => 'Відновити з резервної копії';

  @override
  String get exportPasswordLabel => 'Пароль';

  @override
  String get exportPasswordConfirmLabel => 'Підтвердження пароля';

  @override
  String get exportPasswordMismatch => 'Паролі не збігаються';

  @override
  String get exportPasswordTooShort => 'Потрібно щонайменше 8 символів';

  @override
  String get exportRestoreConfirmTitle =>
      'Замінити всі дані на цьому пристрої?';

  @override
  String get exportRestoreConfirmBody =>
      'Відновлення з резервної копії замінює все, що зараз записано на цьому пристрої. Скасувати це неможливо.';

  @override
  String get exportRestoreConfirmAction => 'Відновити';

  @override
  String get exportWrongPassword =>
      'Цей пароль не підходить до цієї резервної копії';

  @override
  String get exportInvalidFile => 'Цей файл не схожий на резервну копію Vera';

  @override
  String get exportBackupCreated => 'Резервна копія готова до надсилання';

  @override
  String get exportRestoreSuccess => 'Резервну копію відновлено';

  @override
  String get exportDoctorReportHeading => 'Звіт для лікаря';

  @override
  String get exportDoctorReportBody => 'Підсумок, який можна показати лікарю.';

  @override
  String get exportIncludeNotesToggle => 'Включити особисті нотатки';

  @override
  String get exportShareCsvButton => 'Поділитися як CSV';

  @override
  String get exportPrintPdfButton => 'Друк / Зберегти як PDF';

  @override
  String get doctorReportDisclaimer =>
      'Створено у Vera на основі даних, введених користувачем. Не є медичним діагнозом.';

  @override
  String get doctorReportGeneratedOn => 'Дата створення';

  @override
  String get doctorReportSummaryHeading => 'Підсумок';

  @override
  String get doctorReportDailyLogHeading => 'Щоденні записи';

  @override
  String get doctorReportColumnDate => 'Дата';

  @override
  String get doctorReportTimelineHeading => 'Хронологія циклу';

  @override
  String get doctorReportCycleLabel => 'Цикл';

  @override
  String get doctorReportTimelineLegendPeriod => 'Місячні';

  @override
  String get doctorReportTimelineLegendCycle => 'Решта циклу';

  @override
  String get doctorReportTimelineOngoing => 'Триває';

  @override
  String get dailyInsightLabel => 'Чи знаєш ти?';

  @override
  String get insightMenstrual1 =>
      'Саме зараз відшаровується слизова оболонка матки — більшість місячних триває від 3 до 7 днів, і це цілком нормально.';

  @override
  String get insightMenstrual2 =>
      'Багаті на залізо продукти, як-от листова зелень і сочевиця, можуть допомогти надолужити те, що тіло втрачає цього тижня.';

  @override
  String get insightFollicular1 =>
      'Рівень естрогену зростає, і багато хто саме приблизно тепер помічає більше енергії та кращу зосередженість.';

  @override
  String get insightFollicular2 =>
      'Тіло готує яйцеклітину до виходу — ця фаза може тривати від тижня до кількох тижнів.';

  @override
  String get insightFertile1 =>
      'Це твоє орієнтовне фертильне вікно — дні навколо овуляції, коли ймовірність завагітніти найвища, з огляду на типовий перебіг циклу.';

  @override
  String get insightFertile2 =>
      'Дехто помічає незначне підвищення базальної температури тіла або зміни цервікального слизу приблизно в час овуляції.';

  @override
  String get insightLuteal1 =>
      'Після овуляції зростає рівень прогестерону — саме тоді часто з’являються симптоми ПМС, як-от перепади настрою чи здуття.';

  @override
  String get insightLuteal2 =>
      'Якщо імплантації не сталося, наприкінці цієї фази рівень гормонів знижується, і це запускає наступні місячні.';

  @override
  String get insightUnknown1 =>
      'Довжина циклу дуже різниться між людьми — типовим вважається діапазон від 21 до 35 днів.';

  @override
  String get insightsPhaseTipsTitle => 'Може бути приємно в цій фазі';

  @override
  String get tipFitnessLabel => 'Рух';

  @override
  String get tipNutritionLabel => 'Харчування';

  @override
  String get tipFitnessMenstrual =>
      'М’який рух — прогулянка, розтяжка або відновлювальна йога — зараз може відчуватися краще, ніж інтенсивні тренування.';

  @override
  String get tipFitnessFollicular =>
      'У цій фазі енергія часто зростає — вдалий час, щоб спробувати нове тренування або трохи додати навантаження.';

  @override
  String get tipFitnessFertile =>
      'Багато хто почувається тут найенергійніше — вдала фаза для інтенсивніших тренувань, якщо тобі це до вподоби.';

  @override
  String get tipFitnessLuteal =>
      'Якщо ближче до кінця цієї фази енергії меншає, силова робота з нижчою інтенсивністю або плавання можуть даватися легше.';

  @override
  String get tipFitnessUnknown =>
      'Хай який рух відчувається добре сьогодні — це хороший вибір; єдиної «правильної» рутини на кожен день не існує.';

  @override
  String get tipNutritionMenstrual =>
      'Багаті на залізо продукти, як-от листова зелень, сочевиця та червоне м’ясо, можуть допомогти надолужити те, що тіло втрачає цього тижня.';

  @override
  String get tipNutritionFollicular =>
      'Легші, свіжі страви часто добре сприймаються, поки енергія зростає, — але єдиного «правильного» способу харчуватися в цій фазі немає.';

  @override
  String get tipNutritionFertile =>
      'Достатньо води та збалансовані прийоми їжі підтримують енергію в цій активнішій на відчуття фазі.';

  @override
  String get tipNutritionLuteal =>
      'Тут харчові вподобання можуть змінюватися — складні вуглеводи та багаті на магній продукти, як-от горіхи й чорний шоколад, обирають найчастіше.';

  @override
  String get tipNutritionUnknown =>
      'Збалансовані регулярні прийоми їжі — надійний варіант за замовчуванням, поки фаза ще не визначена.';

  @override
  String get predictionSettingsEntry => 'Налаштування прогнозу';

  @override
  String get predictionSettingsIntro =>
      'Це припущення, показані відкрито. Щойно буде записано 2 повні цикли, справжній прогноз на Головній рахуватиметься з твоїх власних даних — ці числа для нього більше не використовуються.';

  @override
  String get predictionSettingsPeriodLengthLabel =>
      'Типова тривалість місячних';

  @override
  String get predictionSettingsCycleLengthLabel => 'Типова довжина циклу';

  @override
  String get predictionSettingsCycleLengthHint =>
      'Використовується для масштабування кільця на Головній, доки немає справжніх даних.';

  @override
  String get predictionSettingsLutealLabel => 'Довжина лютеїнової фази';

  @override
  String get predictionSettingsLutealHint =>
      'Типова кількість днів між овуляцією та наступними місячними. Використовується, щоб розмістити орієнтовне фертильне вікно — це значення продовжує використовуватися навіть після появи справжніх прогнозів.';

  @override
  String get dayLogEnergyLabel => 'Енергія';

  @override
  String get energyLevelLow => 'Низька';

  @override
  String get energyLevelMedium => 'Середня';

  @override
  String get energyLevelHigh => 'Висока';

  @override
  String get energyLevelEnergetic => 'Багато енергії';

  @override
  String get dayLogSkinHairLabel => 'Шкіра та волосся';

  @override
  String get skinHealthyGlow => 'Здоровий вигляд';

  @override
  String get skinRedness => 'Почервоніння';

  @override
  String get skinDryness => 'Сухість';

  @override
  String get skinOiliness => 'Жирність';

  @override
  String get hairGoodDay => 'Волосся лежить добре';

  @override
  String get hairBadDay => 'Волосся не слухається';

  @override
  String get hairLoss => 'Випадіння волосся';

  @override
  String get scalpOily => 'Жирна шкіра голови';

  @override
  String get dayLogBreastExamLabel => 'Самообстеження грудей';

  @override
  String get breastExamAllNormal => 'Нічого незвичного';

  @override
  String get breastExamLump => 'Ущільнення';

  @override
  String get breastExamIndentation => 'Втягнення шкіри';

  @override
  String get breastExamRedness => 'Почервоніння';

  @override
  String get breastExamCrackedNipple => 'Тріщина соска';

  @override
  String get breastExamDischarge => 'Виділення із соска';

  @override
  String get cervixPositionLabel => 'Положення шийки матки';

  @override
  String get cervixPositionLow => 'Низько';

  @override
  String get cervixPositionMedium => 'Посередині';

  @override
  String get cervixPositionHigh => 'Високо';

  @override
  String get cervixOpeningLabel => 'Розкриття шийки матки';

  @override
  String get cervixOpeningClosed => 'Закрита';

  @override
  String get cervixOpeningMedium => 'Частково відкрита';

  @override
  String get cervixOpeningOpen => 'Відкрита';

  @override
  String get cervixFirmnessLabel => 'Щільність шийки матки';

  @override
  String get cervixFirmnessSoft => 'М’яка';

  @override
  String get cervixFirmnessMedium => 'Середня';

  @override
  String get cervixFirmnessFirm => 'Тверда';

  @override
  String get dayLogWaterLabel => 'Вода';

  @override
  String get dayLogSleepLabel => 'Сон';

  @override
  String get dayLogWeightLabel => 'Вага';

  @override
  String get dayLogMedicationsLabel => 'Ліки';

  @override
  String get dayLogAddMedication => 'Додати ліки';

  @override
  String get dayLogMedicationNameHint => 'Назва ліків';

  @override
  String get dayLogBirthControlLabel => 'Контрацепція';

  @override
  String get dayLogOtherMedicationsLabel => 'Інші ліки';

  @override
  String get birthControlPillTaken => 'Таблетку прийнято';

  @override
  String get birthControlPillLate => 'Таблетку прийнято пізно';

  @override
  String get birthControlPillMissed => 'Таблетку пропущено';

  @override
  String get birthControlPatch => 'Пластир';

  @override
  String get birthControlRing => 'Кільце';

  @override
  String get birthControlInjection => 'Ін\'єкція';

  @override
  String get birthControlImplant => 'Імплант';

  @override
  String get birthControlIud => 'Спіраль';

  @override
  String get navAssistant => 'Помічник';

  @override
  String get assistantTitle => 'Помічник Vera';

  @override
  String get assistantEndChatTitle => 'Завершити цей чат?';

  @override
  String get assistantEndChatBody =>
      'Повідомлення зберігаються лише в пам\'яті й нікуди не записуються, тому повернути їх не вийде.';

  @override
  String get assistantEndChatConfirm => 'Завершити чат';

  @override
  String get assistantInputHint => 'Запитай про свій цикл…';

  @override
  String get assistantIntro =>
      'Привіт! Я можу відповісти на запитання про місячні, цикл і те, як працює Vera — просто тут, на твоєму телефоні; нічого не залишає пристрій. Я не лікар, і це не медична порада.';

  @override
  String get insightMenstrual3 =>
      'Менструальна кров — не «брудна кров»: це суміш крові та слизової оболонки матки, цілком нормальна частина циклу.';

  @override
  String get insightMenstrual4 =>
      'М’яке тепло на низ живота справді полегшує спазми — грілка є класикою з доказовою підтримкою.';

  @override
  String get insightMenstrual5 =>
      'Виділення часто найрясніші в перші два дні, а потім слабшають — така картина типова.';

  @override
  String get insightMenstrual6 =>
      'Відчувати трохи більшу втому під час місячних — звична річ: разом із менструальною кров’ю тіло втрачає залізо.';

  @override
  String get insightFollicular3 =>
      'Естроген відновлює слизову оболонку матки після місячних — тіло готується наново.';

  @override
  String get insightFollicular4 =>
      'Шкіра часто виглядає найчистішою саме в цій фазі, коли рівень гормонів вирівнюється.';

  @override
  String get insightFollicular5 =>
      'У багатьох витривалість і швидкість реакції досягають піку наприкінці фолікулярної фази.';

  @override
  String get insightFollicular6 =>
      'Саме довжина цієї фази найбільше різниться між людьми — лютеїнова фаза набагато сталіша.';

  @override
  String get insightFertile3 =>
      'Яйцеклітина живе близько 12–24 годин, але сперматозоїди можуть чекати до 5 днів — тому фертильне вікно охоплює кілька днів.';

  @override
  String get insightFertile4 =>
      'Приблизно в час овуляції цервікальний слиз часто стає прозорим і тягучим — схожим на сирий яєчний білок.';

  @override
  String get insightFertile5 =>
      'Дехто відчуває коротке однобічне поколювання під час овуляції — у нього навіть є назва: mittelschmerz.';

  @override
  String get insightFertile6 =>
      'Базальна температура тіла трохи підвищується *після* овуляції — це підтверджує, що вона сталася, а не передбачає її.';

  @override
  String get insightLuteal3 =>
      'Прогестерон досягає піку приблизно через тиждень після овуляції — здуття та чутливість грудей у цей час звичні.';

  @override
  String get insightLuteal4 =>
      'Тяга до вуглеводів перед місячними реальна — у лютеїновій фазі потреба в енергії трохи зростає.';

  @override
  String get insightLuteal5 =>
      'Симптоми ПМС зазвичай слабшають протягом дня-двох після початку кровотечі.';

  @override
  String get insightLuteal6 =>
      'Сталий режим сну може помітно пом’якшити спад настрою наприкінці лютеїнової фази.';

  @override
  String get insightUnknown2 =>
      'Часто достатньо записати лише три цикли, щоб побачити власну закономірність.';

  @override
  String get insightUnknown3 =>
      'Цикли індивідуальні — порівняння свого циклу з чужим рідко дає щось корисне.';

  @override
  String get insightUnknown4 =>
      'Стрес, подорожі та хвороба можуть зсунути овуляцію — «затримка» часто означає просто пізнішу овуляцію.';

  @override
  String get settingsThemeLabel => 'Тема';

  @override
  String get settingsThemeSystem => 'Як у системі';

  @override
  String get settingsThemeLight => 'Світла';

  @override
  String get settingsThemeDark => 'Темна';

  @override
  String get settingsMascotLabel => 'Маскот-компаньйон';

  @override
  String get mascotDroplet => 'Крапля';

  @override
  String get mascotFlower => 'Квітка';

  @override
  String get mascotMoon => 'Місяць';

  @override
  String get mascotNone => 'Немає';

  @override
  String homeWindowCountdown(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: 'Прогнозоване вікно почнеться приблизно через $days дня',
      many: 'Прогнозоване вікно почнеться приблизно через $days днів',
      few: 'Прогнозоване вікно почнеться приблизно через $days дні',
      one: 'Прогнозоване вікно почнеться приблизно через $days день',
    );
    return '$_temp0';
  }

  @override
  String homeOvulationCountdown(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: 'Орієнтовна овуляція приблизно через $days дня',
      many: 'Орієнтовна овуляція приблизно через $days днів',
      few: 'Орієнтовна овуляція приблизно через $days дні',
      one: 'Орієнтовна овуляція приблизно через $days день',
    );
    return '$_temp0';
  }

  @override
  String get homeQuickLogTitle => 'Як почувається твоє тіло сьогодні?';

  @override
  String get actionSave => 'Зберегти';

  @override
  String get insightsTrackerHubTitle => 'Твої трекери';

  @override
  String get trackerHistoryEmpty => 'У цьому діапазоні ще немає записів';

  @override
  String get trackerStatAverage => 'Середнє';

  @override
  String get trackerStatLowest => 'Мінімум';

  @override
  String get trackerStatHighest => 'Максимум';

  @override
  String get trackerStatLatest => 'Останнє';

  @override
  String get rangeFilter1m => '1 міс';

  @override
  String get rangeFilter3m => '3 міс';

  @override
  String get rangeFilter6m => '6 міс';

  @override
  String get dayLogOvulationTestLabel => 'Тест на овуляцію';

  @override
  String get ovulationTestNegative => 'Негативний';

  @override
  String get ovulationTestPositive => 'Позитивний';

  @override
  String get ovulationTestLow => 'Низький';

  @override
  String get ovulationTestHigh => 'Високий';

  @override
  String get ovulationTestPeak => 'Пік';

  @override
  String get pregnancyTestLabel => 'Тест на вагітність';

  @override
  String get pregnancyTestPositive => 'Позитивний';

  @override
  String get pregnancyTestFaint => 'Слабка смужка';

  @override
  String get pregnancyTestNegative => 'Негативний';

  @override
  String get settingsOvulationTestToggle => 'Тест на овуляцію';

  @override
  String get settingsRemindersOvulationLabel =>
      'Попередження про фертильне вікно';

  @override
  String get reminderOvulationTitle =>
      'Орієнтовне фертильне вікно наближається';

  @override
  String get reminderOvulationBody =>
      'З огляду на записані цикли, твоє орієнтовне фертильне вікно може скоро початися.';

  @override
  String trackerEntriesCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count запису',
      many: '$count записів',
      few: '$count записи',
      one: '$count запис',
    );
    return '$_temp0';
  }

  @override
  String get trackerLowSampleNote =>
      'З такою малою кількістю записів відсотки ще не надійні — вони стануть точнішими з часом.';

  @override
  String get assistantTyping => 'Vera друкує…';

  @override
  String get premiumTitle => 'Vera Premium';

  @override
  String get premiumHeadline => 'Vera Premium';

  @override
  String get premiumSubhead =>
      'Усі функції відстеження назавжди лишаються безкоштовними — твоя історія ніколи не блокується. Premium додає власні трекери, глибшу аналітику, власні нагадування та додаткові оформлення, а також прибирає рекламу.';

  @override
  String get premiumBenefitNoAds => 'Жодної реклами в застосунку';

  @override
  String get premiumBenefitSupport =>
      'Підтримує незалежний застосунок, де приватність на першому місці';

  @override
  String get premiumMonthly => 'Щомісяця';

  @override
  String get premiumYearly => 'Щороку';

  @override
  String get premiumYearlyNote => 'Оплата раз на рік';

  @override
  String premiumPerMonth(String price) {
    return '$price / місяць';
  }

  @override
  String get premiumBilledMonthly => 'Оплата щомісяця';

  @override
  String get premiumStaysFreeTitle => 'Що лишається безкоштовним';

  @override
  String get premiumStaysFreeBody =>
      'Календар, уся твоя історія, базова статистика та експорт безкоштовні назавжди. Premium щось додає й ніколи нічого не забирає.';

  @override
  String get premiumSubscribeCta => 'Далі';

  @override
  String get premiumRestore => 'Відновити покупку';

  @override
  String get premiumCancelNote =>
      'Скасувати можна будь-коли в обліковому записі магазину застосунків. Жодних зворотних відліків, жодного тиску — якщо зараз не час, безкоштовна версія працюватиме рівно так само, як сьогодні.';

  @override
  String get premiumActiveBadge => 'Premium активний';

  @override
  String get premiumDevToggle => 'Симулювати Premium (розробка)';

  @override
  String get settingsPremiumEntry => 'Vera Premium';

  @override
  String get adTestNotice => 'Тестова реклама — ще не справжнє розміщення';

  @override
  String get settingsPregnancyModeLabel => 'Режим вагітності';

  @override
  String get pregnancyLmpLabel => 'Перший день останніх місячних';

  @override
  String pregnancyWeekLabel(int weeks, int days) {
    return '$weeks-й тиждень, $days-й день';
  }

  @override
  String get pregnancyDueDateLabel => 'Орієнтовна дата пологів';

  @override
  String pregnancyDaysLeft(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: 'Залишилося приблизно $days дня',
      many: 'Залишилося приблизно $days днів',
      few: 'Залишилися приблизно $days дні',
      one: 'Залишився приблизно $days день',
    );
    return '$_temp0';
  }

  @override
  String pregnancyTrimesterLabel(int n) {
    return '$n-й триместр';
  }

  @override
  String get pregnancyDisclaimer =>
      'Дати розраховано від останніх місячних за стандартним правилом 280 днів. УЗД дає точнішу дату, а пізня овуляція зсуває ці числа — це інформація, а не медичний супровід.';

  @override
  String get pregnancySizeLabel => 'Розмір малюка';

  @override
  String get pregnancySizeUnder5 => 'Макове зернятко (~2 mm)';

  @override
  String get pregnancySizeUnder9 => 'Чорниця (~1.6 cm)';

  @override
  String get pregnancySizeUnder13 => 'Лайм (~5.4 cm)';

  @override
  String get pregnancySizeUnder20 => 'Авокадо (~11.6 cm)';

  @override
  String get pregnancySizeUnder28 => 'Манго (~30 cm)';

  @override
  String get pregnancySizeUnder34 => 'Ананас (~44 cm)';

  @override
  String get pregnancySizeUnder38 => 'Диня (~46 cm)';

  @override
  String get pregnancySizeTerm => 'Маленький кавун (~51 cm)';

  @override
  String get pregnancyNoteUnder5 =>
      'Більшість людей поки нічого не помічає: термін вагітності відлічують від останніх місячних, тож перші два тижні насправді передують заплідненню.';

  @override
  String get pregnancyNoteUnder9 =>
      'Нудота, чутливість грудей і втома зараз трапляються часто. Гарний час, щоб записатися на перший візит.';

  @override
  String get pregnancyNoteUnder13 =>
      'Перший триместр добігає кінця; у багатьох людей приблизно в цей час нудота починає вщухати.';

  @override
  String get pregnancyNoteUnder20 =>
      'У цей період сили часто повертаються. Перші рухи можна відчути будь-коли між 16-м і 22-м тижнями.';

  @override
  String get pregnancyNoteUnder28 =>
      'Рухи стають виразнішими і складаються у власний ритм. Біль у спині та печія в цей період трапляються часто.';

  @override
  String get pregnancyNoteUnder34 =>
      'Почався третій триместр. Задишка, часте сечовипускання та перейми Брекстона-Гікса трапляються часто.';

  @override
  String get pregnancyNoteUnder38 =>
      'Малюк готується до народження. Гарний час зібрати сумку до пологового та обміркувати план пологів.';

  @override
  String get pregnancyNoteTerm =>
      'Термін уже доношений: пологи можуть початися будь-коли між 37-м і 42-м тижнями; 40 тижнів — це середнє значення, а не крайній термін.';

  @override
  String get pregnancyWeeklyNoteTitle => 'Цього тижня';

  @override
  String get pregnancyNeedsLmp =>
      'Додай перший день останніх місячних, щоб почати відстеження.';

  @override
  String get pregnancyOutOfRange =>
      'Ця дата давніша за 42 тижні — онови її або вимкни режим вагітності.';

  @override
  String get partnerShareTitle => 'Поділитися підсумком із партнером';

  @override
  String get partnerShareBody =>
      'Створює короткий текстовий підсумок — твоя поточна фаза й орієнтовне вікно — який ти надсилаєш через будь-який застосунок. Живої синхронізації та облікового запису партнера немає: нічого не передається, поки ти цього не надішлеш.';

  @override
  String get partnerShareCta => 'Створити підсумок';

  @override
  String get partnerSummaryHeader => 'Підсумок циклу з Vera';

  @override
  String get settingsHomeThemeLabel => 'Тло Головної';

  @override
  String get homeThemeWheat => 'Пшениця';

  @override
  String get homeThemeSky => 'Небо';

  @override
  String get homeThemeField => 'Поле';

  @override
  String get homeThemeBlossom => 'Цвіт';

  @override
  String get homeThemePlain => 'Однотонне';

  @override
  String get backupNudgeTitle => 'Збережи копію своїх даних';

  @override
  String get backupNudgeBody =>
      'Усе зберігається лише на цьому телефоні. Якщо він загубиться, зламається або його скинуть, твоя історія зникне разом із ним — зашифрована резервна копія займає мить, і відкрити її можеш тільки ти.';

  @override
  String get backupNudgeCta => 'Створити копію зараз';

  @override
  String get backupNudgeDismiss => 'Пізніше';

  @override
  String backupLastDone(String date) {
    return 'Остання резервна копія: $date';
  }

  @override
  String get backupNever => 'Резервної копії ще немає';

  @override
  String get settingsRemindersBackupLabel =>
      'Нагадувати про резервне копіювання';

  @override
  String get reminderBackupTitle => 'Час зробити резервну копію Vera';

  @override
  String get reminderBackupBody =>
      'Твоя історія існує лише на цьому телефоні. Швидка зашифрована копія збереже її.';

  @override
  String get notificationChannelPeriodStart => 'Наближення місячних';

  @override
  String get notificationChannelPeriodEnd => 'Завершення місячних';

  @override
  String get notificationChannelMedication => 'Ліки';

  @override
  String get notificationChannelWater => 'Вода';

  @override
  String get notificationChannelAppointment => 'Візити';

  @override
  String get notificationChannelOvulation => 'Фертильне вікно';

  @override
  String get notificationChannelBackup => 'Нагадування про резервну копію';

  @override
  String get calendarDayDetailTitle => 'Цей день';

  @override
  String get calendarDayNothingLogged => 'За цей день ще нічого не записано';

  @override
  String get calendarDayOpenLog => 'Відкрити запис дня';

  @override
  String get cycleHistoryTitle => 'Минулі цикли';

  @override
  String get cycleTrendsTitle => 'Динаміка циклу';

  @override
  String get cycleHistoryEmpty =>
      'Запиши кілька місячних — і тут з’явиться історія твоїх циклів.';

  @override
  String get cycleHistoryOngoing => 'Триває';

  @override
  String cycleHistoryLength(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: 'Цикл: $days дня',
      many: 'Цикл: $days днів',
      few: 'Цикл: $days дні',
      one: 'Цикл: $days день',
    );
    return '$_temp0';
  }

  @override
  String cycleHistoryPeriodLength(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: 'Місячні тривали $days дня',
      many: 'Місячні тривали $days днів',
      few: 'Місячні тривали $days дні',
      one: 'Місячні тривали $days день',
    );
    return '$_temp0';
  }

  @override
  String cycleHistoryVsAverage(String diff) {
    return '$diff відносно твого середнього';
  }

  @override
  String get insightsCycleHistoryEntry => 'Минулі цикли';

  @override
  String get homeEmptyTitle => 'Почнімо з останніх місячних';

  @override
  String get homeEmptyBody =>
      'Натисни кнопку вище того дня, коли починаються місячні. Після двох повних циклів Vera зможе почати прогнозувати — доти вона не вдаватиме, що знає.';

  @override
  String get homeEmptyBackdate => 'Вони почалися раніше';

  @override
  String get settingsAdPrivacyEntry => 'Налаштування приватності реклами';

  @override
  String a11yCycleRing(int day, int length) {
    return '$day-й день циклу приблизно з $length';
  }

  @override
  String a11yChartSummary(int count, String min, String max) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Графік: $count запису, від $min до $max',
      many: 'Графік: $count записів, від $min до $max',
      few: 'Графік: $count записи, від $min до $max',
      one: 'Графік: $count запис, від $min до $max',
    );
    return '$_temp0';
  }

  @override
  String a11yPhaseBar(int day, int length) {
    return 'Перебіг циклу: $day-й день приблизно з $length';
  }

  @override
  String a11yFrequencyItem(String label, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count разу',
      many: '$count разів',
      few: '$count рази',
      one: '$count раз',
    );
    return '$label: $_temp0';
  }

  @override
  String get importTitle => 'Імпорт з іншого застосунку';

  @override
  String get importBody =>
      'Експортуй історію зі свого попереднього трекера у форматі CSV, а потім обери тут цей файл. Імпортуються лише дати та інтенсивність виділень — формулювання симптомів і настроїв у різних застосунках різні, і Vera не вгадуватиме, що саме малося на увазі.';

  @override
  String get importPickFile => 'Обрати файл CSV';

  @override
  String importPreview(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Знайдено $count дня історії',
      many: 'Знайдено $count днів історії',
      few: 'Знайдено $count дні історії',
      one: 'Знайдено $count день історії',
    );
    return '$_temp0';
  }

  @override
  String importSkipped(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Не вдалося прочитати $count рядка — їх буде пропущено',
      many: 'Не вдалося прочитати $count рядків — їх буде пропущено',
      few: 'Не вдалося прочитати $count рядки — їх буде пропущено',
      one: 'Не вдалося прочитати $count рядок — його буде пропущено',
    );
    return '$_temp0';
  }

  @override
  String get importConfirm => 'Додати до моєї історії';

  @override
  String get importMergeNote =>
      'Імпортовані дні об’єднуються з наявними. Дні, які вже записані у Vera, лишаються без змін.';

  @override
  String importDone(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Імпортовано $count дня',
      many: 'Імпортовано $count днів',
      few: 'Імпортовано $count дні',
      one: 'Імпортовано $count день',
    );
    return '$_temp0';
  }

  @override
  String get importErrorEmpty => 'Цей файл виглядає порожнім.';

  @override
  String get importErrorNoDate =>
      'У цьому файлі не вдалося знайти стовпець із датою.';

  @override
  String get settingsImportEntry => 'Імпорт з іншого застосунку';

  @override
  String get settingsHealthSyncLabel =>
      'Синхронізація з Apple Health / Health Connect';

  @override
  String get settingsHealthSyncBody =>
      'Записує до застосунку здоров’я на телефоні лише інтенсивність менструальних виділень, вагу та базальну температуру. Симптоми, настрій і нотатки лишаються у Vera. Нічого не зчитується назад.';

  @override
  String healthSyncBackfilled(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'До застосунку здоров’я надіслано $count дня',
      many: 'До застосунку здоров’я надіслано $count днів',
      few: 'До застосунку здоров’я надіслано $count дні',
      one: 'До застосунку здоров’я надіслано $count день',
    );
    return '$_temp0';
  }

  @override
  String get healthSyncDenied =>
      'Дозвіл не надано, тож синхронізація лишається вимкненою.';

  @override
  String get settingsDiagnosticsEntry => 'Діагностика';

  @override
  String get diagnosticsBody =>
      'Якщо застосунок працює неправильно, технічні подробиці записуються тут — тільки на цьому пристрої. Нічого нікуди не надсилається, поки ти не вирішиш це надіслати, і спершу можна прочитати рівно те, що буде надіслано.';

  @override
  String get diagnosticsEmpty => 'Нічого не записано — проблем не виявлено.';

  @override
  String get diagnosticsShare => 'Надіслати розробнику';

  @override
  String get diagnosticsClear => 'Очистити';

  @override
  String get diagnosticsNoteLabel => 'Що сталося? (необов\'язково)';

  @override
  String get diagnosticsTechnicalDetail => 'Технічні подробиці';

  @override
  String get unitHoursShort => 'год';

  @override
  String get unitMinutesShort => 'хв';

  @override
  String get unitHoursLong => 'годин';

  @override
  String get unitMinutesLong => 'хвилин';

  @override
  String get unitMilliliters => 'мл';

  @override
  String get unitKilograms => 'кг';

  @override
  String get calendarJumpTitle => 'Перейти до місяця';

  @override
  String get calendarJumpYearLabel => 'Рік';

  @override
  String get settingsAdPrivacyUnavailable =>
      'У твоєму регіоні вибір щодо персоналізації реклами не пропонується — реклама тут і так неперсоналізована.';

  @override
  String get settingsGroupAppearance => 'Вигляд';

  @override
  String get settingsGroupTracking => 'Налаштування відстеження';

  @override
  String get dayLogCustomTagsLabel => 'Мої власні трекери';

  @override
  String get customTagAddButton => 'Додати трекер';

  @override
  String get customTagDialogTitle => 'Новий трекер';

  @override
  String get customTagDialogHint => 'напр. мігрень, спортзал, безсоння';

  @override
  String get customTagManageEntry => 'Керувати моїми трекерами';

  @override
  String get customTagRenameTitle => 'Перейменувати трекер';

  @override
  String get customTagDeleteTitle => 'Видалити цей трекер?';

  @override
  String get customTagDeleteBody =>
      'Його буде прибрано з усіх днів, де він використовувався. Інші твої записи лишаються без змін.';

  @override
  String get customTagEmpty => 'Власних трекерів поки що немає.';

  @override
  String get premiumLockedTitle => 'Функція Premium';

  @override
  String get premiumLockedAction => 'Переглянути Premium';

  @override
  String get premiumBenefitCustomTrackers =>
      'Відстежуй що завгодно, своїми словами';

  @override
  String get premiumBenefitAdvancedInsights =>
      'Розширена аналітика: що зазвичай стається і коли';

  @override
  String get premiumBenefitPersonalisation => 'Додаткові тла та компаньйони';

  @override
  String get premiumBenefitAdvancedReminders =>
      'Нагадування за твоїм власним розкладом';

  @override
  String get advancedInsightsTitle => 'Розширена аналітика';

  @override
  String get advancedInsightsEntry => 'Розширена аналітика';

  @override
  String get advancedInsightsNotEnough =>
      'Запиши три повні цикли — і тут з’являться твої закономірності. За меншої кількості будь-яка «закономірність» була б просто збігом.';

  @override
  String get advancedInsightsPatternsTitle => 'Коли що зазвичай з’являється';

  @override
  String advancedInsightsPatternLine(String label, String segment) {
    return '$label — найчастіше $segment';
  }

  @override
  String advancedInsightsPatternDetail(int count, int day) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Записано $count дня; приблизно $day-й день циклу',
      many: 'Записано $count днів; приблизно $day-й день циклу',
      few: 'Записано $count дні; приблизно $day-й день циклу',
      one: 'Записано $count день; приблизно $day-й день циклу',
    );
    return '$_temp0';
  }

  @override
  String advancedInsightsNoPattern(String label) {
    return '$label — чіткого часу поки що немає';
  }

  @override
  String get advancedInsightsTrendTitle => 'Довжина циклу з часом';

  @override
  String advancedInsightsDriftLonger(String days, String cycles) {
    return 'Якщо порівняти найперші цикли ($cycles) з найновішими ($cycles), останні тривають приблизно на $days дн. довше.';
  }

  @override
  String advancedInsightsDriftShorter(String days, String cycles) {
    return 'Якщо порівняти найперші цикли ($cycles) з найновішими ($cycles), останні тривають приблизно на $days дн. коротше.';
  }

  @override
  String advancedInsightsDriftStable(String cycles) {
    return 'Якщо порівняти найперші цикли ($cycles) з найновішими ($cycles), довжина твого циклу лишилася приблизно такою самою.';
  }

  @override
  String get advancedInsightsDriftNotEnough =>
      'Коли назбирається шість повних циклів, Vera зможе порівняти найперші з найновішими й побачити, чи змінюється довжина твого циклу.';

  @override
  String get advancedInsightsMoodTitle => 'Настрій за частинами циклу';

  @override
  String get advancedInsightsDisclaimer =>
      'Це лише підрахунок того, що ти записуєш, не більше. Це не діагноз, і закономірність тут не є причиною.';

  @override
  String get segmentPeriod => 'під час місячних';

  @override
  String get segmentAfterPeriod => 'після місячних';

  @override
  String get segmentMidCycle => 'у середині циклу';

  @override
  String get segmentBeforePeriod => 'перед місячними';

  @override
  String get customRemindersEntry => 'Мої власні нагадування';

  @override
  String get customRemindersTitle => 'Мої власні нагадування';

  @override
  String get customRemindersEmpty => 'Власних нагадувань поки що немає.';

  @override
  String get customRemindersAdd => 'Додати нагадування';

  @override
  String get customReminderLabelHint => 'напр. випити таблетку, попити води';

  @override
  String get customReminderLockScreenNote =>
      'Текст нагадування з’являється на екрані блокування, тож формулюй його настільки приватно, наскільки потрібно.';

  @override
  String get customReminderDelete => 'Видалити нагадування';

  @override
  String get homeThemeDusk => 'Сутінки';

  @override
  String get homeThemeMeadow => 'Лука';

  @override
  String get homeThemePetal => 'Пелюстка';

  @override
  String get homeThemeBloom => 'Розквіт';

  @override
  String get homeThemeOcean => 'Океан';

  @override
  String get homeThemeAutumn => 'Осінь';

  @override
  String get homeThemeNight => 'Ніч';

  @override
  String get mascotStar => 'Зірка';

  @override
  String get mascotLeaf => 'Листок';

  @override
  String get mascotCat => 'Кіт';

  @override
  String get mascotRabbit => 'Кролик';

  @override
  String get mascotBird => 'Пташка';

  @override
  String get tipDetailWhatsHappening => 'Що відбувається в твоєму тілі';

  @override
  String get tipDetailGeneralHeading => 'Загальні поради';

  @override
  String get tipDetailDisclaimer =>
      'Це загальна інформація, а не персональна медична порада. Кожне тіло реагує по-своєму, і те, як ти почуваєшся насправді, важливіше за будь-яку пораду звідси. Якщо щось непокоїть — варто поговорити з лікарем.';

  @override
  String get phaseExplainerMenstrual =>
      'Кровотеча йде тому, що відшаровується слизова оболонка матки. Естроген і прогестерон на найнижчому рівні циклу, і саме тому в перші дні багато хто почувається втомленішою й більш зверненою всередину. Кровотеча зазвичай триває від трьох до семи днів і найсильніша на початку. Спазми виникають через скорочення матки, які запускають простагландини — гормоноподібні речовини, що вивільняються під час руйнування слизової; тому в частини людей водночас болить поперек або розлажується травлення. Кровотеча ще й витрачає залізо, і це пояснює частину виснаженості. Тепло, рух і сон зазвичай допомагають. Але якщо засіб захисту промокає щогодини, якщо кровотеча помітно виходить за тиждень або біль заважає звичайним справам, про це варто поговорити з фахівцем, а не перечікувати.';

  @override
  String get phaseExplainerFollicular =>
      'Після закінчення кровотечі естроген знову починає зростати. У яєчниках дозріває група фолікулів, у кожному по яйцеклітині, і зазвичай виходить лише одна. Естроген наново відбудовує щойно відторгнуту слизову, і більшість помічає, що разом із ним повертаються енергія, настрій, стан шкіри й витривалість. Це також та частина циклу, яка найбільше різниться між людьми й від місяця до місяця: стрес, хвороба, подорожі та сон проявляються найчастіше саме тут, подовжуючи її або вкорочуючи. Це чесна причина, чому прогноз — це проміжок, а не дата: друга половина циклу тримається доволі рівно, а рухається саме ця.';

  @override
  String get phaseExplainerFertile =>
      'Естроген близький до піку, і овуляція очікується приблизно в ці дні. Викид лютеїнізуючого гормону запускає вихід яйцеклітини приблизно через добу — півтори. Сама яйцеклітина живе близько 12–24 годин, але сперматозоїди можуть зберігатися кілька днів у фертильному шийковому слизу — тому вікно рахують у кількох днях, а не в одному. Слиз зазвичай стає прозорим, тягучим і слизьким, трохи схожим на сирий яєчний білок; хтось помічає посилення потягу, чутливість грудей або коротке поколювання з одного боку. Енергія часто на найвищій точці циклу. Пам\'ятай: це вікно — оцінка за твоєю власною історією, а не вимірювання, і це не метод контрацепції.';

  @override
  String get phaseExplainerLuteal =>
      'Після овуляції спорожнілий фолікул стає жовтим тілом і починає виробляти прогестерон, який утримує слизову стабільною на випадок, якщо закріпиться вагітність. Якщо цього не стається, прогестерон і естроген різко падають, і починається менструація. Ця половина циклу стабільніша, зазвичай близько 12–14 днів. Прогестерон трохи підвищує температуру спокою — саме цю зміну вловлює базальний термометр — і може сповільнювати травлення, чим пояснюється частина здуття. Падіння наприкінці й запускає в багатьох ПМС: чутливість грудей, зміни апетиту, переривчастий сон, головний біль і перепади настрою, які зазвичай стихають із початком кровотечі. Якщо ці прояви у більшості місяців заважають роботі або стосункам, про це варто поговорити з фахівцем.';

  @override
  String get phaseExplainerUnknown =>
      'Записів поки недостатньо, щоб сказати, у якій ти фазі. Vera потрібні щонайменше два повні цикли — один початок менструації, а потім наступний, — щоб обчислити твоє власне середнє та розкид, і вона радше скаже про це, ніж вигадає фазу. Нічого при цьому не пропадає: кожен записаний день входить у той перший розрахунок, а оцінка звужується в міру того, як історія зростає. А доти поради нижче — загальні й підходять у будь-якій точці циклу.';

  @override
  String get tipFitnessDetailMenstrual =>
      'Важкі тренування в перші дні підходять небагатьом, і річ не в дисципліні — енергії справді менше, а залізо, що йде з кровотечею, робить роботу на витривалість важчою, ніж те саме тренування відчувалося тиждень тому. Ходьба, м\'яка розтяжка, відновлювальна йога та дихальні практики покращують кровообіг і можуть пом\'якшити спазми; у частини людей регулярний рух протягом усього місяця знижує силу спазмів більше, ніж будь-що зроблене в сам день. Якщо самопочуття добре, уникати важких тренувань немає підстав: кровотеча — не причина кидати спорт, і чимало спортсменок виступають саме в ці дні. Кілька практичних зауважень: довгі та вимогливі тренування в дні рясної кровотечі можуть посилити втому, тепло на низ живота перед початком робить рух комфортнішим, а трохи більше води, ніж зазвичай, допомагає від головного болю цих днів. Оцінюй тренування за тим, як воно відчувається, а не за тим, яким був твій найкращий тиждень.';

  @override
  String get tipFitnessDetailFollicular =>
      'Зі зростанням естрогену більшість почувається сильнішою й витривалішою; зазвичай це найкращий відрізок циклу, щоб почати щось нове, додати вагу або підняти темп. Відновлення м\'язів тут відносно ефективне, тож важкі тренування засвоюються краще й залишають менше затяжного болю. Це ще й гарне вікно для того, що потребує ясної голови, а не лише сильного тіла: вивчити новий рух, виправити техніку або пройти довшу дистанцію, ніж раніше. Два застереження варто тримати в голові: нарощуй поступово, бо висока енергія не означає нульового ризику травми, і більшість травм перевантаження починається в хороший тиждень, а не в поганий. І бережи сон — адаптація відбувається у відновленні, а не на тренуванні.';

  @override
  String get tipFitnessDetailFertile =>
      'Енергія та мотивація зазвичай на піку, тож вимогливі тренування заходять добре — особисті рекорди часто трапляються саме тут. Деякі дослідження свідчать, що навколо овуляції суглоби трохи рухливіші; практичний ефект обговорюють, але довша розминка — дешева обачність у видах спорту з різкою зміною напрямку, стрибками й приземленнями. Температура тіла все ще низька порівняно з другою половиною циклу, тож спека тут обмежує менше, ніж обмежуватиме за тиждень-другий. Коротке поколювання з одного боку внизу живота під час овуляції — звична річ і зазвичай минає за кілька годин. Але якщо біль сильний, односторонній і не минає, додається температура або є відчуття зомління — зупинися й покажися лікарю, а не дотреновуй.';

  @override
  String get tipFitnessDetailLuteal =>
      'Ближче до менструації енергія може знизитися, пульс при тому самому навантаженні — виявитися вищим, а відновлення — затягнутися. Це очікуване коливання, а не відкат, і воно не скасовує роботу останніх двох тижнів. Прогестерон трохи підвищує температуру спокою й ускладнює віддачу тепла, тому тренування в спеку чи задуху відчуваються тут непропорційно важко: допомагає і займатися раніше чи пізніше, і пити більше, ніж здається потрібним. Помірні тренування, трохи полегшена версія силової роботи та ходьба зазвичай стійкіші. При здутті й чутливих грудях добре підтримувальний спортивний бюстгальтер і довша розминка дають реальну різницю. Якщо настрій упав, зроби тренування коротким і легким, а не пропускай цілком — поріг, за якого воно зараховується, нижчий, ніж здається.';

  @override
  String get tipFitnessDetailUnknown =>
      'Навіть не знаючи фази, рухатися корисно будь-коли: загальна рекомендація — близько 150 хвилин помірної активності на тиждень, розподілених на більшість днів, плюс силова робота двічі на тиждень; майже для всіх така схема дає більше, ніж рідкісні дуже інтенсивні тренування. Регулярність важить більше за інтенсивність, і найкраще тренування — те, яке ти справді повториш наступного тижня. Підлаштовуйся під самопочуття: у втомлені дні зараховується й прогулянка, а коротке зроблене тренування вартує більше, ніж довге пропущене. Щойно запишеш кілька циклів, тут з\'являться поради під конкретну фазу.';

  @override
  String get tipNutritionDetailMenstrual =>
      'Кровотеча витрачає залізо; червоне м\'ясо, сочевиця, нут, темно-зелені листові овочі та патока допомагають його поповнити. Рослинне залізо помітно краще засвоюється разом із вітаміном C — вичавити лимон у сочевичну страву це найпрактичніший варіант, а салат із помідорів поруч робить те саме. Чай і кава під час їжі знижують засвоєння заліза через таніни, тож достатньо залишити близько години між ними; відмовлятися ні від того, ні від іншого не потрібно. Достатня кількість води може пом\'якшити втому й головний біль, що супроводжують кровотечу, а багаті на магній продукти — горіхи, насіння, темна листова зелень — частині людей допомагають зі спазмами. У дні, коли травлення йде повільно, невеликі часті прийоми їжі переносяться легше, ніж щільні. Якщо під час менструації часто буває задишка, запаморочення або незвична виснаженість, про це варто сказати фахівцю: низьке залізо трапляється часто, легко перевіряється й не є тим, що має діагностувати застосунок.';

  @override
  String get tipNutritionDetailFollicular =>
      'Поки енергія повертається, тіло в режимі відбудови: достатньо білка, цільні злаки й овочі це підтримують, і саме в цій фазі апетит зазвичай найрівніший і ним легше керувати. Має сенс і далі поповнювати запаси заліза після кровотечі, а не вважати це завданням лише менструального тижня — запаси відновлюються тижнями, а не днями. Не пропускати прийоми їжі тут простіше, і це дозволяє ввійти в коливання апетиту наступної фази рівніше. Якщо збираєшся змінювати те, як ти їси, цей відрізок зазвичай добріший для початку, ніж тиждень перед менструацією, коли потяг і знижений настрій роблять будь-яку нову звичку важчою, ніж вона є.';

  @override
  String get tipNutritionDetailFertile =>
      'Тут не потрібна особлива дієта; збалансовані прийоми їжі й достатня кількість води роблять більшу частину роботи. Хтось відчуває здуття навколо овуляції — зазвичай це гормональне й минуще, а не наслідок з\'їденого. Апетит в одних трохи знижується, в інших зростає, і те й інше звичайне. Білок і клітковина в їжі втримують енергію рівною в той відрізок місяця, який часто виявляється найактивнішим. Якщо плануєш вагітність, це розумний момент запитати фахівця про фолієву кислоту, яку зазвичай радять до зачаття, а не після, — але це розмова з ним, а не порада, яку має давати застосунок.';

  @override
  String get tipNutritionDetailLuteal =>
      'Посилення апетиту й потяг до солодкого в міру зростання прогестерону дуже поширені; це гормональний зсув, а не питання сили волі, і тіло в цій фазі справді витрачає трохи більше енергії. Додати в їжу білок і клітковину — означає втримати цукор крові рівнішим і пом\'якшити потяг набагато краще, ніж намагатися його ігнорувати: потяг, на який відповіли чимось ситним, зазвичай закінчується раніше, ніж той, з яким борються годину. Менше солі й більше води можуть полегшити здуття; звучить навпаки, але це не так: за доброго питного режиму тіло затримує менше. Багаті на магній продукти (мигдаль, волоські горіхи, темна зелень, чорний шоколад) у частини людей зменшують спазми й напруження. Скоротити кофеїн після полудня допомагає переривчастому сну цієї фази, і за алкоголем теж варто стежити — він дробить сон саме в тій точці циклу, де він і без того поверхневіший.';

  @override
  String get tipNutritionDetailUnknown =>
      'Хоч у якій ти фазі, найбільше допомагають одні й ті самі речі: регулярна їжа, достатньо білка, багато овочів, достатньо води й продукти, багаті на залізо. Оскільки кровотеча витрачає залізо, у ці дні достатньо приділити йому трохи більше уваги — окремого харчування на кожен тиждень місяця не потрібно. Їсти приблизно в один і той самий час дає для рівної енергії більше, ніж будь-який окремий продукт, і нічого не треба виключати, щоб цикл був здоровим. Щойно запишеш кілька циклів, тут з\'являться поради під конкретну фазу.';

  @override
  String get tipSleepLabel => 'Сон';

  @override
  String get tipSleepMenstrual =>
      'Спазми та дискомфорт можуть переривати сон; тепла душ або грілка перед сном можуть допомогти.';

  @override
  String get tipSleepFollicular =>
      'З підвищенням енергії багато хто почувається бадьорішим — але реальна потреба у сні насправді не зменшується.';

  @override
  String get tipSleepFertile =>
      'Невелике підвищення температури тіла біля овуляції може трохи ускладнити засинання; прохолодніша кімната може допомогти.';

  @override
  String get tipSleepLuteal =>
      'Прогестерон трохи підвищує температуру спокою і може робити глибокий сон легшим; прохолодна, темна кімната та стабільний час відходу до сну допомагають тут найбільше.';

  @override
  String get tipSleepUnknown =>
      'Якість сну часто змінюється протягом циклу — зазвичай найкрихкіша безпосередньо перед менструацією та під час неї. Стабільний час сну — найнадійніша основа незалежно від фази.';

  @override
  String get tipSleepDetailMenstrual =>
      'Під час менструації сон часто більш переривчастий — спазми, дискомфорт і для деяких частіші відвідування туалету можуть будити вночі. Тепла душ, грілка або легка розтяжка перед сном можуть полегшити спазми. Якщо приймаєте знеболювальне, розрахунок часу так, щоб ефект охоплював першу частину ночі, може захистити ранній сон.';

  @override
  String get tipSleepDetailFollicular =>
      'З підвищенням естрогену багато хто почувається бадьорішим та енергійнішим, що може сприйматися як менша потреба у сні. Це не зовсім так — просто бадьорість дається легше. Збереження стабільного часу сну тут окупається пізніше, коли сон стає крихкішим в інших фазах.';

  @override
  String get tipSleepDetailFertile =>
      'Невелике підвищення температури тіла біля овуляції може трохи ускладнити засинання, оскільки тіло природно хоче охолонути перед сном. Прохолодніша кімната, легша ковдра або тепла душ перед сном можуть це компенсувати.';

  @override
  String get tipSleepDetailLuteal =>
      'Прогестерон, що підвищується після овуляції, трохи піднімає температуру спокою, що може робити глибокий сон легшим — іноді як легкий приплив жару, іноді просто як менш відновлювальний сон. З наближенням менструації може додаватися передменструальна напруга. Прохолодна, темна кімната, менше екранного часу перед сном і стабільний час сну допомагають тут найбільше.';

  @override
  String get tipSleepDetailUnknown =>
      'Поки що недостатньо даних, щоб визначити поточну фазу, але мінлива якість сну протягом циклу — поширена закономірність: зазвичай крихкіша безпосередньо перед менструацією та під час неї, стабільніша в першій половині. Найнадійніша основа незалежно від фази: стабільний час сну й пробудження, менше екранного часу перед сном і прохолодна, темна кімната.';
}
