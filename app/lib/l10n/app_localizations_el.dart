// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Modern Greek (`el`).
class AppLocalizationsEl extends AppLocalizations {
  AppLocalizationsEl([String locale = 'el']) : super(locale);

  @override
  String get appTitle => 'Vera';

  @override
  String get actionSkip => 'Παράλειψη';

  @override
  String get actionContinue => 'Συνέχεια';

  @override
  String get actionDone => 'Τέλος';

  @override
  String get actionCancel => 'Άκυρο';

  @override
  String get actionClear => 'Απαλοιφή';

  @override
  String get actionDelete => 'Διαγραφή';

  @override
  String get actionEnable => 'Ενεργοποίηση';

  @override
  String get commonIDontKnow => 'Δεν ξέρω';

  @override
  String get commonYes => 'Ναι';

  @override
  String get commonNo => 'Όχι';

  @override
  String get commonNotSure => 'Δεν ξέρω με βεβαιότητα';

  @override
  String get pinSetupTitle => 'Ρύθμιση PIN';

  @override
  String get pinSetupEnterPrompt =>
      'Διάλεξε ένα PIN 6 ψηφίων για να κλειδώνει η εφαρμογή';

  @override
  String get pinSetupConfirmPrompt => 'Δώσ\' το ξανά για επιβεβαίωση';

  @override
  String get pinSetupMismatch => 'Δεν ταίριαξαν — ας δοκιμάσουμε ξανά';

  @override
  String get pinSetupBiometricTitle => 'Πιο γρήγορο ξεκλείδωμα;';

  @override
  String get pinSetupBiometricBody =>
      'Μπορείς να ξεκλειδώνεις και με δακτυλικό αποτύπωμα ή με το πρόσωπό σου — το PIN συνεχίζει να λειτουργεί ως εφεδρική λύση.';

  @override
  String get lockScreenTitle => 'Κλειδωμένη εφαρμογή';

  @override
  String get lockScreenEnterPin => 'Δώσε το PIN σου';

  @override
  String get lockScreenWrongPin => 'Το PIN δεν ταιριάζει';

  @override
  String get lockScreenUseBiometrics => 'Χρήση βιομετρικών';

  @override
  String get lockScreenUseFaceId => 'Χρήση Face ID';

  @override
  String get lockScreenUseFingerprint => 'Χρήση δακτυλικού αποτυπώματος';

  @override
  String get lockScreenForgotPin => 'Ξέχασες το PIN σου;';

  @override
  String get lockScreenForgotPinChoiceTitle => 'Πώς θέλεις να το επαναφέρεις;';

  @override
  String get lockScreenResetViaDevice => 'Επαλήθευση με αυτή τη συσκευή';

  @override
  String get lockScreenResetViaDeviceBody =>
      'Τα δεδομένα σου παραμένουν. Αρκεί η επαλήθευση με το δικό σου κλείδωμα τηλεφώνου — Face ID, δακτυλικό αποτύπωμα ή κωδικό.';

  @override
  String get lockScreenResetViaDeviceReason =>
      'Επαλήθευσε για να ορίσεις νέο PIN';

  @override
  String lockScreenThrottled(int seconds) {
    return 'Πάρα πολλές προσπάθειες. Δοκίμασε ξανά σε $seconds δευτ.';
  }

  @override
  String get lockScreenEraseTitle => 'Διαγραφή όλων των δεδομένων;';

  @override
  String get lockScreenEraseBody =>
      'Αυτό σβήνει οριστικά τα πάντα σε αυτή τη συσκευή. Δεν υπάρχει λογαριασμός ούτε αντίγραφο σε διακομιστή, οπότε η ενέργεια δεν αναιρείται.';

  @override
  String get lockScreenEraseConfirm => 'Διαγραφή των πάντων';

  @override
  String get onboardingPrivacyTitle => 'Καλώς ήρθες';

  @override
  String get onboardingPrivacyBody =>
      'Τα δεδομένα του κύκλου σου μένουν μόνο σε αυτή τη συσκευή, κρυπτογραφημένα. Δεν υπάρχει λογαριασμός ούτε συγχρονισμός στο cloud — τίποτα από όσα καταγράφεις δεν ανεβαίνει κάπου. Το κλειδί βρίσκεται στο ασφαλές υλικό του τηλεφώνου σου, και μπορείς να τα εξαγάγεις ή να τα διαγράψεις όλα όποτε θέλεις.';

  @override
  String get onboardingLastPeriodTitle =>
      'Πότε ξεκίνησε η τελευταία σου περίοδος;';

  @override
  String get onboardingLastPeriodBody =>
      'Αυτό βοηθά να ξεκινήσουμε — μπορείς πάντα να το διορθώσεις αργότερα από το ημερολόγιο.';

  @override
  String get onboardingPickDate => 'Διάλεξε ημερομηνία';

  @override
  String get onboardingCycleLengthTitle => 'Πόσο διαρκεί συνήθως ο κύκλος σου;';

  @override
  String get onboardingCycleLengthBody =>
      'Ένας κατά προσέγγιση αριθμός αρκεί. Θα αρχίσουμε να δίνουμε πραγματική εκτίμηση μόλις δούμε δύο ολοκληρωμένους κύκλους.';

  @override
  String get onboardingPeriodLengthTitle =>
      'Πόσες ημέρες διαρκεί συνήθως η περίοδός σου;';

  @override
  String get onboardingPeriodLengthBody =>
      'Θα το χρησιμοποιήσουμε για να συμπληρώσουμε την τελευταία σου περίοδο, ώστε να μην ξεκινάς από το μηδέν.';

  @override
  String get onboardingDaysUnit => 'ημέρες';

  @override
  String get onboardingGoalTitle => 'Τι σε φέρνει εδώ;';

  @override
  String get onboardingGoalBody =>
      'Αυτό βοηθά μόνο να σου δείξουμε πρώτα τα σωστά πράγματα — μπορείς να το αλλάξεις όποτε θέλεις στις Ρυθμίσεις.';

  @override
  String get goalTrackPeriod => 'Παρακολούθηση της περιόδου μου';

  @override
  String get goalTryingToConceive => 'Προσπάθεια για εγκυμοσύνη';

  @override
  String get goalPregnancyTracking => 'Παρακολούθηση εγκυμοσύνης';

  @override
  String get onboardingRegularityTitle =>
      'Είναι συνήθως τακτική η περίοδός σου;';

  @override
  String get onboardingRegularityBody =>
      'Δεν υπάρχει λάθος απάντηση — απλώς βοηθά να γνωρίσουμε λίγο καλύτερα το σώμα σου.';

  @override
  String get onboardingCrampsTitle => 'Έχεις συνήθως κράμπες;';

  @override
  String get onboardingCrampsBody =>
      'Θα φροντίσουμε να καταγράφεις εύκολα πώς νιώθεις σε τέτοιες ημέρες.';

  @override
  String get onboardingBirthYearTitle => 'Ποιο έτος γεννήθηκες;';

  @override
  String get onboardingBirthYearBody =>
      'Μόνο για μια πιο ολοκληρωμένη εικόνα — δεν χρησιμοποιείται ποτέ σε καμία πρόβλεψη.';

  @override
  String get onboardingPmsTitle => 'Εμφανίζεται συνήθως κάτι πριν;';

  @override
  String get onboardingPmsBody =>
      'Διάλεξε όσα ταιριάζουν. Δεν αποθηκεύεται πουθενά, δεν υπάρχει λάθος απάντηση.';

  @override
  String get onboardingNotificationTitle => 'Θέλεις διακριτικές υπενθυμίσεις;';

  @override
  String get onboardingNotificationBody =>
      'Μπορούμε να σου το θυμίζουμε πριν αναμένεται η περίοδός σου.';

  @override
  String get onboardingNotificationMockTitle =>
      'Η περίοδός σου μπορεί να ξεκινήσει σύντομα';

  @override
  String get onboardingNotificationMockBody =>
      'Με βάση τους κύκλους που έχεις καταγράψει';

  @override
  String get onboardingNotificationAllow => 'Ενεργοποίηση υπενθυμίσεων';

  @override
  String get onboardingNotificationNotNow => 'Όχι τώρα';

  @override
  String get onboardingBuildingPlanTitle => 'Ετοιμάζουμε τα πάντα για σένα';

  @override
  String get onboardingBuildingPlanStep1 =>
      'Ασφαλίζουμε τα δεδομένα σου σε αυτή τη συσκευή';

  @override
  String get onboardingBuildingPlanStep2 => 'Αποθηκεύουμε τις προτιμήσεις σου';

  @override
  String get onboardingBuildingPlanStep3 => 'Ετοιμάζουμε το ημερολόγιό σου';

  @override
  String get onboardingBuildingPlanDone => 'Όλα έτοιμα';

  @override
  String get navHome => 'Αρχική';

  @override
  String get navCalendar => 'Ημερολόγιο';

  @override
  String get navInsights => 'Στατιστικά';

  @override
  String get navSettings => 'Ρυθμίσεις';

  @override
  String get navReminders => 'Υπενθυμίσεις';

  @override
  String get navProfile => 'Προφίλ';

  @override
  String get navTrack => 'Καταγραφή';

  @override
  String homeCycleDayLabel(int day) {
    return 'Ημέρα $day';
  }

  @override
  String get homeNoCycleYet => 'Καμία καταγεγραμμένη περίοδος ακόμη';

  @override
  String get homePhaseMenstrual => 'Περίοδος';

  @override
  String get homePhaseFollicular => 'Ωοθυλακική φάση';

  @override
  String get homePhaseFertileWindow => 'Εκτιμώμενες γόνιμες ημέρες';

  @override
  String get homePhaseLuteal => 'Ωχρινική φάση';

  @override
  String get homePhaseUnknown => 'Δεν υπάρχουν αρκετά πρόσφατα δεδομένα';

  @override
  String get homePredictionInsufficientTitle =>
      'Δεν υπάρχουν αρκετά δεδομένα ακόμη';

  @override
  String get homePredictionInsufficientBody =>
      'Κατέγραψε την επόμενη περίοδό σου και θα αρχίσουμε να κάνουμε εκτιμήσεις.';

  @override
  String homePredictionRangeLabel(String start, String end) {
    return '$start – $end';
  }

  @override
  String get homeConfidenceHigh => 'Υψηλή βεβαιότητα';

  @override
  String get homeConfidenceMedium => 'Μέτρια βεβαιότητα';

  @override
  String get homeConfidenceLow => 'Χαμηλή βεβαιότητα';

  @override
  String get homeIrregularNote =>
      'Η διάρκεια του κύκλου σου έχει μεταβληθεί περισσότερο από το συνηθισμένο τελευταία. Αν αυτό είναι κάτι καινούριο για σένα, ίσως αξίζει να το αναφέρεις σε έναν έλεγχο ρουτίνας.';

  @override
  String get homeFertileWindowDisclaimer =>
      'Με βάση τον συνήθη χρονισμό του κύκλου — δεν αποτελεί μέθοδο αντισύλληψης.';

  @override
  String get homePeriodStartedButton => 'Η περίοδος ξεκίνησε σήμερα';

  @override
  String get homePeriodStartedSnackbar =>
      'Καταγράφηκε — η περίοδος ξεκίνησε σήμερα';

  @override
  String get actionUndo => 'Αναίρεση';

  @override
  String get comingSoon => 'Έρχεται σύντομα';

  @override
  String get dayLogFlowLabel => 'Ροή';

  @override
  String get flowSpotting => 'Κηλίδωση';

  @override
  String get flowLight => 'Ελαφριά';

  @override
  String get flowMedium => 'Μέτρια';

  @override
  String get flowHeavy => 'Έντονη';

  @override
  String get flowNone => 'Καθόλου';

  @override
  String get dayLogSymptomsLabel => 'Συμπτώματα';

  @override
  String get symptomCramps => 'Κράμπες';

  @override
  String get symptomHeadache => 'Πονοκέφαλος';

  @override
  String get symptomBloating => 'Φούσκωμα';

  @override
  String get symptomBreastTenderness => 'Ευαισθησία στο στήθος';

  @override
  String get symptomAcne => 'Ακμή';

  @override
  String get symptomFatigue => 'Κόπωση';

  @override
  String get symptomNausea => 'Ναυτία';

  @override
  String get symptomBackPain => 'Πόνος στη μέση';

  @override
  String get symptomAppetiteChange => 'Αλλαγή στην όρεξη';

  @override
  String get symptomSleepTrouble => 'Δυσκολία στον ύπνο';

  @override
  String get symptomPelvicPain => 'Πόνος στην πύελο';

  @override
  String get symptomDizziness => 'Ζαλάδα';

  @override
  String get symptomMigraine => 'Ημικρανία';

  @override
  String get symptomHighFever => 'Υψηλός πυρετός';

  @override
  String get symptomNeckPain => 'Πόνος αυχένα';

  @override
  String get symptomShoulderPain => 'Πόνος ώμου';

  @override
  String get symptomLimbPain => 'Πόνος άκρων';

  @override
  String get symptomMuscleAche => 'Μυϊκός πόνος';

  @override
  String get symptomChills => 'Ρίγη';

  @override
  String get symptomNightSweats => 'Νυχτερινές εφιδρώσεις';

  @override
  String get symptomHotFlashes => 'Εξάψεις';

  @override
  String get symptomWeightGain => 'Αύξηση βάρους';

  @override
  String get symptomConstipation => 'Δυσκοιλιότητα';

  @override
  String get symptomDiarrhea => 'Διάρροια';

  @override
  String get symptomIndigestion => 'Δυσπεψία';

  @override
  String get symptomGasPain => 'Πόνος από αέρια';

  @override
  String get symptomFeelingUnwell => 'Αδιαθεσία';

  @override
  String get symptomItching => 'Φαγούρα';

  @override
  String get symptomTroubleFocusing => 'Δυσκολία συγκέντρωσης';

  @override
  String get symptomForgetfulness => 'Ξεχασιάρικο';

  @override
  String get symptomGroupHead => 'Κεφάλι';

  @override
  String get symptomGroupBody => 'Σώμα';

  @override
  String get symptomGroupAbdomen => 'Κοιλιά';

  @override
  String get symptomGroupGeneral => 'Γενικά';

  @override
  String get symptomGroupCognitive => 'Γνωστικό';

  @override
  String get dayLogMoodLabel => 'Διάθεση';

  @override
  String get moodCalm => 'Ηρεμία';

  @override
  String get moodAnxious => 'Άγχος';

  @override
  String get moodIrritable => 'Ευερεθιστότητα';

  @override
  String get moodLow => 'Πεσμένη διάθεση';

  @override
  String get moodEnergetic => 'Ενέργεια';

  @override
  String get moodHappy => 'Χαρά';

  @override
  String get moodContent => 'Ικανοποίηση';

  @override
  String get moodSad => 'Λύπη';

  @override
  String get moodDepressed => 'Κατάθλιψη';

  @override
  String get moodEmotional => 'Συναισθηματική φόρτιση';

  @override
  String get moodExcited => 'Ενθουσιασμένη';

  @override
  String get moodHopeful => 'Αισιόδοξη';

  @override
  String get moodProud => 'Περήφανη';

  @override
  String get moodDisappointed => 'Απογοητευμένη';

  @override
  String get moodConfident => 'Σίγουρη';

  @override
  String get moodSurprised => 'Έκπληκτη';

  @override
  String get moodIndifferent => 'Αδιάφορη';

  @override
  String get moodPeaceful => 'Γαλήνια';

  @override
  String get moodInLove => 'Ερωτευμένη';

  @override
  String get moodShy => 'Ντροπαλή';

  @override
  String get moodPlayful => 'Παιχνιδιάρικη';

  @override
  String get moodExhausted => 'Εξαντλημένη';

  @override
  String get moodLonely => 'Μοναχική';

  @override
  String get moodOverwhelmed => 'Κατακλυσμένη';

  @override
  String get moodGrateful => 'Ευγνώμων';

  @override
  String get moodNostalgic => 'Νοσταλγική';

  @override
  String get dayLogNoteLabel => 'Σημείωση';

  @override
  String get dayLogNoteHint => 'Ό,τι θέλεις να θυμάσαι για σήμερα';

  @override
  String get dayLogOptionalTrackersLabel => 'Προαιρετικές καταγραφές';

  @override
  String get dayLogSexualActivityLabel => 'Σεξουαλική δραστηριότητα';

  @override
  String get sexLifeNone => 'Τίποτα';

  @override
  String get sexLifeUnprotected => 'Σεξ χωρίς προφύλαξη';

  @override
  String get sexLifeProtected => 'Σεξ με προφύλαξη';

  @override
  String get sexLifeMasturbation => 'Αυνανισμός';

  @override
  String get sexLifeNoOrgasm => 'Χωρίς οργασμό';

  @override
  String get sexLifeOrgasm => 'Οργασμός';

  @override
  String get sexLifeHighDesire => 'Έντονη διάθεση';

  @override
  String get dayLogBbtLabel => 'Βασική θερμοκρασία σώματος';

  @override
  String get dayLogMucusLabel => 'Τραχηλική βλέννα';

  @override
  String get mucusDry => 'Ξηρή';

  @override
  String get mucusSticky => 'Κολλώδης';

  @override
  String get mucusCreamy => 'Κρεμώδης';

  @override
  String get mucusWatery => 'Υδαρής';

  @override
  String get mucusEggWhite => 'Σαν ασπράδι αυγού';

  @override
  String get dayLogSavedIndicator => 'Αποθηκεύτηκε';

  @override
  String get homeOpenTodayLog => 'Πρόσθεσε λεπτομέρειες για σήμερα';

  @override
  String get calendarLegendActual => 'Καταγεγραμμένη περίοδος';

  @override
  String get calendarLegendPredicted => 'Προβλεπόμενο διάστημα';

  @override
  String get calendarLegendFertile => 'Εκτιμώμενες γόνιμες ημέρες';

  @override
  String get calendarLegendOvulation => 'Εκτιμώμενη ωορρηξία';

  @override
  String get dayDetailFertileTitle =>
      'Μέσα στις εκτιμώμενες γόνιμες ημέρες σου';

  @override
  String get dayDetailOvulationTitle => 'Εκτιμώμενη ημέρα ωορρηξίας';

  @override
  String get dayDetailOvulationBody =>
      'Η πιθανότητα εγκυμοσύνης είναι συνήθως μεγαλύτερη γύρω από αυτή την ημέρα, με βάση τον συνήθη χρονισμό — πρόκειται για εκτίμηση, όχι για βεβαιότητα.';

  @override
  String get insightsCyclesLoggedLabel => 'Καταγεγραμμένοι κύκλοι';

  @override
  String get insightsAveragePeriodLengthLabel => 'Μέση διάρκεια περιόδου';

  @override
  String get insightsAverageCycleLengthLabel => 'Μέση διάρκεια κύκλου';

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
      other: 'Διαφοροποιείται κατά περίπου $daysString ημέρες',
      one: 'Διαφοροποιείται κατά περίπου 1 ημέρα',
    );
    return '$_temp0';
  }

  @override
  String get insightsNotEnoughDataTitle => 'Δεν υπάρχουν αρκετά δεδομένα ακόμη';

  @override
  String get insightsNotEnoughDataBody =>
      'Κατέγραψε δύο ολοκληρωμένους κύκλους και οι μέσοι όροι σου θα εμφανιστούν εδώ.';

  @override
  String get insightsSymptomFrequencyTitle => 'Συμπτώματα ανά ημέρα κύκλου';

  @override
  String get insightsNoSymptomsLogged =>
      'Δεν έχουν καταγραφεί συμπτώματα ακόμη';

  @override
  String get settingsLanguageLabel => 'Γλώσσα';

  @override
  String get settingsLanguageSystem => 'Γλώσσα συστήματος';

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
  String get tourSkip => 'Παράλειψη';

  @override
  String get tourNext => 'Επόμενο';

  @override
  String get tourStart => 'Ας ξεκινήσουμε';

  @override
  String get tourHomeTitle => 'Αρχική';

  @override
  String get tourHomeBody =>
      'Δες με μια ματιά πού βρίσκεσαι σήμερα — η ημέρα του κύκλου σου, πόσος χρόνος απομένει για το εκτιμώμενο παράθυρό σου, και ο σύντροφός σου είναι πάντα εδώ.';

  @override
  String get tourCalendarTitle => 'Ημερολόγιο';

  @override
  String get tourCalendarBody =>
      'Δες τους προηγούμενους και επερχόμενους κύκλους σου στο ημερολόγιο. Πάτησε οποιαδήποτε ημέρα για να ανοίξεις την καταχώρησή της.';

  @override
  String get tourTrackTitle => 'Καταγραφή';

  @override
  String get tourTrackBody =>
      'Το κουμπί + στη μέση ανοίγει την καταχώρηση της ημέρας από οπουδήποτε — ροή, συμπτώματα, διάθεση και άλλα.';

  @override
  String get tourRemindersTitle => 'Υπενθυμίσεις';

  @override
  String get tourRemindersBody =>
      'Όρισε υπενθυμίσεις για την επερχόμενη περίοδό σου, τα φάρμακα ή το νερό — όλα μένουν στο τηλέφωνό σου και δεν πηγαίνουν πουθενά αλλού.';

  @override
  String get tourProfileTitle => 'Προφίλ';

  @override
  String get tourProfileBody =>
      'Βρες εδώ τις πληροφορίες σου, όσα παρακολουθείς και τις ρυθμίσεις σου.';

  @override
  String get settingsWeekStartLabel => 'Η εβδομάδα ξεκινά';

  @override
  String get settingsWeekStartMonday => 'Δευτέρα';

  @override
  String get settingsWeekStartSunday => 'Κυριακή';

  @override
  String get settingsTemperatureUnitLabel => 'Μονάδα θερμοκρασίας';

  @override
  String get settingsTemperatureCelsius => 'Κελσίου';

  @override
  String get settingsTemperatureFahrenheit => 'Φαρενάιτ';

  @override
  String get settingsRemindersLabel => 'Υπενθύμιση πριν από την περίοδό μου';

  @override
  String get remindersScreenTitle => 'Υπενθυμίσεις';

  @override
  String get reminderDetailNotification => 'Ειδοποίηση';

  @override
  String get reminderDetailAlert => 'Προειδοποίηση';

  @override
  String get reminderDetailAlertToday => 'Την ίδια μέρα';

  @override
  String get reminderDetailTime => 'Ώρα';

  @override
  String get reminderDetailMessage => 'Μήνυμα';

  @override
  String get reminderDetailMessageEditTitle => 'Επεξεργασία μηνύματος';

  @override
  String get reminderDetailMessageHint => 'Γράψε το δικό σου μήνυμα';

  @override
  String reminderDetailAlertDaysBefore(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count μέρες νωρίτερα',
      one: '$count μέρα νωρίτερα',
    );
    return '$_temp0';
  }

  @override
  String optionsShowMore(int count) {
    return '+$count ακόμη';
  }

  @override
  String get optionsShowLess => 'Εμφάνιση λιγότερων';

  @override
  String get trackerHistoryEntry => 'Ιστορικό';

  @override
  String get actionSend => 'Αποστολή';

  @override
  String get actionRemove => 'Αφαίρεση';

  @override
  String get feedbackEntry => 'Σχόλια';

  @override
  String get cloudBackupEntry => 'Δημιουργία αντιγράφου με λογαριασμό';

  @override
  String get cloudBackupTitle => 'Δημιουργία αντιγράφου με λογαριασμό';

  @override
  String get cloudBackupNotConfiguredTitle =>
      'Δεν είναι ακόμη διαθέσιμο σε αυτήν την έκδοση';

  @override
  String get cloudBackupNotConfiguredBody =>
      'Το αντίγραφο ασφαλείας στο cloud χρειάζεται μια υπηρεσία λογαριασμών που δεν έχει ρυθμιστεί ακόμη για αυτήν την έκδοση. Τίποτα εδώ δεν μπορεί να χρησιμοποιηθεί μέχρι τότε.';

  @override
  String get cloudBackupIntro1Title => 'Μη χάσεις ποτέ το ιστορικό σου';

  @override
  String get cloudBackupIntro1Body =>
      'Το ιστορικό του κύκλου σου παραμένει ασφαλές ακόμη κι αν χάσεις το τηλέφωνό σου ή αλλάξεις σε καινούργιο.';

  @override
  String get cloudBackupIntro2Title => 'Μόνο εσύ μπορείς να το ανοίξεις';

  @override
  String get cloudBackupIntro2Body =>
      'Το αντίγραφο ασφαλείας κρυπτογραφείται με κωδικό πρόσβασης πριν καν φύγει από το τηλέφωνό σου — δεν μπορούμε να το διαβάσουμε, ούτε κανείς άλλος.';

  @override
  String get cloudBackupIntro3Title => 'Επαναφορά σε δευτερόλεπτα';

  @override
  String get cloudBackupIntro3Body =>
      'Συνδέσου σε μια νέα συσκευή και φέρε πίσω το ιστορικό σου με τον ίδιο κωδικό πρόσβασης.';

  @override
  String get cloudBackupSignedInTitle => 'Συνδέθηκες';

  @override
  String get cloudBackupUploadButton => 'Δημιουργία αντιγράφου τώρα';

  @override
  String get cloudBackupDownloadButton => 'Επαναφορά από το cloud';

  @override
  String get cloudBackupUploadSuccess => 'Αποθηκεύτηκε στον λογαριασμό σου';

  @override
  String get cloudBackupNoBackupFound =>
      'Δεν βρέθηκε ακόμη αντίγραφο ασφαλείας στο cloud για αυτόν τον λογαριασμό.';

  @override
  String get partnerModeEntry => 'Λειτουργία συντρόφου';

  @override
  String get partnerModeTitle => 'Λειτουργία συντρόφου';

  @override
  String get partnerModeNotConfiguredTitle =>
      'Δεν είναι ακόμη διαθέσιμο σε αυτήν την έκδοση';

  @override
  String get partnerModeNotConfiguredBody =>
      'Η Λειτουργία συντρόφου χρειάζεται μια υπηρεσία λογαριασμών που δεν έχει ρυθμιστεί ακόμη για αυτήν την έκδοση. Τίποτα εδώ δεν μπορεί να χρησιμοποιηθεί μέχρι τότε.';

  @override
  String get partnerModeHeroTitle => 'Μοιράσου λίγα, με τους δικούς σου όρους';

  @override
  String get partnerModeHeroBody =>
      'Συνδέσου με τον/την σύντροφό σου και μοιράσου μόνο όσα ενεργοποιείς παρακάτω — ποτέ ολόκληρο το ιστορικό σου, ποτέ αυτόματα.';

  @override
  String get partnerModeSignInGoogle => 'Συνέχεια με Google';

  @override
  String get partnerModeSignInApple => 'Συνέχεια με Apple';

  @override
  String get partnerModeFaqTitle => 'Πριν συνδεθείς';

  @override
  String get partnerModeFaq1Q => 'Τι θα δει πραγματικά ο/η σύντροφός μου;';

  @override
  String get partnerModeFaq1A =>
      'Μόνο τα πεδία που ενεργοποιείς στη Λειτουργία συντρόφου, και μόνο την τρέχουσα κατάστασή σου — ποτέ το αποθηκευμένο ιστορικό σου, ούτε τίποτα που δεν έχεις μοιραστεί ρητά.';

  @override
  String get partnerModeFaq2Q => 'Μπορώ να το απενεργοποιήσω αργότερα;';

  @override
  String get partnerModeFaq2A =>
      'Ναι. Η κατάργηση σύνδεσης σταματά αμέσως την κοινοποίηση και για τους δύο, και μπορείς να απενεργοποιήσεις οποιονδήποτε διακόπτη ανά πάσα στιγμή χωρίς να καταργήσεις τη σύνδεση.';

  @override
  String get partnerModeFaq3Q =>
      'Χρειάζεται ο σύντροφός μου αυτή την εφαρμογή;';

  @override
  String get partnerModeFaq3A =>
      'Ναι — συνδέεται με τον ίδιο τρόπο και ζευγαρώνει με έναν κωδικό που του στέλνεις.';

  @override
  String get partnerModeNotPairedTitle => 'Δεν έχει γίνει ζευγάρωμα ακόμη';

  @override
  String get partnerModeNotPairedBody =>
      'Προσκάλεσε τον/την σύντροφό σου με έναν κωδικό μίας χρήσης, ή εισήγαγε τον κωδικό που σου έστειλε.';

  @override
  String get partnerModeInviteButton => 'Προσκάλεσε τον σύντροφό μου';

  @override
  String get partnerModeEnterCodeButton => 'Εισαγωγή κωδικού';

  @override
  String get partnerModeSignOut => 'Αποσύνδεση';

  @override
  String get partnerModePairedTitle => 'Έγινε ζευγάρωμα';

  @override
  String get partnerModePairedBody =>
      'Εσύ και ο σύντροφός σου είστε συνδεδεμένοι. Η κοινοποίηση εξακολουθεί να αφορά μόνο όσα ενεργοποιείς παρακάτω.';

  @override
  String get partnerModeShareSectionTitle => 'Τι μοιράζεσαι';

  @override
  String get partnerModeShareCyclePhase => 'Φάση και ημέρα κύκλου';

  @override
  String get partnerModeShareMood => 'Σημερινή διάθεση';

  @override
  String get partnerModeShareSymptoms => 'Σημερινά συμπτώματα';

  @override
  String get partnerModeShareHighDesire => 'Διάθεση για οικειότητα σήμερα';

  @override
  String get partnerModeShareNow => 'Κοινοποίηση τώρα';

  @override
  String get partnerModeShareSuccess => 'Κοινοποιήθηκε στον σύντροφό σου';

  @override
  String get partnerModeUnpair => 'Κατάργηση σύνδεσης';

  @override
  String get partnerModeUnpairConfirmTitle =>
      'Κατάργηση σύνδεσης με τον σύντροφό σου;';

  @override
  String get partnerModeUnpairConfirmBody =>
      'Αυτό σταματά αμέσως την κοινοποίηση και για τους δύο. Μπορείτε να ζευγαρώσετε ξανά αργότερα με νέο κωδικό.';

  @override
  String get partnerModePartnerSnapshotEmpty =>
      'Ο σύντροφός σου δεν έχει μοιραστεί τίποτα ακόμη.';

  @override
  String get partnerModeErrorNotConfigured =>
      'Η Λειτουργία συντρόφου δεν έχει ρυθμιστεί ακόμη σε αυτήν την έκδοση.';

  @override
  String get partnerModeErrorCodeNotFound =>
      'Αυτός ο κωδικός δεν βρέθηκε. Έλεγξέ τον και δοκίμασε ξανά.';

  @override
  String get partnerModeErrorCodeExpired =>
      'Αυτός ο κωδικός έχει λήξει. Ζήτησε έναν νέο.';

  @override
  String get partnerModeErrorCodeIsOwn =>
      'Αυτός είναι ο δικός σου κωδικός — ζήτησε τον δικό του από τον σύντροφό σου.';

  @override
  String get partnerModeErrorNotSignedIn => 'Συνδέσου πρώτα.';

  @override
  String get partnerModeErrorUnknown => 'Κάτι πήγε στραβά. Δοκίμασε ξανά.';

  @override
  String get partnerModeInviteTitle => 'Προσκάλεσε τον σύντροφό σου';

  @override
  String get partnerModeInviteBody =>
      'Στείλε αυτόν τον κωδικό στον σύντροφό σου. Θα τον εισαγάγει στη δική του εφαρμογή για να ζευγαρώσει μαζί σου.';

  @override
  String get partnerModeInviteExpiry => 'Ισχύει για 7 ημέρες';

  @override
  String get partnerModeInviteShare => 'Κοινοποίηση κωδικού';

  @override
  String partnerModeInviteMessage(String code) {
    return 'Ορίστε ο κωδικός ζευγαρώματος Vera μου: $code';
  }

  @override
  String get partnerModeEnterTitle => 'Εισαγωγή κωδικού';

  @override
  String get partnerModeEnterBody =>
      'Εισήγαγε τον κωδικό που σου έστειλε ο σύντροφός σου.';

  @override
  String get partnerModeEnterHint => 'Κωδικός 6 χαρακτήρων';

  @override
  String get partnerModeEnterSubmit => 'Ζευγάρωμα';

  @override
  String get homeInvitePartnerTitle => 'Μοιράσου με τον σύντροφό σου';

  @override
  String get homeInvitePartnerBody =>
      'Ζευγαρώστε και μοιράσου μόνο ό,τι επιλέγεις — το ιστορικό σου παραμένει δικό σου.';

  @override
  String get homeInvitePartnerCta => 'Ρύθμιση Λειτουργίας συντρόφου';

  @override
  String get feedbackTitle => 'Τι δεν σου άρεσε;';

  @override
  String get feedbackSubtitle =>
      'Διάλεξε ένα θέμα, και γράψε περισσότερα αν θέλεις.';

  @override
  String get feedbackCategoryPredictions => 'Προβλέψεις';

  @override
  String get feedbackCategoryBackup => 'Δημιουργία αντιγράφου & επαναφορά';

  @override
  String get feedbackCategorySubscription => 'Συνδρομή';

  @override
  String get feedbackCategoryAds => 'Διαφημίσεις';

  @override
  String get feedbackCategoryDesign => 'Σχεδιασμός';

  @override
  String get feedbackCategoryTranslation => 'Μετάφραση';

  @override
  String get feedbackCategoryOther => 'Άλλο';

  @override
  String get feedbackDescriptionLabel => 'Πες μας περισσότερα (προαιρετικό)';

  @override
  String get feedbackDescriptionHint =>
      'Τι συνέβη; Πατώντας Αποστολή, επιλέγεις πού θα το μοιραστείς — την εφαρμογή αλληλογραφίας σου ή αλλού.';

  @override
  String get feedbackAttachPhoto => 'Προσθήκη φωτογραφίας';

  @override
  String get feedbackPhotoAttached => 'Η φωτογραφία επισυνάφθηκε';

  @override
  String get remindersGroupCycle => 'Περίοδος και γονιμότητα';

  @override
  String get remindersGroupMedication => 'Φάρμακα';

  @override
  String get remindersGroupLifestyle => 'Καθημερινότητα';

  @override
  String get remindersGroupAppointment => 'Ραντεβού με γιατρό';

  @override
  String get settingsRemindersPeriodEndLabel =>
      'Έλεγχος όταν αναμένεται να τελειώνει η περίοδός μου';

  @override
  String get settingsRemindersMedicationLabel => 'Υπενθύμιση φαρμάκου';

  @override
  String get settingsRemindersWaterLabel => 'Υπενθύμιση για νερό';

  @override
  String get settingsRemindersAppointmentLabel =>
      'Υπενθύμιση ραντεβού με γιατρό';

  @override
  String get settingsRemindersAppointmentSet => 'Ορισμός ημερομηνίας & ώρας';

  @override
  String get settingsRemindersAppointmentClear => 'Καθαρισμός';

  @override
  String get settingsOptionalTrackersHeading => 'Προαιρετικές καταγραφές';

  @override
  String get settingsOptionalTrackersBody =>
      'Ανενεργές από προεπιλογή. Ενεργοποιώντας μία, προστίθεται στην οθόνη ημερήσιας καταγραφής.';

  @override
  String get settingsSexualActivityToggle => 'Σεξουαλική δραστηριότητα';

  @override
  String get settingsBbtToggle => 'Βασική θερμοκρασία σώματος';

  @override
  String get settingsMucusToggle => 'Τραχηλική βλέννα';

  @override
  String get settingsBreastExamToggle => 'Αυτοεξέταση μαστού';

  @override
  String get settingsCervixToggle => 'Θέση & σκληρότητα τραχήλου';

  @override
  String get settingsPrivacyEntry => 'Απόρρητο';

  @override
  String get settingsRateEntry => 'Αξιολόγησέ μας';

  @override
  String get rateAppTitle => 'Σε βοηθάει το Vera;';

  @override
  String get rateAppBody =>
      'Αν ναι, λίγα δευτερόλεπτα για αξιολόγηση στο κατάστημα βοηθούν άλλους που ψάχνουν κάτι παρόμοιο να το βρουν.';

  @override
  String get rateAppCta => 'Αξιολόγησε το Vera';

  @override
  String get rateAppDismiss => 'Όχι τώρα';

  @override
  String get settingsDeleteAllData => 'Διαγραφή όλων των δεδομένων';

  @override
  String get privacyScreenTitle => 'Απόρρητο';

  @override
  String get privacyScreenIntro =>
      'Να τι ακριβώς συμβαίνει με τα δεδομένα σου, με απλά λόγια.';

  @override
  String get privacyScreenStorageTitle => 'Κρυπτογραφημένα σε αυτή τη συσκευή';

  @override
  String get privacyScreenNoNetworkTitle =>
      'Χωρίς διακομιστή, χωρίς λογαριασμό';

  @override
  String get privacyScreenNoThirdPartyTitle => 'Χωρίς παρακολούθηση';

  @override
  String get privacyScreenExportTitle => 'Η εξαγωγή ξεκινά μόνο από εσένα';

  @override
  String get privacyScreenDeleteTitle => 'Η διαγραφή είναι οριστική';

  @override
  String get privacyScreenStorage =>
      'Ό,τι καταγράφεις κρυπτογραφείται και αποθηκεύεται μόνο σε αυτή τη συσκευή, σε ένα μοναδικό αρχείο. Το κλειδί κρυπτογράφησης βρίσκεται στο ασφαλές υλικό του τηλεφώνου σου — Keychain στο iOS, Keystore στο Android — και όχι μέσα στο ίδιο το αρχείο.';

  @override
  String get privacyScreenNoNetwork =>
      'Η εφαρμογή δεν έχει δικό της διακομιστή ούτε σύστημα λογαριασμών — οι καταγραφές σου δεν ανεβαίνουν ποτέ. Η δωρεάν έκδοση περιλαμβάνει διαφημίσεις της Google, οι οποίες συνδέονται στο διαδίκτυο· δεν λαμβάνουν ποτέ τίποτα από όσα καταγράφεις.';

  @override
  String get privacyScreenNoThirdParty =>
      'Δεν υπάρχουν analytics, ούτε αναφορές σφαλμάτων, ούτε SDK παρακολούθησης. Το μόνο στοιχείο τρίτου μέρους είναι το διαφημιστικό SDK της Google στη δωρεάν έκδοση — το Premium το αφαιρεί εντελώς.';

  @override
  String get privacyScreenExport =>
      'Ο μόνος τρόπος να φύγουν τα δεδομένα σου από αυτή τη συσκευή είναι να τα εξαγάγεις εσύ, και αυτή η εξαγωγή είναι κρυπτογραφημένη με έναν κωδικό που ξέρεις μόνο εσύ.';

  @override
  String get privacyScreenDelete =>
      'Η διαγραφή των δεδομένων σου είναι πραγματική και άμεση. Δεν υπάρχει λογαριασμός ούτε αντίγραφο από τη δική μας πλευρά — μόλις φύγουν, έφυγαν.';

  @override
  String get adPlaceholderLabel => 'Χώρος διαφήμισης';

  @override
  String get adPlaceholderUpgradeCta => 'Χωρίς διαφημίσεις με το Premium';

  @override
  String get reminderNotificationTitle =>
      'Η περίοδός σου μπορεί να ξεκινήσει σύντομα';

  @override
  String get reminderNotificationBody =>
      'Με βάση τους κύκλους που έχεις καταγράψει, το εκτιμώμενο διάστημα πλησιάζει.';

  @override
  String get reminderPeriodEndTitle => 'Η περίοδός σου ίσως τελειώνει';

  @override
  String get reminderPeriodEndBody =>
      'Αν συνεχίζεται, είναι απολύτως φυσιολογικό — απλώς μια διακριτική υπενθύμιση για να το σημειώσεις.';

  @override
  String get reminderMedicationTitle => 'Υπενθύμιση φαρμάκου';

  @override
  String get reminderMedicationBody => 'Ώρα για το φάρμακό σου.';

  @override
  String get reminderWaterTitle => 'Μην ξεχνάς το νερό';

  @override
  String get reminderWaterBody => 'Μια μικρή υπενθύμιση για νερό.';

  @override
  String get reminderAppointmentTitle => 'Επερχόμενο ραντεβού με γιατρό';

  @override
  String get reminderAppointmentBody =>
      'Έχεις ένα ραντεβού με γιατρό που πλησιάζει.';

  @override
  String get settingsExportEntry => 'Εξαγωγή & αντίγραφο ασφαλείας';

  @override
  String get exportBackupHeading => 'Κρυπτογραφημένο αντίγραφο ασφαλείας';

  @override
  String get exportBackupBody =>
      'Αποθήκευσε ένα κρυπτογραφημένο αντίγραφο του ιστορικού σου για να το μεταφέρεις σε νέα συσκευή. Θα χρειαστείς ξανά τον κωδικό για να το επαναφέρεις — δεν υπάρχει άλλος τρόπος ανάκτησης.';

  @override
  String get exportCreateBackupButton => 'Δημιουργία αντιγράφου';

  @override
  String get exportRestoreBackupButton => 'Επαναφορά από αντίγραφο';

  @override
  String get exportPasswordLabel => 'Κωδικός';

  @override
  String get exportPasswordConfirmLabel => 'Επιβεβαίωση κωδικού';

  @override
  String get exportPasswordMismatch => 'Οι κωδικοί δεν ταιριάζουν';

  @override
  String get exportPasswordTooShort => 'Χρησιμοποίησε τουλάχιστον 8 χαρακτήρες';

  @override
  String get exportRestoreConfirmTitle =>
      'Αντικατάσταση όλων των δεδομένων σε αυτή τη συσκευή;';

  @override
  String get exportRestoreConfirmBody =>
      'Η επαναφορά ενός αντιγράφου αντικαθιστά ό,τι είναι καταγεγραμμένο τώρα σε αυτή τη συσκευή. Η ενέργεια δεν αναιρείται.';

  @override
  String get exportRestoreConfirmAction => 'Επαναφορά';

  @override
  String get exportWrongPassword =>
      'Ο κωδικός δεν ταιριάζει με αυτό το αντίγραφο';

  @override
  String get exportInvalidFile =>
      'Αυτό το αρχείο δεν μοιάζει με αντίγραφο του Vera';

  @override
  String get exportBackupCreated => 'Το αντίγραφο είναι έτοιμο για κοινοποίηση';

  @override
  String get exportRestoreSuccess => 'Το αντίγραφο επαναφέρθηκε';

  @override
  String get exportDoctorReportHeading => 'Αναφορά για τον γιατρό';

  @override
  String get exportDoctorReportBody =>
      'Μια σύνοψη που μπορείς να μοιραστείς με τον γιατρό σου.';

  @override
  String get exportIncludeNotesToggle =>
      'Να συμπεριληφθούν οι προσωπικές σημειώσεις';

  @override
  String get exportShareCsvButton => 'Κοινοποίηση ως CSV';

  @override
  String get exportPrintPdfButton => 'Εκτύπωση / Αποθήκευση ως PDF';

  @override
  String get doctorReportDisclaimer =>
      'Δημιουργήθηκε από το Vera με βάση τα δεδομένα που καταχωρίστηκαν στην εφαρμογή. Δεν αποτελεί ιατρική διάγνωση.';

  @override
  String get doctorReportGeneratedOn => 'Ημερομηνία δημιουργίας';

  @override
  String get doctorReportSummaryHeading => 'Σύνοψη';

  @override
  String get doctorReportDailyLogHeading => 'Ημερήσια καταγραφή';

  @override
  String get doctorReportColumnDate => 'Ημερομηνία';

  @override
  String get doctorReportTimelineHeading => 'Χρονολόγιο κύκλου';

  @override
  String get doctorReportCycleLabel => 'Κύκλος';

  @override
  String get doctorReportTimelineLegendPeriod => 'Περίοδος';

  @override
  String get doctorReportTimelineLegendCycle => 'Υπόλοιπο κύκλου';

  @override
  String get doctorReportTimelineOngoing => 'Σε εξέλιξη';

  @override
  String get dailyInsightLabel => 'Το ήξερες;';

  @override
  String get insightMenstrual1 =>
      'Το ενδομήτριο αποβάλλεται αυτή τη στιγμή — οι περισσότερες περίοδοι διαρκούν 3 έως 7 ημέρες, και αυτό είναι απολύτως φυσιολογικό.';

  @override
  String get insightMenstrual2 =>
      'Τροφές πλούσιες σε σίδηρο, όπως τα πράσινα φυλλώδη λαχανικά και οι φακές, βοηθούν να αναπληρωθεί ό,τι χάνει το σώμα σου αυτή την εβδομάδα.';

  @override
  String get insightFollicular1 =>
      'Τα οιστρογόνα ανεβαίνουν, και πολλοί άνθρωποι παρατηρούν περισσότερη ενέργεια και καλύτερη συγκέντρωση από αυτό το σημείο και μετά.';

  @override
  String get insightFollicular2 =>
      'Το σώμα σου προετοιμάζει ένα ωάριο για απελευθέρωση — αυτή η φάση μπορεί να διαρκέσει από μία εβδομάδα έως μερικές εβδομάδες.';

  @override
  String get insightFertile1 =>
      'Αυτές είναι οι εκτιμώμενες γόνιμες ημέρες σου — οι ημέρες γύρω από την ωορρηξία, όταν η εγκυμοσύνη είναι πιο πιθανή με βάση τον συνήθη χρονισμό.';

  @override
  String get insightFertile2 =>
      'Ορισμένοι άνθρωποι παρατηρούν μια μικρή άνοδο στη βασική θερμοκρασία σώματος ή αλλαγές στην τραχηλική βλέννα γύρω από την ωορρηξία.';

  @override
  String get insightLuteal1 =>
      'Η προγεστερόνη ανεβαίνει μετά την ωορρηξία — τότε εμφανίζονται συχνά συμπτώματα του προεμμηνορροϊκού συνδρόμου, όπως αλλαγές στη διάθεση ή φούσκωμα.';

  @override
  String get insightLuteal2 =>
      'Αν δεν έχει γίνει εμφύτευση κύησης, τα επίπεδα των ορμονών πέφτουν προς το τέλος αυτής της φάσης και πυροδοτούν την επόμενη περίοδό σου.';

  @override
  String get insightUnknown1 =>
      'Η διάρκεια του κύκλου διαφέρει πολύ από άνθρωπο σε άνθρωπο — οτιδήποτε από 21 έως 35 ημέρες θεωρείται σύνηθες.';

  @override
  String get insightsPhaseTipsTitle =>
      'Μπορεί να σου κάνουν καλό σε αυτή τη φάση';

  @override
  String get tipFitnessLabel => 'Κίνηση';

  @override
  String get tipNutritionLabel => 'Διατροφή';

  @override
  String get tipFitnessMenstrual =>
      'Η ήπια κίνηση — περπάτημα, διατάσεις ή restorative yoga — μπορεί να σου κάνει καλύτερα αυτή τη στιγμή από την έντονη προπόνηση.';

  @override
  String get tipFitnessFollicular =>
      'Η ενέργεια συνήθως ανεβαίνει σε αυτή τη φάση — καλό διάστημα για να δοκιμάσεις κάτι νέο ή να πιέσεις λίγο περισσότερο.';

  @override
  String get tipFitnessFertile =>
      'Πολλοί άνθρωποι νιώθουν εδώ στα υψηλότερα επίπεδα ενέργειας — καλή φάση για προπόνηση υψηλής έντασης, αν σου αρέσει.';

  @override
  String get tipFitnessLuteal =>
      'Αν η ενέργεια πέσει αργότερα σε αυτή τη φάση, η ήπια ενδυνάμωση ή το κολύμπι μπορεί να αντέξουν πιο εύκολα στον χρόνο.';

  @override
  String get tipFitnessUnknown =>
      'Όποια κίνηση σου κάνει καλό σήμερα είναι καλή επιλογή — δεν υπάρχει μία «σωστή» ρουτίνα για κάθε ημέρα.';

  @override
  String get tipNutritionMenstrual =>
      'Τροφές πλούσιες σε σίδηρο, όπως τα πράσινα φυλλώδη λαχανικά, οι φακές και το κόκκινο κρέας, βοηθούν να αναπληρωθεί ό,τι χάνει το σώμα σου αυτή την εβδομάδα.';

  @override
  String get tipNutritionFollicular =>
      'Πιο ελαφριά, φρέσκα γεύματα συνήθως πέφτουν καλά καθώς ανεβαίνει η ενέργεια — δεν υπάρχει όμως ένας «σωστός» τρόπος διατροφής σε αυτή τη φάση.';

  @override
  String get tipNutritionFertile =>
      'Η καλή ενυδάτωση και τα ισορροπημένα γεύματα στηρίζουν την ενέργεια σε αυτή την πιο δραστήρια φάση.';

  @override
  String get tipNutritionLuteal =>
      'Οι λιγούρες μπορεί να αλλάξουν εδώ — οι σύνθετοι υδατάνθρακες και τροφές πλούσιες σε μαγνήσιο, όπως οι ξηροί καρποί και η μαύρη σοκολάτα, είναι συνηθισμένες επιλογές.';

  @override
  String get tipNutritionUnknown =>
      'Ισορροπημένα, τακτικά γεύματα είναι μια σταθερή επιλογή όποτε η φάση σου δεν είναι ακόμη σαφής.';

  @override
  String get predictionSettingsEntry => 'Ρυθμίσεις πρόβλεψης';

  @override
  String get predictionSettingsIntro =>
      'Αυτές είναι παραδοχές, δηλωμένες ανοιχτά. Μόλις καταγράψεις 2 ολοκληρωμένους κύκλους, η πραγματική πρόβλεψη στην Αρχική υπολογίζεται από τα δικά σου δεδομένα — αυτοί οι αριθμοί παύουν να χρησιμοποιούνται γι\' αυτό.';

  @override
  String get predictionSettingsPeriodLengthLabel => 'Συνήθης διάρκεια περιόδου';

  @override
  String get predictionSettingsCycleLengthLabel => 'Συνήθης διάρκεια κύκλου';

  @override
  String get predictionSettingsCycleLengthHint =>
      'Χρησιμοποιείται για την κλίμακα του δακτυλίου στην Αρχική, μέχρι να υπάρχουν πραγματικά δεδομένα.';

  @override
  String get predictionSettingsLutealLabel => 'Διάρκεια ωχρινικής φάσης';

  @override
  String get predictionSettingsLutealHint =>
      'Οι συνήθεις ημέρες ανάμεσα στην ωορρηξία και την επόμενη περίοδό σου. Χρησιμοποιείται για να τοποθετηθούν οι εκτιμώμενες γόνιμες ημέρες — αυτή η τιμή συνεχίζει να χρησιμοποιείται ακόμη και αφού ξεκινήσουν οι πραγματικές προβλέψεις.';

  @override
  String get dayLogEnergyLabel => 'Ενέργεια';

  @override
  String get energyLevelLow => 'Χαμηλή';

  @override
  String get energyLevelMedium => 'Μέτρια';

  @override
  String get energyLevelHigh => 'Υψηλή';

  @override
  String get energyLevelEnergetic => 'Στα ύψη';

  @override
  String get dayLogSkinHairLabel => 'Δέρμα & μαλλιά';

  @override
  String get skinHealthyGlow => 'Υγιής λάμψη';

  @override
  String get skinRedness => 'Ερυθρότητα';

  @override
  String get skinDryness => 'Ξηρότητα';

  @override
  String get skinOiliness => 'Λιπαρότητα';

  @override
  String get hairGoodDay => 'Καλή μέρα για τα μαλλιά';

  @override
  String get hairBadDay => 'Κακή μέρα για τα μαλλιά';

  @override
  String get hairLoss => 'Τριχόπτωση';

  @override
  String get scalpOily => 'Λιπαρό τριχωτό';

  @override
  String get dayLogBreastExamLabel => 'Αυτοεξέταση μαστού';

  @override
  String get breastExamAllNormal => 'Τίποτα ασυνήθιστο';

  @override
  String get breastExamLump => 'Ογκίδιο';

  @override
  String get breastExamIndentation => 'Βαθούλωμα';

  @override
  String get breastExamRedness => 'Ερυθρότητα';

  @override
  String get breastExamCrackedNipple => 'Σκασμένη θηλή';

  @override
  String get breastExamDischarge => 'Έκκριση';

  @override
  String get cervixPositionLabel => 'Θέση τραχήλου';

  @override
  String get cervixPositionLow => 'Χαμηλά';

  @override
  String get cervixPositionMedium => 'Μεσαία';

  @override
  String get cervixPositionHigh => 'Ψηλά';

  @override
  String get cervixOpeningLabel => 'Άνοιγμα τραχήλου';

  @override
  String get cervixOpeningClosed => 'Κλειστό';

  @override
  String get cervixOpeningMedium => 'Μεσαίο';

  @override
  String get cervixOpeningOpen => 'Ανοιχτό';

  @override
  String get cervixFirmnessLabel => 'Σκληρότητα τραχήλου';

  @override
  String get cervixFirmnessSoft => 'Μαλακός';

  @override
  String get cervixFirmnessMedium => 'Μέτριος';

  @override
  String get cervixFirmnessFirm => 'Σκληρός';

  @override
  String get dayLogWaterLabel => 'Νερό';

  @override
  String get dayLogSleepLabel => 'Ύπνος';

  @override
  String get dayLogWeightLabel => 'Βάρος';

  @override
  String get dayLogMedicationsLabel => 'Φάρμακα';

  @override
  String get dayLogAddMedication => 'Πρόσθεσε φάρμακο';

  @override
  String get dayLogMedicationNameHint => 'Όνομα φαρμάκου';

  @override
  String get dayLogBirthControlLabel => 'Αντισύλληψη';

  @override
  String get dayLogOtherMedicationsLabel => 'Άλλα φάρμακα';

  @override
  String get birthControlPillTaken => 'Χάπι ελήφθη';

  @override
  String get birthControlPillLate => 'Χάπι ελήφθη αργά';

  @override
  String get birthControlPillMissed => 'Χάπι ξεχάστηκε';

  @override
  String get birthControlPatch => 'Έμπλαστρο';

  @override
  String get birthControlRing => 'Δαχτυλίδι';

  @override
  String get birthControlInjection => 'Ένεση';

  @override
  String get birthControlImplant => 'Εμφύτευμα';

  @override
  String get birthControlIud => 'Σπιράλ';

  @override
  String get navAssistant => 'Βοηθός';

  @override
  String get assistantTitle => 'Βοηθός Vera';

  @override
  String get assistantEndChatTitle => 'Τέλος σε αυτή τη συνομιλία;';

  @override
  String get assistantEndChatBody =>
      'Τα μηνύματα βρίσκονται μόνο στη μνήμη και δεν αποθηκεύονται πουθενά, οπότε δεν μπορούν να ανακτηθούν.';

  @override
  String get assistantEndChatConfirm => 'Τέλος συνομιλίας';

  @override
  String get assistantInputHint => 'Ρώτησε για τον κύκλο σου…';

  @override
  String get assistantIntro =>
      'Εδώ μπορείς να ρωτήσεις για την περίοδο, τον κύκλο και τη λειτουργία του Vera — όλα γίνονται πάνω στο τηλέφωνό σου, τίποτα δεν φεύγει από τη συσκευή. Οι απαντήσεις προέρχονται από τη βάση γνώσεων της συσκευής σου και δεν αποτελούν ιατρική συμβουλή.';

  @override
  String get insightMenstrual3 =>
      'Το αίμα της περιόδου δεν είναι «βρόμικο αίμα» — είναι μείγμα αίματος και ενδομητρίου, ένα απολύτως φυσιολογικό μέρος του κύκλου.';

  @override
  String get insightMenstrual4 =>
      'Η ήπια θερμότητα στο κάτω μέρος της κοιλιάς ανακουφίζει πραγματικά τις κράμπες — η θερμοφόρα είναι κλασική λύση με τεκμηρίωση.';

  @override
  String get insightMenstrual5 =>
      'Η ροή είναι συχνά πιο έντονη τις δύο πρώτες ημέρες και μειώνεται στη συνέχεια — αυτό το μοτίβο είναι σύνηθες.';

  @override
  String get insightMenstrual6 =>
      'Η μεγαλύτερη κόπωση στη διάρκεια της περιόδου είναι συνηθισμένη — μαζί με το αίμα φεύγει και σίδηρος από το σώμα.';

  @override
  String get insightFollicular3 =>
      'Μετά την περίοδο, τα οιστρογόνα ξαναχτίζουν το ενδομήτριο — το σώμα σου ετοιμάζεται από την αρχή.';

  @override
  String get insightFollicular4 =>
      'Το δέρμα συχνά δείχνει πιο καθαρό σε αυτή τη φάση, καθώς σταθεροποιούνται τα επίπεδα των ορμονών.';

  @override
  String get insightFollicular5 =>
      'Η αντοχή και οι χρόνοι αντίδρασης κορυφώνονται για πολλούς ανθρώπους στην ύστερη ωοθυλακική φάση.';

  @override
  String get insightFollicular6 =>
      'Η διάρκεια αυτής της φάσης είναι που διαφέρει περισσότερο από άνθρωπο σε άνθρωπο — η ωχρινική φάση είναι πολύ πιο σταθερή.';

  @override
  String get insightFertile3 =>
      'Το ωάριο ζει περίπου 12–24 ώρες, αλλά τα σπερματοζωάρια μπορούν να περιμένουν έως και 5 ημέρες — γι\' αυτό οι γόνιμες ημέρες καλύπτουν αρκετές ημέρες.';

  @override
  String get insightFertile4 =>
      'Γύρω από την ωορρηξία, η τραχηλική βλέννα γίνεται συχνά διάφανη και ελαστική — σαν ωμό ασπράδι αυγού.';

  @override
  String get insightFertile5 =>
      'Ορισμένοι άνθρωποι νιώθουν μια σύντομη σουβλιά στη μία πλευρά κατά την ωορρηξία — έχει μάλιστα και όνομα: mittelschmerz.';

  @override
  String get insightFertile6 =>
      'Η βασική θερμοκρασία σώματος ανεβαίνει ελαφρώς *μετά* την ωορρηξία — επιβεβαιώνει ότι συνέβη, αντί να την προβλέπει.';

  @override
  String get insightLuteal3 =>
      'Η προγεστερόνη κορυφώνεται περίπου μία εβδομάδα μετά την ωορρηξία — το φούσκωμα και η ευαισθησία στο στήθος είναι συνηθισμένα τότε.';

  @override
  String get insightLuteal4 =>
      'Η λιγούρα για υδατάνθρακες πριν από την περίοδο είναι υπαρκτή — οι ενεργειακές ανάγκες ανεβαίνουν ελαφρώς στην ωχρινική φάση.';

  @override
  String get insightLuteal5 =>
      'Τα συμπτώματα του προεμμηνορροϊκού συνδρόμου συνήθως υποχωρούν μέσα σε μία ή δύο ημέρες αφότου ξεκινήσει η αιμορραγία.';

  @override
  String get insightLuteal6 =>
      'Μια σταθερή ρουτίνα ύπνου μπορεί να απαλύνει αισθητά τις πτώσεις της διάθεσης στο τέλος της ωχρινικής φάσης.';

  @override
  String get insightUnknown2 =>
      'Η καταγραφή μόλις τριών κύκλων αρκεί συχνά για να φανεί το δικό σου μοτίβο.';

  @override
  String get insightUnknown3 =>
      'Οι κύκλοι είναι προσωπική υπόθεση — η σύγκριση του δικού σου με κάποιου άλλου σπάνια λέει κάτι χρήσιμο.';

  @override
  String get insightUnknown4 =>
      'Το άγχος, τα ταξίδια και η ασθένεια μπορούν να μετακινήσουν την ωορρηξία — μια «καθυστερημένη» περίοδος συχνά σημαίνει απλώς καθυστερημένη ωορρηξία.';

  @override
  String get settingsThemeLabel => 'Θέμα';

  @override
  String get settingsThemeSystem => 'Συστήματος';

  @override
  String get settingsThemeLight => 'Φωτεινό';

  @override
  String get settingsThemeDark => 'Σκούρο';

  @override
  String get settingsMascotLabel => 'Μασκότ συντροφιάς';

  @override
  String get mascotDroplet => 'Σταγόνα';

  @override
  String get mascotFlower => 'Λουλούδι';

  @override
  String get mascotMoon => 'Φεγγάρι';

  @override
  String get mascotNone => 'Καμία';

  @override
  String homeWindowCountdown(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: 'Το προβλεπόμενο διάστημα ξεκινά σε περίπου $days ημέρες',
      one: 'Το προβλεπόμενο διάστημα ξεκινά σε περίπου 1 ημέρα',
    );
    return '$_temp0';
  }

  @override
  String homeOvulationCountdown(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: 'Εκτιμώμενη ωορρηξία σε περίπου $days ημέρες',
      one: 'Εκτιμώμενη ωορρηξία σε περίπου 1 ημέρα',
    );
    return '$_temp0';
  }

  @override
  String get homeQuickLogTitle => 'Πώς νιώθει το σώμα σου σήμερα;';

  @override
  String get actionSave => 'Αποθήκευση';

  @override
  String get insightsTrackerHubTitle => 'Οι καταγραφές σου';

  @override
  String get trackerHistoryEmpty =>
      'Καμία καταχώριση σε αυτό το διάστημα ακόμη';

  @override
  String get trackerStatAverage => 'Μέσος όρος';

  @override
  String get trackerStatLowest => 'Ελάχιστο';

  @override
  String get trackerStatHighest => 'Μέγιστο';

  @override
  String get trackerStatLatest => 'Τελευταίο';

  @override
  String get rangeFilter1m => '1 μήν.';

  @override
  String get rangeFilter3m => '3 μήν.';

  @override
  String get rangeFilter6m => '6 μήν.';

  @override
  String get dayLogOvulationTestLabel => 'Τεστ ωορρηξίας';

  @override
  String get ovulationTestNegative => 'Αρνητικό';

  @override
  String get ovulationTestPositive => 'Θετικό';

  @override
  String get ovulationTestLow => 'Χαμηλό';

  @override
  String get ovulationTestHigh => 'Υψηλό';

  @override
  String get ovulationTestPeak => 'Κορύφωση';

  @override
  String get pregnancyTestLabel => 'Τεστ εγκυμοσύνης';

  @override
  String get pregnancyTestPositive => 'Θετικό';

  @override
  String get pregnancyTestFaint => 'Αχνή γραμμή';

  @override
  String get pregnancyTestNegative => 'Αρνητικό';

  @override
  String get settingsOvulationTestToggle => 'Τεστ ωορρηξίας';

  @override
  String get settingsRemindersOvulationLabel =>
      'Προειδοποίηση για τις γόνιμες ημέρες';

  @override
  String get reminderOvulationTitle =>
      'Πλησιάζουν οι εκτιμώμενες γόνιμες ημέρες';

  @override
  String get reminderOvulationBody =>
      'Με βάση τους κύκλους που έχεις καταγράψει, οι εκτιμώμενες γόνιμες ημέρες σου μπορεί να ξεκινήσουν σύντομα.';

  @override
  String trackerEntriesCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count καταχωρίσεις',
      one: '1 καταχώριση',
    );
    return '$_temp0';
  }

  @override
  String get trackerLowSampleNote =>
      'Με τόσο λίγες καταχωρίσεις τα ποσοστά δεν είναι ακόμη αξιόπιστα — θα βελτιωθούν όσο καταγράφεις περισσότερα.';

  @override
  String get assistantTyping => 'Το Vera γράφει…';

  @override
  String get premiumTitle => 'Vera Premium';

  @override
  String get premiumHeadline => 'Vera Premium';

  @override
  String get premiumSubhead =>
      'Κάθε λειτουργία καταγραφής παραμένει δωρεάν για πάντα — το ιστορικό σου δεν κλειδώνεται ποτέ. Το Premium προσθέτει δικές σου καταγραφές, βαθύτερα ευρήματα, δικές σου υπενθυμίσεις και επιπλέον εμφανίσεις, και αφαιρεί τις διαφημίσεις.';

  @override
  String get premiumBenefitNoAds => 'Καμία διαφήμιση, πουθενά στην εφαρμογή';

  @override
  String get premiumBenefitSupport =>
      'Στηρίζει μια ανεξάρτητη εφαρμογή που βάζει πρώτο το απόρρητο';

  @override
  String get premiumMonthly => 'Μηνιαία';

  @override
  String get premiumYearly => 'Ετήσια';

  @override
  String get premiumYearlyNote => 'Χρέωση μία φορά τον χρόνο';

  @override
  String premiumPerMonth(String price) {
    return '$price / μήνα';
  }

  @override
  String get premiumBilledMonthly => 'Χρέωση κάθε μήνα';

  @override
  String get premiumStaysFreeTitle => 'Τι παραμένει δωρεάν';

  @override
  String get premiumStaysFreeBody =>
      'Το ημερολόγιο, όλο το ιστορικό σου, τα βασικά στατιστικά και η εξαγωγή είναι για πάντα δωρεάν. Το Premium προσθέτει, δεν αφαιρεί ποτέ.';

  @override
  String get premiumSubscribeCta => 'Συνέχεια';

  @override
  String get premiumRestore => 'Επαναφορά αγοράς';

  @override
  String get premiumCancelNote =>
      'Μπορείς να ακυρώσεις όποτε θέλεις από τον λογαριασμό σου στο app store. Καμία αντίστροφη μέτρηση, καμία πίεση — αν δεν είναι η κατάλληλη στιγμή, η δωρεάν έκδοση συνεχίζει να λειτουργεί ακριβώς όπως σήμερα.';

  @override
  String get premiumActiveBadge => 'Το Premium είναι ενεργό';

  @override
  String get premiumDevToggle => 'Προσομοίωση Premium (ανάπτυξη)';

  @override
  String get settingsPremiumEntry => 'Vera Premium';

  @override
  String get adTestNotice =>
      'Δοκιμαστική διαφήμιση — όχι πραγματική τοποθέτηση ακόμη';

  @override
  String get settingsPregnancyModeLabel => 'Λειτουργία εγκυμοσύνης';

  @override
  String get pregnancyLmpLabel => 'Πρώτη ημέρα της τελευταίας περιόδου';

  @override
  String pregnancyWeekLabel(int weeks, int days) {
    return 'Εβδομάδα $weeks, ημέρα $days';
  }

  @override
  String get pregnancyDueDateLabel => 'Εκτιμώμενη ημερομηνία τοκετού';

  @override
  String pregnancyDaysLeft(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: 'Απομένουν περίπου $days ημέρες',
      one: 'Απομένει περίπου 1 ημέρα',
    );
    return '$_temp0';
  }

  @override
  String pregnancyTrimesterLabel(int n) {
    return 'Τρίμηνο $n';
  }

  @override
  String get pregnancyDisclaimer =>
      'Οι ημερομηνίες υπολογίζονται από την τελευταία σου περίοδο με τον καθιερωμένο κανόνα των 280 ημερών. Ένας υπέρηχος δίνει πιο ακριβή ημερομηνία, και μια καθυστερημένη ωορρηξία μετατοπίζει αυτούς τους αριθμούς — πρόκειται για ενημέρωση, όχι για ιατρική φροντίδα.';

  @override
  String get pregnancySizeLabel => 'Μέγεθος μωρού';

  @override
  String get pregnancySizeUnder5 => 'Σπόρος παπαρούνας (~2 mm)';

  @override
  String get pregnancySizeUnder9 => 'Μύρτιλο (~1.6 cm)';

  @override
  String get pregnancySizeUnder13 => 'Πράσινο λεμόνι (~5.4 cm)';

  @override
  String get pregnancySizeUnder20 => 'Αβοκάντο (~11.6 cm)';

  @override
  String get pregnancySizeUnder28 => 'Μάνγκο (~30 cm)';

  @override
  String get pregnancySizeUnder34 => 'Ανανάς (~44 cm)';

  @override
  String get pregnancySizeUnder38 => 'Πεπόνι (~46 cm)';

  @override
  String get pregnancySizeTerm => 'Μικρό καρπούζι (~51 cm)';

  @override
  String get pregnancyNoteUnder5 =>
      'Οι περισσότεροι άνθρωποι δεν παρατηρούν τίποτα ακόμη — επειδή η ηλικία κύησης μετριέται από την τελευταία περίοδο, οι δύο πρώτες εβδομάδες είναι στην πραγματικότητα πριν από τη σύλληψη.';

  @override
  String get pregnancyNoteUnder9 =>
      'Η ναυτία, η ευαισθησία στο στήθος και η κόπωση είναι συνηθισμένες αυτή την περίοδο. Καλή στιγμή για να κανονίσεις ένα πρώτο ραντεβού.';

  @override
  String get pregnancyNoteUnder13 =>
      'Πλησιάζεις στο τέλος του πρώτου τριμήνου· για πολλούς ανθρώπους η ναυτία αρχίζει να υποχωρεί περίπου τώρα.';

  @override
  String get pregnancyNoteUnder20 =>
      'Η ενέργεια συχνά επιστρέφει σε αυτό το διάστημα. Οι πρώτες κινήσεις μπορεί να γίνουν αισθητές οποτεδήποτε ανάμεσα στην 16η και την 22η εβδομάδα.';

  @override
  String get pregnancyNoteUnder28 =>
      'Οι κινήσεις γίνονται ευδιάκριτες και αρχίζουν να ακολουθούν ένα μοτίβο. Ο πόνος στη μέση και η καούρα είναι συνηθισμένα σε αυτό το διάστημα.';

  @override
  String get pregnancyNoteUnder34 =>
      'Βρίσκεσαι στο τρίτο τρίμηνο. Η δύσπνοια, η συχνή ούρηση και οι συσπάσεις Braxton-Hicks είναι συνηθισμένες.';

  @override
  String get pregnancyNoteUnder38 =>
      'Το μωρό ετοιμάζεται για τη γέννηση. Καλή στιγμή για τη βαλίτσα του μαιευτηρίου και ένα σχέδιο τοκετού.';

  @override
  String get pregnancyNoteTerm =>
      'Η κύηση είναι πλέον τελειόμηνη — η γέννηση μπορεί να συμβεί οποτεδήποτε ανάμεσα στην 37η και την 42η εβδομάδα· η 40ή εβδομάδα είναι μέσος όρος, όχι προθεσμία.';

  @override
  String get pregnancyWeeklyNoteTitle => 'Αυτή την εβδομάδα';

  @override
  String get pregnancyNeedsLmp =>
      'Πρόσθεσε την πρώτη ημέρα της τελευταίας σου περιόδου για να ξεκινήσει η παρακολούθηση.';

  @override
  String get pregnancyOutOfRange =>
      'Αυτή η ημερομηνία είναι περισσότερο από 42 εβδομάδες πριν — ενημέρωσέ την ή απενεργοποίησε τη λειτουργία εγκυμοσύνης.';

  @override
  String get partnerShareTitle => 'Κοινοποίηση σύνοψης σε σύντροφο';

  @override
  String get partnerShareBody =>
      'Δημιουργείται μια σύντομη σύνοψη σε κείμενο — η τρέχουσα φάση σου και το εκτιμώμενο διάστημα — την οποία στέλνεις εσύ μέσα από όποια εφαρμογή θέλεις. Δεν υπάρχει ζωντανός συγχρονισμός ούτε λογαριασμός συντρόφου: τίποτα δεν κοινοποιείται αν δεν το στείλεις.';

  @override
  String get partnerShareCta => 'Δημιουργία σύνοψης';

  @override
  String get partnerSummaryHeader => 'Σύνοψη κύκλου από το Vera';

  @override
  String get settingsHomeThemeLabel => 'Φόντο αρχικής';

  @override
  String get homeThemeWheat => 'Στάχυ';

  @override
  String get homeThemeSky => 'Ουρανός';

  @override
  String get homeThemeField => 'Χωράφι';

  @override
  String get homeThemeBlossom => 'Άνθος';

  @override
  String get homeThemePlain => 'Απλό';

  @override
  String get backupNudgeTitle => 'Κράτα ένα αντίγραφο των δεδομένων σου';

  @override
  String get backupNudgeBody =>
      'Τα πάντα βρίσκονται μόνο σε αυτό το τηλέφωνο. Αν χαθεί, χαλάσει ή γίνει επαναφορά, το ιστορικό σου φεύγει μαζί του — ένα κρυπτογραφημένο αντίγραφο θέλει μια στιγμή και μόνο εσύ μπορείς να το ανοίξεις.';

  @override
  String get backupNudgeCta => 'Δημιουργία τώρα';

  @override
  String get backupNudgeDismiss => 'Αργότερα';

  @override
  String backupLastDone(String date) {
    return 'Τελευταίο αντίγραφο: $date';
  }

  @override
  String get backupNever => 'Κανένα αντίγραφο ακόμη';

  @override
  String get settingsRemindersBackupLabel =>
      'Υπενθύμιση για αντίγραφο ασφαλείας';

  @override
  String get reminderBackupTitle => 'Ώρα για αντίγραφο του Vera';

  @override
  String get reminderBackupBody =>
      'Το ιστορικό σου υπάρχει μόνο σε αυτό το τηλέφωνο. Ένα γρήγορο κρυπτογραφημένο αντίγραφο το κρατά ασφαλές.';

  @override
  String get notificationChannelPeriodStart => 'Επερχόμενη περίοδος';

  @override
  String get notificationChannelPeriodEnd => 'Έλεγχος στο τέλος της περιόδου';

  @override
  String get notificationChannelMedication => 'Φάρμακα';

  @override
  String get notificationChannelWater => 'Νερό';

  @override
  String get notificationChannelAppointment => 'Ραντεβού';

  @override
  String get notificationChannelOvulation => 'Γόνιμες ημέρες';

  @override
  String get notificationChannelBackup => 'Υπενθύμιση αντιγράφου';

  @override
  String get calendarDayDetailTitle => 'Αυτή η ημέρα';

  @override
  String get calendarDayNothingLogged =>
      'Δεν έχει καταγραφεί τίποτα για αυτή την ημέρα ακόμη';

  @override
  String get calendarDayOpenLog => 'Άνοιγμα ημερήσιας καταγραφής';

  @override
  String get cycleHistoryTitle => 'Προηγούμενοι κύκλοι';

  @override
  String get cycleTrendsTitle => 'Τάσεις κύκλου';

  @override
  String get cycleHistoryEmpty =>
      'Κατέγραψε δύο περιόδους και το ιστορικό των κύκλων σου θα εμφανιστεί εδώ.';

  @override
  String get cycleHistoryOngoing => 'Σε εξέλιξη';

  @override
  String cycleHistoryLength(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: 'Κύκλος $days ημερών',
      one: 'Κύκλος 1 ημέρας',
    );
    return '$_temp0';
  }

  @override
  String cycleHistoryPeriodLength(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: 'Η περίοδος κράτησε $days ημέρες',
      one: 'Η περίοδος κράτησε 1 ημέρα',
    );
    return '$_temp0';
  }

  @override
  String cycleHistoryVsAverage(String diff) {
    return '$diff σε σχέση με τον μέσο όρο σου';
  }

  @override
  String get insightsCycleHistoryEntry => 'Προηγούμενοι κύκλοι';

  @override
  String get homeEmptyTitle => 'Ας ξεκινήσουμε από την τελευταία σου περίοδο';

  @override
  String get homeEmptyBody =>
      'Πάτησε το κουμπί παραπάνω την ημέρα που ξεκινά η περίοδός σου. Μετά από δύο ολοκληρωμένους κύκλους το Vera μπορεί να αρχίσει τις εκτιμήσεις — μέχρι τότε δεν θα κάνει ότι ξέρει.';

  @override
  String get homeEmptyBackdate => 'Είχε ήδη ξεκινήσει νωρίτερα';

  @override
  String get settingsAdPrivacyEntry => 'Επιλογές απορρήτου διαφημίσεων';

  @override
  String a11yCycleRing(int day, int length) {
    return 'Ημέρα $day από περίπου $length του κύκλου';
  }

  @override
  String a11yChartSummary(int count, String min, String max) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Γράφημα με $count καταχωρίσεις, από $min έως $max',
      one: 'Γράφημα με 1 καταχώριση, από $min έως $max',
    );
    return '$_temp0';
  }

  @override
  String a11yPhaseBar(int day, int length) {
    return 'Πρόοδος κύκλου: ημέρα $day από περίπου $length';
  }

  @override
  String a11yFrequencyItem(String label, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count φορές',
      one: '1 φορά',
    );
    return '$label: $_temp0';
  }

  @override
  String get importTitle => 'Εισαγωγή από άλλη εφαρμογή';

  @override
  String get importBody =>
      'Εξήγαγε το ιστορικό σου από την παλιά σου εφαρμογή ως CSV και μετά διάλεξε εδώ το αρχείο. Εισάγονται μόνο ημερομηνίες και ροή — η διατύπωση για συμπτώματα και διάθεση διαφέρει από εφαρμογή σε εφαρμογή, και το Vera δεν θα μαντέψει τι εννοούσες.';

  @override
  String get importPickFile => 'Επίλεξε αρχείο CSV';

  @override
  String importPreview(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Βρέθηκε ιστορικό $count ημερών',
      one: 'Βρέθηκε ιστορικό 1 ημέρας',
    );
    return '$_temp0';
  }

  @override
  String importSkipped(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count γραμμές δεν διαβάστηκαν και θα παραλειφθούν',
      one: '1 γραμμή δεν διαβάστηκε και θα παραλειφθεί',
    );
    return '$_temp0';
  }

  @override
  String get importConfirm => 'Προσθήκη στο ιστορικό μου';

  @override
  String get importMergeNote =>
      'Οι ημέρες που εισάγονται συγχωνεύονται. Οι ημέρες που έχεις ήδη καταγράψει στο Vera μένουν όπως είναι.';

  @override
  String importDone(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Εισήχθησαν $count ημέρες',
      one: 'Εισήχθη 1 ημέρα',
    );
    return '$_temp0';
  }

  @override
  String get importErrorEmpty => 'Αυτό το αρχείο φαίνεται κενό.';

  @override
  String get importErrorNoDate =>
      'Δεν βρέθηκε στήλη ημερομηνίας σε αυτό το αρχείο.';

  @override
  String get settingsImportEntry => 'Εισαγωγή από άλλη εφαρμογή';

  @override
  String get settingsHealthSyncLabel =>
      'Συγχρονισμός με Apple Health / Health Connect';

  @override
  String get settingsHealthSyncBody =>
      'Γράφει μόνο τη ροή της περιόδου, το βάρος και τη βασική θερμοκρασία στην εφαρμογή υγείας του τηλεφώνου σου. Τα συμπτώματα, οι διαθέσεις και οι σημειώσεις μένουν στο Vera. Τίποτα δεν διαβάζεται πίσω.';

  @override
  String healthSyncBackfilled(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Στάλθηκαν $count ημέρες στην εφαρμογή υγείας σου',
      one: 'Στάλθηκε 1 ημέρα στην εφαρμογή υγείας σου',
    );
    return '$_temp0';
  }

  @override
  String get healthSyncDenied =>
      'Δεν δόθηκε άδεια, οπότε ο συγχρονισμός παραμένει ανενεργός.';

  @override
  String get settingsDiagnosticsEntry => 'Διαγνωστικά';

  @override
  String get diagnosticsBody =>
      'Αν η εφαρμογή δυσλειτουργήσει, οι τεχνικές λεπτομέρειες καταγράφονται εδώ — μόνο σε αυτή τη συσκευή. Τίποτα δεν στέλνεται πουθενά αν δεν επιλέξεις να το στείλεις, και μπορείς πρώτα να διαβάσεις ακριβώς τι θα έστελνες.';

  @override
  String get diagnosticsEmpty =>
      'Δεν έχει καταγραφεί τίποτα — δεν έχουν εντοπιστεί προβλήματα.';

  @override
  String get diagnosticsShare => 'Αποστολή στην ομάδα ανάπτυξης';

  @override
  String get diagnosticsClear => 'Καθαρισμός';

  @override
  String get diagnosticsNoteLabel => 'Τι συνέβη; (προαιρετικό)';

  @override
  String get diagnosticsTechnicalDetail => 'Τεχνικές λεπτομέρειες';

  @override
  String get unitHoursShort => 'ώ';

  @override
  String get unitMinutesShort => 'λ';

  @override
  String get unitHoursLong => 'ώρες';

  @override
  String get unitMinutesLong => 'λεπτά';

  @override
  String get unitMilliliters => 'ml';

  @override
  String get unitKilograms => 'kg';

  @override
  String get calendarJumpTitle => 'Μετάβαση σε μήνα';

  @override
  String get calendarJumpYearLabel => 'Έτος';

  @override
  String get settingsAdPrivacyUnavailable =>
      'Οι επιλογές εξατομίκευσης διαφημίσεων δεν προσφέρονται στην περιοχή σου — οι διαφημίσεις εδώ είναι ήδη μη εξατομικευμένες.';

  @override
  String get settingsGroupAppearance => 'Εμφάνιση';

  @override
  String get settingsGroupTracking => 'Προτιμήσεις καταγραφής';

  @override
  String get dayLogCustomTagsLabel => 'Οι δικές μου καταγραφές';

  @override
  String get customTagAddButton => 'Πρόσθεσε καταγραφή';

  @override
  String get customTagDialogTitle => 'Νέα καταγραφή';

  @override
  String get customTagDialogHint => 'π.χ. ημικρανία, γυμναστήριο, αϋπνία';

  @override
  String get customTagManageEntry => 'Διαχείριση των καταγραφών μου';

  @override
  String get customTagRenameTitle => 'Μετονομασία καταγραφής';

  @override
  String get customTagDeleteTitle => 'Διαγραφή αυτής της καταγραφής;';

  @override
  String get customTagDeleteBody =>
      'Θα αφαιρεθεί από κάθε ημέρα που τη χρησιμοποίησες. Οι υπόλοιπες καταχωρίσεις σου μένουν όπως είναι.';

  @override
  String get customTagEmpty => 'Δεν έχεις δικές σου καταγραφές ακόμη.';

  @override
  String get premiumLockedTitle => 'Λειτουργία Premium';

  @override
  String get premiumLockedAction => 'Δες το Premium';

  @override
  String get premiumBenefitCustomTrackers =>
      'Κατέγραψε ό,τι θέλεις, με τα δικά σου λόγια';

  @override
  String get premiumBenefitAdvancedInsights =>
      'Προχωρημένα ευρήματα: τι τείνει να συμβαίνει και πότε';

  @override
  String get premiumBenefitPersonalisation => 'Επιπλέον φόντα και μασκότ';

  @override
  String get premiumBenefitAdvancedReminders =>
      'Υπενθυμίσεις στο δικό σου πρόγραμμα';

  @override
  String get advancedInsightsTitle => 'Προχωρημένα ευρήματα';

  @override
  String get advancedInsightsEntry => 'Προχωρημένα ευρήματα';

  @override
  String get advancedInsightsNotEnough =>
      'Κατέγραψε τρεις ολοκληρωμένους κύκλους και τα μοτίβα σου θα εμφανιστούν εδώ. Με λιγότερους, κάθε «μοτίβο» θα ήταν απλώς σύμπτωση.';

  @override
  String get advancedInsightsPatternsTitle => 'Πότε τείνουν να εμφανίζονται';

  @override
  String advancedInsightsPatternLine(String label, String segment) {
    return '$label — συνήθως $segment';
  }

  @override
  String advancedInsightsPatternDetail(int count, int day) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ημέρες καταγράφηκαν, γύρω στην ημέρα $day του κύκλου σου',
      one: '1 ημέρα καταγράφηκε, γύρω στην ημέρα $day του κύκλου σου',
    );
    return '$_temp0';
  }

  @override
  String advancedInsightsNoPattern(String label) {
    return '$label — χωρίς σαφή χρονισμό ακόμη';
  }

  @override
  String get advancedInsightsTrendTitle => 'Διάρκεια κύκλου στον χρόνο';

  @override
  String advancedInsightsDriftLonger(String days, String cycles) {
    return 'Συγκρίνοντας τους πρώτους σου $cycles κύκλους με τους τελευταίους $cycles, οι πρόσφατοι διαρκούν περίπου $days ημέρες περισσότερο.';
  }

  @override
  String advancedInsightsDriftShorter(String days, String cycles) {
    return 'Συγκρίνοντας τους πρώτους σου $cycles κύκλους με τους τελευταίους $cycles, οι πρόσφατοι διαρκούν περίπου $days ημέρες λιγότερο.';
  }

  @override
  String advancedInsightsDriftStable(String cycles) {
    return 'Συγκρίνοντας τους πρώτους σου $cycles κύκλους με τους τελευταίους $cycles, η διάρκεια του κύκλου σου έχει μείνει περίπου ίδια.';
  }

  @override
  String get advancedInsightsDriftNotEnough =>
      'Μόλις συμπληρωθούν έξι ολοκληρωμένοι κύκλοι, το Vera μπορεί να συγκρίνει τους πρώτους με τους πιο πρόσφατους για να δει αν η διάρκεια του κύκλου σου μετατοπίζεται.';

  @override
  String get advancedInsightsMoodTitle => 'Διάθεση ανά τμήμα του κύκλου';

  @override
  String get advancedInsightsDisclaimer =>
      'Αυτά είναι απλώς μετρήσεις όσων κατέγραψες, τίποτα παραπάνω. Δεν αποτελούν διάγνωση, και ένα μοτίβο εδώ δεν είναι αιτία.';

  @override
  String get segmentPeriod => 'στη διάρκεια της περιόδου σου';

  @override
  String get segmentAfterPeriod => 'μετά την περίοδό σου';

  @override
  String get segmentMidCycle => 'στα μέσα του κύκλου';

  @override
  String get segmentBeforePeriod => 'πριν από την περίοδό σου';

  @override
  String get customRemindersEntry => 'Οι δικές μου υπενθυμίσεις';

  @override
  String get customRemindersTitle => 'Οι δικές μου υπενθυμίσεις';

  @override
  String get customRemindersEmpty => 'Δεν έχεις δικές σου υπενθυμίσεις ακόμη.';

  @override
  String get customRemindersAdd => 'Πρόσθεσε υπενθύμιση';

  @override
  String get customReminderLabelHint => 'π.χ. να πάρω το χάπι μου, να πιω νερό';

  @override
  String get customReminderLockScreenNote =>
      'Το κείμενο της υπενθύμισης εμφανίζεται στην οθόνη κλειδώματος, οπότε κράτησέ το όσο προσωπικό θέλεις να είναι.';

  @override
  String get customReminderDelete => 'Διαγραφή υπενθύμισης';

  @override
  String get homeThemeDusk => 'Σούρουπο';

  @override
  String get homeThemeMeadow => 'Λιβάδι';

  @override
  String get homeThemePetal => 'Πέταλο';

  @override
  String get homeThemeBloom => 'Ανθοφορία';

  @override
  String get homeThemeOcean => 'Ωκεανός';

  @override
  String get homeThemeAutumn => 'Φθινόπωρο';

  @override
  String get homeThemeNight => 'Νύχτα';

  @override
  String get mascotStar => 'Αστέρι';

  @override
  String get mascotLeaf => 'Φύλλο';

  @override
  String get mascotCat => 'Γάτα';

  @override
  String get mascotRabbit => 'Κουνέλι';

  @override
  String get mascotBird => 'Πουλί';

  @override
  String get tipDetailWhatsHappening => 'Τι συμβαίνει στο σώμα σου';

  @override
  String get tipDetailGeneralHeading => 'Γενικές προτάσεις';

  @override
  String get tipDetailDisclaimer =>
      'Αυτή είναι γενική ενημέρωση, όχι προσωπική ιατρική συμβουλή. Κάθε σώμα αντιδρά διαφορετικά, και το πώς νιώθεις πραγματικά μετράει περισσότερο από οτιδήποτε προτείνεται εδώ. Αν κάτι σε ανησυχεί, μίλησε με έναν επαγγελματία υγείας.';

  @override
  String get phaseExplainerMenstrual =>
      'Αιμορραγείς επειδή αποβάλλεται το ενδομήτριο. Τα οιστρογόνα και η προγεστερόνη βρίσκονται στο χαμηλότερο σημείο του κύκλου, και γι\' αυτό πολλοί άνθρωποι νιώθουν πιο κουρασμένοι και πιο στραμμένοι προς τα μέσα τις πρώτες μέρες. Η αιμορραγία διαρκεί συνήθως τρεις έως επτά μέρες και είναι πιο έντονη στην αρχή. Οι κράμπες προέρχονται από τις συσπάσεις της μήτρας, που τις πυροδοτούν οι προσταγλανδίνες — ορμονοειδείς ουσίες που απελευθερώνονται καθώς διασπάται το ενδομήτριο, γι\' αυτό και σε κάποιους εμφανίζεται ταυτόχρονα πόνος στη μέση ή πιο χαλαρό έντερο. Η αιμορραγία κοστίζει επίσης σίδηρο, και αυτό εξηγεί ένα μέρος της κόπωσης. Η ζέστη, η κίνηση και ο ύπνος συνήθως βοηθούν. Αν όμως η προστασία γεμίζει κάθε ώρα, αν η αιμορραγία ξεπερνά σαφώς την εβδομάδα ή αν ο πόνος σε εμποδίζει να κάνεις συνηθισμένα πράγματα, αξίζει να το συζητήσεις με έναν επαγγελματία υγείας αντί να το περιμένεις να περάσει.';

  @override
  String get phaseExplainerFollicular =>
      'Όταν τελειώσει η αιμορραγία, τα οιστρογόνα αρχίζουν πάλι να ανεβαίνουν. Στις ωοθήκες ωριμάζει μια ομάδα ωοθυλακίων, καθένα με ένα ωάριο, και συνήθως μόνο ένα φτάνει να απελευθερωθεί. Τα οιστρογόνα ξαναχτίζουν το ενδομήτριο που μόλις αποβλήθηκε, και οι περισσότεροι παρατηρούν ότι μαζί τους επιστρέφουν η ενέργεια, η διάθεση, το δέρμα και η αντοχή. Αυτό είναι επίσης το κομμάτι του κύκλου που διαφέρει περισσότερο από άτομο σε άτομο και από μήνα σε μήνα — το άγχος, μια ασθένεια, τα ταξίδια και ο ύπνος φαίνονται κυρίως εδώ, μακραίνοντάς το ή κονταίνοντάς το. Αυτός είναι ο ειλικρινής λόγος που μια πρόβλεψη είναι εύρος και όχι ημερομηνία: το δεύτερο μισό του κύκλου μένει αρκετά σταθερό, και αυτό το μισό είναι που κινείται.';

  @override
  String get phaseExplainerFertile =>
      'Τα οιστρογόνα είναι κοντά στην κορύφωσή τους και η ωορρηξία αναμένεται γύρω σε αυτές τις μέρες. Μια απότομη άνοδος της ωχρινοτρόπου ορμόνης πυροδοτεί την απελευθέρωση του ωαρίου περίπου μία με μιάμιση μέρα αργότερα. Το ίδιο το ωάριο επιβιώνει περίπου 12 έως 24 ώρες, αλλά τα σπερματοζωάρια μπορούν να ζήσουν αρκετές μέρες σε γόνιμη τραχηλική βλέννα — γι\' αυτό το παράθυρο μετριέται σε μέρες και όχι σε μία. Η βλέννα γίνεται τυπικά διαυγής, ελαστική και ολισθηρή, κάπως σαν ωμό ασπράδι αυγού· κάποιοι παρατηρούν μεγαλύτερη διάθεση, ευαισθησία στο στήθος ή ένα σύντομο τσίμπημα στη μία πλευρά. Η ενέργεια βρίσκεται συχνά στο ψηλότερο σημείο του κύκλου. Θυμήσου ότι αυτό το παράθυρο είναι εκτίμηση από το δικό σου ιστορικό, όχι μέτρηση, και δεν είναι μέθοδος αντισύλληψης.';

  @override
  String get phaseExplainerLuteal =>
      'Μετά την ωορρηξία, το άδειο ωοθυλάκιο γίνεται ωχρό σωμάτιο και αρχίζει να παράγει προγεστερόνη, που κρατά σταθερό το ενδομήτριο σε περίπτωση που εμφυτευτεί κύηση. Αν δεν συμβεί, η προγεστερόνη και τα οιστρογόνα πέφτουν απότομα και αρχίζει η περίοδος. Αυτό το μισό του κύκλου είναι το πιο σταθερό, συνήθως γύρω στις 12 με 14 μέρες. Η προγεστερόνη ανεβάζει ελαφρώς τη θερμοκρασία ηρεμίας — ακριβώς αυτή τη μεταβολή πιάνει ένα θερμόμετρο βασικής θερμοκρασίας — και μπορεί να επιβραδύνει την πέψη, κάτι που εξηγεί μέρος του φουσκώματος. Η πτώση στο τέλος είναι που πυροδοτεί σε πολλούς το προεμμηνορροϊκό σύνδρομο: ευαίσθητο στήθος, αλλαγές στην όρεξη, διακοπτόμενος ύπνος, πονοκέφαλοι και εναλλαγές διάθεσης, που συνήθως υποχωρούν μόλις ξεκινήσει η αιμορραγία. Αν αυτά τα συμπτώματα διαταράσσουν τη δουλειά ή τις σχέσεις τους περισσότερους μήνες, αξίζει να συζητηθούν με επαγγελματία υγείας.';

  @override
  String get phaseExplainerUnknown =>
      'Δεν έχουν καταγραφεί ακόμη αρκετά για να ειπωθεί σε ποια φάση βρίσκεσαι. Η Vera χρειάζεται τουλάχιστον δύο ολόκληρους κύκλους — μια έναρξη περιόδου και μετά την επόμενη — για να υπολογίσει τον δικό σου μέσο όρο και τη διακύμανσή σου, και προτιμά να το πει παρά να επινοήσει μια φάση. Στο μεταξύ τίποτα δεν πάει χαμένο: κάθε μέρα που καταγράφεις ανήκει σε εκείνον τον πρώτο υπολογισμό, και η εκτίμηση στενεύει καθώς μεγαλώνει το ιστορικό. Μέχρι τότε, οι παρακάτω προτάσεις είναι γενικές και ισχύουν σε οποιοδήποτε σημείο του κύκλου.';

  @override
  String get tipFitnessDetailMenstrual =>
      'Η σκληρή προπόνηση δεν ταιριάζει στους περισσότερους τις πρώτες μέρες, και δεν είναι θέμα πειθαρχίας — η ενέργεια είναι πραγματικά χαμηλότερη, και ο σίδηρος που χάνεται με την αιμορραγία κάνει τη δουλειά αντοχής πιο βαριά απ\' ό,τι ένιωθε η ίδια προπόνηση την περασμένη εβδομάδα. Το περπάτημα, οι ήπιες διατάσεις, η αποκαταστατική γιόγκα και οι ασκήσεις αναπνοής βελτιώνουν την κυκλοφορία και μπορούν να απαλύνουν τις κράμπες· σε κάποιους, η τακτική κίνηση σε όλο τον μήνα μειώνει την ένταση των κραμπών περισσότερο από οτιδήποτε κάνουν την ίδια μέρα. Αν νιώθεις καλά, δεν υπάρχει λόγος να αποφύγεις απαιτητικές προπονήσεις: η αιμορραγία δεν είναι λόγος να σταματήσεις τον αθλητισμό, και πολλές αθλήτριες αγωνίζονται μέσα σε αυτήν. Λίγες πρακτικές σημειώσεις: οι μακριές και απαιτητικές προπονήσεις τις μέρες με έντονη ροή μπορούν να βαθύνουν την κούραση, η ζέστη στο κάτω μέρος της κοιλιάς πριν ξεκινήσεις κάνει την κίνηση πιο άνετη, και το να πίνεις λίγο περισσότερο από το συνηθισμένο βοηθά στους πονοκεφάλους αυτών των ημερών. Κρίνε την προπόνηση από το πώς νιώθεις μέσα σε αυτήν, όχι από το πώς ήταν η καλύτερή σου εβδομάδα.';

  @override
  String get tipFitnessDetailFollicular =>
      'Καθώς τα οιστρογόνα ανεβαίνουν, οι περισσότεροι νιώθουν πιο δυνατοί και πιο ανθεκτικοί· αυτό είναι συνήθως το καλύτερο διάστημα του κύκλου για να ξεκινήσεις κάτι νέο, να προσθέσεις βάρος ή να ανεβάσεις ρυθμό. Η αποκατάσταση των μυών είναι εδώ σχετικά αποδοτική, οπότε οι σκληρές προπονήσεις αφομοιώνονται καλύτερα και αφήνουν λιγότερο παρατεταμένο πιάσιμο. Είναι επίσης καλό παράθυρο για ό,τι απαιτεί καθαρό μυαλό και όχι μόνο δυνατό σώμα — να μάθεις μια νέα κίνηση, να διορθώσεις την τεχνική ή να καλύψεις μεγαλύτερη απόσταση από πριν. Δύο επιφυλάξεις αξίζει να κρατηθούν: αύξησε σταδιακά, γιατί η πολλή ενέργεια δεν σημαίνει μηδενικό κίνδυνο τραυματισμού, και οι περισσότεροι τραυματισμοί υπερχρήσης ξεκινούν σε μια καλή εβδομάδα, όχι σε μια κακή. Και προστάτεψε τον ύπνο σου — η προσαρμογή γίνεται στην αποκατάσταση, όχι μέσα στην προπόνηση.';

  @override
  String get tipFitnessDetailFertile =>
      'Η ενέργεια και το κίνητρο είναι συνήθως στο ανώτατο σημείο τους, οπότε οι απαιτητικές προπονήσεις πάνε καλά — τα προσωπικά ρεκόρ πέφτουν συχνά εδώ. Ορισμένες έρευνες δείχνουν ότι οι αρθρώσεις είναι λίγο πιο χαλαρές γύρω από την ωορρηξία· η πρακτική επίδραση συζητείται, αλλά μια μεγαλύτερη προθέρμανση είναι φθηνή προφύλαξη σε αθλήματα με απότομες αλλαγές κατεύθυνσης, άλματα και προσγειώσεις. Η θερμοκρασία του σώματος είναι ακόμη χαμηλή σε σχέση με το δεύτερο μισό του κύκλου, οπότε η ζέστη περιορίζει εδώ λιγότερο απ\' ό,τι θα περιορίζει σε μία με δύο εβδομάδες. Ένα σύντομο τσίμπημα στη μία πλευρά της κάτω κοιλιάς γύρω από την ωορρηξία είναι σύνηθες και συνήθως περνά μέσα σε ώρες. Αν όμως ο πόνος είναι έντονος, μονόπλευρος και επίμονος, συνοδεύεται από πυρετό ή νιώθεις ότι θα λιποθυμήσεις, σταμάτα και εξετάσου αντί να συνεχίσεις.';

  @override
  String get tipFitnessDetailLuteal =>
      'Καθώς πλησιάζει η περίοδος, η ενέργεια μπορεί να πέσει, οι σφυγμοί να είναι υψηλότεροι για την ίδια προσπάθεια και η αποκατάσταση να αργεί περισσότερο. Είναι αναμενόμενη διακύμανση, όχι οπισθοδρόμηση, και δεν σβήνει τη δουλειά των δύο τελευταίων εβδομάδων. Η προγεστερόνη ανεβάζει ελαφρώς τη θερμοκρασία ηρεμίας και δυσκολεύει την αποβολή θερμότητας, γι\' αυτό οι προπονήσεις σε ζέστη ή υγρασία μοιάζουν εδώ δυσανάλογα δύσκολες — βοηθά τόσο το να προπονείσαι νωρίτερα ή αργότερα μέσα στη μέρα όσο και το να πίνεις περισσότερο απ\' όσο φαίνεται απαραίτητο. Οι μέτριες προπονήσεις, μια λίγο ελαφρύτερη εκδοχή της δύναμης και το περπάτημα είναι συνήθως πιο βιώσιμα. Με φούσκωμα και ευαισθησία στο στήθος, ένα καλά υποστηρικτικό αθλητικό σουτιέν και μια μεγαλύτερη προθέρμανση κάνουν πραγματική διαφορά. Αν η διάθεση είναι πεσμένη, κάνε την προπόνηση σύντομη και εύκολη αντί να την παραλείψεις εντελώς — ο πήχης για να μετρήσει είναι χαμηλότερα απ\' ό,τι φαίνεται.';

  @override
  String get tipFitnessDetailUnknown =>
      'Ακόμη κι αν δεν ξέρουμε τη φάση σου, η κίνηση βοηθά οποιαδήποτε στιγμή: η γενική σύσταση είναι περίπου 150 λεπτά μέτριας δραστηριότητας την εβδομάδα, μοιρασμένα στις περισσότερες μέρες, συν ενδυνάμωση δύο φορές την εβδομάδα — και αυτό το μοτίβο αποδίδει σχεδόν σε όλους περισσότερα από περιστασιακές πολύ έντονες προπονήσεις. Η συνέπεια μετράει περισσότερο από την ένταση, και η καλύτερη προπόνηση είναι εκείνη που θα επαναλάβεις πραγματικά την επόμενη εβδομάδα. Προσάρμοσε στο πώς νιώθεις: τις κουρασμένες μέρες μετράει και ένα περπάτημα, και μια σύντομη προπόνηση που έγινε αξίζει περισσότερο από μια μεγάλη που παραλείφθηκε. Μόλις καταγράψεις μερικούς κύκλους, θα εμφανιστούν εδώ προτάσεις ανά φάση.';

  @override
  String get tipNutritionDetailMenstrual =>
      'Η αιμορραγία σου κοστίζει σίδηρο· το κόκκινο κρέας, οι φακές, τα ρεβίθια, τα σκουροπράσινα φυλλώδη λαχανικά και η μελάσα βοηθούν στην αναπλήρωσή του. Ο φυτικός σίδηρος απορροφάται αισθητά καλύτερα μαζί με βιταμίνη C — το να στύψεις λεμόνι πάνω στις φακές είναι η πιο πρακτική εκδοχή, και μια σαλάτα ντομάτας δίπλα κάνει το ίδιο. Το τσάι και ο καφές με το γεύμα μειώνουν την απορρόφηση σιδήρου λόγω των τανινών, οπότε αρκεί να αφήσεις περίπου μία ώρα ανάμεσα· δεν χρειάζεται να κόψεις κανένα από τα δύο. Το να πίνεις αρκετό νερό μπορεί να ανακουφίσει την κούραση και τους πονοκεφάλους που συνοδεύουν την αιμορραγία, και οι τροφές πλούσιες σε μαγνήσιο όπως ξηροί καρποί, σπόροι και σκούρα φυλλώδη λαχανικά βοηθούν κάποιους με τις κράμπες. Τις μέρες που η πέψη πάει αργά, τα μικρά και τακτικά γεύματα κάθονται καλύτερα από τα μεγάλα. Αν γύρω από την περίοδο νιώθεις συχνά λαχάνιασμα, ζαλάδα ή ασυνήθιστη εξάντληση, αξίζει να το αναφέρεις σε επαγγελματία υγείας — ο χαμηλός σίδηρος είναι συχνός, ελέγχεται εύκολα, και δεν είναι κάτι που πρέπει να διαγιγνώσκει μια εφαρμογή.';

  @override
  String get tipNutritionDetailFollicular =>
      'Καθώς επανέρχεται η ενέργεια, το σώμα είναι σε φάση ανοικοδόμησης: αρκετή πρωτεΐνη, δημητριακά ολικής και λαχανικά το στηρίζουν, και σε αυτή τη φάση η όρεξη είναι συνήθως η πιο σταθερή και η πιο εύκολα διαχειρίσιμη. Έχει επίσης νόημα να συνεχίσεις να γεμίζεις τις αποθήκες σιδήρου μετά την αιμορραγία, αντί να το θεωρείς δουλειά μόνο της εβδομάδας της περιόδου — οι αποθήκες χτίζονται σε εβδομάδες, όχι σε μέρες. Το να μην παραλείπεις γεύματα είναι εδώ πιο εύκολο, και σε βάζει πιο ισορροπημένη στις διακυμάνσεις όρεξης της επόμενης φάσης. Αν πρόκειται να αλλάξεις τον τρόπο που τρως, αυτό το διάστημα είναι συνήθως πιο φιλικό για ξεκίνημα από την εβδομάδα πριν την περίοδο, όταν οι λιγούρες και η πεσμένη διάθεση κάνουν κάθε νέα ρουτίνα να φαίνεται πιο δύσκολη απ\' ό,τι είναι.';

  @override
  String get tipNutritionDetailFertile =>
      'Εδώ δεν χρειάζεται καμία ειδική διατροφή· τα ισορροπημένα γεύματα και το αρκετό νερό κάνουν το μεγαλύτερο μέρος της δουλειάς. Κάποιοι νιώθουν φούσκωμα γύρω από την ωορρηξία, κάτι που συνήθως είναι ορμονικό και περαστικό και όχι αποτέλεσμα αυτού που έφαγαν. Η όρεξη πέφτει ελαφρώς σε κάποιους και ανεβαίνει σε άλλους — και τα δύο είναι συνηθισμένα. Το να κρατάς πρωτεΐνη και φυτικές ίνες στα γεύματα σταθεροποιεί την ενέργεια σε αυτό που συχνά είναι το πιο δραστήριο κομμάτι του μήνα. Αν σχεδιάζεις εγκυμοσύνη, είναι λογική στιγμή να ρωτήσεις έναν επαγγελματία υγείας για το φυλλικό οξύ, που γενικά συνιστάται πριν από τη σύλληψη και όχι μετά — αλλά αυτή είναι κουβέντα μαζί του, όχι συμβουλή που πρέπει να δίνει μια εφαρμογή.';

  @override
  String get tipNutritionDetailLuteal =>
      'Η αυξημένη όρεξη και η λιγούρα για γλυκό καθώς ανεβαίνει η προγεστερόνη είναι πολύ συνηθισμένες· πρόκειται για ορμονική μετατόπιση, όχι για θέμα θέλησης, και το σώμα πράγματι ξοδεύει λίγη παραπάνω ενέργεια σε αυτή τη φάση. Η προσθήκη πρωτεΐνης και φυτικών ινών στα γεύματα κρατά το σάκχαρο πιο σταθερό και απαλύνει τη λιγούρα πολύ καλύτερα από το να προσπαθείς να την αγνοήσεις — μια λιγούρα που απαντήθηκε με κάτι χορταστικό συνήθως τελειώνει νωρίτερα από μια που την παλεύεις μία ώρα. Λιγότερο αλάτι και περισσότερο νερό μπορούν να ανακουφίσουν το φούσκωμα· ακούγεται ανάποδο αλλά δεν είναι: καλά ενυδατωμένο, το σώμα κρατά λιγότερα. Οι τροφές πλούσιες σε μαγνήσιο (αμύγδαλα, καρύδια, σκούρα φυλλώδη λαχανικά, μαύρη σοκολάτα) μειώνουν σε κάποιους τις κράμπες και την ένταση. Το να περιορίσεις την καφεΐνη μετά το μεσημέρι βοηθά στον διακοπτόμενο ύπνο αυτής της φάσης, και αξίζει να προσέχεις και το αλκοόλ, γιατί κατακερματίζει τον ύπνο ακριβώς στο σημείο του κύκλου όπου είναι ήδη πιο ελαφρύς.';

  @override
  String get tipNutritionDetailUnknown =>
      'Όποια κι αν είναι η φάση, τα ίδια πράγματα βοηθούν περισσότερο: τακτικά γεύματα, αρκετή πρωτεΐνη, πολλά λαχανικά, αρκετό νερό και τροφές πλούσιες σε σίδηρο. Επειδή η αιμορραγία κοστίζει σίδηρο, αρκεί να δίνεις λίγη παραπάνω προσοχή εκείνες τις μέρες — δεν χρειάζεται διαφορετική διατροφή για κάθε εβδομάδα του μήνα. Το να τρως σε περίπου σταθερές ώρες κάνει περισσότερα για σταθερή ενέργεια από οποιοδήποτε μεμονωμένο τρόφιμο, και τίποτα δεν χρειάζεται να κοπεί για να είναι ένας κύκλος υγιής. Μόλις καταγράψεις μερικούς κύκλους, θα εμφανιστούν εδώ προτάσεις ανά φάση.';

  @override
  String get tipSleepLabel => 'Ύπνος';

  @override
  String get tipSleepMenstrual =>
      'Οι κράμπες και η δυσφορία μπορούν να διακόψουν τον ύπνο· ένα ζεστό ντους ή θερμοφόρα πριν τον ύπνο μπορεί να βοηθήσουν.';

  @override
  String get tipSleepFollicular =>
      'Με την αυξημένη ενέργεια, πολλές αισθάνονται πιο ξύπνιες — η πραγματική ανάγκη ύπνου όμως δεν μειώνεται.';

  @override
  String get tipSleepFertile =>
      'Η μικρή αύξηση θερμοκρασίας κοντά στην ωορρηξία μπορεί να δυσκολέψει λίγο τον ύπνο· ένα δροσερότερο δωμάτιο μπορεί να αντισταθμίσει.';

  @override
  String get tipSleepLuteal =>
      'Η προγεστερόνη αυξάνει ελαφρώς τη θερμοκρασία ηρεμίας και μπορεί να ελαφρύνει τον βαθύ ύπνο· δροσερό, σκοτεινό δωμάτιο και σταθερή ώρα ύπνου βοηθούν περισσότερο εδώ.';

  @override
  String get tipSleepUnknown =>
      'Η ποιότητα ύπνου συχνά αλλάζει μέσα στον κύκλο — συνήθως πιο εύθραυστη λίγο πριν και κατά την περίοδο. Μια σταθερή ώρα ύπνου είναι η πιο αξιόπιστη βάση ανεξαρτήτως φάσης.';

  @override
  String get tipSleepDetailMenstrual =>
      'Κατά την περίοδο ο ύπνος είναι συχνά πιο κατακερματισμένος — κράμπες, δυσφορία και για ορισμένες συχνότερες επισκέψεις στην τουαλέτα μπορούν να ξυπνήσουν τη νύχτα. Ζεστό ντους, θερμοφόρα ή ήπιες διατάσεις πριν τον ύπνο μπορούν να ανακουφίσουν τις κράμπες. Αν παίρνεις παυσίπονο, ο χρονισμός του ώστε να καλύπτει το πρώτο μέρος της νύχτας μπορεί να προστατέψει τον πρώιμο ύπνο. Αν ο ύπνος παραμένει δύσκολος, είναι φυσιολογικό — συνήθως βελτιώνεται με τη φάση.';

  @override
  String get tipSleepDetailFollicular =>
      'Με την αυξημένη οιστρογόνη, πολλές αισθάνονται πιο σε εγρήγορση και ενεργητικές, κάτι που μπορεί να μοιάζει με λιγότερη ανάγκη ύπνου. Δεν είναι απόλυτα ακριβές — απλώς η εγρήγορση έρχεται πιο εύκολα. Η διατήρηση σταθερής ώρας ύπνου εδώ αποδίδει αργότερα, όταν ο ύπνος γίνεται πιο εύθραυστος σε άλλες φάσεις. Αυτό μπορεί επίσης να είναι σχετικά εύκολο παράθυρο για να δοκιμάσεις νέα ρουτίνα ύπνου.';

  @override
  String get tipSleepDetailFertile =>
      'Η μικρή αύξηση θερμοκρασίας κοντά στην ωορρηξία μπορεί να δυσκολέψει λίγο τον ύπνο, καθώς το σώμα θέλει φυσικά να δροσιστεί πριν τον ύπνο. Δροσερότερο δωμάτιο, πιο ελαφριά κουβέρτα ή ζεστό ντους πριν τον ύπνο μπορούν να αντισταθμίσουν. Όσες παρατηρούν μεγαλύτερη επιθυμία ή κοινωνική ενέργεια σε αυτό το παράθυρο μπορεί επίσης να μείνουν ξύπνιες αργότερα από επιλογή — ένα μοτίβο άξιο παρατήρησης, όχι πρόβλημα προς λύση.';

  @override
  String get tipSleepDetailLuteal =>
      'Η προγεστερόνη που αυξάνεται μετά την ωορρηξία ανεβάζει ελαφρώς τη θερμοκρασία ηρεμίας, κάτι που μπορεί να ελαφρύνει τον βαθύ ύπνο — μερικές φορές σαν ήπια εξάψεις, άλλοτε απλώς σαν λιγότερο αναζωογονητικό ύπνο. Καθώς πλησιάζει η περίοδος, μπορεί να προστεθεί προεμμηνορροϊκή ένταση. Δροσερό, σκοτεινό δωμάτιο, λιγότερος χρόνος οθόνης πριν τον ύπνο και σταθερή ώρα ύπνου βοηθούν περισσότερο εδώ. Αν ο ύπνος παραμένει δύσκολος, δεν είναι αποτυχία — είναι αναμενόμενο μέρος της φάσης.';

  @override
  String get tipSleepDetailUnknown =>
      'Δεν υπάρχουν ακόμη αρκετά δεδομένα για να προσδιοριστεί η φάση, αλλά η μεταβαλλόμενη ποιότητα ύπνου στον κύκλο είναι κοινό μοτίβο — συνήθως πιο εύθραυστη λίγο πριν και κατά την περίοδο, πιο σταθερή στο πρώτο μισό. Η πιο αξιόπιστη βάση ανεξαρτήτως φάσης: σταθερές ώρες ύπνου-αφύπνισης, λιγότερος χρόνος οθόνης πριν τον ύπνο και δροσερό, σκοτεινό δωμάτιο. Μετά από μερικούς καταγεγραμμένους κύκλους θα δεις πιο συγκεκριμένα μοτίβα εδώ.';
}
