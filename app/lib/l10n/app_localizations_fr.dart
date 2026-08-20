// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get appTitle => 'Vera';

  @override
  String get actionSkip => 'Passer';

  @override
  String get actionContinue => 'Continuer';

  @override
  String get actionDone => 'Terminé';

  @override
  String get actionCancel => 'Annuler';

  @override
  String get actionDelete => 'Supprimer';

  @override
  String get actionEnable => 'Activer';

  @override
  String get commonIDontKnow => 'Je ne sais pas';

  @override
  String get commonYes => 'Oui';

  @override
  String get commonNo => 'Non';

  @override
  String get commonNotSure => 'Pas sûre';

  @override
  String get pinSetupTitle => 'Configurer un code PIN';

  @override
  String get pinSetupEnterPrompt =>
      'Choisis un code PIN à 6 chiffres pour verrouiller l\'app';

  @override
  String get pinSetupConfirmPrompt => 'Saisis-le à nouveau pour confirmer';

  @override
  String get pinSetupMismatch => 'Ça ne correspond pas — réessayons';

  @override
  String get pinSetupBiometricTitle => 'Déverrouillage plus rapide ?';

  @override
  String get pinSetupBiometricBody =>
      'Tu peux aussi utiliser ton empreinte ou ton visage pour déverrouiller — ton code PIN reste utilisable en secours.';

  @override
  String get lockScreenTitle => 'Verrouillé';

  @override
  String get lockScreenEnterPin => 'Saisis ton code PIN';

  @override
  String get lockScreenWrongPin => 'Ce code PIN ne correspond pas';

  @override
  String get lockScreenUseBiometrics => 'Utiliser la biométrie';

  @override
  String get lockScreenForgotPin => 'Code PIN oublié ?';

  @override
  String lockScreenThrottled(int seconds) {
    return 'Trop de tentatives. Réessaie dans ${seconds}s';
  }

  @override
  String get lockScreenEraseTitle => 'Effacer toutes les données ?';

  @override
  String get lockScreenEraseBody =>
      'Cette action supprime définitivement tout sur cet appareil. Il n\'y a ni compte ni sauvegarde sur un serveur, donc c\'est irréversible.';

  @override
  String get lockScreenEraseConfirm => 'Tout effacer';

  @override
  String get onboardingPrivacyTitle => 'Bienvenue';

  @override
  String get onboardingPrivacyBody =>
      'Les données de ton cycle restent uniquement sur cet appareil, chiffrées. Pas de compte, pas de synchronisation cloud — rien de ce que tu notes n\'est envoyé. La clé est conservée dans le matériel sécurisé de ton téléphone, et tu peux tout exporter ou tout effacer quand tu veux.';

  @override
  String get onboardingLastPeriodTitle =>
      'Quand tes dernières règles ont-elles commencé ?';

  @override
  String get onboardingLastPeriodBody =>
      'Cela nous aide à démarrer — tu pourras toujours corriger via le calendrier plus tard.';

  @override
  String get onboardingPickDate => 'Choisir une date';

  @override
  String get onboardingCycleLengthTitle =>
      'Quelle est la durée habituelle de ton cycle ?';

  @override
  String get onboardingCycleLengthBody =>
      'Un chiffre approximatif suffit. Nous te donnerons une vraie estimation dès que nous aurons vu quelques cycles complets.';

  @override
  String get onboardingPeriodLengthTitle =>
      'Combien de jours durent généralement tes règles ?';

  @override
  String get onboardingPeriodLengthBody =>
      'Cela nous servira à compléter tes dernières règles, pour ne pas repartir de zéro.';

  @override
  String get onboardingDaysUnit => 'jours';

  @override
  String get onboardingGoalTitle => 'Qu\'est-ce qui t\'amène ici ?';

  @override
  String get onboardingGoalBody =>
      'Cela nous aide simplement à te montrer les bonnes choses en premier — tu peux changer d\'avis à tout moment dans les Réglages.';

  @override
  String get goalTrackPeriod => 'Suivre mes règles';

  @override
  String get goalTryingToConceive => 'J\'essaie de concevoir';

  @override
  String get goalPregnancyTracking => 'Suivi de grossesse';

  @override
  String get onboardingRegularityTitle =>
      'Tes règles sont-elles généralement régulières ?';

  @override
  String get onboardingRegularityBody =>
      'Il n\'y a pas de mauvaise réponse ici — cela nous aide juste à mieux connaître ton corps.';

  @override
  String get onboardingCrampsTitle => 'As-tu généralement des crampes ?';

  @override
  String get onboardingCrampsBody =>
      'Nous nous assurerons qu\'il soit facile de noter comment tu te sens ces jours-là.';

  @override
  String get onboardingNotificationTitle =>
      'Souhaites-tu des rappels en douceur ?';

  @override
  String get onboardingNotificationBody =>
      'Nous pouvons te prévenir avant l\'arrivée prévue de tes règles.';

  @override
  String get onboardingNotificationMockTitle =>
      'Tes règles pourraient bientôt commencer';

  @override
  String get onboardingNotificationMockBody =>
      'D\'après tes cycles enregistrés';

  @override
  String get onboardingNotificationAllow => 'Activer les rappels';

  @override
  String get onboardingNotificationNotNow => 'Pas maintenant';

  @override
  String get onboardingBuildingPlanTitle => 'Préparation en cours';

  @override
  String get onboardingBuildingPlanStep1 =>
      'Sécurisation de tes données sur cet appareil';

  @override
  String get onboardingBuildingPlanStep2 => 'Enregistrement de tes préférences';

  @override
  String get onboardingBuildingPlanStep3 => 'Préparation de ton calendrier';

  @override
  String get onboardingBuildingPlanDone => 'Tout est prêt';

  @override
  String get navHome => 'Accueil';

  @override
  String get navCalendar => 'Calendrier';

  @override
  String get navInsights => 'Statistiques';

  @override
  String get navSettings => 'Réglages';

  @override
  String get navTrack => 'Suivre';

  @override
  String homeCycleDayLabel(int day) {
    return 'Jour $day';
  }

  @override
  String get homeNoCycleYet => 'Aucune règle enregistrée pour l\'instant';

  @override
  String get homePhaseMenstrual => 'Règles';

  @override
  String get homePhaseFollicular => 'Phase folliculaire';

  @override
  String get homePhaseFertileWindow => 'Fenêtre de fertilité estimée';

  @override
  String get homePhaseLuteal => 'Phase lutéale';

  @override
  String get homePhaseUnknown => 'Pas assez de données récentes';

  @override
  String get homePredictionInsufficientTitle => 'Pas encore assez de données';

  @override
  String get homePredictionInsufficientBody =>
      'Enregistre tes prochaines règles et nous commencerons à estimer.';

  @override
  String homePredictionRangeLabel(String start, String end) {
    return '$start – $end';
  }

  @override
  String get homeConfidenceHigh => 'Confiance élevée';

  @override
  String get homeConfidenceMedium => 'Confiance moyenne';

  @override
  String get homeConfidenceLow => 'Confiance faible';

  @override
  String get homeIrregularNote =>
      'La durée de ton cycle a varié plus que d\'habitude récemment. Si c\'est nouveau pour toi, cela vaut peut-être la peine d\'en parler lors d\'une consultation.';

  @override
  String get homeFertileWindowDisclaimer =>
      'Basé sur le rythme habituel du cycle — ce n\'est pas une méthode contraceptive.';

  @override
  String get homePeriodStartedButton => 'Règles commencées aujourd\'hui';

  @override
  String get homePeriodStartedSnackbar =>
      'Enregistré — règles commencées aujourd\'hui';

  @override
  String get actionUndo => 'Annuler l\'action';

  @override
  String get comingSoon => 'Bientôt disponible';

  @override
  String get dayLogFlowLabel => 'Flux';

  @override
  String get flowSpotting => 'Spotting';

  @override
  String get flowLight => 'Léger';

  @override
  String get flowMedium => 'Moyen';

  @override
  String get flowHeavy => 'Abondant';

  @override
  String get flowNone => 'Aucun';

  @override
  String get dayLogSymptomsLabel => 'Symptômes';

  @override
  String get symptomCramps => 'Crampes';

  @override
  String get symptomHeadache => 'Mal de tête';

  @override
  String get symptomBloating => 'Ballonnements';

  @override
  String get symptomBreastTenderness => 'Sensibilité des seins';

  @override
  String get symptomAcne => 'Acné';

  @override
  String get symptomFatigue => 'Fatigue';

  @override
  String get symptomNausea => 'Nausées';

  @override
  String get symptomBackPain => 'Mal de dos';

  @override
  String get symptomAppetiteChange => 'Changement d\'appétit';

  @override
  String get symptomSleepTrouble => 'Troubles du sommeil';

  @override
  String get symptomPelvicPain => 'Douleur pelvienne';

  @override
  String get symptomDizziness => 'Vertiges';

  @override
  String get dayLogMoodLabel => 'Humeur';

  @override
  String get moodCalm => 'Calme';

  @override
  String get moodAnxious => 'Anxieuse';

  @override
  String get moodIrritable => 'Irritable';

  @override
  String get moodLow => 'Morose';

  @override
  String get moodEnergetic => 'Énergique';

  @override
  String get moodHappy => 'Heureuse';

  @override
  String get moodContent => 'Satisfaite';

  @override
  String get moodSad => 'Triste';

  @override
  String get moodDepressed => 'Déprimée';

  @override
  String get moodEmotional => 'Émotive';

  @override
  String get dayLogNoteLabel => 'Note';

  @override
  String get dayLogNoteHint => 'Tout ce dont tu veux te souvenir aujourd\'hui';

  @override
  String get dayLogOptionalTrackersLabel => 'Suivis optionnels';

  @override
  String get dayLogSexualActivityLabel => 'Activité sexuelle';

  @override
  String get sexLifeNone => 'Rien';

  @override
  String get sexLifeUnprotected => 'Rapport non protégé';

  @override
  String get sexLifeProtected => 'Rapport protégé';

  @override
  String get sexLifeMasturbation => 'Masturbation';

  @override
  String get sexLifeNoOrgasm => 'Pas d\'orgasme';

  @override
  String get sexLifeOrgasm => 'Orgasme';

  @override
  String get sexLifeHighDesire => 'Beaucoup de désir';

  @override
  String get dayLogBbtLabel => 'Température basale';

  @override
  String get dayLogMucusLabel => 'Glaire cervicale';

  @override
  String get mucusDry => 'Sèche';

  @override
  String get mucusSticky => 'Collante';

  @override
  String get mucusCreamy => 'Crémeuse';

  @override
  String get mucusWatery => 'Aqueuse';

  @override
  String get mucusEggWhite => 'Blanc d\'œuf';

  @override
  String get dayLogSavedIndicator => 'Enregistré';

  @override
  String get homeOpenTodayLog => 'Ajouter des détails pour aujourd\'hui';

  @override
  String get calendarLegendActual => 'Règles enregistrées';

  @override
  String get calendarLegendPredicted => 'Fenêtre prévue';

  @override
  String get calendarLegendFertile => 'Fenêtre de fertilité estimée';

  @override
  String get calendarLegendOvulation => 'Ovulation estimée';

  @override
  String get dayDetailFertileTitle =>
      'Tu es dans ta fenêtre de fertilité estimée';

  @override
  String get dayDetailOvulationTitle => 'Jour d\'ovulation estimé';

  @override
  String get dayDetailOvulationBody =>
      'Une grossesse est généralement plus probable autour de ce jour, selon le timing habituel — c\'est une estimation, pas une garantie.';

  @override
  String get insightsCyclesLoggedLabel => 'Cycles enregistrés';

  @override
  String get insightsAveragePeriodLengthLabel => 'Durée moyenne des règles';

  @override
  String get insightsAverageCycleLengthLabel => 'Durée moyenne du cycle';

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
      other: 'Varie d\'environ $daysString jours',
      one: 'Varie d\'environ $daysString jour',
    );
    return '$_temp0';
  }

  @override
  String get insightsNotEnoughDataTitle => 'Pas encore assez de données';

  @override
  String get insightsNotEnoughDataBody =>
      'Enregistre quelques cycles complets et tes moyennes apparaîtront ici.';

  @override
  String get insightsSymptomFrequencyTitle => 'Symptômes par jour du cycle';

  @override
  String get insightsNoSymptomsLogged =>
      'Aucun symptôme enregistré pour l\'instant';

  @override
  String get settingsLanguageLabel => 'Langue';

  @override
  String get settingsLanguageSystem => 'Langue du système';

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
  String get settingsWeekStartLabel => 'La semaine commence le';

  @override
  String get settingsWeekStartMonday => 'Lundi';

  @override
  String get settingsWeekStartSunday => 'Dimanche';

  @override
  String get settingsTemperatureUnitLabel => 'Unité de température';

  @override
  String get settingsTemperatureCelsius => 'Celsius';

  @override
  String get settingsTemperatureFahrenheit => 'Fahrenheit';

  @override
  String get settingsRemindersLabel => 'Me prévenir avant mes règles';

  @override
  String get remindersScreenTitle => 'Rappels';

  @override
  String get remindersGroupCycle => 'Règles et fertilité';

  @override
  String get remindersGroupMedication => 'Médicaments';

  @override
  String get remindersGroupLifestyle => 'Mode de vie';

  @override
  String get remindersGroupAppointment => 'Rendez-vous';

  @override
  String get settingsRemindersPeriodEndLabel =>
      'Me prévenir quand mes règles devraient se terminer';

  @override
  String get settingsRemindersMedicationLabel => 'Rappel de médicament';

  @override
  String get settingsRemindersWaterLabel => 'Rappel d\'eau';

  @override
  String get settingsRemindersAppointmentLabel => 'Rappel de rendez-vous';

  @override
  String get settingsRemindersAppointmentSet => 'Définir date et heure';

  @override
  String get settingsRemindersAppointmentClear => 'Effacer';

  @override
  String get settingsOptionalTrackersHeading => 'Suivis optionnels';

  @override
  String get settingsOptionalTrackersBody =>
      'Désactivé par défaut. Activer un suivi l\'ajoute à l\'écran de journal quotidien.';

  @override
  String get settingsSexualActivityToggle => 'Activité sexuelle';

  @override
  String get settingsBbtToggle => 'Température basale';

  @override
  String get settingsMucusToggle => 'Glaire cervicale';

  @override
  String get settingsBreastExamToggle => 'Auto-examen des seins';

  @override
  String get settingsCervixToggle => 'Position et fermeté du col';

  @override
  String get settingsPrivacyEntry => 'Confidentialité';

  @override
  String get settingsDeleteAllData => 'Supprimer toutes les données';

  @override
  String get privacyScreenTitle => 'Confidentialité';

  @override
  String get privacyScreenIntro =>
      'Voici exactement ce qui arrive à tes données, en langage clair.';

  @override
  String get privacyScreenStorageTitle => 'Chiffré sur cet appareil';

  @override
  String get privacyScreenNoNetworkTitle => 'Ni serveur ni compte';

  @override
  String get privacyScreenNoThirdPartyTitle => 'Aucun pistage';

  @override
  String get privacyScreenExportTitle => 'L\'export ne part que de vous';

  @override
  String get privacyScreenDeleteTitle => 'La suppression est définitive';

  @override
  String get privacyScreenStorage =>
      'Tout ce que tu enregistres est chiffré et stocké uniquement sur cet appareil, dans un seul fichier. La clé de chiffrement se trouve dans le matériel sécurisé de ton téléphone — Trousseau (Keychain) sur iOS, Keystore sur Android — pas dans le fichier lui-même.';

  @override
  String get privacyScreenNoNetwork =>
      'Cette app n\'a ni serveur ni système de comptes — tes données ne sont jamais envoyées. La version gratuite inclut des publicités Google qui se connectent à internet ; elles ne reçoivent jamais ce que tu notes.';

  @override
  String get privacyScreenNoThirdParty =>
      'Il n\'y a ni analyse, ni rapport de plantage, ni SDK de suivi. Le seul composant tiers est le SDK publicitaire de Google dans la version gratuite — Premium le supprime entièrement.';

  @override
  String get privacyScreenExport =>
      'La seule façon dont tes données quittent cet appareil, c\'est si tu les exportes toi-même, et cet export est chiffré avec un mot de passe que toi seule connais.';

  @override
  String get privacyScreenDelete =>
      'Supprimer tes données est réel et immédiat. Il n\'y a ni compte ni sauvegarde de notre côté — une fois supprimées, elles le sont pour de bon.';

  @override
  String get adPlaceholderLabel => 'Espace publicitaire';

  @override
  String get adPlaceholderUpgradeCta =>
      'Passe à Premium pour une expérience sans publicité';

  @override
  String get reminderNotificationTitle =>
      'Tes règles pourraient bientôt commencer';

  @override
  String get reminderNotificationBody =>
      'D\'après tes cycles enregistrés, ta fenêtre estimée approche.';

  @override
  String get reminderPeriodEndTitle =>
      'Tes règles pourraient bientôt se terminer';

  @override
  String get reminderPeriodEndBody =>
      'Si elles continuent, c\'est tout à fait normal — juste un petit rappel.';

  @override
  String get reminderMedicationTitle => 'Rappel de médicament';

  @override
  String get reminderMedicationBody =>
      'C\'est l\'heure de prendre ton médicament.';

  @override
  String get reminderWaterTitle => 'Reste hydratée';

  @override
  String get reminderWaterBody => 'Un petit rappel pour boire de l\'eau.';

  @override
  String get reminderAppointmentTitle => 'Rendez-vous à venir';

  @override
  String get reminderAppointmentBody => 'Tu as un rendez-vous à venir.';

  @override
  String get settingsExportEntry => 'Exporter et sauvegarder';

  @override
  String get exportBackupHeading => 'Sauvegarde chiffrée';

  @override
  String get exportBackupBody =>
      'Enregistre une copie chiffrée de ton historique pour la transférer sur un nouvel appareil. Tu auras besoin du mot de passe pour la restaurer — il n\'y a aucun autre moyen de le récupérer.';

  @override
  String get exportCreateBackupButton => 'Créer une sauvegarde';

  @override
  String get exportRestoreBackupButton => 'Restaurer depuis une sauvegarde';

  @override
  String get exportPasswordLabel => 'Mot de passe';

  @override
  String get exportPasswordConfirmLabel => 'Confirmer le mot de passe';

  @override
  String get exportPasswordMismatch => 'Les mots de passe ne correspondent pas';

  @override
  String get exportPasswordTooShort => 'Utilise au moins 8 caractères';

  @override
  String get exportRestoreConfirmTitle =>
      'Remplacer toutes les données de cet appareil ?';

  @override
  String get exportRestoreConfirmBody =>
      'Restaurer une sauvegarde remplace tout ce qui est actuellement enregistré sur cet appareil. Cette action est irréversible.';

  @override
  String get exportRestoreConfirmAction => 'Restaurer';

  @override
  String get exportWrongPassword =>
      'Ce mot de passe ne correspond pas à cette sauvegarde';

  @override
  String get exportInvalidFile =>
      'Ce fichier ne ressemble pas à une sauvegarde Vera';

  @override
  String get exportBackupCreated => 'Sauvegarde prête à partager';

  @override
  String get exportRestoreSuccess => 'Sauvegarde restaurée';

  @override
  String get exportDoctorReportHeading => 'Rapport médical';

  @override
  String get exportDoctorReportBody =>
      'Un résumé que tu peux partager avec un professionnel de santé.';

  @override
  String get exportIncludeNotesToggle => 'Inclure les notes personnelles';

  @override
  String get exportShareCsvButton => 'Partager en CSV';

  @override
  String get exportPrintPdfButton => 'Imprimer / Enregistrer en PDF';

  @override
  String get doctorReportDisclaimer =>
      'Généré par Vera à partir de données saisies par l\'utilisatrice. Ce n\'est pas un diagnostic médical.';

  @override
  String get doctorReportGeneratedOn => 'Généré le';

  @override
  String get doctorReportSummaryHeading => 'Résumé';

  @override
  String get doctorReportDailyLogHeading => 'Journal quotidien';

  @override
  String get doctorReportColumnDate => 'Date';

  @override
  String get doctorReportTimelineHeading => 'Chronologie des cycles';

  @override
  String get doctorReportCycleLabel => 'Cycle';

  @override
  String get doctorReportTimelineLegendPeriod => 'Règles';

  @override
  String get doctorReportTimelineLegendCycle => 'Reste du cycle';

  @override
  String get doctorReportTimelineOngoing => 'En cours';

  @override
  String get dailyInsightLabel => 'Le savais-tu ?';

  @override
  String get insightMenstrual1 =>
      'Ta muqueuse utérine se détache en ce moment — la plupart des règles durent de 3 à 7 jours, et c\'est tout à fait normal.';

  @override
  String get insightMenstrual2 =>
      'Les aliments riches en fer, comme les légumes verts à feuilles et les lentilles, peuvent aider à compenser ce que ton corps perd cette semaine.';

  @override
  String get insightFollicular1 =>
      'Les œstrogènes augmentent, et beaucoup de personnes remarquent plus d\'énergie et une meilleure concentration à partir de maintenant.';

  @override
  String get insightFollicular2 =>
      'Ton corps prépare un ovule à être libéré — cette phase peut durer d\'une semaine à plusieurs semaines.';

  @override
  String get insightFertile1 =>
      'Voici ta fenêtre de fertilité estimée — les jours autour de l\'ovulation où une grossesse est la plus probable, selon le rythme habituel.';

  @override
  String get insightFertile2 =>
      'Certaines personnes remarquent une légère hausse de la température basale ou des changements de la glaire cervicale autour de l\'ovulation.';

  @override
  String get insightLuteal1 =>
      'La progestérone augmente après l\'ovulation — c\'est souvent à ce moment qu\'apparaissent des symptômes du SPM comme les sautes d\'humeur ou les ballonnements.';

  @override
  String get insightLuteal2 =>
      'Si une grossesse ne s\'est pas implantée, les niveaux d\'hormones chutent vers la fin de cette phase, déclenchant tes prochaines règles.';

  @override
  String get insightUnknown1 =>
      'La durée du cycle varie beaucoup d\'une personne à l\'autre — entre 21 et 35 jours est considéré comme habituel.';

  @override
  String get insightsPhaseTipsTitle => 'Peut faire du bien dans cette phase';

  @override
  String get tipFitnessLabel => 'Mouvement';

  @override
  String get tipNutritionLabel => 'Nutrition';

  @override
  String get tipFitnessMenstrual =>
      'Un mouvement doux — marche, étirements ou yoga restauratif — peut faire plus de bien qu\'un entraînement intense en ce moment.';

  @override
  String get tipFitnessFollicular =>
      'L\'énergie augmente souvent dans cette phase — un bon moment pour essayer un nouvel entraînement ou pousser un peu plus.';

  @override
  String get tipFitnessFertile =>
      'Beaucoup de personnes se sentent au maximum de leur énergie ici — une phase propice à un entraînement plus intense si ça te tente.';

  @override
  String get tipFitnessLuteal =>
      'Si l\'énergie baisse vers la fin de cette phase, un travail de force à faible intensité ou la natation peut sembler plus durable.';

  @override
  String get tipFitnessUnknown =>
      'Le mouvement qui te fait du bien aujourd\'hui est un bon choix — il n\'existe pas de routine \"parfaite\" unique pour chaque jour.';

  @override
  String get tipNutritionMenstrual =>
      'Les aliments riches en fer comme les légumes verts, les lentilles et la viande rouge peuvent aider à compenser ce que ton corps perd cette semaine.';

  @override
  String get tipNutritionFollicular =>
      'Des repas plus légers et frais sont souvent bien tolérés quand l\'énergie augmente — mais il n\'y a pas de façon \"parfaite\" unique de manger dans cette phase.';

  @override
  String get tipNutritionFertile =>
      'Rester hydratée et garder des repas équilibrés soutient ton énergie durant cette phase qui se sent plus active.';

  @override
  String get tipNutritionLuteal =>
      'Les envies peuvent changer ici — les glucides complexes et les aliments riches en magnésium comme les noix et le chocolat noir sont des choix courants.';

  @override
  String get tipNutritionUnknown =>
      'Des repas équilibrés et réguliers sont un bon choix par défaut tant que ta phase n\'est pas encore claire.';

  @override
  String get predictionSettingsEntry => 'Réglages de prédiction';

  @override
  String get predictionSettingsIntro =>
      'Ce sont des hypothèses, affichées ouvertement. Une fois 2 cycles complets enregistrés, ta vraie prédiction sur Accueil est calculée à partir de tes propres données — ces chiffres ne sont alors plus utilisés pour ça.';

  @override
  String get predictionSettingsPeriodLengthLabel =>
      'Durée habituelle des règles';

  @override
  String get predictionSettingsCycleLengthLabel => 'Durée habituelle du cycle';

  @override
  String get predictionSettingsCycleLengthHint =>
      'Utilisé pour dimensionner l\'anneau sur Accueil en attendant de vraies données.';

  @override
  String get predictionSettingsLutealLabel => 'Durée de la phase lutéale';

  @override
  String get predictionSettingsLutealHint =>
      'Le nombre de jours habituel entre l\'ovulation et tes prochaines règles. Utilisé pour placer la fenêtre de fertilité estimée — cette valeur continue d\'être utilisée même après le début des vraies prédictions.';

  @override
  String get dayLogEnergyLabel => 'Énergie';

  @override
  String get energyLevelLow => 'Faible';

  @override
  String get energyLevelMedium => 'Moyenne';

  @override
  String get energyLevelHigh => 'Élevée';

  @override
  String get energyLevelEnergetic => 'Pleine d\'énergie';

  @override
  String get dayLogSkinHairLabel => 'Peau et cheveux';

  @override
  String get skinHealthyGlow => 'Éclat sain';

  @override
  String get skinRedness => 'Rougeurs';

  @override
  String get skinDryness => 'Sécheresse';

  @override
  String get skinOiliness => 'Excès de sébum';

  @override
  String get hairGoodDay => 'Bon jour capillaire';

  @override
  String get hairBadDay => 'Mauvais jour capillaire';

  @override
  String get hairLoss => 'Chute de cheveux';

  @override
  String get scalpOily => 'Cuir chevelu gras';

  @override
  String get dayLogBreastExamLabel => 'Auto-examen des seins';

  @override
  String get breastExamAllNormal => 'Rien d\'inhabituel';

  @override
  String get breastExamLump => 'Grosseur';

  @override
  String get breastExamIndentation => 'Rétraction';

  @override
  String get breastExamRedness => 'Rougeur';

  @override
  String get breastExamCrackedNipple => 'Mamelon crevassé';

  @override
  String get breastExamDischarge => 'Écoulement';

  @override
  String get cervixPositionLabel => 'Position du col';

  @override
  String get cervixPositionLow => 'Bas';

  @override
  String get cervixPositionMedium => 'Moyen';

  @override
  String get cervixPositionHigh => 'Haut';

  @override
  String get cervixOpeningLabel => 'Ouverture du col';

  @override
  String get cervixOpeningClosed => 'Fermé';

  @override
  String get cervixOpeningMedium => 'Moyen';

  @override
  String get cervixOpeningOpen => 'Ouvert';

  @override
  String get cervixFirmnessLabel => 'Fermeté du col';

  @override
  String get cervixFirmnessSoft => 'Souple';

  @override
  String get cervixFirmnessMedium => 'Moyenne';

  @override
  String get cervixFirmnessFirm => 'Ferme';

  @override
  String get dayLogWaterLabel => 'Eau';

  @override
  String get dayLogSleepLabel => 'Sommeil';

  @override
  String get dayLogWeightLabel => 'Poids';

  @override
  String get dayLogMedicationsLabel => 'Médicament';

  @override
  String get dayLogAddMedication => 'Ajouter un médicament';

  @override
  String get dayLogMedicationNameHint => 'Nom du médicament';

  @override
  String get navAssistant => 'Assistant';

  @override
  String get assistantTitle => 'Assistant Vera';

  @override
  String get assistantEndChatTitle => 'Terminer cette conversation ?';

  @override
  String get assistantEndChatBody =>
      'Les messages ne sont qu\'en mémoire et ne sont enregistrés nulle part : ils ne pourront pas être récupérés.';

  @override
  String get assistantEndChatConfirm => 'Terminer';

  @override
  String get assistantInputHint => 'Pose une question sur ton cycle…';

  @override
  String get assistantIntro =>
      'Salut ! Je peux répondre à tes questions sur les règles, le cycle et le fonctionnement de Vera — ici, sur ton téléphone, rien ne quitte ton appareil. Je ne suis pas médecin et ceci n\'est pas un avis médical.';

  @override
  String get insightMenstrual3 =>
      'Le sang des règles n\'est pas du \"sang impur\" — c\'est un mélange de sang et de muqueuse utérine, une partie tout à fait normale du cycle.';

  @override
  String get insightMenstrual4 =>
      'Une chaleur douce sur le bas-ventre soulage vraiment les crampes — la bouillotte est un classique validé par la science.';

  @override
  String get insightMenstrual5 =>
      'Le flux est souvent plus abondant les deux premiers jours puis diminue — ce schéma est typique.';

  @override
  String get insightMenstrual6 =>
      'Se sentir un peu plus fatiguée pendant ses règles est courant — le fer quitte le corps avec le sang menstruel.';

  @override
  String get insightFollicular3 =>
      'L\'œstrogène reconstruit la muqueuse utérine après les règles — ton corps prépare du neuf.';

  @override
  String get insightFollicular4 =>
      'La peau paraît souvent plus nette dans cette phase, à mesure que les hormones se stabilisent.';

  @override
  String get insightFollicular5 =>
      'L\'endurance et les réflexes atteignent souvent leur pic en fin de phase folliculaire.';

  @override
  String get insightFollicular6 =>
      'C\'est la durée de cette phase qui varie le plus d\'une personne à l\'autre — la phase lutéale est bien plus constante.';

  @override
  String get insightFertile3 =>
      'L\'ovule vit environ 12 à 24 heures, mais les spermatozoïdes peuvent attendre jusqu\'à 5 jours — c\'est pourquoi la fenêtre fertile s\'étend sur plusieurs jours.';

  @override
  String get insightFertile4 =>
      'Autour de l\'ovulation, la glaire cervicale devient souvent claire et filante — comme du blanc d\'œuf cru.';

  @override
  String get insightFertile5 =>
      'Certaines personnes ressentent un bref pincement d\'un côté à l\'ovulation — ça porte même un nom : mittelschmerz.';

  @override
  String get insightFertile6 =>
      'La température basale monte légèrement *après* l\'ovulation — elle la confirme plutôt qu\'elle ne la prédit.';

  @override
  String get insightLuteal3 =>
      'La progestérone atteint son pic environ une semaine après l\'ovulation — ballonnements et seins sensibles sont alors courants.';

  @override
  String get insightLuteal4 =>
      'L\'envie de glucides avant les règles est réelle — les besoins énergétiques augmentent légèrement en phase lutéale.';

  @override
  String get insightLuteal5 =>
      'Les symptômes du SPM s\'atténuent généralement un à deux jours après le début des saignements.';

  @override
  String get insightLuteal6 =>
      'Une routine de sommeil régulière peut nettement adoucir les baisses d\'humeur de fin de phase lutéale.';

  @override
  String get insightUnknown2 =>
      'Suivre seulement trois cycles suffit souvent pour voir ton propre schéma émerger.';

  @override
  String get insightUnknown3 =>
      'Les cycles sont personnels — comparer le tien à celui d\'une amie n\'apprend généralement rien d\'utile.';

  @override
  String get insightUnknown4 =>
      'Le stress, les voyages et la maladie peuvent décaler l\'ovulation — des règles \"en retard\" signifient souvent juste une ovulation tardive.';

  @override
  String get settingsThemeLabel => 'Thème';

  @override
  String get settingsThemeSystem => 'Système';

  @override
  String get settingsThemeLight => 'Clair';

  @override
  String get settingsThemeDark => 'Sombre';

  @override
  String get settingsMascotLabel => 'Mascotte compagnon';

  @override
  String get mascotDroplet => 'Gouttelette';

  @override
  String get mascotFlower => 'Fleur';

  @override
  String get mascotMoon => 'Lune';

  @override
  String get mascotNone => 'Aucune';

  @override
  String homeWindowCountdown(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: 'La fenêtre prévue commence dans environ $days jours',
      one: 'La fenêtre prévue commence dans environ $days jour',
    );
    return '$_temp0';
  }

  @override
  String homeOvulationCountdown(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: 'Ovulation estimée dans environ $days jours',
      one: 'Ovulation estimée dans environ $days jour',
    );
    return '$_temp0';
  }

  @override
  String get homeQuickLogTitle => 'Comment ton corps se sent-il aujourd\'hui ?';

  @override
  String get actionSave => 'Enregistrer';

  @override
  String get insightsTrackerHubTitle => 'Tes suivis';

  @override
  String get trackerHistoryEmpty =>
      'Aucune entrée sur cette période pour l\'instant';

  @override
  String get trackerStatAverage => 'Moyenne';

  @override
  String get trackerStatLowest => 'Minimum';

  @override
  String get trackerStatHighest => 'Maximum';

  @override
  String get trackerStatLatest => 'Dernier';

  @override
  String get rangeFilter1m => '1 mois';

  @override
  String get rangeFilter3m => '3 mois';

  @override
  String get rangeFilter6m => '6 mois';

  @override
  String get dayLogOvulationTestLabel => 'Test d\'ovulation';

  @override
  String get ovulationTestNegative => 'Négatif';

  @override
  String get ovulationTestPositive => 'Positif';

  @override
  String get ovulationTestLow => 'Faible';

  @override
  String get ovulationTestHigh => 'Élevé';

  @override
  String get ovulationTestPeak => 'Pic';

  @override
  String get pregnancyTestLabel => 'Test de grossesse';

  @override
  String get pregnancyTestPositive => 'Positif';

  @override
  String get pregnancyTestFaint => 'Ligne pâle';

  @override
  String get pregnancyTestNegative => 'Négatif';

  @override
  String get settingsOvulationTestToggle => 'Test d\'ovulation';

  @override
  String get settingsRemindersOvulationLabel => 'Alerte fenêtre fertile';

  @override
  String get reminderOvulationTitle => 'La fenêtre fertile estimée approche';

  @override
  String get reminderOvulationBody =>
      'D\'après tes cycles enregistrés, ta fenêtre fertile estimée pourrait bientôt commencer.';

  @override
  String trackerEntriesCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count entrées',
      one: '$count entrée',
    );
    return '$_temp0';
  }

  @override
  String get assistantTyping => 'Vera écrit…';

  @override
  String get premiumTitle => 'Vera Premium';

  @override
  String get premiumHeadline => 'Vera Premium';

  @override
  String get premiumSubhead =>
      'Toutes les fonctions de suivi restent gratuites pour toujours — ton historique n\'est jamais verrouillé. Premium ajoute tes propres suivis, des analyses plus poussées, tes propres rappels et des habillages en plus, et retire les publicités.';

  @override
  String get premiumBenefitNoAds => 'Aucune publicité, nulle part dans l\'app';

  @override
  String get premiumBenefitSupport =>
      'Soutient une app indépendante axée sur la vie privée';

  @override
  String get premiumMonthly => 'Mensuel';

  @override
  String get premiumYearly => 'Annuel';

  @override
  String get premiumYearlyNote => 'Facturé une fois par an';

  @override
  String premiumPerMonth(String price) {
    return '$price / mois';
  }

  @override
  String get premiumBilledMonthly => 'Facturé chaque mois';

  @override
  String get premiumStaysFreeTitle => 'Ce qui reste gratuit';

  @override
  String get premiumStaysFreeBody =>
      'Le calendrier, tout votre historique, les statistiques de base et l\'export restent gratuits. Premium ajoute des choses, il n\'en retire jamais.';

  @override
  String get premiumSubscribeCta => 'Continuer';

  @override
  String get premiumRestore => 'Restaurer l\'achat';

  @override
  String get premiumCancelNote =>
      'Annule quand tu veux depuis ton compte de store. Pas de compte à rebours, pas de pression — si ce n\'est pas le moment, la version gratuite continue exactement pareil.';

  @override
  String get premiumActiveBadge => 'Premium est actif';

  @override
  String get premiumDevToggle => 'Simuler Premium (développement)';

  @override
  String get settingsPremiumEntry => 'Vera Premium';

  @override
  String get adTestNotice => 'Publicité de test — pas encore réelle';

  @override
  String get settingsPregnancyModeLabel => 'Mode grossesse';

  @override
  String get pregnancyLmpLabel => 'Premier jour des dernières règles';

  @override
  String pregnancyWeekLabel(int weeks, int days) {
    return 'Semaine $weeks, jour $days';
  }

  @override
  String get pregnancyDueDateLabel => 'Date d\'accouchement estimée';

  @override
  String pregnancyDaysLeft(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: 'Encore environ $days jours',
      one: 'Encore environ $days jour',
    );
    return '$_temp0';
  }

  @override
  String pregnancyTrimesterLabel(int n) {
    return 'Trimestre $n';
  }

  @override
  String get pregnancyDisclaimer =>
      'Les dates sont estimées à partir de tes dernières règles selon la règle standard des 280 jours. Une échographie donne une date plus précise et une ovulation tardive décale ces chiffres — ceci est une information, pas un suivi médical.';

  @override
  String get pregnancyNoteUnder5 =>
      'La plupart des personnes ne remarquent encore rien — comme l\'âge gestationnel se compte à partir des dernières règles, les deux premières semaines précèdent en fait la conception.';

  @override
  String get pregnancyNoteUnder9 =>
      'Les nausées, la sensibilité des seins et la fatigue sont fréquentes en ce moment. Un bon moment pour prendre un premier rendez-vous.';

  @override
  String get pregnancyNoteUnder13 =>
      'La fin du premier trimestre approche ; chez beaucoup de personnes, les nausées commencent à s\'atténuer vers cette période.';

  @override
  String get pregnancyNoteUnder20 =>
      'L\'énergie revient souvent durant cette période. Les premiers mouvements peuvent se ressentir à tout moment entre la 16e et la 22e semaine.';

  @override
  String get pregnancyNoteUnder28 =>
      'Les mouvements deviennent plus nets et commencent à former un rythme. Le mal de dos et les brûlures d\'estomac sont fréquents durant cette période.';

  @override
  String get pregnancyNoteUnder34 =>
      'Tu es dans le troisième trimestre. L\'essoufflement, les envies fréquentes d\'uriner et les contractions de Braxton-Hicks sont fréquents.';

  @override
  String get pregnancyNoteUnder38 =>
      'Le bébé se prépare à la naissance. Un bon moment pour la valise de maternité et le projet de naissance.';

  @override
  String get pregnancyNoteTerm =>
      'Tu es à terme — l\'accouchement peut survenir à tout moment entre la 37e et la 42e semaine ; la semaine 40 est une moyenne, pas une échéance.';

  @override
  String get pregnancyWeeklyNoteTitle => 'Cette semaine';

  @override
  String get pregnancyNeedsLmp =>
      'Ajoute le premier jour de tes dernières règles pour commencer.';

  @override
  String get pregnancyOutOfRange =>
      'Cette date remonte à plus de 42 semaines — mets-la à jour ou désactive le mode grossesse.';

  @override
  String get partnerShareTitle => 'Partager un résumé avec ton/ta partenaire';

  @override
  String get partnerShareBody =>
      'Crée un court résumé texte — ta phase actuelle et ta fenêtre estimée — que tu envoies toi-même via l\'app de ton choix. Pas de synchronisation en direct ni de compte partenaire : rien n\'est partagé sauf si tu l\'envoies.';

  @override
  String get partnerShareCta => 'Créer un résumé';

  @override
  String get partnerSummaryHeader => 'Résumé de cycle depuis Vera';

  @override
  String get settingsHomeThemeLabel => 'Fond de l\'accueil';

  @override
  String get homeThemeWheat => 'Blé';

  @override
  String get homeThemeSky => 'Ciel';

  @override
  String get homeThemeField => 'Champ';

  @override
  String get homeThemeBlossom => 'Fleur';

  @override
  String get homeThemePlain => 'Uni';

  @override
  String get backupNudgeTitle => 'Garde une copie de tes données';

  @override
  String get backupNudgeBody =>
      'Tout est uniquement sur ce téléphone. S\'il est perdu, cassé ou réinitialisé, ton historique disparaît avec lui — une sauvegarde chiffrée prend un instant et toi seule peux l\'ouvrir.';

  @override
  String get backupNudgeCta => 'Sauvegarder maintenant';

  @override
  String get backupNudgeDismiss => 'Plus tard';

  @override
  String backupLastDone(String date) {
    return 'Dernière sauvegarde : $date';
  }

  @override
  String get backupNever => 'Pas encore de sauvegarde';

  @override
  String get settingsRemindersBackupLabel => 'Me rappeler de sauvegarder';

  @override
  String get reminderBackupTitle => 'Il est temps de sauvegarder Vera';

  @override
  String get reminderBackupBody =>
      'Ton historique n\'existe que sur ce téléphone. Une sauvegarde chiffrée rapide le met à l\'abri.';

  @override
  String get notificationChannelPeriodStart => 'Règles à venir';

  @override
  String get notificationChannelPeriodEnd => 'Vérification de fin de règles';

  @override
  String get notificationChannelMedication => 'Médicament';

  @override
  String get notificationChannelWater => 'Eau';

  @override
  String get notificationChannelAppointment => 'Rendez-vous';

  @override
  String get notificationChannelOvulation => 'Fenêtre fertile';

  @override
  String get notificationChannelBackup => 'Rappel de sauvegarde';

  @override
  String get calendarDayDetailTitle => 'Ce jour';

  @override
  String get calendarDayNothingLogged => 'Rien d\'enregistré pour ce jour';

  @override
  String get calendarDayOpenLog => 'Ouvrir le journal du jour';

  @override
  String get cycleHistoryTitle => 'Cycles passés';

  @override
  String get cycleTrendsTitle => 'Tendances du cycle';

  @override
  String get cycleHistoryEmpty =>
      'Enregistre quelques règles et ton historique apparaîtra ici.';

  @override
  String get cycleHistoryOngoing => 'En cours';

  @override
  String cycleHistoryLength(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: 'Cycle de $days jours',
      one: 'Cycle de $days jour',
    );
    return '$_temp0';
  }

  @override
  String cycleHistoryPeriodLength(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: 'Règles de $days jours',
      one: 'Règles de 1 jour',
    );
    return '$_temp0';
  }

  @override
  String cycleHistoryVsAverage(String diff) {
    return '$diff par rapport à ta moyenne';
  }

  @override
  String get insightsCycleHistoryEntry => 'Cycles passés';

  @override
  String get homeEmptyTitle => 'Commençons par tes dernières règles';

  @override
  String get homeEmptyBody =>
      'Appuie sur le bouton ci-dessus le jour où tes règles commencent. Après deux cycles complets, Vera pourra estimer — d\'ici là, elle ne fera pas semblant de savoir.';

  @override
  String get homeEmptyBackdate => 'Elles ont déjà commencé avant';

  @override
  String get settingsAdPrivacyEntry =>
      'Options de confidentialité des publicités';

  @override
  String a11yCycleRing(int day, int length) {
    return 'Jour $day d\'un cycle d\'environ $length';
  }

  @override
  String a11yChartSummary(int count, String min, String max) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Graphique de $count entrées, de $min à $max',
      one: 'Graphique de $count entrée, de $min à $max',
    );
    return '$_temp0';
  }

  @override
  String a11yPhaseBar(int day, int length) {
    return 'Progression du cycle : jour $day sur environ $length';
  }

  @override
  String a11yFrequencyItem(String label, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count fois',
      one: '$count fois',
    );
    return '$label : $_temp0';
  }

  @override
  String get importTitle => 'Importer depuis une autre app';

  @override
  String get importBody =>
      'Exporte ton historique depuis ton ancienne app en CSV, puis choisis le fichier ici. Seules les dates et le flux sont importés — le vocabulaire des symptômes diffère d\'une app à l\'autre et Vera ne devinera pas.';

  @override
  String get importPickFile => 'Choisir un fichier CSV';

  @override
  String importPreview(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count jours d\'historique trouvés',
      one: '$count jour d\'historique trouvé',
    );
    return '$_temp0';
  }

  @override
  String importSkipped(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count lignes illisibles seront ignorées',
      one: '$count ligne illisible sera ignorée',
    );
    return '$_temp0';
  }

  @override
  String get importConfirm => 'Ajouter à mon historique';

  @override
  String get importMergeNote =>
      'Les jours importés sont fusionnés. Les jours déjà notés dans Vera restent inchangés.';

  @override
  String importDone(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count jours importés',
      one: '$count jour importé',
    );
    return '$_temp0';
  }

  @override
  String get importErrorEmpty => 'Ce fichier semble vide.';

  @override
  String get importErrorNoDate =>
      'Impossible de trouver une colonne de date dans ce fichier.';

  @override
  String get settingsImportEntry => 'Importer depuis une autre app';

  @override
  String get settingsHealthSyncLabel =>
      'Synchroniser avec Apple Health / Health Connect';

  @override
  String get settingsHealthSyncBody =>
      'N\'écrit que le flux, le poids et la température basale dans l\'app santé de ton téléphone. Symptômes, humeurs et notes restent dans Vera. Rien n\'est lu en retour.';

  @override
  String healthSyncBackfilled(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count jours envoyés à ton app santé',
      one: '$count jour envoyé à ton app santé',
    );
    return '$_temp0';
  }

  @override
  String get healthSyncDenied =>
      'L\'autorisation n\'a pas été accordée, la synchronisation reste désactivée.';

  @override
  String get settingsDiagnosticsEntry => 'Diagnostic';

  @override
  String get diagnosticsBody =>
      'Si l\'app dysfonctionne, les détails techniques sont enregistrés ici — sur cet appareil uniquement. Rien n\'est envoyé sauf si tu le décides, et tu peux lire d\'abord exactement ce que tu enverrais.';

  @override
  String get diagnosticsEmpty => 'Rien d\'enregistré — aucun problème détecté.';

  @override
  String get diagnosticsShare => 'Envoyer au développeur';

  @override
  String get diagnosticsClear => 'Effacer';

  @override
  String get diagnosticsNoteLabel => 'Que s\'est-il passé ? (facultatif)';

  @override
  String get diagnosticsTechnicalDetail => 'Détails techniques';

  @override
  String get unitHoursShort => 'h';

  @override
  String get unitMinutesShort => 'min';

  @override
  String get unitHoursLong => 'heures';

  @override
  String get unitMinutesLong => 'minutes';

  @override
  String get unitMilliliters => 'ml';

  @override
  String get unitKilograms => 'kg';

  @override
  String get calendarJumpTitle => 'Aller à un mois';

  @override
  String get calendarJumpYearLabel => 'Année';

  @override
  String get settingsAdPrivacyUnavailable =>
      'Les choix de personnalisation des publicités ne sont pas proposés dans ta région — ici, les publicités ne sont déjà pas personnalisées.';

  @override
  String get settingsGroupAppearance => 'Apparence';

  @override
  String get settingsGroupTracking => 'Préférences de suivi';

  @override
  String get dayLogCustomTagsLabel => 'Mes propres suivis';

  @override
  String get customTagAddButton => 'Ajouter un suivi';

  @override
  String get customTagDialogTitle => 'Nouveau suivi';

  @override
  String get customTagDialogHint => 'p. ex. migraine, sport, insomnie';

  @override
  String get customTagManageEntry => 'Gérer mes suivis';

  @override
  String get customTagRenameTitle => 'Renommer le suivi';

  @override
  String get customTagDeleteTitle => 'Supprimer ce suivi ?';

  @override
  String get customTagDeleteBody =>
      'Il sera retiré de tous les jours où tu l\'as utilisé. Le reste de tes données ne change pas.';

  @override
  String get customTagEmpty => 'Pas encore de suivi personnel.';

  @override
  String get premiumLockedTitle => 'Fonction Premium';

  @override
  String get premiumLockedAction => 'Voir Premium';

  @override
  String get premiumBenefitCustomTrackers =>
      'Suis ce que tu veux, avec tes propres mots';

  @override
  String get premiumBenefitAdvancedInsights =>
      'Analyses avancées : ce qui arrive, et quand';

  @override
  String get premiumBenefitPersonalisation =>
      'Fonds et compagnons supplémentaires';

  @override
  String get premiumBenefitAdvancedReminders =>
      'Des rappels à ton propre rythme';

  @override
  String get advancedInsightsTitle => 'Analyses avancées';

  @override
  String get advancedInsightsEntry => 'Analyses avancées';

  @override
  String get advancedInsightsNotEnough =>
      'Note trois cycles complets et tes tendances apparaîtront ici. En dessous, toute « tendance » ne serait qu\'une coïncidence.';

  @override
  String get advancedInsightsPatternsTitle =>
      'Quand les choses arrivent en général';

  @override
  String advancedInsightsPatternLine(String label, String segment) {
    return '$label — surtout $segment';
  }

  @override
  String advancedInsightsPatternDetail(int count, int day) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count jours notés, vers le jour $day de ton cycle',
      one: '$count jour noté, vers le jour $day de ton cycle',
    );
    return '$_temp0';
  }

  @override
  String advancedInsightsNoPattern(String label) {
    return '$label — pas encore de moment net';
  }

  @override
  String get advancedInsightsTrendTitle => 'Durée du cycle dans le temps';

  @override
  String advancedInsightsDriftLonger(String days, String cycles) {
    return 'En comparant tes $cycles premiers cycles à tes $cycles derniers, les récents durent environ $days jours de plus.';
  }

  @override
  String advancedInsightsDriftShorter(String days, String cycles) {
    return 'En comparant tes $cycles premiers cycles à tes $cycles derniers, les récents durent environ $days jours de moins.';
  }

  @override
  String advancedInsightsDriftStable(String cycles) {
    return 'En comparant tes $cycles premiers cycles à tes $cycles derniers, la durée de ton cycle est restée à peu près la même.';
  }

  @override
  String get advancedInsightsDriftNotEnough =>
      'Dès que tu auras six cycles complets, nous pourrons comparer tes premiers cycles aux plus récents pour voir si la durée de ton cycle évolue.';

  @override
  String get advancedInsightsMoodTitle => 'Humeur selon la phase du cycle';

  @override
  String get advancedInsightsDisclaimer =>
      'Ce sont des comptages de ce que tu as noté, rien de plus. Ce n\'est pas un diagnostic, et une tendance ici n\'est pas une cause.';

  @override
  String get segmentPeriod => 'pendant tes règles';

  @override
  String get segmentAfterPeriod => 'après tes règles';

  @override
  String get segmentMidCycle => 'en milieu de cycle';

  @override
  String get segmentBeforePeriod => 'avant tes règles';

  @override
  String get customRemindersEntry => 'Mes propres rappels';

  @override
  String get customRemindersTitle => 'Mes propres rappels';

  @override
  String get customRemindersEmpty => 'Pas encore de rappel personnel.';

  @override
  String get customRemindersAdd => 'Ajouter un rappel';

  @override
  String get customReminderLabelHint =>
      'p. ex. prendre ma pilule, boire de l\'eau';

  @override
  String get customReminderLockScreenNote =>
      'Le texte s\'affiche sur ton écran de verrouillage : écris-le aussi discrètement que tu le souhaites.';

  @override
  String get customReminderDelete => 'Supprimer le rappel';

  @override
  String get homeThemeDusk => 'Crépuscule';

  @override
  String get homeThemeMeadow => 'Prairie';

  @override
  String get homeThemePetal => 'Pétale';

  @override
  String get homeThemeBloom => 'Floraison';

  @override
  String get mascotStar => 'Étoile';

  @override
  String get mascotLeaf => 'Feuille';

  @override
  String get tipDetailWhatsHappening => 'Ce qui se passe dans ton corps';

  @override
  String get tipDetailDisclaimer =>
      'Ce sont des informations générales, pas un avis médical personnalisé. Chaque corps réagit différemment, et ce que tu ressens vraiment compte plus que tout ce qui est suggéré ici. Si quelque chose t\'inquiète, parles-en à un professionnel de santé.';

  @override
  String get phaseExplainerMenstrual =>
      'Tu saignes parce que la muqueuse utérine se détache. Les œstrogènes et la progestérone sont au plus bas du cycle, ce qui explique pourquoi beaucoup de personnes se sentent plus fatiguées et plus repliées les premiers jours. Le saignement dure en général trois à sept jours et il est plus abondant au début. Les crampes viennent des contractions de l\'utérus, déclenchées par les prostaglandines — des composés proches des hormones libérés quand la muqueuse se détache, ce qui explique aussi les douleurs lombaires ou le transit accéléré que certaines personnes ressentent en même temps. Le saignement coûte aussi du fer, et cela explique une partie de la fatigue. La chaleur, le mouvement et le sommeil aident en général. Si la protection est saturée toutes les heures, si le saignement dépasse nettement une semaine ou si la douleur t\'empêche de faire les choses ordinaires, mieux vaut en parler à un professionnel de santé que d\'attendre que ça passe.';

  @override
  String get phaseExplainerFollicular =>
      'Une fois le saignement terminé, les œstrogènes remontent. Dans les ovaires, un groupe de follicules mûrit, chacun contenant un ovule, et un seul est généralement libéré. Les œstrogènes reconstruisent la muqueuse qui vient d\'être évacuée, et la plupart des personnes sentent l\'énergie, l\'humeur, la peau et l\'endurance revenir avec eux. C\'est aussi la partie du cycle qui varie le plus d\'une personne à l\'autre et d\'un mois à l\'autre : le stress, une maladie, les voyages et le sommeil se manifestent surtout ici, en l\'allongeant ou en la raccourcissant. C\'est la raison honnête pour laquelle une prévision est un intervalle et non une date : la seconde moitié du cycle est assez stable, et c\'est celle-ci qui bouge.';

  @override
  String get phaseExplainerFertile =>
      'Les œstrogènes approchent de leur pic et l\'ovulation est attendue autour de ces jours. Un pic d\'hormone lutéinisante déclenche la libération de l\'ovule environ un jour à un jour et demi plus tard. L\'ovule lui-même survit à peu près 12 à 24 heures, mais les spermatozoïdes peuvent vivre plusieurs jours dans une glaire cervicale fertile — c\'est pour cela que la fenêtre se compte en plusieurs jours et non en un seul. La glaire devient typiquement claire, filante et glissante, un peu comme du blanc d\'œuf cru ; certaines personnes remarquent plus de désir, des seins sensibles ou un bref tiraillement d\'un côté. L\'énergie est souvent au plus haut du cycle. Rappelle-toi que cette fenêtre est une estimation issue de ton propre historique, pas une mesure — et ce n\'est pas un moyen de contraception.';

  @override
  String get phaseExplainerLuteal =>
      'Après l\'ovulation, le follicule vidé devient le corps jaune et se met à produire de la progestérone, qui maintient la muqueuse stable au cas où une grossesse s\'implanterait. Si ce n\'est pas le cas, la progestérone et les œstrogènes chutent brutalement et les règles commencent. Cette moitié du cycle est la plus régulière, en général autour de 12 à 14 jours. La progestérone fait légèrement monter la température au repos — c\'est ce que capte un thermomètre basal — et peut ralentir la digestion, ce qui explique une partie des ballonnements. La chute de la fin est ce qui déclenche le SPM chez beaucoup : seins tendus, changements d\'appétit, sommeil haché, maux de tête et humeur en dents de scie, qui s\'apaisent en général au début du saignement. Si ces symptômes perturbent le travail ou les relations la plupart des mois, cela mérite d\'en parler à un professionnel de santé.';

  @override
  String get phaseExplainerUnknown =>
      'Il n\'y a pas encore assez d\'enregistrements pour dire dans quelle phase tu es. Vera a besoin d\'au moins deux cycles complets — un début de règles, puis le suivant — pour calculer ta propre moyenne et ta variabilité, et préfère le dire plutôt que d\'inventer une phase. Rien n\'est perdu entre-temps : chaque jour enregistré fait partie de ce premier calcul, et l\'estimation se resserre à mesure que l\'historique s\'allonge. D\'ici là, les suggestions ci-dessous sont générales et valables à n\'importe quel moment du cycle.';

  @override
  String get tipFitnessDetailMenstrual =>
      'L\'entraînement intense ne convient pas à la plupart des personnes les premiers jours, et ce n\'est pas un problème de discipline : l\'énergie est réellement plus basse, et la perte de fer liée au saignement rend le travail d\'endurance plus dur que la même séance la semaine dernière. La marche, des étirements doux, le yoga restauratif et le travail respiratoire améliorent la circulation et peuvent atténuer les crampes ; chez certaines personnes, bouger régulièrement tout au long du mois réduit l\'intensité des crampes plus que tout ce qui est fait le jour même. Si tu te sens bien, rien n\'empêche les séances exigeantes : saigner n\'est pas une raison d\'arrêter le sport, et de nombreuses athlètes compètent pendant leurs règles. Quelques notes pratiques : les séances longues et exigeantes les jours de flux abondant peuvent accentuer la fatigue, appliquer de la chaleur sur le bas-ventre avant de commencer rend le mouvement plus confortable, et boire un peu plus que d\'habitude aide contre les maux de tête de ces jours-là. Juge la séance à ce que tu ressens pendant, pas à ce qu\'était ta meilleure semaine.';

  @override
  String get tipFitnessDetailFollicular =>
      'Avec la remontée des œstrogènes, la plupart des personnes se sentent plus fortes et plus endurantes ; c\'est en général la meilleure période du cycle pour commencer quelque chose de nouveau, augmenter les charges ou accélérer le rythme. La réparation musculaire y est relativement efficace, donc les séances dures sont mieux encaissées et laissent moins de courbatures persistantes. C\'est aussi une bonne fenêtre pour ce qui demande une tête claire autant qu\'un corps solide : apprendre un nouveau mouvement, corriger la technique, ou faire une distance plus longue que d\'habitude. Deux réserves à garder : progresse graduellement, car beaucoup d\'énergie ne veut pas dire zéro risque de blessure, et la plupart des blessures de surcharge commencent dans une bonne semaine, pas dans une mauvaise. Et protège ton sommeil : l\'adaptation se produit pendant la récupération, pas pendant la séance.';

  @override
  String get tipFitnessDetailFertile =>
      'L\'énergie et la motivation sont généralement au plus haut, donc les séances exigeantes passent bien — c\'est souvent là que tombent les records personnels. Certaines études suggèrent que les articulations sont un peu plus laxes autour de l\'ovulation ; l\'effet pratique est débattu, mais un échauffement plus long reste une précaution peu coûteuse dans les sports avec changements de direction brusques, sauts et réceptions. La température corporelle est encore basse par rapport à la seconde moitié du cycle, donc la chaleur limite moins qu\'elle ne le fera dans une ou deux semaines. Un bref tiraillement d\'un côté du bas-ventre autour de l\'ovulation est fréquent et passe généralement en quelques heures. Si la douleur est forte, d\'un seul côté et persistante, s\'il y a de la fièvre ou une sensation de malaise, arrête et fais-toi examiner plutôt que de continuer.';

  @override
  String get tipFitnessDetailLuteal =>
      'À l\'approche des règles, l\'énergie peut baisser, le pouls peut être plus haut pour le même effort et la récupération peut s\'allonger. C\'est une oscillation attendue, pas un recul, et cela n\'efface pas le travail des deux dernières semaines. La progestérone fait légèrement monter la température au repos et rend l\'évacuation de la chaleur plus difficile : les séances par temps chaud ou humide paraissent donc démesurément dures ici. S\'entraîner plus tôt ou plus tard dans la journée et boire plus que nécessaire aident tous les deux. Des séances modérées, une version un peu allégée du travail de force et la marche sont généralement plus tenables. En cas de ballonnements et de seins sensibles, une brassière bien maintenante et un échauffement plus long font une vraie différence. Si le moral est bas, fais la séance courte et facile plutôt que de la sauter : le seuil pour qu\'elle compte est plus bas qu\'il n\'en a l\'air.';

  @override
  String get tipFitnessDetailUnknown =>
      'Même sans connaître ta phase, bouger aide à tout moment : la recommandation générale est d\'environ 150 minutes d\'activité modérée par semaine, réparties sur la plupart des jours, plus du renforcement deux fois par semaine — et ce schéma fonctionne mieux, pour presque tout le monde, que des séances très intenses occasionnelles. La régularité compte plus que l\'intensité, et la meilleure séance est celle que tu répéteras la semaine prochaine. Ajuste selon ce que tu ressens : les jours de fatigue, une marche compte, et une séance courte faite vaut mieux qu\'une longue sautée. Une fois quelques cycles enregistrés, des suggestions par phase apparaîtront ici.';

  @override
  String get tipNutritionDetailMenstrual =>
      'Le saignement coûte du fer ; la viande rouge, les lentilles, les pois chiches, les légumes à feuilles vert foncé et la mélasse aident à le reconstituer. Le fer végétal s\'absorbe nettement mieux avec de la vitamine C — presser du citron sur un plat de lentilles en est la version la plus pratique, et une salade de tomates à côté fait la même chose. Le thé et le café pendant le repas réduisent l\'absorption du fer à cause de leurs tanins : laisser environ une heure entre les deux suffit, il n\'est pas nécessaire d\'y renoncer. Boire suffisamment d\'eau peut atténuer la fatigue et les maux de tête liés au saignement, et les aliments riches en magnésium comme les fruits à coque, les graines et les légumes à feuilles foncées aident certaines personnes contre les crampes. Les jours où la digestion est lente, des repas petits et réguliers passent mieux que des repas copieux. Si tu ressens souvent un essoufflement, des vertiges ou une fatigue inhabituelle autour des règles, cela vaut la peine d\'en parler à un professionnel de santé : le manque de fer est fréquent, facile à vérifier, et ce n\'est pas à une application de le diagnostiquer.';

  @override
  String get tipNutritionDetailFollicular =>
      'Avec l\'énergie qui revient, le corps est en mode reconstruction : assez de protéines, des céréales complètes et des légumes soutiennent cela, et c\'est la phase où l\'appétit est en général le plus stable et le plus facile à gérer. Il est aussi logique de continuer à refaire les réserves de fer après le saignement plutôt que d\'en faire une affaire de la seule semaine des règles : les réserves se reconstituent en semaines, pas en jours. Ne pas sauter de repas est plus simple ici, et cela permet d\'aborder plus sereinement les variations d\'appétit de la phase suivante. Si tu veux changer ta façon de manger, cette période est généralement plus clémente pour commencer que la semaine précédant les règles, où les envies et le moral bas font paraître toute nouvelle routine plus difficile qu\'elle ne l\'est.';

  @override
  String get tipNutritionDetailFertile =>
      'Aucun régime particulier n\'est nécessaire ici ; des repas équilibrés et assez d\'eau font l\'essentiel. Certaines personnes se sentent ballonnées autour de l\'ovulation, ce qui est généralement hormonal et passager plutôt que lié à ce qui a été mangé. L\'appétit baisse légèrement chez les unes et augmente chez les autres — les deux sont ordinaires. Garder des protéines et des fibres dans les repas stabilise l\'énergie pendant ce qui est souvent la période la plus active du mois. Si tu envisages une grossesse, c\'est un bon moment pour interroger un professionnel de santé sur l\'acide folique, généralement conseillé avant la conception plutôt qu\'après — mais c\'est une conversation à avoir avec cette personne, pas un conseil qu\'une application devrait donner.';

  @override
  String get tipNutritionDetailLuteal =>
      'L\'augmentation de l\'appétit et les envies de sucre quand la progestérone monte sont très fréquentes ; c\'est un changement hormonal, pas un problème de volonté, et le corps dépense réellement un peu plus d\'énergie dans cette phase. Ajouter des protéines et des fibres aux repas stabilise la glycémie et adoucit l\'envie bien mieux que d\'essayer de l\'ignorer — une envie satisfaite avec quelque chose de consistant s\'arrête généralement plus tôt qu\'une envie contre laquelle on lutte pendant une heure. Moins de sel et plus d\'eau peuvent soulager les ballonnements ; cela semble contre-intuitif mais ne l\'est pas : bien hydraté, le corps retient moins. Les aliments riches en magnésium (amandes, noix, légumes à feuilles foncées, chocolat noir) réduisent les crampes et la tension chez certaines personnes. Réduire la caféine après midi aide contre le sommeil haché de cette phase, et l\'alcool mérite aussi attention, car il fragmente le sommeil exactement au moment du cycle où il est déjà plus léger.';

  @override
  String get tipNutritionDetailUnknown =>
      'Quelle que soit la phase, ce sont les mêmes choses qui aident le plus : des repas réguliers, assez de protéines, beaucoup de légumes, assez d\'eau et des aliments riches en fer. Comme le saignement coûte du fer, il suffit d\'y prêter un peu plus attention ces jours-là — inutile d\'avoir une alimentation différente chaque semaine du mois. Manger à des heures à peu près constantes fait plus pour une énergie stable que n\'importe quel aliment pris isolément, et aucun ingrédient n\'a besoin d\'être supprimé pour qu\'un cycle soit sain. Une fois quelques cycles enregistrés, des suggestions par phase apparaîtront ici.';
}
