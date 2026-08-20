// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Turkish (`tr`).
class AppLocalizationsTr extends AppLocalizations {
  AppLocalizationsTr([String locale = 'tr']) : super(locale);

  @override
  String get appTitle => 'Vera';

  @override
  String get actionSkip => 'Geç';

  @override
  String get actionContinue => 'Devam et';

  @override
  String get actionDone => 'Bitti';

  @override
  String get actionCancel => 'Vazgeç';

  @override
  String get actionDelete => 'Sil';

  @override
  String get actionEnable => 'Etkinleştir';

  @override
  String get commonIDontKnow => 'Bilmiyorum';

  @override
  String get commonYes => 'Evet';

  @override
  String get commonNo => 'Hayır';

  @override
  String get commonNotSure => 'Emin değilim';

  @override
  String get pinSetupTitle => 'PIN oluştur';

  @override
  String get pinSetupEnterPrompt =>
      'Uygulamayı kilitlemek için 6 haneli bir PIN seç';

  @override
  String get pinSetupConfirmPrompt => 'Onaylamak için tekrar gir';

  @override
  String get pinSetupMismatch => 'Eşleşmedi — tekrar deneyelim';

  @override
  String get pinSetupBiometricTitle => 'Daha hızlı kilit açma?';

  @override
  String get pinSetupBiometricBody =>
      'Parmak izi veya yüzünle de kilidi açabilirsin — PIN\'in yedek olarak kalır.';

  @override
  String get lockScreenTitle => 'Kilitli';

  @override
  String get lockScreenEnterPin => 'PIN\'ini gir';

  @override
  String get lockScreenWrongPin => 'Bu PIN eşleşmiyor';

  @override
  String get lockScreenUseBiometrics => 'Biyometri kullan';

  @override
  String get lockScreenForgotPin => 'PIN\'ini mi unuttun?';

  @override
  String lockScreenThrottled(int seconds) {
    return 'Çok fazla deneme. $seconds sn sonra tekrar dene';
  }

  @override
  String get lockScreenEraseTitle => 'Tüm veriler silinsin mi?';

  @override
  String get lockScreenEraseBody =>
      'Bu, cihazdaki her şeyi kalıcı olarak siler. Hesap ve sunucu yedeği olmadığı için bu işlem geri alınamaz.';

  @override
  String get lockScreenEraseConfirm => 'Her şeyi sil';

  @override
  String get onboardingPrivacyTitle => 'Hoş geldin';

  @override
  String get onboardingPrivacyBody =>
      'Döngü verilerin yalnızca bu cihazda, şifreli olarak kalır. Hesap yok, bulut senkronu yok — kaydettiğin hiçbir şey yüklenmez. Şifreleme anahtarı telefonunun güvenli donanımında durur; verini istediğin an dışa aktarabilir ya da tamamen silebilirsin.';

  @override
  String get onboardingLastPeriodTitle => 'Son adetin ne zaman başladı?';

  @override
  String get onboardingLastPeriodBody =>
      'Bu, başlangıç için yardımcı olur — istediğin zaman takvimden düzeltebilirsin.';

  @override
  String get onboardingPickDate => 'Tarih seç';

  @override
  String get onboardingCycleLengthTitle =>
      'Döngün tipik olarak kaç gün sürüyor?';

  @override
  String get onboardingCycleLengthBody =>
      'Yaklaşık bir sayı yeterli. Birkaç tam döngü gördükten sonra gerçek bir tahmin vermeye başlayacağız.';

  @override
  String get onboardingPeriodLengthTitle => 'Adetin genelde kaç gün sürüyor?';

  @override
  String get onboardingPeriodLengthBody =>
      'Bunu, son adetini doldurmak için kullanacağız, böylece sıfırdan başlamıyorsun.';

  @override
  String get onboardingDaysUnit => 'gün';

  @override
  String get onboardingGoalTitle => 'Seni buraya getiren ne?';

  @override
  String get onboardingGoalBody =>
      'Bu sadece sana önce doğru şeyleri gösterebilmemiz için — fikrini istediğin zaman Ayarlar\'dan değiştirebilirsin.';

  @override
  String get goalTrackPeriod => 'Regl dönemimi takip et';

  @override
  String get goalTryingToConceive => 'Gebe kalmaya çalışıyorum';

  @override
  String get goalPregnancyTracking => 'Gebeliğimi takip ediyorum';

  @override
  String get onboardingRegularityTitle => 'Regl dönemlerin genelde düzenli mi?';

  @override
  String get onboardingRegularityBody =>
      'Burada yanlış cevap yok — sadece vücudunu biraz tanımamıza yardımcı olur.';

  @override
  String get onboardingCrampsTitle => 'Genelde kramp giriyor musun?';

  @override
  String get onboardingCrampsBody =>
      'O günlerde nasıl hissettiğini kolayca kaydedebilmeni sağlayacağız.';

  @override
  String get onboardingNotificationTitle => 'Nazik hatırlatmalar ister misin?';

  @override
  String get onboardingNotificationBody =>
      'Regl dönemin yaklaşırken seni hafifçe uyarabiliriz.';

  @override
  String get onboardingNotificationMockTitle =>
      'Regl dönemin yakında başlayabilir';

  @override
  String get onboardingNotificationMockBody => 'Kaydettiğin döngülere göre';

  @override
  String get onboardingNotificationAllow => 'Hatırlatmaları aç';

  @override
  String get onboardingNotificationNotNow => 'Şimdi değil';

  @override
  String get onboardingBuildingPlanTitle => 'Senin için hazırlıyoruz';

  @override
  String get onboardingBuildingPlanStep1 =>
      'Verilerin bu cihazda güvenceye alınıyor';

  @override
  String get onboardingBuildingPlanStep2 => 'Tercihlerin kaydediliyor';

  @override
  String get onboardingBuildingPlanStep3 => 'Takvimin hazırlanıyor';

  @override
  String get onboardingBuildingPlanDone => 'Hazır';

  @override
  String get navHome => 'Ana Sayfa';

  @override
  String get navCalendar => 'Takvim';

  @override
  String get navInsights => 'İçgörüler';

  @override
  String get navSettings => 'Ayarlar';

  @override
  String homeCycleDayLabel(int day) {
    return '$day. gün';
  }

  @override
  String get homeNoCycleYet => 'Henüz adet kaydı yok';

  @override
  String get homePhaseMenstrual => 'Adet';

  @override
  String get homePhaseFollicular => 'Foliküler evre';

  @override
  String get homePhaseFertileWindow => 'Tahmini doğurgan pencere';

  @override
  String get homePhaseLuteal => 'Luteal evre';

  @override
  String get homePhaseUnknown => 'Yeterli güncel veri yok';

  @override
  String get homePredictionInsufficientTitle => 'Henüz yeterli veri yok';

  @override
  String get homePredictionInsufficientBody =>
      'Bir sonraki adetini kaydet, tahmin etmeye başlayalım.';

  @override
  String homePredictionRangeLabel(String start, String end) {
    return '$start – $end';
  }

  @override
  String get homeConfidenceHigh => 'Yüksek güven';

  @override
  String get homeConfidenceMedium => 'Orta güven';

  @override
  String get homeConfidenceLow => 'Düşük güven';

  @override
  String get homeIrregularNote =>
      'Son zamanlarda döngü uzunluğun her zamankinden daha değişken. Bu senin için yeniyse, bir kontrolde bahsetmeye değer olabilir.';

  @override
  String get homeFertileWindowDisclaimer =>
      'Tipik döngü zamanlamasına dayanır — bir gebelikten korunma yöntemi değildir.';

  @override
  String get homePeriodStartedButton => 'Adet bugün başladı';

  @override
  String get homePeriodStartedSnackbar => 'Kaydedildi — adet bugün başladı';

  @override
  String get actionUndo => 'Geri al';

  @override
  String get comingSoon => 'Yakında';

  @override
  String get dayLogFlowLabel => 'Akış';

  @override
  String get flowSpotting => 'Leke';

  @override
  String get flowLight => 'Hafif';

  @override
  String get flowMedium => 'Orta';

  @override
  String get flowHeavy => 'Yoğun';

  @override
  String get flowNone => 'Yok';

  @override
  String get dayLogSymptomsLabel => 'Semptomlar';

  @override
  String get symptomCramps => 'Kramp';

  @override
  String get symptomHeadache => 'Baş ağrısı';

  @override
  String get symptomBloating => 'Şişkinlik';

  @override
  String get symptomBreastTenderness => 'Göğüs hassasiyeti';

  @override
  String get symptomAcne => 'Akne';

  @override
  String get symptomFatigue => 'Yorgunluk';

  @override
  String get symptomNausea => 'Bulantı';

  @override
  String get symptomBackPain => 'Bel ağrısı';

  @override
  String get symptomAppetiteChange => 'İştah değişimi';

  @override
  String get symptomSleepTrouble => 'Uyku sorunu';

  @override
  String get symptomPelvicPain => 'Pelvik ağrı';

  @override
  String get symptomDizziness => 'Baş dönmesi';

  @override
  String get dayLogMoodLabel => 'Ruh hali';

  @override
  String get moodCalm => 'Sakin';

  @override
  String get moodAnxious => 'Kaygılı';

  @override
  String get moodIrritable => 'Sinirli';

  @override
  String get moodLow => 'Düşük';

  @override
  String get moodEnergetic => 'Enerjik';

  @override
  String get moodHappy => 'Mutlu';

  @override
  String get moodContent => 'Memnun';

  @override
  String get moodSad => 'Üzgün';

  @override
  String get moodDepressed => 'Depresif';

  @override
  String get moodEmotional => 'Duygusal';

  @override
  String get dayLogNoteLabel => 'Not';

  @override
  String get dayLogNoteHint => 'Bugünle ilgili hatırlamak istediğin bir şey';

  @override
  String get dayLogOptionalTrackersLabel => 'Opsiyonel izleyiciler';

  @override
  String get dayLogSexualActivityLabel => 'Cinsel aktivite';

  @override
  String get dayLogBbtLabel => 'Bazal vücut sıcaklığı';

  @override
  String get dayLogMucusLabel => 'Servikal mukus';

  @override
  String get mucusDry => 'Kuru';

  @override
  String get mucusSticky => 'Yapışkan';

  @override
  String get mucusCreamy => 'Kremsi';

  @override
  String get mucusWatery => 'Sulu';

  @override
  String get mucusEggWhite => 'Yumurta akı';

  @override
  String get dayLogSavedIndicator => 'Kaydedildi';

  @override
  String get homeOpenTodayLog => 'Bugün için detay ekle';

  @override
  String get calendarLegendActual => 'Kaydedilen adet';

  @override
  String get calendarLegendPredicted => 'Tahmini pencere';

  @override
  String get calendarLegendFertile => 'Tahmini doğurgan pencere';

  @override
  String get calendarLegendOvulation => 'Tahmini ovülasyon';

  @override
  String get dayDetailFertileTitle => 'Tahmini doğurgan pencerendesin';

  @override
  String get dayDetailOvulationTitle => 'Tahmini ovülasyon günü';

  @override
  String get dayDetailOvulationBody =>
      'Genelde bu günün civarında gebe kalma olasılığı biraz daha yüksek olur — bu bir tahmindir, garanti değildir.';

  @override
  String get insightsCyclesLoggedLabel => 'Kaydedilen döngü';

  @override
  String get insightsAveragePeriodLengthLabel => 'Ortalama adet süresi';

  @override
  String get insightsAverageCycleLengthLabel => 'Ortalama döngü uzunluğu';

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
      other: 'Yaklaşık $daysString gün değişkenlik',
    );
    return '$_temp0';
  }

  @override
  String get insightsNotEnoughDataTitle => 'Henüz yeterli veri yok';

  @override
  String get insightsNotEnoughDataBody =>
      'Birkaç tam döngü kaydet, ortalamaların burada görünsün.';

  @override
  String get insightsSymptomFrequencyTitle => 'Döngü gününe göre semptomlar';

  @override
  String get insightsNoSymptomsLogged => 'Henüz semptom kaydedilmedi';

  @override
  String get settingsLanguageLabel => 'Dil';

  @override
  String get settingsLanguageSystem => 'Sistem dili';

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
  String get settingsWeekStartLabel => 'Hafta başlangıcı';

  @override
  String get settingsWeekStartMonday => 'Pazartesi';

  @override
  String get settingsWeekStartSunday => 'Pazar';

  @override
  String get settingsTemperatureUnitLabel => 'Sıcaklık birimi';

  @override
  String get settingsTemperatureCelsius => 'Santigrat';

  @override
  String get settingsTemperatureFahrenheit => 'Fahrenheit';

  @override
  String get settingsRemindersLabel => 'Adetimden önce hatırlat';

  @override
  String get settingsRemindersPeriodEndLabel =>
      'Regl dönemim bitmek üzereyken kontrol et';

  @override
  String get settingsRemindersMedicationLabel => 'İlaç hatırlatıcısı';

  @override
  String get settingsRemindersWaterLabel => 'Su hatırlatıcısı';

  @override
  String get settingsRemindersAppointmentLabel => 'Randevu hatırlatıcısı';

  @override
  String get settingsRemindersAppointmentSet => 'Tarih ve saat belirle';

  @override
  String get settingsRemindersAppointmentClear => 'Kaldır';

  @override
  String get settingsOptionalTrackersHeading => 'Opsiyonel izleyiciler';

  @override
  String get settingsOptionalTrackersBody =>
      'Varsayılan olarak kapalı. Birini açmak gün kaydı ekranına ekler.';

  @override
  String get settingsSexualActivityToggle => 'Cinsel aktivite';

  @override
  String get settingsBbtToggle => 'Bazal vücut sıcaklığı';

  @override
  String get settingsMucusToggle => 'Servikal mukus';

  @override
  String get settingsBreastExamToggle => 'Kendi kendine göğüs muayenesi';

  @override
  String get settingsCervixToggle => 'Serviks pozisyonu ve sertliği';

  @override
  String get settingsPrivacyEntry => 'Mahremiyet';

  @override
  String get settingsDeleteAllData => 'Tüm veriyi sil';

  @override
  String get privacyScreenTitle => 'Mahremiyet';

  @override
  String get privacyScreenIntro =>
      'Verine tam olarak ne olduğu, düz bir dille.';

  @override
  String get privacyScreenStorageTitle => 'Bu cihazda şifreli';

  @override
  String get privacyScreenNoNetworkTitle => 'Sunucu yok, hesap yok';

  @override
  String get privacyScreenNoThirdPartyTitle => 'İzleme yok';

  @override
  String get privacyScreenExportTitle => 'Dışa aktarmayı yalnızca sen yaparsın';

  @override
  String get privacyScreenDeleteTitle => 'Silmek kalıcıdır';

  @override
  String get privacyScreenStorage =>
      'Kaydettiğin her şey şifrelenir ve sadece bu cihazda, tek bir dosyada saklanır. Şifreleme anahtarı telefonunun güvenli donanımında yaşar — iOS\'ta Keychain, Android\'de Keystore — dosyanın kendisinde değil.';

  @override
  String get privacyScreenNoNetwork =>
      'Bu uygulamanın kendi sunucusu ve hesap sistemi yok — kayıtların hiçbir zaman yüklenmez. Ücretsiz sürümde Google reklamları vardır ve bunlar internete bağlanır; kaydettiğin hiçbir şeye erişmezler.';

  @override
  String get privacyScreenNoThirdParty =>
      'Analitik yok, çökme raporlama yok, izleme SDK\'sı yok. Tek üçüncü taraf bileşen, ücretsiz sürümdeki Google reklam SDK\'sıdır — Premium onu tamamen kaldırır.';

  @override
  String get privacyScreenExport =>
      'Verinin bu cihazdan çıkmasının tek yolu kendin dışa aktarmandır, o dışa aktarma da sadece senin bildiğin bir parolayla şifrelenir.';

  @override
  String get privacyScreenDelete =>
      'Verini silmek gerçek ve anındadır. Hesap ve bizim tarafımızda bir yedek olmadığı için — bir kere gidince gider.';

  @override
  String get adPlaceholderLabel => 'Reklam alanı';

  @override
  String get adPlaceholderUpgradeCta => 'Premium ile reklamsız deneyime geç';

  @override
  String get reminderNotificationTitle => 'Adetin yakında başlayabilir';

  @override
  String get reminderNotificationBody =>
      'Kaydettiğin döngülere göre tahmini pencerene yaklaşıyorsun.';

  @override
  String get reminderPeriodEndTitle => 'Regl dönemin bitmek üzere olabilir';

  @override
  String get reminderPeriodEndBody =>
      'Hâlâ devam ediyorsa bu tamamen normal — sadece nazik bir kontrol.';

  @override
  String get reminderMedicationTitle => 'İlaç hatırlatıcısı';

  @override
  String get reminderMedicationBody => 'İlacını alma zamanı.';

  @override
  String get reminderWaterTitle => 'Su içmeyi unutma';

  @override
  String get reminderWaterBody => 'Küçük bir su hatırlatıcısı.';

  @override
  String get reminderAppointmentTitle => 'Yaklaşan randevu';

  @override
  String get reminderAppointmentBody => 'Yaklaşan bir randevun var.';

  @override
  String get settingsExportEntry => 'Dışa aktarma & yedekleme';

  @override
  String get exportBackupHeading => 'Şifreli yedek';

  @override
  String get exportBackupBody =>
      'Geçmişinin şifreli bir kopyasını yeni bir cihaza taşımak için kaydet. Geri yüklemek için parolayı tekrar gireceksin — başka bir kurtarma yolu yok.';

  @override
  String get exportCreateBackupButton => 'Yedek oluştur';

  @override
  String get exportRestoreBackupButton => 'Yedekten geri yükle';

  @override
  String get exportPasswordLabel => 'Parola';

  @override
  String get exportPasswordConfirmLabel => 'Parolayı onayla';

  @override
  String get exportPasswordMismatch => 'Parolalar eşleşmiyor';

  @override
  String get exportPasswordTooShort => 'En az 8 karakter kullan';

  @override
  String get exportRestoreConfirmTitle =>
      'Bu cihazdaki tüm veriler değiştirilsin mi?';

  @override
  String get exportRestoreConfirmBody =>
      'Yedeği geri yüklemek, bu cihazda şu an kayıtlı olan her şeyin yerini alır. Bu geri alınamaz.';

  @override
  String get exportRestoreConfirmAction => 'Geri yükle';

  @override
  String get exportWrongPassword => 'Bu parola bu yedekle eşleşmiyor';

  @override
  String get exportInvalidFile => 'Bu dosya bir Vera yedeği gibi görünmüyor';

  @override
  String get exportBackupCreated => 'Yedek paylaşıma hazır';

  @override
  String get exportRestoreSuccess => 'Yedek geri yüklendi';

  @override
  String get exportDoctorReportHeading => 'Doktor raporu';

  @override
  String get exportDoctorReportBody =>
      'Bir klinisyenle paylaşabileceğin bir özet.';

  @override
  String get exportIncludeNotesToggle => 'Kişisel notları dahil et';

  @override
  String get exportShareCsvButton => 'CSV olarak paylaş';

  @override
  String get exportPrintPdfButton => 'Yazdır / PDF olarak kaydet';

  @override
  String get doctorReportDisclaimer =>
      'Vera tarafından kullanıcı tarafından girilen verilerden oluşturuldu. Tıbbi bir teşhis değildir.';

  @override
  String get doctorReportGeneratedOn => 'Oluşturulma tarihi';

  @override
  String get doctorReportSummaryHeading => 'Özet';

  @override
  String get doctorReportDailyLogHeading => 'Günlük kayıt';

  @override
  String get doctorReportColumnDate => 'Tarih';

  @override
  String get doctorReportTimelineHeading => 'Döngü zaman çizelgesi';

  @override
  String get doctorReportCycleLabel => 'Döngü';

  @override
  String get doctorReportTimelineLegendPeriod => 'Regl';

  @override
  String get doctorReportTimelineLegendCycle => 'Döngünün geri kalanı';

  @override
  String get doctorReportTimelineOngoing => 'Devam ediyor';

  @override
  String get dailyInsightLabel => 'Biliyor muydun?';

  @override
  String get insightMenstrual1 =>
      'Rahim iç zarın şu an dökülüyor — çoğu adet 3 ila 7 gün sürer, bu tamamen normal.';

  @override
  String get insightMenstrual2 =>
      'Yeşil yapraklı sebzeler ve mercimek gibi demir açısından zengin gıdalar bu hafta kaybettiğini dengelemene yardımcı olabilir.';

  @override
  String get insightFollicular1 =>
      'Östrojen yükseliyor, birçok kişi bu dönemde daha fazla enerji ve odaklanma fark ediyor.';

  @override
  String get insightFollicular2 =>
      'Vücudun bir yumurta salınımına hazırlanıyor — bu evre bir haftadan birkaç haftaya kadar sürebilir.';

  @override
  String get insightFertile1 =>
      'Bu, tahmini doğurgan pencerendir — tipik zamanlamaya göre gebeliğin en olası olduğu, ovülasyon çevresindeki günler.';

  @override
  String get insightFertile2 =>
      'Bazı kişiler ovülasyon civarında bazal vücut sıcaklığında hafif bir yükseliş veya servikal mukus değişimi fark eder.';

  @override
  String get insightLuteal1 =>
      'Ovülasyondan sonra progesteron yükselir — ruh hali değişimleri veya şişkinlik gibi PMS belirtileri genelde bu dönemde ortaya çıkar.';

  @override
  String get insightLuteal2 =>
      'Bir gebelik yerleşmediyse, bu evrenin sonuna doğru hormon seviyeleri düşer ve bir sonraki adetini tetikler.';

  @override
  String get insightUnknown1 =>
      'Döngü uzunlukları kişiden kişiye çok değişir — 21 ila 35 gün arası tipik kabul edilir.';

  @override
  String get insightsPhaseTipsTitle => 'Bu evrede sana iyi gelebilir';

  @override
  String get tipFitnessLabel => 'Hareket';

  @override
  String get tipNutritionLabel => 'Beslenme';

  @override
  String get tipFitnessMenstrual =>
      'Yürüyüş, esneme veya onarıcı yoga gibi hafif hareketler şu an yoğun antrenmandan daha iyi hissettirebilir.';

  @override
  String get tipFitnessFollicular =>
      'Bu evrede enerji genelde artar — yeni bir egzersiz denemek veya biraz daha zorlamak için iyi bir pencere.';

  @override
  String get tipFitnessFertile =>
      'Birçok kişi burada kendini en enerjik hisseder — ilgini çekiyorsa daha yüksek yoğunluklu antrenman için uygun bir evre.';

  @override
  String get tipFitnessLuteal =>
      'Bu evrenin sonlarına doğru enerjin düşerse, düşük yoğunluklu kuvvet çalışması veya yüzme daha sürdürülebilir hissettirebilir.';

  @override
  String get tipFitnessUnknown =>
      'Bugün ne iyi hissettiriyorsa o hareket iyi bir seçimdir — her gün için tek bir \"doğru\" rutin yok.';

  @override
  String get tipNutritionMenstrual =>
      'Yeşil yapraklı sebzeler, mercimek ve kırmızı et gibi demir açısından zengin besinler bu hafta kaybettiklerini dengelemene yardımcı olabilir.';

  @override
  String get tipNutritionFollicular =>
      'Enerji arttıkça daha hafif, taze yemekler genelde iyi gelir — ama bu evrede tek bir \"doğru\" beslenme şekli yok.';

  @override
  String get tipNutritionFertile =>
      'Bol su içmek ve dengeli beslenmek, bu daha hareketli hissettiren evrede enerjini destekler.';

  @override
  String get tipNutritionLuteal =>
      'Burada canın farklı şeyler çekebilir — kompleks karbonhidratlar ve kuruyemiş, bitter çikolata gibi magnezyum açısından zengin besinler yaygın tercihlerdir.';

  @override
  String get tipNutritionUnknown =>
      'Evren henüz netleşmediğinde dengeli, düzenli öğünler sağlam bir varsayılan seçimdir.';

  @override
  String get predictionSettingsEntry => 'Tahmin ayarları';

  @override
  String get predictionSettingsIntro =>
      'Bunlar açıkça gösterilen varsayımlardır. 2 tam döngü kaydettiğinde, ana ekrandaki gerçek tahminin kendi verilerinden hesaplanır — bu sayılar o hesap için artık kullanılmaz.';

  @override
  String get predictionSettingsPeriodLengthLabel => 'Tipik adet süresi';

  @override
  String get predictionSettingsCycleLengthLabel => 'Tipik döngü uzunluğu';

  @override
  String get predictionSettingsCycleLengthHint =>
      'Gerçek veri birikene kadar ana ekrandaki halkayı ölçeklemek için kullanılır.';

  @override
  String get predictionSettingsLutealLabel => 'Luteal faz uzunluğu';

  @override
  String get predictionSettingsLutealHint =>
      'Ovülasyon ile bir sonraki adetin arasındaki tipik gün sayısı. Tahmini doğurgan pencereyi yerleştirmek için kullanılır — gerçek tahminler başladıktan sonra da kullanılmaya devam eder.';

  @override
  String get dayLogEnergyLabel => 'Enerji';

  @override
  String get energyLevelLow => 'Düşük';

  @override
  String get energyLevelMedium => 'Orta';

  @override
  String get energyLevelHigh => 'Yüksek';

  @override
  String get energyLevelEnergetic => 'Enerjik';

  @override
  String get dayLogSkinHairLabel => 'Cilt ve saç';

  @override
  String get skinHealthyGlow => 'Sağlıklı ışıltı';

  @override
  String get skinRedness => 'Kızarıklık';

  @override
  String get skinDryness => 'Kuruluk';

  @override
  String get skinOiliness => 'Yağlanma';

  @override
  String get hairGoodDay => 'Saçların iyi';

  @override
  String get hairBadDay => 'Saçların kötü';

  @override
  String get hairLoss => 'Saç dökülmesi';

  @override
  String get scalpOily => 'Saçta yağlanma';

  @override
  String get dayLogBreastExamLabel => 'Kendi kendine göğüs muayenesi';

  @override
  String get breastExamAllNormal => 'Her şey normal';

  @override
  String get breastExamLump => 'Kitle';

  @override
  String get breastExamIndentation => 'İçeri çökme';

  @override
  String get breastExamRedness => 'Cilt kızarıklığı';

  @override
  String get breastExamCrackedNipple => 'Çatlak meme başı';

  @override
  String get breastExamDischarge => 'Meme başı akıntısı';

  @override
  String get cervixPositionLabel => 'Serviks pozisyonu';

  @override
  String get cervixPositionLow => 'Düşük';

  @override
  String get cervixPositionMedium => 'Orta';

  @override
  String get cervixPositionHigh => 'Yüksek';

  @override
  String get cervixOpeningLabel => 'Serviks açıklığı';

  @override
  String get cervixOpeningClosed => 'Kapalı';

  @override
  String get cervixOpeningMedium => 'Orta';

  @override
  String get cervixOpeningOpen => 'Açık';

  @override
  String get cervixFirmnessLabel => 'Serviks sertliği';

  @override
  String get cervixFirmnessSoft => 'Yumuşak';

  @override
  String get cervixFirmnessMedium => 'Orta';

  @override
  String get cervixFirmnessFirm => 'Sert';

  @override
  String get dayLogWaterLabel => 'Su';

  @override
  String get dayLogSleepLabel => 'Uyku';

  @override
  String get dayLogWeightLabel => 'Kilo';

  @override
  String get dayLogMedicationsLabel => 'İlaç';

  @override
  String get dayLogAddMedication => 'İlaç ekle';

  @override
  String get dayLogMedicationNameHint => 'İlaç adı';

  @override
  String get navAssistant => 'Asistan';

  @override
  String get assistantTitle => 'Vera Asistan';

  @override
  String get assistantEndChatTitle => 'Sohbet bitirilsin mi?';

  @override
  String get assistantEndChatBody =>
      'Mesajlar yalnızca bellekte tutuluyor ve hiçbir yere kaydedilmiyor, bu yüzden geri getirilemez.';

  @override
  String get assistantEndChatConfirm => 'Sohbeti bitir';

  @override
  String get assistantInputHint => 'Döngün hakkında sor…';

  @override
  String get assistantIntro =>
      'Merhaba! Regl, döngü ve Vera\'nın nasıl çalıştığıyla ilgili soruları burada, telefonundan hiç çıkmadan cevaplayabilirim. Doktor değilim ve bunlar tıbbi tavsiye değildir.';

  @override
  String get insightMenstrual3 =>
      'Regl kanı \"kirli kan\" değildir — kan ve rahim iç zarının karışımıdır, döngünün tamamen normal bir parçasıdır.';

  @override
  String get insightMenstrual4 =>
      'Karnın alt kısmına hafif sıcaklık kramları gerçekten hafifletir — sıcak su torbası bilimsel desteği olan bir klasiktir.';

  @override
  String get insightMenstrual5 =>
      'Kanama genelde ilk iki gün en yoğundur ve sonra azalır — bu örüntü gayet tipiktir.';

  @override
  String get insightMenstrual6 =>
      'Regl sırasında biraz daha yorgun hissetmek yaygındır — demir, regl kanıyla birlikte vücuttan çıkar.';

  @override
  String get insightFollicular3 =>
      'Östrojen, regl sonrası rahim iç zarını yeniden inşa ediyor — vücudun taze bir başlangıç hazırlığında.';

  @override
  String get insightFollicular4 =>
      'Hormon seviyeleri dengelendikçe cilt genelde bu evrede en berrak halinde görünür.';

  @override
  String get insightFollicular5 =>
      'Birçok kişide dayanıklılık ve tepki süresi foliküler evrenin sonlarında zirve yapar.';

  @override
  String get insightFollicular6 =>
      'Kişiden kişiye en çok değişen bu evrenin uzunluğudur — luteal faz çok daha sabittir.';

  @override
  String get insightFertile3 =>
      'Yumurta yaklaşık 12–24 saat yaşar ama spermler 5 güne kadar bekleyebilir — doğurgan pencerenin birkaç güne yayılmasının nedeni bu.';

  @override
  String get insightFertile4 =>
      'Ovülasyon civarında servikal mukus genelde şeffaf ve esnek olur — çiğ yumurta akı gibi.';

  @override
  String get insightFertile5 =>
      'Bazı kişiler ovülasyonda tek tarafta kısa bir sancı hisseder — bunun bir adı bile var: mittelschmerz.';

  @override
  String get insightFertile6 =>
      'Bazal vücut sıcaklığı ovülasyondan *sonra* hafifçe yükselir — ovülasyonu önceden bildirmez, gerçekleştiğini doğrular.';

  @override
  String get insightLuteal3 =>
      'Progesteron ovülasyondan yaklaşık bir hafta sonra zirve yapar — o dönemde şişkinlik ve göğüs hassasiyeti yaygındır.';

  @override
  String get insightLuteal4 =>
      'Regl öncesi karbonhidrat isteği gerçektir — luteal fazda enerji ihtiyacı hafifçe artar.';

  @override
  String get insightLuteal5 =>
      'PMS belirtileri genelde kanama başladıktan bir-iki gün sonra hafifler.';

  @override
  String get insightLuteal6 =>
      'Düzenli bir uyku rutini, luteal fazın sonundaki duygu dalgalanmalarını fark edilir şekilde yumuşatabilir.';

  @override
  String get insightUnknown2 =>
      'Sadece üç döngü kaydetmek, kendi örüntünün belirmeye başlaması için çoğu zaman yeterlidir.';

  @override
  String get insightUnknown3 =>
      'Döngüler kişiseldir — kendi döngünü bir arkadaşınkiyle karşılaştırmak nadiren işe yarar bir şey söyler.';

  @override
  String get insightUnknown4 =>
      'Stres, seyahat ve hastalık ovülasyonu kaydırabilir — \"geciken\" regl çoğu zaman sadece geciken ovülasyon demektir.';

  @override
  String get settingsThemeLabel => 'Tema';

  @override
  String get settingsThemeSystem => 'Sistem';

  @override
  String get settingsThemeLight => 'Açık';

  @override
  String get settingsThemeDark => 'Koyu';

  @override
  String get settingsMascotLabel => 'Yol arkadaşı maskot';

  @override
  String get mascotDroplet => 'Damla';

  @override
  String get mascotFlower => 'Çiçek';

  @override
  String get mascotMoon => 'Ay';

  @override
  String get mascotNone => 'Yok';

  @override
  String homeWindowCountdown(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: 'Tahmini pencereye yaklaşık $days gün var',
    );
    return '$_temp0';
  }

  @override
  String homeOvulationCountdown(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: 'Tahmini ovülasyona yaklaşık $days gün var',
    );
    return '$_temp0';
  }

  @override
  String get homeQuickLogTitle => 'Bugün vücudun nasıl hissediyor?';

  @override
  String get actionSave => 'Kaydet';

  @override
  String get insightsTrackerHubTitle => 'Takiplerin';

  @override
  String get trackerHistoryEmpty => 'Bu aralıkta henüz kayıt yok';

  @override
  String get trackerStatAverage => 'Ortalama';

  @override
  String get trackerStatLowest => 'En düşük';

  @override
  String get trackerStatHighest => 'En yüksek';

  @override
  String get trackerStatLatest => 'Son';

  @override
  String get rangeFilter1m => '1 ay';

  @override
  String get rangeFilter3m => '3 ay';

  @override
  String get rangeFilter6m => '6 ay';

  @override
  String get dayLogOvulationTestLabel => 'Ovülasyon testi';

  @override
  String get ovulationTestNegative => 'Negatif';

  @override
  String get ovulationTestPositive => 'Pozitif';

  @override
  String get settingsOvulationTestToggle => 'Ovülasyon testi';

  @override
  String get settingsRemindersOvulationLabel =>
      'Doğurgan pencere yaklaşınca haber ver';

  @override
  String get reminderOvulationTitle => 'Tahmini doğurgan pencere yaklaşıyor';

  @override
  String get reminderOvulationBody =>
      'Kaydettiğin döngülere göre tahmini doğurgan penceren yakında başlayabilir.';

  @override
  String trackerEntriesCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count kayıt',
    );
    return '$_temp0';
  }

  @override
  String get assistantTyping => 'Vera yazıyor…';

  @override
  String get premiumTitle => 'Vera Premium';

  @override
  String get premiumHeadline => 'Vera Premium';

  @override
  String get premiumSubhead =>
      'Tüm takip özellikleri sonsuza dek ücretsiz kalır — geçmişin asla kilitlenmez. Premium; kendi takiplerini, daha derin içgörüleri, kendi hatırlatıcılarını ve ek görünümleri ekler, reklamları da kaldırır.';

  @override
  String get premiumBenefitNoAds => 'Uygulamanın hiçbir yerinde reklam yok';

  @override
  String get premiumBenefitSupport =>
      'Bağımsız, mahremiyet-önce bir uygulamayı destekler';

  @override
  String get premiumMonthly => 'Aylık';

  @override
  String get premiumYearly => 'Yıllık';

  @override
  String get premiumYearlyNote => 'Yılda bir kez faturalanır';

  @override
  String get premiumSubscribeCta => 'Devam et';

  @override
  String get premiumRestore => 'Satın alımı geri yükle';

  @override
  String get premiumCancelNote =>
      'İstediğin zaman mağaza hesabından iptal edebilirsin. Geri sayım yok, baskı yok — şimdi sırası değilse ücretsiz sürüm bugünkü gibi çalışmaya devam eder.';

  @override
  String get premiumActiveBadge => 'Premium aktif';

  @override
  String get premiumDevToggle => 'Premium\'u simüle et (geliştirme)';

  @override
  String get settingsPremiumEntry => 'Vera Premium';

  @override
  String get adTestNotice => 'Test reklamı — henüz gerçek yayın değil';

  @override
  String get settingsPregnancyModeLabel => 'Gebelik modu';

  @override
  String get pregnancyLmpLabel => 'Son adetin ilk günü';

  @override
  String pregnancyWeekLabel(int weeks, int days) {
    return '$weeks. hafta, $days. gün';
  }

  @override
  String get pregnancyDueDateLabel => 'Tahmini doğum tarihi';

  @override
  String pregnancyDaysLeft(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: 'Yaklaşık $days gün kaldı',
    );
    return '$_temp0';
  }

  @override
  String pregnancyTrimesterLabel(int n) {
    return '$n. trimester';
  }

  @override
  String get pregnancyDisclaimer =>
      'Tarihler, son adetinden standart 280 günlük kurala göre tahmin edilir. Ultrason daha doğru tarih verir ve geç ovülasyon bu sayıları kaydırır — bu bilgilendirmedir, tıbbi takip değildir.';

  @override
  String get pregnancyNoteUnder5 =>
      'Bu haftalarda çoğu kişi henüz bir değişiklik hissetmez — gebelik yaşı son adetten sayıldığı için ilk iki hafta aslında gebelik öncesidir.';

  @override
  String get pregnancyNoteUnder9 =>
      'Bulantı, göğüs hassasiyeti ve yorgunluk bu dönemde yaygındır. İlk randevunu planlamak için iyi bir zaman.';

  @override
  String get pregnancyNoteUnder13 =>
      'İlk trimesterin sonuna yaklaşıyorsun; birçok kişide bulantı bu haftalarda hafiflemeye başlar.';

  @override
  String get pregnancyNoteUnder20 =>
      'Enerji genelde bu dönemde geri gelir. İlk hareketler 16–22. haftalar arasında hissedilebilir.';

  @override
  String get pregnancyNoteUnder28 =>
      'Hareketler belirginleşir ve bir örüntü oluşmaya başlar. Sırt ağrısı ve mide yanması bu dönemde sık görülür.';

  @override
  String get pregnancyNoteUnder34 =>
      'Üçüncü trimesterdesin. Nefes darlığı, sık idrara çıkma ve Braxton-Hicks kasılmaları yaygındır.';

  @override
  String get pregnancyNoteUnder38 =>
      'Bebek doğuma hazırlanıyor. Doğum çantası ve doğum planı için iyi bir zaman.';

  @override
  String get pregnancyNoteTerm =>
      'Term dönemindesin — doğum 37. ve 42. haftalar arasında herhangi bir zamanda olabilir; 40. hafta bir son tarih değil, ortalamadır.';

  @override
  String get pregnancyWeeklyNoteTitle => 'Bu hafta';

  @override
  String get pregnancyNeedsLmp =>
      'Takibe başlamak için son adetinin ilk gününü ekle.';

  @override
  String get pregnancyOutOfRange =>
      'Bu tarih 42 haftadan eski — güncelle ya da gebelik modunu kapat.';

  @override
  String get partnerShareTitle => 'Partnerinle özet paylaş';

  @override
  String get partnerShareBody =>
      'Kısa bir metin özeti oluşturur — mevcut evren ve tahmini pencere — ve istediğin uygulamayla sen gönderirsin. Canlı senkron ve partner hesabı yok: sen göndermedikçe hiçbir şey paylaşılmaz.';

  @override
  String get partnerShareCta => 'Özet oluştur';

  @override
  String get partnerSummaryHeader => 'Vera\'dan döngü özeti';

  @override
  String get settingsHomeThemeLabel => 'Ana sayfa arka planı';

  @override
  String get homeThemeWheat => 'Buğday';

  @override
  String get homeThemeSky => 'Gökyüzü';

  @override
  String get homeThemeField => 'Tarla';

  @override
  String get homeThemeBlossom => 'Çiçek';

  @override
  String get homeThemePlain => 'Düz';

  @override
  String get backupNudgeTitle => 'Verilerinin bir kopyasını sakla';

  @override
  String get backupNudgeBody =>
      'Her şey yalnızca bu telefonda duruyor. Telefon kaybolur, bozulur veya sıfırlanırsa geçmişin de gider — şifreli yedek bir dakika sürer ve yalnızca sen açabilirsin.';

  @override
  String get backupNudgeCta => 'Şimdi yedekle';

  @override
  String get backupNudgeDismiss => 'Sonra';

  @override
  String backupLastDone(String date) {
    return 'Son yedek: $date';
  }

  @override
  String get backupNever => 'Henüz yedek yok';

  @override
  String get settingsRemindersBackupLabel => 'Yedekleme hatırlatıcısı';

  @override
  String get reminderBackupTitle => 'Vera\'yı yedekleme zamanı';

  @override
  String get reminderBackupBody =>
      'Geçmişin yalnızca bu telefonda var. Hızlı bir şifreli yedek onu güvende tutar.';

  @override
  String get notificationChannelPeriodStart => 'Yaklaşan regl';

  @override
  String get notificationChannelPeriodEnd => 'Regl bitişi kontrolü';

  @override
  String get notificationChannelMedication => 'İlaç';

  @override
  String get notificationChannelWater => 'Su';

  @override
  String get notificationChannelAppointment => 'Randevu';

  @override
  String get notificationChannelOvulation => 'Doğurgan pencere';

  @override
  String get notificationChannelBackup => 'Yedekleme hatırlatıcısı';

  @override
  String get calendarDayDetailTitle => 'Bu gün';

  @override
  String get calendarDayNothingLogged => 'Bu gün için henüz kayıt yok';

  @override
  String get calendarDayOpenLog => 'Gün kaydını aç';

  @override
  String get cycleHistoryTitle => 'Geçmiş döngüler';

  @override
  String get cycleHistoryEmpty =>
      'Birkaç regl kaydet, döngü geçmişin burada görünsün.';

  @override
  String get cycleHistoryOngoing => 'Devam ediyor';

  @override
  String cycleHistoryLength(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days günlük döngü',
    );
    return '$_temp0';
  }

  @override
  String cycleHistoryPeriodLength(int days) {
    return 'Regl $days gün sürdü';
  }

  @override
  String cycleHistoryVsAverage(String diff) {
    return 'ortalamana göre $diff';
  }

  @override
  String get insightsCycleHistoryEntry => 'Geçmiş döngüler';

  @override
  String get homeEmptyTitle => 'Son reglinle başlayalım';

  @override
  String get homeEmptyBody =>
      'Reglin başladığı gün yukarıdaki butona dokun. İki tam döngüden sonra Vera tahmin etmeye başlayabilir — o zamana kadar biliyormuş gibi yapmaz.';

  @override
  String get homeEmptyBackdate => 'Zaten daha önce başladı';

  @override
  String get settingsAdPrivacyEntry => 'Reklam gizlilik seçenekleri';

  @override
  String a11yCycleRing(int day, int length) {
    return 'Yaklaşık $length günlük döngünün $day. günü';
  }

  @override
  String a11yChartSummary(int count, String min, String max) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count kayıtlı grafik, $min ile $max arasında',
    );
    return '$_temp0';
  }

  @override
  String a11yPhaseBar(int day, int length) {
    return 'Döngü ilerlemesi: yaklaşık $length günün $day. günü';
  }

  @override
  String a11yFrequencyItem(String label, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count kez',
    );
    return '$label: $_temp0';
  }

  @override
  String get importTitle => 'Başka uygulamadan aktar';

  @override
  String get importBody =>
      'Eski uygulamandan geçmişini CSV olarak dışa aktar, sonra dosyayı burada seç. Yalnızca tarih ve akış aktarılır — semptom ve ruh hali kelimeleri uygulamalar arasında farklıdır, Vera ne demek istediğini tahmin etmez.';

  @override
  String get importPickFile => 'CSV dosyası seç';

  @override
  String importPreview(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count günlük geçmiş bulundu',
    );
    return '$_temp0';
  }

  @override
  String importSkipped(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count satır okunamadı ve dışarıda bırakılacak',
    );
    return '$_temp0';
  }

  @override
  String get importConfirm => 'Geçmişime ekle';

  @override
  String get importMergeNote =>
      'Aktarılan günler birleştirilir. Vera\'da zaten kaydettiğin günler olduğu gibi kalır.';

  @override
  String importDone(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count gün aktarıldı',
    );
    return '$_temp0';
  }

  @override
  String get importErrorEmpty => 'Bu dosya boş görünüyor.';

  @override
  String get importErrorNoDate => 'Bu dosyada tarih sütunu bulunamadı.';

  @override
  String get settingsImportEntry => 'Başka uygulamadan aktar';

  @override
  String get settingsHealthSyncLabel =>
      'Apple Health / Health Connect\'e aktar';

  @override
  String get settingsHealthSyncBody =>
      'Telefonunun sağlık uygulamasına yalnızca regl akışı, kilo ve bazal sıcaklık yazar. Semptomlar, ruh hali ve notlar Vera\'da kalır. Hiçbir şey geri okunmaz.';

  @override
  String healthSyncBackfilled(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count gün sağlık uygulamana gönderildi',
    );
    return '$_temp0';
  }

  @override
  String get healthSyncDenied => 'İzin verilmedi, aktarım kapalı kalıyor.';

  @override
  String get settingsDiagnosticsEntry => 'Tanılama';

  @override
  String get diagnosticsBody =>
      'Uygulama hata verirse teknik ayrıntılar burada kaydedilir — yalnızca bu cihazda. Sen göndermeyi seçmedikçe hiçbir yere gitmez ve göndereceğin şeyi önce olduğu gibi okuyabilirsin.';

  @override
  String get diagnosticsEmpty =>
      'Kayıt yok — herhangi bir sorun tespit edilmedi.';

  @override
  String get diagnosticsShare => 'Geliştiriciye gönder';

  @override
  String get diagnosticsClear => 'Temizle';

  @override
  String get diagnosticsNoteLabel => 'Ne oldu? (isteğe bağlı)';

  @override
  String get diagnosticsTechnicalDetail => 'Teknik ayrıntı';

  @override
  String get unitHoursShort => 'sa';

  @override
  String get unitMinutesShort => 'dk';

  @override
  String get unitHoursLong => 'saat';

  @override
  String get unitMinutesLong => 'dakika';

  @override
  String get unitMilliliters => 'ml';

  @override
  String get unitKilograms => 'kg';

  @override
  String get calendarJumpTitle => 'Aya git';

  @override
  String get calendarJumpYearLabel => 'Yıl';

  @override
  String get settingsAdPrivacyUnavailable =>
      'Bölgende reklam kişiselleştirme seçeneği sunulmuyor — buradaki reklamlar zaten kişiselleştirilmiyor.';

  @override
  String get settingsGroupAppearance => 'Görünüm';

  @override
  String get settingsGroupTracking => 'Takip tercihleri';

  @override
  String get dayLogCustomTagsLabel => 'Kendi takiplerim';

  @override
  String get customTagAddButton => 'Takip ekle';

  @override
  String get customTagDialogTitle => 'Yeni takip';

  @override
  String get customTagDialogHint => 'örn. migren, spor, uykusuzluk';

  @override
  String get customTagManageEntry => 'Takiplerimi yönet';

  @override
  String get customTagRenameTitle => 'Takibi yeniden adlandır';

  @override
  String get customTagDeleteTitle => 'Bu takip silinsin mi?';

  @override
  String get customTagDeleteBody =>
      'Kullandığın bütün günlerden kaldırılacak. Diğer kayıtların olduğu gibi kalır.';

  @override
  String get customTagEmpty => 'Henüz kendi takibin yok.';

  @override
  String get premiumLockedTitle => 'Premium özellik';

  @override
  String get premiumLockedAction => 'Premium\'a bak';

  @override
  String get premiumBenefitCustomTrackers =>
      'Kendi kelimelerinle, istediğin her şeyi takip et';

  @override
  String get premiumBenefitAdvancedInsights =>
      'Gelişmiş içgörüler: ne zaman ne oluyor';

  @override
  String get premiumBenefitPersonalisation =>
      'Ek arka planlar ve yol arkadaşları';

  @override
  String get premiumBenefitAdvancedReminders =>
      'Kendi düzenine göre hatırlatıcılar';

  @override
  String get advancedInsightsTitle => 'Gelişmiş içgörüler';

  @override
  String get advancedInsightsEntry => 'Gelişmiş içgörüler';

  @override
  String get advancedInsightsNotEnough =>
      'Üç tam döngü kaydettiğinde desenlerin burada görünecek. Daha azında \"desen\" dediğimiz şey tesadüften ibaret olurdu.';

  @override
  String get advancedInsightsPatternsTitle => 'Neyin ne zaman çıktığı';

  @override
  String advancedInsightsPatternLine(String label, String segment) {
    return '$label — en çok $segment';
  }

  @override
  String advancedInsightsPatternDetail(int count, int day) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count gün kaydedildi, döngünün yaklaşık $day. günü',
    );
    return '$_temp0';
  }

  @override
  String advancedInsightsNoPattern(String label) {
    return '$label — henüz belirgin bir zamanlaması yok';
  }

  @override
  String get advancedInsightsTrendTitle => 'Zaman içinde döngü uzunluğu';

  @override
  String advancedInsightsDriftLonger(String days, String cycles) {
    return 'İlk $cycles döngünle son $cycles döngünü karşılaştırdığımızda, son döngülerin yaklaşık $days gün daha uzun.';
  }

  @override
  String advancedInsightsDriftShorter(String days, String cycles) {
    return 'İlk $cycles döngünle son $cycles döngünü karşılaştırdığımızda, son döngülerin yaklaşık $days gün daha kısa.';
  }

  @override
  String advancedInsightsDriftStable(String cycles) {
    return 'İlk $cycles döngünle son $cycles döngünü karşılaştırdığımızda, döngü uzunluğun aşağı yukarı aynı kalmış.';
  }

  @override
  String get advancedInsightsDriftNotEnough =>
      'Altı tam döngü biriktiğinde ilk döngülerinle son döngülerini karşılaştırıp döngü uzunluğunun değişip değişmediğini söyleyebiliriz.';

  @override
  String get advancedInsightsMoodTitle => 'Döngünün bölümüne göre ruh hali';

  @override
  String get advancedInsightsDisclaimer =>
      'Bunlar yalnızca senin kaydettiklerinin sayımı. Tanı değildir ve buradaki bir desen bir neden değildir.';

  @override
  String get segmentPeriod => 'regl sırasında';

  @override
  String get segmentAfterPeriod => 'regl sonrasında';

  @override
  String get segmentMidCycle => 'döngü ortasında';

  @override
  String get segmentBeforePeriod => 'regl öncesinde';

  @override
  String get customRemindersEntry => 'Kendi hatırlatıcılarım';

  @override
  String get customRemindersTitle => 'Kendi hatırlatıcılarım';

  @override
  String get customRemindersEmpty => 'Henüz kendi hatırlatıcın yok.';

  @override
  String get customRemindersAdd => 'Hatırlatıcı ekle';

  @override
  String get customReminderLabelHint => 'örn. hapımı al, su iç';

  @override
  String get customReminderLockScreenNote =>
      'Hatırlatıcı metni kilit ekranında görünür; ne kadar mahrem olmasını istiyorsan ona göre yaz.';

  @override
  String get customReminderDelete => 'Hatırlatıcıyı sil';

  @override
  String get homeThemeDusk => 'Alacakaranlık';

  @override
  String get homeThemeMeadow => 'Çayır';

  @override
  String get homeThemePetal => 'Taçyaprak';

  @override
  String get homeThemeBloom => 'Çiçeklenme';

  @override
  String get mascotStar => 'Yıldız';

  @override
  String get mascotLeaf => 'Yaprak';

  @override
  String get tipDetailWhatsHappening => 'Şu an bedeninde ne oluyor?';

  @override
  String get tipDetailDisclaimer =>
      'Bunlar genel bilgilerdir, sana özel tıbbi tavsiye değildir. Her beden farklı tepki verir; kendini nasıl hissettiğin, buradaki herhangi bir öneriden daha önemlidir. Bir şey seni endişelendiriyorsa bir sağlık profesyoneline danış.';

  @override
  String get phaseExplainerMenstrual =>
      'Rahim iç zarı döküldüğü için kanama yaşıyorsun. Östrojen ve progesteron döngünün en düşük seviyesinde; birçok kişi bu yüzden ilk günlerde daha yorgun ve daha içe dönük hisseder. Kanama genellikle üç ila yedi gün sürer ve en yoğun hâli başlangıçtadır. Kramplar rahmin kasılmasından kaynaklanır; bunu tetikleyen şey, iç zar dökülürken salınan prostaglandinlerdir — bazı kişilerde aynı anda bel ağrısı veya bağırsak düzensizliği görülmesinin sebebi de budur. Kanamayla birlikte demir kaybı da olur ve bu, bitkinliğin bir kısmını açıklar. Sıcak uygulama, hareket ve uyku genelde iyi gelir. Ancak koruman saat başı tamamen doluyorsa, kanama bir haftayı belirgin şekilde aşıyorsa ya da ağrı günlük işlerini yapmanı engelliyorsa, bunu geçmesini beklemek yerine bir hekime danışmak doğru olur.';

  @override
  String get phaseExplainerFollicular =>
      'Kanama bittikten sonra östrojen yeniden yükselmeye başlar. Yumurtalıklarda her biri bir yumurta taşıyan bir grup folikül olgunlaşır ve genellikle yalnızca biri çatlayarak yumurtayı bırakır. Östrojen, yeni dökülen rahim iç zarını yeniden inşa eder; çoğu kişi bununla birlikte enerjisinin, ruh halinin, cildinin ve dayanıklılığının toparlandığını fark eder. Bu evre aynı zamanda döngünün kişiden kişiye ve aydan aya en çok değişen bölümüdür — stres, hastalık, seyahat ve uykusuzluk kendini genellikle burada, bu evreyi uzatarak ya da kısaltarak gösterir. Tahminin tek bir gün değil bir aralık olmasının dürüst sebebi de budur: döngünün ikinci yarısı görece sabittir, oynayan taraf bu yarısıdır.';

  @override
  String get phaseExplainerFertile =>
      'Östrojen zirveye yaklaşıyor ve ovülasyon bu günlerde bekleniyor. Lüteinleştirici hormondaki ani yükseliş, yaklaşık bir ila bir buçuk gün sonra yumurtanın salınmasını tetikler. Yumurtanın kendisi yaklaşık 12-24 saat canlı kalır; ancak sperm, uygun servikal mukus içinde birkaç gün yaşayabilir — pencerenin tek bir gün değil birkaç gün olarak sayılmasının sebebi budur. Mukus tipik olarak berrak, esneyen ve kaygan bir hâl alır, biraz çiğ yumurta akına benzer; bazı kişilerde libido artar, göğüslerde hassasiyet olur ya da folikül çatlarken tek taraflı kısa bir sancı hissedilir. Enerji genelde döngünün en yüksek noktasındadır. Bu pencerenin, senin kendi kayıtlarından üretilmiş bir tahmin olduğunu unutma: bir ölçüm değildir ve gebelikten korunma yöntemi olarak kullanılamaz.';

  @override
  String get phaseExplainerLuteal =>
      'Ovülasyondan sonra boşalan folikül korpus luteuma dönüşür ve progesteron üretmeye başlar; bu hormon, olası bir gebelik yerleşecek olursa diye rahim iç zarını korur. Yerleşme olmazsa progesteron ve östrojen hızla düşer ve reglin başlar. Döngünün bu yarısı daha tutarlı olanıdır, genellikle 12-14 gün sürer. Progesteron dinlenme hâlindeki vücut ısını hafifçe yükseltir — bazal termometrenin yakaladığı değişim budur — ve sindirimi yavaşlatabilir; şişkinliğin bir kısmı buradan gelir. Sonundaki ani düşüş ise birçok kişide PMS belirtilerini tetikler: göğüs hassasiyeti, iştah değişimi, uyku bölünmesi, baş ağrısı ve ruh hali dalgalanmaları. Bunlar tipik olarak kanama başlayınca hafifler. Belirtiler çoğu ay işini veya ilişkilerini aksatacak kadar şiddetliyse, bunu bir hekimle konuşmakta fayda var.';

  @override
  String get phaseExplainerUnknown =>
      'Şu an hangi evrede olduğunu söyleyebilmek için yeterli kaydın yok. Vera\'nın kendi ortalamanı ve değişkenliğini hesaplayabilmesi için en az iki tam döngü gerekiyor — bir regl başlangıcı ve ardından bir sonraki. Uydurulmuş bir evre göstermektense bunu açıkça söylemeyi tercih ediyor. Bu arada hiçbir şey boşa gitmiyor: kaydettiğin her gün o ilk hesabın parçası oluyor ve geçmişin uzadıkça tahmin aralığı daralıyor. O zamana kadar aşağıdaki öneriler, döngünün her noktasında geçerli olan genel önerilerdir.';

  @override
  String get tipFitnessDetailMenstrual =>
      'İlk günlerde ağır antrenman çoğu kişiye iyi gelmez; bu bir disiplin meselesi değil, enerjinin gerçekten düşük olmasıdır. Üstelik kanamayla giden demir, dayanıklılık çalışmalarını geçen haftaki aynı seansa göre daha zor hissettirir. Yürüyüş, hafif esneme, onarıcı yoga ve nefes çalışması hem kan akışını artırır hem de kramp algısını azaltabilir; bazı kişilerde ayın tamamına yayılmış düzenli hareket, o gün yapılan her şeyden daha çok fayda sağlar. Kendini iyi hissediyorsan ağır çalışmaktan kaçınman için bir sebep yok — kanama spor yapmana engel değildir ve pek çok sporcu bu günlerde yarışır. Birkaç pratik not: yoğun kanama günlerinde uzun ve zorlu seanslar yorgunluğu artırabilir; başlamadan önce karın alt bölgesine sıcak uygulamak hareketi rahatlatır; her zamankinden biraz fazla su içmek bu günlerin baş ağrısına iyi gelir. Seansı, en iyi haftanla değil, o an nasıl hissettiğinle ölç.';

  @override
  String get tipFitnessDetailFollicular =>
      'Östrojen yükselirken çoğu kişi kendini daha güçlü ve daha dayanıklı hisseder; yeni bir şeye başlamak, ağırlığı artırmak veya tempoyu yükseltmek için döngünün en uygun dönemi genellikle burasıdır. Kas onarımı bu evrede görece verimlidir, bu yüzden zor seanslar daha iyi sindirilir ve arkasında daha az kalıcı ağrı bırakır. Sadece güç değil, açık zihin de isteyen işler için iyi bir pencere: yeni bir hareketi öğrenmek, tekniği düzeltmek ya da daha önce yapmadığın bir mesafeyi denemek. İki uyarıyı akılda tutmakta fayda var: artışı kademeli tut — enerjinin yüksek olması sakatlanma riskinin sıfır olduğu anlamına gelmez ve aşırı kullanım sakatlıklarının çoğu kötü değil iyi bir haftada başlar. Bir de uykunu koru; gelişme seansın kendisinde değil, toparlanma sırasında olur.';

  @override
  String get tipFitnessDetailFertile =>
      'Enerji ve motivasyon genelde zirvededir, bu yüzden zorlu antrenmanlar bu günlerde iyi oturur — kişisel rekorlar çoğu zaman buraya denk gelir. Bazı araştırmalar ovülasyon çevresinde eklem gevşekliğinin biraz arttığını gösteriyor; pratikteki etkisi tartışmalı olsa da, ani yön değiştiren, sıçrama ve iniş içeren sporlarda ısınmaya biraz daha vakit ayırmak ucuza alınmış bir önlem. Vücut ısın döngünün ikinci yarısına kıyasla hâlâ düşük olduğundan, sıcak birkaç hafta sonra olacağı kadar sınırlayıcı değildir. Ovülasyon sırasında karnın bir tarafında hissedilen kısa sancı yaygındır ve genelde saatler içinde geçer. Ancak ağrı şiddetliyse, tek taraflı ve ısrarlıysa, ateş eşlik ediyorsa veya baygınlık hissi varsa, antrenmanı sürdürmek yerine dur ve kontrol ettir.';

  @override
  String get tipFitnessDetailLuteal =>
      'Regl yaklaşırken enerji düşebilir, nabız aynı efora daha yüksek çıkabilir ve toparlanma uzayabilir. Bu bir gerileme değil, beklenen bir dalgalanmadır ve son iki haftanın kazanımlarını silmez. Progesteron dinlenme ısını hafifçe yükseltir ve ısı atmayı zorlaştırır; bu yüzden sıcak veya nemli ortamdaki seanslar bu evrede orantısız zor gelir — günün daha serin saatlerine kaydırmak ve gerekli hissettiğinden fazla su içmek işe yarar. Orta şiddetli çalışmalar, kuvvet antrenmanının biraz hafifletilmiş hâli ve yürüyüş genelde daha sürdürülebilir. Şişkinlik ve göğüs hassasiyeti varsa iyi bir destek sutyeni ve daha uzun ısınma farkı hissettirir. Ruh halin düşükse seansı tamamen iptal etmek yerine kısa ve kolay tut — sayılması için gereken eşik, hissettirdiğinden daha düşüktür.';

  @override
  String get tipFitnessDetailUnknown =>
      'Evreni bilmesek de hareket her dönemde işe yarar: genel öneri, haftanın çoğu gününe yayılmış yaklaşık 150 dakika orta tempolu hareket ve haftada iki kez kuvvetlendirme çalışmasıdır — bu düzen, neredeyse herkes için ara sıra yapılan çok yoğun antrenmandan daha iyi sonuç verir. Süreklilik şiddetten daha önemlidir ve en iyi seans, gelecek hafta gerçekten tekrarlayacağın seanstır. Kendini nasıl hissettiğine göre ayarla: yorgun olduğun günlerde yürüyüş de sayılır ve yapılmış kısa bir seans, atlanmış uzun bir seanstan değerlidir. Birkaç döngü kaydettikten sonra burada kendi evrene özel öneriler göreceksin.';

  @override
  String get tipNutritionDetailMenstrual =>
      'Kanamayla birlikte demir kaybedersin; kırmızı et, mercimek, nohut, koyu yeşil yapraklılar ve pekmez bu kaybı karşılamaya yardımcı olur. Bitkisel demirin emilimi C vitaminiyle birlikte alındığında belirgin artar — mercimek yemeğinin yanına limon sıkmak bunun en pratik hâli; yanına bir domates salatası da aynı işi görür. Çay ve kahveyi yemekle aynı anda içmek, içerdikleri tanenler yüzünden demir emilimini azaltır; aralarında bir saat bırakmak yeterli, ikisinden de vazgeçmen gerekmiyor. Bol su içmek kanamanın getirdiği yorgunluğu ve baş ağrısını hafifletebilir; kuruyemiş, tohumlar ve koyu yeşillikler gibi magnezyumdan zengin gıdalar da bazı kişilerde krampları azaltır. Sindirimin ağırlaştığı günlerde küçük ve sık öğünler, büyük öğünlerden daha rahat oturur. Regl dönemlerinde sık sık nefes darlığı, baş dönmesi veya olağandışı bir bitkinlik yaşıyorsan bunu bir hekime söylemekte fayda var — demir düşüklüğü yaygındır, testi kolaydır ve bir uygulamanın teşhis edeceği bir şey değildir.';

  @override
  String get tipNutritionDetailFollicular =>
      'Enerjinin toparlandığı bu dönemde beden yeniden inşa modundadır: yeterli protein, tam tahıl ve sebze bu toparlanmayı destekler ve iştahın genelde en dengeli, en kolay yönetilir olduğu evre burasıdır. Kanama sonrası demir depolarını doldurmaya devam etmek de mantıklıdır; bunu yalnızca regl haftasının işi gibi görmemek gerekir, çünkü depolar günler içinde değil haftalar içinde dolar. Öğün atlamamak bu evrede genellikle daha kolaydır ve bir sonraki evrede iştahın dalgalandığı günlere daha dengeli girmeni sağlar. Beslenme düzeninde bir değişiklik yapacaksan, başlamak için genelde bu dönem, isteklerin ve düşük ruh halinin her yeni alışkanlığı olduğundan zor gösterdiği regl öncesi haftadan daha elverişlidir.';

  @override
  String get tipNutritionDetailFertile =>
      'Bu günlerde özel bir diyet gerekmez; dengeli beslenme ve yeterli su en çok işe yarayan şeydir. Bazı kişilerde ovülasyon çevresinde şişkinlik hissi olur; bu genelde yediğin bir şeyden değil, hormonaldir ve geçicidir. İştah kimilerinde biraz azalır, kimilerinde artar — ikisi de olağandır. Öğünlerde protein ve lifi korumak, ayın çoğu zaman en yoğun ve en hareketli geçen bu bölümünde enerjini dengede tutar. Gebelik planlıyorsan folik asit konusunda hekimine danışmak için doğru zaman burasıdır; folik asit genellikle gebelik oluştuktan sonra değil öncesinde önerilir — ama bu, uygulamanın verebileceği bir tavsiye değil, hekiminle konuşulacak bir konudur.';

  @override
  String get tipNutritionDetailLuteal =>
      'Progesteron yükselirken iştahın artması ve tatlı isteği çok yaygındır; bu bir irade meselesi değil, hormonal bir değişimdir ve bedenin bu evrede gerçekten biraz daha fazla enerji harcar. Öğünlere protein ve lif eklemek kan şekerini daha dengeli tutar ve isteği, onu görmezden gelmeye çalışmaktan çok daha etkili biçimde yumuşatır — doyurucu bir şeyle karşılanan istek, bir saat direnilen istekten genelde daha erken biter. Tuzu azaltmak ve suyu artırmak şişkinliği hafifletebilir; kulağa ters gelse de doğrudur, çünkü yeterli su alınca beden daha az tutma eğiliminde olur. Magnezyumdan zengin gıdalar (badem, ceviz, koyu yeşillikler, bitter çikolata) bazı kişilerde kramp ve gerginliği azaltır. Kafeini öğleden sonra kısmak bu dönemde bölünen uykuya iyi gelir; alkole de dikkat etmekte fayda var, çünkü uykunun zaten hafiflediği bir evrede uykuyu daha da parçalıyor.';

  @override
  String get tipNutritionDetailUnknown =>
      'Evreden bağımsız olarak en çok işe yarayan şeyler aynı: düzenli öğünler, yeterli protein, bol sebze, yeterli su ve demir açısından zengin gıdalar. Regl döneminde demir kaybı arttığı için o günlerde biraz daha dikkat etmek yeterli; ayın her haftası için ayrı bir beslenme düzenine gerek yok. Enerjinin dengeli kalmasında, öğünleri kabaca aynı saatlerde yemek, tek tek besinlerin hepsinden daha çok işe yarar ve sağlıklı bir döngü için hiçbir gıdayı hayatından çıkarman gerekmez. Birkaç döngü kaydettikten sonra burada kendi evrene özel öneriler göreceksin.';
}
