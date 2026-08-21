// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get appTitle => 'Vera';

  @override
  String get actionSkip => 'Пропустить';

  @override
  String get actionContinue => 'Продолжить';

  @override
  String get actionDone => 'Готово';

  @override
  String get actionCancel => 'Отмена';

  @override
  String get actionClear => 'Очистить';

  @override
  String get actionDelete => 'Удалить';

  @override
  String get actionEnable => 'Включить';

  @override
  String get commonIDontKnow => 'Не знаю';

  @override
  String get commonYes => 'Да';

  @override
  String get commonNo => 'Нет';

  @override
  String get commonNotSure => 'Сложно сказать';

  @override
  String get pinSetupTitle => 'Установите PIN-код';

  @override
  String get pinSetupEnterPrompt =>
      'Придумайте 6-значный PIN-код, чтобы заблокировать приложение';

  @override
  String get pinSetupConfirmPrompt => 'Введите его ещё раз для подтверждения';

  @override
  String get pinSetupMismatch => 'Коды не совпали — попробуем ещё раз';

  @override
  String get pinSetupBiometricTitle => 'Разблокировать быстрее?';

  @override
  String get pinSetupBiometricBody =>
      'Разблокировать можно также отпечатком пальца или по лицу — PIN-код останется запасным способом.';

  @override
  String get lockScreenTitle => 'Заблокировано';

  @override
  String get lockScreenEnterPin => 'Введите PIN-код';

  @override
  String get lockScreenWrongPin => 'Этот PIN-код не подходит';

  @override
  String get lockScreenUseBiometrics => 'Использовать биометрию';

  @override
  String get lockScreenUseFaceId => 'Использовать Face ID';

  @override
  String get lockScreenUseFingerprint => 'Использовать отпечаток пальца';

  @override
  String get lockScreenForgotPin => 'Забыли PIN-код?';

  @override
  String get lockScreenForgotPinChoiceTitle => 'Как ты хочешь его сбросить?';

  @override
  String get lockScreenResetViaDevice => 'Подтвердить этим устройством';

  @override
  String get lockScreenResetViaDeviceBody =>
      'Твои данные останутся. Достаточно подтвердить собственной блокировкой телефона — Face ID, отпечатком или паролем.';

  @override
  String get lockScreenResetViaDeviceReason =>
      'Подтвердите личность, чтобы задать новый PIN';

  @override
  String lockScreenThrottled(int seconds) {
    return 'Слишком много попыток. Повторите через $seconds с';
  }

  @override
  String get lockScreenEraseTitle => 'Удалить все данные?';

  @override
  String get lockScreenEraseBody =>
      'Это безвозвратно удалит всё, что есть на этом устройстве. Аккаунта и резервной копии на сервере нет, поэтому отменить действие не получится.';

  @override
  String get lockScreenEraseConfirm => 'Удалить всё';

  @override
  String get onboardingPrivacyTitle => 'Добро пожаловать';

  @override
  String get onboardingPrivacyBody =>
      'Данные вашего цикла хранятся только на этом устройстве, в зашифрованном виде. Нет аккаунта и облачной синхронизации — ничего из записанного не выгружается. Ключ шифрования лежит в защищённом хранилище вашего телефона, а экспортировать или полностью удалить данные можно в любой момент.';

  @override
  String get onboardingLastPeriodTitle =>
      'Когда началась ваша последняя менструация?';

  @override
  String get onboardingLastPeriodBody =>
      'Это нужно для начала — потом дату всегда можно исправить в календаре.';

  @override
  String get onboardingPickDate => 'Выбрать дату';

  @override
  String get onboardingCycleLengthTitle => 'Какова обычная длина вашего цикла?';

  @override
  String get onboardingCycleLengthBody =>
      'Достаточно примерного числа. Настоящий прогноз начнётся, когда мы увидим пару полных циклов.';

  @override
  String get onboardingPeriodLengthTitle =>
      'Сколько дней обычно длится менструация?';

  @override
  String get onboardingPeriodLengthBody =>
      'По этому числу мы заполним вашу последнюю менструацию, чтобы не начинать с нуля.';

  @override
  String get onboardingDaysUnit => 'дн.';

  @override
  String get onboardingGoalTitle => 'Что привело вас сюда?';

  @override
  String get onboardingGoalBody =>
      'Это нужно только для того, чтобы сразу показать вам подходящее — решение можно изменить в любой момент в настройках.';

  @override
  String get goalTrackPeriod => 'Отслеживать менструацию';

  @override
  String get goalTryingToConceive => 'Пытаюсь забеременеть';

  @override
  String get goalPregnancyTracking => 'Слежу за беременностью';

  @override
  String get onboardingRegularityTitle => 'Ваши циклы обычно регулярны?';

  @override
  String get onboardingRegularityBody =>
      'Неправильных ответов здесь нет — это просто помогает нам чуть лучше узнать ваш организм.';

  @override
  String get onboardingCrampsTitle => 'У вас обычно бывают спазмы?';

  @override
  String get onboardingCrampsBody =>
      'Мы сделаем так, чтобы в такие дни было легко записать своё самочувствие.';

  @override
  String get onboardingBirthYearTitle => 'В каком году ты родилась?';

  @override
  String get onboardingBirthYearBody =>
      'Просто для более полной картины — это никогда не используется ни для каких прогнозов.';

  @override
  String get onboardingPmsTitle => 'Обычно что-то проявляется заранее?';

  @override
  String get onboardingPmsBody =>
      'Выбери сколько подходит. Нигде не сохраняется, неправильных ответов нет.';

  @override
  String get onboardingNotificationTitle => 'Хотите мягкие напоминания?';

  @override
  String get onboardingNotificationBody =>
      'Мы можем предупредить вас незадолго до ожидаемой менструации.';

  @override
  String get onboardingNotificationMockTitle =>
      'Менструация может начаться скоро';

  @override
  String get onboardingNotificationMockBody => 'По вашим записанным циклам';

  @override
  String get onboardingNotificationAllow => 'Включить напоминания';

  @override
  String get onboardingNotificationNotNow => 'Не сейчас';

  @override
  String get onboardingBuildingPlanTitle => 'Готовим всё для вас';

  @override
  String get onboardingBuildingPlanStep1 =>
      'Защищаем ваши данные на этом устройстве';

  @override
  String get onboardingBuildingPlanStep2 => 'Сохраняем ваши настройки';

  @override
  String get onboardingBuildingPlanStep3 => 'Готовим календарь';

  @override
  String get onboardingBuildingPlanDone => 'Всё готово';

  @override
  String get navHome => 'Главная';

  @override
  String get navCalendar => 'Календарь';

  @override
  String get navInsights => 'Статистика';

  @override
  String get navSettings => 'Настройки';

  @override
  String get navReminders => 'Напоминания';

  @override
  String get navProfile => 'Профиль';

  @override
  String get navTrack => 'Записать';

  @override
  String homeCycleDayLabel(int day) {
    return 'День $day';
  }

  @override
  String get homeNoCycleYet => 'Менструация ещё не отмечена';

  @override
  String get homePhaseMenstrual => 'Менструация';

  @override
  String get homePhaseFollicular => 'Фолликулярная фаза';

  @override
  String get homePhaseFertileWindow => 'Предполагаемое фертильное окно';

  @override
  String get homePhaseLuteal => 'Лютеиновая фаза';

  @override
  String get homePhaseUnknown => 'Недостаточно свежих данных';

  @override
  String get homePredictionInsufficientTitle => 'Пока недостаточно данных';

  @override
  String get homePredictionInsufficientBody =>
      'Отметьте следующую менструацию, и мы начнём делать прогноз.';

  @override
  String homePredictionRangeLabel(String start, String end) {
    return '$start – $end';
  }

  @override
  String get homeConfidenceHigh => 'Высокая уверенность';

  @override
  String get homeConfidenceMedium => 'Средняя уверенность';

  @override
  String get homeConfidenceLow => 'Низкая уверенность';

  @override
  String get homeIrregularNote =>
      'В последнее время длина вашего цикла меняется сильнее обычного. Если для вас это ново, об этом стоит упомянуть на приёме у врача.';

  @override
  String get homeFertileWindowDisclaimer =>
      'Основано на типичных сроках цикла — это не метод контрацепции.';

  @override
  String get homePeriodStartedButton => 'Менструация началась сегодня';

  @override
  String get homePeriodStartedSnackbar =>
      'Записано — менструация началась сегодня';

  @override
  String get actionUndo => 'Отменить';

  @override
  String get comingSoon => 'Скоро';

  @override
  String get dayLogFlowLabel => 'Выделения';

  @override
  String get flowSpotting => 'Мажущие';

  @override
  String get flowLight => 'Слабые';

  @override
  String get flowMedium => 'Средние';

  @override
  String get flowHeavy => 'Обильные';

  @override
  String get flowNone => 'Нет';

  @override
  String get dayLogSymptomsLabel => 'Симптомы';

  @override
  String get symptomCramps => 'Спазмы';

  @override
  String get symptomHeadache => 'Головная боль';

  @override
  String get symptomBloating => 'Вздутие';

  @override
  String get symptomBreastTenderness => 'Болезненность груди';

  @override
  String get symptomAcne => 'Акне';

  @override
  String get symptomFatigue => 'Усталость';

  @override
  String get symptomNausea => 'Тошнота';

  @override
  String get symptomBackPain => 'Боль в спине';

  @override
  String get symptomAppetiteChange => 'Изменение аппетита';

  @override
  String get symptomSleepTrouble => 'Проблемы со сном';

  @override
  String get symptomPelvicPain => 'Тазовая боль';

  @override
  String get symptomDizziness => 'Головокружение';

  @override
  String get symptomMigraine => 'Мигрень';

  @override
  String get symptomHighFever => 'Высокая температура';

  @override
  String get symptomNeckPain => 'Боль в шее';

  @override
  String get symptomShoulderPain => 'Боль в плече';

  @override
  String get symptomLimbPain => 'Боль в конечностях';

  @override
  String get symptomMuscleAche => 'Мышечная боль';

  @override
  String get symptomChills => 'Озноб';

  @override
  String get symptomNightSweats => 'Ночная потливость';

  @override
  String get symptomHotFlashes => 'Приливы жара';

  @override
  String get symptomWeightGain => 'Набор веса';

  @override
  String get symptomConstipation => 'Запор';

  @override
  String get symptomDiarrhea => 'Диарея';

  @override
  String get symptomIndigestion => 'Расстройство пищеварения';

  @override
  String get symptomGasPain => 'Боль от газов';

  @override
  String get symptomFeelingUnwell => 'Недомогание';

  @override
  String get symptomItching => 'Зуд';

  @override
  String get symptomTroubleFocusing => 'Трудности с концентрацией';

  @override
  String get symptomForgetfulness => 'Забывчивость';

  @override
  String get symptomGroupHead => 'Голова';

  @override
  String get symptomGroupBody => 'Тело';

  @override
  String get symptomGroupAbdomen => 'Живот';

  @override
  String get symptomGroupGeneral => 'Общее';

  @override
  String get symptomGroupCognitive => 'Когнитивное';

  @override
  String get dayLogMoodLabel => 'Настроение';

  @override
  String get moodCalm => 'Спокойствие';

  @override
  String get moodAnxious => 'Тревога';

  @override
  String get moodIrritable => 'Раздражительность';

  @override
  String get moodLow => 'Пониженное настроение';

  @override
  String get moodEnergetic => 'Бодрость';

  @override
  String get moodHappy => 'Радость';

  @override
  String get moodContent => 'Удовлетворённость';

  @override
  String get moodSad => 'Грусть';

  @override
  String get moodDepressed => 'Подавленность';

  @override
  String get moodEmotional => 'Эмоциональность';

  @override
  String get moodExcited => 'Взволнована';

  @override
  String get moodHopeful => 'Полна надежд';

  @override
  String get moodProud => 'Горда';

  @override
  String get moodDisappointed => 'Разочарована';

  @override
  String get moodConfident => 'Уверена в себе';

  @override
  String get moodSurprised => 'Удивлена';

  @override
  String get moodIndifferent => 'Равнодушна';

  @override
  String get moodPeaceful => 'Умиротворена';

  @override
  String get moodInLove => 'Влюблена';

  @override
  String get moodShy => 'Застенчива';

  @override
  String get moodPlayful => 'Игрива';

  @override
  String get moodExhausted => 'Измождена';

  @override
  String get moodLonely => 'Одинока';

  @override
  String get moodOverwhelmed => 'Подавлена';

  @override
  String get moodGrateful => 'Благодарна';

  @override
  String get moodNostalgic => 'Ностальгична';

  @override
  String get dayLogNoteLabel => 'Заметка';

  @override
  String get dayLogNoteHint => 'Что-то, что хочется запомнить об этом дне';

  @override
  String get dayLogOptionalTrackersLabel => 'Дополнительные показатели';

  @override
  String get dayLogSexualActivityLabel => 'Половая активность';

  @override
  String get sexLifeNone => 'Ничего';

  @override
  String get sexLifeUnprotected => 'Секс без защиты';

  @override
  String get sexLifeProtected => 'Секс с защитой';

  @override
  String get sexLifeMasturbation => 'Мастурбация';

  @override
  String get sexLifeNoOrgasm => 'Без оргазма';

  @override
  String get sexLifeOrgasm => 'Оргазм';

  @override
  String get sexLifeHighDesire => 'Высокое влечение';

  @override
  String get dayLogBbtLabel => 'Базальная температура тела';

  @override
  String get dayLogMucusLabel => 'Цервикальная слизь';

  @override
  String get mucusDry => 'Сухость';

  @override
  String get mucusSticky => 'Липкая';

  @override
  String get mucusCreamy => 'Кремообразная';

  @override
  String get mucusWatery => 'Водянистая';

  @override
  String get mucusEggWhite => 'Яичный белок';

  @override
  String get dayLogSavedIndicator => 'Сохранено';

  @override
  String get homeOpenTodayLog => 'Добавить подробности за сегодня';

  @override
  String get calendarLegendActual => 'Отмеченная менструация';

  @override
  String get calendarLegendPredicted => 'Прогнозируемое окно';

  @override
  String get calendarLegendFertile => 'Предполагаемое фертильное окно';

  @override
  String get calendarLegendOvulation => 'Предполагаемая овуляция';

  @override
  String get dayDetailFertileTitle => 'Это ваше предполагаемое фертильное окно';

  @override
  String get dayDetailOvulationTitle => 'Предполагаемый день овуляции';

  @override
  String get dayDetailOvulationBody =>
      'По типичным срокам вероятность беременности около этого дня обычно выше — это оценка, а не гарантия.';

  @override
  String get insightsCyclesLoggedLabel => 'Записано циклов';

  @override
  String get insightsAveragePeriodLengthLabel =>
      'Средняя длительность менструации';

  @override
  String get insightsAverageCycleLengthLabel => 'Средняя длина цикла';

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
      other: 'Разброс — примерно $daysString дня',
      many: 'Разброс — примерно $daysString дней',
      few: 'Разброс — примерно $daysString дня',
      one: 'Разброс — примерно $daysString день',
    );
    return '$_temp0';
  }

  @override
  String get insightsNotEnoughDataTitle => 'Пока недостаточно данных';

  @override
  String get insightsNotEnoughDataBody =>
      'Отметьте пару полных циклов, и здесь появятся ваши средние значения.';

  @override
  String get insightsSymptomFrequencyTitle => 'Симптомы по дням цикла';

  @override
  String get insightsNoSymptomsLogged => 'Симптомы пока не отмечены';

  @override
  String get settingsLanguageLabel => 'Язык';

  @override
  String get settingsLanguageSystem => 'Язык системы';

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
  String get tourSkip => 'Пропустить';

  @override
  String get tourNext => 'Далее';

  @override
  String get tourStart => 'Начнём';

  @override
  String get tourHomeTitle => 'Главная';

  @override
  String get tourHomeBody =>
      'Смотри одним взглядом, где ты сегодня — день цикла, сколько осталось до предполагаемого окна, и твой спутник всегда здесь.';

  @override
  String get tourCalendarTitle => 'Календарь';

  @override
  String get tourCalendarBody =>
      'Смотри свои прошлые и будущие циклы в календаре. Нажми на любой день, чтобы открыть его запись.';

  @override
  String get tourTrackTitle => 'Запись';

  @override
  String get tourTrackBody =>
      'Кнопка + в центре открывает запись за сегодня откуда угодно — выделения, симптомы, настроение и другое.';

  @override
  String get tourRemindersTitle => 'Напоминания';

  @override
  String get tourRemindersBody =>
      'Настрой напоминания о предстоящих месячных, лекарствах или питье воды — всё остаётся в твоём телефоне и никуда не отправляется.';

  @override
  String get tourProfileTitle => 'Профиль';

  @override
  String get tourProfileBody =>
      'Здесь ты найдёшь свою статистику, всё, что отслеживаешь, и настройки.';

  @override
  String get settingsWeekStartLabel => 'Неделя начинается с';

  @override
  String get settingsWeekStartMonday => 'Понедельник';

  @override
  String get settingsWeekStartSunday => 'Воскресенье';

  @override
  String get settingsTemperatureUnitLabel => 'Единица температуры';

  @override
  String get settingsTemperatureCelsius => 'Цельсий';

  @override
  String get settingsTemperatureFahrenheit => 'Фаренгейт';

  @override
  String get settingsRemindersLabel => 'Напоминать перед менструацией';

  @override
  String get remindersScreenTitle => 'Напоминания';

  @override
  String get reminderDetailNotification => 'Уведомление';

  @override
  String get reminderDetailAlert => 'Оповещение';

  @override
  String get reminderDetailAlertToday => 'В тот же день';

  @override
  String get reminderDetailTime => 'Время';

  @override
  String get reminderDetailMessage => 'Сообщение';

  @override
  String get reminderDetailMessageEditTitle => 'Изменить сообщение';

  @override
  String get reminderDetailMessageHint => 'Напишите своё сообщение';

  @override
  String reminderDetailAlertDaysBefore(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count дня раньше',
      many: '$count дней раньше',
      few: '$count дня раньше',
      one: '$count день раньше',
    );
    return '$_temp0';
  }

  @override
  String optionsShowMore(int count) {
    return 'ещё +$count';
  }

  @override
  String get optionsShowLess => 'Свернуть';

  @override
  String get trackerHistoryEntry => 'История';

  @override
  String get actionSend => 'Отправить';

  @override
  String get actionRemove => 'Удалить';

  @override
  String get feedbackEntry => 'Отзыв';

  @override
  String get cloudBackupEntry => 'Резервная копия с аккаунтом';

  @override
  String get cloudBackupTitle => 'Резервная копия с аккаунтом';

  @override
  String get cloudBackupNotConfiguredTitle => 'Пока недоступно в этой версии';

  @override
  String get cloudBackupNotConfiguredBody =>
      'Облачному резервному копированию нужен сервис учётных записей, который ещё не настроен для этой версии. До тех пор здесь ничего нельзя использовать.';

  @override
  String get cloudBackupIntro1Title => 'Никогда не теряй свою историю';

  @override
  String get cloudBackupIntro1Body =>
      'История твоего цикла остаётся в безопасности, даже если ты потеряешь телефон или перейдёшь на новый.';

  @override
  String get cloudBackupIntro2Title => 'Только ты можешь её открыть';

  @override
  String get cloudBackupIntro2Body =>
      'Твоя резервная копия шифруется паролем ещё до того, как покинет телефон — мы не можем её прочитать, и никто другой тоже.';

  @override
  String get cloudBackupIntro3Title => 'Восстанови за секунды';

  @override
  String get cloudBackupIntro3Body =>
      'Войди на новом устройстве и верни свою историю тем же паролем.';

  @override
  String get cloudBackupSignedInTitle => 'Вход выполнен';

  @override
  String get cloudBackupUploadButton => 'Создать копию сейчас';

  @override
  String get cloudBackupDownloadButton => 'Восстановить из облака';

  @override
  String get cloudBackupUploadSuccess => 'Сохранено в твоём аккаунте';

  @override
  String get cloudBackupNoBackupFound =>
      'Для этого аккаунта пока не найдено резервной копии в облаке.';

  @override
  String get partnerModeEntry => 'Режим партнёра';

  @override
  String get partnerModeTitle => 'Режим партнёра';

  @override
  String get partnerModeNotConfiguredTitle => 'Пока недоступно в этой версии';

  @override
  String get partnerModeNotConfiguredBody =>
      'Режиму партнёра нужен сервис учётных записей, который ещё не настроен для этой версии. До тех пор здесь ничего нельзя использовать.';

  @override
  String get partnerModeHeroTitle => 'Делись немногим, на своих условиях';

  @override
  String get partnerModeHeroBody =>
      'Свяжись со своим партнёром и делись только тем, что включишь ниже — никогда всей историей, никогда автоматически.';

  @override
  String get partnerModeSignInGoogle => 'Продолжить через Google';

  @override
  String get partnerModeSignInApple => 'Продолжить через Apple';

  @override
  String get partnerModeFaqTitle => 'Прежде чем войти';

  @override
  String get partnerModeFaq1Q => 'Что на самом деле увидит мой партнёр?';

  @override
  String get partnerModeFaq1A =>
      'Только поля, которые ты включишь в Режиме партнёра, и только твоё текущее состояние — никогда сохранённую историю и ничего, чем ты явно не поделилась.';

  @override
  String get partnerModeFaq2Q => 'Могу ли я отключить это позже?';

  @override
  String get partnerModeFaq2A =>
      'Да. Разрыв связи немедленно прекращает обмен данными для вас обоих, и ты можешь в любой момент отключить любой отдельный переключатель без разрыва связи.';

  @override
  String get partnerModeFaq3Q => 'Нужно ли моему партнёру это приложение?';

  @override
  String get partnerModeFaq3A =>
      'Да — он входит так же и связывается с помощью кода, который ты ему отправишь.';

  @override
  String get partnerModeNotPairedTitle => 'Пока не связаны';

  @override
  String get partnerModeNotPairedBody =>
      'Пригласи своего партнёра одноразовым кодом или введи код, который он тебе отправил.';

  @override
  String get partnerModeInviteButton => 'Пригласить партнёра';

  @override
  String get partnerModeEnterCodeButton => 'Ввести код';

  @override
  String get partnerModeSignOut => 'Выйти';

  @override
  String get partnerModePairedTitle => 'Связаны';

  @override
  String get partnerModePairedBody =>
      'Вы с партнёром связаны. Обмен данными по-прежнему ограничен тем, что ты включишь ниже.';

  @override
  String get partnerModeShareSectionTitle => 'Чем ты делишься';

  @override
  String get partnerModeShareCyclePhase => 'Фаза и день цикла';

  @override
  String get partnerModeShareMood => 'Настроение сегодня';

  @override
  String get partnerModeShareSymptoms => 'Симптомы сегодня';

  @override
  String get partnerModeShareHighDesire => 'Желание близости сегодня';

  @override
  String get partnerModeShareNow => 'Поделиться сейчас';

  @override
  String get partnerModeShareSuccess => 'Отправлено партнёру';

  @override
  String get partnerModeUnpair => 'Разорвать связь';

  @override
  String get partnerModeUnpairConfirmTitle => 'Разорвать связь с партнёром?';

  @override
  String get partnerModeUnpairConfirmBody =>
      'Это немедленно прекращает обмен данными для вас обоих. Позже вы можете снова связаться новым кодом.';

  @override
  String get partnerModePartnerSnapshotEmpty =>
      'Твой партнёр пока ничем не поделился.';

  @override
  String get partnerModeErrorNotConfigured =>
      'Режим партнёра ещё не настроен в этой версии.';

  @override
  String get partnerModeErrorCodeNotFound =>
      'Этот код не найден. Проверь его и попробуй снова.';

  @override
  String get partnerModeErrorCodeExpired =>
      'Срок действия этого кода истёк. Запроси новый.';

  @override
  String get partnerModeErrorCodeIsOwn =>
      'Это твой собственный код — попроси у партнёра его код.';

  @override
  String get partnerModeErrorNotSignedIn => 'Сначала войди в аккаунт.';

  @override
  String get partnerModeErrorUnknown => 'Что-то пошло не так. Попробуй снова.';

  @override
  String get partnerModeInviteTitle => 'Пригласи своего партнёра';

  @override
  String get partnerModeInviteBody =>
      'Отправь этот код своему партнёру. Он введёт его в своём приложении, чтобы связаться с тобой.';

  @override
  String get partnerModeInviteExpiry => 'Действителен 7 дней';

  @override
  String get partnerModeInviteShare => 'Поделиться кодом';

  @override
  String partnerModeInviteMessage(String code) {
    return 'Вот мой код связи в Vera: $code';
  }

  @override
  String get partnerModeEnterTitle => 'Ввести код';

  @override
  String get partnerModeEnterBody =>
      'Введи код, который отправил тебе партнёр.';

  @override
  String get partnerModeEnterHint => 'Код из 6 символов';

  @override
  String get partnerModeEnterSubmit => 'Связать';

  @override
  String get homeInvitePartnerTitle => 'Поделись с партнёром';

  @override
  String get homeInvitePartnerBody =>
      'Свяжитесь и делись только тем, что выберешь — твоя история останется твоей.';

  @override
  String get homeInvitePartnerCta => 'Настроить Режим партнёра';

  @override
  String get feedbackTitle => 'Что тебе не понравилось?';

  @override
  String get feedbackSubtitle => 'Выбери тему и напиши подробнее, если хочешь.';

  @override
  String get feedbackCategoryPredictions => 'Прогнозы';

  @override
  String get feedbackCategoryBackup => 'Резервное копирование';

  @override
  String get feedbackCategorySubscription => 'Подписка';

  @override
  String get feedbackCategoryAds => 'Реклама';

  @override
  String get feedbackCategoryDesign => 'Дизайн';

  @override
  String get feedbackCategoryTranslation => 'Перевод';

  @override
  String get feedbackCategoryOther => 'Другое';

  @override
  String get feedbackDescriptionLabel => 'Расскажи подробнее (необязательно)';

  @override
  String get feedbackDescriptionHint =>
      'Что случилось? Нажав «Отправить», ты сам выберешь, куда поделиться — почтовое приложение или другое место.';

  @override
  String get feedbackAttachPhoto => 'Добавить фото';

  @override
  String get feedbackPhotoAttached => 'Фото прикреплено';

  @override
  String get remindersGroupCycle => 'Месячные и фертильность';

  @override
  String get remindersGroupMedication => 'Лекарства';

  @override
  String get remindersGroupLifestyle => 'Образ жизни';

  @override
  String get remindersGroupAppointment => 'Приём у врача';

  @override
  String get settingsRemindersPeriodEndLabel =>
      'Спрашивать, когда менструация должна заканчиваться';

  @override
  String get settingsRemindersMedicationLabel => 'Напоминание о лекарстве';

  @override
  String get settingsRemindersWaterLabel => 'Напоминание о воде';

  @override
  String get settingsRemindersAppointmentLabel =>
      'Напоминание о приёме у врача';

  @override
  String get settingsRemindersAppointmentSet => 'Указать дату и время';

  @override
  String get settingsRemindersAppointmentClear => 'Очистить';

  @override
  String get settingsOptionalTrackersHeading => 'Дополнительные показатели';

  @override
  String get settingsOptionalTrackersBody =>
      'По умолчанию выключены. Если включить показатель, он появится на экране записи дня.';

  @override
  String get settingsSexualActivityToggle => 'Половая активность';

  @override
  String get settingsBbtToggle => 'Базальная температура тела';

  @override
  String get settingsMucusToggle => 'Цервикальная слизь';

  @override
  String get settingsBreastExamToggle => 'Самообследование груди';

  @override
  String get settingsCervixToggle => 'Положение и плотность шейки матки';

  @override
  String get settingsPrivacyEntry => 'Конфиденциальность';

  @override
  String get settingsRateEntry => 'Оцените нас';

  @override
  String get rateAppTitle => 'Vera тебе помогает?';

  @override
  String get rateAppBody =>
      'Если да, то несколько секунд на оценку в магазине помогут другим, кто ищет что-то подобное, найти это.';

  @override
  String get rateAppCta => 'Оценить Vera';

  @override
  String get rateAppDismiss => 'Не сейчас';

  @override
  String get settingsDeleteAllData => 'Удалить все данные';

  @override
  String get privacyScreenTitle => 'Конфиденциальность';

  @override
  String get privacyScreenIntro =>
      'Вот что именно происходит с вашими данными, простыми словами.';

  @override
  String get privacyScreenStorageTitle => 'Зашифровано на этом устройстве';

  @override
  String get privacyScreenNoNetworkTitle => 'Ни сервера, ни аккаунта';

  @override
  String get privacyScreenNoThirdPartyTitle => 'Без отслеживания';

  @override
  String get privacyScreenExportTitle => 'Экспорт — только по твоей команде';

  @override
  String get privacyScreenDeleteTitle => 'Удаление необратимо';

  @override
  String get privacyScreenStorage =>
      'Всё, что вы записываете, шифруется и хранится только на этом устройстве, в одном файле. Ключ шифрования лежит в защищённом хранилище телефона — Keychain на iOS, Keystore на Android — а не в самом файле.';

  @override
  String get privacyScreenNoNetwork =>
      'У этого приложения нет своего сервера и системы аккаунтов — ваши записи никогда не выгружаются. В бесплатной версии есть реклама Google, которая выходит в интернет; она никогда не получает то, что вы записываете.';

  @override
  String get privacyScreenNoThirdParty =>
      'Здесь нет аналитики, нет сбора отчётов о сбоях и нет трекинговых SDK. Единственный сторонний компонент — рекламный SDK Google в бесплатной версии; Premium убирает его полностью.';

  @override
  String get privacyScreenExport =>
      'Единственный способ, которым ваши данные покидают это устройство, — ваш собственный экспорт, и он зашифрован паролем, который знаете только вы.';

  @override
  String get privacyScreenDelete =>
      'Удаление данных настоящее и мгновенное. Аккаунта нет, резервной копии на нашей стороне тоже — если данные удалены, они удалены навсегда.';

  @override
  String get adPlaceholderLabel => 'Место для рекламы';

  @override
  String get adPlaceholderUpgradeCta => 'Отключить рекламу с Premium';

  @override
  String get reminderNotificationTitle => 'Менструация может начаться скоро';

  @override
  String get reminderNotificationBody =>
      'По вашим записанным циклам предполагаемое окно уже близко.';

  @override
  String get reminderPeriodEndTitle =>
      'Менструация, возможно, подходит к концу';

  @override
  String get reminderPeriodEndBody =>
      'Если она ещё идёт, это совершенно нормально — просто мягкая проверка.';

  @override
  String get reminderMedicationTitle => 'Напоминание о лекарстве';

  @override
  String get reminderMedicationBody => 'Пора принять лекарство.';

  @override
  String get reminderWaterTitle => 'Не забывайте про воду';

  @override
  String get reminderWaterBody => 'Небольшое напоминание о воде.';

  @override
  String get reminderAppointmentTitle => 'Скоро приём у врача';

  @override
  String get reminderAppointmentBody => 'У тебя скоро приём у врача.';

  @override
  String get settingsExportEntry => 'Экспорт и резервная копия';

  @override
  String get exportBackupHeading => 'Зашифрованная резервная копия';

  @override
  String get exportBackupBody =>
      'Сохраните зашифрованную копию своей истории, чтобы перенести её на новое устройство. Для восстановления понадобится тот же пароль — другого способа вернуть данные нет.';

  @override
  String get exportCreateBackupButton => 'Создать копию';

  @override
  String get exportRestoreBackupButton => 'Восстановить из копии';

  @override
  String get exportPasswordLabel => 'Пароль';

  @override
  String get exportPasswordConfirmLabel => 'Подтвердите пароль';

  @override
  String get exportPasswordMismatch => 'Пароли не совпадают';

  @override
  String get exportPasswordTooShort => 'Используйте минимум 8 символов';

  @override
  String get exportRestoreConfirmTitle =>
      'Заменить все данные на этом устройстве?';

  @override
  String get exportRestoreConfirmBody =>
      'Восстановление копии заменит всё, что сейчас записано на этом устройстве. Отменить это будет нельзя.';

  @override
  String get exportRestoreConfirmAction => 'Восстановить';

  @override
  String get exportWrongPassword =>
      'Этот пароль не подходит к этой резервной копии';

  @override
  String get exportInvalidFile => 'Этот файл не похож на резервную копию Vera';

  @override
  String get exportBackupCreated => 'Копия готова к отправке';

  @override
  String get exportRestoreSuccess => 'Копия восстановлена';

  @override
  String get exportDoctorReportHeading => 'Отчёт для врача';

  @override
  String get exportDoctorReportBody =>
      'Сводка, которой можно поделиться с врачом.';

  @override
  String get exportIncludeNotesToggle => 'Включить личные заметки';

  @override
  String get exportShareCsvButton => 'Поделиться в CSV';

  @override
  String get exportPrintPdfButton => 'Печать / Сохранить в PDF';

  @override
  String get doctorReportDisclaimer =>
      'Сформировано в Vera из данных, введённых пользователем. Не является медицинским диагнозом.';

  @override
  String get doctorReportGeneratedOn => 'Дата формирования';

  @override
  String get doctorReportSummaryHeading => 'Сводка';

  @override
  String get doctorReportDailyLogHeading => 'Записи по дням';

  @override
  String get doctorReportColumnDate => 'Дата';

  @override
  String get doctorReportTimelineHeading => 'Хронология циклов';

  @override
  String get doctorReportCycleLabel => 'Цикл';

  @override
  String get doctorReportTimelineLegendPeriod => 'Менструация';

  @override
  String get doctorReportTimelineLegendCycle => 'Остальная часть цикла';

  @override
  String get doctorReportTimelineOngoing => 'Продолжается';

  @override
  String get dailyInsightLabel => 'А вы знали?';

  @override
  String get insightMenstrual1 =>
      'Сейчас отторгается слизистая оболочка матки — большинство менструаций длится от 3 до 7 дней, и это совершенно нормально.';

  @override
  String get insightMenstrual2 =>
      'Продукты, богатые железом, — листовая зелень, чечевица — могут помочь восполнить то, что организм теряет на этой неделе.';

  @override
  String get insightFollicular1 =>
      'Эстроген растёт, и многие примерно с этого времени замечают больше энергии и лучшую концентрацию.';

  @override
  String get insightFollicular2 =>
      'Организм готовит яйцеклетку к выходу — эта фаза может длиться от недели до нескольких недель.';

  @override
  String get insightFertile1 =>
      'Это ваше предполагаемое фертильное окно — дни вокруг овуляции, когда, по типичным срокам, вероятность беременности наиболее высока.';

  @override
  String get insightFertile2 =>
      'Некоторые замечают около овуляции небольшой подъём базальной температуры или изменения цервикальной слизи.';

  @override
  String get insightLuteal1 =>
      'После овуляции растёт прогестерон — часто именно тогда появляются симптомы ПМС, например перепады настроения или вздутие.';

  @override
  String get insightLuteal2 =>
      'Если беременность не наступила, к концу этой фазы уровень гормонов падает, и это запускает следующую менструацию.';

  @override
  String get insightUnknown1 =>
      'Длина цикла сильно различается у разных людей — типичной считается любая между 21 и 35 днями.';

  @override
  String get insightsPhaseTipsTitle => 'Что может быть приятно в этой фазе';

  @override
  String get tipFitnessLabel => 'Движение';

  @override
  String get tipNutritionLabel => 'Питание';

  @override
  String get tipFitnessMenstrual =>
      'Мягкое движение — прогулка, растяжка или восстановительная йога — сейчас может ощущаться лучше, чем интенсивная тренировка.';

  @override
  String get tipFitnessFollicular =>
      'В этой фазе энергия часто растёт — удачное время попробовать новую тренировку или прибавить нагрузку.';

  @override
  String get tipFitnessFertile =>
      'Многие чувствуют себя наиболее энергично именно здесь — подходящая фаза для более интенсивных тренировок, если вам это по душе.';

  @override
  String get tipFitnessLuteal =>
      'Если ближе к концу этой фазы энергия падает, силовая работа полегче или плавание могут ощущаться более посильными.';

  @override
  String get tipFitnessUnknown =>
      'Любое движение, которое сегодня ощущается хорошо, — хороший выбор: единственно «правильного» режима на каждый день не существует.';

  @override
  String get tipNutritionMenstrual =>
      'Продукты, богатые железом, — листовая зелень, чечевица, красное мясо — могут помочь восполнить то, что организм теряет на этой неделе.';

  @override
  String get tipNutritionFollicular =>
      'Когда энергия растёт, лёгкая и свежая еда часто заходит хорошо — но единственно «правильного» способа питаться в этой фазе нет.';

  @override
  String get tipNutritionFertile =>
      'Достаточно воды и сбалансированная еда поддерживают энергию в этой более активной по ощущениям фазе.';

  @override
  String get tipNutritionLuteal =>
      'Вкусы здесь могут меняться — часто выбирают сложные углеводы и продукты, богатые магнием, например орехи и тёмный шоколад.';

  @override
  String get tipNutritionUnknown =>
      'Сбалансированные, регулярные приёмы пищи — надёжный вариант по умолчанию, пока фаза ещё не ясна.';

  @override
  String get predictionSettingsEntry => 'Настройки прогноза';

  @override
  String get predictionSettingsIntro =>
      'Это допущения, и мы показываем их открыто. Когда вы запишете 2 полных цикла, настоящий прогноз на главном экране будет считаться по вашим собственным данным — эти числа для него больше не используются.';

  @override
  String get predictionSettingsPeriodLengthLabel =>
      'Типичная длительность менструации';

  @override
  String get predictionSettingsCycleLengthLabel => 'Типичная длина цикла';

  @override
  String get predictionSettingsCycleLengthHint =>
      'Используется, чтобы масштабировать кольцо на главном экране, пока нет реальных данных.';

  @override
  String get predictionSettingsLutealLabel => 'Длина лютеиновой фазы';

  @override
  String get predictionSettingsLutealHint =>
      'Типичное число дней между овуляцией и следующей менструацией. Используется, чтобы разместить предполагаемое фертильное окно — это значение продолжает использоваться и после того, как начнутся настоящие прогнозы.';

  @override
  String get dayLogEnergyLabel => 'Энергия';

  @override
  String get energyLevelLow => 'Низкая';

  @override
  String get energyLevelMedium => 'Средняя';

  @override
  String get energyLevelHigh => 'Высокая';

  @override
  String get energyLevelEnergetic => 'Прилив энергии';

  @override
  String get dayLogSkinHairLabel => 'Кожа и волосы';

  @override
  String get skinHealthyGlow => 'Здоровое сияние';

  @override
  String get skinRedness => 'Покраснение';

  @override
  String get skinDryness => 'Сухость';

  @override
  String get skinOiliness => 'Жирность';

  @override
  String get hairGoodDay => 'Волосы лежат хорошо';

  @override
  String get hairBadDay => 'Волосы не слушаются';

  @override
  String get hairLoss => 'Выпадение волос';

  @override
  String get scalpOily => 'Жирная кожа головы';

  @override
  String get dayLogBreastExamLabel => 'Самообследование груди';

  @override
  String get breastExamAllNormal => 'Ничего необычного';

  @override
  String get breastExamLump => 'Уплотнение';

  @override
  String get breastExamIndentation => 'Втяжение';

  @override
  String get breastExamRedness => 'Покраснение';

  @override
  String get breastExamCrackedNipple => 'Трещина соска';

  @override
  String get breastExamDischarge => 'Выделения из соска';

  @override
  String get cervixPositionLabel => 'Положение шейки матки';

  @override
  String get cervixPositionLow => 'Низкое';

  @override
  String get cervixPositionMedium => 'Среднее';

  @override
  String get cervixPositionHigh => 'Высокое';

  @override
  String get cervixOpeningLabel => 'Раскрытие шейки матки';

  @override
  String get cervixOpeningClosed => 'Закрыта';

  @override
  String get cervixOpeningMedium => 'Приоткрыта';

  @override
  String get cervixOpeningOpen => 'Открыта';

  @override
  String get cervixFirmnessLabel => 'Плотность шейки матки';

  @override
  String get cervixFirmnessSoft => 'Мягкая';

  @override
  String get cervixFirmnessMedium => 'Средняя';

  @override
  String get cervixFirmnessFirm => 'Плотная';

  @override
  String get dayLogWaterLabel => 'Вода';

  @override
  String get dayLogSleepLabel => 'Сон';

  @override
  String get dayLogWeightLabel => 'Вес';

  @override
  String get dayLogMedicationsLabel => 'Лекарства';

  @override
  String get dayLogAddMedication => 'Добавить лекарство';

  @override
  String get dayLogMedicationNameHint => 'Название лекарства';

  @override
  String get dayLogBirthControlLabel => 'Контрацепция';

  @override
  String get dayLogOtherMedicationsLabel => 'Другие лекарства';

  @override
  String get birthControlPillTaken => 'Таблетка принята';

  @override
  String get birthControlPillLate => 'Таблетка принята поздно';

  @override
  String get birthControlPillMissed => 'Таблетка пропущена';

  @override
  String get birthControlPatch => 'Пластырь';

  @override
  String get birthControlRing => 'Кольцо';

  @override
  String get birthControlInjection => 'Инъекция';

  @override
  String get birthControlImplant => 'Имплант';

  @override
  String get birthControlIud => 'Спираль';

  @override
  String get navAssistant => 'Ассистент';

  @override
  String get assistantTitle => 'Ассистент Vera';

  @override
  String get assistantEndChatTitle => 'Завершить этот чат?';

  @override
  String get assistantEndChatBody =>
      'Сообщения хранятся только в памяти и нигде не сохраняются, поэтому вернуть их не получится.';

  @override
  String get assistantEndChatConfirm => 'Завершить чат';

  @override
  String get assistantInputHint => 'Спросите о вашем цикле…';

  @override
  String get assistantIntro =>
      'Привет! Я могу отвечать на вопросы о менструации, цикле и работе Vera — прямо на вашем телефоне, ничего не покидает устройство. Я не врач, и это не медицинская консультация.';

  @override
  String get insightMenstrual3 =>
      'Менструальная кровь — не «грязная кровь»: это смесь крови и слизистой оболочки матки, совершенно обычная часть цикла.';

  @override
  String get insightMenstrual4 =>
      'Мягкое тепло на низ живота действительно облегчает спазмы — тёплая грелка это классика с подтверждённой пользой.';

  @override
  String get insightMenstrual5 =>
      'Выделения часто наиболее обильны в первые два дня и затем убывают — такая картина типична.';

  @override
  String get insightMenstrual6 =>
      'Небольшая усталость во время менструации — обычное дело: вместе с менструальной кровью организм теряет железо.';

  @override
  String get insightFollicular3 =>
      'После менструации эстроген заново наращивает слизистую оболочку матки — организм готовится заново.';

  @override
  String get insightFollicular4 =>
      'Кожа часто выглядит наиболее чистой именно в этой фазе, когда уровень гормонов выравнивается.';

  @override
  String get insightFollicular5 =>
      'У многих выносливость и скорость реакции достигают пика в конце фолликулярной фазы.';

  @override
  String get insightFollicular6 =>
      'Именно длина этой фазы различается у людей сильнее всего — лютеиновая фаза гораздо постояннее.';

  @override
  String get insightFertile3 =>
      'Яйцеклетка живёт около 12–24 часов, а сперматозоиды могут ждать до 5 дней — поэтому фертильное окно занимает несколько дней.';

  @override
  String get insightFertile4 =>
      'Около овуляции цервикальная слизь часто становится прозрачной и тягучей — как сырой яичный белок.';

  @override
  String get insightFertile5 =>
      'Некоторые чувствуют при овуляции короткое покалывание с одной стороны — у него даже есть название: миттельшмерц.';

  @override
  String get insightFertile6 =>
      'Базальная температура немного повышается *после* овуляции — она подтверждает, что овуляция произошла, а не предсказывает её.';

  @override
  String get insightLuteal3 =>
      'Прогестерон достигает пика примерно через неделю после овуляции — вздутие и болезненность груди в это время обычны.';

  @override
  String get insightLuteal4 =>
      'Тяга к углеводам перед менструацией реальна — в лютеиновой фазе потребность в энергии немного возрастает.';

  @override
  String get insightLuteal5 =>
      'Симптомы ПМС обычно стихают в течение дня-двух после начала кровотечения.';

  @override
  String get insightLuteal6 =>
      'Стабильный режим сна может заметно смягчить спады настроения в конце лютеиновой фазы.';

  @override
  String get insightUnknown2 =>
      'Часто достаточно записать всего три цикла, чтобы увидеть собственную закономерность.';

  @override
  String get insightUnknown3 =>
      'Циклы индивидуальны — сравнение своего цикла с чужим редко говорит что-то полезное.';

  @override
  String get insightUnknown4 =>
      'Стресс, поездки и болезнь могут сдвинуть овуляцию — «задержка» часто означает просто позднюю овуляцию.';

  @override
  String get settingsThemeLabel => 'Тема';

  @override
  String get settingsThemeSystem => 'Системная';

  @override
  String get settingsThemeLight => 'Светлая';

  @override
  String get settingsThemeDark => 'Тёмная';

  @override
  String get settingsMascotLabel => 'Маскот-спутник';

  @override
  String get mascotDroplet => 'Капля';

  @override
  String get mascotFlower => 'Цветок';

  @override
  String get mascotMoon => 'Луна';

  @override
  String get mascotNone => 'Нет';

  @override
  String homeWindowCountdown(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: 'Прогнозируемое окно начнётся примерно через $days дня',
      many: 'Прогнозируемое окно начнётся примерно через $days дней',
      few: 'Прогнозируемое окно начнётся примерно через $days дня',
      one: 'Прогнозируемое окно начнётся примерно через $days день',
    );
    return '$_temp0';
  }

  @override
  String homeOvulationCountdown(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: 'Предполагаемая овуляция примерно через $days дня',
      many: 'Предполагаемая овуляция примерно через $days дней',
      few: 'Предполагаемая овуляция примерно через $days дня',
      one: 'Предполагаемая овуляция примерно через $days день',
    );
    return '$_temp0';
  }

  @override
  String get homeQuickLogTitle => 'Как сегодня ощущается ваше тело?';

  @override
  String get actionSave => 'Сохранить';

  @override
  String get insightsTrackerHubTitle => 'Ваши показатели';

  @override
  String get trackerHistoryEmpty => 'В этом диапазоне пока нет записей';

  @override
  String get trackerStatAverage => 'Среднее';

  @override
  String get trackerStatLowest => 'Минимум';

  @override
  String get trackerStatHighest => 'Максимум';

  @override
  String get trackerStatLatest => 'Последнее';

  @override
  String get rangeFilter1m => '1 мес.';

  @override
  String get rangeFilter3m => '3 мес.';

  @override
  String get rangeFilter6m => '6 мес.';

  @override
  String get dayLogOvulationTestLabel => 'Тест на овуляцию';

  @override
  String get ovulationTestNegative => 'Отрицательный';

  @override
  String get ovulationTestPositive => 'Положительный';

  @override
  String get ovulationTestLow => 'Низкий';

  @override
  String get ovulationTestHigh => 'Высокий';

  @override
  String get ovulationTestPeak => 'Пик';

  @override
  String get pregnancyTestLabel => 'Тест на беременность';

  @override
  String get pregnancyTestPositive => 'Положительный';

  @override
  String get pregnancyTestFaint => 'Слабая полоска';

  @override
  String get pregnancyTestNegative => 'Отрицательный';

  @override
  String get settingsOvulationTestToggle => 'Тест на овуляцию';

  @override
  String get settingsRemindersOvulationLabel =>
      'Предупреждать о фертильном окне';

  @override
  String get reminderOvulationTitle =>
      'Приближается предполагаемое фертильное окно';

  @override
  String get reminderOvulationBody =>
      'По вашим записанным циклам предполагаемое фертильное окно может начаться скоро.';

  @override
  String trackerEntriesCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count записи',
      many: '$count записей',
      few: '$count записи',
      one: '$count запись',
    );
    return '$_temp0';
  }

  @override
  String get trackerLowSampleNote =>
      'При таком малом числе записей проценты пока ненадёжны — они станут точнее по мере накопления данных.';

  @override
  String get assistantTyping => 'Vera печатает…';

  @override
  String get premiumTitle => 'Vera Premium';

  @override
  String get premiumHeadline => 'Vera Premium';

  @override
  String get premiumSubhead =>
      'Все функции отслеживания навсегда остаются бесплатными — ваша история никогда не запирается. Premium добавляет ваши собственные показатели, более глубокую статистику, ваши напоминания и дополнительное оформление, а также убирает рекламу.';

  @override
  String get premiumBenefitNoAds => 'Никакой рекламы нигде в приложении';

  @override
  String get premiumBenefitSupport =>
      'Поддержка независимого приложения, где приватность на первом месте';

  @override
  String get premiumMonthly => 'Ежемесячно';

  @override
  String get premiumYearly => 'Ежегодно';

  @override
  String get premiumYearlyNote => 'Оплата раз в год';

  @override
  String premiumPerMonth(String price) {
    return '$price / месяц';
  }

  @override
  String get premiumBilledMonthly => 'Списание каждый месяц';

  @override
  String get premiumStaysFreeTitle => 'Что остаётся бесплатным';

  @override
  String get premiumStaysFreeBody =>
      'Календарь, вся твоя история, базовая статистика и экспорт бесплатны навсегда. Premium что-то добавляет и никогда ничего не забирает.';

  @override
  String get premiumSubscribeCta => 'Продолжить';

  @override
  String get premiumRestore => 'Восстановить покупку';

  @override
  String get premiumCancelNote =>
      'Отменить можно в любой момент в аккаунте магазина приложений. Никаких обратных отсчётов и никакого давления — если сейчас не время, бесплатная версия продолжит работать ровно так же, как сегодня.';

  @override
  String get premiumActiveBadge => 'Premium активен';

  @override
  String get premiumDevToggle => 'Симулировать Premium (разработка)';

  @override
  String get settingsPremiumEntry => 'Vera Premium';

  @override
  String get adTestNotice => 'Тестовая реклама — пока не настоящее размещение';

  @override
  String get settingsPregnancyModeLabel => 'Режим беременности';

  @override
  String get pregnancyLmpLabel => 'Первый день последней менструации';

  @override
  String pregnancyWeekLabel(int weeks, int days) {
    return 'Неделя $weeks, день $days';
  }

  @override
  String get pregnancyDueDateLabel => 'Предполагаемая дата родов';

  @override
  String pregnancyDaysLeft(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: 'Осталось примерно $days дня',
      many: 'Осталось примерно $days дней',
      few: 'Осталось примерно $days дня',
      one: 'Остался примерно $days день',
    );
    return '$_temp0';
  }

  @override
  String pregnancyTrimesterLabel(int n) {
    return 'Триместр $n';
  }

  @override
  String get pregnancyDisclaimer =>
      'Даты рассчитаны от последней менструации по стандартному правилу 280 дней. УЗИ даёт более точную дату, а поздняя овуляция сдвигает эти числа — это информация, а не медицинское наблюдение.';

  @override
  String get pregnancySizeLabel => 'Размер малыша';

  @override
  String get pregnancySizeUnder5 => 'Маковое зёрнышко (~2 mm)';

  @override
  String get pregnancySizeUnder9 => 'Черника (~1.6 cm)';

  @override
  String get pregnancySizeUnder13 => 'Лайм (~5.4 cm)';

  @override
  String get pregnancySizeUnder20 => 'Авокадо (~11.6 cm)';

  @override
  String get pregnancySizeUnder28 => 'Манго (~30 cm)';

  @override
  String get pregnancySizeUnder34 => 'Ананас (~44 cm)';

  @override
  String get pregnancySizeUnder38 => 'Дыня (~46 cm)';

  @override
  String get pregnancySizeTerm => 'Маленький арбуз (~51 cm)';

  @override
  String get pregnancyNoteUnder5 =>
      'Большинство людей пока ничего не замечают: срок беременности отсчитывается от последней менструации, поэтому первые две недели фактически предшествуют зачатию.';

  @override
  String get pregnancyNoteUnder9 =>
      'Тошнота, чувствительность груди и усталость сейчас встречаются часто. Подходящее время, чтобы записаться на первый приём.';

  @override
  String get pregnancyNoteUnder13 =>
      'Первый триместр подходит к концу; у многих примерно в это время тошнота начинает ослабевать.';

  @override
  String get pregnancyNoteUnder20 =>
      'В этот период силы часто возвращаются. Первые шевеления можно почувствовать в любой момент между 16-й и 22-й неделями.';

  @override
  String get pregnancyNoteUnder28 =>
      'Шевеления становятся отчётливее и складываются в свой ритм. Боль в спине и изжога в этот период встречаются часто.';

  @override
  String get pregnancyNoteUnder34 =>
      'Начался третий триместр. Одышка, учащённое мочеиспускание и схватки Брэкстона-Хикса встречаются часто.';

  @override
  String get pregnancyNoteUnder38 =>
      'Малыш готовится к рождению. Подходящее время собрать сумку в роддом и продумать план родов.';

  @override
  String get pregnancyNoteTerm =>
      'Срок доношенный: роды могут начаться в любой момент между 37-й и 42-й неделями; 40 недель — это среднее значение, а не крайний срок.';

  @override
  String get pregnancyWeeklyNoteTitle => 'На этой неделе';

  @override
  String get pregnancyNeedsLmp =>
      'Добавьте первый день последней менструации, чтобы начать отслеживание.';

  @override
  String get pregnancyOutOfRange =>
      'Эта дата более 42 недель назад — обновите её или выключите режим беременности.';

  @override
  String get partnerShareTitle => 'Поделиться сводкой с партнёром';

  @override
  String get partnerShareBody =>
      'Создаёт короткую текстовую сводку — текущая фаза и предполагаемое окно, — которую вы сами отправляете через любое приложение. Живой синхронизации и аккаунта для партнёра нет: пока вы не отправите сводку, никуда ничего не уходит.';

  @override
  String get partnerShareCta => 'Создать сводку';

  @override
  String get partnerSummaryHeader => 'Сводка цикла из Vera';

  @override
  String get settingsHomeThemeLabel => 'Фон главного экрана';

  @override
  String get homeThemeWheat => 'Пшеница';

  @override
  String get homeThemeSky => 'Небо';

  @override
  String get homeThemeField => 'Поле';

  @override
  String get homeThemeBlossom => 'Цветение';

  @override
  String get homeThemePlain => 'Простой';

  @override
  String get backupNudgeTitle => 'Сохраните копию своих данных';

  @override
  String get backupNudgeBody =>
      'Всё хранится только на этом телефоне. Если он потеряется, сломается или будет сброшен, история исчезнет вместе с ним — зашифрованная копия делается за минуту, и открыть её можете только вы.';

  @override
  String get backupNudgeCta => 'Сделать копию сейчас';

  @override
  String get backupNudgeDismiss => 'Позже';

  @override
  String backupLastDone(String date) {
    return 'Последняя копия: $date';
  }

  @override
  String get backupNever => 'Копий пока нет';

  @override
  String get settingsRemindersBackupLabel => 'Напоминать о резервной копии';

  @override
  String get reminderBackupTitle => 'Пора сделать резервную копию Vera';

  @override
  String get reminderBackupBody =>
      'Ваша история существует только на этом телефоне. Быстрая зашифрованная копия сохранит её.';

  @override
  String get notificationChannelPeriodStart => 'Приближение менструации';

  @override
  String get notificationChannelPeriodEnd => 'Окончание менструации';

  @override
  String get notificationChannelMedication => 'Лекарства';

  @override
  String get notificationChannelWater => 'Вода';

  @override
  String get notificationChannelAppointment => 'Приёмы';

  @override
  String get notificationChannelOvulation => 'Фертильное окно';

  @override
  String get notificationChannelBackup => 'Напоминание о резервной копии';

  @override
  String get calendarDayDetailTitle => 'Этот день';

  @override
  String get calendarDayNothingLogged => 'За этот день пока ничего не записано';

  @override
  String get calendarDayOpenLog => 'Открыть запись дня';

  @override
  String get cycleHistoryTitle => 'Прошлые циклы';

  @override
  String get cycleTrendsTitle => 'Динамика цикла';

  @override
  String get cycleHistoryEmpty =>
      'Отметьте пару менструаций, и здесь появится история циклов.';

  @override
  String get cycleHistoryOngoing => 'Продолжается';

  @override
  String cycleHistoryLength(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: 'Цикл $days дня',
      many: 'Цикл $days дней',
      few: 'Цикл $days дня',
      one: 'Цикл $days день',
    );
    return '$_temp0';
  }

  @override
  String cycleHistoryPeriodLength(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: 'Менструация длилась $days дня',
      many: 'Менструация длилась $days дней',
      few: 'Менструация длилась $days дня',
      one: 'Менструация длилась $days день',
    );
    return '$_temp0';
  }

  @override
  String cycleHistoryVsAverage(String diff) {
    return '$diff к вашему среднему';
  }

  @override
  String get insightsCycleHistoryEntry => 'Прошлые циклы';

  @override
  String get homeEmptyTitle => 'Начнём с вашей последней менструации';

  @override
  String get homeEmptyBody =>
      'Нажмите кнопку выше в тот день, когда начнётся менструация. После двух полных циклов Vera сможет строить прогноз — до тех пор она не будет делать вид, что знает.';

  @override
  String get homeEmptyBackdate => 'Она началась раньше';

  @override
  String get settingsAdPrivacyEntry => 'Настройки приватности рекламы';

  @override
  String a11yCycleRing(int day, int length) {
    return 'День цикла $day из примерно $length';
  }

  @override
  String a11yChartSummary(int count, String min, String max) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'График: $count записи, от $min до $max',
      many: 'График: $count записей, от $min до $max',
      few: 'График: $count записи, от $min до $max',
      one: 'График: $count запись, от $min до $max',
    );
    return '$_temp0';
  }

  @override
  String a11yPhaseBar(int day, int length) {
    return 'Ход цикла: день $day из примерно $length';
  }

  @override
  String a11yFrequencyItem(String label, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count раза',
      many: '$count раз',
      few: '$count раза',
      one: '$count раз',
    );
    return '$label: $_temp0';
  }

  @override
  String get importTitle => 'Импорт из другого приложения';

  @override
  String get importBody =>
      'Экспортируйте историю из прежнего трекера в CSV, затем выберите файл здесь. Импортируются только даты и характер выделений — формулировки симптомов и настроения в приложениях различаются, и Vera не станет угадывать, что имелось в виду.';

  @override
  String get importPickFile => 'Выбрать файл CSV';

  @override
  String importPreview(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Найдено $count дня истории',
      many: 'Найдено $count дней истории',
      few: 'Найдено $count дня истории',
      one: 'Найден $count день истории',
    );
    return '$_temp0';
  }

  @override
  String importSkipped(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Не удалось прочитать $count строки — они будут пропущены',
      many: 'Не удалось прочитать $count строк — они будут пропущены',
      few: 'Не удалось прочитать $count строки — они будут пропущены',
      one: 'Не удалось прочитать $count строку — она будет пропущена',
    );
    return '$_temp0';
  }

  @override
  String get importConfirm => 'Добавить в мою историю';

  @override
  String get importMergeNote =>
      'Импортированные дни объединяются с вашими. Дни, уже записанные в Vera, остаются как есть.';

  @override
  String importDone(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Импортировано $count дня',
      many: 'Импортировано $count дней',
      few: 'Импортировано $count дня',
      one: 'Импортирован $count день',
    );
    return '$_temp0';
  }

  @override
  String get importErrorEmpty => 'Похоже, этот файл пуст.';

  @override
  String get importErrorNoDate => 'В этом файле не найден столбец с датой.';

  @override
  String get settingsImportEntry => 'Импорт из другого приложения';

  @override
  String get settingsHealthSyncLabel =>
      'Синхронизация с Apple Health / Health Connect';

  @override
  String get settingsHealthSyncBody =>
      'Записывает в приложение здоровья только менструальные выделения, вес и базальную температуру. Симптомы, настроение и заметки остаются в Vera. Ничего не считывается обратно.';

  @override
  String healthSyncBackfilled(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'В приложение здоровья отправлено $count дня',
      many: 'В приложение здоровья отправлено $count дней',
      few: 'В приложение здоровья отправлено $count дня',
      one: 'В приложение здоровья отправлен $count день',
    );
    return '$_temp0';
  }

  @override
  String get healthSyncDenied =>
      'Разрешение не выдано, поэтому синхронизация остаётся выключенной.';

  @override
  String get settingsDiagnosticsEntry => 'Диагностика';

  @override
  String get diagnosticsBody =>
      'Если приложение работает неправильно, технические подробности записываются здесь — только на этом устройстве. Никуда ничего не отправляется, пока вы сами не решите отправить, и вы можете сначала прочитать ровно то, что отправляете.';

  @override
  String get diagnosticsEmpty => 'Записей нет — проблем не обнаружено.';

  @override
  String get diagnosticsShare => 'Отправить разработчику';

  @override
  String get diagnosticsClear => 'Очистить';

  @override
  String get diagnosticsNoteLabel => 'Что произошло? (необязательно)';

  @override
  String get diagnosticsTechnicalDetail => 'Технические подробности';

  @override
  String get unitHoursShort => 'ч';

  @override
  String get unitMinutesShort => 'мин';

  @override
  String get unitHoursLong => 'ч.';

  @override
  String get unitMinutesLong => 'минут';

  @override
  String get unitMilliliters => 'мл';

  @override
  String get unitKilograms => 'кг';

  @override
  String get calendarJumpTitle => 'Перейти к месяцу';

  @override
  String get calendarJumpYearLabel => 'Год';

  @override
  String get settingsAdPrivacyUnavailable =>
      'В вашем регионе выбор персонализации рекламы не предлагается — реклама здесь и так неперсонализированная.';

  @override
  String get settingsGroupAppearance => 'Оформление';

  @override
  String get settingsGroupTracking => 'Параметры отслеживания';

  @override
  String get dayLogCustomTagsLabel => 'Мои показатели';

  @override
  String get customTagAddButton => 'Добавить показатель';

  @override
  String get customTagDialogTitle => 'Новый показатель';

  @override
  String get customTagDialogHint => 'например: мигрень, спортзал, бессонница';

  @override
  String get customTagManageEntry => 'Управление моими показателями';

  @override
  String get customTagRenameTitle => 'Переименовать показатель';

  @override
  String get customTagDeleteTitle => 'Удалить этот показатель?';

  @override
  String get customTagDeleteBody =>
      'Он будет убран из всех дней, где вы его отмечали. Остальные записи останутся как есть.';

  @override
  String get customTagEmpty => 'Своих показателей пока нет.';

  @override
  String get premiumLockedTitle => 'Функция Premium';

  @override
  String get premiumLockedAction => 'Посмотреть Premium';

  @override
  String get premiumBenefitCustomTrackers =>
      'Отслеживайте что угодно, своими словами';

  @override
  String get premiumBenefitAdvancedInsights =>
      'Расширенная статистика: что обычно происходит и когда';

  @override
  String get premiumBenefitPersonalisation => 'Дополнительные фоны и спутники';

  @override
  String get premiumBenefitAdvancedReminders =>
      'Напоминания по вашему собственному расписанию';

  @override
  String get advancedInsightsTitle => 'Расширенная статистика';

  @override
  String get advancedInsightsEntry => 'Расширенная статистика';

  @override
  String get advancedInsightsNotEnough =>
      'Запишите три полных цикла, и здесь появятся ваши закономерности. При меньшем количестве любая «закономерность» была бы просто совпадением.';

  @override
  String get advancedInsightsPatternsTitle => 'Когда что обычно появляется';

  @override
  String advancedInsightsPatternLine(String label, String segment) {
    return '$label — чаще всего $segment';
  }

  @override
  String advancedInsightsPatternDetail(int count, int day) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Записано $count дня, примерно на $day-й день цикла',
      many: 'Записано $count дней, примерно на $day-й день цикла',
      few: 'Записано $count дня, примерно на $day-й день цикла',
      one: 'Записан $count день, примерно на $day-й день цикла',
    );
    return '$_temp0';
  }

  @override
  String advancedInsightsNoPattern(String label) {
    return '$label — чёткого времени пока не видно';
  }

  @override
  String get advancedInsightsTrendTitle => 'Длина цикла со временем';

  @override
  String advancedInsightsDriftLonger(String days, String cycles) {
    return 'Сравниваем ваши самые ранние и самые недавние циклы, по $cycles в каждой группе: недавние примерно на $days дн. длиннее.';
  }

  @override
  String advancedInsightsDriftShorter(String days, String cycles) {
    return 'Сравниваем ваши самые ранние и самые недавние циклы, по $cycles в каждой группе: недавние примерно на $days дн. короче.';
  }

  @override
  String advancedInsightsDriftStable(String cycles) {
    return 'Сравниваем ваши самые ранние и самые недавние циклы, по $cycles в каждой группе: длина цикла осталась примерно такой же.';
  }

  @override
  String get advancedInsightsDriftNotEnough =>
      'Когда наберётся шесть полных циклов, Vera сможет сравнить самые ранние из них с самыми недавними и посмотреть, меняется ли длина вашего цикла.';

  @override
  String get advancedInsightsMoodTitle => 'Настроение по частям цикла';

  @override
  String get advancedInsightsDisclaimer =>
      'Это лишь подсчёт того, что вы записали, не более. Это не диагноз, и закономерность здесь не является причиной.';

  @override
  String get segmentPeriod => 'во время менструации';

  @override
  String get segmentAfterPeriod => 'после менструации';

  @override
  String get segmentMidCycle => 'в середине цикла';

  @override
  String get segmentBeforePeriod => 'перед менструацией';

  @override
  String get customRemindersEntry => 'Мои напоминания';

  @override
  String get customRemindersTitle => 'Мои напоминания';

  @override
  String get customRemindersEmpty => 'Своих напоминаний пока нет.';

  @override
  String get customRemindersAdd => 'Добавить напоминание';

  @override
  String get customReminderLabelHint =>
      'например: выпить таблетку, попить воды';

  @override
  String get customReminderLockScreenNote =>
      'Текст напоминания появляется на экране блокировки — пишите его настолько личным, насколько вам самим комфортно.';

  @override
  String get customReminderDelete => 'Удалить напоминание';

  @override
  String get homeThemeDusk => 'Сумерки';

  @override
  String get homeThemeMeadow => 'Луг';

  @override
  String get homeThemePetal => 'Лепесток';

  @override
  String get homeThemeBloom => 'Расцвет';

  @override
  String get homeThemeOcean => 'Океан';

  @override
  String get homeThemeAutumn => 'Осень';

  @override
  String get homeThemeNight => 'Ночь';

  @override
  String get mascotStar => 'Звезда';

  @override
  String get mascotLeaf => 'Лист';

  @override
  String get mascotCat => 'Кот';

  @override
  String get mascotRabbit => 'Кролик';

  @override
  String get mascotBird => 'Птица';

  @override
  String get tipDetailWhatsHappening => 'Что происходит в вашем теле';

  @override
  String get tipDetailGeneralHeading => 'Общие рекомендации';

  @override
  String get tipDetailDisclaimer =>
      'Это общая информация, а не персональный медицинский совет. Каждый организм реагирует по-своему, и то, как вы себя чувствуете на самом деле, важнее любых предложений отсюда. Если что-то вас беспокоит, обратитесь к врачу.';

  @override
  String get phaseExplainerMenstrual =>
      'Идёт кровотечение, потому что отслаивается слизистая матки. Эстроген и прогестерон на самом низком уровне цикла, и поэтому в первые дни многие чувствуют себя более уставшими и обращёнными внутрь. Кровотечение обычно длится от трёх до семи дней и сильнее всего в начале. Спазмы возникают из-за сокращений матки, которые запускают простагландины — гормоноподобные вещества, выделяющиеся при разрушении слизистой; поэтому у части людей одновременно болит поясница или расстраивается стул. Кровотечение к тому же расходует железо, и это объясняет часть утомляемости. Тепло, движение и сон обычно помогают. Но если защита промокает каждый час, если кровотечение заметно выходит за неделю или боль мешает обычным делам, об этом стоит поговорить со специалистом, а не пережидать.';

  @override
  String get phaseExplainerFollicular =>
      'После окончания кровотечения эстроген снова начинает расти. В яичниках созревает группа фолликулов, в каждом по яйцеклетке, и обычно выходит только одна. Эстроген заново отстраивает только что отторгнутую слизистую, и большинство замечает, что вместе с ним возвращаются энергия, настроение, состояние кожи и выносливость. Это ещё и та часть цикла, которая сильнее всего различается у разных людей и от месяца к месяцу: стресс, болезнь, поездки и сон проявляются чаще всего именно здесь, удлиняя её или укорачивая. Это честная причина, по которой прогноз — это интервал, а не дата: вторая половина цикла держится довольно ровно, а двигается именно эта.';

  @override
  String get phaseExplainerFertile =>
      'Эстроген близок к пику, и овуляция ожидается примерно в эти дни. Выброс лютеинизирующего гормона запускает выход яйцеклетки примерно через сутки — полтора. Сама яйцеклетка живёт около 12–24 часов, но сперматозоиды могут сохраняться несколько дней в фертильной шеечной слизи — поэтому окно считают в нескольких днях, а не в одном. Слизь обычно становится прозрачной, тягучей и скользкой, немного похожей на сырой яичный белок; кто-то замечает усиление влечения, чувствительность груди или короткое покалывание с одной стороны. Энергия часто на самой высокой точке цикла. Помни: это окно — оценка по твоей собственной истории, а не измерение, и это не метод контрацепции.';

  @override
  String get phaseExplainerLuteal =>
      'После овуляции опустевший фолликул становится жёлтым телом и начинает вырабатывать прогестерон, который удерживает слизистую стабильной на случай, если закрепится беременность. Если этого не происходит, прогестерон и эстроген резко падают и начинается менструация. Эта половина цикла более постоянная, обычно около 12–14 дней. Прогестерон немного повышает температуру покоя — именно это изменение улавливает базальный термометр — и может замедлять пищеварение, чем объясняется часть вздутия. Падение в конце и запускает у многих ПМС: чувствительность груди, изменения аппетита, прерывистый сон, головные боли и перепады настроения, которые обычно стихают с началом кровотечения. Если эти проявления в большинстве месяцев мешают работе или отношениям, об этом стоит поговорить со специалистом.';

  @override
  String get phaseExplainerUnknown =>
      'Записей пока недостаточно, чтобы сказать, в какой ты фазе. Vera нужны минимум два полных цикла — одно начало менструации и затем следующее, — чтобы вычислить твоё собственное среднее и разброс, и она лучше скажет об этом, чем выдумает фазу. Ничего при этом не пропадает: каждый записанный день входит в тот первый расчёт, а оценка сужается по мере того, как история растёт. А до тех пор советы ниже — общие и подходят в любой точке цикла.';

  @override
  String get tipFitnessDetailMenstrual =>
      'Тяжёлые тренировки в первые дни подходят немногим, и дело не в дисциплине — энергии действительно меньше, а железо, уходящее с кровотечением, делает работу на выносливость тяжелее, чем та же тренировка ощущалась неделю назад. Ходьба, мягкая растяжка, восстановительная йога и дыхательные практики улучшают кровоток и могут смягчить спазмы; у части людей регулярное движение на протяжении всего месяца снижает силу спазмов сильнее, чем что-либо сделанное в сам день. Если самочувствие хорошее, избегать тяжёлых тренировок незачем: кровотечение — не причина бросать спорт, и многие спортсменки выступают прямо в эти дни. Несколько практических замечаний: длинные и требовательные тренировки в дни обильного кровотечения могут усилить усталость, тепло на низ живота перед началом делает движение комфортнее, а немного больше воды, чем обычно, помогает от головной боли этих дней. Оценивай тренировку по тому, как она ощущается, а не по тому, какой была твоя лучшая неделя.';

  @override
  String get tipFitnessDetailFollicular =>
      'По мере роста эстрогена большинство чувствует себя сильнее и выносливее; обычно это лучший отрезок цикла, чтобы начать что-то новое, добавить вес или поднять темп. Восстановление мышц здесь относительно эффективное, поэтому тяжёлые тренировки усваиваются лучше и оставляют меньше затяжной боли. Это ещё и хорошее окно для того, что требует ясной головы, а не только сильного тела: разучить новое движение, поправить технику или пройти дистанцию длиннее прежней. Две оговорки стоит держать в уме: наращивай постепенно, потому что высокая энергия не означает нулевого риска травмы, и большинство травм перегрузки начинается в хорошую неделю, а не в плохую. И береги сон — адаптация происходит в восстановлении, а не на тренировке.';

  @override
  String get tipFitnessDetailFertile =>
      'Энергия и мотивация обычно на пике, поэтому требовательные тренировки заходят хорошо — личные рекорды часто случаются именно здесь. Некоторые исследования говорят, что вокруг овуляции суставы чуть более подвижны; практический эффект обсуждается, но более долгая разминка — дешёвая предосторожность в видах спорта с резкой сменой направления, прыжками и приземлениями. Температура тела всё ещё низкая по сравнению со второй половиной цикла, так что жара здесь ограничивает меньше, чем будет ограничивать через неделю-другую. Короткое покалывание с одной стороны внизу живота во время овуляции — обычное дело и обычно проходит за несколько часов. Но если боль сильная, односторонняя и не проходит, добавляется температура или есть ощущение обморока — остановись и покажись врачу, а не дотренировывай.';

  @override
  String get tipFitnessDetailLuteal =>
      'Ближе к менструации энергия может снизиться, пульс при той же нагрузке — оказаться выше, а восстановление — затянуться. Это ожидаемое колебание, а не откат, и оно не отменяет работу последних двух недель. Прогестерон немного повышает температуру покоя и затрудняет отдачу тепла, поэтому тренировки в жару или духоту ощущаются здесь непропорционально тяжело: помогает и заниматься раньше или позже, и пить больше, чем кажется нужным. Умеренные тренировки, чуть облегчённая версия силовой работы и ходьба обычно устойчивее. При вздутии и чувствительной груди хорошо поддерживающий спортивный бюстгальтер и более долгая разминка дают реальную разницу. Если настроение упало, сделай тренировку короткой и лёгкой, а не пропускай целиком — порог, при котором она засчитывается, ниже, чем кажется.';

  @override
  String get tipFitnessDetailUnknown =>
      'Даже не зная фазу, двигаться полезно в любой момент: общая рекомендация — около 150 минут умеренной активности в неделю, распределённых на большинство дней, плюс силовая работа дважды в неделю; почти для всех такая схема даёт больше, чем редкие очень интенсивные тренировки. Регулярность весит больше, чем интенсивность, и лучшая тренировка — та, которую ты действительно повторишь на следующей неделе. Подстраивайся под самочувствие: в усталые дни засчитывается и прогулка, а короткая сделанная тренировка стоит больше, чем длинная пропущенная. Как только запишешь несколько циклов, здесь появятся советы под конкретную фазу.';

  @override
  String get tipNutritionDetailMenstrual =>
      'Кровотечение расходует железо; красное мясо, чечевица, нут, тёмно-зелёные листовые овощи и патока помогают его восполнить. Растительное железо заметно лучше усваивается вместе с витамином C — выжать лимон в чечевичное блюдо это самый практичный вариант, а салат из помидоров рядом делает то же самое. Чай и кофе во время еды снижают усвоение железа из-за танинов, поэтому достаточно оставить около часа между ними; отказываться ни от того, ни от другого не нужно. Достаточное количество воды может смягчить усталость и головную боль, сопровождающие кровотечение, а богатые магнием продукты — орехи, семена, тёмная листовая зелень — части людей помогают со спазмами. В дни, когда пищеварение идёт медленно, небольшие частые приёмы пищи переносятся легче, чем плотные. Если во время менструации часто бывает одышка, головокружение или необычная измотанность, об этом стоит сказать специалисту: низкое железо встречается часто, легко проверяется и не то, что должно диагностировать приложение.';

  @override
  String get tipNutritionDetailFollicular =>
      'Пока энергия возвращается, тело в режиме восстановления: достаточно белка, цельные злаки и овощи это поддерживают, и именно в этой фазе аппетит обычно ровнее всего и им легче управлять. Имеет смысл и дальше пополнять запасы железа после кровотечения, а не считать это задачей только менструальной недели — запасы восстанавливаются неделями, а не днями. Не пропускать приёмы пищи здесь проще, и это позволяет войти в колебания аппетита следующей фазы ровнее. Если собираешься менять то, как ты ешь, этот отрезок обычно добрее для начала, чем неделя перед менструацией, когда тяга и сниженное настроение делают любую новую привычку тяжелее, чем она есть.';

  @override
  String get tipNutritionDetailFertile =>
      'Здесь не нужна особая диета; сбалансированные приёмы пищи и достаточное количество воды делают большую часть работы. Кто-то ощущает вздутие вокруг овуляции — обычно это гормональное и преходящее, а не следствие съеденного. Аппетит у одних немного снижается, у других растёт, и то и другое обычно. Белок и клетчатка в еде удерживают энергию ровной в тот отрезок месяца, который часто оказывается самым активным. Если планируешь беременность, это разумный момент спросить специалиста про фолиевую кислоту, которую обычно советуют до зачатия, а не после, — но это разговор с ним, а не совет, который должно давать приложение.';

  @override
  String get tipNutritionDetailLuteal =>
      'Усиление аппетита и тяга к сладкому по мере роста прогестерона очень распространены; это гормональный сдвиг, а не вопрос силы воли, и тело в этой фазе действительно тратит немного больше энергии. Добавить в еду белок и клетчатку — значит удержать сахар крови ровнее и смягчить тягу куда лучше, чем пытаться её игнорировать: тяга, на которую ответили чем-то сытным, обычно заканчивается раньше, чем та, с которой борются час. Меньше соли и больше воды могут облегчить вздутие; звучит наоборот, но это не так: при хорошем питьевом режиме тело задерживает меньше. Богатые магнием продукты (миндаль, грецкие орехи, тёмная зелень, горький шоколад) у части людей уменьшают спазмы и напряжение. Сократить кофеин после полудня помогает прерывистому сну этой фазы, и за алкоголем тоже стоит следить — он дробит сон ровно в той точке цикла, где он и без того более поверхностный.';

  @override
  String get tipNutritionDetailUnknown =>
      'В какой бы фазе ты ни была, больше всего помогают одни и те же вещи: регулярная еда, достаточно белка, много овощей, достаточно воды и продукты, богатые железом. Поскольку кровотечение расходует железо, в эти дни достаточно уделить ему чуть больше внимания — отдельного питания на каждую неделю месяца не нужно. Есть примерно в одно и то же время даёт для ровной энергии больше, чем любой отдельный продукт, и ничего не нужно исключать, чтобы цикл был здоровым. Как только запишешь несколько циклов, здесь появятся советы под конкретную фазу.';

  @override
  String get tipSleepLabel => 'Сон';

  @override
  String get tipSleepMenstrual =>
      'Спазмы и дискомфорт могут прерывать сон; тёплый душ или грелка перед сном могут помочь.';

  @override
  String get tipSleepFollicular =>
      'С ростом энергии многие чувствуют себя бодрее — но реальная потребность во сне при этом почти не снижается.';

  @override
  String get tipSleepFertile =>
      'Небольшое повышение температуры тела около овуляции может немного затруднить засыпание; более прохладная комната может помочь.';

  @override
  String get tipSleepLuteal =>
      'Прогестерон немного повышает температуру покоя и может делать глубокий сон более лёгким; прохладная, тёмная комната и стабильное время отхода ко сну помогают здесь больше всего.';

  @override
  String get tipSleepUnknown =>
      'Качество сна часто меняется в течение цикла — обычно наиболее хрупкое непосредственно перед менструацией и во время неё. Стабильное время сна — самая надёжная основа независимо от фазы.';

  @override
  String get tipSleepDetailMenstrual =>
      'Во время менструации сон часто более прерывистый — спазмы, дискомфорт и у некоторых более частые походы в туалет могут будить ночью. Тёплый душ, грелка или лёгкая растяжка перед сном могут облегчить спазмы. Если принимаете обезболивающее, подбор времени так, чтобы эффект охватывал первую часть ночи, может защитить ранний сон.';

  @override
  String get tipSleepDetailFollicular =>
      'С ростом эстрогена многие чувствуют себя бодрее и энергичнее, что может восприниматься как меньшая потребность во сне. Это не совсем так — просто бодрствование даётся легче. Сохранение стабильного времени сна здесь окупается позже, когда сон становится более хрупким в других фазах.';

  @override
  String get tipSleepDetailFertile =>
      'Небольшое повышение температуры тела около овуляции может немного затруднить засыпание, поскольку тело естественно хочет остыть перед сном. Более прохладная комната, более лёгкое одеяло или тёплый душ перед сном могут это компенсировать. Те, кто замечает повышенное желание или социальную энергию в этот период, могут также сознательно позже ложиться спать.';

  @override
  String get tipSleepDetailLuteal =>
      'Прогестерон, повышающийся после овуляции, немного поднимает температуру покоя, что может делать глубокий сон более лёгким — иногда как лёгкий прилив жара, иногда просто как менее восстанавливающий сон. По мере приближения менструации может добавляться предменструальное напряжение. Прохладная, тёмная комната, меньше экранного времени перед сном и стабильное время сна помогают здесь больше всего.';

  @override
  String get tipSleepDetailUnknown =>
      'Пока недостаточно данных, чтобы определить текущую фазу, но изменение качества сна в течение цикла — распространённая закономерность: обычно более хрупкое непосредственно перед менструацией и во время неё, более стабильное в первой половине. Самая надёжная основа независимо от фазы: стабильное время сна и пробуждения, меньше экранного времени перед сном и прохладная, тёмная комната.';
}
