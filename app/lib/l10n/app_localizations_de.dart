// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for German (`de`).
class AppLocalizationsDe extends AppLocalizations {
  AppLocalizationsDe([String locale = 'de']) : super(locale);

  @override
  String get appTitle => 'Vera';

  @override
  String get actionSkip => 'Überspringen';

  @override
  String get actionContinue => 'Weiter';

  @override
  String get actionDone => 'Fertig';

  @override
  String get actionCancel => 'Abbrechen';

  @override
  String get actionDelete => 'Löschen';

  @override
  String get actionEnable => 'Aktivieren';

  @override
  String get commonIDontKnow => 'Ich weiß es nicht';

  @override
  String get commonYes => 'Ja';

  @override
  String get commonNo => 'Nein';

  @override
  String get commonNotSure => 'Nicht sicher';

  @override
  String get pinSetupTitle => 'PIN einrichten';

  @override
  String get pinSetupEnterPrompt =>
      'Wähle eine 6-stellige PIN, um die App zu sperren';

  @override
  String get pinSetupConfirmPrompt => 'Gib sie zur Bestätigung erneut ein';

  @override
  String get pinSetupMismatch =>
      'Das stimmt nicht überein — versuchen wir es noch einmal';

  @override
  String get pinSetupBiometricTitle => 'Schnellere Entsperrung?';

  @override
  String get pinSetupBiometricBody =>
      'Du kannst auch deinen Fingerabdruck oder dein Gesicht zum Entsperren nutzen — deine PIN funktioniert weiterhin als Rückfalloption.';

  @override
  String get lockScreenTitle => 'Gesperrt';

  @override
  String get lockScreenEnterPin => 'Gib deine PIN ein';

  @override
  String get lockScreenWrongPin => 'Diese PIN stimmt nicht überein';

  @override
  String get lockScreenUseBiometrics => 'Biometrie verwenden';

  @override
  String get lockScreenForgotPin => 'PIN vergessen?';

  @override
  String lockScreenThrottled(int seconds) {
    return 'Zu viele Versuche. Versuche es in ${seconds}s erneut';
  }

  @override
  String get lockScreenEraseTitle => 'Alle Daten löschen?';

  @override
  String get lockScreenEraseBody =>
      'Dies löscht dauerhaft alles auf diesem Gerät. Es gibt kein Konto und kein Server-Backup, daher kann dies nicht rückgängig gemacht werden.';

  @override
  String get lockScreenEraseConfirm => 'Alles löschen';

  @override
  String get onboardingPrivacyTitle => 'Willkommen';

  @override
  String get onboardingPrivacyBody =>
      'Deine Zyklusdaten bleiben verschlüsselt nur auf diesem Gerät. Kein Konto, keine Cloud-Synchronisierung — nichts, was du erfasst, wird hochgeladen. Die kostenlose Version zeigt Werbung, die das Internet nutzt, aber deine Gesundheitsdaten nie erhält.';

  @override
  String get onboardingLastPeriodTitle =>
      'Wann hat deine letzte Periode begonnen?';

  @override
  String get onboardingLastPeriodBody =>
      'Das hilft uns beim Start — du kannst es später jederzeit über den Kalender korrigieren.';

  @override
  String get onboardingPickDate => 'Datum wählen';

  @override
  String get onboardingCycleLengthTitle =>
      'Wie lang ist dein Zyklus normalerweise?';

  @override
  String get onboardingCycleLengthBody =>
      'Eine ungefähre Zahl reicht. Wir geben dir eine echte Schätzung, sobald wir ein paar vollständige Zyklen gesehen haben.';

  @override
  String get onboardingPeriodLengthTitle =>
      'Wie viele Tage dauert deine Periode normalerweise?';

  @override
  String get onboardingPeriodLengthBody =>
      'Damit füllen wir deine letzte Periode auf, damit du nicht bei null anfängst.';

  @override
  String get onboardingDaysUnit => 'Tage';

  @override
  String get onboardingGoalTitle => 'Was führt dich hierher?';

  @override
  String get onboardingGoalBody =>
      'Das hilft uns nur, dir zuerst das Richtige zu zeigen — du kannst es jederzeit in den Einstellungen ändern.';

  @override
  String get goalTrackPeriod => 'Meine Periode verfolgen';

  @override
  String get goalTryingToConceive => 'Ich versuche schwanger zu werden';

  @override
  String get goalPregnancyTracking => 'Schwangerschaft verfolgen';

  @override
  String get onboardingRegularityTitle => 'Ist deine Periode meist regelmäßig?';

  @override
  String get onboardingRegularityBody =>
      'Hier gibt es keine falsche Antwort — es hilft uns nur, deinen Körper etwas besser kennenzulernen.';

  @override
  String get onboardingCrampsTitle => 'Hast du meist Krämpfe?';

  @override
  String get onboardingCrampsBody =>
      'Wir sorgen dafür, dass du an solchen Tagen leicht festhalten kannst, wie du dich fühlst.';

  @override
  String get onboardingNotificationTitle => 'Möchtest du sanfte Erinnerungen?';

  @override
  String get onboardingNotificationBody =>
      'Wir können dich benachrichtigen, bevor deine Periode erwartet wird.';

  @override
  String get onboardingNotificationMockTitle =>
      'Deine Periode könnte bald beginnen';

  @override
  String get onboardingNotificationMockBody =>
      'Basierend auf deinen erfassten Zyklen';

  @override
  String get onboardingNotificationAllow => 'Erinnerungen aktivieren';

  @override
  String get onboardingNotificationNotNow => 'Jetzt nicht';

  @override
  String get onboardingBuildingPlanTitle => 'Wir richten alles für dich ein';

  @override
  String get onboardingBuildingPlanStep1 =>
      'Deine Daten werden auf diesem Gerät gesichert';

  @override
  String get onboardingBuildingPlanStep2 =>
      'Deine Einstellungen werden gespeichert';

  @override
  String get onboardingBuildingPlanStep3 => 'Dein Kalender wird vorbereitet';

  @override
  String get onboardingBuildingPlanDone => 'Fertig';

  @override
  String get navHome => 'Start';

  @override
  String get navCalendar => 'Kalender';

  @override
  String get navInsights => 'Einblicke';

  @override
  String get navSettings => 'Einstellungen';

  @override
  String homeCycleDayLabel(int day) {
    return 'Tag $day';
  }

  @override
  String get homeNoCycleYet => 'Noch keine Periode erfasst';

  @override
  String get homePhaseMenstrual => 'Periode';

  @override
  String get homePhaseFollicular => 'Follikelphase';

  @override
  String get homePhaseFertileWindow => 'Geschätztes fruchtbares Fenster';

  @override
  String get homePhaseLuteal => 'Lutealphase';

  @override
  String get homePhaseUnknown => 'Nicht genug aktuelle Daten';

  @override
  String get homePredictionInsufficientTitle => 'Noch nicht genug Daten';

  @override
  String get homePredictionInsufficientBody =>
      'Erfasse deine nächste Periode, dann beginnen wir mit Schätzungen.';

  @override
  String homePredictionRangeLabel(String start, String end) {
    return '$start – $end';
  }

  @override
  String get homeConfidenceHigh => 'Hohe Zuverlässigkeit';

  @override
  String get homeConfidenceMedium => 'Mittlere Zuverlässigkeit';

  @override
  String get homeConfidenceLow => 'Geringe Zuverlässigkeit';

  @override
  String get homeIrregularNote =>
      'Deine Zykluslänge hat in letzter Zeit stärker als üblich geschwankt. Falls das neu für dich ist, könnte es sich lohnen, das bei einer Vorsorgeuntersuchung anzusprechen.';

  @override
  String get homeFertileWindowDisclaimer =>
      'Basierend auf typischem Zyklusverlauf — keine Verhütungsmethode.';

  @override
  String get homePeriodStartedButton => 'Periode hat heute begonnen';

  @override
  String get homePeriodStartedSnackbar =>
      'Erfasst — Periode hat heute begonnen';

  @override
  String get actionUndo => 'Rückgängig';

  @override
  String get comingSoon => 'Demnächst verfügbar';

  @override
  String get dayLogFlowLabel => 'Blutungsstärke';

  @override
  String get flowSpotting => 'Schmierblutung';

  @override
  String get flowLight => 'Leicht';

  @override
  String get flowMedium => 'Mittel';

  @override
  String get flowHeavy => 'Stark';

  @override
  String get flowNone => 'Keine';

  @override
  String get dayLogSymptomsLabel => 'Symptome';

  @override
  String get symptomCramps => 'Krämpfe';

  @override
  String get symptomHeadache => 'Kopfschmerzen';

  @override
  String get symptomBloating => 'Blähbauch';

  @override
  String get symptomBreastTenderness => 'Brustspannen';

  @override
  String get symptomAcne => 'Akne';

  @override
  String get symptomFatigue => 'Müdigkeit';

  @override
  String get symptomNausea => 'Übelkeit';

  @override
  String get symptomBackPain => 'Rückenschmerzen';

  @override
  String get symptomAppetiteChange => 'Appetitveränderung';

  @override
  String get symptomSleepTrouble => 'Schlafprobleme';

  @override
  String get symptomPelvicPain => 'Beckenschmerzen';

  @override
  String get symptomDizziness => 'Schwindel';

  @override
  String get dayLogMoodLabel => 'Stimmung';

  @override
  String get moodCalm => 'Ruhig';

  @override
  String get moodAnxious => 'Ängstlich';

  @override
  String get moodIrritable => 'Gereizt';

  @override
  String get moodLow => 'Niedergeschlagen';

  @override
  String get moodEnergetic => 'Energiegeladen';

  @override
  String get moodHappy => 'Glücklich';

  @override
  String get moodContent => 'Zufrieden';

  @override
  String get moodSad => 'Traurig';

  @override
  String get moodDepressed => 'Niedergeschlagen';

  @override
  String get moodEmotional => 'Emotional';

  @override
  String get dayLogNoteLabel => 'Notiz';

  @override
  String get dayLogNoteHint => 'Alles, was du dir über heute merken möchtest';

  @override
  String get dayLogOptionalTrackersLabel => 'Optionale Tracker';

  @override
  String get dayLogSexualActivityLabel => 'Sexuelle Aktivität';

  @override
  String get dayLogBbtLabel => 'Basaltemperatur';

  @override
  String get dayLogMucusLabel => 'Zervixschleim';

  @override
  String get mucusDry => 'Trocken';

  @override
  String get mucusSticky => 'Klebrig';

  @override
  String get mucusCreamy => 'Cremig';

  @override
  String get mucusWatery => 'Wässrig';

  @override
  String get mucusEggWhite => 'Eiklar';

  @override
  String get dayLogSavedIndicator => 'Gespeichert';

  @override
  String get homeOpenTodayLog => 'Details für heute hinzufügen';

  @override
  String get calendarLegendActual => 'Erfasste Periode';

  @override
  String get calendarLegendPredicted => 'Vorhergesagtes Fenster';

  @override
  String get calendarLegendFertile => 'Geschätztes fruchtbares Fenster';

  @override
  String get calendarLegendOvulation => 'Geschätzter Eisprung';

  @override
  String get dayDetailFertileTitle =>
      'Du bist in deinem geschätzten fruchtbaren Fenster';

  @override
  String get dayDetailOvulationTitle => 'Geschätzter Eisprungtag';

  @override
  String get dayDetailOvulationBody =>
      'Eine Schwangerschaft ist um diesen Tag herum typischerweise wahrscheinlicher, basierend auf dem üblichen Timing — das ist eine Schätzung, keine Garantie.';

  @override
  String get insightsCyclesLoggedLabel => 'Erfasste Zyklen';

  @override
  String get insightsAveragePeriodLengthLabel =>
      'Durchschnittliche Periodendauer';

  @override
  String get insightsAverageCycleLengthLabel => 'Durchschnittliche Zykluslänge';

  @override
  String insightsVariabilityLabel(String days) {
    return 'Schwankt um etwa $days Tage';
  }

  @override
  String get insightsNotEnoughDataTitle => 'Noch nicht genug Daten';

  @override
  String get insightsNotEnoughDataBody =>
      'Erfasse ein paar vollständige Zyklen, dann erscheinen hier deine Durchschnittswerte.';

  @override
  String get insightsSymptomFrequencyTitle => 'Symptome nach Zyklustag';

  @override
  String get insightsNoSymptomsLogged => 'Noch keine Symptome erfasst';

  @override
  String get settingsLanguageLabel => 'Sprache';

  @override
  String get settingsLanguageSystem => 'Systemsprache';

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
  String get settingsWeekStartLabel => 'Woche beginnt am';

  @override
  String get settingsWeekStartMonday => 'Montag';

  @override
  String get settingsWeekStartSunday => 'Sonntag';

  @override
  String get settingsTemperatureUnitLabel => 'Temperatureinheit';

  @override
  String get settingsTemperatureCelsius => 'Celsius';

  @override
  String get settingsTemperatureFahrenheit => 'Fahrenheit';

  @override
  String get settingsRemindersLabel => 'Vor meiner Periode erinnern';

  @override
  String get settingsRemindersPeriodEndLabel =>
      'Erinnern, wenn meine Periode enden sollte';

  @override
  String get settingsRemindersMedicationLabel => 'Medikamentenerinnerung';

  @override
  String get settingsRemindersWaterLabel => 'Trinkerinnerung';

  @override
  String get settingsRemindersAppointmentLabel => 'Termin-Erinnerung';

  @override
  String get settingsRemindersAppointmentSet => 'Datum & Uhrzeit festlegen';

  @override
  String get settingsRemindersAppointmentClear => 'Entfernen';

  @override
  String get settingsOptionalTrackersHeading => 'Optionale Tracker';

  @override
  String get settingsOptionalTrackersBody =>
      'Standardmäßig deaktiviert. Wird einer aktiviert, erscheint er im Tagesprotokoll.';

  @override
  String get settingsSexualActivityToggle => 'Sexuelle Aktivität';

  @override
  String get settingsBbtToggle => 'Basaltemperatur';

  @override
  String get settingsMucusToggle => 'Zervixschleim';

  @override
  String get settingsBreastExamToggle => 'Brust-Selbstuntersuchung';

  @override
  String get settingsCervixToggle => 'Muttermundposition & -festigkeit';

  @override
  String get settingsPrivacyEntry => 'Datenschutz';

  @override
  String get settingsDeleteAllData => 'Alle Daten löschen';

  @override
  String get privacyScreenTitle => 'Datenschutz';

  @override
  String get privacyScreenIntro =>
      'Hier erfährst du in einfacher Sprache genau, was mit deinen Daten passiert.';

  @override
  String get privacyScreenStorage =>
      'Alles, was du erfasst, wird verschlüsselt und nur auf diesem Gerät in einer einzigen Datei gespeichert. Der Verschlüsselungscode liegt in der sicheren Hardware deines Telefons — Keychain unter iOS, Keystore unter Android — nicht in der Datei selbst.';

  @override
  String get privacyScreenNoNetwork =>
      'Diese App hat keinen eigenen Server und kein Kontosystem — deine Einträge werden nie hochgeladen. Die kostenlose Version enthält Google-Werbung, die sich mit dem Internet verbindet; sie erhält nie etwas von dem, was du erfasst.';

  @override
  String get privacyScreenNoThirdParty =>
      'Es gibt keine Analysen, keine Absturzberichte und kein Tracking-SDK. Die einzige Drittanbieter-Komponente ist Googles Werbe-SDK in der kostenlosen Version — Premium entfernt es vollständig.';

  @override
  String get privacyScreenExport =>
      'Deine Daten verlassen dieses Gerät nur, wenn du sie selbst exportierst, und dieser Export wird mit einem Passwort verschlüsselt, das nur du kennst.';

  @override
  String get privacyScreenDelete =>
      'Das Löschen deiner Daten ist echt und sofort. Es gibt weder ein Konto noch eine Sicherung auf unserer Seite — einmal weg, für immer weg.';

  @override
  String get adPlaceholderLabel => 'Werbefläche';

  @override
  String get adPlaceholderUpgradeCta => 'Mit Premium werbefrei werden';

  @override
  String get reminderNotificationTitle => 'Deine Periode könnte bald beginnen';

  @override
  String get reminderNotificationBody =>
      'Basierend auf deinen erfassten Zyklen rückt dein geschätztes Fenster näher.';

  @override
  String get reminderPeriodEndTitle =>
      'Deine Periode könnte sich dem Ende nähern';

  @override
  String get reminderPeriodEndBody =>
      'Falls sie noch andauert, ist das völlig normal — nur eine sanfte Erinnerung.';

  @override
  String get reminderMedicationTitle => 'Medikamentenerinnerung';

  @override
  String get reminderMedicationBody => 'Zeit, dein Medikament zu nehmen.';

  @override
  String get reminderWaterTitle => 'Bleib hydriert';

  @override
  String get reminderWaterBody => 'Eine kleine Trinkerinnerung.';

  @override
  String get reminderAppointmentTitle => 'Anstehender Termin';

  @override
  String get reminderAppointmentBody => 'Du hast einen anstehenden Termin.';

  @override
  String get settingsExportEntry => 'Exportieren & sichern';

  @override
  String get exportBackupHeading => 'Verschlüsseltes Backup';

  @override
  String get exportBackupBody =>
      'Speichere eine verschlüsselte Kopie deines Verlaufs, um sie auf ein neues Gerät zu übertragen. Zum Wiederherstellen brauchst du erneut das Passwort — es gibt keine andere Möglichkeit, es wiederherzustellen.';

  @override
  String get exportCreateBackupButton => 'Backup erstellen';

  @override
  String get exportRestoreBackupButton => 'Aus Backup wiederherstellen';

  @override
  String get exportPasswordLabel => 'Passwort';

  @override
  String get exportPasswordConfirmLabel => 'Passwort bestätigen';

  @override
  String get exportPasswordMismatch => 'Passwörter stimmen nicht überein';

  @override
  String get exportPasswordTooShort => 'Verwende mindestens 8 Zeichen';

  @override
  String get exportRestoreConfirmTitle =>
      'Alle Daten auf diesem Gerät ersetzen?';

  @override
  String get exportRestoreConfirmBody =>
      'Das Wiederherstellen eines Backups ersetzt alles, was derzeit auf diesem Gerät erfasst ist. Dies kann nicht rückgängig gemacht werden.';

  @override
  String get exportRestoreConfirmAction => 'Wiederherstellen';

  @override
  String get exportWrongPassword =>
      'Dieses Passwort passt nicht zu diesem Backup';

  @override
  String get exportInvalidFile =>
      'Diese Datei sieht nicht wie ein Vera-Backup aus';

  @override
  String get exportBackupCreated => 'Backup bereit zum Teilen';

  @override
  String get exportRestoreSuccess => 'Backup wiederhergestellt';

  @override
  String get exportDoctorReportHeading => 'Arztbericht';

  @override
  String get exportDoctorReportBody =>
      'Eine Zusammenfassung, die du mit einer Ärztin oder einem Arzt teilen kannst.';

  @override
  String get exportIncludeNotesToggle => 'Persönliche Notizen einschließen';

  @override
  String get exportShareCsvButton => 'Als CSV teilen';

  @override
  String get exportPrintPdfButton => 'Drucken / Als PDF speichern';

  @override
  String get doctorReportDisclaimer =>
      'Erstellt von Vera aus von der Nutzerin eingegebenen Daten. Keine medizinische Diagnose.';

  @override
  String get doctorReportGeneratedOn => 'Erstellt am';

  @override
  String get doctorReportSummaryHeading => 'Zusammenfassung';

  @override
  String get doctorReportDailyLogHeading => 'Tagesprotokoll';

  @override
  String get doctorReportColumnDate => 'Datum';

  @override
  String get doctorReportTimelineHeading => 'Zyklus-Zeitleiste';

  @override
  String get doctorReportCycleLabel => 'Zyklus';

  @override
  String get doctorReportTimelineLegendPeriod => 'Periode';

  @override
  String get doctorReportTimelineLegendCycle => 'Restlicher Zyklus';

  @override
  String get doctorReportTimelineOngoing => 'Läuft noch';

  @override
  String get dailyInsightLabel => 'Wusstest du schon?';

  @override
  String get insightMenstrual1 =>
      'Deine Gebärmutterschleimhaut löst sich gerade jetzt ab — die meisten Perioden dauern 3 bis 7 Tage, und das ist völlig normal.';

  @override
  String get insightMenstrual2 =>
      'Eisenreiche Lebensmittel wie Blattgemüse und Linsen können helfen, den Verlust dieser Woche auszugleichen.';

  @override
  String get insightFollicular1 =>
      'Der Östrogenspiegel steigt, und viele bemerken ab jetzt mehr Energie und bessere Konzentration.';

  @override
  String get insightFollicular2 =>
      'Dein Körper bereitet eine Eizelle für die Freisetzung vor — diese Phase kann von einer Woche bis zu mehreren Wochen dauern.';

  @override
  String get insightFertile1 =>
      'Dies ist dein geschätztes fruchtbares Fenster — die Tage rund um den Eisprung, in denen eine Schwangerschaft laut typischem Zeitverlauf am wahrscheinlichsten ist.';

  @override
  String get insightFertile2 =>
      'Manche bemerken rund um den Eisprung einen leichten Anstieg der Basaltemperatur oder Veränderungen des Zervixschleims.';

  @override
  String get insightLuteal1 =>
      'Nach dem Eisprung steigt das Progesteron — oft treten dann PMS-Symptome wie Stimmungsschwankungen oder Blähungen auf.';

  @override
  String get insightLuteal2 =>
      'Wenn sich keine Schwangerschaft eingenistet hat, sinken die Hormonspiegel gegen Ende dieser Phase und lösen deine nächste Periode aus.';

  @override
  String get insightUnknown1 =>
      'Die Zykluslänge variiert von Person zu Person stark — 21 bis 35 Tage gelten als typisch.';

  @override
  String get insightsPhaseTipsTitle => 'Kann in dieser Phase guttun';

  @override
  String get tipFitnessLabel => 'Bewegung';

  @override
  String get tipNutritionLabel => 'Ernährung';

  @override
  String get tipFitnessMenstrual =>
      'Sanfte Bewegung — Spazierengehen, Dehnen oder restauratives Yoga — kann sich gerade besser anfühlen als intensives Training.';

  @override
  String get tipFitnessFollicular =>
      'Die Energie steigt in dieser Phase oft — ein guter Zeitpunkt, um ein neues Workout auszuprobieren oder dich etwas mehr zu fordern.';

  @override
  String get tipFitnessFertile =>
      'Viele Menschen fühlen sich hier am energiegeladensten — eine gute Phase für intensiveres Training, falls dir das zusagt.';

  @override
  String get tipFitnessLuteal =>
      'Wenn die Energie gegen Ende dieser Phase nachlässt, können leichteres Krafttraining oder Schwimmen sich nachhaltiger anfühlen.';

  @override
  String get tipFitnessUnknown =>
      'Welche Bewegung sich heute gut anfühlt, ist eine gute Wahl — es gibt keine einzige \"richtige\" Routine für jeden Tag.';

  @override
  String get tipNutritionMenstrual =>
      'Eisenreiche Lebensmittel wie Blattgemüse, Linsen und rotes Fleisch können helfen, den Verlust dieser Woche auszugleichen.';

  @override
  String get tipNutritionFollicular =>
      'Leichtere, frische Mahlzeiten tun oft gut, wenn die Energie steigt — aber es gibt keine einzige \"richtige\" Art, in dieser Phase zu essen.';

  @override
  String get tipNutritionFertile =>
      'Ausreichend Flüssigkeit und ausgewogene Mahlzeiten unterstützen deine Energie in dieser aktiver wirkenden Phase.';

  @override
  String get tipNutritionLuteal =>
      'Heißhunger kann sich hier verändern — komplexe Kohlenhydrate und magnesiumreiche Lebensmittel wie Nüsse und dunkle Schokolade sind gängige Optionen.';

  @override
  String get tipNutritionUnknown =>
      'Ausgewogene, regelmäßige Mahlzeiten sind eine solide Standardwahl, solange deine Phase noch nicht klar ist.';

  @override
  String get predictionSettingsEntry => 'Vorhersage-Einstellungen';

  @override
  String get predictionSettingsIntro =>
      'Das sind offen gezeigte Annahmen. Sobald du 2 vollständige Zyklen erfasst hast, wird deine echte Vorhersage auf der Startseite aus deinen eigenen Daten berechnet — diese Zahlen werden dafür dann nicht mehr verwendet.';

  @override
  String get predictionSettingsPeriodLengthLabel => 'Typische Periodendauer';

  @override
  String get predictionSettingsCycleLengthLabel => 'Typische Zykluslänge';

  @override
  String get predictionSettingsCycleLengthHint =>
      'Wird verwendet, um den Ring auf der Startseite zu skalieren, bis echte Daten vorliegen.';

  @override
  String get predictionSettingsLutealLabel => 'Lutealphasen-Länge';

  @override
  String get predictionSettingsLutealHint =>
      'Die typischen Tage zwischen Eisprung und deiner nächsten Periode. Wird verwendet, um das geschätzte fruchtbare Fenster zu platzieren — dieser Wert wird auch nach Beginn echter Vorhersagen weiter verwendet.';

  @override
  String get dayLogEnergyLabel => 'Energie';

  @override
  String get energyLevelLow => 'Niedrig';

  @override
  String get energyLevelMedium => 'Mittel';

  @override
  String get energyLevelHigh => 'Hoch';

  @override
  String get energyLevelEnergetic => 'Energiegeladen';

  @override
  String get dayLogSkinHairLabel => 'Haut & Haare';

  @override
  String get skinHealthyGlow => 'Gesunder Glow';

  @override
  String get skinRedness => 'Rötung';

  @override
  String get skinDryness => 'Trockenheit';

  @override
  String get skinOiliness => 'Fettigkeit';

  @override
  String get hairGoodDay => 'Guter Haartag';

  @override
  String get hairBadDay => 'Schlechter Haartag';

  @override
  String get hairLoss => 'Haarausfall';

  @override
  String get scalpOily => 'Fettige Kopfhaut';

  @override
  String get dayLogBreastExamLabel => 'Brust-Selbstuntersuchung';

  @override
  String get breastExamAllNormal => 'Nichts Ungewöhnliches';

  @override
  String get breastExamLump => 'Knoten';

  @override
  String get breastExamIndentation => 'Einziehung';

  @override
  String get breastExamRedness => 'Rötung';

  @override
  String get breastExamCrackedNipple => 'Rissige Brustwarze';

  @override
  String get breastExamDischarge => 'Ausfluss';

  @override
  String get cervixPositionLabel => 'Muttermundposition';

  @override
  String get cervixPositionLow => 'Tief';

  @override
  String get cervixPositionMedium => 'Mittel';

  @override
  String get cervixPositionHigh => 'Hoch';

  @override
  String get cervixOpeningLabel => 'Muttermundöffnung';

  @override
  String get cervixOpeningClosed => 'Geschlossen';

  @override
  String get cervixOpeningMedium => 'Mittel';

  @override
  String get cervixOpeningOpen => 'Offen';

  @override
  String get cervixFirmnessLabel => 'Muttermundfestigkeit';

  @override
  String get cervixFirmnessSoft => 'Weich';

  @override
  String get cervixFirmnessMedium => 'Mittel';

  @override
  String get cervixFirmnessFirm => 'Fest';

  @override
  String get dayLogWaterLabel => 'Wasser';

  @override
  String get dayLogSleepLabel => 'Schlaf';

  @override
  String get dayLogWeightLabel => 'Gewicht';

  @override
  String get dayLogMedicationsLabel => 'Medikament';

  @override
  String get dayLogAddMedication => 'Medikament hinzufügen';

  @override
  String get dayLogMedicationNameHint => 'Name des Medikaments';

  @override
  String get navAssistant => 'Assistentin';

  @override
  String get assistantTitle => 'Vera-Assistentin';

  @override
  String get assistantInputHint => 'Frag etwas über deinen Zyklus…';

  @override
  String get assistantIntro =>
      'Hallo! Ich kann Fragen zu Periode, Zyklus und zur Funktionsweise von Vera beantworten — direkt auf deinem Telefon, nichts verlässt dein Gerät. Ich bin keine Ärztin und das ist kein medizinischer Rat.';

  @override
  String get insightMenstrual3 =>
      'Periodenblut ist kein \"schmutziges Blut\" — es ist eine Mischung aus Blut und Gebärmutterschleimhaut, ein völlig normaler Teil des Zyklus.';

  @override
  String get insightMenstrual4 =>
      'Sanfte Wärme am Unterbauch lindert Krämpfe wirklich — die Wärmflasche ist ein wissenschaftlich belegter Klassiker.';

  @override
  String get insightMenstrual5 =>
      'Die Blutung ist oft in den ersten zwei Tagen am stärksten und lässt dann nach — dieses Muster ist typisch.';

  @override
  String get insightMenstrual6 =>
      'Sich während der Periode etwas müder zu fühlen ist normal — mit dem Menstruationsblut verliert der Körper Eisen.';

  @override
  String get insightFollicular3 =>
      'Östrogen baut die Gebärmutterschleimhaut nach der Periode wieder auf — dein Körper bereitet sich frisch vor.';

  @override
  String get insightFollicular4 =>
      'Die Haut wirkt in dieser Phase oft am klarsten, während sich die Hormone einpendeln.';

  @override
  String get insightFollicular5 =>
      'Ausdauer und Reaktionszeit erreichen bei vielen in der späten Follikelphase ihren Höhepunkt.';

  @override
  String get insightFollicular6 =>
      'Die Länge dieser Phase variiert am stärksten zwischen Personen — die Lutealphase ist deutlich konstanter.';

  @override
  String get insightFertile3 =>
      'Eine Eizelle lebt etwa 12–24 Stunden, Spermien können aber bis zu 5 Tage warten — deshalb umfasst das fruchtbare Fenster mehrere Tage.';

  @override
  String get insightFertile4 =>
      'Um den Eisprung herum wird der Zervixschleim oft klar und dehnbar — wie rohes Eiweiß.';

  @override
  String get insightFertile5 =>
      'Manche spüren beim Eisprung ein kurzes einseitiges Ziehen — es hat sogar einen Namen: Mittelschmerz.';

  @override
  String get insightFertile6 =>
      'Die Basaltemperatur steigt leicht *nach* dem Eisprung — sie bestätigt ihn, statt ihn vorherzusagen.';

  @override
  String get insightLuteal3 =>
      'Progesteron erreicht etwa eine Woche nach dem Eisprung seinen Höhepunkt — Blähbauch und empfindliche Brüste sind dann häufig.';

  @override
  String get insightLuteal4 =>
      'Heißhunger auf Kohlenhydrate vor der Periode ist real — der Energiebedarf steigt in der Lutealphase leicht an.';

  @override
  String get insightLuteal5 =>
      'PMS-Beschwerden lassen meist ein bis zwei Tage nach Einsetzen der Blutung nach.';

  @override
  String get insightLuteal6 =>
      'Eine feste Schlafroutine kann Stimmungstiefs in der späten Lutealphase spürbar abmildern.';

  @override
  String get insightUnknown2 =>
      'Schon drei erfasste Zyklen reichen oft, um dein eigenes Muster zu erkennen.';

  @override
  String get insightUnknown3 =>
      'Zyklen sind individuell — deinen mit dem einer Freundin zu vergleichen bringt selten etwas.';

  @override
  String get insightUnknown4 =>
      'Stress, Reisen und Krankheit können den Eisprung verschieben — eine \"verspätete\" Periode heißt oft nur: später Eisprung.';

  @override
  String get settingsThemeLabel => 'Design';

  @override
  String get settingsThemeSystem => 'System';

  @override
  String get settingsThemeLight => 'Hell';

  @override
  String get settingsThemeDark => 'Dunkel';

  @override
  String get settingsMascotLabel => 'Begleit-Maskottchen';

  @override
  String get mascotDroplet => 'Tröpfchen';

  @override
  String get mascotFlower => 'Blume';

  @override
  String get mascotMoon => 'Mond';

  @override
  String get mascotNone => 'Keins';

  @override
  String homeWindowCountdown(int days) {
    return 'Das vorhergesagte Fenster beginnt in etwa $days Tagen';
  }

  @override
  String homeOvulationCountdown(int days) {
    return 'Geschätzter Eisprung in etwa $days Tagen';
  }

  @override
  String get homeQuickLogTitle => 'Wie fühlt sich dein Körper heute an?';

  @override
  String get actionSave => 'Speichern';

  @override
  String get insightsTrackerHubTitle => 'Deine Tracker';

  @override
  String get trackerHistoryEmpty => 'Noch keine Einträge in diesem Zeitraum';

  @override
  String get rangeFilter1m => '1 Mon.';

  @override
  String get rangeFilter3m => '3 Mon.';

  @override
  String get rangeFilter6m => '6 Mon.';

  @override
  String get dayLogOvulationTestLabel => 'Ovulationstest';

  @override
  String get ovulationTestNegative => 'Negativ';

  @override
  String get ovulationTestPositive => 'Positiv';

  @override
  String get settingsOvulationTestToggle => 'Ovulationstest';

  @override
  String get settingsRemindersOvulationLabel =>
      'Hinweis aufs fruchtbare Fenster';

  @override
  String get reminderOvulationTitle => 'Geschätztes fruchtbares Fenster naht';

  @override
  String get reminderOvulationBody =>
      'Basierend auf deinen Zyklen könnte dein geschätztes fruchtbares Fenster bald beginnen.';

  @override
  String trackerEntriesCount(int count) {
    return '$count Einträge';
  }

  @override
  String get assistantTyping => 'Vera schreibt…';

  @override
  String get premiumTitle => 'Vera Premium';

  @override
  String get premiumHeadline => 'Ein werbefreies Vera';

  @override
  String get premiumSubhead =>
      'Alle Tracking-Funktionen bleiben für immer kostenlos. Premium entfernt lediglich die Werbung und unterstützt die Entwicklung.';

  @override
  String get premiumBenefitNoAds => 'Keine Werbung, nirgendwo in der App';

  @override
  String get premiumBenefitSupport =>
      'Unterstützt eine unabhängige, datenschutzorientierte App';

  @override
  String get premiumBenefitFuture =>
      'Enthält künftige Premium-Komfortfunktionen';

  @override
  String get premiumMonthly => 'Monatlich';

  @override
  String get premiumYearly => 'Jährlich';

  @override
  String get premiumYearlyNote => 'Einmal jährlich abgerechnet';

  @override
  String get premiumSubscribeCta => 'Weiter';

  @override
  String get premiumRestore => 'Kauf wiederherstellen';

  @override
  String get premiumCancelNote =>
      'Jederzeit über dein Store-Konto kündbar. Keine Countdowns, kein Druck — wenn es gerade nicht passt, funktioniert die kostenlose Version genau wie bisher.';

  @override
  String get premiumActiveBadge => 'Premium ist aktiv';

  @override
  String get premiumDevToggle => 'Premium simulieren (Entwicklung)';

  @override
  String get settingsPremiumEntry => 'Vera Premium';

  @override
  String get adTestNotice => 'Testanzeige — noch keine echte Schaltung';

  @override
  String get settingsPregnancyModeLabel => 'Schwangerschaftsmodus';

  @override
  String get pregnancyLmpLabel => 'Erster Tag der letzten Periode';

  @override
  String pregnancyWeekLabel(int weeks, int days) {
    return 'Woche $weeks, Tag $days';
  }

  @override
  String get pregnancyDueDateLabel => 'Voraussichtlicher Geburtstermin';

  @override
  String pregnancyDaysLeft(int days) {
    return 'Noch etwa $days Tage';
  }

  @override
  String pregnancyTrimesterLabel(int n) {
    return 'Trimester $n';
  }

  @override
  String get pregnancyDisclaimer =>
      'Die Termine werden anhand deiner letzten Periode mit der üblichen 280-Tage-Regel geschätzt. Ein Ultraschall liefert ein genaueres Datum, und ein später Eisprung verschiebt diese Zahlen — das ist Information, keine medizinische Betreuung.';

  @override
  String get pregnancyWeeklyNoteTitle => 'Diese Woche';

  @override
  String get pregnancyNeedsLmp =>
      'Füge den ersten Tag deiner letzten Periode hinzu, um zu starten.';

  @override
  String get pregnancyOutOfRange =>
      'Dieses Datum liegt über 42 Wochen zurück — aktualisiere es oder schalte den Schwangerschaftsmodus aus.';

  @override
  String get partnerShareTitle => 'Zusammenfassung mit Partner teilen';

  @override
  String get partnerShareBody =>
      'Erstellt eine kurze Textzusammenfassung — deine aktuelle Phase und dein geschätztes Fenster — die du selbst über eine beliebige App verschickst. Keine Live-Synchronisierung, kein Partnerkonto: Nichts wird geteilt, außer du sendest es.';

  @override
  String get partnerShareCta => 'Zusammenfassung erstellen';

  @override
  String get partnerSummaryHeader => 'Zyklus-Zusammenfassung von Vera';

  @override
  String get settingsHomeThemeLabel => 'Startseiten-Design';

  @override
  String get homeThemeWheat => 'Weizen';

  @override
  String get homeThemeSky => 'Himmel';

  @override
  String get homeThemeField => 'Feld';

  @override
  String get homeThemeBlossom => 'Blüte';

  @override
  String get homeThemePlain => 'Schlicht';

  @override
  String get backupNudgeTitle => 'Bewahre eine Kopie deiner Daten auf';

  @override
  String get backupNudgeBody =>
      'Alles liegt nur auf diesem Telefon. Geht es verloren, kaputt oder wird zurückgesetzt, ist deine Historie weg — ein verschlüsseltes Backup dauert einen Moment und nur du kannst es öffnen.';

  @override
  String get backupNudgeCta => 'Jetzt sichern';

  @override
  String get backupNudgeDismiss => 'Später';

  @override
  String backupLastDone(String date) {
    return 'Letztes Backup: $date';
  }

  @override
  String get backupNever => 'Noch kein Backup';

  @override
  String get settingsRemindersBackupLabel => 'Ans Backup erinnern';

  @override
  String get reminderBackupTitle => 'Zeit für ein Vera-Backup';

  @override
  String get reminderBackupBody =>
      'Deine Historie existiert nur auf diesem Telefon. Ein schnelles verschlüsseltes Backup schützt sie.';

  @override
  String get calendarDayDetailTitle => 'Dieser Tag';

  @override
  String get calendarDayNothingLogged => 'Für diesen Tag noch nichts erfasst';

  @override
  String get calendarDayOpenLog => 'Tagesprotokoll öffnen';

  @override
  String get cycleHistoryTitle => 'Frühere Zyklen';

  @override
  String get cycleHistoryEmpty =>
      'Erfasse ein paar Perioden, dann erscheint hier deine Historie.';

  @override
  String get cycleHistoryOngoing => 'Läuft';

  @override
  String cycleHistoryLength(int days) {
    return '$days-Tage-Zyklus';
  }

  @override
  String cycleHistoryPeriodLength(int days) {
    return '$days Tage Blutung';
  }

  @override
  String cycleHistoryVsAverage(String diff) {
    return '$diff gegenüber deinem Durchschnitt';
  }

  @override
  String get insightsCycleHistoryEntry => 'Frühere Zyklen';
}
