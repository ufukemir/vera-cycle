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
      'Verilerin sadece bu cihazda kalır. Hesap yok, bulut yok, hiçbir yere bir şey gönderilmiyor — uygulamanın internet kullanma izni bile yok, bunu telefonunun ayarlarından kendin kontrol edebilirsin.';

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
  String insightsVariabilityLabel(String days) {
    return 'Yaklaşık $days gün değişkenlik';
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
  String get privacyScreenStorage =>
      'Kaydettiğin her şey şifrelenir ve sadece bu cihazda, tek bir dosyada saklanır. Şifreleme anahtarı telefonunun güvenli donanımında yaşar — iOS\'ta Keychain, Android\'de Keystore — dosyanın kendisinde değil.';

  @override
  String get privacyScreenNoNetwork =>
      'Bu uygulamanın sunucusu yok. İnternet kullanma izni bile yok — bunu telefonunun uygulama ayarlarından kendin kontrol edebilirsin.';

  @override
  String get privacyScreenNoThirdParty =>
      'Analitik yok, çökme raporlama yok, reklam yok ve hiçbir türde üçüncü taraf SDK\'sı yok.';

  @override
  String get privacyScreenExport =>
      'Verinin bu cihazdan çıkmasının tek yolu kendin dışa aktarmandır, o dışa aktarma da sadece senin bildiğin bir parolayla şifrelenir.';

  @override
  String get privacyScreenDelete =>
      'Verini silmek gerçek ve anındadır. Hesap ve bizim tarafımızda bir yedek olmadığı için — bir kere gidince gider.';

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
}
