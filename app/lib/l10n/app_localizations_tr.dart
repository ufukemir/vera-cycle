// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Turkish (`tr`).
class AppLocalizationsTr extends AppLocalizations {
  AppLocalizationsTr([String locale = 'tr']) : super(locale);

  @override
  String get appTitle => 'Cycle';

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
  String get settingsLanguageEnglish => 'English';

  @override
  String get settingsLanguageTurkish => 'Türkçe';

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
  String get exportInvalidFile => 'Bu dosya bir Cycle yedeği gibi görünmüyor';

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
      'Cycle tarafından kullanıcı tarafından girilen verilerden oluşturuldu. Tıbbi bir teşhis değildir.';

  @override
  String get doctorReportGeneratedOn => 'Oluşturulma tarihi';

  @override
  String get doctorReportSummaryHeading => 'Özet';

  @override
  String get doctorReportDailyLogHeading => 'Günlük kayıt';

  @override
  String get doctorReportColumnDate => 'Tarih';
}
