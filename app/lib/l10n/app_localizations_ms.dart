// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Malay (`ms`).
class AppLocalizationsMs extends AppLocalizations {
  AppLocalizationsMs([String locale = 'ms']) : super(locale);

  @override
  String get appTitle => 'Vera';

  @override
  String get actionSkip => 'Langkau';

  @override
  String get actionContinue => 'Teruskan';

  @override
  String get actionDone => 'Selesai';

  @override
  String get actionCancel => 'Batal';

  @override
  String get actionClear => 'Kosongkan';

  @override
  String get actionDelete => 'Padam';

  @override
  String get actionEnable => 'Hidupkan';

  @override
  String get commonIDontKnow => 'Saya tidak tahu';

  @override
  String get commonYes => 'Ya';

  @override
  String get commonNo => 'Tidak';

  @override
  String get commonNotSure => 'Tidak pasti';

  @override
  String get pinSetupTitle => 'Sediakan PIN';

  @override
  String get pinSetupEnterPrompt => 'Pilih PIN 6 digit untuk mengunci aplikasi';

  @override
  String get pinSetupConfirmPrompt => 'Masukkan sekali lagi untuk mengesahkan';

  @override
  String get pinSetupMismatch => 'Kedua-duanya tidak sepadan — mari cuba lagi';

  @override
  String get pinSetupBiometricTitle => 'Buka lebih pantas?';

  @override
  String get pinSetupBiometricBody =>
      'Anda juga boleh menggunakan cap jari atau wajah untuk membuka kunci — PIN anda masih berfungsi sebagai sandaran.';

  @override
  String get lockScreenTitle => 'Berkunci';

  @override
  String get lockScreenEnterPin => 'Masukkan PIN anda';

  @override
  String get lockScreenWrongPin => 'PIN itu tidak sepadan';

  @override
  String get lockScreenUseBiometrics => 'Guna biometrik';

  @override
  String get lockScreenUseFaceId => 'Guna Face ID';

  @override
  String get lockScreenUseFingerprint => 'Guna cap jari';

  @override
  String get lockScreenForgotPin => 'Lupa PIN anda?';

  @override
  String get lockScreenForgotPinChoiceTitle =>
      'Bagaimana anda mahu menetapkannya semula?';

  @override
  String get lockScreenResetViaDevice => 'Sahkan dengan peranti ini';

  @override
  String get lockScreenResetViaDeviceBody =>
      'Data anda kekal. Cukup sahkan dengan kunci telefon anda sendiri — Face ID, cap jari atau kod laluan.';

  @override
  String get lockScreenResetViaDeviceReason =>
      'Sahkan untuk menetapkan PIN baharu';

  @override
  String lockScreenThrottled(int seconds) {
    return 'Terlalu banyak percubaan. Cuba lagi dalam $seconds saat';
  }

  @override
  String get lockScreenEraseTitle => 'Padam semua data?';

  @override
  String get lockScreenEraseBody =>
      'Ini memadam segala-galanya pada peranti ini secara kekal. Tiada akaun dan tiada sandaran pelayan, jadi tindakan ini tidak boleh dibatalkan.';

  @override
  String get lockScreenEraseConfirm => 'Padam segala-galanya';

  @override
  String get onboardingPrivacyTitle => 'Selamat datang';

  @override
  String get onboardingPrivacyBody =>
      'Data kitaran anda kekal pada peranti ini sahaja, disulitkan. Tiada akaun dan tiada penyegerakan awan — tiada apa-apa yang anda catat dimuat naik. Kuncinya berada dalam perkakasan selamat telefon anda, dan anda boleh mengeksport atau memadam segala-galanya bila-bila masa.';

  @override
  String get onboardingLastPeriodTitle => 'Bilakah haid terakhir anda bermula?';

  @override
  String get onboardingLastPeriodBody =>
      'Ini membantu kami bermula — anda sentiasa boleh membetulkannya kemudian melalui kalendar.';

  @override
  String get onboardingPickDate => 'Pilih tarikh';

  @override
  String get onboardingCycleLengthTitle =>
      'Berapa panjang kitaran anda, biasanya?';

  @override
  String get onboardingCycleLengthBody =>
      'Anggaran kasar sudah memadai. Kami akan mula memberi anggaran sebenar sebaik sahaja kami melihat beberapa kitaran penuh.';

  @override
  String get onboardingPeriodLengthTitle =>
      'Berapa hari haid anda biasanya berlangsung?';

  @override
  String get onboardingPeriodLengthBody =>
      'Kami akan menggunakannya untuk mengisi haid terakhir anda supaya anda tidak bermula dari kosong.';

  @override
  String get onboardingDaysUnit => 'hari';

  @override
  String get onboardingGoalTitle => 'Apa yang membawa anda ke sini?';

  @override
  String get onboardingGoalBody =>
      'Ini cuma membantu kami menunjukkan perkara yang sesuai terlebih dahulu — anda boleh menukar fikiran bila-bila masa dalam Tetapan.';

  @override
  String get goalTrackPeriod => 'Menjejaki haid saya';

  @override
  String get goalTryingToConceive => 'Sedang cuba untuk hamil';

  @override
  String get goalPregnancyTracking => 'Menjejaki kehamilan';

  @override
  String get onboardingRegularityTitle => 'Adakah haid anda biasanya teratur?';

  @override
  String get onboardingRegularityBody =>
      'Tiada jawapan yang salah di sini — ini cuma membantu kami mengenali badan anda sedikit.';

  @override
  String get onboardingCrampsTitle =>
      'Adakah anda biasanya mengalami senggugut?';

  @override
  String get onboardingCrampsBody =>
      'Kami akan pastikan mudah untuk mencatat perasaan anda pada hari-hari seperti itu.';

  @override
  String get onboardingBirthYearTitle => 'Tahun berapa anda dilahirkan?';

  @override
  String get onboardingBirthYearBody =>
      'Hanya untuk gambaran yang lebih lengkap — tidak pernah digunakan untuk sebarang ramalan.';

  @override
  String get onboardingPmsTitle =>
      'Adakah sesuatu biasanya muncul sebelum itu?';

  @override
  String get onboardingPmsBody =>
      'Pilih seberapa banyak yang sesuai. Tidak disimpan di mana-mana, tiada jawapan salah.';

  @override
  String get onboardingNotificationTitle => 'Mahukan peringatan yang lembut?';

  @override
  String get onboardingNotificationBody =>
      'Kami boleh mengingatkan anda sebelum haid anda dijangka tiba.';

  @override
  String get onboardingNotificationMockTitle =>
      'Haid anda mungkin bermula tidak lama lagi';

  @override
  String get onboardingNotificationMockBody =>
      'Berdasarkan kitaran yang anda catat';

  @override
  String get onboardingNotificationAllow => 'Hidupkan peringatan';

  @override
  String get onboardingNotificationNotNow => 'Bukan sekarang';

  @override
  String get onboardingBuildingPlanTitle =>
      'Sedang menyediakan semuanya untuk anda';

  @override
  String get onboardingBuildingPlanStep1 =>
      'Melindungi data anda pada peranti ini';

  @override
  String get onboardingBuildingPlanStep2 => 'Menyimpan keutamaan anda';

  @override
  String get onboardingBuildingPlanStep3 => 'Menyediakan kalendar anda';

  @override
  String get onboardingBuildingPlanDone => 'Semuanya sedia';

  @override
  String get navHome => 'Utama';

  @override
  String get navCalendar => 'Kalendar';

  @override
  String get navInsights => 'Cerapan';

  @override
  String get navSettings => 'Tetapan';

  @override
  String get navReminders => 'Peringatan';

  @override
  String get navProfile => 'Profil';

  @override
  String get navTrack => 'Jejak';

  @override
  String homeCycleDayLabel(int day) {
    return 'Hari ke-$day';
  }

  @override
  String get homeNoCycleYet => 'Belum ada haid dicatat';

  @override
  String get homePhaseMenstrual => 'Haid';

  @override
  String get homePhaseFollicular => 'Fasa folikular';

  @override
  String get homePhaseFertileWindow => 'Anggaran tempoh subur';

  @override
  String get homePhaseLuteal => 'Fasa luteal';

  @override
  String get homePhaseUnknown => 'Data terkini tidak mencukupi';

  @override
  String get homePredictionInsufficientTitle => 'Data belum mencukupi';

  @override
  String get homePredictionInsufficientBody =>
      'Catat haid anda yang seterusnya dan kami akan mula membuat anggaran.';

  @override
  String homePredictionRangeLabel(String start, String end) {
    return '$start – $end';
  }

  @override
  String get homeConfidenceHigh => 'Keyakinan tinggi';

  @override
  String get homeConfidenceMedium => 'Keyakinan sederhana';

  @override
  String get homeConfidenceLow => 'Keyakinan rendah';

  @override
  String get homeIrregularNote =>
      'Panjang kitaran anda berubah-ubah lebih daripada biasa kebelakangan ini. Jika ini sesuatu yang baharu bagi anda, mungkin berbaloi disebut semasa pemeriksaan kesihatan.';

  @override
  String get homeFertileWindowDisclaimer =>
      'Berdasarkan masa kitaran yang lazim — bukan kaedah pencegahan kehamilan.';

  @override
  String get homePeriodStartedButton => 'Haid bermula hari ini';

  @override
  String get homePeriodStartedSnackbar => 'Dicatat — haid bermula hari ini';

  @override
  String get actionUndo => 'Buat asal';

  @override
  String get comingSoon => 'Akan datang';

  @override
  String get dayLogFlowLabel => 'Aliran';

  @override
  String get flowSpotting => 'Bercak darah';

  @override
  String get flowLight => 'Ringan';

  @override
  String get flowMedium => 'Sederhana';

  @override
  String get flowHeavy => 'Berat';

  @override
  String get flowNone => 'Tiada';

  @override
  String get dayLogSymptomsLabel => 'Simptom';

  @override
  String get symptomCramps => 'Senggugut';

  @override
  String get symptomHeadache => 'Sakit kepala';

  @override
  String get symptomBloating => 'Kembung perut';

  @override
  String get symptomBreastTenderness => 'Payudara sakit';

  @override
  String get symptomAcne => 'Jerawat';

  @override
  String get symptomFatigue => 'Keletihan';

  @override
  String get symptomNausea => 'Loya';

  @override
  String get symptomBackPain => 'Sakit belakang';

  @override
  String get symptomAppetiteChange => 'Perubahan selera makan';

  @override
  String get symptomSleepTrouble => 'Sukar tidur';

  @override
  String get symptomPelvicPain => 'Sakit pelvis';

  @override
  String get symptomDizziness => 'Pening';

  @override
  String get symptomMigraine => 'Migrain';

  @override
  String get symptomHighFever => 'Demam tinggi';

  @override
  String get symptomNeckPain => 'Sakit leher';

  @override
  String get symptomShoulderPain => 'Sakit bahu';

  @override
  String get symptomLimbPain => 'Sakit anggota badan';

  @override
  String get symptomMuscleAche => 'Sakit otot';

  @override
  String get symptomChills => 'Menggigil';

  @override
  String get symptomNightSweats => 'Peluh malam';

  @override
  String get symptomHotFlashes => 'Rasa panas mendadak';

  @override
  String get symptomWeightGain => 'Kenaikan berat badan';

  @override
  String get symptomConstipation => 'Sembelit';

  @override
  String get symptomDiarrhea => 'Cirit-birit';

  @override
  String get symptomIndigestion => 'Gangguan pencernaan';

  @override
  String get symptomGasPain => 'Sakit gas';

  @override
  String get symptomFeelingUnwell => 'Rasa tidak sihat';

  @override
  String get symptomItching => 'Gatal';

  @override
  String get symptomTroubleFocusing => 'Sukar fokus';

  @override
  String get symptomForgetfulness => 'Mudah lupa';

  @override
  String get symptomGroupHead => 'Kepala';

  @override
  String get symptomGroupBody => 'Badan';

  @override
  String get symptomGroupAbdomen => 'Perut';

  @override
  String get symptomGroupGeneral => 'Umum';

  @override
  String get symptomGroupCognitive => 'Kognitif';

  @override
  String get dayLogMoodLabel => 'Mood';

  @override
  String get moodCalm => 'Tenang';

  @override
  String get moodAnxious => 'Cemas';

  @override
  String get moodIrritable => 'Mudah marah';

  @override
  String get moodLow => 'Lesu';

  @override
  String get moodEnergetic => 'Bertenaga';

  @override
  String get moodHappy => 'Gembira';

  @override
  String get moodContent => 'Puas hati';

  @override
  String get moodSad => 'Sedih';

  @override
  String get moodDepressed => 'Murung';

  @override
  String get moodEmotional => 'Sensitif';

  @override
  String get moodExcited => 'Teruja';

  @override
  String get moodHopeful => 'Penuh harapan';

  @override
  String get moodProud => 'Bangga';

  @override
  String get moodDisappointed => 'Kecewa';

  @override
  String get moodConfident => 'Yakin';

  @override
  String get moodSurprised => 'Terkejut';

  @override
  String get moodIndifferent => 'Tidak peduli';

  @override
  String get moodPeaceful => 'Tenang';

  @override
  String get moodInLove => 'Bercinta';

  @override
  String get moodShy => 'Malu';

  @override
  String get moodPlayful => 'Suka bergurau';

  @override
  String get moodExhausted => 'Keletihan';

  @override
  String get moodLonely => 'Kesunyian';

  @override
  String get moodOverwhelmed => 'Terbeban';

  @override
  String get moodGrateful => 'Bersyukur';

  @override
  String get moodNostalgic => 'Nostalgia';

  @override
  String get dayLogNoteLabel => 'Nota';

  @override
  String get dayLogNoteHint => 'Apa-apa yang anda mahu ingat tentang hari ini';

  @override
  String get dayLogOptionalTrackersLabel => 'Penjejak pilihan';

  @override
  String get dayLogSexualActivityLabel => 'Aktiviti seksual';

  @override
  String get sexLifeNone => 'Tiada';

  @override
  String get sexLifeUnprotected => 'Seks tanpa perlindungan';

  @override
  String get sexLifeProtected => 'Seks berperlindungan';

  @override
  String get sexLifeMasturbation => 'Melancap';

  @override
  String get sexLifeNoOrgasm => 'Tiada orgasme';

  @override
  String get sexLifeOrgasm => 'Orgasme';

  @override
  String get sexLifeHighDesire => 'Keinginan tinggi';

  @override
  String get dayLogBbtLabel => 'Suhu badan asas';

  @override
  String get dayLogMucusLabel => 'Lendir serviks';

  @override
  String get mucusDry => 'Kering';

  @override
  String get mucusSticky => 'Melekit';

  @override
  String get mucusCreamy => 'Berkrim';

  @override
  String get mucusWatery => 'Berair';

  @override
  String get mucusEggWhite => 'Putih telur';

  @override
  String get dayLogSavedIndicator => 'Disimpan';

  @override
  String get homeOpenTodayLog => 'Tambah butiran untuk hari ini';

  @override
  String get calendarLegendActual => 'Haid dicatat';

  @override
  String get calendarLegendPredicted => 'Tempoh ramalan';

  @override
  String get calendarLegendFertile => 'Anggaran tempoh subur';

  @override
  String get calendarLegendOvulation => 'Anggaran ovulasi';

  @override
  String get dayDetailFertileTitle => 'Dalam anggaran tempoh subur anda';

  @override
  String get dayDetailOvulationTitle => 'Anggaran hari ovulasi';

  @override
  String get dayDetailOvulationBody =>
      'Kehamilan biasanya lebih berkemungkinan sekitar hari ini, berdasarkan masa yang lazim — ini anggaran, bukan jaminan.';

  @override
  String get insightsCyclesLoggedLabel => 'Kitaran dicatat';

  @override
  String get insightsAveragePeriodLengthLabel => 'Purata tempoh haid';

  @override
  String get insightsAverageCycleLengthLabel => 'Purata panjang kitaran';

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
      other: 'Berbeza kira-kira $daysString hari',
    );
    return '$_temp0';
  }

  @override
  String get insightsNotEnoughDataTitle => 'Data belum mencukupi';

  @override
  String get insightsNotEnoughDataBody =>
      'Catat beberapa kitaran penuh dan purata anda akan muncul di sini.';

  @override
  String get insightsSymptomFrequencyTitle => 'Simptom mengikut hari kitaran';

  @override
  String get insightsNoSymptomsLogged => 'Belum ada simptom dicatat';

  @override
  String get settingsLanguageLabel => 'Bahasa';

  @override
  String get settingsLanguageSystem => 'Bahasa sistem';

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
  String get tourSkip => 'Langkau';

  @override
  String get tourNext => 'Seterusnya';

  @override
  String get tourStart => 'Jom mula';

  @override
  String get tourHomeTitle => 'Utama';

  @override
  String get tourHomeBody =>
      'Lihat sekali imbas di mana anda hari ini — hari kitaran anda, berapa lama lagi ke tempoh anggaran anda, dan rakan anda sentiasa di sini.';

  @override
  String get tourCalendarTitle => 'Kalendar';

  @override
  String get tourCalendarBody =>
      'Lihat kitaran lepas dan akan datang anda pada kalendar. Ketik mana-mana hari untuk buka log hari itu.';

  @override
  String get tourTrackTitle => 'Log';

  @override
  String get tourTrackBody =>
      'Butang + di tengah membuka log hari ini dari mana-mana sahaja — aliran, gejala, mood dan banyak lagi.';

  @override
  String get tourRemindersTitle => 'Peringatan';

  @override
  String get tourRemindersBody =>
      'Tetapkan peringatan untuk haid akan datang, ubat atau minum air — semuanya kekal pada telefon anda dan tidak ke mana-mana.';

  @override
  String get tourProfileTitle => 'Profil';

  @override
  String get tourProfileBody =>
      'Cari pandangan anda, semua yang anda jejak dan tetapan anda di sini.';

  @override
  String get settingsWeekStartLabel => 'Minggu bermula pada';

  @override
  String get settingsWeekStartMonday => 'Isnin';

  @override
  String get settingsWeekStartSunday => 'Ahad';

  @override
  String get settingsTemperatureUnitLabel => 'Unit suhu';

  @override
  String get settingsTemperatureCelsius => 'Celsius';

  @override
  String get settingsTemperatureFahrenheit => 'Fahrenheit';

  @override
  String get settingsRemindersLabel => 'Ingatkan saya sebelum haid saya';

  @override
  String get remindersScreenTitle => 'Peringatan';

  @override
  String get reminderDetailNotification => 'Pemberitahuan';

  @override
  String get reminderDetailAlert => 'Amaran';

  @override
  String get reminderDetailAlertToday => 'Pada hari itu';

  @override
  String get reminderDetailTime => 'Masa';

  @override
  String get reminderDetailMessage => 'Mesej';

  @override
  String get reminderDetailMessageEditTitle => 'Edit mesej';

  @override
  String get reminderDetailMessageHint => 'Tulis mesej anda sendiri';

  @override
  String reminderDetailAlertDaysBefore(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count hari lebih awal',
    );
    return '$_temp0';
  }

  @override
  String optionsShowMore(int count) {
    return '+$count lagi';
  }

  @override
  String get optionsShowLess => 'Tunjukkan kurang';

  @override
  String get trackerHistoryEntry => 'Sejarah';

  @override
  String get actionSend => 'Hantar';

  @override
  String get actionRemove => 'Alih keluar';

  @override
  String get feedbackEntry => 'Maklum balas';

  @override
  String get cloudBackupEntry => 'Sandarkan dengan Akaun';

  @override
  String get cloudBackupTitle => 'Sandarkan dengan Akaun';

  @override
  String get cloudBackupNotConfiguredTitle => 'Belum tersedia dalam versi ini';

  @override
  String get cloudBackupNotConfiguredBody =>
      'Sandaran awan memerlukan perkhidmatan akaun yang belum disediakan untuk versi ini. Tiada apa-apa di sini boleh digunakan sehingga itu.';

  @override
  String get cloudBackupIntro1Title =>
      'Jangan sekali-kali kehilangan sejarah anda';

  @override
  String get cloudBackupIntro1Body =>
      'Sejarah kitaran anda kekal selamat walaupun anda kehilangan telefon atau bertukar ke telefon baharu.';

  @override
  String get cloudBackupIntro2Title => 'Hanya anda boleh membukanya';

  @override
  String get cloudBackupIntro2Body =>
      'Sandaran anda disulitkan dengan kata laluan sebelum meninggalkan telefon anda — kami tidak boleh membacanya, begitu juga orang lain.';

  @override
  String get cloudBackupIntro3Title => 'Pulihkan dalam saat';

  @override
  String get cloudBackupIntro3Body =>
      'Log masuk pada peranti baharu dan bawa kembali sejarah anda dengan kata laluan yang sama.';

  @override
  String get cloudBackupSignedInTitle => 'Log masuk berjaya';

  @override
  String get cloudBackupUploadButton => 'Sandarkan sekarang';

  @override
  String get cloudBackupDownloadButton => 'Pulihkan dari awan';

  @override
  String get cloudBackupUploadSuccess => 'Disandarkan ke akaun anda';

  @override
  String get cloudBackupNoBackupFound =>
      'Tiada sandaran awan dijumpai untuk akaun ini lagi.';

  @override
  String get partnerModeEntry => 'Mod Pasangan';

  @override
  String get partnerModeTitle => 'Mod Pasangan';

  @override
  String get partnerModeNotConfiguredTitle => 'Belum tersedia dalam versi ini';

  @override
  String get partnerModeNotConfiguredBody =>
      'Mod Pasangan memerlukan perkhidmatan akaun yang belum disediakan untuk versi ini. Tiada apa-apa di sini boleh digunakan sehingga itu.';

  @override
  String get partnerModeHeroTitle =>
      'Kongsi sedikit, mengikut syarat anda sendiri';

  @override
  String get partnerModeHeroBody =>
      'Berpasangan dengan pasangan anda dan kongsi hanya perkara yang anda hidupkan di bawah — tidak pernah seluruh sejarah anda, tidak pernah secara automatik.';

  @override
  String get partnerModeSignInGoogle => 'Teruskan dengan Google';

  @override
  String get partnerModeSignInApple => 'Teruskan dengan Apple';

  @override
  String get partnerModeFaqTitle => 'Sebelum anda log masuk';

  @override
  String get partnerModeFaq1Q =>
      'Apakah yang pasangan saya akan lihat sebenarnya?';

  @override
  String get partnerModeFaq1A =>
      'Hanya medan yang anda hidupkan dalam Mod Pasangan, dan hanya keadaan semasa anda — tidak pernah sejarah tersimpan anda, dan tidak pernah apa-apa yang anda tidak kongsi secara jelas.';

  @override
  String get partnerModeFaq2Q => 'Bolehkah saya matikannya kemudian?';

  @override
  String get partnerModeFaq2A =>
      'Ya. Menyahpasang menghentikan perkongsian serta-merta untuk anda berdua, dan anda boleh matikan mana-mana suis pada bila-bila masa tanpa menyahpasang.';

  @override
  String get partnerModeFaq3Q =>
      'Adakah pasangan saya memerlukan aplikasi ini?';

  @override
  String get partnerModeFaq3A =>
      'Ya — dia log masuk dengan cara yang sama dan berpasangan menggunakan kod yang anda hantar kepadanya.';

  @override
  String get partnerModeNotPairedTitle => 'Belum berpasangan';

  @override
  String get partnerModeNotPairedBody =>
      'Jemput pasangan anda dengan kod sekali guna, atau masukkan kod yang dihantar kepada anda.';

  @override
  String get partnerModeInviteButton => 'Jemput pasangan saya';

  @override
  String get partnerModeEnterCodeButton => 'Masukkan kod';

  @override
  String get partnerModeSignOut => 'Log keluar';

  @override
  String get partnerModePairedTitle => 'Berpasangan';

  @override
  String get partnerModePairedBody =>
      'Anda dan pasangan anda sudah berhubung. Perkongsian tetap terhad kepada apa yang anda hidupkan di bawah.';

  @override
  String get partnerModeShareSectionTitle => 'Apa yang anda kongsi';

  @override
  String get partnerModeShareCyclePhase => 'Fasa dan hari kitaran';

  @override
  String get partnerModeShareMood => 'Mood hari ini';

  @override
  String get partnerModeShareSymptoms => 'Gejala hari ini';

  @override
  String get partnerModeShareHighDesire => 'Ingin kerapatan hari ini';

  @override
  String get partnerModeShareNow => 'Kongsi sekarang';

  @override
  String get partnerModeShareSuccess => 'Dikongsi dengan pasangan anda';

  @override
  String get partnerModeUnpair => 'Nyahpasang';

  @override
  String get partnerModeUnpairConfirmTitle =>
      'Nyahpasang daripada pasangan anda?';

  @override
  String get partnerModeUnpairConfirmBody =>
      'Ini menghentikan perkongsian serta-merta untuk anda berdua. Anda boleh berpasangan semula kemudian dengan kod baharu.';

  @override
  String get partnerModePartnerSnapshotEmpty =>
      'Pasangan anda belum berkongsi apa-apa.';

  @override
  String get partnerModeErrorNotConfigured =>
      'Mod Pasangan belum disediakan dalam versi ini.';

  @override
  String get partnerModeErrorCodeNotFound =>
      'Kod itu tidak dijumpai. Semak dan cuba lagi.';

  @override
  String get partnerModeErrorCodeExpired =>
      'Kod itu telah tamat tempoh. Minta yang baharu.';

  @override
  String get partnerModeErrorCodeIsOwn =>
      'Itu kod anda sendiri — minta kod pasangan anda.';

  @override
  String get partnerModeErrorNotSignedIn => 'Log masuk dahulu.';

  @override
  String get partnerModeErrorUnknown => 'Sesuatu tidak kena. Sila cuba lagi.';

  @override
  String get partnerModeInviteTitle => 'Jemput pasangan anda';

  @override
  String get partnerModeInviteBody =>
      'Hantar kod ini kepada pasangan anda. Dia akan memasukkannya dalam aplikasinya sendiri untuk berpasangan dengan anda.';

  @override
  String get partnerModeInviteExpiry => 'Sah selama 7 hari';

  @override
  String get partnerModeInviteShare => 'Kongsi kod';

  @override
  String partnerModeInviteMessage(String code) {
    return 'Ini kod berpasangan Vera saya: $code';
  }

  @override
  String get partnerModeEnterTitle => 'Masukkan kod';

  @override
  String get partnerModeEnterBody =>
      'Masukkan kod yang dihantar oleh pasangan anda.';

  @override
  String get partnerModeEnterHint => 'Kod 6 aksara';

  @override
  String get partnerModeEnterSubmit => 'Pasangkan';

  @override
  String get homeInvitePartnerTitle => 'Kongsi dengan pasangan anda';

  @override
  String get homeInvitePartnerBody =>
      'Berpasanganlah dan kongsi hanya yang anda pilih — sejarah anda kekal milik anda.';

  @override
  String get homeInvitePartnerCta => 'Sediakan Mod Pasangan';

  @override
  String get feedbackTitle => 'Apa yang anda tidak suka?';

  @override
  String get feedbackSubtitle =>
      'Pilih satu topik, dan tulis lebih lanjut jika mahu.';

  @override
  String get feedbackCategoryPredictions => 'Ramalan';

  @override
  String get feedbackCategoryBackup => 'Sandaran & pemulihan';

  @override
  String get feedbackCategorySubscription => 'Langganan';

  @override
  String get feedbackCategoryAds => 'Iklan';

  @override
  String get feedbackCategoryDesign => 'Reka bentuk';

  @override
  String get feedbackCategoryTranslation => 'Terjemahan';

  @override
  String get feedbackCategoryOther => 'Lain-lain';

  @override
  String get feedbackDescriptionLabel => 'Beritahu kami lebih lanjut (pilihan)';

  @override
  String get feedbackDescriptionHint =>
      'Apa yang berlaku? Apabila anda ketik Hantar, anda pilih sendiri ke mana untuk kongsi — apl mel anda atau lain-lain.';

  @override
  String get feedbackAttachPhoto => 'Tambah foto';

  @override
  String get feedbackPhotoAttached => 'Foto dilampirkan';

  @override
  String get remindersGroupCycle => 'Haid & kesuburan';

  @override
  String get remindersGroupMedication => 'Ubat';

  @override
  String get remindersGroupLifestyle => 'Gaya hidup';

  @override
  String get remindersGroupAppointment => 'Temujanji doktor';

  @override
  String get settingsRemindersPeriodEndLabel =>
      'Tanya khabar apabila haid saya sepatutnya berakhir';

  @override
  String get settingsRemindersMedicationLabel => 'Peringatan ubat';

  @override
  String get settingsRemindersWaterLabel => 'Peringatan minum air';

  @override
  String get settingsRemindersAppointmentLabel => 'Peringatan temujanji doktor';

  @override
  String get settingsRemindersAppointmentSet => 'Tetapkan tarikh & masa';

  @override
  String get settingsRemindersAppointmentClear => 'Kosongkan';

  @override
  String get settingsOptionalTrackersHeading => 'Penjejak pilihan';

  @override
  String get settingsOptionalTrackersBody =>
      'Dimatikan secara lalai. Menghidupkan salah satunya akan menambahkannya pada skrin catatan harian.';

  @override
  String get settingsSexualActivityToggle => 'Aktiviti seksual';

  @override
  String get settingsBbtToggle => 'Suhu badan asas';

  @override
  String get settingsMucusToggle => 'Lendir serviks';

  @override
  String get settingsBreastExamToggle => 'Pemeriksaan payudara sendiri';

  @override
  String get settingsCervixToggle => 'Kedudukan & kekerasan serviks';

  @override
  String get settingsPrivacyEntry => 'Privasi';

  @override
  String get settingsRateEntry => 'Nilaikan kami';

  @override
  String get rateAppTitle => 'Adakah Vera membantu anda?';

  @override
  String get rateAppBody =>
      'Jika ya, beberapa saat menilainya di kedai aplikasi membantu orang lain yang mencari sesuatu seperti ini menemuinya.';

  @override
  String get rateAppCta => 'Nilai Vera';

  @override
  String get rateAppDismiss => 'Bukan sekarang';

  @override
  String get settingsDeleteAllData => 'Padam semua data';

  @override
  String get privacyScreenTitle => 'Privasi';

  @override
  String get privacyScreenIntro =>
      'Inilah yang sebenarnya berlaku pada data anda, dalam bahasa yang mudah.';

  @override
  String get privacyScreenStorageTitle => 'Disulitkan pada peranti ini';

  @override
  String get privacyScreenNoNetworkTitle => 'Tiada pelayan, tiada akaun';

  @override
  String get privacyScreenNoThirdPartyTitle => 'Tiada penjejakan';

  @override
  String get privacyScreenExportTitle => 'Hanya kamu boleh mengeksport';

  @override
  String get privacyScreenDeleteTitle => 'Pemadaman adalah muktamad';

  @override
  String get privacyScreenStorage =>
      'Semua yang anda catat disulitkan dan disimpan pada peranti ini sahaja, dalam satu fail. Kunci penyulitan berada dalam perkakasan selamat telefon anda — Keychain pada iOS, Keystore pada Android — bukan di dalam fail itu sendiri.';

  @override
  String get privacyScreenNoNetwork =>
      'Aplikasi ini tiada pelayan sendiri dan tiada sistem akaun — catatan anda tidak pernah dimuat naik. Versi percuma memang mengandungi iklan Google yang menyambung ke internet; iklan itu tidak pernah menerima apa-apa yang anda catat.';

  @override
  String get privacyScreenNoThirdParty =>
      'Tiada analitik, tiada pelaporan ranap, dan tiada SDK penjejakan. Satu-satunya komponen pihak ketiga ialah SDK iklan Google dalam versi percuma — Premium membuangnya sepenuhnya.';

  @override
  String get privacyScreenExport =>
      'Satu-satunya cara data anda keluar dari peranti ini ialah jika anda mengeksportnya sendiri, dan eksport itu disulitkan dengan kata laluan yang hanya anda tahu.';

  @override
  String get privacyScreenDelete =>
      'Pemadaman data anda adalah sebenar dan serta-merta. Tiada akaun dan tiada sandaran di pihak kami — sekali ia hilang, ia hilang terus.';

  @override
  String get adPlaceholderLabel => 'Ruang iklan';

  @override
  String get adPlaceholderUpgradeCta => 'Nikmati tanpa iklan dengan Premium';

  @override
  String get reminderNotificationTitle =>
      'Haid anda mungkin bermula tidak lama lagi';

  @override
  String get reminderNotificationBody =>
      'Berdasarkan kitaran yang anda catat, tempoh anggaran anda semakin hampir.';

  @override
  String get reminderPeriodEndTitle => 'Haid anda mungkin akan berakhir';

  @override
  String get reminderPeriodEndBody =>
      'Jika ia masih berlangsung, itu perkara yang normal — ini cuma tanya khabar.';

  @override
  String get reminderMedicationTitle => 'Peringatan ubat';

  @override
  String get reminderMedicationBody => 'Masa untuk mengambil ubat anda.';

  @override
  String get reminderWaterTitle => 'Kekal terhidrat';

  @override
  String get reminderWaterBody => 'Sedikit peringatan untuk minum air.';

  @override
  String get reminderAppointmentTitle => 'Temujanji doktor akan datang';

  @override
  String get reminderAppointmentBody =>
      'Anda ada temujanji doktor akan datang.';

  @override
  String get settingsExportEntry => 'Eksport & sandaran';

  @override
  String get exportBackupHeading => 'Sandaran disulitkan';

  @override
  String get exportBackupBody =>
      'Simpan salinan sejarah anda yang disulitkan untuk dipindahkan ke peranti baharu. Anda memerlukan kata laluan itu semula untuk memulihkannya — tiada cara lain untuk mendapatkannya kembali.';

  @override
  String get exportCreateBackupButton => 'Buat sandaran';

  @override
  String get exportRestoreBackupButton => 'Pulihkan daripada sandaran';

  @override
  String get exportPasswordLabel => 'Kata laluan';

  @override
  String get exportPasswordConfirmLabel => 'Sahkan kata laluan';

  @override
  String get exportPasswordMismatch => 'Kata laluan tidak sepadan';

  @override
  String get exportPasswordTooShort => 'Gunakan sekurang-kurangnya 8 aksara';

  @override
  String get exportRestoreConfirmTitle => 'Ganti semua data pada peranti ini?';

  @override
  String get exportRestoreConfirmBody =>
      'Memulihkan sandaran akan menggantikan semua yang tercatat pada peranti ini sekarang. Ini tidak boleh dibatalkan.';

  @override
  String get exportRestoreConfirmAction => 'Pulihkan';

  @override
  String get exportWrongPassword =>
      'Kata laluan itu tidak sepadan dengan sandaran ini';

  @override
  String get exportInvalidFile => 'Fail itu nampaknya bukan sandaran Vera';

  @override
  String get exportBackupCreated => 'Sandaran sedia untuk dikongsi';

  @override
  String get exportRestoreSuccess => 'Sandaran telah dipulihkan';

  @override
  String get exportDoctorReportHeading => 'Laporan untuk doktor';

  @override
  String get exportDoctorReportBody =>
      'Ringkasan yang boleh anda kongsikan dengan pakar perubatan.';

  @override
  String get exportIncludeNotesToggle => 'Sertakan nota peribadi';

  @override
  String get exportShareCsvButton => 'Kongsi sebagai CSV';

  @override
  String get exportPrintPdfButton => 'Cetak / Simpan sebagai PDF';

  @override
  String get doctorReportDisclaimer =>
      'Dijana oleh Vera daripada data yang dimasukkan pengguna. Bukan diagnosis perubatan.';

  @override
  String get doctorReportGeneratedOn => 'Dijana pada';

  @override
  String get doctorReportSummaryHeading => 'Ringkasan';

  @override
  String get doctorReportDailyLogHeading => 'Catatan harian';

  @override
  String get doctorReportColumnDate => 'Tarikh';

  @override
  String get doctorReportTimelineHeading => 'Garis masa kitaran';

  @override
  String get doctorReportCycleLabel => 'Kitaran';

  @override
  String get doctorReportTimelineLegendPeriod => 'Haid';

  @override
  String get doctorReportTimelineLegendCycle => 'Baki kitaran';

  @override
  String get doctorReportTimelineOngoing => 'Sedang berlangsung';

  @override
  String get dailyInsightLabel => 'Tahukah anda?';

  @override
  String get insightMenstrual1 =>
      'Lapisan rahim anda sedang luruh sekarang — kebanyakan haid berlangsung 3 hingga 7 hari, dan itu normal sepenuhnya.';

  @override
  String get insightMenstrual2 =>
      'Makanan kaya zat besi seperti sayur-sayuran hijau dan kacang lentil boleh membantu menggantikan apa yang hilang daripada badan anda minggu ini.';

  @override
  String get insightFollicular1 =>
      'Estrogen sedang meningkat, dan ramai orang perasan tenaga yang lebih baik dan tumpuan yang lebih tajam bermula sekitar sekarang.';

  @override
  String get insightFollicular2 =>
      'Badan anda sedang menyediakan sel telur untuk dilepaskan — fasa ini boleh berlangsung dari seminggu hingga beberapa minggu.';

  @override
  String get insightFertile1 =>
      'Ini ialah anggaran tempoh subur anda — hari-hari sekitar ovulasi apabila kehamilan paling berkemungkinan berlaku, berdasarkan masa yang lazim.';

  @override
  String get insightFertile2 =>
      'Sesetengah orang perasan sedikit kenaikan suhu badan asas atau perubahan pada lendir serviks sekitar ovulasi.';

  @override
  String get insightLuteal1 =>
      'Progesteron meningkat selepas ovulasi — inilah masa simptom PMS seperti perubahan mood atau kembung perut sering muncul.';

  @override
  String get insightLuteal2 =>
      'Jika tiada kehamilan yang berlaku, paras hormon menurun menjelang akhir fasa ini, lalu mencetuskan haid anda yang seterusnya.';

  @override
  String get insightUnknown1 =>
      'Panjang kitaran sangat berbeza antara seorang dengan yang lain — dari 21 hingga 35 hari dianggap lazim.';

  @override
  String get insightsPhaseTipsTitle => 'Mungkin terasa baik dalam fasa ini';

  @override
  String get tipFitnessLabel => 'Gerak badan';

  @override
  String get tipNutritionLabel => 'Pemakanan';

  @override
  String get tipFitnessMenstrual =>
      'Gerak badan yang lembut — berjalan kaki, regangan, atau yoga pemulihan — mungkin terasa lebih baik daripada senaman berat buat masa ini.';

  @override
  String get tipFitnessFollicular =>
      'Tenaga selalunya meningkat dalam fasa ini — masa yang baik untuk mencuba senaman baharu atau menolak diri sedikit lebih jauh.';

  @override
  String get tipFitnessFertile =>
      'Ramai orang berasa paling bertenaga di sini — fasa yang baik untuk latihan berintensiti tinggi jika itu menarik bagi anda.';

  @override
  String get tipFitnessLuteal =>
      'Jika tenaga menurun menjelang akhir fasa ini, latihan kekuatan berintensiti rendah atau berenang mungkin terasa lebih mampan.';

  @override
  String get tipFitnessUnknown =>
      'Apa-apa pergerakan yang terasa baik hari ini ialah pilihan yang baik — tiada satu rutin \"betul\" untuk setiap hari.';

  @override
  String get tipNutritionMenstrual =>
      'Makanan kaya zat besi seperti sayur-sayuran hijau, lentil, dan daging merah boleh membantu menggantikan apa yang hilang daripada badan anda minggu ini.';

  @override
  String get tipNutritionFollicular =>
      'Hidangan yang lebih ringan dan segar selalunya terasa sesuai apabila tenaga meningkat — tetapi tiada satu cara \"betul\" untuk makan dalam fasa ini.';

  @override
  String get tipNutritionFertile =>
      'Kekal terhidrat dan mengekalkan hidangan yang seimbang menyokong tenaga sepanjang fasa yang terasa lebih aktif ini.';

  @override
  String get tipNutritionLuteal =>
      'Keinginan makan boleh berubah di sini — karbohidrat kompleks dan makanan kaya magnesium seperti kacang dan coklat gelap ialah pilihan yang lazim.';

  @override
  String get tipNutritionUnknown =>
      'Hidangan yang seimbang dan teratur ialah pilihan asas yang kukuh bila-bila masa fasa anda belum jelas.';

  @override
  String get predictionSettingsEntry => 'Tetapan ramalan';

  @override
  String get predictionSettingsIntro =>
      'Ini ialah andaian, ditunjukkan secara terbuka. Setelah anda mencatat 2 kitaran penuh, ramalan sebenar pada skrin Utama dikira daripada data anda sendiri — nombor ini tidak lagi digunakan untuk itu.';

  @override
  String get predictionSettingsPeriodLengthLabel => 'Tempoh haid yang lazim';

  @override
  String get predictionSettingsCycleLengthLabel => 'Panjang kitaran yang lazim';

  @override
  String get predictionSettingsCycleLengthHint =>
      'Digunakan untuk menyesuaikan saiz cincin pada skrin Utama sehingga kami mempunyai data sebenar.';

  @override
  String get predictionSettingsLutealLabel => 'Panjang fasa luteal';

  @override
  String get predictionSettingsLutealHint =>
      'Bilangan hari yang lazim antara ovulasi dan haid anda yang seterusnya. Digunakan untuk meletakkan anggaran tempoh subur — nilai ini terus digunakan walaupun selepas ramalan sebenar bermula.';

  @override
  String get dayLogEnergyLabel => 'Tenaga';

  @override
  String get energyLevelLow => 'Rendah';

  @override
  String get energyLevelMedium => 'Sederhana';

  @override
  String get energyLevelHigh => 'Tinggi';

  @override
  String get energyLevelEnergetic => 'Penuh tenaga';

  @override
  String get dayLogSkinHairLabel => 'Kulit & rambut';

  @override
  String get skinHealthyGlow => 'Berseri sihat';

  @override
  String get skinRedness => 'Kemerahan';

  @override
  String get skinDryness => 'Kekeringan';

  @override
  String get skinOiliness => 'Berminyak';

  @override
  String get hairGoodDay => 'Rambut elok hari ini';

  @override
  String get hairBadDay => 'Rambut tidak menjadi hari ini';

  @override
  String get hairLoss => 'Rambut gugur';

  @override
  String get scalpOily => 'Kulit kepala berminyak';

  @override
  String get dayLogBreastExamLabel => 'Pemeriksaan payudara sendiri';

  @override
  String get breastExamAllNormal => 'Tiada apa-apa luar biasa';

  @override
  String get breastExamLump => 'Ketulan';

  @override
  String get breastExamIndentation => 'Lekuk';

  @override
  String get breastExamRedness => 'Kemerahan';

  @override
  String get breastExamCrackedNipple => 'Puting pecah';

  @override
  String get breastExamDischarge => 'Cairan keluar';

  @override
  String get cervixPositionLabel => 'Kedudukan serviks';

  @override
  String get cervixPositionLow => 'Rendah';

  @override
  String get cervixPositionMedium => 'Sederhana';

  @override
  String get cervixPositionHigh => 'Tinggi';

  @override
  String get cervixOpeningLabel => 'Bukaan serviks';

  @override
  String get cervixOpeningClosed => 'Tertutup';

  @override
  String get cervixOpeningMedium => 'Sederhana';

  @override
  String get cervixOpeningOpen => 'Terbuka';

  @override
  String get cervixFirmnessLabel => 'Kekerasan serviks';

  @override
  String get cervixFirmnessSoft => 'Lembut';

  @override
  String get cervixFirmnessMedium => 'Sederhana';

  @override
  String get cervixFirmnessFirm => 'Keras';

  @override
  String get dayLogWaterLabel => 'Air';

  @override
  String get dayLogSleepLabel => 'Tidur';

  @override
  String get dayLogWeightLabel => 'Berat badan';

  @override
  String get dayLogMedicationsLabel => 'Ubat';

  @override
  String get dayLogAddMedication => 'Tambah ubat';

  @override
  String get dayLogMedicationNameHint => 'Nama ubat';

  @override
  String get dayLogBirthControlLabel => 'Pencegahan kehamilan';

  @override
  String get dayLogOtherMedicationsLabel => 'Ubat lain';

  @override
  String get birthControlPillTaken => 'Pil diambil';

  @override
  String get birthControlPillLate => 'Pil lewat diambil';

  @override
  String get birthControlPillMissed => 'Pil terlepas';

  @override
  String get birthControlPatch => 'Tampalan';

  @override
  String get birthControlRing => 'Cincin';

  @override
  String get birthControlInjection => 'Suntikan';

  @override
  String get birthControlImplant => 'Implan';

  @override
  String get birthControlIud => 'IUD';

  @override
  String get navAssistant => 'Pembantu';

  @override
  String get assistantTitle => 'Pembantu Vera';

  @override
  String get assistantEndChatTitle => 'Tamatkan sembang ini?';

  @override
  String get assistantEndChatBody =>
      'Mesej hanya ada dalam ingatan dan tidak disimpan di mana-mana, jadi ia tidak boleh dikembalikan.';

  @override
  String get assistantEndChatConfirm => 'Tamatkan sembang';

  @override
  String get assistantInputHint => 'Tanya tentang kitaran anda…';

  @override
  String get assistantIntro =>
      'Hai! Saya boleh menjawab soalan tentang haid, kitaran, dan cara Vera berfungsi — terus di telefon anda, tiada apa-apa yang keluar daripada peranti anda. Saya bukan doktor dan ini bukan nasihat perubatan.';

  @override
  String get insightMenstrual3 =>
      'Darah haid bukan \"darah kotor\" — ia campuran darah dan lapisan rahim, sebahagian daripada kitaran yang normal sepenuhnya.';

  @override
  String get insightMenstrual4 =>
      'Haba lembut pada bahagian bawah perut memang meredakan senggugut — botol air panas ialah kaedah klasik yang disokong bukti.';

  @override
  String get insightMenstrual5 =>
      'Aliran selalunya paling berat pada dua hari pertama dan berkurangan selepas itu — corak itu adalah lazim.';

  @override
  String get insightMenstrual6 =>
      'Berasa sedikit lebih letih semasa haid adalah perkara biasa — zat besi keluar daripada badan bersama darah haid.';

  @override
  String get insightFollicular3 =>
      'Estrogen sedang membina semula lapisan rahim anda selepas haid — badan anda sedang bersiap dari awal.';

  @override
  String get insightFollicular4 =>
      'Kulit selalunya kelihatan paling bersih dalam fasa ini apabila paras hormon menjadi stabil.';

  @override
  String get insightFollicular5 =>
      'Daya tahan dan masa tindak balas memuncak pada penghujung fasa folikular bagi ramai orang.';

  @override
  String get insightFollicular6 =>
      'Panjang fasa inilah yang paling berbeza antara seorang dengan yang lain — fasa luteal jauh lebih tetap.';

  @override
  String get insightFertile3 =>
      'Sel telur hidup kira-kira 12–24 jam, tetapi sperma boleh menunggu sehingga 5 hari — itulah sebabnya tempoh subur merangkumi beberapa hari.';

  @override
  String get insightFertile4 =>
      'Sekitar ovulasi, lendir serviks selalunya menjadi jernih dan kenyal — seperti putih telur mentah.';

  @override
  String get insightFertile5 =>
      'Sesetengah orang merasai sengal singkat di satu sisi semasa ovulasi — ia ada namanya: mittelschmerz.';

  @override
  String get insightFertile6 =>
      'Suhu badan asas naik sedikit *selepas* ovulasi — ia mengesahkan bahawa ovulasi telah berlaku, bukan meramalkannya.';

  @override
  String get insightLuteal3 =>
      'Progesteron memuncak kira-kira seminggu selepas ovulasi — kembung perut dan payudara sakit sekitar masa itu adalah perkara biasa.';

  @override
  String get insightLuteal4 =>
      'Keinginan makan karbohidrat sebelum haid itu nyata — keperluan tenaga naik sedikit dalam fasa luteal.';

  @override
  String get insightLuteal5 =>
      'Simptom PMS biasanya reda dalam sehari dua selepas pendarahan bermula.';

  @override
  String get insightLuteal6 =>
      'Rutin tidur yang konsisten boleh melembutkan penurunan mood pada penghujung fasa luteal dengan ketara.';

  @override
  String get insightUnknown2 =>
      'Mencatat tiga kitaran sahaja selalunya cukup untuk melihat corak anda sendiri muncul.';

  @override
  String get insightUnknown3 =>
      'Kitaran bersifat peribadi — membandingkan kitaran anda dengan kitaran rakan jarang memberi maklumat yang berguna.';

  @override
  String get insightUnknown4 =>
      'Tekanan, perjalanan, dan sakit semuanya boleh menganjak ovulasi — haid yang \"lewat\" selalunya cuma bermakna ovulasi yang lewat.';

  @override
  String get settingsThemeLabel => 'Tema';

  @override
  String get settingsThemeSystem => 'Sistem';

  @override
  String get settingsThemeLight => 'Cerah';

  @override
  String get settingsThemeDark => 'Gelap';

  @override
  String get settingsMascotLabel => 'Maskot pendamping';

  @override
  String get mascotDroplet => 'Titisan';

  @override
  String get mascotFlower => 'Bunga';

  @override
  String get mascotMoon => 'Bulan';

  @override
  String get mascotNone => 'Tiada';

  @override
  String homeWindowCountdown(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: 'Tempoh ramalan bermula kira-kira $days hari lagi',
    );
    return '$_temp0';
  }

  @override
  String homeOvulationCountdown(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: 'Anggaran ovulasi kira-kira $days hari lagi',
    );
    return '$_temp0';
  }

  @override
  String get homeQuickLogTitle => 'Bagaimana perasaan badan anda hari ini?';

  @override
  String get actionSave => 'Simpan';

  @override
  String get insightsTrackerHubTitle => 'Penjejak anda';

  @override
  String get trackerHistoryEmpty => 'Belum ada catatan dalam julat ini';

  @override
  String get trackerStatAverage => 'Purata';

  @override
  String get trackerStatLowest => 'Terendah';

  @override
  String get trackerStatHighest => 'Tertinggi';

  @override
  String get trackerStatLatest => 'Terkini';

  @override
  String get rangeFilter1m => '1 bln';

  @override
  String get rangeFilter3m => '3 bln';

  @override
  String get rangeFilter6m => '6 bln';

  @override
  String get dayLogOvulationTestLabel => 'Ujian ovulasi';

  @override
  String get ovulationTestNegative => 'Negatif';

  @override
  String get ovulationTestPositive => 'Positif';

  @override
  String get ovulationTestLow => 'Rendah';

  @override
  String get ovulationTestHigh => 'Tinggi';

  @override
  String get ovulationTestPeak => 'Puncak';

  @override
  String get pregnancyTestLabel => 'Ujian kehamilan';

  @override
  String get pregnancyTestPositive => 'Positif';

  @override
  String get pregnancyTestFaint => 'Garis samar';

  @override
  String get pregnancyTestNegative => 'Negatif';

  @override
  String get settingsOvulationTestToggle => 'Ujian ovulasi';

  @override
  String get settingsRemindersOvulationLabel => 'Makluman tempoh subur';

  @override
  String get reminderOvulationTitle => 'Anggaran tempoh subur semakin hampir';

  @override
  String get reminderOvulationBody =>
      'Berdasarkan kitaran yang anda catat, anggaran tempoh subur anda mungkin bermula tidak lama lagi.';

  @override
  String trackerEntriesCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count catatan',
    );
    return '$_temp0';
  }

  @override
  String get trackerLowSampleNote =>
      'Dengan catatan sesedikit ini, peratusan belum boleh dipercayai — ia akan menjadi lebih tepat apabila anda mencatat lebih banyak.';

  @override
  String get assistantTyping => 'Vera sedang menaip…';

  @override
  String get premiumTitle => 'Vera Premium';

  @override
  String get premiumHeadline => 'Vera Premium';

  @override
  String get premiumSubhead =>
      'Setiap ciri penjejakan kekal percuma selamanya — sejarah anda tidak pernah dikunci. Premium menambah penjejak anda sendiri, cerapan yang lebih mendalam, peringatan anda sendiri dan rupa tambahan, serta membuang iklan.';

  @override
  String get premiumBenefitNoAds => 'Tiada iklan, di mana-mana dalam aplikasi';

  @override
  String get premiumBenefitSupport =>
      'Menyokong aplikasi bebas yang mengutamakan privasi';

  @override
  String get premiumMonthly => 'Bulanan';

  @override
  String get premiumYearly => 'Tahunan';

  @override
  String get premiumYearlyNote => 'Dicaj sekali setahun';

  @override
  String premiumPerMonth(String price) {
    return '$price / bulan';
  }

  @override
  String get premiumBilledMonthly => 'Dicaj bulanan';

  @override
  String get premiumStaysFreeTitle => 'Yang kekal percuma';

  @override
  String get premiumStaysFreeBody =>
      'Kalendar, seluruh sejarah anda, statistik asas dan eksport kekal percuma. Premium menambah sesuatu; ia tidak pernah menarik balik.';

  @override
  String get premiumSubscribeCta => 'Teruskan';

  @override
  String get premiumRestore => 'Pulihkan pembelian';

  @override
  String get premiumCancelNote =>
      'Batalkan bila-bila masa dalam akaun kedai aplikasi anda. Tiada kiraan detik, tiada tekanan — jika sekarang bukan masanya, versi percuma terus berfungsi sama seperti hari ini.';

  @override
  String get premiumActiveBadge => 'Premium aktif';

  @override
  String get premiumDevToggle => 'Simulasikan Premium (pembangunan)';

  @override
  String get settingsPremiumEntry => 'Vera Premium';

  @override
  String get adTestNotice => 'Iklan ujian — belum penempatan sebenar';

  @override
  String get settingsPregnancyModeLabel => 'Mod kehamilan';

  @override
  String get pregnancyLmpLabel => 'Hari pertama haid terakhir';

  @override
  String pregnancyWeekLabel(int weeks, int days) {
    return 'Minggu $weeks, hari $days';
  }

  @override
  String get pregnancyDueDateLabel => 'Anggaran tarikh bersalin';

  @override
  String pregnancyDaysLeft(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: 'Kira-kira $days hari lagi',
    );
    return '$_temp0';
  }

  @override
  String pregnancyTrimesterLabel(int n) {
    return 'Trimester $n';
  }

  @override
  String get pregnancyDisclaimer =>
      'Tarikh dianggarkan daripada haid terakhir anda menggunakan peraturan standard 280 hari. Imbasan ultrasound memberikan tarikh yang lebih tepat, dan ovulasi yang lewat menganjak angka ini — ini maklumat, bukan penjagaan perubatan.';

  @override
  String get pregnancySizeLabel => 'Saiz bayi';

  @override
  String get pregnancySizeUnder5 => 'Biji poppy (~2 mm)';

  @override
  String get pregnancySizeUnder9 => 'Blueberi (~1.6 cm)';

  @override
  String get pregnancySizeUnder13 => 'Limau nipis (~5.4 cm)';

  @override
  String get pregnancySizeUnder20 => 'Avokado (~11.6 cm)';

  @override
  String get pregnancySizeUnder28 => 'Mangga (~30 cm)';

  @override
  String get pregnancySizeUnder34 => 'Nanas (~44 cm)';

  @override
  String get pregnancySizeUnder38 => 'Tembikai susu (~46 cm)';

  @override
  String get pregnancySizeTerm => 'Tembikai kecil (~51 cm)';

  @override
  String get pregnancyNoteUnder5 =>
      'Kebanyakan orang belum merasakan apa-apa lagi — kerana usia kehamilan dikira daripada haid terakhir, dua minggu pertama sebenarnya berlaku sebelum persenyawaan.';

  @override
  String get pregnancyNoteUnder9 =>
      'Loya, payudara sakit dan keletihan lazim berlaku ketika ini. Masa yang baik untuk mengatur temu janji pertama.';

  @override
  String get pregnancyNoteUnder13 =>
      'Anda menghampiri penghujung trimester pertama; bagi ramai orang, loya mula reda sekitar waktu ini.';

  @override
  String get pregnancyNoteUnder20 =>
      'Tenaga selalunya kembali dalam tempoh ini. Pergerakan pertama boleh dirasai bila-bila masa antara minggu 16 dan 22.';

  @override
  String get pregnancyNoteUnder28 =>
      'Pergerakan menjadi lebih jelas dan mula membentuk corak. Sakit belakang dan pedih ulu hati lazim berlaku dalam tempoh ini.';

  @override
  String get pregnancyNoteUnder34 =>
      'Anda berada dalam trimester ketiga. Sesak nafas, kerap membuang air kecil dan kontraksi Braxton-Hicks lazim berlaku.';

  @override
  String get pregnancyNoteUnder38 =>
      'Bayi sedang bersiap untuk dilahirkan. Masa yang baik untuk beg hospital dan rancangan bersalin.';

  @override
  String get pregnancyNoteTerm =>
      'Anda berada pada tempoh cukup bulan — kelahiran boleh berlaku bila-bila masa antara minggu 37 dan 42; minggu 40 ialah purata, bukan tarikh akhir.';

  @override
  String get pregnancyWeeklyNoteTitle => 'Minggu ini';

  @override
  String get pregnancyNeedsLmp =>
      'Tambah hari pertama haid terakhir anda untuk mula menjejaki.';

  @override
  String get pregnancyOutOfRange =>
      'Tarikh itu lebih daripada 42 minggu lalu — kemas kini atau matikan mod kehamilan.';

  @override
  String get partnerShareTitle => 'Kongsi ringkasan dengan pasangan';

  @override
  String get partnerShareBody =>
      'Menghasilkan ringkasan teks yang pendek — fasa semasa anda dan anggaran tempoh anda — yang anda hantar sendiri melalui mana-mana aplikasi. Tiada penyegerakan langsung dan tiada akaun pasangan: tiada apa-apa dikongsi melainkan anda menghantarnya.';

  @override
  String get partnerShareCta => 'Hasilkan ringkasan';

  @override
  String get partnerSummaryHeader => 'Ringkasan kitaran daripada Vera';

  @override
  String get settingsHomeThemeLabel => 'Latar skrin Utama';

  @override
  String get homeThemeWheat => 'Gandum';

  @override
  String get homeThemeSky => 'Langit';

  @override
  String get homeThemeField => 'Padang';

  @override
  String get homeThemeBlossom => 'Kuntum';

  @override
  String get homeThemePlain => 'Polos';

  @override
  String get backupNudgeTitle => 'Simpan salinan data anda';

  @override
  String get backupNudgeBody =>
      'Semuanya berada pada telefon ini sahaja. Jika ia hilang, rosak, atau ditetapkan semula, sejarah anda hilang bersamanya — sandaran yang disulitkan hanya mengambil seketika dan hanya anda yang boleh membukanya.';

  @override
  String get backupNudgeCta => 'Buat sandaran sekarang';

  @override
  String get backupNudgeDismiss => 'Kemudian';

  @override
  String backupLastDone(String date) {
    return 'Sandaran terakhir: $date';
  }

  @override
  String get backupNever => 'Belum ada sandaran';

  @override
  String get settingsRemindersBackupLabel =>
      'Ingatkan saya untuk membuat sandaran';

  @override
  String get reminderBackupTitle => 'Masa untuk membuat sandaran Vera';

  @override
  String get reminderBackupBody =>
      'Sejarah anda hanya wujud pada telefon ini. Sandaran disulitkan yang pantas memastikannya selamat.';

  @override
  String get notificationChannelPeriodStart => 'Haid akan datang';

  @override
  String get notificationChannelPeriodEnd => 'Tanya khabar akhir haid';

  @override
  String get notificationChannelMedication => 'Ubat';

  @override
  String get notificationChannelWater => 'Minum air';

  @override
  String get notificationChannelAppointment => 'Temu janji';

  @override
  String get notificationChannelOvulation => 'Tempoh subur';

  @override
  String get notificationChannelBackup => 'Peringatan sandaran';

  @override
  String get calendarDayDetailTitle => 'Hari yang dipilih';

  @override
  String get calendarDayNothingLogged =>
      'Belum ada apa-apa dicatat untuk hari tersebut';

  @override
  String get calendarDayOpenLog => 'Buka catatan harian';

  @override
  String get cycleHistoryTitle => 'Kitaran lalu';

  @override
  String get cycleTrendsTitle => 'Trend kitaran';

  @override
  String get cycleHistoryEmpty =>
      'Catat beberapa haid dan sejarah kitaran anda akan muncul di sini.';

  @override
  String get cycleHistoryOngoing => 'Sedang berlangsung';

  @override
  String cycleHistoryLength(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: 'Kitaran $days hari',
    );
    return '$_temp0';
  }

  @override
  String cycleHistoryPeriodLength(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: 'Haid berlangsung $days hari',
    );
    return '$_temp0';
  }

  @override
  String cycleHistoryVsAverage(String diff) {
    return '$diff berbanding purata anda';
  }

  @override
  String get insightsCycleHistoryEntry => 'Kitaran lalu';

  @override
  String get homeEmptyTitle => 'Mari mulakan dengan haid terakhir anda';

  @override
  String get homeEmptyBody =>
      'Ketuk butang di atas pada hari haid anda bermula. Selepas dua kitaran penuh Vera boleh mula membuat anggaran — sehingga itu ia tidak akan berpura-pura tahu.';

  @override
  String get homeEmptyBackdate => 'Ia sudah bermula lebih awal';

  @override
  String get settingsAdPrivacyEntry => 'Pilihan privasi iklan';

  @override
  String a11yCycleRing(int day, int length) {
    return 'Hari kitaran ke-$day daripada kira-kira $length';
  }

  @override
  String a11yChartSummary(int count, String min, String max) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Carta dengan $count catatan, dari $min hingga $max',
    );
    return '$_temp0';
  }

  @override
  String a11yPhaseBar(int day, int length) {
    return 'Kemajuan kitaran: hari ke-$day daripada kira-kira $length';
  }

  @override
  String a11yFrequencyItem(String label, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count kali',
    );
    return '$label: $_temp0';
  }

  @override
  String get importTitle => 'Import daripada aplikasi lain';

  @override
  String get importBody =>
      'Eksport sejarah anda daripada penjejak lama sebagai CSV, kemudian pilih fail itu di sini. Hanya tarikh dan aliran yang diimport — istilah simptom dan mood berbeza antara aplikasi, dan Vera tidak akan meneka maksud anda.';

  @override
  String get importPickFile => 'Pilih fail CSV';

  @override
  String importPreview(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Menemui $count hari sejarah',
    );
    return '$_temp0';
  }

  @override
  String importSkipped(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count baris tidak dapat dibaca dan akan ditinggalkan',
    );
    return '$_temp0';
  }

  @override
  String get importConfirm => 'Tambah ke sejarah saya';

  @override
  String get importMergeNote =>
      'Hari yang diimport digabungkan. Hari yang sudah anda catat dalam Vera kekal seperti sedia ada.';

  @override
  String importDone(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count hari diimport',
    );
    return '$_temp0';
  }

  @override
  String get importErrorEmpty => 'Fail itu nampak kosong.';

  @override
  String get importErrorNoDate => 'Tidak menemui lajur tarikh dalam fail itu.';

  @override
  String get settingsImportEntry => 'Import daripada aplikasi lain';

  @override
  String get settingsHealthSyncLabel =>
      'Segerakkan ke Apple Health / Health Connect';

  @override
  String get settingsHealthSyncBody =>
      'Hanya menulis aliran haid, berat badan, dan suhu badan asas ke aplikasi kesihatan telefon anda. Simptom, mood, dan nota kekal dalam Vera. Tiada apa-apa dibaca semula.';

  @override
  String healthSyncBackfilled(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count hari dihantar ke aplikasi kesihatan anda',
    );
    return '$_temp0';
  }

  @override
  String get healthSyncDenied =>
      'Kebenaran tidak diberikan, jadi penyegerakan kekal dimatikan.';

  @override
  String get settingsDiagnosticsEntry => 'Diagnostik';

  @override
  String get diagnosticsBody =>
      'Jika aplikasi bermasalah, butiran teknikalnya direkodkan di sini — pada peranti ini sahaja. Tiada apa-apa dihantar ke mana-mana melainkan anda memilih untuk menghantarnya, dan anda boleh membaca dahulu dengan tepat apa yang akan dihantar.';

  @override
  String get diagnosticsEmpty => 'Tiada rekod — tiada masalah dikesan.';

  @override
  String get diagnosticsShare => 'Hantar kepada pembangun';

  @override
  String get diagnosticsClear => 'Kosongkan';

  @override
  String get diagnosticsNoteLabel => 'Apa yang berlaku? (pilihan)';

  @override
  String get diagnosticsTechnicalDetail => 'Butiran teknikal';

  @override
  String get unitHoursShort => 'j';

  @override
  String get unitMinutesShort => 'min';

  @override
  String get unitHoursLong => 'jam';

  @override
  String get unitMinutesLong => 'minit';

  @override
  String get unitMilliliters => 'ml';

  @override
  String get unitKilograms => 'kg';

  @override
  String get calendarJumpTitle => 'Lompat ke bulan';

  @override
  String get calendarJumpYearLabel => 'Tahun';

  @override
  String get settingsAdPrivacyUnavailable =>
      'Pilihan pemperibadian iklan tidak ditawarkan di wilayah anda — iklan di sini memang sudah tidak diperibadikan.';

  @override
  String get settingsGroupAppearance => 'Penampilan';

  @override
  String get settingsGroupTracking => 'Keutamaan penjejakan';

  @override
  String get dayLogCustomTagsLabel => 'Penjejak saya sendiri';

  @override
  String get customTagAddButton => 'Tambah penjejak';

  @override
  String get customTagDialogTitle => 'Penjejak baharu';

  @override
  String get customTagDialogHint => 'cth. migrain, gim, insomnia';

  @override
  String get customTagManageEntry => 'Urus penjejak saya';

  @override
  String get customTagRenameTitle => 'Namakan semula penjejak';

  @override
  String get customTagDeleteTitle => 'Padam penjejak ini?';

  @override
  String get customTagDeleteBody =>
      'Ia akan dibuang daripada setiap hari yang anda gunakannya. Catatan anda yang lain kekal seperti sedia ada.';

  @override
  String get customTagEmpty => 'Belum ada penjejak anda sendiri.';

  @override
  String get premiumLockedTitle => 'Ciri Premium';

  @override
  String get premiumLockedAction => 'Lihat Premium';

  @override
  String get premiumBenefitCustomTrackers =>
      'Jejak apa sahaja yang anda mahu, dalam perkataan anda sendiri';

  @override
  String get premiumBenefitAdvancedInsights =>
      'Cerapan lanjutan: apa yang cenderung berlaku, dan bila';

  @override
  String get premiumBenefitPersonalisation => 'Latar dan teman tambahan';

  @override
  String get premiumBenefitAdvancedReminders =>
      'Peringatan mengikut jadual anda sendiri';

  @override
  String get advancedInsightsTitle => 'Cerapan lanjutan';

  @override
  String get advancedInsightsEntry => 'Cerapan lanjutan';

  @override
  String get advancedInsightsNotEnough =>
      'Catat tiga kitaran penuh dan corak anda akan muncul di sini. Kurang daripada itu, sebarang \"corak\" hanyalah kebetulan.';

  @override
  String get advancedInsightsPatternsTitle => 'Bila sesuatu cenderung muncul';

  @override
  String advancedInsightsPatternLine(String label, String segment) {
    return '$label — paling kerap $segment';
  }

  @override
  String advancedInsightsPatternDetail(int count, int day) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count hari dicatat, sekitar hari ke-$day kitaran anda',
    );
    return '$_temp0';
  }

  @override
  String advancedInsightsNoPattern(String label) {
    return '$label — belum ada masa yang jelas';
  }

  @override
  String get advancedInsightsTrendTitle => 'Panjang kitaran dari masa ke masa';

  @override
  String advancedInsightsDriftLonger(String days, String cycles) {
    return 'Membandingkan $cycles kitaran terawal anda dengan $cycles kitaran terkini, yang terkini kira-kira $days hari lebih panjang.';
  }

  @override
  String advancedInsightsDriftShorter(String days, String cycles) {
    return 'Membandingkan $cycles kitaran terawal anda dengan $cycles kitaran terkini, yang terkini kira-kira $days hari lebih pendek.';
  }

  @override
  String advancedInsightsDriftStable(String cycles) {
    return 'Membandingkan $cycles kitaran terawal anda dengan $cycles kitaran terkini, panjang kitaran anda kekal lebih kurang sama.';
  }

  @override
  String get advancedInsightsDriftNotEnough =>
      'Setelah anda mempunyai enam kitaran penuh, Vera boleh membandingkan kitaran terawal anda dengan yang terkini untuk melihat sama ada panjang kitaran anda sedang beralih.';

  @override
  String get advancedInsightsMoodTitle => 'Mood mengikut bahagian kitaran';

  @override
  String get advancedInsightsDisclaimer =>
      'Ini hanyalah kiraan apa yang anda catat, tidak lebih daripada itu. Ia bukan diagnosis, dan corak di sini bukan punca.';

  @override
  String get segmentPeriod => 'semasa haid anda';

  @override
  String get segmentAfterPeriod => 'selepas haid anda';

  @override
  String get segmentMidCycle => 'pertengahan kitaran';

  @override
  String get segmentBeforePeriod => 'sebelum haid anda';

  @override
  String get customRemindersEntry => 'Peringatan saya sendiri';

  @override
  String get customRemindersTitle => 'Peringatan saya sendiri';

  @override
  String get customRemindersEmpty => 'Belum ada peringatan anda sendiri.';

  @override
  String get customRemindersAdd => 'Tambah peringatan';

  @override
  String get customReminderLabelHint => 'cth. ambil pil saya, minum air';

  @override
  String get customReminderLockScreenNote =>
      'Teks peringatan muncul pada skrin kunci anda, jadi tulislah seperibadi yang anda mahu.';

  @override
  String get customReminderDelete => 'Padam peringatan';

  @override
  String get homeThemeDusk => 'Senja';

  @override
  String get homeThemeMeadow => 'Padang rumput';

  @override
  String get homeThemePetal => 'Kelopak';

  @override
  String get homeThemeBloom => 'Mekar';

  @override
  String get homeThemeOcean => 'Lautan';

  @override
  String get homeThemeAutumn => 'Musim Luruh';

  @override
  String get homeThemeNight => 'Malam';

  @override
  String get mascotStar => 'Bintang';

  @override
  String get mascotLeaf => 'Daun';

  @override
  String get mascotCat => 'Kucing';

  @override
  String get mascotRabbit => 'Arnab';

  @override
  String get mascotBird => 'Burung';

  @override
  String get tipDetailWhatsHappening =>
      'Apa yang sedang berlaku dalam badan anda';

  @override
  String get tipDetailGeneralHeading => 'Cadangan umum';

  @override
  String get tipDetailDisclaimer =>
      'Ini maklumat umum, bukan nasihat perubatan peribadi. Setiap badan bertindak balas secara berbeza, dan apa yang anda rasa sebenarnya lebih penting daripada apa-apa yang dicadangkan di sini. Jika ada sesuatu yang merisaukan anda, berbincanglah dengan pakar perubatan.';

  @override
  String get phaseExplainerMenstrual =>
      'Anda sedang berdarah kerana lapisan rahim luruh. Estrogen dan progesteron berada pada paras terendah dalam kitaran, itulah sebabnya ramai orang berasa lebih letih dan lebih menyendiri pada hari-hari awal. Senggugut berpunca daripada pengecutan rahim. Pendarahan juga menyebabkan anda kehilangan zat besi — itu menjelaskan sebahagian daripada rasa letih itu.';

  @override
  String get phaseExplainerFollicular =>
      'Selepas pendarahan berhenti, estrogen mula naik semula. Kebanyakan orang perasan tenaga, mood dan daya tahan kembali pulih. Folikel sedang matang dalam ovari; badan sedang bersiap untuk ovulasi seterusnya.';

  @override
  String get phaseExplainerFertile =>
      'Estrogen menghampiri kemuncaknya dan ovulasi dijangka berlaku sekitar hari-hari ini. Lendir serviks biasanya menjadi jernih dan licin, sesetengah orang perasan libido yang lebih tinggi, dan sesetengahnya merasai sengal singkat di satu sisi. Tenaga selalunya berada pada tahap tertinggi dalam kitaran.';

  @override
  String get phaseExplainerLuteal =>
      'Selepas ovulasi progesteron naik, kemudian menurun mendadak apabila haid anda menghampiri. Penurunan itu boleh mencetuskan simptom PMS: kembung perut, payudara sakit, perubahan selera makan, tidur terganggu dan mood naik turun. Suhu badan anda berada sedikit lebih tinggi.';

  @override
  String get phaseExplainerUnknown =>
      'Catatan anda belum cukup untuk menyatakan fasa mana yang anda berada sekarang. Vera lebih rela mengatakannya daripada mereka-reka satu fasa. Setelah anda mencatat beberapa kitaran, bahagian ini akan terisi dengan data anda sendiri — sehingga itu, cadangan di bawah adalah cadangan umum yang sesuai pada bila-bila masa.';

  @override
  String get tipFitnessDetailMenstrual =>
      'Latihan berat tidak sesuai untuk kebanyakan orang pada hari-hari awal, dan itu bukan masalah disiplin — tenaga anda memang lebih rendah. Berjalan kaki, regangan lembut, yoga pemulihan dan latihan pernafasan melancarkan aliran darah dan boleh mengurangkan senggugut. Jika anda berasa baik, tiada sebab untuk mengelak sesi berat: haid bukan sebab untuk berhenti bersenam. Satu catatan praktikal: sesi yang panjang dan berat pada hari aliran berat boleh menambah rasa letih, jadi laraskan mengikut apa yang badan anda benar-benar rasa.';

  @override
  String get tipFitnessDetailFollicular =>
      'Apabila estrogen meningkat, kebanyakan orang berasa lebih kuat dan lebih tahan lasak; ini biasanya bahagian terbaik dalam kitaran untuk memulakan sesuatu yang baharu, menambah beban, atau menaikkan tempo. Pembaikan otot juga agak cekap di sini. Namun tingkatkan secara berperingkat: tenaga yang tinggi tidak bermakna risiko kecederaan sifar.';

  @override
  String get tipFitnessDetailFertile =>
      'Tenaga dan motivasi biasanya berada pada kemuncak, jadi sesi yang berat selalunya terasa sesuai. Sesetengah orang mempunyai sendi yang sedikit lebih longgar sekitar ovulasi, jadi pemanasan badan yang lebih lama masuk akal untuk sukan dengan perubahan arah yang mendadak. Sengal singkat di satu sisi perut adalah perkara biasa — tetapi jika ia teruk atau berpanjangan, berehat dan dapatkan pemeriksaan pakar perubatan.';

  @override
  String get tipFitnessDetailLuteal =>
      'Apabila haid anda menghampiri, tenaga boleh menurun, kadar denyutan jantung boleh menjadi lebih tinggi untuk usaha yang sama, dan pemulihan boleh mengambil masa lebih lama. Itu ayunan yang dijangka, bukan kemerosotan. Sesi sederhana, versi latihan kekuatan yang sedikit lebih ringan, dan berjalan kaki biasanya lebih mampan di sini. Dengan kembung perut dan payudara sakit, bra yang menyokong dan pemanasan badan yang lebih lama memberi perbezaan yang ketara.';

  @override
  String get tipFitnessDetailUnknown =>
      'Walaupun tanpa mengetahui fasa anda, pergerakan membantu pada bila-bila masa: aktiviti sederhana yang tersebar pada kebanyakan hari dalam seminggu lebih baik daripada sesi yang sangat berat sekali-sekala. Laraskan mengikut perasaan anda — pada hari yang letih, berjalan kaki pun dikira. Setelah anda mencatat beberapa kitaran, anda akan melihat cadangan khusus mengikut fasa di sini.';

  @override
  String get tipNutritionDetailMenstrual =>
      'Pendarahan menyebabkan anda kehilangan zat besi; daging merah, lentil, kacang kuda, sayur-sayuran hijau gelap dan molases membantu menggantikannya. Zat besi daripada tumbuhan diserap dengan jauh lebih baik bersama vitamin C — memerah lemon ke atas masakan lentil ialah versi paling praktikal bagi hal itu. Teh dan kopi semasa makan mengurangkan penyerapan zat besi, jadi memberi jarak sejam antaranya sudah memadai. Minum air yang cukup boleh mengurangkan rasa letih dan sakit kepala yang datang bersama pendarahan.';

  @override
  String get tipNutritionDetailFollicular =>
      'Dengan tenaga yang kembali pulih, badan berada dalam mod membina semula: protein yang mencukupi, bijirin penuh dan sayur-sayuran menyokong hal itu. Meneruskan pengisian simpanan zat besi selepas pendarahan juga masuk akal. Tidak melangkau waktu makan biasanya lebih mudah dalam fasa ini, dan ia menyediakan anda untuk memasuki naik turun selera makan fasa seterusnya dengan lebih seimbang.';

  @override
  String get tipNutritionDetailFertile =>
      'Tiada diet khas yang diperlukan di sini; hidangan yang seimbang dan air yang mencukupi memberi kesan paling besar. Sesetengah orang berasa kembung, yang biasanya bersifat hormon dan sementara. Jika anda merancang kehamilan, ini masa yang sesuai untuk bertanya kepada pakar perubatan tentang asid folik — tetapi itu perbualan dengan mereka, bukan nasihat yang patut diberikan oleh sesebuah aplikasi.';

  @override
  String get tipNutritionDetailLuteal =>
      'Selera makan yang meningkat dan keinginan kepada gula apabila progesteron naik adalah sangat biasa; itu peralihan hormon, bukan masalah kemahuan diri. Menambah protein dan serat pada hidangan mengekalkan gula darah lebih stabil dan melembutkan keinginan itu. Kurangkan garam dan tambah air untuk mengurangkan kembung perut. Makanan kaya magnesium (badam, walnut, sayuran hijau gelap, coklat gelap) mengurangkan senggugut dan ketegangan bagi sesetengah orang. Mengurangkan kafein membantu tidur yang terganggu dalam fasa ini.';

  @override
  String get tipNutritionDetailUnknown =>
      'Apa pun fasanya, perkara yang sama paling membantu: waktu makan yang teratur, protein yang mencukupi, banyak sayur-sayuran, air yang mencukupi, dan makanan kaya zat besi. Memandangkan pendarahan menyebabkan kehilangan zat besi, memberi sedikit perhatian lebih pada hari-hari itu sudah memadai. Setelah anda mencatat beberapa kitaran, anda akan melihat cadangan khusus mengikut fasa di sini.';

  @override
  String get tipSleepLabel => 'Tidur';

  @override
  String get tipSleepMenstrual =>
      'Kekejangan dan rasa tidak selesa boleh mengganggu tidur; mandi air suam atau kusyen panas sebelum tidur boleh membantu.';

  @override
  String get tipSleepFollicular =>
      'Dengan tenaga yang meningkat, ramai berasa lebih segar — tetapi keperluan tidur sebenar tidak banyak berkurang.';

  @override
  String get tipSleepFertile =>
      'Kenaikan sedikit suhu badan berhampiran ovulasi boleh menyukarkan sedikit untuk tidur; bilik yang lebih sejuk boleh membantu.';

  @override
  String get tipSleepLuteal =>
      'Progesteron menaikkan suhu rehat sedikit dan boleh menjadikan tidur lena lebih ringan; bilik sejuk dan gelap serta waktu tidur tetap paling membantu di sini.';

  @override
  String get tipSleepUnknown =>
      'Kualiti tidur cenderung berubah sepanjang kitaran — biasanya paling rapuh sebelum dan semasa haid. Waktu tidur yang tetap ialah asas paling boleh dipercayai tanpa mengira fasa.';

  @override
  String get tipSleepDetailMenstrual =>
      'Semasa haid, tidur sering lebih terganggu — kekejangan, rasa tidak selesa dan bagi sesetengah orang lebih kerap ke tandas boleh menyedarkan pada waktu malam. Mandi air suam, kusyen panas atau regangan ringan sebelum tidur boleh meredakan kekejangan. Jika mengambil ubat tahan sakit, masakan supaya kesannya meliputi awal malam boleh melindungi tidur awal.';

  @override
  String get tipSleepDetailFollicular =>
      'Dengan estrogen meningkat, ramai berasa lebih segar dan bertenaga, yang mungkin dirasakan seperti kurang keperluan tidur. Sebenarnya, hanya lebih mudah untuk kekal jaga. Mengekalkan waktu tidur tetap di sini membantu kemudian, apabila tidur menjadi lebih rapuh dalam fasa lain.';

  @override
  String get tipSleepDetailFertile =>
      'Kenaikan sedikit suhu badan berhampiran ovulasi boleh menyukarkan sedikit untuk tidur, kerana badan secara semula jadi mahu sejuk sebelum tidur. Bilik lebih sejuk, selimut lebih nipis atau mandi air suam sebelum tidur boleh mengimbanginya. Sesiapa yang perasan lebih keinginan atau tenaga sosial pada waktu ini mungkin juga sengaja berjaga lebih lewat.';

  @override
  String get tipSleepDetailLuteal =>
      'Progesteron yang meningkat selepas ovulasi menaikkan suhu rehat sedikit, yang boleh menjadikan tidur lena lebih ringan — kadangkala seperti gelombang panas ringan, kadangkala hanya tidur yang kurang memulihkan. Apabila haid semakin hampir, ketegangan pramenstruasi mungkin turut menambah. Bilik sejuk dan gelap, kurangkan masa skrin sebelum tidur dan waktu tidur tetap paling membantu di sini.';

  @override
  String get tipSleepDetailUnknown =>
      'Belum cukup data untuk menentukan fasa sekarang, tetapi kualiti tidur yang berubah sepanjang kitaran adalah corak biasa — biasanya lebih rapuh sebelum dan semasa haid, lebih stabil pada separuh pertama. Asas paling boleh dipercayai tanpa mengira fasa: waktu tidur dan bangun yang tetap, kurangkan masa skrin sebelum tidur, dan bilik sejuk serta gelap.';
}
