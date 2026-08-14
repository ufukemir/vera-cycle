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
      'Tes données restent uniquement sur cet appareil. Pas de compte, pas de cloud, rien n\'est envoyé nulle part — l\'app n\'a même pas la permission d\'utiliser internet, et tu peux le vérifier toi-même dans les réglages de ton téléphone.';

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
      'Nous pouvons te prévenir avant l\'arrivée prévue de tes règles. Les notifications se passent entièrement sur ton téléphone — rien n\'est envoyé à un serveur pour qu\'elles fonctionnent.';

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
  String insightsVariabilityLabel(String days) {
    return 'Varie d\'environ $days jours';
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
  String get privacyScreenStorage =>
      'Tout ce que tu enregistres est chiffré et stocké uniquement sur cet appareil, dans un seul fichier. La clé de chiffrement se trouve dans le matériel sécurisé de ton téléphone — Trousseau (Keychain) sur iOS, Keystore sur Android — pas dans le fichier lui-même.';

  @override
  String get privacyScreenNoNetwork =>
      'Cette app n\'a pas de serveur. Elle n\'a même pas la permission d\'utiliser internet — tu peux le vérifier toi-même dans les réglages de ton téléphone.';

  @override
  String get privacyScreenNoThirdParty =>
      'Il n\'y a ni analytique, ni rapport de plantage, ni publicité, ni aucun SDK tiers.';

  @override
  String get privacyScreenExport =>
      'La seule façon dont tes données quittent cet appareil, c\'est si tu les exportes toi-même, et cet export est chiffré avec un mot de passe que toi seule connais.';

  @override
  String get privacyScreenDelete =>
      'Supprimer tes données est réel et immédiat. Il n\'y a ni compte ni sauvegarde de notre côté — une fois supprimées, elles le sont pour de bon.';

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
}
