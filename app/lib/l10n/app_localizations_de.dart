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
  String get actionClear => 'Löschen';

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
  String get lockScreenUseFaceId => 'Face ID verwenden';

  @override
  String get lockScreenUseFingerprint => 'Fingerabdruck verwenden';

  @override
  String get lockScreenForgotPin => 'PIN vergessen?';

  @override
  String get lockScreenForgotPinChoiceTitle =>
      'Wie möchtest du ihn zurücksetzen?';

  @override
  String get lockScreenResetViaDevice => 'Mit diesem Gerät bestätigen';

  @override
  String get lockScreenResetViaDeviceBody =>
      'Deine Daten bleiben erhalten. Eine Bestätigung mit der eigenen Displaysperre des Telefons – Face ID, Fingerabdruck oder Code – genügt.';

  @override
  String get lockScreenResetViaDeviceReason =>
      'Zum Festlegen einer neuen PIN bestätigen';

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
      'Deine Zyklusdaten bleiben verschlüsselt nur auf diesem Gerät. Kein Konto, keine Cloud-Synchronisierung — nichts, was du erfasst, wird hochgeladen. Der Schlüssel liegt in der sicheren Hardware deines Handys, und du kannst alles jederzeit exportieren oder löschen.';

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
  String get onboardingBirthYearTitle => 'In welchem Jahr bist du geboren?';

  @override
  String get onboardingBirthYearBody =>
      'Nur für ein vollständigeres Bild — fließt nie in eine Vorhersage ein.';

  @override
  String get onboardingPmsTitle => 'Zeigt sich vorher meist etwas?';

  @override
  String get onboardingPmsBody =>
      'Wähle so viele wie zutreffen. Wird nirgends gespeichert, es gibt keine falsche Antwort.';

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
  String get navReminders => 'Erinnerungen';

  @override
  String get navProfile => 'Profil';

  @override
  String get navTrack => 'Erfassen';

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
  String get symptomMigraine => 'Migräne';

  @override
  String get symptomHighFever => 'Hohes Fieber';

  @override
  String get symptomNeckPain => 'Nackenschmerzen';

  @override
  String get symptomShoulderPain => 'Schulterschmerzen';

  @override
  String get symptomLimbPain => 'Gliederschmerzen';

  @override
  String get symptomMuscleAche => 'Muskelschmerzen';

  @override
  String get symptomChills => 'Schüttelfrost';

  @override
  String get symptomNightSweats => 'Nachtschweiß';

  @override
  String get symptomHotFlashes => 'Hitzewallungen';

  @override
  String get symptomWeightGain => 'Gewichtszunahme';

  @override
  String get symptomConstipation => 'Verstopfung';

  @override
  String get symptomDiarrhea => 'Durchfall';

  @override
  String get symptomIndigestion => 'Verdauungsstörung';

  @override
  String get symptomGasPain => 'Blähungsschmerzen';

  @override
  String get symptomFeelingUnwell => 'Unwohlsein';

  @override
  String get symptomItching => 'Juckreiz';

  @override
  String get symptomTroubleFocusing => 'Konzentrationsschwierigkeiten';

  @override
  String get symptomForgetfulness => 'Vergesslichkeit';

  @override
  String get symptomGroupHead => 'Kopf';

  @override
  String get symptomGroupBody => 'Körper';

  @override
  String get symptomGroupAbdomen => 'Bauch';

  @override
  String get symptomGroupGeneral => 'Allgemein';

  @override
  String get symptomGroupCognitive => 'Kognitiv';

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
  String get moodExcited => 'Aufgeregt';

  @override
  String get moodHopeful => 'Hoffnungsvoll';

  @override
  String get moodProud => 'Stolz';

  @override
  String get moodDisappointed => 'Enttäuscht';

  @override
  String get moodConfident => 'Selbstbewusst';

  @override
  String get moodSurprised => 'Überrascht';

  @override
  String get moodIndifferent => 'Gleichgültig';

  @override
  String get moodPeaceful => 'Friedlich';

  @override
  String get moodInLove => 'Verliebt';

  @override
  String get moodShy => 'Schüchtern';

  @override
  String get moodPlayful => 'Verspielt';

  @override
  String get moodExhausted => 'Erschöpft';

  @override
  String get moodLonely => 'Einsam';

  @override
  String get moodOverwhelmed => 'Überfordert';

  @override
  String get moodGrateful => 'Dankbar';

  @override
  String get moodNostalgic => 'Nostalgisch';

  @override
  String get dayLogNoteLabel => 'Notiz';

  @override
  String get dayLogNoteHint => 'Alles, was du dir über heute merken möchtest';

  @override
  String get dayLogOptionalTrackersLabel => 'Optionale Tracker';

  @override
  String get dayLogSexualActivityLabel => 'Sexuelle Aktivität';

  @override
  String get sexLifeNone => 'Nichts';

  @override
  String get sexLifeUnprotected => 'Ungeschützter Sex';

  @override
  String get sexLifeProtected => 'Geschützter Sex';

  @override
  String get sexLifeMasturbation => 'Masturbation';

  @override
  String get sexLifeNoOrgasm => 'Kein Orgasmus';

  @override
  String get sexLifeOrgasm => 'Orgasmus';

  @override
  String get sexLifeHighDesire => 'Viel Lust';

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
      other: 'Schwankt um etwa $daysString Tage',
      one: 'Schwankt um etwa $daysString Tag',
    );
    return '$_temp0';
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
  String get tourSkip => 'Überspringen';

  @override
  String get tourNext => 'Weiter';

  @override
  String get tourStart => 'Los geht\'s';

  @override
  String get tourHomeTitle => 'Start';

  @override
  String get tourHomeBody =>
      'Sieh auf einen Blick, wo du heute stehst — dein Zyklustag, wie lange bis zu deinem geschätzten Fenster und dein Begleiter sind immer hier.';

  @override
  String get tourCalendarTitle => 'Kalender';

  @override
  String get tourCalendarBody =>
      'Sieh deine vergangenen und kommenden Zyklen im Kalender. Tippe auf einen Tag, um seinen Eintrag zu öffnen.';

  @override
  String get tourTrackTitle => 'Eintragen';

  @override
  String get tourTrackBody =>
      'Der +-Button in der Mitte öffnet von überall den heutigen Eintrag — Blutung, Symptome, Stimmung und mehr.';

  @override
  String get tourRemindersTitle => 'Erinnerungen';

  @override
  String get tourRemindersBody =>
      'Stelle Erinnerungen für deine bevorstehende Periode, Medikamente oder Wasser trinken ein — alles bleibt auf deinem Handy und geht nirgendwohin.';

  @override
  String get tourProfileTitle => 'Profil';

  @override
  String get tourProfileBody =>
      'Finde hier deine Auswertungen, alles, was du trackst, und deine Einstellungen.';

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
  String get remindersScreenTitle => 'Erinnerungen';

  @override
  String get reminderDetailNotification => 'Benachrichtigung';

  @override
  String get reminderDetailAlert => 'Erinnerung';

  @override
  String get reminderDetailAlertToday => 'Am selben Tag';

  @override
  String get reminderDetailTime => 'Zeit';

  @override
  String get reminderDetailMessage => 'Nachricht';

  @override
  String get reminderDetailMessageEditTitle => 'Nachricht bearbeiten';

  @override
  String get reminderDetailMessageHint => 'Schreib deine eigene Nachricht';

  @override
  String reminderDetailAlertDaysBefore(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Tage früher',
      one: '$count Tag früher',
    );
    return '$_temp0';
  }

  @override
  String optionsShowMore(int count) {
    return '+$count weitere';
  }

  @override
  String get optionsShowLess => 'Weniger anzeigen';

  @override
  String get trackerHistoryEntry => 'Verlauf';

  @override
  String get actionSend => 'Senden';

  @override
  String get actionRemove => 'Entfernen';

  @override
  String get feedbackEntry => 'Feedback';

  @override
  String get cloudBackupEntry => 'Mit Konto sichern';

  @override
  String get cloudBackupTitle => 'Mit Konto sichern';

  @override
  String get cloudBackupNotConfiguredTitle =>
      'In dieser Version noch nicht verfügbar';

  @override
  String get cloudBackupNotConfiguredBody =>
      'Die Cloud-Sicherung benötigt einen Kontodienst, der für diese Version noch nicht eingerichtet ist. Bis dahin kann hier nichts genutzt werden.';

  @override
  String get cloudBackupIntro1Title => 'Verliere nie deine Historie';

  @override
  String get cloudBackupIntro1Body =>
      'Deine Zyklushistorie bleibt sicher, auch wenn du dein Telefon verlierst oder ein neues bekommst.';

  @override
  String get cloudBackupIntro2Title => 'Nur du kannst sie öffnen';

  @override
  String get cloudBackupIntro2Body =>
      'Deine Sicherung wird mit einem Passwort verschlüsselt, bevor sie dein Telefon verlässt — wir können sie nicht lesen, niemand sonst auch nicht.';

  @override
  String get cloudBackupIntro3Title => 'In Sekunden wiederherstellen';

  @override
  String get cloudBackupIntro3Body =>
      'Melde dich auf einem neuen Gerät an und hole deine Historie mit demselben Passwort zurück.';

  @override
  String get cloudBackupSignedInTitle => 'Angemeldet';

  @override
  String get cloudBackupUploadButton => 'Jetzt sichern';

  @override
  String get cloudBackupDownloadButton => 'Aus der Cloud wiederherstellen';

  @override
  String get cloudBackupUploadSuccess => 'In deinem Konto gesichert';

  @override
  String get cloudBackupNoBackupFound =>
      'Für dieses Konto wurde noch keine Cloud-Sicherung gefunden.';

  @override
  String get partnerModeEntry => 'Partnermodus';

  @override
  String get partnerModeTitle => 'Partnermodus';

  @override
  String get partnerModeNotConfiguredTitle =>
      'In dieser Version noch nicht verfügbar';

  @override
  String get partnerModeNotConfiguredBody =>
      'Der Partnermodus benötigt einen Kontodienst, der für diese Version noch nicht eingerichtet ist. Bis dahin kann hier nichts genutzt werden.';

  @override
  String get partnerModeHeroTitle => 'Teile ein wenig, zu deinen Bedingungen';

  @override
  String get partnerModeHeroBody =>
      'Verbinde dich mit deiner Partnerin oder deinem Partner und teile nur das, was du unten aktivierst — nie deine gesamte Historie, nie automatisch.';

  @override
  String get partnerModeSignInGoogle => 'Mit Google fortfahren';

  @override
  String get partnerModeSignInApple => 'Mit Apple fortfahren';

  @override
  String get partnerModeFaqTitle => 'Bevor du dich anmeldest';

  @override
  String get partnerModeFaq1Q => 'Was sieht mein Partner wirklich?';

  @override
  String get partnerModeFaq1A =>
      'Nur die Felder, die du im Partnermodus aktivierst, und nur deinen aktuellen Stand — nie deine gespeicherte Historie und nie etwas, das du nicht ausdrücklich geteilt hast.';

  @override
  String get partnerModeFaq2Q => 'Kann ich das später wieder ausschalten?';

  @override
  String get partnerModeFaq2A =>
      'Ja. Das Trennen beendet das Teilen sofort für euch beide, und du kannst jederzeit einzelne Schalter ausschalten, ohne die Verbindung zu trennen.';

  @override
  String get partnerModeFaq3Q => 'Braucht mein Partner diese App?';

  @override
  String get partnerModeFaq3A =>
      'Ja — er meldet sich genauso an und verbindet sich mit einem Code, den du ihm schickst.';

  @override
  String get partnerModeNotPairedTitle => 'Noch nicht verbunden';

  @override
  String get partnerModeNotPairedBody =>
      'Lade deinen Partner mit einem einmaligen Code ein oder gib den Code ein, den du bekommen hast.';

  @override
  String get partnerModeInviteButton => 'Partner einladen';

  @override
  String get partnerModeEnterCodeButton => 'Code eingeben';

  @override
  String get partnerModeSignOut => 'Abmelden';

  @override
  String get partnerModePairedTitle => 'Verbunden';

  @override
  String get partnerModePairedBody =>
      'Du und dein Partner seid verbunden. Geteilt wird weiterhin nur, was du unten aktivierst.';

  @override
  String get partnerModeShareSectionTitle => 'Was du teilst';

  @override
  String get partnerModeShareCyclePhase => 'Zyklusphase und -tag';

  @override
  String get partnerModeShareMood => 'Heutige Stimmung';

  @override
  String get partnerModeShareSymptoms => 'Heutige Symptome';

  @override
  String get partnerModeShareHighDesire => 'Verlangen nach Nähe heute';

  @override
  String get partnerModeShareNow => 'Jetzt teilen';

  @override
  String get partnerModeShareSuccess => 'Mit deinem Partner geteilt';

  @override
  String get partnerModeUnpair => 'Verbindung trennen';

  @override
  String get partnerModeUnpairConfirmTitle =>
      'Verbindung zu deinem Partner trennen?';

  @override
  String get partnerModeUnpairConfirmBody =>
      'Das beendet das Teilen sofort für euch beide. Ihr könnt euch später mit einem neuen Code wieder verbinden.';

  @override
  String get partnerModePartnerSnapshotEmpty =>
      'Dein Partner hat noch nichts geteilt.';

  @override
  String get partnerModeErrorNotConfigured =>
      'Der Partnermodus ist in dieser Version noch nicht eingerichtet.';

  @override
  String get partnerModeErrorCodeNotFound =>
      'Dieser Code wurde nicht gefunden. Prüfe ihn und versuche es erneut.';

  @override
  String get partnerModeErrorCodeExpired =>
      'Dieser Code ist abgelaufen. Bitte um einen neuen.';

  @override
  String get partnerModeErrorCodeIsOwn =>
      'Das ist dein eigener Code — bitte deinen Partner um seinen.';

  @override
  String get partnerModeErrorNotSignedIn => 'Melde dich zuerst an.';

  @override
  String get partnerModeErrorUnknown =>
      'Etwas ist schiefgelaufen. Bitte versuche es erneut.';

  @override
  String get partnerModeInviteTitle => 'Partner einladen';

  @override
  String get partnerModeInviteBody =>
      'Schicke diesen Code an deinen Partner. Er gibt ihn in seiner eigenen App ein, um sich mit dir zu verbinden.';

  @override
  String get partnerModeInviteExpiry => '7 Tage gültig';

  @override
  String get partnerModeInviteShare => 'Code teilen';

  @override
  String partnerModeInviteMessage(String code) {
    return 'Hier ist mein Vera-Verbindungscode: $code';
  }

  @override
  String get partnerModeEnterTitle => 'Code eingeben';

  @override
  String get partnerModeEnterBody =>
      'Gib den Code ein, den dein Partner dir geschickt hat.';

  @override
  String get partnerModeEnterHint => '6-stelliger Code';

  @override
  String get partnerModeEnterSubmit => 'Verbinden';

  @override
  String get homeInvitePartnerTitle => 'Mit deinem Partner teilen';

  @override
  String get homeInvitePartnerBody =>
      'Verbindet euch und teile nur, was du auswählst — deine Historie bleibt deine eigene.';

  @override
  String get homeInvitePartnerCta => 'Partnermodus einrichten';

  @override
  String get feedbackTitle => 'Was hat dir nicht gefallen?';

  @override
  String get feedbackSubtitle => 'Wähle ein Thema und schreib gern mehr dazu.';

  @override
  String get feedbackCategoryPredictions => 'Vorhersagen';

  @override
  String get feedbackCategoryBackup => 'Sichern & wiederherstellen';

  @override
  String get feedbackCategorySubscription => 'Abo';

  @override
  String get feedbackCategoryAds => 'Werbung';

  @override
  String get feedbackCategoryDesign => 'Design';

  @override
  String get feedbackCategoryTranslation => 'Übersetzung';

  @override
  String get feedbackCategoryOther => 'Sonstiges';

  @override
  String get feedbackDescriptionLabel => 'Erzähl uns mehr (optional)';

  @override
  String get feedbackDescriptionHint =>
      'Was ist passiert? Beim Tippen auf Senden wählst du selbst, wo du es teilst — deine Mail-App oder woanders.';

  @override
  String get feedbackAttachPhoto => 'Foto hinzufügen';

  @override
  String get feedbackPhotoAttached => 'Foto angehängt';

  @override
  String get remindersGroupCycle => 'Periode & Fruchtbarkeit';

  @override
  String get remindersGroupMedication => 'Medikamente';

  @override
  String get remindersGroupLifestyle => 'Alltag';

  @override
  String get remindersGroupAppointment => 'Arzttermine';

  @override
  String get settingsRemindersPeriodEndLabel =>
      'Erinnern, wenn meine Periode enden sollte';

  @override
  String get settingsRemindersMedicationLabel => 'Medikamentenerinnerung';

  @override
  String get settingsRemindersWaterLabel => 'Trinkerinnerung';

  @override
  String get settingsRemindersAppointmentLabel => 'Erinnerung an Arzttermin';

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
  String get settingsRateEntry => 'Bewerte uns';

  @override
  String get rateAppTitle => 'Hilft dir Vera?';

  @override
  String get rateAppBody =>
      'Wenn ja, hilft eine kurze Bewertung im Store anderen, die etwas wie Vera suchen, es überhaupt zu finden.';

  @override
  String get rateAppCta => 'Vera bewerten';

  @override
  String get rateAppDismiss => 'Nicht jetzt';

  @override
  String get settingsDeleteAllData => 'Alle Daten löschen';

  @override
  String get privacyScreenTitle => 'Datenschutz';

  @override
  String get privacyScreenIntro =>
      'Hier erfährst du in einfacher Sprache genau, was mit deinen Daten passiert.';

  @override
  String get privacyScreenStorageTitle => 'Auf diesem Gerät verschlüsselt';

  @override
  String get privacyScreenNoNetworkTitle => 'Kein Server, kein Konto';

  @override
  String get privacyScreenNoThirdPartyTitle => 'Kein Tracking';

  @override
  String get privacyScreenExportTitle => 'Export nur durch dich';

  @override
  String get privacyScreenDeleteTitle => 'Löschen ist endgültig';

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
  String get reminderAppointmentTitle => 'Bevorstehender Arzttermin';

  @override
  String get reminderAppointmentBody => 'Du hast bald einen Arzttermin.';

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
  String get dayLogBirthControlLabel => 'Verhütung';

  @override
  String get dayLogOtherMedicationsLabel => 'Andere Medikamente';

  @override
  String get birthControlPillTaken => 'Pille genommen';

  @override
  String get birthControlPillLate => 'Pille zu spät genommen';

  @override
  String get birthControlPillMissed => 'Pille vergessen';

  @override
  String get birthControlPatch => 'Pflaster';

  @override
  String get birthControlRing => 'Ring';

  @override
  String get birthControlInjection => 'Spritze';

  @override
  String get birthControlImplant => 'Implantat';

  @override
  String get birthControlIud => 'Spirale';

  @override
  String get navAssistant => 'Assistentin';

  @override
  String get assistantTitle => 'Vera-Assistentin';

  @override
  String get assistantEndChatTitle => 'Diesen Chat beenden?';

  @override
  String get assistantEndChatBody =>
      'Die Nachrichten liegen nur im Arbeitsspeicher und werden nirgends gespeichert, also lassen sie sich nicht zurückholen.';

  @override
  String get assistantEndChatConfirm => 'Chat beenden';

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
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: 'Das vorhergesagte Fenster beginnt in etwa $days Tagen',
      one: 'Das vorhergesagte Fenster beginnt in etwa $days Tag',
    );
    return '$_temp0';
  }

  @override
  String homeOvulationCountdown(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: 'Geschätzter Eisprung in etwa $days Tagen',
      one: 'Geschätzter Eisprung in etwa $days Tag',
    );
    return '$_temp0';
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
  String get trackerStatAverage => 'Durchschnitt';

  @override
  String get trackerStatLowest => 'Niedrigster';

  @override
  String get trackerStatHighest => 'Höchster';

  @override
  String get trackerStatLatest => 'Letzter';

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
  String get ovulationTestLow => 'Niedrig';

  @override
  String get ovulationTestHigh => 'Hoch';

  @override
  String get ovulationTestPeak => 'Höhepunkt';

  @override
  String get pregnancyTestLabel => 'Schwangerschaftstest';

  @override
  String get pregnancyTestPositive => 'Positiv';

  @override
  String get pregnancyTestFaint => 'Schwache Linie';

  @override
  String get pregnancyTestNegative => 'Negativ';

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
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Einträge',
      one: '$count Eintrag',
    );
    return '$_temp0';
  }

  @override
  String get trackerLowSampleNote =>
      'Bei so wenigen Einträgen sind Prozentwerte noch nicht aussagekräftig — sie werden genauer, je mehr du protokollierst.';

  @override
  String get assistantTyping => 'Vera schreibt…';

  @override
  String get premiumTitle => 'Vera Premium';

  @override
  String get premiumHeadline => 'Vera Premium';

  @override
  String get premiumSubhead =>
      'Alle Tracking-Funktionen bleiben für immer kostenlos — dein Verlauf wird nie weggesperrt. Premium ergänzt eigene Tracker, tiefere Auswertungen, eigene Erinnerungen und zusätzliche Looks und entfernt die Werbung.';

  @override
  String get premiumBenefitNoAds => 'Keine Werbung, nirgendwo in der App';

  @override
  String get premiumBenefitSupport =>
      'Unterstützt eine unabhängige, datenschutzorientierte App';

  @override
  String get premiumMonthly => 'Monatlich';

  @override
  String get premiumYearly => 'Jährlich';

  @override
  String get premiumYearlyNote => 'Einmal jährlich abgerechnet';

  @override
  String premiumPerMonth(String price) {
    return '$price / Monat';
  }

  @override
  String get premiumBilledMonthly => 'Monatliche Abrechnung';

  @override
  String get premiumStaysFreeTitle => 'Was kostenlos bleibt';

  @override
  String get premiumStaysFreeBody =>
      'Kalender, gesamter Verlauf, Basisstatistiken und Export bleiben für immer kostenlos. Premium fügt etwas hinzu und nimmt nie etwas weg.';

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
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: 'Noch etwa $days Tage',
      one: 'Noch etwa $days Tag',
    );
    return '$_temp0';
  }

  @override
  String pregnancyTrimesterLabel(int n) {
    return 'Trimester $n';
  }

  @override
  String get pregnancyDisclaimer =>
      'Die Termine werden anhand deiner letzten Periode mit der üblichen 280-Tage-Regel geschätzt. Ein Ultraschall liefert ein genaueres Datum, und ein später Eisprung verschiebt diese Zahlen — das ist Information, keine medizinische Betreuung.';

  @override
  String get pregnancySizeLabel => 'Größe deines Babys';

  @override
  String get pregnancySizeUnder5 => 'Mohnsamen (~2 mm)';

  @override
  String get pregnancySizeUnder9 => 'Heidelbeere (~1.6 cm)';

  @override
  String get pregnancySizeUnder13 => 'Limette (~5.4 cm)';

  @override
  String get pregnancySizeUnder20 => 'Avocado (~11.6 cm)';

  @override
  String get pregnancySizeUnder28 => 'Mango (~30 cm)';

  @override
  String get pregnancySizeUnder34 => 'Ananas (~44 cm)';

  @override
  String get pregnancySizeUnder38 => 'Honigmelone (~46 cm)';

  @override
  String get pregnancySizeTerm => 'Kleine Wassermelone (~51 cm)';

  @override
  String get pregnancyNoteUnder5 =>
      'Die meisten merken jetzt noch nichts — weil das Schwangerschaftsalter ab der letzten Periode gezählt wird, liegen die ersten zwei Wochen tatsächlich vor der Empfängnis.';

  @override
  String get pregnancyNoteUnder9 =>
      'Übelkeit, Brustspannen und Müdigkeit sind in diesen Wochen häufig. Ein guter Zeitpunkt, um einen ersten Termin zu vereinbaren.';

  @override
  String get pregnancyNoteUnder13 =>
      'Das Ende des ersten Trimesters rückt näher; bei vielen lässt die Übelkeit um diese Zeit nach.';

  @override
  String get pregnancyNoteUnder20 =>
      'Die Energie kehrt in dieser Phase oft zurück. Erste Bewegungen können irgendwann zwischen Woche 16 und 22 spürbar werden.';

  @override
  String get pregnancyNoteUnder28 =>
      'Die Bewegungen werden deutlicher und folgen allmählich einem Muster. Rückenschmerzen und Sodbrennen sind in dieser Phase häufig.';

  @override
  String get pregnancyNoteUnder34 =>
      'Du bist im dritten Trimester. Kurzatmigkeit, häufiger Harndrang und Braxton-Hicks-Kontraktionen sind häufig.';

  @override
  String get pregnancyNoteUnder38 =>
      'Das Baby bereitet sich auf die Geburt vor. Ein guter Zeitpunkt für Kliniktasche und Geburtsplan.';

  @override
  String get pregnancyNoteTerm =>
      'Die Schwangerschaft ist jetzt am Termin — die Geburt kann jederzeit zwischen Woche 37 und 42 stattfinden; Woche 40 ist ein Durchschnittswert, keine Frist.';

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
  String get settingsHomeThemeLabel => 'Startbildschirm-Hintergrund';

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
  String get notificationChannelPeriodStart => 'Bevorstehende Periode';

  @override
  String get notificationChannelPeriodEnd => 'Nachfrage zum Periodenende';

  @override
  String get notificationChannelMedication => 'Medikament';

  @override
  String get notificationChannelWater => 'Trinken';

  @override
  String get notificationChannelAppointment => 'Termin';

  @override
  String get notificationChannelOvulation => 'Fruchtbares Fenster';

  @override
  String get notificationChannelBackup => 'Backup-Erinnerung';

  @override
  String get calendarDayDetailTitle => 'Dieser Tag';

  @override
  String get calendarDayNothingLogged => 'Für diesen Tag noch nichts erfasst';

  @override
  String get calendarDayOpenLog => 'Tagesprotokoll öffnen';

  @override
  String get cycleHistoryTitle => 'Frühere Zyklen';

  @override
  String get cycleTrendsTitle => 'Zyklusverlauf';

  @override
  String get cycleHistoryEmpty =>
      'Erfasse ein paar Perioden, dann erscheint hier deine Historie.';

  @override
  String get cycleHistoryOngoing => 'Läuft';

  @override
  String cycleHistoryLength(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days-Tage-Zyklus',
      one: '$days-Tages-Zyklus',
    );
    return '$_temp0';
  }

  @override
  String cycleHistoryPeriodLength(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: 'Periode dauerte $days Tage',
      one: 'Periode dauerte 1 Tag',
    );
    return '$_temp0';
  }

  @override
  String cycleHistoryVsAverage(String diff) {
    return '$diff gegenüber deinem Durchschnitt';
  }

  @override
  String get insightsCycleHistoryEntry => 'Frühere Zyklen';

  @override
  String get homeEmptyTitle => 'Beginnen wir mit deiner letzten Periode';

  @override
  String get homeEmptyBody =>
      'Tippe am Tag deines Periodenbeginns auf den Button oben. Nach zwei vollständigen Zyklen kann Vera schätzen — bis dahin tut sie nicht so, als wüsste sie es.';

  @override
  String get homeEmptyBackdate => 'Sie hat schon früher begonnen';

  @override
  String get settingsAdPrivacyEntry => 'Datenschutzoptionen für Werbung';

  @override
  String a11yCycleRing(int day, int length) {
    return 'Tag $day von etwa $length';
  }

  @override
  String a11yChartSummary(int count, String min, String max) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Diagramm mit $count Einträgen, von $min bis $max',
      one: 'Diagramm mit $count Eintrag, von $min bis $max',
    );
    return '$_temp0';
  }

  @override
  String a11yPhaseBar(int day, int length) {
    return 'Zyklusfortschritt: Tag $day von etwa $length';
  }

  @override
  String a11yFrequencyItem(String label, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Mal',
      one: '$count Mal',
    );
    return '$label: $_temp0';
  }

  @override
  String get importTitle => 'Aus anderer App importieren';

  @override
  String get importBody =>
      'Exportiere deine Historie aus deiner alten App als CSV und wähle die Datei hier. Nur Datum und Blutungsstärke werden importiert — Symptom- und Stimmungsbegriffe unterscheiden sich zwischen Apps, und Vera rät nicht.';

  @override
  String get importPickFile => 'CSV-Datei wählen';

  @override
  String importPreview(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Tage Historie gefunden',
      one: '$count Tag Historie gefunden',
    );
    return '$_temp0';
  }

  @override
  String importSkipped(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Zeilen konnten nicht gelesen werden und bleiben außen vor',
      one: '$count Zeile konnte nicht gelesen werden und bleibt außen vor',
    );
    return '$_temp0';
  }

  @override
  String get importConfirm => 'Zu meiner Historie hinzufügen';

  @override
  String get importMergeNote =>
      'Importierte Tage werden zusammengeführt. Bereits in Vera erfasste Tage bleiben unverändert.';

  @override
  String importDone(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Tage importiert',
      one: '$count Tag importiert',
    );
    return '$_temp0';
  }

  @override
  String get importErrorEmpty => 'Diese Datei scheint leer zu sein.';

  @override
  String get importErrorNoDate =>
      'In dieser Datei wurde keine Datumsspalte gefunden.';

  @override
  String get settingsImportEntry => 'Aus anderer App importieren';

  @override
  String get settingsHealthSyncLabel =>
      'Mit Apple Health / Health Connect synchronisieren';

  @override
  String get settingsHealthSyncBody =>
      'Schreibt nur Blutungsstärke, Gewicht und Basaltemperatur in die Health-App deines Telefons. Symptome, Stimmungen und Notizen bleiben in Vera. Es wird nichts zurückgelesen.';

  @override
  String healthSyncBackfilled(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Tage an deine Health-App gesendet',
      one: '$count Tag an deine Health-App gesendet',
    );
    return '$_temp0';
  }

  @override
  String get healthSyncDenied =>
      'Die Berechtigung wurde nicht erteilt, die Synchronisierung bleibt aus.';

  @override
  String get settingsDiagnosticsEntry => 'Diagnose';

  @override
  String get diagnosticsBody =>
      'Wenn die App sich falsch verhält, werden technische Details hier aufgezeichnet — nur auf diesem Gerät. Nichts wird gesendet, außer du entscheidest dich dafür, und du kannst vorher genau lesen, was du senden würdest.';

  @override
  String get diagnosticsEmpty =>
      'Nichts aufgezeichnet — es wurden keine Probleme festgestellt.';

  @override
  String get diagnosticsShare => 'An die Entwickler senden';

  @override
  String get diagnosticsClear => 'Löschen';

  @override
  String get diagnosticsNoteLabel => 'Was ist passiert? (optional)';

  @override
  String get diagnosticsTechnicalDetail => 'Technische Details';

  @override
  String get unitHoursShort => 'Std';

  @override
  String get unitMinutesShort => 'Min';

  @override
  String get unitHoursLong => 'Stunden';

  @override
  String get unitMinutesLong => 'Minuten';

  @override
  String get unitMilliliters => 'ml';

  @override
  String get unitKilograms => 'kg';

  @override
  String get calendarJumpTitle => 'Zu Monat springen';

  @override
  String get calendarJumpYearLabel => 'Jahr';

  @override
  String get settingsAdPrivacyUnavailable =>
      'In deiner Region werden keine Auswahlmöglichkeiten zur Werbepersonalisierung angeboten — die Werbung hier ist ohnehin nicht personalisiert.';

  @override
  String get settingsGroupAppearance => 'Darstellung';

  @override
  String get settingsGroupTracking => 'Tracking-Einstellungen';

  @override
  String get dayLogCustomTagsLabel => 'Meine eigenen Tracker';

  @override
  String get customTagAddButton => 'Tracker hinzufügen';

  @override
  String get customTagDialogTitle => 'Neuer Tracker';

  @override
  String get customTagDialogHint => 'z. B. Migräne, Sport, Schlaflosigkeit';

  @override
  String get customTagManageEntry => 'Meine Tracker verwalten';

  @override
  String get customTagRenameTitle => 'Tracker umbenennen';

  @override
  String get customTagDeleteTitle => 'Diesen Tracker löschen?';

  @override
  String get customTagDeleteBody =>
      'Er wird von jedem Tag entfernt, an dem du ihn genutzt hast. Deine übrigen Einträge bleiben unverändert.';

  @override
  String get customTagEmpty => 'Noch keine eigenen Tracker.';

  @override
  String get premiumLockedTitle => 'Premium-Funktion';

  @override
  String get premiumLockedAction => 'Premium ansehen';

  @override
  String get premiumBenefitCustomTrackers =>
      'Verfolge alles, was du willst — in deinen Worten';

  @override
  String get premiumBenefitAdvancedInsights =>
      'Erweiterte Auswertungen: was wann passiert';

  @override
  String get premiumBenefitPersonalisation =>
      'Zusätzliche Hintergründe und Begleiter';

  @override
  String get premiumBenefitAdvancedReminders =>
      'Erinnerungen nach deinem eigenen Rhythmus';

  @override
  String get advancedInsightsTitle => 'Erweiterte Auswertungen';

  @override
  String get advancedInsightsEntry => 'Erweiterte Auswertungen';

  @override
  String get advancedInsightsNotEnough =>
      'Erfasse drei vollständige Zyklen, dann erscheinen deine Muster hier. Bei weniger wäre jedes „Muster\" reiner Zufall.';

  @override
  String get advancedInsightsPatternsTitle =>
      'Wann etwas typischerweise auftritt';

  @override
  String advancedInsightsPatternLine(String label, String segment) {
    return '$label — meist $segment';
  }

  @override
  String advancedInsightsPatternDetail(int count, int day) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Tage erfasst, etwa an Zyklustag $day',
      one: '$count Tag erfasst, etwa an Zyklustag $day',
    );
    return '$_temp0';
  }

  @override
  String advancedInsightsNoPattern(String label) {
    return '$label — noch kein klarer Zeitpunkt';
  }

  @override
  String get advancedInsightsTrendTitle => 'Zykluslänge im Verlauf';

  @override
  String advancedInsightsDriftLonger(String days, String cycles) {
    return 'Verglichen mit deinen ersten $cycles Zyklen sind deine letzten $cycles etwa $days Tage länger.';
  }

  @override
  String advancedInsightsDriftShorter(String days, String cycles) {
    return 'Verglichen mit deinen ersten $cycles Zyklen sind deine letzten $cycles etwa $days Tage kürzer.';
  }

  @override
  String advancedInsightsDriftStable(String cycles) {
    return 'Verglichen mit deinen ersten $cycles Zyklen und deinen letzten $cycles ist deine Zykluslänge etwa gleich geblieben.';
  }

  @override
  String get advancedInsightsDriftNotEnough =>
      'Sobald du sechs vollständige Zyklen hast, können wir deine frühesten mit deinen neuesten vergleichen und sehen, ob sich deine Zykluslänge verändert.';

  @override
  String get advancedInsightsMoodTitle => 'Stimmung nach Zyklusabschnitt';

  @override
  String get advancedInsightsDisclaimer =>
      'Das sind Zählungen dessen, was du erfasst hast — mehr nicht. Keine Diagnose, und ein Muster hier ist keine Ursache.';

  @override
  String get segmentPeriod => 'während deiner Periode';

  @override
  String get segmentAfterPeriod => 'nach deiner Periode';

  @override
  String get segmentMidCycle => 'in der Zyklusmitte';

  @override
  String get segmentBeforePeriod => 'vor deiner Periode';

  @override
  String get customRemindersEntry => 'Meine eigenen Erinnerungen';

  @override
  String get customRemindersTitle => 'Meine eigenen Erinnerungen';

  @override
  String get customRemindersEmpty => 'Noch keine eigenen Erinnerungen.';

  @override
  String get customRemindersAdd => 'Erinnerung hinzufügen';

  @override
  String get customReminderLabelHint => 'z. B. Pille nehmen, Wasser trinken';

  @override
  String get customReminderLockScreenNote =>
      'Der Text erscheint auf deinem Sperrbildschirm — formuliere ihn so privat, wie du möchtest.';

  @override
  String get customReminderDelete => 'Erinnerung löschen';

  @override
  String get homeThemeDusk => 'Dämmerung';

  @override
  String get homeThemeMeadow => 'Wiese';

  @override
  String get homeThemePetal => 'Blütenblatt';

  @override
  String get homeThemeBloom => 'Blüte';

  @override
  String get homeThemeOcean => 'Ozean';

  @override
  String get homeThemeAutumn => 'Herbst';

  @override
  String get homeThemeNight => 'Nacht';

  @override
  String get mascotStar => 'Stern';

  @override
  String get mascotLeaf => 'Blatt';

  @override
  String get mascotCat => 'Katze';

  @override
  String get mascotRabbit => 'Hase';

  @override
  String get mascotBird => 'Vogel';

  @override
  String get tipDetailWhatsHappening => 'Was gerade in deinem Körper passiert';

  @override
  String get tipDetailGeneralHeading => 'Allgemeine Vorschläge';

  @override
  String get tipDetailDisclaimer =>
      'Das sind allgemeine Informationen, keine persönliche medizinische Beratung. Jeder Körper reagiert anders, und wie du dich tatsächlich fühlst, zählt mehr als alles hier Vorgeschlagene. Wenn dich etwas beunruhigt, sprich mit einer Ärztin oder einem Arzt.';

  @override
  String get phaseExplainerMenstrual =>
      'Du blutest, weil sich die Gebärmutterschleimhaut ablöst. Östrogen und Progesteron sind auf dem tiefsten Stand des Zyklus — deshalb fühlen sich viele Menschen in den ersten Tagen müder und nach innen gekehrt. Die Blutung dauert meist etwa drei bis sieben Tage und ist am Anfang am stärksten. Krämpfe entstehen durch das Zusammenziehen der Gebärmutter, ausgelöst von Prostaglandinen — hormonähnlichen Stoffen, die beim Abbau der Schleimhaut freigesetzt werden. Deshalb kommen bei manchen gleichzeitig Rückenschmerzen oder ein weicher Stuhlgang dazu. Die Blutung kostet außerdem Eisen, was einen Teil der Erschöpfung erklärt. Wärme, Bewegung und Schlaf helfen meist. Wenn der Schutz stündlich durchblutet, die Blutung deutlich länger als eine Woche dauert oder die Schmerzen dich am Alltag hindern, sprich das ärztlich an, statt es auszusitzen.';

  @override
  String get phaseExplainerFollicular =>
      'Nach dem Ende der Blutung steigt Östrogen wieder an. In den Eierstöcken reift eine Gruppe von Follikeln heran, jeder mit einer Eizelle, und in der Regel wird nur eine davon freigesetzt. Östrogen baut die eben abgestoßene Schleimhaut wieder auf, und die meisten merken, wie Energie, Stimmung, Haut und Ausdauer mit zurückkommen. Dies ist auch der Abschnitt, der zwischen Personen und zwischen Monaten am stärksten schwankt — Stress, Krankheit, Reisen und Schlafmangel zeigen sich meist hier, indem sie ihn verlängern oder verkürzen. Genau deshalb ist eine Vorhersage ein Zeitraum und kein Datum: die zweite Zyklushälfte ist ziemlich stabil, diese hier ist die bewegliche.';

  @override
  String get phaseExplainerFertile =>
      'Östrogen ist nahe seinem Höhepunkt, und der Eisprung wird um diese Tage herum erwartet. Ein Anstieg des luteinisierenden Hormons löst die Freisetzung der Eizelle etwa einen bis anderthalb Tage später aus. Die Eizelle selbst überlebt rund 12 bis 24 Stunden, Spermien im fruchtbaren Zervixschleim jedoch mehrere Tage — deshalb wird das Fenster in Tagen gerechnet und nicht in einem Tag. Der Schleim wird typischerweise klar, dehnbar und glitschig, ein wenig wie rohes Eiweiß; manche bemerken mehr Lust, empfindliche Brüste oder ein kurzes einseitiges Ziehen. Die Energie ist oft am höchsten im ganzen Zyklus. Denk daran: dieses Fenster ist eine Schätzung aus deinen eigenen Einträgen, keine Messung — und keine Verhütungsmethode.';

  @override
  String get phaseExplainerLuteal =>
      'Nach dem Eisprung wird aus dem entleerten Follikel der Gelbkörper, der Progesteron bildet und die Schleimhaut stabil hält, falls sich eine Schwangerschaft einnistet. Passiert das nicht, fallen Progesteron und Östrogen stark ab, und die Periode beginnt. Diese Zyklushälfte ist die verlässlichere, meist etwa 12 bis 14 Tage. Progesteron hebt die Ruhetemperatur leicht an — genau das misst ein Basalthermometer — und kann die Verdauung verlangsamen, was einen Teil des Blähgefühls erklärt. Der Abfall am Ende löst bei vielen PMS aus: Spannen in der Brust, Appetitveränderungen, unruhiger Schlaf, Kopfschmerzen und Stimmungsschwankungen, die mit Beginn der Blutung meist nachlassen. Wenn diese Beschwerden in den meisten Monaten Arbeit oder Beziehungen belasten, ist das ärztlich besprechenswert.';

  @override
  String get phaseExplainerUnknown =>
      'Es ist noch nicht genug eingetragen, um zu sagen, in welcher Phase du bist. Vera braucht mindestens zwei vollständige Zyklen — einen Periodenbeginn und dann den nächsten — um deinen eigenen Durchschnitt und deine Schwankung zu berechnen, und sagt das lieber, als eine Phase zu erfinden. In der Zwischenzeit geht nichts verloren: jeder eingetragene Tag gehört zu dieser ersten Berechnung, und die Schätzung wird enger, je länger deine Historie wird. Bis dahin gelten die Hinweise unten allgemein, an jedem Punkt des Zyklus.';

  @override
  String get tipFitnessDetailMenstrual =>
      'Hartes Training passt in den ersten Tagen zu den wenigsten, und das ist kein Disziplinproblem — deine Energie ist tatsächlich niedriger, und der Eisenverlust durch die Blutung lässt Ausdauereinheiten schwerer wirken als dieselbe Einheit letzte Woche. Gehen, sanftes Dehnen, restauratives Yoga und Atemarbeit verbessern die Durchblutung und können Krämpfe abmildern; bei manchen senkt regelmäßige Bewegung über den ganzen Monat die Krampfstärke stärker als alles, was am Tag selbst getan wird. Wenn es dir gut geht, spricht nichts gegen harte Einheiten: Blutung ist kein Grund, mit Sport aufzuhören, und viele Athletinnen und Athleten treten mitten darin an. Ein paar praktische Hinweise: lange, fordernde Einheiten an starken Tagen können die Müdigkeit vertiefen, Wärme auf dem Unterbauch vor dem Start macht Bewegung angenehmer, und etwas mehr trinken als sonst hilft gegen die Kopfschmerzen dieser Tage. Beurteile die Einheit danach, wie sie sich anfühlt — nicht daran, wie deine beste Woche aussah.';

  @override
  String get tipFitnessDetailFollicular =>
      'Mit steigendem Östrogen fühlen sich die meisten kräftiger und belastbarer; das ist meist der beste Abschnitt, um etwas Neues anzufangen, Gewicht zu erhöhen oder das Tempo zu steigern. Die Muskelreparatur läuft hier vergleichsweise effizient, harte Einheiten werden besser verkraftet und hinterlassen weniger langen Muskelkater. Es ist auch ein gutes Fenster für alles, was einen klaren Kopf und nicht nur einen starken Körper braucht — eine neue Übung lernen, Technik korrigieren, eine längere Strecke als bisher. Zwei Einschränkungen bleiben: steigere schrittweise, denn viel Energie heißt nicht null Verletzungsrisiko, und die meisten Überlastungsschäden beginnen in einer guten Woche, nicht in einer schlechten. Und schütze deinen Schlaf — die Anpassung passiert in der Erholung, nicht im Training.';

  @override
  String get tipFitnessDetailFertile =>
      'Energie und Motivation sind meist auf dem Höhepunkt, fordernde Einheiten sitzen also gut — persönliche Bestleistungen fallen oft hierhin. Manche Studien deuten darauf hin, dass Gelenke um den Eisprung etwas nachgiebiger sind; wie groß der praktische Effekt ist, wird diskutiert, aber ein längeres Aufwärmen ist eine billige Vorsichtsmaßnahme bei Sportarten mit schnellen Richtungswechseln, Sprüngen und Landungen. Die Körpertemperatur ist im Vergleich zur zweiten Zyklushälfte noch niedrig, Hitze begrenzt dich hier also weniger als in ein bis zwei Wochen. Ein kurzes einseitiges Ziehen im Unterbauch rund um den Eisprung ist häufig und vergeht meist innerhalb von Stunden. Bei starken, einseitigen und anhaltenden Schmerzen, bei Fieber oder Schwindel: aufhören und abklären lassen, statt weiterzutrainieren.';

  @override
  String get tipFitnessDetailLuteal =>
      'Wenn die Periode näher rückt, kann die Energie sinken, der Puls bei gleicher Belastung höher liegen und die Erholung länger dauern. Das ist ein erwartbares Schwanken, kein Rückschritt, und es macht die Arbeit der letzten zwei Wochen nicht zunichte. Progesteron hebt die Ruhetemperatur leicht an und erschwert die Wärmeabgabe — heiße oder schwüle Einheiten fühlen sich hier überproportional hart an. Früher oder später am Tag trainieren und mehr trinken, als nötig scheint, hilft beides. Moderate Einheiten, eine etwas leichtere Version deines Krafttrainings und Spazierengehen sind meist besser durchzuhalten. Bei Blähgefühl und Spannen in der Brust machen ein stützender Sport-BH und ein längeres Aufwärmen einen echten Unterschied. Wenn die Stimmung im Keller ist, mach die Einheit lieber kurz und leicht, als sie ganz zu streichen — die Schwelle, ab der sie zählt, liegt niedriger, als sie sich anfühlt.';

  @override
  String get tipFitnessDetailUnknown =>
      'Auch ohne bekannte Phase hilft Bewegung zu jedem Zeitpunkt: die allgemeine Empfehlung sind rund 150 Minuten moderate Aktivität pro Woche, verteilt auf die meisten Tage, plus zweimal wöchentlich Kräftigung — und dieses Muster bringt fast allen mehr als gelegentliche sehr intensive Einheiten. Beständigkeit zählt mehr als Intensität, und die beste Einheit ist die, die du nächste Woche wirklich wiederholst. Richte dich danach, wie du dich fühlst: an müden Tagen zählt ein Spaziergang, und eine kurze absolvierte Einheit ist mehr wert als eine lange ausgelassene. Sobald du ein paar Zyklen eingetragen hast, erscheinen hier phasenspezifische Hinweise.';

  @override
  String get tipNutritionDetailMenstrual =>
      'Die Blutung kostet Eisen; rotes Fleisch, Linsen, Kichererbsen, dunkles Blattgemüse und Zuckerrübensirup helfen beim Auffüllen. Pflanzliches Eisen wird zusammen mit Vitamin C deutlich besser aufgenommen — Zitrone über das Linsengericht ist die praktischste Version davon, ein Tomatensalat dazu tut dasselbe. Tee und Kaffee zur Mahlzeit senken die Eisenaufnahme wegen ihrer Gerbstoffe; etwa eine Stunde Abstand reicht aus, aufgeben musst du keines von beiden. Viel Wasser kann die Müdigkeit und die Kopfschmerzen der Blutungstage lindern, und magnesiumreiche Lebensmittel wie Nüsse, Samen und dunkles Blattgemüse helfen manchen bei Krämpfen. An Tagen, an denen die Verdauung träge ist, liegen kleine, regelmäßige Mahlzeiten besser als große. Wenn du rund um die Periode oft kurzatmig, schwindelig oder ungewöhnlich erschöpft bist, erwähne das ärztlich — Eisenmangel ist häufig, leicht zu testen und nichts, was eine App diagnostizieren sollte.';

  @override
  String get tipNutritionDetailFollicular =>
      'Während die Energie zurückkommt, ist der Körper im Aufbaumodus: genug Eiweiß, Vollkorn und Gemüse unterstützen das, und in dieser Phase ist der Appetit meist am gleichmäßigsten und am leichtesten zu steuern. Es ist auch sinnvoll, die Eisenspeicher nach der Blutung weiter aufzufüllen, statt das nur als Aufgabe der Periodenwoche zu sehen — Speicher füllen sich über Wochen, nicht über Tage. Mahlzeiten nicht ausfallen zu lassen fällt hier leichter und lässt dich ausgeglichener in die Appetitschwankungen der nächsten Phase gehen. Wenn du etwas an deiner Ernährung ändern willst, ist dieser Abschnitt in der Regel freundlicher dafür als die Woche vor der Periode, in der Heißhunger und gedrückte Stimmung jede neue Routine schwerer wirken lassen, als sie ist.';

  @override
  String get tipNutritionDetailFertile =>
      'Hier braucht es keine besondere Ernährung; ausgewogene Mahlzeiten und genug Wasser leisten das meiste. Manche fühlen sich um den Eisprung aufgebläht, was meist hormonell und vorübergehend ist und nicht an etwas Gegessenem liegt. Der Appetit sinkt bei manchen leicht und steigt bei anderen — beides ist gewöhnlich. Eiweiß und Ballaststoffe in den Mahlzeiten halten die Energie stabil durch den oft aktivsten Abschnitt des Monats. Wenn du eine Schwangerschaft planst, ist jetzt ein sinnvoller Zeitpunkt, ärztlich nach Folsäure zu fragen — die wird üblicherweise vor der Empfängnis empfohlen, nicht danach. Aber das ist ein Gespräch dort und kein Rat, den eine App geben sollte.';

  @override
  String get tipNutritionDetailLuteal =>
      'Mehr Appetit und Lust auf Süßes, während Progesteron steigt, sind sehr häufig; das ist eine hormonelle Verschiebung, kein Willensproblem, und dein Körper verbraucht in dieser Phase tatsächlich etwas mehr Energie. Eiweiß und Ballaststoffe in den Mahlzeiten halten den Blutzucker stabiler und mildern das Verlangen weit besser, als es zu ignorieren — ein Verlangen, das mit etwas Sättigendem beantwortet wird, endet meist früher als eines, gegen das man eine Stunde ankämpft. Weniger Salz und mehr Wasser können das Blähgefühl lindern; das klingt widersprüchlich, ist es aber nicht: gut versorgt hält der Körper weniger zurück. Magnesiumreiche Lebensmittel (Mandeln, Walnüsse, dunkles Blattgemüse, Zartbitterschokolade) verringern bei manchen Krämpfe und Anspannung. Weniger Koffein nach dem Mittag hilft dem unruhigen Schlaf dieser Phase, und auch Alkohol ist einen Blick wert, weil er den Schlaf genau dann zerstückelt, wenn er ohnehin leichter ist.';

  @override
  String get tipNutritionDetailUnknown =>
      'Egal in welcher Phase helfen dieselben Dinge am meisten: regelmäßige Mahlzeiten, genug Eiweiß, viel Gemüse, genug Wasser und eisenreiche Lebensmittel. Da die Blutung Eisen kostet, reicht es, an diesen Tagen etwas mehr darauf zu achten — es braucht keine eigene Ernährung für jede Woche des Monats. Ungefähr feste Essenszeiten tun für gleichmäßige Energie mehr als jedes einzelne Lebensmittel, und kein Nahrungsmittel muss gestrichen werden, damit ein Zyklus gesund ist. Sobald du ein paar Zyklen eingetragen hast, erscheinen hier phasenspezifische Hinweise.';

  @override
  String get tipSleepLabel => 'Schlaf';

  @override
  String get tipSleepMenstrual =>
      'Krämpfe und Unwohlsein können den Schlaf stören; eine warme Dusche oder eine Wärmflasche vor dem Schlafen kann helfen.';

  @override
  String get tipSleepFollicular =>
      'Mit steigender Energie fühlen sich viele wacher — der Schlafbedarf sinkt dadurch aber nicht wirklich.';

  @override
  String get tipSleepFertile =>
      'Der leichte Temperaturanstieg um den Eisprung kann das Einschlafen etwas erschweren; ein kühleres Zimmer kann das ausgleichen.';

  @override
  String get tipSleepLuteal =>
      'Progesteron erhöht die Ruhetemperatur leicht und kann den Tiefschlaf stören; ein kühles, dunkles Zimmer und feste Schlafzeiten helfen hier meist am meisten.';

  @override
  String get tipSleepUnknown =>
      'Die Schlafqualität schwankt oft über den Zyklus — meist am labilsten kurz vor und während der Periode. Feste Schlafzeiten sind phasenunabhängig die verlässlichste Grundlage.';

  @override
  String get tipSleepDetailMenstrual =>
      'Während der Periode ist der Schlaf oft unruhiger — Krämpfe, Unwohlsein und bei manchen häufigerer Toilettengang können nachts wecken. Prostaglandine, die auch die Krämpfe verursachen, spielen dabei wahrscheinlich eine Rolle. Eine warme Dusche, eine Wärmflasche oder sanftes Dehnen vor dem Schlafen kann die Krämpfe lindern. Wer Schmerzmittel nimmt, kann die Einnahme so timen, dass die Wirkung die erste Nachthälfte abdeckt. Bleibt der Schlaf trotzdem schwierig, ist das normal — es bessert sich meist mit der Phase.';

  @override
  String get tipSleepDetailFollicular =>
      'Mit steigendem Östrogen fühlen sich viele wacher und energiegeladener, was wie weniger Schlafbedarf wirken kann. Das stimmt nicht ganz — Wachheit fällt nur leichter. Feste Schlafzeiten zahlen sich später aus, wenn der Schlaf in anderen Phasen labiler wird. Diese Phase eignet sich oft gut, um eine neue Schlafroutine auszuprobieren, da der Körper Veränderungen leichter mitmacht.';

  @override
  String get tipSleepDetailFertile =>
      'Der leichte Temperaturanstieg um den Eisprung kann das Einschlafen etwas erschweren, da der Körper vor dem Schlaf natürlicherweise abkühlen will. Ein kühleres Zimmer, eine dünnere Decke oder eine warme Dusche vor dem Schlafen können das ausgleichen. Wer in dieser Phase mehr Lust oder soziale Energie bemerkt, bleibt vielleicht bewusst länger wach — ein Muster, das sich zu beobachten lohnt, kein Problem, das gelöst werden muss.';

  @override
  String get tipSleepDetailLuteal =>
      'Das nach dem Eisprung steigende Progesteron erhöht die Ruhetemperatur leicht, was den Tiefschlaf störender machen kann — manchmal wie eine leichte Hitzewallung, manchmal einfach als weniger erholsamer Schlaf. Nähert sich die Periode, kommt oft noch prämenstruelle Anspannung dazu. Ein kühles, dunkles Zimmer, weniger Bildschirmzeit vor dem Schlafen und feste Schlafzeiten helfen hier meist am meisten. Bleibt der Schlaf schwierig, ist das kein Versagen, sondern ein erwarteter Teil der Phase.';

  @override
  String get tipSleepDetailUnknown =>
      'Es gibt noch nicht genug Daten, um die aktuelle Phase zu bestimmen, aber schwankende Schlafqualität über den Zyklus ist ein verbreitetes Muster — meist labiler kurz vor und während der Periode, stabiler in der ersten Hälfte. Die verlässlichste Grundlage unabhängig von der Phase: feste Schlaf- und Weckzeiten, weniger Bildschirmzeit vor dem Schlafen und ein kühles, dunkles Zimmer. Nach ein paar erfassten Zyklen zeigen sich hier genauere Muster.';
}
