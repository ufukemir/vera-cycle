// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Indonesian (`id`).
class AppLocalizationsId extends AppLocalizations {
  AppLocalizationsId([String locale = 'id']) : super(locale);

  @override
  String get appTitle => 'Vera';

  @override
  String get actionSkip => 'Lewati';

  @override
  String get actionContinue => 'Lanjut';

  @override
  String get actionDone => 'Selesai';

  @override
  String get actionCancel => 'Batal';

  @override
  String get actionDelete => 'Hapus';

  @override
  String get actionEnable => 'Aktifkan';

  @override
  String get commonIDontKnow => 'Aku tidak tahu';

  @override
  String get commonYes => 'Ya';

  @override
  String get commonNo => 'Tidak';

  @override
  String get commonNotSure => 'Tidak yakin';

  @override
  String get pinSetupTitle => 'Atur PIN';

  @override
  String get pinSetupEnterPrompt => 'Pilih PIN 6 digit untuk mengunci aplikasi';

  @override
  String get pinSetupConfirmPrompt => 'Masukkan lagi untuk konfirmasi';

  @override
  String get pinSetupMismatch => 'Tidak cocok — coba lagi ya';

  @override
  String get pinSetupBiometricTitle => 'Buka lebih cepat?';

  @override
  String get pinSetupBiometricBody =>
      'Kamu juga bisa memakai sidik jari atau wajah untuk membuka kunci — PIN tetap berfungsi sebagai cadangan.';

  @override
  String get lockScreenTitle => 'Terkunci';

  @override
  String get lockScreenEnterPin => 'Masukkan PIN kamu';

  @override
  String get lockScreenWrongPin => 'PIN itu tidak cocok';

  @override
  String get lockScreenUseBiometrics => 'Gunakan biometrik';

  @override
  String get lockScreenForgotPin => 'Lupa PIN?';

  @override
  String lockScreenThrottled(int seconds) {
    return 'Terlalu banyak percobaan. Coba lagi dalam $seconds detik';
  }

  @override
  String get lockScreenEraseTitle => 'Hapus semua data?';

  @override
  String get lockScreenEraseBody =>
      'Ini akan menghapus semuanya di perangkat ini secara permanen. Tidak ada akun atau cadangan server, jadi ini tidak bisa dibatalkan.';

  @override
  String get lockScreenEraseConfirm => 'Hapus semuanya';

  @override
  String get onboardingPrivacyTitle => 'Selamat datang';

  @override
  String get onboardingPrivacyBody =>
      'Datamu hanya tersimpan di perangkat ini. Tidak ada akun, tidak ada cloud, tidak ada yang dikirim ke mana pun — aplikasi ini bahkan tidak punya izin memakai internet, dan kamu bisa memeriksanya sendiri di pengaturan ponsel.';

  @override
  String get onboardingLastPeriodTitle => 'Kapan haid terakhirmu mulai?';

  @override
  String get onboardingLastPeriodBody =>
      'Ini membantu kami memulai — kamu selalu bisa memperbaikinya nanti lewat kalender.';

  @override
  String get onboardingPickDate => 'Pilih tanggal';

  @override
  String get onboardingCycleLengthTitle => 'Biasanya berapa lama siklusmu?';

  @override
  String get onboardingCycleLengthBody =>
      'Angka perkiraan saja tidak masalah. Kami akan mulai memberi perkiraan nyata setelah melihat beberapa siklus penuh.';

  @override
  String get onboardingPeriodLengthTitle =>
      'Biasanya berapa hari haidmu berlangsung?';

  @override
  String get onboardingPeriodLengthBody =>
      'Kami akan memakai ini untuk mengisi haid terakhirmu, jadi kamu tidak mulai dari nol.';

  @override
  String get onboardingDaysUnit => 'hari';

  @override
  String get onboardingGoalTitle => 'Apa yang membawamu ke sini?';

  @override
  String get onboardingGoalBody =>
      'Ini hanya membantu kami menampilkan hal yang tepat lebih dulu — kamu bisa mengubahnya kapan saja di Pengaturan.';

  @override
  String get goalTrackPeriod => 'Melacak menstruasiku';

  @override
  String get goalTryingToConceive => 'Sedang mencoba hamil';

  @override
  String get goalPregnancyTracking => 'Melacak kehamilan';

  @override
  String get onboardingRegularityTitle =>
      'Apakah menstruasimu biasanya teratur?';

  @override
  String get onboardingRegularityBody =>
      'Tidak ada jawaban yang salah di sini — ini hanya membantu kami mengenal tubuhmu sedikit lebih baik.';

  @override
  String get onboardingCrampsTitle => 'Apakah kamu biasanya mengalami kram?';

  @override
  String get onboardingCrampsBody =>
      'Kami akan memastikan mudah untuk mencatat perasaanmu di hari-hari seperti itu.';

  @override
  String get onboardingNotificationTitle => 'Ingin pengingat yang lembut?';

  @override
  String get onboardingNotificationBody =>
      'Kami bisa mengingatkanmu sebelum menstruasi diperkirakan datang.';

  @override
  String get onboardingNotificationMockTitle =>
      'Menstruasimu mungkin segera dimulai';

  @override
  String get onboardingNotificationMockBody =>
      'Berdasarkan siklus yang kamu catat';

  @override
  String get onboardingNotificationAllow => 'Aktifkan pengingat';

  @override
  String get onboardingNotificationNotNow => 'Nanti saja';

  @override
  String get onboardingBuildingPlanTitle => 'Menyiapkan semuanya untukmu';

  @override
  String get onboardingBuildingPlanStep1 =>
      'Mengamankan datamu di perangkat ini';

  @override
  String get onboardingBuildingPlanStep2 => 'Menyimpan preferensimu';

  @override
  String get onboardingBuildingPlanStep3 => 'Menyiapkan kalendermu';

  @override
  String get onboardingBuildingPlanDone => 'Semua siap';

  @override
  String get navHome => 'Beranda';

  @override
  String get navCalendar => 'Kalender';

  @override
  String get navInsights => 'Wawasan';

  @override
  String get navSettings => 'Pengaturan';

  @override
  String homeCycleDayLabel(int day) {
    return 'Hari ke-$day';
  }

  @override
  String get homeNoCycleYet => 'Belum ada haid yang dicatat';

  @override
  String get homePhaseMenstrual => 'Haid';

  @override
  String get homePhaseFollicular => 'Fase folikular';

  @override
  String get homePhaseFertileWindow => 'Perkiraan masa subur';

  @override
  String get homePhaseLuteal => 'Fase luteal';

  @override
  String get homePhaseUnknown => 'Data terbaru belum cukup';

  @override
  String get homePredictionInsufficientTitle => 'Data belum cukup';

  @override
  String get homePredictionInsufficientBody =>
      'Catat haid berikutnya, dan kami akan mulai membuat perkiraan.';

  @override
  String homePredictionRangeLabel(String start, String end) {
    return '$start – $end';
  }

  @override
  String get homeConfidenceHigh => 'Keyakinan tinggi';

  @override
  String get homeConfidenceMedium => 'Keyakinan sedang';

  @override
  String get homeConfidenceLow => 'Keyakinan rendah';

  @override
  String get homeIrregularNote =>
      'Panjang siklusmu akhir-akhir ini lebih bervariasi dari biasanya. Jika ini hal baru bagimu, mungkin perlu disampaikan saat pemeriksaan.';

  @override
  String get homeFertileWindowDisclaimer =>
      'Berdasarkan pola siklus umum — bukan metode kontrasepsi.';

  @override
  String get homePeriodStartedButton => 'Haid dimulai hari ini';

  @override
  String get homePeriodStartedSnackbar => 'Tercatat — haid dimulai hari ini';

  @override
  String get actionUndo => 'Urungkan';

  @override
  String get comingSoon => 'Segera hadir';

  @override
  String get dayLogFlowLabel => 'Aliran';

  @override
  String get flowSpotting => 'Flek';

  @override
  String get flowLight => 'Ringan';

  @override
  String get flowMedium => 'Sedang';

  @override
  String get flowHeavy => 'Deras';

  @override
  String get flowNone => 'Tidak ada';

  @override
  String get dayLogSymptomsLabel => 'Gejala';

  @override
  String get symptomCramps => 'Kram';

  @override
  String get symptomHeadache => 'Sakit kepala';

  @override
  String get symptomBloating => 'Kembung';

  @override
  String get symptomBreastTenderness => 'Payudara nyeri';

  @override
  String get symptomAcne => 'Jerawat';

  @override
  String get symptomFatigue => 'Kelelahan';

  @override
  String get symptomNausea => 'Mual';

  @override
  String get symptomBackPain => 'Sakit punggung';

  @override
  String get symptomAppetiteChange => 'Perubahan nafsu makan';

  @override
  String get symptomSleepTrouble => 'Sulit tidur';

  @override
  String get symptomPelvicPain => 'Nyeri panggul';

  @override
  String get symptomDizziness => 'Pusing';

  @override
  String get dayLogMoodLabel => 'Suasana hati';

  @override
  String get moodCalm => 'Tenang';

  @override
  String get moodAnxious => 'Cemas';

  @override
  String get moodIrritable => 'Mudah tersinggung';

  @override
  String get moodLow => 'Lesu';

  @override
  String get moodEnergetic => 'Berenergi';

  @override
  String get moodHappy => 'Senang';

  @override
  String get moodContent => 'Puas';

  @override
  String get moodSad => 'Sedih';

  @override
  String get moodDepressed => 'Depresi';

  @override
  String get moodEmotional => 'Sensitif';

  @override
  String get dayLogNoteLabel => 'Catatan';

  @override
  String get dayLogNoteHint => 'Apa pun yang ingin kamu ingat tentang hari ini';

  @override
  String get dayLogOptionalTrackersLabel => 'Pelacak opsional';

  @override
  String get dayLogSexualActivityLabel => 'Aktivitas seksual';

  @override
  String get dayLogBbtLabel => 'Suhu basal tubuh';

  @override
  String get dayLogMucusLabel => 'Lendir serviks';

  @override
  String get mucusDry => 'Kering';

  @override
  String get mucusSticky => 'Lengket';

  @override
  String get mucusCreamy => 'Krim';

  @override
  String get mucusWatery => 'Encer';

  @override
  String get mucusEggWhite => 'Putih telur';

  @override
  String get dayLogSavedIndicator => 'Tersimpan';

  @override
  String get homeOpenTodayLog => 'Tambah detail untuk hari ini';

  @override
  String get calendarLegendActual => 'Haid tercatat';

  @override
  String get calendarLegendPredicted => 'Perkiraan jendela';

  @override
  String get calendarLegendFertile => 'Perkiraan masa subur';

  @override
  String get calendarLegendOvulation => 'Perkiraan ovulasi';

  @override
  String get dayDetailFertileTitle =>
      'Kamu sedang berada di perkiraan masa subur';

  @override
  String get dayDetailOvulationTitle => 'Perkiraan hari ovulasi';

  @override
  String get dayDetailOvulationBody =>
      'Kehamilan biasanya lebih mungkin terjadi di sekitar hari ini, berdasarkan waktu yang umum — ini perkiraan, bukan jaminan.';

  @override
  String get insightsCyclesLoggedLabel => 'Siklus tercatat';

  @override
  String get insightsAveragePeriodLengthLabel => 'Rata-rata lama haid';

  @override
  String get insightsAverageCycleLengthLabel => 'Rata-rata panjang siklus';

  @override
  String insightsVariabilityLabel(String days) {
    return 'Bervariasi sekitar $days hari';
  }

  @override
  String get insightsNotEnoughDataTitle => 'Data belum cukup';

  @override
  String get insightsNotEnoughDataBody =>
      'Catat beberapa siklus penuh, dan rata-ratamu akan muncul di sini.';

  @override
  String get insightsSymptomFrequencyTitle => 'Gejala berdasarkan hari siklus';

  @override
  String get insightsNoSymptomsLogged => 'Belum ada gejala yang dicatat';

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
  String get settingsWeekStartLabel => 'Minggu dimulai pada';

  @override
  String get settingsWeekStartMonday => 'Senin';

  @override
  String get settingsWeekStartSunday => 'Minggu';

  @override
  String get settingsTemperatureUnitLabel => 'Satuan suhu';

  @override
  String get settingsTemperatureCelsius => 'Celsius';

  @override
  String get settingsTemperatureFahrenheit => 'Fahrenheit';

  @override
  String get settingsRemindersLabel => 'Ingatkan aku sebelum haid';

  @override
  String get settingsRemindersPeriodEndLabel =>
      'Ingatkan saat haidku seharusnya berakhir';

  @override
  String get settingsRemindersMedicationLabel => 'Pengingat obat';

  @override
  String get settingsRemindersWaterLabel => 'Pengingat minum air';

  @override
  String get settingsRemindersAppointmentLabel => 'Pengingat janji temu';

  @override
  String get settingsRemindersAppointmentSet => 'Atur tanggal & waktu';

  @override
  String get settingsRemindersAppointmentClear => 'Hapus';

  @override
  String get settingsOptionalTrackersHeading => 'Pelacak opsional';

  @override
  String get settingsOptionalTrackersBody =>
      'Nonaktif secara default. Mengaktifkan salah satu akan menambahkannya ke layar catatan harian.';

  @override
  String get settingsSexualActivityToggle => 'Aktivitas seksual';

  @override
  String get settingsBbtToggle => 'Suhu basal tubuh';

  @override
  String get settingsMucusToggle => 'Lendir serviks';

  @override
  String get settingsBreastExamToggle => 'Periksa payudara sendiri';

  @override
  String get settingsCervixToggle => 'Posisi & kekakuan serviks';

  @override
  String get settingsPrivacyEntry => 'Privasi';

  @override
  String get settingsDeleteAllData => 'Hapus semua data';

  @override
  String get privacyScreenTitle => 'Privasi';

  @override
  String get privacyScreenIntro =>
      'Berikut yang sebenarnya terjadi pada datamu, dengan bahasa sederhana.';

  @override
  String get privacyScreenStorage =>
      'Semua yang kamu catat dienkripsi dan hanya disimpan di perangkat ini, dalam satu file. Kunci enkripsi tersimpan di perangkat keras aman ponselmu — Keychain di iOS, Keystore di Android — bukan di dalam file itu sendiri.';

  @override
  String get privacyScreenNoNetwork =>
      'Aplikasi ini tidak memiliki server. Bahkan tidak punya izin memakai internet sama sekali — kamu bisa memeriksanya sendiri di pengaturan aplikasi ponselmu.';

  @override
  String get privacyScreenNoThirdParty =>
      'Tidak ada analitik, tidak ada pelaporan crash, dan tidak ada SDK pihak ketiga dalam bentuk apa pun.';

  @override
  String get privacyScreenExport =>
      'Satu-satunya cara datamu keluar dari perangkat ini adalah jika kamu mengekspornya sendiri, dan ekspor itu dienkripsi dengan kata sandi yang hanya kamu ketahui.';

  @override
  String get privacyScreenDelete =>
      'Menghapus datamu itu nyata dan langsung. Tidak ada akun atau cadangan di pihak kami — sekali hilang, hilang selamanya.';

  @override
  String get adPlaceholderLabel => 'Ruang iklan';

  @override
  String get adPlaceholderUpgradeCta =>
      'Beralih ke Premium untuk pengalaman bebas iklan';

  @override
  String get reminderNotificationTitle => 'Haidmu mungkin akan segera dimulai';

  @override
  String get reminderNotificationBody =>
      'Berdasarkan siklus yang kamu catat, perkiraan jendelamu sudah dekat.';

  @override
  String get reminderPeriodEndTitle => 'Haidmu mungkin akan segera berakhir';

  @override
  String get reminderPeriodEndBody =>
      'Jika masih berlangsung, itu benar-benar normal — ini hanya pengingat lembut.';

  @override
  String get reminderMedicationTitle => 'Pengingat obat';

  @override
  String get reminderMedicationBody => 'Waktunya minum obat.';

  @override
  String get reminderWaterTitle => 'Tetap terhidrasi';

  @override
  String get reminderWaterBody => 'Pengingat kecil untuk minum air.';

  @override
  String get reminderAppointmentTitle => 'Janji temu mendatang';

  @override
  String get reminderAppointmentBody =>
      'Kamu punya janji temu yang akan datang.';

  @override
  String get settingsExportEntry => 'Ekspor & cadangan';

  @override
  String get exportBackupHeading => 'Cadangan terenkripsi';

  @override
  String get exportBackupBody =>
      'Simpan salinan terenkripsi dari riwayatmu untuk dipindahkan ke perangkat baru. Kamu memerlukan kata sandi itu lagi untuk memulihkannya — tidak ada cara lain untuk mengambilnya kembali.';

  @override
  String get exportCreateBackupButton => 'Buat cadangan';

  @override
  String get exportRestoreBackupButton => 'Pulihkan dari cadangan';

  @override
  String get exportPasswordLabel => 'Kata sandi';

  @override
  String get exportPasswordConfirmLabel => 'Konfirmasi kata sandi';

  @override
  String get exportPasswordMismatch => 'Kata sandi tidak cocok';

  @override
  String get exportPasswordTooShort => 'Gunakan minimal 8 karakter';

  @override
  String get exportRestoreConfirmTitle => 'Ganti semua data di perangkat ini?';

  @override
  String get exportRestoreConfirmBody =>
      'Memulihkan cadangan akan mengganti semua yang saat ini tercatat di perangkat ini. Ini tidak bisa dibatalkan.';

  @override
  String get exportRestoreConfirmAction => 'Pulihkan';

  @override
  String get exportWrongPassword =>
      'Kata sandi itu tidak cocok dengan cadangan ini';

  @override
  String get exportInvalidFile => 'File itu sepertinya bukan cadangan Vera';

  @override
  String get exportBackupCreated => 'Cadangan siap dibagikan';

  @override
  String get exportRestoreSuccess => 'Cadangan berhasil dipulihkan';

  @override
  String get exportDoctorReportHeading => 'Laporan untuk dokter';

  @override
  String get exportDoctorReportBody =>
      'Ringkasan yang bisa kamu bagikan dengan tenaga medis.';

  @override
  String get exportIncludeNotesToggle => 'Sertakan catatan pribadi';

  @override
  String get exportShareCsvButton => 'Bagikan sebagai CSV';

  @override
  String get exportPrintPdfButton => 'Cetak / Simpan sebagai PDF';

  @override
  String get doctorReportDisclaimer =>
      'Dibuat oleh Vera dari data yang dimasukkan pengguna. Bukan diagnosis medis.';

  @override
  String get doctorReportGeneratedOn => 'Dibuat pada';

  @override
  String get doctorReportSummaryHeading => 'Ringkasan';

  @override
  String get doctorReportDailyLogHeading => 'Catatan harian';

  @override
  String get doctorReportColumnDate => 'Tanggal';

  @override
  String get doctorReportTimelineHeading => 'Garis waktu siklus';

  @override
  String get doctorReportCycleLabel => 'Siklus';

  @override
  String get doctorReportTimelineLegendPeriod => 'Menstruasi';

  @override
  String get doctorReportTimelineLegendCycle => 'Sisa siklus';

  @override
  String get doctorReportTimelineOngoing => 'Berlangsung';

  @override
  String get dailyInsightLabel => 'Tahukah kamu?';

  @override
  String get insightMenstrual1 =>
      'Lapisan rahimmu sedang meluruh sekarang — kebanyakan haid berlangsung 3 hingga 7 hari, dan itu sepenuhnya normal.';

  @override
  String get insightMenstrual2 =>
      'Makanan kaya zat besi seperti sayuran hijau dan kacang lentil bisa membantu mengganti yang hilang dari tubuhmu minggu ini.';

  @override
  String get insightFollicular1 =>
      'Estrogen sedang meningkat, dan banyak orang merasa lebih berenergi dan lebih fokus mulai sekarang.';

  @override
  String get insightFollicular2 =>
      'Tubuhmu sedang menyiapkan sel telur untuk dilepaskan — fase ini bisa berlangsung dari satu minggu hingga beberapa minggu.';

  @override
  String get insightFertile1 =>
      'Ini adalah perkiraan masa suburmu — hari-hari di sekitar ovulasi saat kehamilan paling mungkin terjadi, berdasarkan pola siklus umum.';

  @override
  String get insightFertile2 =>
      'Beberapa orang merasakan sedikit kenaikan suhu basal tubuh atau perubahan lendir serviks di sekitar ovulasi.';

  @override
  String get insightLuteal1 =>
      'Progesteron meningkat setelah ovulasi — ini sering menjadi saat munculnya gejala PMS seperti perubahan suasana hati atau kembung.';

  @override
  String get insightLuteal2 =>
      'Jika kehamilan tidak terjadi, kadar hormon turun menjelang akhir fase ini, memicu haid berikutnya.';

  @override
  String get insightUnknown1 =>
      'Panjang siklus sangat bervariasi antar orang — sekitar 21 hingga 35 hari dianggap umum.';

  @override
  String get insightsPhaseTipsTitle => 'Mungkin terasa baik di fase ini';

  @override
  String get tipFitnessLabel => 'Gerak tubuh';

  @override
  String get tipNutritionLabel => 'Nutrisi';

  @override
  String get tipFitnessMenstrual =>
      'Gerakan ringan — jalan kaki, peregangan, atau yoga pemulihan — mungkin terasa lebih baik daripada olahraga intens saat ini.';

  @override
  String get tipFitnessFollicular =>
      'Energi biasanya meningkat di fase ini — waktu yang baik untuk mencoba latihan baru atau mendorong diri sedikit lebih keras.';

  @override
  String get tipFitnessFertile =>
      'Banyak orang merasa paling berenergi di sini — fase yang baik untuk latihan intensitas lebih tinggi jika kamu menyukainya.';

  @override
  String get tipFitnessLuteal =>
      'Jika energi menurun menjelang akhir fase ini, latihan kekuatan intensitas rendah atau berenang bisa terasa lebih berkelanjutan.';

  @override
  String get tipFitnessUnknown =>
      'Gerakan apa pun yang terasa baik hari ini adalah pilihan yang baik — tidak ada satu rutinitas \"benar\" untuk setiap hari.';

  @override
  String get tipNutritionMenstrual =>
      'Makanan kaya zat besi seperti sayuran hijau, lentil, dan daging merah dapat membantu mengganti apa yang hilang dari tubuhmu minggu ini.';

  @override
  String get tipNutritionFollicular =>
      'Makanan yang lebih ringan dan segar sering terasa cocok saat energi meningkat — tapi tidak ada satu cara makan yang \"benar\" di fase ini.';

  @override
  String get tipNutritionFertile =>
      'Tetap terhidrasi dan menjaga makanan seimbang mendukung energimu selama fase yang terasa lebih aktif ini.';

  @override
  String get tipNutritionLuteal =>
      'Keinginan makan bisa berubah di sini — karbohidrat kompleks dan makanan kaya magnesium seperti kacang-kacangan dan cokelat hitam jadi pilihan umum.';

  @override
  String get tipNutritionUnknown =>
      'Makanan seimbang dan teratur adalah pilihan default yang baik selama fasemu belum jelas.';

  @override
  String get predictionSettingsEntry => 'Pengaturan prediksi';

  @override
  String get predictionSettingsIntro =>
      'Ini adalah asumsi, ditampilkan secara terbuka. Setelah kamu mencatat 2 siklus penuh, perkiraan sebenarnya di Beranda dihitung dari datamu sendiri — angka ini berhenti dipakai untuk itu.';

  @override
  String get predictionSettingsPeriodLengthLabel => 'Lama haid biasanya';

  @override
  String get predictionSettingsCycleLengthLabel => 'Panjang siklus biasanya';

  @override
  String get predictionSettingsCycleLengthHint =>
      'Digunakan untuk menskalakan cincin di Beranda sampai kami punya data nyata.';

  @override
  String get predictionSettingsLutealLabel => 'Panjang fase luteal';

  @override
  String get predictionSettingsLutealHint =>
      'Jumlah hari biasa antara ovulasi dan haid berikutnya. Digunakan untuk menempatkan perkiraan masa subur — nilai ini tetap dipakai bahkan setelah perkiraan nyata dimulai.';

  @override
  String get dayLogEnergyLabel => 'Energi';

  @override
  String get energyLevelLow => 'Rendah';

  @override
  String get energyLevelMedium => 'Sedang';

  @override
  String get energyLevelHigh => 'Tinggi';

  @override
  String get energyLevelEnergetic => 'Penuh energi';

  @override
  String get dayLogSkinHairLabel => 'Kulit & rambut';

  @override
  String get skinHealthyGlow => 'Bercahaya sehat';

  @override
  String get skinRedness => 'Kemerahan';

  @override
  String get skinDryness => 'Kering';

  @override
  String get skinOiliness => 'Berminyak';

  @override
  String get hairGoodDay => 'Rambut lagi bagus';

  @override
  String get hairBadDay => 'Rambut lagi jelek';

  @override
  String get hairLoss => 'Rambut rontok';

  @override
  String get scalpOily => 'Kulit kepala berminyak';

  @override
  String get dayLogBreastExamLabel => 'Periksa payudara sendiri';

  @override
  String get breastExamAllNormal => 'Tidak ada yang aneh';

  @override
  String get breastExamLump => 'Benjolan';

  @override
  String get breastExamIndentation => 'Lekukan';

  @override
  String get breastExamRedness => 'Kemerahan';

  @override
  String get breastExamCrackedNipple => 'Puting pecah-pecah';

  @override
  String get breastExamDischarge => 'Keluar cairan';

  @override
  String get cervixPositionLabel => 'Posisi serviks';

  @override
  String get cervixPositionLow => 'Rendah';

  @override
  String get cervixPositionMedium => 'Sedang';

  @override
  String get cervixPositionHigh => 'Tinggi';

  @override
  String get cervixOpeningLabel => 'Bukaan serviks';

  @override
  String get cervixOpeningClosed => 'Tertutup';

  @override
  String get cervixOpeningMedium => 'Sedang';

  @override
  String get cervixOpeningOpen => 'Terbuka';

  @override
  String get cervixFirmnessLabel => 'Kekakuan serviks';

  @override
  String get cervixFirmnessSoft => 'Lembut';

  @override
  String get cervixFirmnessMedium => 'Sedang';

  @override
  String get cervixFirmnessFirm => 'Kaku';

  @override
  String get dayLogWaterLabel => 'Air';

  @override
  String get dayLogSleepLabel => 'Tidur';

  @override
  String get dayLogWeightLabel => 'Berat badan';

  @override
  String get dayLogMedicationsLabel => 'Obat';

  @override
  String get dayLogAddMedication => 'Tambah obat';

  @override
  String get dayLogMedicationNameHint => 'Nama obat';
}
