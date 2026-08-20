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
      'Data siklusmu hanya tersimpan di perangkat ini, terenkripsi. Tidak ada akun dan tidak ada sinkronisasi cloud — tidak ada yang kamu catat diunggah. Kuncinya tersimpan di perangkat keras aman ponselmu, dan kamu bisa mengekspor atau menghapus semuanya kapan saja.';

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
  String get onboardingBirthYearTitle => 'Kamu lahir tahun berapa?';

  @override
  String get onboardingBirthYearBody =>
      'Hanya untuk gambaran yang lebih lengkap — tidak pernah dipakai untuk prediksi apa pun.';

  @override
  String get onboardingPmsTitle => 'Biasanya ada yang muncul sebelumnya?';

  @override
  String get onboardingPmsBody =>
      'Pilih sebanyak yang sesuai. Tidak disimpan di mana pun, tidak ada jawaban salah.';

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
  String get navTrack => 'Lacak';

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
  String get sexLifeNone => 'Tidak ada';

  @override
  String get sexLifeUnprotected => 'Seks tanpa pengaman';

  @override
  String get sexLifeProtected => 'Seks dengan pengaman';

  @override
  String get sexLifeMasturbation => 'Masturbasi';

  @override
  String get sexLifeNoOrgasm => 'Tanpa orgasme';

  @override
  String get sexLifeOrgasm => 'Orgasme';

  @override
  String get sexLifeHighDesire => 'Gairah tinggi';

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
      other: 'Bervariasi sekitar $daysString hari',
    );
    return '$_temp0';
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
  String get remindersScreenTitle => 'Pengingat';

  @override
  String get remindersGroupCycle => 'Haid & kesuburan';

  @override
  String get remindersGroupMedication => 'Obat';

  @override
  String get remindersGroupLifestyle => 'Gaya hidup';

  @override
  String get remindersGroupAppointment => 'Janji temu';

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
  String get privacyScreenStorageTitle => 'Terenkripsi di perangkat ini';

  @override
  String get privacyScreenNoNetworkTitle => 'Tanpa server, tanpa akun';

  @override
  String get privacyScreenNoThirdPartyTitle => 'Tanpa pelacakan';

  @override
  String get privacyScreenExportTitle => 'Hanya kamu yang bisa mengekspor';

  @override
  String get privacyScreenDeleteTitle => 'Penghapusan bersifat permanen';

  @override
  String get privacyScreenStorage =>
      'Semua yang kamu catat dienkripsi dan hanya disimpan di perangkat ini, dalam satu file. Kunci enkripsi tersimpan di perangkat keras aman ponselmu — Keychain di iOS, Keystore di Android — bukan di dalam file itu sendiri.';

  @override
  String get privacyScreenNoNetwork =>
      'Aplikasi ini tidak punya server sendiri maupun sistem akun — catatanmu tidak pernah diunggah. Versi gratis memuat iklan Google yang terhubung ke internet; iklan itu tidak pernah menerima apa pun yang kamu catat.';

  @override
  String get privacyScreenNoThirdParty =>
      'Tidak ada analitik, pelaporan crash, atau SDK pelacakan. Satu-satunya komponen pihak ketiga adalah SDK iklan Google di versi gratis — Premium menghapusnya sepenuhnya.';

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

  @override
  String get dayLogBirthControlLabel => 'Kontrasepsi';

  @override
  String get dayLogOtherMedicationsLabel => 'Obat lain';

  @override
  String get birthControlPillTaken => 'Pil diminum';

  @override
  String get birthControlPillLate => 'Pil telat diminum';

  @override
  String get birthControlPillMissed => 'Pil terlewat';

  @override
  String get birthControlPatch => 'Koyo';

  @override
  String get birthControlRing => 'Cincin';

  @override
  String get birthControlInjection => 'Suntik';

  @override
  String get birthControlImplant => 'Implan';

  @override
  String get birthControlIud => 'IUD';

  @override
  String get navAssistant => 'Asisten';

  @override
  String get assistantTitle => 'Asisten Vera';

  @override
  String get assistantEndChatTitle => 'Akhiri obrolan ini?';

  @override
  String get assistantEndChatBody =>
      'Pesan hanya ada di memori dan tidak disimpan di mana pun, jadi tidak bisa dikembalikan.';

  @override
  String get assistantEndChatConfirm => 'Akhiri obrolan';

  @override
  String get assistantInputHint => 'Tanyakan tentang siklusmu…';

  @override
  String get assistantIntro =>
      'Hai! Aku bisa menjawab pertanyaan tentang haid, siklus, dan cara kerja Vera — langsung di ponselmu, tidak ada yang keluar dari perangkatmu. Aku bukan dokter dan ini bukan nasihat medis.';

  @override
  String get insightMenstrual3 =>
      'Darah haid bukan \"darah kotor\" — itu campuran darah dan lapisan rahim, bagian yang sepenuhnya normal dari siklus.';

  @override
  String get insightMenstrual4 =>
      'Kehangatan lembut di perut bawah benar-benar meredakan kram — botol air hangat adalah cara klasik yang terbukti.';

  @override
  String get insightMenstrual5 =>
      'Aliran biasanya paling deras di dua hari pertama lalu berkurang — pola itu umum.';

  @override
  String get insightMenstrual6 =>
      'Merasa sedikit lebih lelah saat haid itu umum — zat besi keluar dari tubuh bersama darah haid.';

  @override
  String get insightFollicular3 =>
      'Estrogen membangun kembali lapisan rahim setelah haid — tubuhmu sedang bersiap dari awal.';

  @override
  String get insightFollicular4 =>
      'Kulit sering terlihat paling bersih di fase ini saat hormon mulai stabil.';

  @override
  String get insightFollicular5 =>
      'Daya tahan dan waktu reaksi mencapai puncak di akhir fase folikular bagi banyak orang.';

  @override
  String get insightFollicular6 =>
      'Panjang fase inilah yang paling bervariasi antar orang — fase luteal jauh lebih konstan.';

  @override
  String get insightFertile3 =>
      'Sel telur hidup sekitar 12–24 jam, tapi sperma bisa menunggu hingga 5 hari — itulah mengapa masa subur mencakup beberapa hari.';

  @override
  String get insightFertile4 =>
      'Menjelang ovulasi, lendir serviks sering menjadi bening dan elastis — seperti putih telur mentah.';

  @override
  String get insightFertile5 =>
      'Sebagian orang merasakan nyeri singkat di satu sisi saat ovulasi — bahkan ada namanya: mittelschmerz.';

  @override
  String get insightFertile6 =>
      'Suhu basal tubuh naik sedikit *setelah* ovulasi — ia mengonfirmasi, bukan memprediksi.';

  @override
  String get insightLuteal3 =>
      'Progesteron memuncak sekitar seminggu setelah ovulasi — kembung dan nyeri payudara saat itu umum terjadi.';

  @override
  String get insightLuteal4 =>
      'Keinginan makan karbohidrat sebelum haid itu nyata — kebutuhan energi sedikit naik di fase luteal.';

  @override
  String get insightLuteal5 =>
      'Gejala PMS biasanya mereda satu-dua hari setelah pendarahan dimulai.';

  @override
  String get insightLuteal6 =>
      'Rutinitas tidur yang konsisten bisa sangat meringankan penurunan suasana hati di akhir fase luteal.';

  @override
  String get insightUnknown2 =>
      'Mencatat tiga siklus saja sering cukup untuk melihat pola khasmu muncul.';

  @override
  String get insightUnknown3 =>
      'Siklus itu personal — membandingkan siklusmu dengan milik teman jarang memberi info berguna.';

  @override
  String get insightUnknown4 =>
      'Stres, perjalanan, dan sakit bisa menggeser ovulasi — haid yang \"terlambat\" sering hanya berarti ovulasi yang terlambat.';

  @override
  String get settingsThemeLabel => 'Tema';

  @override
  String get settingsThemeSystem => 'Sistem';

  @override
  String get settingsThemeLight => 'Terang';

  @override
  String get settingsThemeDark => 'Gelap';

  @override
  String get settingsMascotLabel => 'Maskot pendamping';

  @override
  String get mascotDroplet => 'Tetesan';

  @override
  String get mascotFlower => 'Bunga';

  @override
  String get mascotMoon => 'Bulan';

  @override
  String get mascotNone => 'Tidak ada';

  @override
  String homeWindowCountdown(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: 'Perkiraan jendela dimulai sekitar $days hari lagi',
    );
    return '$_temp0';
  }

  @override
  String homeOvulationCountdown(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: 'Perkiraan ovulasi sekitar $days hari lagi',
    );
    return '$_temp0';
  }

  @override
  String get homeQuickLogTitle => 'Bagaimana perasaan tubuhmu hari ini?';

  @override
  String get actionSave => 'Simpan';

  @override
  String get insightsTrackerHubTitle => 'Pelacakmu';

  @override
  String get trackerHistoryEmpty => 'Belum ada catatan dalam rentang ini';

  @override
  String get trackerStatAverage => 'Rata-rata';

  @override
  String get trackerStatLowest => 'Terendah';

  @override
  String get trackerStatHighest => 'Tertinggi';

  @override
  String get trackerStatLatest => 'Terbaru';

  @override
  String get rangeFilter1m => '1 bln';

  @override
  String get rangeFilter3m => '3 bln';

  @override
  String get rangeFilter6m => '6 bln';

  @override
  String get dayLogOvulationTestLabel => 'Tes ovulasi';

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
  String get pregnancyTestLabel => 'Tes kehamilan';

  @override
  String get pregnancyTestPositive => 'Positif';

  @override
  String get pregnancyTestFaint => 'Garis samar';

  @override
  String get pregnancyTestNegative => 'Negatif';

  @override
  String get settingsOvulationTestToggle => 'Tes ovulasi';

  @override
  String get settingsRemindersOvulationLabel => 'Pemberitahuan masa subur';

  @override
  String get reminderOvulationTitle => 'Perkiraan masa subur mendekat';

  @override
  String get reminderOvulationBody =>
      'Berdasarkan siklus yang kamu catat, perkiraan masa suburmu mungkin segera dimulai.';

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
  String get assistantTyping => 'Vera sedang mengetik…';

  @override
  String get premiumTitle => 'Vera Premium';

  @override
  String get premiumHeadline => 'Vera Premium';

  @override
  String get premiumSubhead =>
      'Semua fitur pelacakan tetap gratis selamanya — riwayatmu tidak pernah dikunci. Premium menambahkan pelacak milikmu, wawasan lebih dalam, pengingat sendiri, dan tampilan ekstra, serta menghapus iklan.';

  @override
  String get premiumBenefitNoAds => 'Tanpa iklan di mana pun dalam aplikasi';

  @override
  String get premiumBenefitSupport =>
      'Mendukung aplikasi independen yang mengutamakan privasi';

  @override
  String get premiumMonthly => 'Bulanan';

  @override
  String get premiumYearly => 'Tahunan';

  @override
  String get premiumYearlyNote => 'Ditagih sekali setahun';

  @override
  String premiumPerMonth(String price) {
    return '$price / bulan';
  }

  @override
  String get premiumBilledMonthly => 'Ditagih bulanan';

  @override
  String get premiumStaysFreeTitle => 'Yang tetap gratis';

  @override
  String get premiumStaysFreeBody =>
      'Kalender, seluruh riwayatmu, statistik dasar, dan ekspor gratis selamanya. Premium menambah, tidak pernah mengambil kembali.';

  @override
  String get premiumSubscribeCta => 'Lanjutkan';

  @override
  String get premiumRestore => 'Pulihkan pembelian';

  @override
  String get premiumCancelNote =>
      'Batalkan kapan saja lewat akun toko aplikasimu. Tanpa hitung mundur, tanpa tekanan — kalau sekarang belum waktunya, versi gratis tetap berjalan seperti biasa.';

  @override
  String get premiumActiveBadge => 'Premium aktif';

  @override
  String get premiumDevToggle => 'Simulasikan Premium (pengembangan)';

  @override
  String get settingsPremiumEntry => 'Vera Premium';

  @override
  String get adTestNotice => 'Iklan uji — belum penempatan asli';

  @override
  String get settingsPregnancyModeLabel => 'Mode kehamilan';

  @override
  String get pregnancyLmpLabel => 'Hari pertama haid terakhir';

  @override
  String pregnancyWeekLabel(int weeks, int days) {
    return 'Minggu $weeks, hari $days';
  }

  @override
  String get pregnancyDueDateLabel => 'Perkiraan tanggal lahir';

  @override
  String pregnancyDaysLeft(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: 'Sekitar $days hari lagi',
    );
    return '$_temp0';
  }

  @override
  String pregnancyTrimesterLabel(int n) {
    return 'Trimester $n';
  }

  @override
  String get pregnancyDisclaimer =>
      'Tanggal diperkirakan dari haid terakhirmu memakai aturan standar 280 hari. USG memberi tanggal yang lebih akurat, dan ovulasi terlambat menggeser angka ini — ini informasi, bukan perawatan medis.';

  @override
  String get pregnancyNoteUnder5 =>
      'Kebanyakan orang belum merasakan apa pun — karena usia kehamilan dihitung dari haid terakhir, dua minggu pertama sebenarnya terjadi sebelum pembuahan.';

  @override
  String get pregnancyNoteUnder9 =>
      'Mual, payudara nyeri, dan kelelahan umum terjadi saat ini. Waktu yang baik untuk mengatur janji pemeriksaan pertama.';

  @override
  String get pregnancyNoteUnder13 =>
      'Akhir trimester pertama sudah dekat; pada banyak orang mual mulai mereda sekitar waktu ini.';

  @override
  String get pregnancyNoteUnder20 =>
      'Energi sering kembali pada rentang ini. Gerakan pertama bisa terasa kapan saja antara minggu 16 dan 22.';

  @override
  String get pregnancyNoteUnder28 =>
      'Gerakan menjadi lebih jelas dan mulai membentuk pola. Sakit punggung dan nyeri ulu hati umum terjadi pada rentang ini.';

  @override
  String get pregnancyNoteUnder34 =>
      'Kamu berada di trimester ketiga. Sesak napas, sering buang air kecil, dan kontraksi Braxton-Hicks umum terjadi.';

  @override
  String get pregnancyNoteUnder38 =>
      'Bayi bersiap untuk kelahiran. Waktu yang baik untuk menyiapkan tas rumah sakit dan rencana persalinan.';

  @override
  String get pregnancyNoteTerm =>
      'Kehamilan sudah cukup bulan — kelahiran bisa terjadi kapan saja antara minggu 37 dan 42; minggu 40 adalah rata-rata, bukan tenggat.';

  @override
  String get pregnancyWeeklyNoteTitle => 'Minggu ini';

  @override
  String get pregnancyNeedsLmp =>
      'Tambahkan hari pertama haid terakhirmu untuk mulai melacak.';

  @override
  String get pregnancyOutOfRange =>
      'Tanggal itu lebih dari 42 minggu lalu — perbarui atau matikan mode kehamilan.';

  @override
  String get partnerShareTitle => 'Bagikan ringkasan dengan pasangan';

  @override
  String get partnerShareBody =>
      'Membuat ringkasan teks singkat — fase saat ini dan perkiraan jendelamu — yang kamu kirim sendiri lewat aplikasi apa pun. Tidak ada sinkronisasi langsung dan akun pasangan: tidak ada yang dibagikan kecuali kamu mengirimnya.';

  @override
  String get partnerShareCta => 'Buat ringkasan';

  @override
  String get partnerSummaryHeader => 'Ringkasan siklus dari Vera';

  @override
  String get settingsHomeThemeLabel => 'Latar beranda';

  @override
  String get homeThemeWheat => 'Gandum';

  @override
  String get homeThemeSky => 'Langit';

  @override
  String get homeThemeField => 'Ladang';

  @override
  String get homeThemeBlossom => 'Bunga';

  @override
  String get homeThemePlain => 'Polos';

  @override
  String get backupNudgeTitle => 'Simpan salinan datamu';

  @override
  String get backupNudgeBody =>
      'Semuanya hanya ada di ponsel ini. Kalau hilang, rusak, atau direset, riwayatmu ikut hilang — cadangan terenkripsi hanya butuh sebentar dan hanya kamu yang bisa membukanya.';

  @override
  String get backupNudgeCta => 'Cadangkan sekarang';

  @override
  String get backupNudgeDismiss => 'Nanti';

  @override
  String backupLastDone(String date) {
    return 'Cadangan terakhir: $date';
  }

  @override
  String get backupNever => 'Belum ada cadangan';

  @override
  String get settingsRemindersBackupLabel => 'Ingatkan untuk mencadangkan';

  @override
  String get reminderBackupTitle => 'Waktunya mencadangkan Vera';

  @override
  String get reminderBackupBody =>
      'Riwayatmu hanya ada di ponsel ini. Cadangan terenkripsi cepat menjaganya tetap aman.';

  @override
  String get notificationChannelPeriodStart => 'Haid mendatang';

  @override
  String get notificationChannelPeriodEnd => 'Cek akhir haid';

  @override
  String get notificationChannelMedication => 'Obat';

  @override
  String get notificationChannelWater => 'Minum air';

  @override
  String get notificationChannelAppointment => 'Janji temu';

  @override
  String get notificationChannelOvulation => 'Masa subur';

  @override
  String get notificationChannelBackup => 'Pengingat pencadangan';

  @override
  String get calendarDayDetailTitle => 'Hari ini';

  @override
  String get calendarDayNothingLogged => 'Belum ada catatan untuk hari ini';

  @override
  String get calendarDayOpenLog => 'Buka catatan harian';

  @override
  String get cycleHistoryTitle => 'Siklus sebelumnya';

  @override
  String get cycleTrendsTitle => 'Tren siklus';

  @override
  String get cycleHistoryEmpty =>
      'Catat beberapa haid dan riwayat siklusmu akan muncul di sini.';

  @override
  String get cycleHistoryOngoing => 'Berlangsung';

  @override
  String cycleHistoryLength(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: 'Siklus $days hari',
    );
    return '$_temp0';
  }

  @override
  String cycleHistoryPeriodLength(int days) {
    return 'Haid berlangsung $days hari';
  }

  @override
  String cycleHistoryVsAverage(String diff) {
    return '$diff dibanding rata-ratamu';
  }

  @override
  String get insightsCycleHistoryEntry => 'Siklus sebelumnya';

  @override
  String get homeEmptyTitle => 'Mari mulai dari haid terakhirmu';

  @override
  String get homeEmptyBody =>
      'Ketuk tombol di atas pada hari haidmu dimulai. Setelah dua siklus penuh Vera bisa mulai memperkirakan — sampai saat itu ia tidak akan berpura-pura tahu.';

  @override
  String get homeEmptyBackdate => 'Sudah dimulai sebelumnya';

  @override
  String get settingsAdPrivacyEntry => 'Opsi privasi iklan';

  @override
  String a11yCycleRing(int day, int length) {
    return 'Hari ke-$day dari sekitar $length';
  }

  @override
  String a11yChartSummary(int count, String min, String max) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Grafik dengan $count entri, dari $min sampai $max',
    );
    return '$_temp0';
  }

  @override
  String a11yPhaseBar(int day, int length) {
    return 'Kemajuan siklus: hari ke-$day dari sekitar $length';
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
  String get importTitle => 'Impor dari aplikasi lain';

  @override
  String get importBody =>
      'Ekspor riwayatmu dari aplikasi lama sebagai CSV, lalu pilih file di sini. Hanya tanggal dan aliran yang diimpor — istilah gejala dan suasana hati berbeda antar aplikasi, dan Vera tidak akan menebak.';

  @override
  String get importPickFile => 'Pilih file CSV';

  @override
  String importPreview(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Ditemukan $count hari riwayat',
    );
    return '$_temp0';
  }

  @override
  String importSkipped(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count baris tidak terbaca dan akan dilewati',
    );
    return '$_temp0';
  }

  @override
  String get importConfirm => 'Tambahkan ke riwayatku';

  @override
  String get importMergeNote =>
      'Hari yang diimpor digabungkan. Hari yang sudah kamu catat di Vera tetap seperti semula.';

  @override
  String importDone(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count hari diimpor',
    );
    return '$_temp0';
  }

  @override
  String get importErrorEmpty => 'File itu tampak kosong.';

  @override
  String get importErrorNoDate => 'Tidak menemukan kolom tanggal di file itu.';

  @override
  String get settingsImportEntry => 'Impor dari aplikasi lain';

  @override
  String get settingsHealthSyncLabel =>
      'Sinkronkan ke Apple Health / Health Connect';

  @override
  String get settingsHealthSyncBody =>
      'Hanya menulis aliran haid, berat, dan suhu basal ke aplikasi kesehatan ponselmu. Gejala, suasana hati, dan catatan tetap di Vera. Tidak ada yang dibaca kembali.';

  @override
  String healthSyncBackfilled(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count hari dikirim ke aplikasi kesehatanmu',
    );
    return '$_temp0';
  }

  @override
  String get healthSyncDenied =>
      'Izin tidak diberikan, jadi sinkronisasi tetap mati.';

  @override
  String get settingsDiagnosticsEntry => 'Diagnostik';

  @override
  String get diagnosticsBody =>
      'Jika aplikasi bermasalah, detail teknis dicatat di sini — hanya di perangkat ini. Tidak ada yang dikirim kecuali kamu memilih mengirimnya, dan kamu bisa membaca dulu persis apa yang akan dikirim.';

  @override
  String get diagnosticsEmpty =>
      'Tidak ada catatan — tidak ada masalah terdeteksi.';

  @override
  String get diagnosticsShare => 'Kirim ke pengembang';

  @override
  String get diagnosticsClear => 'Hapus';

  @override
  String get diagnosticsNoteLabel => 'Apa yang terjadi? (opsional)';

  @override
  String get diagnosticsTechnicalDetail => 'Detail teknis';

  @override
  String get unitHoursShort => 'j';

  @override
  String get unitMinutesShort => 'mnt';

  @override
  String get unitHoursLong => 'jam';

  @override
  String get unitMinutesLong => 'menit';

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
      'Pilihan personalisasi iklan tidak tersedia di wilayahmu — iklan di sini memang sudah tidak dipersonalisasi.';

  @override
  String get settingsGroupAppearance => 'Tampilan';

  @override
  String get settingsGroupTracking => 'Preferensi pelacakan';

  @override
  String get dayLogCustomTagsLabel => 'Pelacak milikku';

  @override
  String get customTagAddButton => 'Tambah pelacak';

  @override
  String get customTagDialogTitle => 'Pelacak baru';

  @override
  String get customTagDialogHint => 'mis. migrain, olahraga, susah tidur';

  @override
  String get customTagManageEntry => 'Kelola pelacakku';

  @override
  String get customTagRenameTitle => 'Ganti nama pelacak';

  @override
  String get customTagDeleteTitle => 'Hapus pelacak ini?';

  @override
  String get customTagDeleteBody =>
      'Pelacak ini akan dihapus dari semua hari yang memakainya. Catatanmu yang lain tetap sama.';

  @override
  String get customTagEmpty => 'Belum ada pelacak milikmu.';

  @override
  String get premiumLockedTitle => 'Fitur Premium';

  @override
  String get premiumLockedAction => 'Lihat Premium';

  @override
  String get premiumBenefitCustomTrackers =>
      'Lacak apa pun, dengan kata-katamu sendiri';

  @override
  String get premiumBenefitAdvancedInsights =>
      'Wawasan lanjutan: apa yang biasa terjadi, dan kapan';

  @override
  String get premiumBenefitPersonalisation => 'Latar dan teman tambahan';

  @override
  String get premiumBenefitAdvancedReminders =>
      'Pengingat sesuai ritmemu sendiri';

  @override
  String get advancedInsightsTitle => 'Wawasan lanjutan';

  @override
  String get advancedInsightsEntry => 'Wawasan lanjutan';

  @override
  String get advancedInsightsNotEnough =>
      'Catat tiga siklus penuh, lalu polamu akan muncul di sini. Kurang dari itu, \"pola\" apa pun hanyalah kebetulan.';

  @override
  String get advancedInsightsPatternsTitle => 'Kapan sesuatu biasanya muncul';

  @override
  String advancedInsightsPatternLine(String label, String segment) {
    return '$label — paling sering $segment';
  }

  @override
  String advancedInsightsPatternDetail(int count, int day) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count hari tercatat, sekitar hari ke-$day siklusmu',
    );
    return '$_temp0';
  }

  @override
  String advancedInsightsNoPattern(String label) {
    return '$label — belum ada waktu yang jelas';
  }

  @override
  String get advancedInsightsTrendTitle => 'Panjang siklus dari waktu ke waktu';

  @override
  String advancedInsightsDriftLonger(String days, String cycles) {
    return 'Membandingkan $cycles siklus pertamamu dengan $cycles siklus terakhir, yang terakhir kira-kira $days hari lebih panjang.';
  }

  @override
  String advancedInsightsDriftShorter(String days, String cycles) {
    return 'Membandingkan $cycles siklus pertamamu dengan $cycles siklus terakhir, yang terakhir kira-kira $days hari lebih pendek.';
  }

  @override
  String advancedInsightsDriftStable(String cycles) {
    return 'Membandingkan $cycles siklus pertamamu dengan $cycles siklus terakhir, panjang siklusmu kurang lebih tetap sama.';
  }

  @override
  String get advancedInsightsDriftNotEnough =>
      'Setelah kamu punya enam siklus penuh, kami bisa membandingkan siklus paling awal dengan yang terbaru untuk melihat apakah panjang siklusmu berubah.';

  @override
  String get advancedInsightsMoodTitle => 'Suasana hati per bagian siklus';

  @override
  String get advancedInsightsDisclaimer =>
      'Ini hanya hitungan dari apa yang kamu catat. Bukan diagnosis, dan pola di sini bukan penyebab.';

  @override
  String get segmentPeriod => 'saat haid';

  @override
  String get segmentAfterPeriod => 'setelah haid';

  @override
  String get segmentMidCycle => 'pertengahan siklus';

  @override
  String get segmentBeforePeriod => 'sebelum haid';

  @override
  String get customRemindersEntry => 'Pengingat milikku';

  @override
  String get customRemindersTitle => 'Pengingat milikku';

  @override
  String get customRemindersEmpty => 'Belum ada pengingat milikmu.';

  @override
  String get customRemindersAdd => 'Tambah pengingat';

  @override
  String get customReminderLabelHint => 'mis. minum pil, minum air';

  @override
  String get customReminderLockScreenNote =>
      'Teks pengingat tampil di layar kuncimu, jadi tulis seprivat yang kamu mau.';

  @override
  String get customReminderDelete => 'Hapus pengingat';

  @override
  String get homeThemeDusk => 'Senja';

  @override
  String get homeThemeMeadow => 'Padang';

  @override
  String get homeThemePetal => 'Kelopak';

  @override
  String get homeThemeBloom => 'Mekar';

  @override
  String get mascotStar => 'Bintang';

  @override
  String get mascotLeaf => 'Daun';

  @override
  String get tipDetailWhatsHappening => 'Apa yang sedang terjadi di tubuhmu';

  @override
  String get tipDetailDisclaimer =>
      'Ini informasi umum, bukan saran medis pribadi. Setiap tubuh merespons berbeda, dan apa yang kamu rasakan lebih penting daripada saran mana pun di sini. Kalau ada yang mengkhawatirkanmu, bicaralah dengan tenaga kesehatan.';

  @override
  String get phaseExplainerMenstrual =>
      'Kamu sedang berdarah karena lapisan rahim meluruh. Estrogen dan progesteron berada di titik terendah dalam siklus, dan itulah sebabnya banyak orang merasa lebih lelah dan lebih menarik diri pada hari-hari pertama. Perdarahan biasanya berlangsung sekitar tiga sampai tujuh hari dan paling deras di awal. Kram berasal dari kontraksi rahim yang dipicu oleh prostaglandin — senyawa mirip hormon yang dilepaskan saat lapisan rahim luruh, dan itu juga sebabnya sebagian orang sekaligus mengalami nyeri punggung bawah atau buang air besar lebih sering. Perdarahan juga menguras zat besi, dan itu menjelaskan sebagian rasa lelahnya. Kehangatan, gerak, dan tidur biasanya membantu. Namun jika pembalut penuh setiap jam, perdarahan jelas melewati satu minggu, atau nyerinya menghalangi aktivitas biasa, sebaiknya bicarakan dengan tenaga kesehatan daripada menunggu berlalu.';

  @override
  String get phaseExplainerFollicular =>
      'Setelah perdarahan berhenti, estrogen mulai naik lagi. Di indung telur sekelompok folikel sedang matang, masing-masing berisi satu sel telur, dan biasanya hanya satu yang akhirnya dilepaskan. Estrogen membangun kembali lapisan rahim yang baru saja luruh, dan kebanyakan orang merasakan energi, suasana hati, kulit, dan daya tahan ikut pulih. Fase ini juga bagian siklus yang paling berbeda antarorang dan antarbulan — stres, sakit, perjalanan, dan kurang tidur biasanya muncul di sini, dengan memanjangkan atau memendekkannya. Itulah alasan jujur mengapa prakiraan berupa rentang, bukan tanggal: paruh kedua siklus cukup stabil, dan paruh inilah yang bergerak.';

  @override
  String get phaseExplainerFertile =>
      'Estrogen mendekati puncaknya dan ovulasi diperkirakan terjadi di sekitar hari-hari ini. Lonjakan hormon luteinizing memicu pelepasan sel telur kira-kira satu sampai satu setengah hari kemudian. Sel telurnya sendiri bertahan sekitar 12 sampai 24 jam, tetapi sperma bisa bertahan beberapa hari di dalam lendir serviks yang subur — itulah sebabnya jendela ini dihitung beberapa hari, bukan satu hari. Lendir biasanya menjadi bening, elastis, dan licin, agak mirip putih telur mentah; sebagian orang merasakan gairah meningkat, payudara nyeri, atau nyeri singkat di satu sisi. Energi sering berada di titik tertinggi dalam siklus. Ingat, jendela ini adalah perkiraan dari catatanmu sendiri, bukan hasil pengukuran, dan bukan metode kontrasepsi.';

  @override
  String get phaseExplainerLuteal =>
      'Setelah ovulasi, folikel yang kosong menjadi korpus luteum dan mulai menghasilkan progesteron, yang menjaga lapisan rahim tetap stabil seandainya terjadi kehamilan. Jika tidak, progesteron dan estrogen turun tajam dan menstruasi dimulai. Paruh siklus ini yang lebih konsisten, biasanya sekitar 12 sampai 14 hari. Progesteron menaikkan suhu tubuh istirahat sedikit — perubahan itulah yang ditangkap termometer basal — dan bisa memperlambat pencernaan, yang menjadi bagian dari rasa kembung. Penurunan di akhir fase inilah yang memicu PMS pada banyak orang: payudara nyeri, perubahan nafsu makan, tidur terputus, sakit kepala, dan suasana hati naik turun, yang umumnya mereda begitu perdarahan dimulai. Jika gejala itu cukup berat sampai mengganggu pekerjaan atau hubungan hampir setiap bulan, itu layak dibicarakan dengan tenaga kesehatan.';

  @override
  String get phaseExplainerUnknown =>
      'Catatanmu belum cukup untuk menentukan kamu sedang di fase mana. Vera memerlukan setidaknya dua siklus penuh — satu awal menstruasi, lalu berikutnya — untuk menghitung rata-rata dan variasimu sendiri, dan lebih memilih mengatakannya daripada mengarang sebuah fase. Sementara itu tidak ada yang terbuang: setiap hari yang kamu catat menjadi bagian dari perhitungan pertama itu, dan perkiraannya makin sempit seiring bertambahnya riwayat. Sampai saat itu, saran di bawah bersifat umum dan berlaku di titik mana pun dalam siklus.';

  @override
  String get tipFitnessDetailMenstrual =>
      'Latihan berat tidak cocok bagi kebanyakan orang di hari-hari pertama, dan itu bukan soal disiplin — energimu memang benar-benar lebih rendah, dan kehilangan zat besi lewat perdarahan membuat latihan daya tahan terasa lebih berat dibanding sesi yang sama minggu lalu. Jalan kaki, peregangan ringan, yoga restoratif, dan latihan napas memperbaiki aliran darah serta dapat meredakan kram; pada sebagian orang, gerak teratur sepanjang bulan menurunkan intensitas kram lebih banyak daripada apa pun yang dilakukan di hari itu sendiri. Kalau kamu merasa baik, tidak ada alasan menghindari sesi berat: menstruasi bukan alasan berhenti berolahraga, dan banyak atlet tetap bertanding saat menstruasi. Beberapa catatan praktis: sesi panjang dan berat di hari perdarahan deras bisa memperdalam rasa lelah, kompres hangat di perut bawah sebelum mulai membuat gerakan lebih nyaman, dan minum sedikit lebih banyak dari biasanya membantu mengatasi sakit kepala di hari-hari ini. Nilai sesimu dari bagaimana rasanya saat itu, bukan dari seperti apa minggu terbaikmu.';

  @override
  String get tipFitnessDetailFollicular =>
      'Saat estrogen naik, kebanyakan orang merasa lebih kuat dan lebih tahan; ini biasanya bagian terbaik dari siklus untuk memulai sesuatu yang baru, menambah beban, atau menaikkan tempo. Perbaikan otot relatif efisien di sini, jadi sesi berat lebih mudah diserap dan meninggalkan pegal yang tidak berlarut. Ini juga jendela yang baik untuk hal-hal yang butuh kepala jernih selain badan kuat — mempelajari gerakan baru, memperbaiki teknik, atau menempuh jarak lebih jauh dari biasanya. Dua catatan yang perlu dipegang: naikkan beban bertahap, karena energi tinggi tidak berarti risiko cedera nol dan kebanyakan cedera akibat berlebihan justru bermula di minggu yang baik, bukan yang buruk. Dan jaga tidurmu, karena adaptasi terjadi saat pemulihan, bukan saat sesi berlangsung.';

  @override
  String get tipFitnessDetailFertile =>
      'Energi dan motivasi biasanya di puncak, jadi sesi berat terasa pas — rekor pribadi sering jatuh di sini. Beberapa penelitian menunjukkan sendi sedikit lebih longgar di sekitar ovulasi; efek praktisnya masih diperdebatkan, tetapi pemanasan yang lebih lama adalah pencegahan murah untuk olahraga dengan perubahan arah mendadak, lompatan, dan pendaratan. Suhu tubuh masih rendah dibanding paruh kedua siklus, jadi panas belum sebatas nanti dalam satu dua minggu. Nyeri singkat di satu sisi perut bawah saat ovulasi umum terjadi dan biasanya hilang dalam hitungan jam. Namun jika nyerinya hebat, satu sisi, dan menetap, disertai demam, atau kamu merasa mau pingsan, hentikan dan periksakan alih-alih memaksakan latihan.';

  @override
  String get tipFitnessDetailLuteal =>
      'Menjelang menstruasi, energi bisa menurun, denyut jantung bisa lebih tinggi untuk usaha yang sama, dan pemulihan bisa lebih lama. Itu ayunan yang wajar, bukan kemunduran, dan tidak menghapus kerja dua minggu terakhir. Progesteron menaikkan suhu istirahat sedikit dan menyulitkan tubuh melepas panas, sehingga sesi di cuaca panas atau lembap terasa jauh lebih berat di fase ini — berlatih di jam yang lebih sejuk dan minum lebih banyak dari yang terasa perlu, keduanya membantu. Sesi sedang, versi latihan kekuatan yang sedikit diringankan, dan jalan kaki biasanya lebih berkelanjutan. Jika ada kembung dan nyeri payudara, bra olahraga yang menopang baik dan pemanasan lebih panjang benar-benar terasa bedanya. Kalau suasana hati sedang turun, buat sesinya pendek dan ringan alih-alih melewatkannya sama sekali — ambang agar sesi itu dihitung lebih rendah dari yang kamu kira.';

  @override
  String get tipFitnessDetailUnknown =>
      'Meski fasemu belum diketahui, bergerak tetap membantu kapan saja: anjuran umumnya sekitar 150 menit aktivitas sedang per minggu, tersebar di sebagian besar hari, ditambah latihan kekuatan dua kali seminggu — dan pola itu memberi hasil lebih baik bagi hampir semua orang dibanding sesi sangat berat sesekali. Konsistensi lebih penting daripada intensitas, dan sesi terbaik adalah sesi yang benar-benar akan kamu ulang minggu depan. Sesuaikan dengan perasaanmu: di hari lelah, jalan kaki pun dihitung, dan sesi pendek yang dikerjakan lebih berharga daripada sesi panjang yang dilewatkan. Setelah beberapa siklus tercatat, saran khusus per fase akan muncul di sini.';

  @override
  String get tipNutritionDetailMenstrual =>
      'Perdarahan menguras zat besi; daging merah, lentil, buncis kacang arab, sayuran hijau tua, dan molase membantu menggantinya. Zat besi nabati diserap jauh lebih baik bersama vitamin C — memeras jeruk nipis di atas masakan lentil adalah versi paling praktisnya, dan salad tomat di sampingnya berfungsi sama. Teh dan kopi bersamaan dengan makan menurunkan penyerapan zat besi karena taninnya, jadi memberi jeda sekitar satu jam sudah cukup; kamu tidak perlu berhenti meminum keduanya. Minum cukup air dapat meringankan rasa lelah dan sakit kepala yang menyertai perdarahan, dan makanan kaya magnesium seperti kacang-kacangan, biji-bijian, serta sayuran hijau tua membantu sebagian orang meredakan kram. Di hari-hari saat pencernaan terasa lambat, porsi kecil yang sering biasanya lebih nyaman daripada porsi besar. Jika saat menstruasi kamu sering merasa sesak napas, pusing, atau lelah luar biasa, sebaiknya sampaikan ke tenaga kesehatan — kekurangan zat besi itu umum, mudah diperiksa, dan bukan sesuatu yang boleh didiagnosis oleh sebuah aplikasi.';

  @override
  String get tipNutritionDetailFollicular =>
      'Saat energi pulih, tubuh berada dalam mode membangun kembali: protein yang cukup, biji-bijian utuh, dan sayuran mendukung proses itu, dan di fase inilah nafsu makan biasanya paling stabil dan paling mudah diatur. Masuk akal juga untuk terus mengisi kembali cadangan zat besi setelah perdarahan, bukan menganggapnya urusan minggu menstruasi saja — cadangan terisi dalam hitungan minggu, bukan hari. Tidak melewatkan waktu makan biasanya lebih mudah di fase ini, dan itu membuatmu memasuki naik-turunnya nafsu makan di fase berikutnya dengan lebih seimbang. Kalau kamu berniat mengubah pola makan, fase ini umumnya lebih bersahabat untuk memulai dibanding minggu sebelum menstruasi, saat keinginan makan dan suasana hati yang turun membuat setiap kebiasaan baru terasa lebih sulit daripada sebenarnya.';

  @override
  String get tipNutritionDetailFertile =>
      'Di sini tidak diperlukan pola makan khusus; makanan seimbang dan air yang cukup sudah paling banyak berperan. Sebagian orang merasa kembung di sekitar ovulasi, yang umumnya bersifat hormonal dan sementara, bukan akibat sesuatu yang dimakan. Nafsu makan sedikit menurun pada sebagian orang dan meningkat pada sebagian lain — keduanya biasa. Menjaga protein dan serat dalam setiap makan membuat energi stabil sepanjang bagian bulan yang sering paling sibuk dan paling aktif ini. Kalau kamu sedang merencanakan kehamilan, ini waktu yang tepat untuk bertanya kepada tenaga kesehatan soal asam folat, yang umumnya dianjurkan sebelum pembuahan, bukan sesudahnya — tetapi itu percakapan dengan mereka, bukan saran yang pantas diberikan sebuah aplikasi.';

  @override
  String get tipNutritionDetailLuteal =>
      'Nafsu makan yang meningkat dan keinginan makan manis saat progesteron naik sangat umum; itu pergeseran hormonal, bukan soal kemauan, dan tubuhmu memang memakai sedikit lebih banyak energi di fase ini. Menambahkan protein dan serat ke dalam makanan membuat gula darah lebih stabil dan meredakan keinginan itu jauh lebih baik daripada berusaha mengabaikannya — keinginan yang dijawab dengan sesuatu yang mengenyangkan biasanya berakhir lebih cepat daripada yang dilawan selama sejam. Mengurangi garam dan menambah air dapat meringankan kembung; terdengar terbalik, tetapi tidak: saat cairan cukup, tubuh justru menahan lebih sedikit. Makanan kaya magnesium (almond, kenari, sayuran hijau tua, cokelat hitam) mengurangi kram dan ketegangan pada sebagian orang. Mengurangi kafein setelah tengah hari membantu tidur yang terputus-putus di fase ini, dan alkohol juga perlu diperhatikan karena ia memecah tidur justru di titik siklus saat tidur sudah lebih ringan.';

  @override
  String get tipNutritionDetailUnknown =>
      'Apa pun fasenya, hal yang paling membantu tetap sama: makan teratur, protein cukup, banyak sayur, air cukup, dan makanan kaya zat besi. Karena perdarahan menguras zat besi, cukup memberi sedikit perhatian lebih di hari-hari itu — tidak perlu pola makan berbeda untuk tiap minggu dalam sebulan. Makan pada jam yang kurang lebih tetap lebih berpengaruh pada kestabilan energi dibanding satu jenis makanan mana pun, dan tidak ada bahan yang harus dihilangkan agar sebuah siklus menjadi sehat. Setelah beberapa siklus tercatat, saran khusus per fase akan muncul di sini.';
}
