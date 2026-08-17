// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get appTitle => 'Vera';

  @override
  String get actionSkip => 'تخطي';

  @override
  String get actionContinue => 'متابعة';

  @override
  String get actionDone => 'تم';

  @override
  String get actionCancel => 'إلغاء';

  @override
  String get actionDelete => 'حذف';

  @override
  String get actionEnable => 'تفعيل';

  @override
  String get commonIDontKnow => 'لا أعرف';

  @override
  String get commonYes => 'نعم';

  @override
  String get commonNo => 'لا';

  @override
  String get commonNotSure => 'لست متأكدة';

  @override
  String get pinSetupTitle => 'إعداد رمز PIN';

  @override
  String get pinSetupEnterPrompt => 'اختاري رمز PIN من 6 أرقام لقفل التطبيق';

  @override
  String get pinSetupConfirmPrompt => 'أدخليه مرة أخرى للتأكيد';

  @override
  String get pinSetupMismatch => 'الرمزان غير متطابقين — لنحاول مرة أخرى';

  @override
  String get pinSetupBiometricTitle => 'فتح أسرع؟';

  @override
  String get pinSetupBiometricBody =>
      'يمكنك أيضًا استخدام بصمتك أو وجهك لفتح التطبيق — يظل رمز PIN يعمل كخيار احتياطي.';

  @override
  String get lockScreenTitle => 'مُقفَل';

  @override
  String get lockScreenEnterPin => 'أدخلي رمز PIN الخاص بك';

  @override
  String get lockScreenWrongPin => 'رمز PIN هذا غير صحيح';

  @override
  String get lockScreenUseBiometrics => 'استخدام البصمة الحيوية';

  @override
  String get lockScreenForgotPin => 'نسيت رمز PIN؟';

  @override
  String lockScreenThrottled(int seconds) {
    return 'محاولات كثيرة جدًا. حاولي مرة أخرى بعد $seconds ثانية';
  }

  @override
  String get lockScreenEraseTitle => 'حذف جميع البيانات؟';

  @override
  String get lockScreenEraseBody =>
      'سيؤدي هذا إلى حذف كل شيء على هذا الجهاز نهائيًا. لا يوجد حساب ولا نسخة احتياطية على خادم، لذا لا يمكن التراجع عن هذا.';

  @override
  String get lockScreenEraseConfirm => 'حذف كل شيء';

  @override
  String get onboardingPrivacyTitle => 'أهلًا بك';

  @override
  String get onboardingPrivacyBody =>
      'تبقى بيانات دورتك على هذا الجهاز فقط ومشفّرة. لا يوجد حساب ولا مزامنة سحابية — لا يُرفع أي شيء تسجّلينه. النسخة المجانية تعرض إعلانات تستخدم الإنترنت، لكنها لا تصل أبدًا إلى بياناتك الصحية.';

  @override
  String get onboardingLastPeriodTitle => 'متى بدأت آخر دورة شهرية لك؟';

  @override
  String get onboardingLastPeriodBody =>
      'هذا يساعدنا على البدء — يمكنك دائمًا تصحيحه لاحقًا من التقويم.';

  @override
  String get onboardingPickDate => 'اختيار تاريخ';

  @override
  String get onboardingCycleLengthTitle => 'كم تستغرق دورتك عادةً؟';

  @override
  String get onboardingCycleLengthBody =>
      'رقم تقريبي يكفي. سنبدأ بإعطائك تقديرًا حقيقيًا بمجرد أن نرى دورتين كاملتين أو أكثر.';

  @override
  String get onboardingPeriodLengthTitle =>
      'كم يومًا تستغرق دورتك الشهرية عادةً؟';

  @override
  String get onboardingPeriodLengthBody =>
      'سنستخدم هذا لملء بيانات آخر دورة لك، حتى لا تبدئي من الصفر.';

  @override
  String get onboardingDaysUnit => 'أيام';

  @override
  String get onboardingGoalTitle => 'ما الذي جاء بك إلى هنا؟';

  @override
  String get onboardingGoalBody =>
      'هذا فقط يساعدنا على عرض الأشياء المناسبة لك أولاً — يمكنك تغيير رأيك في أي وقت من الإعدادات.';

  @override
  String get goalTrackPeriod => 'تتبع دورتي الشهرية';

  @override
  String get goalTryingToConceive => 'أحاول الحمل';

  @override
  String get goalPregnancyTracking => 'تتبع الحمل';

  @override
  String get onboardingRegularityTitle => 'هل دورتك الشهرية منتظمة عادةً؟';

  @override
  String get onboardingRegularityBody =>
      'لا توجد إجابة خاطئة هنا — هذا فقط يساعدنا على التعرف على جسدك قليلاً.';

  @override
  String get onboardingCrampsTitle => 'هل تعانين عادةً من تقلصات؟';

  @override
  String get onboardingCrampsBody =>
      'سنحرص على أن يكون تسجيل شعورك في تلك الأيام أمرًا سهلاً.';

  @override
  String get onboardingNotificationTitle => 'هل ترغبين في تذكيرات لطيفة؟';

  @override
  String get onboardingNotificationBody =>
      'يمكننا تنبيهك قبل الموعد المتوقع لدورتك الشهرية.';

  @override
  String get onboardingNotificationMockTitle => 'قد تبدأ دورتك الشهرية قريبًا';

  @override
  String get onboardingNotificationMockBody => 'بناءً على دوراتك المسجّلة';

  @override
  String get onboardingNotificationAllow => 'تفعيل التذكيرات';

  @override
  String get onboardingNotificationNotNow => 'ليس الآن';

  @override
  String get onboardingBuildingPlanTitle => 'نجهّز كل شيء من أجلك';

  @override
  String get onboardingBuildingPlanStep1 => 'تأمين بياناتك على هذا الجهاز';

  @override
  String get onboardingBuildingPlanStep2 => 'حفظ تفضيلاتك';

  @override
  String get onboardingBuildingPlanStep3 => 'تجهيز تقويمك';

  @override
  String get onboardingBuildingPlanDone => 'كل شيء جاهز';

  @override
  String get navHome => 'الرئيسية';

  @override
  String get navCalendar => 'التقويم';

  @override
  String get navInsights => 'الإحصاءات';

  @override
  String get navSettings => 'الإعدادات';

  @override
  String homeCycleDayLabel(int day) {
    return 'اليوم $day';
  }

  @override
  String get homeNoCycleYet => 'لم تُسجَّل أي دورة بعد';

  @override
  String get homePhaseMenstrual => 'الحيض';

  @override
  String get homePhaseFollicular => 'الطور الجُريبي';

  @override
  String get homePhaseFertileWindow => 'نافذة الخصوبة المقدَّرة';

  @override
  String get homePhaseLuteal => 'الطور الأصفري';

  @override
  String get homePhaseUnknown => 'لا توجد بيانات كافية حديثة';

  @override
  String get homePredictionInsufficientTitle => 'لا توجد بيانات كافية بعد';

  @override
  String get homePredictionInsufficientBody =>
      'سجّلي دورتك القادمة وسنبدأ بالتقدير.';

  @override
  String homePredictionRangeLabel(String start, String end) {
    return '$start – $end';
  }

  @override
  String get homeConfidenceHigh => 'ثقة عالية';

  @override
  String get homeConfidenceMedium => 'ثقة متوسطة';

  @override
  String get homeConfidenceLow => 'ثقة منخفضة';

  @override
  String get homeIrregularNote =>
      'تفاوتت مدة دورتك مؤخرًا أكثر من المعتاد. إذا كان هذا جديدًا عليك، فقد يستحق الأمر ذكره في زيارة طبية.';

  @override
  String get homeFertileWindowDisclaimer =>
      'استنادًا إلى التوقيت المعتاد للدورة — ليست وسيلة لمنع الحمل.';

  @override
  String get homePeriodStartedButton => 'بدأت الدورة اليوم';

  @override
  String get homePeriodStartedSnackbar => 'تم التسجيل — بدأت الدورة اليوم';

  @override
  String get actionUndo => 'تراجع';

  @override
  String get comingSoon => 'قريبًا';

  @override
  String get dayLogFlowLabel => 'الغزارة';

  @override
  String get flowSpotting => 'نزول خفيف جدًا';

  @override
  String get flowLight => 'خفيف';

  @override
  String get flowMedium => 'متوسط';

  @override
  String get flowHeavy => 'غزير';

  @override
  String get flowNone => 'لا يوجد';

  @override
  String get dayLogSymptomsLabel => 'الأعراض';

  @override
  String get symptomCramps => 'تشنجات';

  @override
  String get symptomHeadache => 'صداع';

  @override
  String get symptomBloating => 'انتفاخ';

  @override
  String get symptomBreastTenderness => 'ألم في الثدي';

  @override
  String get symptomAcne => 'حب الشباب';

  @override
  String get symptomFatigue => 'إرهاق';

  @override
  String get symptomNausea => 'غثيان';

  @override
  String get symptomBackPain => 'ألم في الظهر';

  @override
  String get symptomAppetiteChange => 'تغيّر الشهية';

  @override
  String get symptomSleepTrouble => 'اضطراب النوم';

  @override
  String get symptomPelvicPain => 'ألم الحوض';

  @override
  String get symptomDizziness => 'دوخة';

  @override
  String get dayLogMoodLabel => 'المزاج';

  @override
  String get moodCalm => 'هادئة';

  @override
  String get moodAnxious => 'قلقة';

  @override
  String get moodIrritable => 'سريعة الانفعال';

  @override
  String get moodLow => 'منخفضة المعنويات';

  @override
  String get moodEnergetic => 'نشيطة';

  @override
  String get moodHappy => 'سعيدة';

  @override
  String get moodContent => 'راضية';

  @override
  String get moodSad => 'حزينة';

  @override
  String get moodDepressed => 'مكتئبة';

  @override
  String get moodEmotional => 'عاطفية';

  @override
  String get dayLogNoteLabel => 'ملاحظة';

  @override
  String get dayLogNoteHint => 'أي شيء تريدين تذكّره عن اليوم';

  @override
  String get dayLogOptionalTrackersLabel => 'متتبّعات اختيارية';

  @override
  String get dayLogSexualActivityLabel => 'النشاط الجنسي';

  @override
  String get dayLogBbtLabel => 'درجة حرارة الجسم الأساسية';

  @override
  String get dayLogMucusLabel => 'المخاط العنقي';

  @override
  String get mucusDry => 'جاف';

  @override
  String get mucusSticky => 'لزج';

  @override
  String get mucusCreamy => 'قشدي';

  @override
  String get mucusWatery => 'مائي';

  @override
  String get mucusEggWhite => 'بياض البيض';

  @override
  String get dayLogSavedIndicator => 'تم الحفظ';

  @override
  String get homeOpenTodayLog => 'إضافة تفاصيل اليوم';

  @override
  String get calendarLegendActual => 'دورة مسجَّلة';

  @override
  String get calendarLegendPredicted => 'النافذة المتوقَّعة';

  @override
  String get calendarLegendFertile => 'نافذة الخصوبة المقدَّرة';

  @override
  String get calendarLegendOvulation => 'الإباضة المقدَّرة';

  @override
  String get dayDetailFertileTitle => 'أنتِ ضمن نافذة الخصوبة المقدَّرة';

  @override
  String get dayDetailOvulationTitle => 'يوم الإباضة المقدَّر';

  @override
  String get dayDetailOvulationBody =>
      'يكون الحمل عادةً أكثر احتمالاً حول هذا اليوم، بناءً على التوقيت المعتاد — هذا تقدير وليس ضمانًا.';

  @override
  String get insightsCyclesLoggedLabel => 'الدورات المسجَّلة';

  @override
  String get insightsAveragePeriodLengthLabel => 'متوسط مدة الدورة الشهرية';

  @override
  String get insightsAverageCycleLengthLabel => 'متوسط طول الدورة';

  @override
  String insightsVariabilityLabel(String days) {
    return 'يتفاوت بمقدار $days أيام تقريبًا';
  }

  @override
  String get insightsNotEnoughDataTitle => 'لا توجد بيانات كافية بعد';

  @override
  String get insightsNotEnoughDataBody =>
      'سجّلي دورتين كاملتين أو أكثر وستظهر متوسطاتك هنا.';

  @override
  String get insightsSymptomFrequencyTitle => 'الأعراض حسب يوم الدورة';

  @override
  String get insightsNoSymptomsLogged => 'لم تُسجَّل أي أعراض بعد';

  @override
  String get settingsLanguageLabel => 'اللغة';

  @override
  String get settingsLanguageSystem => 'لغة النظام';

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
  String get settingsWeekStartLabel => 'يبدأ الأسبوع يوم';

  @override
  String get settingsWeekStartMonday => 'الاثنين';

  @override
  String get settingsWeekStartSunday => 'الأحد';

  @override
  String get settingsTemperatureUnitLabel => 'وحدة درجة الحرارة';

  @override
  String get settingsTemperatureCelsius => 'مئوية';

  @override
  String get settingsTemperatureFahrenheit => 'فهرنهايت';

  @override
  String get settingsRemindersLabel => 'ذكّريني قبل دورتي';

  @override
  String get settingsRemindersPeriodEndLabel =>
      'ذكّريني عندما يُفترض أن تنتهي دورتي';

  @override
  String get settingsRemindersMedicationLabel => 'تذكير بالدواء';

  @override
  String get settingsRemindersWaterLabel => 'تذكير بشرب الماء';

  @override
  String get settingsRemindersAppointmentLabel => 'تذكير بموعد';

  @override
  String get settingsRemindersAppointmentSet => 'تحديد التاريخ والوقت';

  @override
  String get settingsRemindersAppointmentClear => 'إزالة';

  @override
  String get settingsOptionalTrackersHeading => 'متتبّعات اختيارية';

  @override
  String get settingsOptionalTrackersBody =>
      'معطَّلة افتراضيًا. تفعيل إحداها يضيفها إلى شاشة السجل اليومي.';

  @override
  String get settingsSexualActivityToggle => 'النشاط الجنسي';

  @override
  String get settingsBbtToggle => 'درجة حرارة الجسم الأساسية';

  @override
  String get settingsMucusToggle => 'المخاط العنقي';

  @override
  String get settingsBreastExamToggle => 'الفحص الذاتي للثدي';

  @override
  String get settingsCervixToggle => 'وضعية عنق الرحم وصلابته';

  @override
  String get settingsPrivacyEntry => 'الخصوصية';

  @override
  String get settingsDeleteAllData => 'حذف جميع البيانات';

  @override
  String get privacyScreenTitle => 'الخصوصية';

  @override
  String get privacyScreenIntro => 'هذا بالضبط ما يحدث لبياناتك، بلغة واضحة.';

  @override
  String get privacyScreenStorage =>
      'كل ما تسجّلينه يُشفَّر ويُخزَّن فقط على هذا الجهاز، في ملف واحد. يعيش مفتاح التشفير في العتاد الآمن لهاتفك — Keychain على iOS، وKeystore على Android — وليس داخل الملف نفسه.';

  @override
  String get privacyScreenNoNetwork =>
      'لا يملك هذا التطبيق خادمًا خاصًا ولا نظام حسابات — لا تُرفع سجلاتك أبدًا. تتضمن النسخة المجانية إعلانات Google التي تتصل بالإنترنت، لكنها لا تتلقى أي شيء تسجّلينه.';

  @override
  String get privacyScreenNoThirdParty =>
      'لا توجد تحليلات ولا تقارير أعطال ولا حزم تتبع. المكوّن الوحيد من طرف ثالث هو حزمة إعلانات Google في النسخة المجانية — وبريميوم يزيلها تمامًا.';

  @override
  String get privacyScreenExport =>
      'الطريقة الوحيدة التي تغادر بها بياناتك هذا الجهاز هي أن تصدّريها بنفسك، وذلك التصدير يُشفَّر بكلمة مرور لا يعرفها سواك.';

  @override
  String get privacyScreenDelete =>
      'حذف بياناتك حقيقي وفوري. لا يوجد حساب ولا نسخة احتياطية لدينا — بمجرد أن تُحذف، تُحذف نهائيًا.';

  @override
  String get adPlaceholderLabel => 'مساحة إعلانية';

  @override
  String get adPlaceholderUpgradeCta =>
      'انتقلي إلى بريميوم للتجربة بدون إعلانات';

  @override
  String get reminderNotificationTitle => 'قد تبدأ دورتك قريبًا';

  @override
  String get reminderNotificationBody =>
      'بناءً على دوراتك المسجَّلة، تقترب نافذتك المقدَّرة.';

  @override
  String get reminderPeriodEndTitle => 'قد تكون دورتك على وشك الانتهاء';

  @override
  String get reminderPeriodEndBody =>
      'إذا كانت لا تزال مستمرة، فهذا طبيعي تمامًا — مجرد تذكير لطيف.';

  @override
  String get reminderMedicationTitle => 'تذكير بالدواء';

  @override
  String get reminderMedicationBody => 'حان وقت تناول دوائك.';

  @override
  String get reminderWaterTitle => 'حافظي على ترطيب جسمك';

  @override
  String get reminderWaterBody => 'تذكير بسيط بشرب الماء.';

  @override
  String get reminderAppointmentTitle => 'موعد قادم';

  @override
  String get reminderAppointmentBody => 'لديك موعد قادم.';

  @override
  String get settingsExportEntry => 'التصدير والنسخ الاحتياطي';

  @override
  String get exportBackupHeading => 'نسخة احتياطية مشفَّرة';

  @override
  String get exportBackupBody =>
      'احفظي نسخة مشفَّرة من سجلّك لنقلها إلى جهاز جديد. ستحتاجين إلى كلمة المرور مرة أخرى لاستعادتها — لا توجد طريقة أخرى لاستردادها.';

  @override
  String get exportCreateBackupButton => 'إنشاء نسخة احتياطية';

  @override
  String get exportRestoreBackupButton => 'الاستعادة من نسخة احتياطية';

  @override
  String get exportPasswordLabel => 'كلمة المرور';

  @override
  String get exportPasswordConfirmLabel => 'تأكيد كلمة المرور';

  @override
  String get exportPasswordMismatch => 'كلمتا المرور غير متطابقتين';

  @override
  String get exportPasswordTooShort => 'استخدمي 8 أحرف على الأقل';

  @override
  String get exportRestoreConfirmTitle =>
      'استبدال جميع البيانات على هذا الجهاز؟';

  @override
  String get exportRestoreConfirmBody =>
      'استعادة نسخة احتياطية تستبدل كل ما هو مسجَّل حاليًا على هذا الجهاز. لا يمكن التراجع عن هذا.';

  @override
  String get exportRestoreConfirmAction => 'استعادة';

  @override
  String get exportWrongPassword =>
      'كلمة المرور هذه لا تطابق هذه النسخة الاحتياطية';

  @override
  String get exportInvalidFile => 'هذا الملف لا يبدو نسخة احتياطية من Vera';

  @override
  String get exportBackupCreated => 'النسخة الاحتياطية جاهزة للمشاركة';

  @override
  String get exportRestoreSuccess => 'تمت استعادة النسخة الاحتياطية';

  @override
  String get exportDoctorReportHeading => 'تقرير للطبيب';

  @override
  String get exportDoctorReportBody => 'ملخّص يمكنك مشاركته مع طبيبك.';

  @override
  String get exportIncludeNotesToggle => 'تضمين الملاحظات الشخصية';

  @override
  String get exportShareCsvButton => 'مشاركة كملف CSV';

  @override
  String get exportPrintPdfButton => 'طباعة / حفظ كملف PDF';

  @override
  String get doctorReportDisclaimer =>
      'أُنشئ بواسطة Vera من بيانات أدخلتها المستخدمة. ليس تشخيصًا طبيًا.';

  @override
  String get doctorReportGeneratedOn => 'تاريخ الإنشاء';

  @override
  String get doctorReportSummaryHeading => 'الملخّص';

  @override
  String get doctorReportDailyLogHeading => 'السجل اليومي';

  @override
  String get doctorReportColumnDate => 'التاريخ';

  @override
  String get doctorReportTimelineHeading => 'الجدول الزمني للدورات';

  @override
  String get doctorReportCycleLabel => 'الدورة';

  @override
  String get doctorReportTimelineLegendPeriod => 'الدورة الشهرية';

  @override
  String get doctorReportTimelineLegendCycle => 'باقي الدورة';

  @override
  String get doctorReportTimelineOngoing => 'مستمرة';

  @override
  String get dailyInsightLabel => 'هل تعلمين؟';

  @override
  String get insightMenstrual1 =>
      'بطانة رحمك تتساقط الآن — تستمر معظم الدورات من 3 إلى 7 أيام، وهذا طبيعي تمامًا.';

  @override
  String get insightMenstrual2 =>
      'الأطعمة الغنية بالحديد مثل الخضروات الورقية والعدس يمكن أن تساعد في تعويض ما يفقده جسمك هذا الأسبوع.';

  @override
  String get insightFollicular1 =>
      'يرتفع هرمون الإستروجين، ويلاحظ كثيرون طاقة أكبر وتركيزًا أفضل ابتداءً من الآن.';

  @override
  String get insightFollicular2 =>
      'يُحضِّر جسمك بويضة لإطلاقها — يمكن أن يستمر هذا الطور من أسبوع إلى عدة أسابيع.';

  @override
  String get insightFertile1 =>
      'هذه نافذة خصوبتك المقدَّرة — الأيام المحيطة بالإباضة حيث يكون احتمال الحمل الأعلى، بناءً على التوقيت المعتاد.';

  @override
  String get insightFertile2 =>
      'يلاحظ بعض الأشخاص ارتفاعًا طفيفًا في درجة حرارة الجسم الأساسية أو تغيّرات في المخاط العنقي حول وقت الإباضة.';

  @override
  String get insightLuteal1 =>
      'يرتفع هرمون البروجستيرون بعد الإباضة — وغالبًا ما تظهر عندها أعراض ما قبل الدورة مثل تقلّبات المزاج أو الانتفاخ.';

  @override
  String get insightLuteal2 =>
      'إذا لم ينغرس حمل، تنخفض مستويات الهرمونات قرب نهاية هذا الطور، مما يُحفّز دورتك القادمة.';

  @override
  String get insightUnknown1 =>
      'تتفاوت مدة الدورة كثيرًا من شخص لآخر — يُعتبر ما بين 21 و35 يومًا أمرًا معتادًا.';

  @override
  String get insightsPhaseTipsTitle => 'قد يكون مفيدًا في هذه المرحلة';

  @override
  String get tipFitnessLabel => 'الحركة';

  @override
  String get tipNutritionLabel => 'التغذية';

  @override
  String get tipFitnessMenstrual =>
      'الحركة الخفيفة — كالمشي أو التمدد أو اليوغا التصالحية — قد تكون أفضل من التمارين الشاقة الآن.';

  @override
  String get tipFitnessFollicular =>
      'غالبًا ما ترتفع الطاقة في هذه المرحلة — وقت جيد لتجربة تمرين جديد أو بذل مجهود أكبر قليلًا.';

  @override
  String get tipFitnessFertile =>
      'يشعر كثيرون بأقصى نشاطهم هنا — مرحلة جيدة لتمارين أعلى كثافة إذا كان ذلك يناسبك.';

  @override
  String get tipFitnessLuteal =>
      'إذا انخفضت طاقتك قرب نهاية هذه المرحلة، فقد يكون تمرين القوة منخفض الكثافة أو السباحة أكثر استدامة.';

  @override
  String get tipFitnessUnknown =>
      'أي حركة تشعرك بالرضا اليوم هي خيار جيد — لا يوجد روتين \"صحيح\" واحد لكل يوم.';

  @override
  String get tipNutritionMenstrual =>
      'الأطعمة الغنية بالحديد كالخضروات الورقية والعدس واللحوم الحمراء يمكن أن تساعد في تعويض ما يفقده جسمك هذا الأسبوع.';

  @override
  String get tipNutritionFollicular =>
      'الوجبات الأخف والطازجة غالبًا ما تناسبك مع ارتفاع الطاقة — لكن لا توجد طريقة \"صحيحة\" واحدة للأكل في هذه المرحلة.';

  @override
  String get tipNutritionFertile =>
      'الحفاظ على الترطيب وتناول وجبات متوازنة يدعم طاقتك خلال هذه المرحلة الأكثر نشاطًا.';

  @override
  String get tipNutritionLuteal =>
      'قد تتغير الرغبات الشديدة هنا — الكربوهيدرات المعقدة والأطعمة الغنية بالمغنيسيوم كالمكسرات والشوكولاتة الداكنة خيارات شائعة.';

  @override
  String get tipNutritionUnknown =>
      'الوجبات المتوازنة والمنتظمة خيار افتراضي جيد ما دامت مرحلتك غير واضحة بعد.';

  @override
  String get predictionSettingsEntry => 'إعدادات التقدير';

  @override
  String get predictionSettingsIntro =>
      'هذه افتراضات، معروضة بشفافية. بمجرد أن تسجّلي دورتين كاملتين، يُحسب تقديرك الحقيقي في الرئيسية من بياناتك الفعلية — ولن تُستخدم هذه الأرقام لذلك بعد الآن.';

  @override
  String get predictionSettingsPeriodLengthLabel => 'مدة الدورة المعتادة';

  @override
  String get predictionSettingsCycleLengthLabel => 'طول الدورة المعتاد';

  @override
  String get predictionSettingsCycleLengthHint =>
      'يُستخدم لضبط حجم الحلقة في الرئيسية إلى أن تتوفر بيانات فعلية.';

  @override
  String get predictionSettingsLutealLabel => 'طول الطور الأصفري';

  @override
  String get predictionSettingsLutealHint =>
      'عدد الأيام المعتاد بين الإباضة ودورتك القادمة. يُستخدم لتحديد موضع نافذة الخصوبة المقدَّرة — يستمر استخدام هذه القيمة حتى بعد بدء التقديرات الفعلية.';

  @override
  String get dayLogEnergyLabel => 'الطاقة';

  @override
  String get energyLevelLow => 'منخفضة';

  @override
  String get energyLevelMedium => 'متوسطة';

  @override
  String get energyLevelHigh => 'عالية';

  @override
  String get energyLevelEnergetic => 'مفعمة بالنشاط';

  @override
  String get dayLogSkinHairLabel => 'البشرة والشعر';

  @override
  String get skinHealthyGlow => 'إشراقة صحية';

  @override
  String get skinRedness => 'احمرار';

  @override
  String get skinDryness => 'جفاف';

  @override
  String get skinOiliness => 'دهنية';

  @override
  String get hairGoodDay => 'يوم شعر جيد';

  @override
  String get hairBadDay => 'يوم شعر سيء';

  @override
  String get hairLoss => 'تساقط الشعر';

  @override
  String get scalpOily => 'فروة رأس دهنية';

  @override
  String get dayLogBreastExamLabel => 'الفحص الذاتي للثدي';

  @override
  String get breastExamAllNormal => 'لا شيء غير معتاد';

  @override
  String get breastExamLump => 'كتلة';

  @override
  String get breastExamIndentation => 'انخساف';

  @override
  String get breastExamRedness => 'احمرار';

  @override
  String get breastExamCrackedNipple => 'تشقق الحلمة';

  @override
  String get breastExamDischarge => 'إفرازات';

  @override
  String get cervixPositionLabel => 'وضعية عنق الرحم';

  @override
  String get cervixPositionLow => 'منخفضة';

  @override
  String get cervixPositionMedium => 'متوسطة';

  @override
  String get cervixPositionHigh => 'مرتفعة';

  @override
  String get cervixOpeningLabel => 'اتساع عنق الرحم';

  @override
  String get cervixOpeningClosed => 'مغلق';

  @override
  String get cervixOpeningMedium => 'متوسط';

  @override
  String get cervixOpeningOpen => 'مفتوح';

  @override
  String get cervixFirmnessLabel => 'صلابة عنق الرحم';

  @override
  String get cervixFirmnessSoft => 'لين';

  @override
  String get cervixFirmnessMedium => 'متوسط';

  @override
  String get cervixFirmnessFirm => 'صلب';

  @override
  String get dayLogWaterLabel => 'الماء';

  @override
  String get dayLogSleepLabel => 'النوم';

  @override
  String get dayLogWeightLabel => 'الوزن';

  @override
  String get dayLogMedicationsLabel => 'الدواء';

  @override
  String get dayLogAddMedication => 'إضافة دواء';

  @override
  String get dayLogMedicationNameHint => 'اسم الدواء';

  @override
  String get navAssistant => 'المساعدة';

  @override
  String get assistantTitle => 'مساعدة فيرا';

  @override
  String get assistantInputHint => 'اسألي عن دورتك…';

  @override
  String get assistantIntro =>
      'مرحبًا! يمكنني الإجابة عن أسئلتك حول الدورة الشهرية وكيفية عمل فيرا — هنا على هاتفك، لا يغادر أي شيء جهازك. لستُ طبيبة وهذه ليست نصيحة طبية.';

  @override
  String get insightMenstrual3 =>
      'دم الدورة ليس \"دمًا فاسدًا\" — إنه مزيج من الدم وبطانة الرحم، وهو جزء طبيعي تمامًا من الدورة.';

  @override
  String get insightMenstrual4 =>
      'الحرارة اللطيفة على أسفل البطن تخفف التقلصات فعلًا — قربة الماء الدافئ وسيلة كلاسيكية مدعومة علميًا.';

  @override
  String get insightMenstrual5 =>
      'يكون التدفق غالبًا أغزر في اليومين الأولين ثم يخف تدريجيًا — هذا النمط معتاد.';

  @override
  String get insightMenstrual6 =>
      'الشعور بتعب أكبر قليلًا أثناء الدورة شائع — فالحديد يغادر الجسم مع دم الحيض.';

  @override
  String get insightFollicular3 =>
      'الإستروجين يعيد بناء بطانة الرحم بعد الدورة — جسمك يستعد لبداية جديدة.';

  @override
  String get insightFollicular4 =>
      'غالبًا ما تبدو البشرة في أصفى حالاتها في هذه المرحلة مع استقرار الهرمونات.';

  @override
  String get insightFollicular5 =>
      'تبلغ القدرة على التحمل وسرعة الاستجابة ذروتهما في أواخر المرحلة الجرابية لدى كثيرين.';

  @override
  String get insightFollicular6 =>
      'طول هذه المرحلة هو الأكثر تفاوتًا بين الأشخاص — أما المرحلة الأصفرية فأكثر ثباتًا.';

  @override
  String get insightFertile3 =>
      'تعيش البويضة نحو 12–24 ساعة، لكن الحيوانات المنوية قد تنتظر حتى 5 أيام — لهذا تمتد نافذة الخصوبة عدة أيام.';

  @override
  String get insightFertile4 =>
      'قرب الإباضة، غالبًا ما يصبح مخاط عنق الرحم شفافًا ومطاطيًا — مثل بياض البيض النيء.';

  @override
  String get insightFertile5 =>
      'يشعر بعض الأشخاص بوخزة قصيرة في جانب واحد عند الإباضة — ولها اسم أيضًا: ألم منتصف الدورة.';

  @override
  String get insightFertile6 =>
      'ترتفع درجة حرارة الجسم القاعدية قليلًا *بعد* الإباضة — فهي تؤكد حدوثها ولا تتنبأ بها.';

  @override
  String get insightLuteal3 =>
      'يبلغ البروجسترون ذروته بعد نحو أسبوع من الإباضة — والانتفاخ وحساسية الثدي حينها شائعان.';

  @override
  String get insightLuteal4 =>
      'الرغبة في الكربوهيدرات قبل الدورة حقيقية — إذ ترتفع احتياجات الطاقة قليلًا في المرحلة الأصفرية.';

  @override
  String get insightLuteal5 =>
      'عادةً ما تخف أعراض متلازمة ما قبل الحيض خلال يوم أو يومين من بدء النزيف.';

  @override
  String get insightLuteal6 =>
      'روتين نوم منتظم يمكن أن يخفف بوضوح تقلبات المزاج في أواخر المرحلة الأصفرية.';

  @override
  String get insightUnknown2 =>
      'تتبُّع ثلاث دورات فقط يكفي غالبًا لتبدأ ملامح نمطك الخاص بالظهور.';

  @override
  String get insightUnknown3 =>
      'الدورات مسألة شخصية — ومقارنة دورتك بدورة صديقتك نادرًا ما تفيدك بشيء.';

  @override
  String get insightUnknown4 =>
      'التوتر والسفر والمرض يمكن أن تؤخر الإباضة — فالدورة \"المتأخرة\" غالبًا تعني إباضة متأخرة فحسب.';

  @override
  String get settingsThemeLabel => 'المظهر';

  @override
  String get settingsThemeSystem => 'النظام';

  @override
  String get settingsThemeLight => 'فاتح';

  @override
  String get settingsThemeDark => 'داكن';

  @override
  String get settingsMascotLabel => 'التميمة المرافقة';

  @override
  String get mascotDroplet => 'قطرة';

  @override
  String get mascotFlower => 'زهرة';

  @override
  String get mascotMoon => 'قمر';

  @override
  String get mascotNone => 'بدون';

  @override
  String homeWindowCountdown(int days) {
    return 'تبدأ النافذة المتوقعة بعد نحو $days أيام';
  }

  @override
  String homeOvulationCountdown(int days) {
    return 'الإباضة المقدرة بعد نحو $days أيام';
  }

  @override
  String get homeQuickLogTitle => 'كيف يشعر جسمك اليوم؟';

  @override
  String get actionSave => 'حفظ';

  @override
  String get insightsTrackerHubTitle => 'متتبعاتك';

  @override
  String get trackerHistoryEmpty => 'لا توجد إدخالات في هذا النطاق بعد';

  @override
  String get rangeFilter1m => 'شهر';

  @override
  String get rangeFilter3m => '3 أشهر';

  @override
  String get rangeFilter6m => '6 أشهر';

  @override
  String get dayLogOvulationTestLabel => 'اختبار الإباضة';

  @override
  String get ovulationTestNegative => 'سلبي';

  @override
  String get ovulationTestPositive => 'إيجابي';

  @override
  String get settingsOvulationTestToggle => 'اختبار الإباضة';

  @override
  String get settingsRemindersOvulationLabel => 'تنبيه اقتراب نافذة الخصوبة';

  @override
  String get reminderOvulationTitle => 'نافذة الخصوبة المقدرة تقترب';

  @override
  String get reminderOvulationBody =>
      'بناءً على دوراتك المسجلة، قد تبدأ نافذة الخصوبة المقدرة قريبًا.';

  @override
  String trackerEntriesCount(int count) {
    return '$count إدخالات';
  }

  @override
  String get assistantTyping => 'فيرا تكتب…';

  @override
  String get premiumTitle => 'فيرا بريميوم';

  @override
  String get premiumHeadline => 'فيرا بلا إعلانات';

  @override
  String get premiumSubhead =>
      'تبقى جميع ميزات التتبع مجانية إلى الأبد. بريميوم يزيل الإعلانات فقط ويدعم التطوير.';

  @override
  String get premiumBenefitNoAds => 'لا إعلانات في أي مكان بالتطبيق';

  @override
  String get premiumBenefitSupport => 'يدعم تطبيقًا مستقلاً يضع الخصوصية أولاً';

  @override
  String get premiumBenefitFuture => 'يشمل ميزات بريميوم المستقبلية';

  @override
  String get premiumMonthly => 'شهري';

  @override
  String get premiumYearly => 'سنوي';

  @override
  String get premiumYearlyNote => 'يُفوتر مرة واحدة سنويًا';

  @override
  String get premiumSubscribeCta => 'متابعة';

  @override
  String get premiumRestore => 'استعادة الشراء';

  @override
  String get premiumCancelNote =>
      'يمكنك الإلغاء في أي وقت من حساب المتجر. لا عدّ تنازلي ولا ضغط — إن لم يكن الوقت مناسبًا، تستمر النسخة المجانية كما هي.';

  @override
  String get premiumActiveBadge => 'بريميوم مُفعّل';

  @override
  String get premiumDevToggle => 'محاكاة بريميوم (تطوير)';

  @override
  String get settingsPremiumEntry => 'فيرا بريميوم';

  @override
  String get adTestNotice => 'إعلان تجريبي — ليس فعليًا بعد';

  @override
  String get settingsPregnancyModeLabel => 'وضع الحمل';

  @override
  String get pregnancyLmpLabel => 'أول يوم في آخر دورة';

  @override
  String pregnancyWeekLabel(int weeks, int days) {
    return 'الأسبوع $weeks، اليوم $days';
  }

  @override
  String get pregnancyDueDateLabel => 'تاريخ الولادة المقدَّر';

  @override
  String pregnancyDaysLeft(int days) {
    return 'يتبقى نحو $days يومًا';
  }

  @override
  String pregnancyTrimesterLabel(int n) {
    return 'الثلث $n';
  }

  @override
  String get pregnancyDisclaimer =>
      'تُقدَّر التواريخ من آخر دورة وفق قاعدة الـ280 يومًا المعتادة. تعطي الموجات فوق الصوتية تاريخًا أدق، والإباضة المتأخرة تزيح هذه الأرقام — هذه معلومات وليست رعاية طبية.';

  @override
  String get pregnancyWeeklyNoteTitle => 'هذا الأسبوع';

  @override
  String get pregnancyNeedsLmp => 'أضيفي أول يوم في آخر دورة لبدء التتبع.';

  @override
  String get pregnancyOutOfRange =>
      'هذا التاريخ أقدم من 42 أسبوعًا — حدّثيه أو أوقفي وضع الحمل.';

  @override
  String get partnerShareTitle => 'مشاركة ملخص مع الشريك';

  @override
  String get partnerShareBody =>
      'ينشئ ملخصًا نصيًا قصيرًا — مرحلتك الحالية ونافذتك المقدَّرة — ترسلينه بنفسك عبر أي تطبيق. لا مزامنة حية ولا حساب شريك: لا يُشارَك شيء إلا إذا أرسلتِه.';

  @override
  String get partnerShareCta => 'إنشاء ملخص';

  @override
  String get partnerSummaryHeader => 'ملخص الدورة من فيرا';

  @override
  String get settingsHomeThemeLabel => 'سمة الصفحة الرئيسية';

  @override
  String get homeThemeWheat => 'قمح';

  @override
  String get homeThemeSky => 'سماء';

  @override
  String get homeThemeField => 'حقل';

  @override
  String get homeThemeBlossom => 'زهر';

  @override
  String get homeThemePlain => 'سادة';

  @override
  String get backupNudgeTitle => 'احتفظي بنسخة من بياناتك';

  @override
  String get backupNudgeBody =>
      'كل شيء موجود على هذا الهاتف فقط. إذا فُقد أو تعطّل أو أُعيد ضبطه، سيذهب سجلك معه — النسخة الاحتياطية المشفّرة تستغرق لحظة ولا يفتحها سواك.';

  @override
  String get backupNudgeCta => 'انسخي احتياطيًا الآن';

  @override
  String get backupNudgeDismiss => 'لاحقًا';

  @override
  String backupLastDone(String date) {
    return 'آخر نسخة احتياطية: $date';
  }

  @override
  String get backupNever => 'لا توجد نسخة احتياطية بعد';

  @override
  String get settingsRemindersBackupLabel => 'ذكّريني بالنسخ الاحتياطي';

  @override
  String get reminderBackupTitle => 'حان وقت النسخ الاحتياطي لفيرا';

  @override
  String get reminderBackupBody =>
      'سجلك موجود على هذا الهاتف فقط. نسخة احتياطية مشفّرة سريعة تحافظ عليه.';

  @override
  String get calendarDayDetailTitle => 'هذا اليوم';

  @override
  String get calendarDayNothingLogged => 'لا توجد تسجيلات لهذا اليوم بعد';

  @override
  String get calendarDayOpenLog => 'فتح سجل اليوم';

  @override
  String get cycleHistoryTitle => 'الدورات السابقة';

  @override
  String get cycleHistoryEmpty => 'سجّلي بضع دورات وسيظهر سجل دوراتك هنا.';

  @override
  String get cycleHistoryOngoing => 'مستمرة';

  @override
  String cycleHistoryLength(int days) {
    return 'دورة من $days يومًا';
  }

  @override
  String cycleHistoryPeriodLength(int days) {
    return '$days أيام نزيف';
  }

  @override
  String cycleHistoryVsAverage(String diff) {
    return '$diff مقارنة بمتوسطك';
  }

  @override
  String get insightsCycleHistoryEntry => 'الدورات السابقة';
}
