// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Italian (`it`).
class AppLocalizationsIt extends AppLocalizations {
  AppLocalizationsIt([String locale = 'it']) : super(locale);

  @override
  String get appTitle => 'Vera';

  @override
  String get actionSkip => 'Salta';

  @override
  String get actionContinue => 'Continua';

  @override
  String get actionDone => 'Fatto';

  @override
  String get actionCancel => 'Annulla';

  @override
  String get actionClear => 'Cancella';

  @override
  String get actionDelete => 'Elimina';

  @override
  String get actionEnable => 'Attiva';

  @override
  String get commonIDontKnow => 'Non lo so';

  @override
  String get commonYes => 'Sì';

  @override
  String get commonNo => 'No';

  @override
  String get commonNotSure => 'Non saprei';

  @override
  String get pinSetupTitle => 'Imposta un PIN';

  @override
  String get pinSetupEnterPrompt =>
      'Scegli un PIN di 6 cifre per bloccare l\'app';

  @override
  String get pinSetupConfirmPrompt => 'Inseriscilo di nuovo per confermare';

  @override
  String get pinSetupMismatch => 'Non coincidono — riproviamo';

  @override
  String get pinSetupBiometricTitle => 'Sblocco più rapido?';

  @override
  String get pinSetupBiometricBody =>
      'Puoi sbloccare anche con l\'impronta o il volto — il PIN resta comunque come alternativa.';

  @override
  String get lockScreenTitle => 'Bloccata';

  @override
  String get lockScreenEnterPin => 'Inserisci il PIN';

  @override
  String get lockScreenWrongPin => 'Questo PIN non corrisponde';

  @override
  String get lockScreenUseBiometrics => 'Usa i dati biometrici';

  @override
  String get lockScreenUseFaceId => 'Usa Face ID';

  @override
  String get lockScreenUseFingerprint => 'Usa l\'impronta digitale';

  @override
  String get lockScreenForgotPin => 'Hai dimenticato il PIN?';

  @override
  String get lockScreenForgotPinChoiceTitle => 'Come vuoi reimpostarlo?';

  @override
  String get lockScreenResetViaDevice => 'Verifica con questo dispositivo';

  @override
  String get lockScreenResetViaDeviceBody =>
      'I tuoi dati restano. Basta confermare con il blocco del telefono stesso — Face ID, impronta o codice.';

  @override
  String get lockScreenResetViaDeviceReason =>
      'Verifica per impostare un nuovo PIN';

  @override
  String lockScreenThrottled(int seconds) {
    return 'Troppi tentativi. Riprova tra $seconds s';
  }

  @override
  String get lockScreenEraseTitle => 'Cancellare tutti i dati?';

  @override
  String get lockScreenEraseBody =>
      'Questa operazione elimina definitivamente tutto ciò che si trova su questo dispositivo. Non ci sono account né backup su server, quindi non può essere annullata.';

  @override
  String get lockScreenEraseConfirm => 'Cancella tutto';

  @override
  String get onboardingPrivacyTitle => 'Ti diamo il benvenuto';

  @override
  String get onboardingPrivacyBody =>
      'I dati del tuo ciclo restano solo su questo dispositivo, cifrati. Non c\'è nessun account e nessuna sincronizzazione cloud — nulla di ciò che registri viene caricato. La chiave risiede nell\'hardware sicuro del telefono, e puoi esportare o cancellare tutto quando vuoi.';

  @override
  String get onboardingLastPeriodTitle =>
      'Quando è iniziato il tuo ultimo ciclo?';

  @override
  String get onboardingLastPeriodBody =>
      'Ci serve solo per iniziare — puoi sempre correggerlo più avanti dal calendario.';

  @override
  String get onboardingPickDate => 'Scegli una data';

  @override
  String get onboardingCycleLengthTitle =>
      'Quanto dura di solito il tuo ciclo?';

  @override
  String get onboardingCycleLengthBody =>
      'Un numero approssimativo va bene. Inizieremo a darti una stima reale quando avremo visto un paio di cicli completi.';

  @override
  String get onboardingPeriodLengthTitle =>
      'Quanti giorni durano di solito le mestruazioni?';

  @override
  String get onboardingPeriodLengthBody =>
      'Lo useremo per completare le tue ultime mestruazioni, così non parti da zero.';

  @override
  String get onboardingDaysUnit => 'giorni';

  @override
  String get onboardingGoalTitle => 'Cosa ti porta qui?';

  @override
  String get onboardingGoalBody =>
      'Ci serve solo per mostrarti prima le cose giuste — puoi cambiare idea quando vuoi nelle Impostazioni.';

  @override
  String get goalTrackPeriod => 'Monitorare il ciclo';

  @override
  String get goalTryingToConceive => 'Sto cercando una gravidanza';

  @override
  String get goalPregnancyTracking => 'Seguo una gravidanza';

  @override
  String get onboardingRegularityTitle =>
      'I tuoi cicli sono di solito regolari?';

  @override
  String get onboardingRegularityBody =>
      'Qui non ci sono risposte sbagliate — ci aiuta solo a conoscere un po\' il tuo corpo.';

  @override
  String get onboardingCrampsTitle => 'Hai spesso crampi?';

  @override
  String get onboardingCrampsBody =>
      'Faremo in modo che sia facile registrare come ti senti in quei giorni.';

  @override
  String get onboardingBirthYearTitle => 'In che anno sei nata?';

  @override
  String get onboardingBirthYearBody =>
      'Solo per un quadro più completo — non viene mai usato per alcuna previsione.';

  @override
  String get onboardingPmsTitle => 'Di solito succede qualcosa prima?';

  @override
  String get onboardingPmsBody =>
      'Scegli quante voci vuoi. Non viene salvato da nessuna parte, non c\'è risposta sbagliata.';

  @override
  String get onboardingNotificationTitle => 'Vuoi promemoria delicati?';

  @override
  String get onboardingNotificationBody =>
      'Possiamo avvisarti prima della data prevista delle mestruazioni.';

  @override
  String get onboardingNotificationMockTitle =>
      'Le mestruazioni potrebbero iniziare presto';

  @override
  String get onboardingNotificationMockBody =>
      'In base ai cicli che hai registrato';

  @override
  String get onboardingNotificationAllow => 'Attiva promemoria';

  @override
  String get onboardingNotificationNotNow => 'Non ora';

  @override
  String get onboardingBuildingPlanTitle => 'Stiamo preparando tutto per te';

  @override
  String get onboardingBuildingPlanStep1 =>
      'Mettiamo al sicuro i tuoi dati su questo dispositivo';

  @override
  String get onboardingBuildingPlanStep2 => 'Salviamo le tue preferenze';

  @override
  String get onboardingBuildingPlanStep3 => 'Prepariamo il tuo calendario';

  @override
  String get onboardingBuildingPlanDone => 'Tutto pronto';

  @override
  String get navHome => 'Home';

  @override
  String get navCalendar => 'Calendario';

  @override
  String get navInsights => 'Statistiche';

  @override
  String get navSettings => 'Impostazioni';

  @override
  String get navReminders => 'Promemoria';

  @override
  String get navProfile => 'Profilo';

  @override
  String get navTrack => 'Registra';

  @override
  String homeCycleDayLabel(int day) {
    return 'Giorno $day';
  }

  @override
  String get homeNoCycleYet => 'Nessuna mestruazione registrata';

  @override
  String get homePhaseMenstrual => 'Mestruazione';

  @override
  String get homePhaseFollicular => 'Fase follicolare';

  @override
  String get homePhaseFertileWindow => 'Finestra fertile stimata';

  @override
  String get homePhaseLuteal => 'Fase luteale';

  @override
  String get homePhaseUnknown => 'Dati recenti insufficienti';

  @override
  String get homePredictionInsufficientTitle =>
      'Non ci sono ancora abbastanza dati';

  @override
  String get homePredictionInsufficientBody =>
      'Registra le prossime mestruazioni e inizieremo a fare stime.';

  @override
  String homePredictionRangeLabel(String start, String end) {
    return '$start – $end';
  }

  @override
  String get homeConfidenceHigh => 'Attendibilità alta';

  @override
  String get homeConfidenceMedium => 'Attendibilità media';

  @override
  String get homeConfidenceLow => 'Attendibilità bassa';

  @override
  String get homeIrregularNote =>
      'Ultimamente la durata del tuo ciclo è variata più del solito. Se per te è una novità, può valere la pena parlarne a un controllo.';

  @override
  String get homeFertileWindowDisclaimer =>
      'Basato sui tempi tipici del ciclo — non è un metodo contraccettivo.';

  @override
  String get homePeriodStartedButton => 'Ciclo iniziato oggi';

  @override
  String get homePeriodStartedSnackbar =>
      'Registrato — il ciclo è iniziato oggi';

  @override
  String get actionUndo => 'Annulla azione';

  @override
  String get comingSoon => 'Prossimamente';

  @override
  String get dayLogFlowLabel => 'Flusso';

  @override
  String get flowSpotting => 'Spotting';

  @override
  String get flowLight => 'Leggero';

  @override
  String get flowMedium => 'Medio';

  @override
  String get flowHeavy => 'Abbondante';

  @override
  String get flowNone => 'Nessuno';

  @override
  String get dayLogSymptomsLabel => 'Sintomi';

  @override
  String get symptomCramps => 'Crampi';

  @override
  String get symptomHeadache => 'Mal di testa';

  @override
  String get symptomBloating => 'Gonfiore';

  @override
  String get symptomBreastTenderness => 'Tensione al seno';

  @override
  String get symptomAcne => 'Acne';

  @override
  String get symptomFatigue => 'Stanchezza';

  @override
  String get symptomNausea => 'Nausea';

  @override
  String get symptomBackPain => 'Mal di schiena';

  @override
  String get symptomAppetiteChange => 'Cambiamento dell\'appetito';

  @override
  String get symptomSleepTrouble => 'Difficoltà a dormire';

  @override
  String get symptomPelvicPain => 'Dolore pelvico';

  @override
  String get symptomDizziness => 'Capogiri';

  @override
  String get symptomMigraine => 'Emicrania';

  @override
  String get symptomHighFever => 'Febbre alta';

  @override
  String get symptomNeckPain => 'Dolore al collo';

  @override
  String get symptomShoulderPain => 'Dolore alla spalla';

  @override
  String get symptomLimbPain => 'Dolore agli arti';

  @override
  String get symptomMuscleAche => 'Dolore muscolare';

  @override
  String get symptomChills => 'Brividi';

  @override
  String get symptomNightSweats => 'Sudorazioni notturne';

  @override
  String get symptomHotFlashes => 'Vampate di calore';

  @override
  String get symptomWeightGain => 'Aumento di peso';

  @override
  String get symptomConstipation => 'Stitichezza';

  @override
  String get symptomDiarrhea => 'Diarrea';

  @override
  String get symptomIndigestion => 'Indigestione';

  @override
  String get symptomGasPain => 'Dolore da gonfiore';

  @override
  String get symptomFeelingUnwell => 'Malessere';

  @override
  String get symptomItching => 'Prurito';

  @override
  String get symptomTroubleFocusing => 'Difficoltà di concentrazione';

  @override
  String get symptomForgetfulness => 'Smemoratezza';

  @override
  String get symptomGroupHead => 'Testa';

  @override
  String get symptomGroupBody => 'Corpo';

  @override
  String get symptomGroupAbdomen => 'Addome';

  @override
  String get symptomGroupGeneral => 'Generale';

  @override
  String get symptomGroupCognitive => 'Cognitivo';

  @override
  String get dayLogMoodLabel => 'Umore';

  @override
  String get moodCalm => 'Calma';

  @override
  String get moodAnxious => 'Ansia';

  @override
  String get moodIrritable => 'Irritabilità';

  @override
  String get moodLow => 'Morale basso';

  @override
  String get moodEnergetic => 'Con energia';

  @override
  String get moodHappy => 'Felicità';

  @override
  String get moodContent => 'Appagamento';

  @override
  String get moodSad => 'Tristezza';

  @override
  String get moodDepressed => 'Umore depresso';

  @override
  String get moodEmotional => 'Emotività';

  @override
  String get moodExcited => 'Emozionata';

  @override
  String get moodHopeful => 'Speranzosa';

  @override
  String get moodProud => 'Orgogliosa';

  @override
  String get moodDisappointed => 'Delusa';

  @override
  String get moodConfident => 'Sicura di sé';

  @override
  String get moodSurprised => 'Sorpresa';

  @override
  String get moodIndifferent => 'Indifferente';

  @override
  String get moodPeaceful => 'Serena';

  @override
  String get moodInLove => 'Innamorata';

  @override
  String get moodShy => 'Timida';

  @override
  String get moodPlayful => 'Giocosa';

  @override
  String get moodExhausted => 'Esausta';

  @override
  String get moodLonely => 'Sola';

  @override
  String get moodOverwhelmed => 'Sopraffatta';

  @override
  String get moodGrateful => 'Grata';

  @override
  String get moodNostalgic => 'Nostalgica';

  @override
  String get dayLogNoteLabel => 'Nota';

  @override
  String get dayLogNoteHint => 'Qualcosa che vuoi ricordare di oggi';

  @override
  String get dayLogOptionalTrackersLabel => 'Monitoraggi opzionali';

  @override
  String get dayLogSexualActivityLabel => 'Attività sessuale';

  @override
  String get sexLifeNone => 'Niente';

  @override
  String get sexLifeUnprotected => 'Sesso non protetto';

  @override
  String get sexLifeProtected => 'Sesso protetto';

  @override
  String get sexLifeMasturbation => 'Masturbazione';

  @override
  String get sexLifeNoOrgasm => 'Nessun orgasmo';

  @override
  String get sexLifeOrgasm => 'Orgasmo';

  @override
  String get sexLifeHighDesire => 'Molto desiderio';

  @override
  String get dayLogBbtLabel => 'Temperatura basale';

  @override
  String get dayLogMucusLabel => 'Muco cervicale';

  @override
  String get mucusDry => 'Secco';

  @override
  String get mucusSticky => 'Appiccicoso';

  @override
  String get mucusCreamy => 'Cremoso';

  @override
  String get mucusWatery => 'Acquoso';

  @override
  String get mucusEggWhite => 'Albume';

  @override
  String get dayLogSavedIndicator => 'Salvato';

  @override
  String get homeOpenTodayLog => 'Aggiungi i dettagli di oggi';

  @override
  String get calendarLegendActual => 'Mestruazione registrata';

  @override
  String get calendarLegendPredicted => 'Finestra prevista';

  @override
  String get calendarLegendFertile => 'Finestra fertile stimata';

  @override
  String get calendarLegendOvulation => 'Ovulazione stimata';

  @override
  String get dayDetailFertileTitle => 'Sei nella tua finestra fertile stimata';

  @override
  String get dayDetailOvulationTitle => 'Giorno di ovulazione stimato';

  @override
  String get dayDetailOvulationBody =>
      'In genere la probabilità di gravidanza è più alta intorno a questo giorno, in base ai tempi abituali — è una stima, non una certezza.';

  @override
  String get insightsCyclesLoggedLabel => 'Cicli registrati';

  @override
  String get insightsAveragePeriodLengthLabel =>
      'Durata media delle mestruazioni';

  @override
  String get insightsAverageCycleLengthLabel => 'Durata media del ciclo';

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
      other: 'Varia di circa $daysString giorni',
      one: 'Varia di circa $daysString giorno',
    );
    return '$_temp0';
  }

  @override
  String get insightsNotEnoughDataTitle => 'Non ci sono ancora abbastanza dati';

  @override
  String get insightsNotEnoughDataBody =>
      'Registra un paio di cicli completi e le tue medie compariranno qui.';

  @override
  String get insightsSymptomFrequencyTitle => 'Sintomi per giorno del ciclo';

  @override
  String get insightsNoSymptomsLogged => 'Nessun sintomo registrato finora';

  @override
  String get settingsLanguageLabel => 'Lingua';

  @override
  String get settingsLanguageSystem => 'Lingua di sistema';

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
  String get tourSkip => 'Salta';

  @override
  String get tourNext => 'Avanti';

  @override
  String get tourStart => 'Iniziamo';

  @override
  String get tourHomeTitle => 'Home';

  @override
  String get tourHomeBody =>
      'Guarda a colpo d\'occhio dove sei oggi — il tuo giorno del ciclo, quanto manca alla finestra stimata e il tuo compagno sono sempre qui.';

  @override
  String get tourCalendarTitle => 'Calendario';

  @override
  String get tourCalendarBody =>
      'Guarda i tuoi cicli passati e futuri sul calendario. Tocca un giorno qualsiasi per aprirne il diario.';

  @override
  String get tourTrackTitle => 'Registra';

  @override
  String get tourTrackBody =>
      'Il pulsante + al centro apre il diario di oggi da qualsiasi punto — flusso, sintomi, umore e altro.';

  @override
  String get tourRemindersTitle => 'Promemoria';

  @override
  String get tourRemindersBody =>
      'Imposta promemoria per il prossimo ciclo, i farmaci o bere acqua — tutto resta sul tuo telefono e non va da nessun\'altra parte.';

  @override
  String get tourProfileTitle => 'Profilo';

  @override
  String get tourProfileBody =>
      'Trova qui i tuoi approfondimenti, tutto ciò che monitori e le tue impostazioni.';

  @override
  String get settingsWeekStartLabel => 'La settimana inizia di';

  @override
  String get settingsWeekStartMonday => 'Lunedì';

  @override
  String get settingsWeekStartSunday => 'Domenica';

  @override
  String get settingsTemperatureUnitLabel => 'Unità di temperatura';

  @override
  String get settingsTemperatureCelsius => 'Celsius';

  @override
  String get settingsTemperatureFahrenheit => 'Fahrenheit';

  @override
  String get settingsRemindersLabel => 'Avvisami prima delle mestruazioni';

  @override
  String get remindersScreenTitle => 'Promemoria';

  @override
  String get reminderDetailNotification => 'Notifica';

  @override
  String get reminderDetailAlert => 'Avviso';

  @override
  String get reminderDetailAlertToday => 'Lo stesso giorno';

  @override
  String get reminderDetailTime => 'Ora';

  @override
  String get reminderDetailMessage => 'Messaggio';

  @override
  String get reminderDetailMessageEditTitle => 'Modifica messaggio';

  @override
  String get reminderDetailMessageHint => 'Scrivi il tuo messaggio';

  @override
  String reminderDetailAlertDaysBefore(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count giorni prima',
      one: '$count giorno prima',
    );
    return '$_temp0';
  }

  @override
  String optionsShowMore(int count) {
    return '+$count altri';
  }

  @override
  String get optionsShowLess => 'Mostra meno';

  @override
  String get trackerHistoryEntry => 'Cronologia';

  @override
  String get actionSend => 'Invia';

  @override
  String get actionRemove => 'Rimuovi';

  @override
  String get feedbackEntry => 'Feedback';

  @override
  String get cloudBackupEntry => 'Backup con account';

  @override
  String get cloudBackupTitle => 'Backup con account';

  @override
  String get cloudBackupNotConfiguredTitle =>
      'Non ancora disponibile in questa versione';

  @override
  String get cloudBackupNotConfiguredBody =>
      'Il backup cloud richiede un servizio account non ancora configurato per questa versione. Nulla qui può essere usato fino ad allora.';

  @override
  String get cloudBackupIntro1Title => 'Non perdere mai la tua cronologia';

  @override
  String get cloudBackupIntro1Body =>
      'La tua cronologia del ciclo resta al sicuro anche se perdi il telefono o ne cambi uno.';

  @override
  String get cloudBackupIntro2Title => 'Solo tu puoi aprirlo';

  @override
  String get cloudBackupIntro2Body =>
      'Il tuo backup viene crittografato con una password prima ancora di lasciare il telefono — non possiamo leggerlo, e nemmeno nessun altro.';

  @override
  String get cloudBackupIntro3Title => 'Ripristina in pochi secondi';

  @override
  String get cloudBackupIntro3Body =>
      'Accedi su un nuovo dispositivo e recupera la tua cronologia con la stessa password.';

  @override
  String get cloudBackupSignedInTitle => 'Accesso effettuato';

  @override
  String get cloudBackupUploadButton => 'Esegui il backup ora';

  @override
  String get cloudBackupDownloadButton => 'Ripristina dal cloud';

  @override
  String get cloudBackupUploadSuccess => 'Backup salvato nel tuo account';

  @override
  String get cloudBackupNoBackupFound =>
      'Nessun backup cloud trovato per questo account.';

  @override
  String get partnerModeEntry => 'Modalità partner';

  @override
  String get partnerModeTitle => 'Modalità partner';

  @override
  String get partnerModeNotConfiguredTitle =>
      'Non ancora disponibile in questa versione';

  @override
  String get partnerModeNotConfiguredBody =>
      'La Modalità partner richiede un servizio account non ancora configurato per questa versione. Nulla qui può essere usato fino ad allora.';

  @override
  String get partnerModeHeroTitle => 'Condividi un po\', alle tue condizioni';

  @override
  String get partnerModeHeroBody =>
      'Associati al tuo partner e condividi solo ciò che attivi qui sotto — mai l\'intera cronologia, mai automaticamente.';

  @override
  String get partnerModeSignInGoogle => 'Continua con Google';

  @override
  String get partnerModeSignInApple => 'Continua con Apple';

  @override
  String get partnerModeFaqTitle => 'Prima di accedere';

  @override
  String get partnerModeFaq1Q => 'Cosa vedrà davvero il mio partner?';

  @override
  String get partnerModeFaq1A =>
      'Solo i campi che attivi nella Modalità partner, e solo il tuo stato attuale — mai la tua cronologia salvata, né nulla che tu non abbia condiviso esplicitamente.';

  @override
  String get partnerModeFaq2Q => 'Posso disattivarlo in seguito?';

  @override
  String get partnerModeFaq2A =>
      'Sì. Annullare l\'associazione interrompe subito la condivisione per entrambi, e puoi disattivare qualsiasi singolo interruttore in qualsiasi momento senza annullare l\'associazione.';

  @override
  String get partnerModeFaq3Q => 'Il mio partner ha bisogno di questa app?';

  @override
  String get partnerModeFaq3A =>
      'Sì — accede allo stesso modo e si associa con un codice che gli invii.';

  @override
  String get partnerModeNotPairedTitle => 'Non ancora associato';

  @override
  String get partnerModeNotPairedBody =>
      'Invita il tuo partner con un codice monouso, oppure inserisci il codice che ti ha inviato.';

  @override
  String get partnerModeInviteButton => 'Invita il mio partner';

  @override
  String get partnerModeEnterCodeButton => 'Inserisci un codice';

  @override
  String get partnerModeSignOut => 'Esci';

  @override
  String get partnerModePairedTitle => 'Associato';

  @override
  String get partnerModePairedBody =>
      'Tu e il tuo partner siete connessi. La condivisione resta limitata a ciò che attivi qui sotto.';

  @override
  String get partnerModeShareSectionTitle => 'Cosa condividi';

  @override
  String get partnerModeShareCyclePhase => 'Fase e giorno del ciclo';

  @override
  String get partnerModeShareMood => 'Umore di oggi';

  @override
  String get partnerModeShareSymptoms => 'Sintomi di oggi';

  @override
  String get partnerModeShareHighDesire => 'Voglia di vicinanza oggi';

  @override
  String get partnerModeShareNow => 'Condividi ora';

  @override
  String get partnerModeShareSuccess => 'Condiviso con il tuo partner';

  @override
  String get partnerModeUnpair => 'Annulla associazione';

  @override
  String get partnerModeUnpairConfirmTitle =>
      'Annullare l\'associazione con il tuo partner?';

  @override
  String get partnerModeUnpairConfirmBody =>
      'Questo interrompe subito la condivisione per entrambi. Potrete associarvi di nuovo in seguito con un nuovo codice.';

  @override
  String get partnerModePartnerSnapshotEmpty =>
      'Il tuo partner non ha ancora condiviso nulla.';

  @override
  String get partnerModeErrorNotConfigured =>
      'La Modalità partner non è ancora configurata in questa versione.';

  @override
  String get partnerModeErrorCodeNotFound =>
      'Codice non trovato. Controllalo e riprova.';

  @override
  String get partnerModeErrorCodeExpired =>
      'Questo codice è scaduto. Chiedine uno nuovo.';

  @override
  String get partnerModeErrorCodeIsOwn =>
      'Questo è il tuo stesso codice — chiedi al tuo partner il suo.';

  @override
  String get partnerModeErrorNotSignedIn => 'Accedi prima.';

  @override
  String get partnerModeErrorUnknown => 'Qualcosa è andato storto. Riprova.';

  @override
  String get partnerModeInviteTitle => 'Invita il tuo partner';

  @override
  String get partnerModeInviteBody =>
      'Invia questo codice al tuo partner. Lo inserirà nella propria app per associarsi a te.';

  @override
  String get partnerModeInviteExpiry => 'Valido per 7 giorni';

  @override
  String get partnerModeInviteShare => 'Condividi codice';

  @override
  String partnerModeInviteMessage(String code) {
    return 'Ecco il mio codice di associazione Vera: $code';
  }

  @override
  String get partnerModeEnterTitle => 'Inserisci un codice';

  @override
  String get partnerModeEnterBody =>
      'Inserisci il codice che ti ha inviato il tuo partner.';

  @override
  String get partnerModeEnterHint => 'Codice di 6 caratteri';

  @override
  String get partnerModeEnterSubmit => 'Associa';

  @override
  String get homeInvitePartnerTitle => 'Condividi con il tuo partner';

  @override
  String get homeInvitePartnerBody =>
      'Associatevi e condividi solo ciò che scegli — la tua cronologia resta tua.';

  @override
  String get homeInvitePartnerCta => 'Configura Modalità partner';

  @override
  String get feedbackTitle => 'Cosa non ti è piaciuto?';

  @override
  String get feedbackSubtitle =>
      'Scegli un argomento, e scrivi altri dettagli se vuoi.';

  @override
  String get feedbackCategoryPredictions => 'Previsioni';

  @override
  String get feedbackCategoryBackup => 'Backup e ripristino';

  @override
  String get feedbackCategorySubscription => 'Abbonamento';

  @override
  String get feedbackCategoryAds => 'Pubblicità';

  @override
  String get feedbackCategoryDesign => 'Design';

  @override
  String get feedbackCategoryTranslation => 'Traduzione';

  @override
  String get feedbackCategoryOther => 'Altro';

  @override
  String get feedbackDescriptionLabel => 'Raccontaci di più (facoltativo)';

  @override
  String get feedbackDescriptionHint =>
      'Cos\'è successo? Toccando Invia sceglierai dove condividerlo — la tua app di posta o altrove.';

  @override
  String get feedbackAttachPhoto => 'Aggiungi una foto';

  @override
  String get feedbackPhotoAttached => 'Foto allegata';

  @override
  String get remindersGroupCycle => 'Ciclo e fertilità';

  @override
  String get remindersGroupMedication => 'Farmaci';

  @override
  String get remindersGroupLifestyle => 'Stile di vita';

  @override
  String get remindersGroupAppointment => 'Appuntamenti medici';

  @override
  String get settingsRemindersPeriodEndLabel =>
      'Avvisami quando le mestruazioni dovrebbero finire';

  @override
  String get settingsRemindersMedicationLabel => 'Promemoria farmaci';

  @override
  String get settingsRemindersWaterLabel => 'Promemoria acqua';

  @override
  String get settingsRemindersAppointmentLabel =>
      'Promemoria appuntamento medico';

  @override
  String get settingsRemindersAppointmentSet => 'Imposta data e ora';

  @override
  String get settingsRemindersAppointmentClear => 'Rimuovi';

  @override
  String get settingsOptionalTrackersHeading => 'Monitoraggi opzionali';

  @override
  String get settingsOptionalTrackersBody =>
      'Disattivati per impostazione predefinita. Attivandone uno, compare nella schermata del registro giornaliero.';

  @override
  String get settingsSexualActivityToggle => 'Attività sessuale';

  @override
  String get settingsBbtToggle => 'Temperatura basale';

  @override
  String get settingsMucusToggle => 'Muco cervicale';

  @override
  String get settingsBreastExamToggle => 'Autopalpazione del seno';

  @override
  String get settingsCervixToggle => 'Posizione e consistenza della cervice';

  @override
  String get settingsPrivacyEntry => 'Privacy';

  @override
  String get settingsRateEntry => 'Valutaci';

  @override
  String get rateAppTitle => 'Vera ti è utile?';

  @override
  String get rateAppBody =>
      'Se sì, qualche secondo per valutarla nello store aiuta altre persone che cercano qualcosa di simile a trovarla.';

  @override
  String get rateAppCta => 'Valuta Vera';

  @override
  String get rateAppDismiss => 'Non ora';

  @override
  String get settingsDeleteAllData => 'Elimina tutti i dati';

  @override
  String get privacyScreenTitle => 'Privacy';

  @override
  String get privacyScreenIntro =>
      'Ecco esattamente cosa succede ai tuoi dati, in parole semplici.';

  @override
  String get privacyScreenStorageTitle => 'Cifrato su questo dispositivo';

  @override
  String get privacyScreenNoNetworkTitle => 'Nessun server, nessun account';

  @override
  String get privacyScreenNoThirdPartyTitle => 'Nessun tracciamento';

  @override
  String get privacyScreenExportTitle => 'L\'esportazione parte solo da te';

  @override
  String get privacyScreenDeleteTitle => 'L\'eliminazione è definitiva';

  @override
  String get privacyScreenStorage =>
      'Tutto ciò che registri viene cifrato e salvato solo su questo dispositivo, in un unico file. La chiave di cifratura risiede nell\'hardware sicuro del telefono — Keychain su iOS, Keystore su Android — non nel file stesso.';

  @override
  String get privacyScreenNoNetwork =>
      'Questa app non ha un server proprio né un sistema di account: ciò che registri non viene mai caricato. La versione gratuita include annunci Google, che si collegano a internet; non ricevono mai nulla di ciò che registri.';

  @override
  String get privacyScreenNoThirdParty =>
      'Non ci sono strumenti di analisi, né segnalazione di crash, né SDK di tracciamento. L\'unico componente di terze parti è l\'SDK pubblicitario di Google nella versione gratuita — Premium lo rimuove del tutto.';

  @override
  String get privacyScreenExport =>
      'L\'unico modo in cui i tuoi dati lasciano questo dispositivo è se sei tu a esportarli, e quell\'esportazione è cifrata con una password che conosci solo tu.';

  @override
  String get privacyScreenDelete =>
      'L\'eliminazione dei tuoi dati è reale e immediata. Non c\'è nessun account e nessun backup dalla nostra parte — una volta cancellati, sono spariti.';

  @override
  String get adPlaceholderLabel => 'Spazio pubblicitario';

  @override
  String get adPlaceholderUpgradeCta =>
      'Passa a Premium per un\'esperienza senza pubblicità';

  @override
  String get reminderNotificationTitle =>
      'Le mestruazioni potrebbero iniziare presto';

  @override
  String get reminderNotificationBody =>
      'In base ai cicli che hai registrato, la finestra stimata si avvicina.';

  @override
  String get reminderPeriodEndTitle =>
      'Le mestruazioni potrebbero essere quasi finite';

  @override
  String get reminderPeriodEndBody =>
      'Se continuano, è del tutto normale — è solo un controllo gentile.';

  @override
  String get reminderMedicationTitle => 'Promemoria farmaci';

  @override
  String get reminderMedicationBody => 'È il momento di prendere il farmaco.';

  @override
  String get reminderWaterTitle => 'Ricordati di bere';

  @override
  String get reminderWaterBody => 'Un piccolo promemoria per l\'acqua.';

  @override
  String get reminderAppointmentTitle => 'Appuntamento medico imminente';

  @override
  String get reminderAppointmentBody => 'Hai un appuntamento medico in arrivo.';

  @override
  String get settingsExportEntry => 'Esporta e backup';

  @override
  String get exportBackupHeading => 'Backup cifrato';

  @override
  String get exportBackupBody =>
      'Salva una copia cifrata della tua cronologia per spostarla su un nuovo dispositivo. Per ripristinarla ti servirà di nuovo la password — non c\'è altro modo per recuperarla.';

  @override
  String get exportCreateBackupButton => 'Crea backup';

  @override
  String get exportRestoreBackupButton => 'Ripristina da backup';

  @override
  String get exportPasswordLabel => 'Password';

  @override
  String get exportPasswordConfirmLabel => 'Conferma password';

  @override
  String get exportPasswordMismatch => 'Le password non coincidono';

  @override
  String get exportPasswordTooShort => 'Usa almeno 8 caratteri';

  @override
  String get exportRestoreConfirmTitle =>
      'Sostituire tutti i dati su questo dispositivo?';

  @override
  String get exportRestoreConfirmBody =>
      'Ripristinare un backup sostituisce tutto ciò che è registrato ora su questo dispositivo. L\'operazione non può essere annullata.';

  @override
  String get exportRestoreConfirmAction => 'Ripristina';

  @override
  String get exportWrongPassword =>
      'Questa password non corrisponde a questo backup';

  @override
  String get exportInvalidFile => 'Questo file non sembra un backup di Vera';

  @override
  String get exportBackupCreated => 'Backup pronto da condividere';

  @override
  String get exportRestoreSuccess => 'Backup ripristinato';

  @override
  String get exportDoctorReportHeading => 'Report per il medico';

  @override
  String get exportDoctorReportBody =>
      'Un riepilogo che puoi condividere con un professionista sanitario.';

  @override
  String get exportIncludeNotesToggle => 'Includi le note personali';

  @override
  String get exportShareCsvButton => 'Condividi come CSV';

  @override
  String get exportPrintPdfButton => 'Stampa / Salva come PDF';

  @override
  String get doctorReportDisclaimer =>
      'Generato da Vera a partire dai dati inseriti dall\'utente. Non è una diagnosi medica.';

  @override
  String get doctorReportGeneratedOn => 'Generato il';

  @override
  String get doctorReportSummaryHeading => 'Riepilogo';

  @override
  String get doctorReportDailyLogHeading => 'Registro giornaliero';

  @override
  String get doctorReportColumnDate => 'Data';

  @override
  String get doctorReportTimelineHeading => 'Cronologia dei cicli';

  @override
  String get doctorReportCycleLabel => 'Ciclo';

  @override
  String get doctorReportTimelineLegendPeriod => 'Mestruazioni';

  @override
  String get doctorReportTimelineLegendCycle => 'Resto del ciclo';

  @override
  String get doctorReportTimelineOngoing => 'In corso';

  @override
  String get dailyInsightLabel => 'Lo sapevi?';

  @override
  String get insightMenstrual1 =>
      'In questo momento l\'endometrio si sta sfaldando: la maggior parte delle mestruazioni dura dai 3 ai 7 giorni, ed è del tutto normale.';

  @override
  String get insightMenstrual2 =>
      'Gli alimenti ricchi di ferro, come le verdure a foglia verde e le lenticchie, possono aiutare a compensare ciò che il corpo perde questa settimana.';

  @override
  String get insightFollicular1 =>
      'Gli estrogeni stanno salendo e molte persone notano più energia e maggiore concentrazione a partire da adesso.';

  @override
  String get insightFollicular2 =>
      'Il tuo corpo sta preparando un ovulo per il rilascio — questa fase può durare da una settimana a qualche settimana.';

  @override
  String get insightFertile1 =>
      'Questa è la tua finestra fertile stimata: i giorni intorno all\'ovulazione in cui la gravidanza è più probabile, in base ai tempi tipici.';

  @override
  String get insightFertile2 =>
      'Alcune persone notano un lieve rialzo della temperatura basale o cambiamenti nel muco cervicale intorno all\'ovulazione.';

  @override
  String get insightLuteal1 =>
      'Il progesterone sale dopo l\'ovulazione: è spesso il momento in cui compaiono sintomi premestruali come sbalzi d\'umore o gonfiore.';

  @override
  String get insightLuteal2 =>
      'Se non è avvenuto un impianto, verso la fine di questa fase i livelli ormonali calano e questo innesca le mestruazioni successive.';

  @override
  String get insightUnknown1 =>
      'La durata del ciclo varia molto da persona a persona — tra 21 e 35 giorni è considerata tipica.';

  @override
  String get insightsPhaseTipsTitle => 'Potrebbe farti bene in questa fase';

  @override
  String get tipFitnessLabel => 'Movimento';

  @override
  String get tipNutritionLabel => 'Alimentazione';

  @override
  String get tipFitnessMenstrual =>
      'Un movimento dolce — camminare, fare stretching o yoga rigenerante — può risultare più piacevole di un allenamento intenso in questi giorni.';

  @override
  String get tipFitnessFollicular =>
      'In questa fase l\'energia spesso aumenta: è una buona finestra per provare un allenamento nuovo o spingere un po\' di più.';

  @override
  String get tipFitnessFertile =>
      'Molte persone si sentono al massimo dell\'energia qui: è una buona fase per allenamenti più intensi, se ti va.';

  @override
  String get tipFitnessLuteal =>
      'Se l\'energia cala verso la fine di questa fase, un lavoro di forza a bassa intensità o il nuoto possono risultare più sostenibili.';

  @override
  String get tipFitnessUnknown =>
      'Qualunque movimento oggi ti faccia sentire bene è una buona scelta — non esiste un\'unica routine \"giusta\" per ogni giorno.';

  @override
  String get tipNutritionMenstrual =>
      'Gli alimenti ricchi di ferro come verdure a foglia verde, lenticchie e carne rossa possono aiutare a compensare ciò che il corpo perde questa settimana.';

  @override
  String get tipNutritionFollicular =>
      'Pasti più leggeri e freschi spesso vanno bene mentre l\'energia sale — ma non esiste un unico modo \"giusto\" di mangiare in questa fase.';

  @override
  String get tipNutritionFertile =>
      'Bere a sufficienza e mantenere pasti equilibrati sostiene l\'energia in questa fase che si sente più attiva.';

  @override
  String get tipNutritionLuteal =>
      'Le voglie possono cambiare qui: carboidrati complessi e alimenti ricchi di magnesio come frutta secca e cioccolato fondente sono scelte comuni.';

  @override
  String get tipNutritionUnknown =>
      'Pasti equilibrati e regolari sono una buona base quando la fase non è ancora chiara.';

  @override
  String get predictionSettingsEntry => 'Impostazioni di previsione';

  @override
  String get predictionSettingsIntro =>
      'Queste sono ipotesi, mostrate apertamente. Una volta registrati 2 cicli completi, la previsione reale nella Home viene calcolata dai tuoi dati — questi numeri smettono di essere usati per quello.';

  @override
  String get predictionSettingsPeriodLengthLabel =>
      'Durata tipica delle mestruazioni';

  @override
  String get predictionSettingsCycleLengthLabel => 'Durata tipica del ciclo';

  @override
  String get predictionSettingsCycleLengthHint =>
      'Serve a dimensionare l\'anello nella Home finché non ci sono dati reali.';

  @override
  String get predictionSettingsLutealLabel => 'Durata della fase luteale';

  @override
  String get predictionSettingsLutealHint =>
      'I giorni tipici tra l\'ovulazione e le mestruazioni successive. Serve a collocare la finestra fertile stimata — questo valore continua a essere usato anche dopo l\'inizio delle previsioni reali.';

  @override
  String get dayLogEnergyLabel => 'Energia';

  @override
  String get energyLevelLow => 'Bassa';

  @override
  String get energyLevelMedium => 'Media';

  @override
  String get energyLevelHigh => 'Alta';

  @override
  String get energyLevelEnergetic => 'Al massimo';

  @override
  String get dayLogSkinHairLabel => 'Pelle e capelli';

  @override
  String get skinHealthyGlow => 'Pelle luminosa';

  @override
  String get skinRedness => 'Rossore';

  @override
  String get skinDryness => 'Secchezza';

  @override
  String get skinOiliness => 'Pelle grassa';

  @override
  String get hairGoodDay => 'Giornata sì per i capelli';

  @override
  String get hairBadDay => 'Giornata no per i capelli';

  @override
  String get hairLoss => 'Caduta dei capelli';

  @override
  String get scalpOily => 'Cuoio capelluto grasso';

  @override
  String get dayLogBreastExamLabel => 'Autopalpazione del seno';

  @override
  String get breastExamAllNormal => 'Nulla di insolito';

  @override
  String get breastExamLump => 'Nodulo';

  @override
  String get breastExamIndentation => 'Infossamento';

  @override
  String get breastExamRedness => 'Rossore';

  @override
  String get breastExamCrackedNipple => 'Capezzolo screpolato';

  @override
  String get breastExamDischarge => 'Secrezione dal capezzolo';

  @override
  String get cervixPositionLabel => 'Posizione della cervice';

  @override
  String get cervixPositionLow => 'Bassa';

  @override
  String get cervixPositionMedium => 'Media';

  @override
  String get cervixPositionHigh => 'Alta';

  @override
  String get cervixOpeningLabel => 'Apertura della cervice';

  @override
  String get cervixOpeningClosed => 'Chiusa';

  @override
  String get cervixOpeningMedium => 'Media';

  @override
  String get cervixOpeningOpen => 'Aperta';

  @override
  String get cervixFirmnessLabel => 'Consistenza della cervice';

  @override
  String get cervixFirmnessSoft => 'Morbida';

  @override
  String get cervixFirmnessMedium => 'Media';

  @override
  String get cervixFirmnessFirm => 'Soda';

  @override
  String get dayLogWaterLabel => 'Acqua';

  @override
  String get dayLogSleepLabel => 'Sonno';

  @override
  String get dayLogWeightLabel => 'Peso';

  @override
  String get dayLogMedicationsLabel => 'Farmaci';

  @override
  String get dayLogAddMedication => 'Aggiungi farmaco';

  @override
  String get dayLogMedicationNameHint => 'Nome del farmaco';

  @override
  String get dayLogBirthControlLabel => 'Contraccezione';

  @override
  String get dayLogOtherMedicationsLabel => 'Altri farmaci';

  @override
  String get birthControlPillTaken => 'Pillola presa';

  @override
  String get birthControlPillLate => 'Pillola presa in ritardo';

  @override
  String get birthControlPillMissed => 'Pillola dimenticata';

  @override
  String get birthControlPatch => 'Cerotto';

  @override
  String get birthControlRing => 'Anello';

  @override
  String get birthControlInjection => 'Iniezione';

  @override
  String get birthControlImplant => 'Impianto';

  @override
  String get birthControlIud => 'Spirale';

  @override
  String get navAssistant => 'Assistente';

  @override
  String get assistantTitle => 'Assistente Vera';

  @override
  String get assistantEndChatTitle => 'Terminare questa chat?';

  @override
  String get assistantEndChatBody =>
      'I messaggi sono solo in memoria e non vengono salvati da nessuna parte, quindi non si possono recuperare.';

  @override
  String get assistantEndChatConfirm => 'Termina chat';

  @override
  String get assistantInputHint => 'Chiedi del tuo ciclo…';

  @override
  String get assistantIntro =>
      'Ciao! Posso rispondere a domande su mestruazioni, ciclo e su come funziona Vera — qui sul tuo telefono, nulla lascia il dispositivo. Non sono un medico e questo non è un consiglio medico.';

  @override
  String get insightMenstrual3 =>
      'Il sangue mestruale non è \"sangue sporco\": è un misto di sangue ed endometrio, una parte del tutto normale del ciclo.';

  @override
  String get insightMenstrual4 =>
      'Un calore dolce sul basso ventre allevia davvero i crampi — la borsa dell\'acqua calda è un classico supportato dalle evidenze.';

  @override
  String get insightMenstrual5 =>
      'Il flusso è spesso più abbondante nei primi due giorni e poi diminuisce: è uno schema tipico.';

  @override
  String get insightMenstrual6 =>
      'Sentire più stanchezza durante le mestruazioni è comune — con il sangue mestruale il corpo perde ferro.';

  @override
  String get insightFollicular3 =>
      'Dopo le mestruazioni gli estrogeni ricostruiscono l\'endometrio: il corpo si sta preparando da capo.';

  @override
  String get insightFollicular4 =>
      'In questa fase la pelle appare spesso più pulita, mentre i livelli ormonali si stabilizzano.';

  @override
  String get insightFollicular5 =>
      'Per molte persone resistenza e tempi di reazione raggiungono il picco nella fase follicolare avanzata.';

  @override
  String get insightFollicular6 =>
      'La durata di questa fase è ciò che varia di più tra le persone — la fase luteale è molto più costante.';

  @override
  String get insightFertile3 =>
      'Un ovulo vive circa 12–24 ore, ma gli spermatozoi possono sopravvivere fino a 5 giorni: per questo la finestra fertile copre più giorni.';

  @override
  String get insightFertile4 =>
      'Intorno all\'ovulazione il muco cervicale diventa spesso trasparente ed elastico — simile all\'albume crudo.';

  @override
  String get insightFertile5 =>
      'Alcune persone avvertono una fitta breve da un lato al momento dell\'ovulazione — ha perfino un nome: mittelschmerz.';

  @override
  String get insightFertile6 =>
      'La temperatura basale sale leggermente *dopo* l\'ovulazione: la conferma, non la prevede.';

  @override
  String get insightLuteal3 =>
      'Il progesterone raggiunge il picco circa una settimana dopo l\'ovulazione: in quei giorni gonfiore e tensione al seno sono comuni.';

  @override
  String get insightLuteal4 =>
      'La voglia di carboidrati prima delle mestruazioni è reale: nella fase luteale il fabbisogno energetico sale leggermente.';

  @override
  String get insightLuteal5 =>
      'I sintomi premestruali di solito si attenuano entro un giorno o due dall\'inizio del sanguinamento.';

  @override
  String get insightLuteal6 =>
      'Una routine del sonno costante può ammorbidire in modo evidente i cali d\'umore di fine fase luteale.';

  @override
  String get insightUnknown2 =>
      'Spesso bastano tre cicli registrati perché il tuo schema personale inizi a emergere.';

  @override
  String get insightUnknown3 =>
      'I cicli sono personali: confrontare il tuo con quello di qualcun altro raramente dice qualcosa di utile.';

  @override
  String get insightUnknown4 =>
      'Stress, viaggi e malattie possono spostare l\'ovulazione — mestruazioni \"in ritardo\" spesso significano solo un\'ovulazione tardiva.';

  @override
  String get settingsThemeLabel => 'Tema';

  @override
  String get settingsThemeSystem => 'Sistema';

  @override
  String get settingsThemeLight => 'Chiaro';

  @override
  String get settingsThemeDark => 'Scuro';

  @override
  String get settingsMascotLabel => 'La tua mascotte';

  @override
  String get mascotDroplet => 'Goccia';

  @override
  String get mascotFlower => 'Fiore';

  @override
  String get mascotMoon => 'Luna';

  @override
  String get mascotNone => 'Nessuna';

  @override
  String homeWindowCountdown(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: 'La finestra prevista inizia tra circa $days giorni',
      one: 'La finestra prevista inizia tra circa $days giorno',
    );
    return '$_temp0';
  }

  @override
  String homeOvulationCountdown(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: 'Ovulazione stimata tra circa $days giorni',
      one: 'Ovulazione stimata tra circa $days giorno',
    );
    return '$_temp0';
  }

  @override
  String get homeQuickLogTitle => 'Come si sente il tuo corpo oggi?';

  @override
  String get actionSave => 'Salva';

  @override
  String get insightsTrackerHubTitle => 'I tuoi monitoraggi';

  @override
  String get trackerHistoryEmpty => 'Nessun dato in questo intervallo';

  @override
  String get trackerStatAverage => 'Media';

  @override
  String get trackerStatLowest => 'Minimo';

  @override
  String get trackerStatHighest => 'Massimo';

  @override
  String get trackerStatLatest => 'Ultimo';

  @override
  String get rangeFilter1m => '1 mese';

  @override
  String get rangeFilter3m => '3 mesi';

  @override
  String get rangeFilter6m => '6 mesi';

  @override
  String get dayLogOvulationTestLabel => 'Test di ovulazione';

  @override
  String get ovulationTestNegative => 'Negativo';

  @override
  String get ovulationTestPositive => 'Positivo';

  @override
  String get ovulationTestLow => 'Basso';

  @override
  String get ovulationTestHigh => 'Alto';

  @override
  String get ovulationTestPeak => 'Picco';

  @override
  String get pregnancyTestLabel => 'Test di gravidanza';

  @override
  String get pregnancyTestPositive => 'Positivo';

  @override
  String get pregnancyTestFaint => 'Linea tenue';

  @override
  String get pregnancyTestNegative => 'Negativo';

  @override
  String get settingsOvulationTestToggle => 'Test di ovulazione';

  @override
  String get settingsRemindersOvulationLabel => 'Avviso finestra fertile';

  @override
  String get reminderOvulationTitle =>
      'La finestra fertile stimata si avvicina';

  @override
  String get reminderOvulationBody =>
      'In base ai cicli che hai registrato, la tua finestra fertile stimata potrebbe iniziare presto.';

  @override
  String trackerEntriesCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count voci',
      one: '$count voce',
    );
    return '$_temp0';
  }

  @override
  String get trackerLowSampleNote =>
      'Con così poche voci le percentuali non sono ancora affidabili — diventeranno più precise man mano che ne registri altre.';

  @override
  String get assistantTyping => 'Vera sta scrivendo…';

  @override
  String get premiumTitle => 'Vera Premium';

  @override
  String get premiumHeadline => 'Vera Premium';

  @override
  String get premiumSubhead =>
      'Tutte le funzioni di monitoraggio restano gratuite per sempre — la tua cronologia non viene mai bloccata. Premium aggiunge i tuoi monitoraggi personali, statistiche più approfondite, i tuoi promemoria e aspetti extra, e toglie la pubblicità.';

  @override
  String get premiumBenefitNoAds =>
      'Nessuna pubblicità, in nessuna parte dell\'app';

  @override
  String get premiumBenefitSupport =>
      'Sostieni un\'app indipendente che mette la privacy al primo posto';

  @override
  String get premiumMonthly => 'Mensile';

  @override
  String get premiumYearly => 'Annuale';

  @override
  String get premiumYearlyNote => 'Addebito una volta all\'anno';

  @override
  String premiumPerMonth(String price) {
    return '$price / mese';
  }

  @override
  String get premiumBilledMonthly => 'Fatturato ogni mese';

  @override
  String get premiumStaysFreeTitle => 'Cosa resta gratis';

  @override
  String get premiumStaysFreeBody =>
      'Il calendario, tutto il tuo storico, le statistiche di base e l\'esportazione restano gratis per sempre. Premium aggiunge, non toglie mai nulla.';

  @override
  String get premiumSubscribeCta => 'Continua';

  @override
  String get premiumRestore => 'Ripristina acquisto';

  @override
  String get premiumCancelNote =>
      'Puoi annullare quando vuoi dall\'account del tuo store. Nessun conto alla rovescia, nessuna pressione — se non è il momento, la versione gratuita continua a funzionare esattamente come oggi.';

  @override
  String get premiumActiveBadge => 'Premium è attivo';

  @override
  String get premiumDevToggle => 'Simula Premium (sviluppo)';

  @override
  String get settingsPremiumEntry => 'Vera Premium';

  @override
  String get adTestNotice =>
      'Annuncio di prova — non è ancora una posizione reale';

  @override
  String get settingsPregnancyModeLabel => 'Modalità gravidanza';

  @override
  String get pregnancyLmpLabel => 'Primo giorno delle ultime mestruazioni';

  @override
  String pregnancyWeekLabel(int weeks, int days) {
    return 'Settimana $weeks, giorno $days';
  }

  @override
  String get pregnancyDueDateLabel => 'Data presunta del parto';

  @override
  String pregnancyDaysLeft(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: 'Mancano circa $days giorni',
      one: 'Manca circa $days giorno',
    );
    return '$_temp0';
  }

  @override
  String pregnancyTrimesterLabel(int n) {
    return 'Trimestre $n';
  }

  @override
  String get pregnancyDisclaimer =>
      'Le date sono stimate dalle tue ultime mestruazioni con la regola standard dei 280 giorni. Un\'ecografia dà una data più precisa e un\'ovulazione tardiva sposta questi numeri — questa è informazione, non assistenza medica.';

  @override
  String get pregnancySizeLabel => 'Dimensione del bebè';

  @override
  String get pregnancySizeUnder5 => 'Seme di papavero (~2 mm)';

  @override
  String get pregnancySizeUnder9 => 'Mirtillo (~1.6 cm)';

  @override
  String get pregnancySizeUnder13 => 'Lime (~5.4 cm)';

  @override
  String get pregnancySizeUnder20 => 'Avocado (~11.6 cm)';

  @override
  String get pregnancySizeUnder28 => 'Mango (~30 cm)';

  @override
  String get pregnancySizeUnder34 => 'Ananas (~44 cm)';

  @override
  String get pregnancySizeUnder38 => 'Melone (~46 cm)';

  @override
  String get pregnancySizeTerm => 'Piccola anguria (~51 cm)';

  @override
  String get pregnancyNoteUnder5 =>
      'La maggior parte delle persone non nota ancora nulla — poiché l\'età gestazionale si conta dalle ultime mestruazioni, le prime due settimane precedono in realtà il concepimento.';

  @override
  String get pregnancyNoteUnder9 =>
      'Nausea, seno teso e stanchezza sono frequenti in queste settimane. Un buon momento per fissare la prima visita.';

  @override
  String get pregnancyNoteUnder13 =>
      'La fine del primo trimestre si avvicina; in molte persone la nausea inizia ad attenuarsi in questo periodo.';

  @override
  String get pregnancyNoteUnder20 =>
      'L\'energia spesso torna in questa fase. I primi movimenti possono farsi sentire in qualsiasi momento tra la settimana 16 e la settimana 22.';

  @override
  String get pregnancyNoteUnder28 =>
      'I movimenti diventano più netti e iniziano a seguire un ritmo. Mal di schiena e bruciore di stomaco sono frequenti in questa fase.';

  @override
  String get pregnancyNoteUnder34 =>
      'Sei nel terzo trimestre. Fiato corto, minzione frequente e contrazioni di Braxton-Hicks sono frequenti.';

  @override
  String get pregnancyNoteUnder38 =>
      'Il bebè si prepara alla nascita. Un buon momento per la borsa per l\'ospedale e il piano del parto.';

  @override
  String get pregnancyNoteTerm =>
      'Sei a termine — il parto può avvenire in qualsiasi momento tra la settimana 37 e la 42; la settimana 40 è una media, non una scadenza.';

  @override
  String get pregnancyWeeklyNoteTitle => 'Questa settimana';

  @override
  String get pregnancyNeedsLmp =>
      'Aggiungi il primo giorno delle ultime mestruazioni per iniziare il monitoraggio.';

  @override
  String get pregnancyOutOfRange =>
      'Quella data risale a più di 42 settimane fa — aggiornala o disattiva la modalità gravidanza.';

  @override
  String get partnerShareTitle => 'Condividi un riepilogo con il partner';

  @override
  String get partnerShareBody =>
      'Crea un breve riepilogo testuale — la tua fase attuale e la finestra stimata — che invii tu con l\'app che preferisci. Non c\'è sincronizzazione in tempo reale né un account per il partner: nulla viene condiviso se non lo invii tu.';

  @override
  String get partnerShareCta => 'Crea riepilogo';

  @override
  String get partnerSummaryHeader => 'Riepilogo del ciclo da Vera';

  @override
  String get settingsHomeThemeLabel => 'Sfondo della Home';

  @override
  String get homeThemeWheat => 'Grano';

  @override
  String get homeThemeSky => 'Cielo';

  @override
  String get homeThemeField => 'Campo';

  @override
  String get homeThemeBlossom => 'Fiore';

  @override
  String get homeThemePlain => 'Tinta unita';

  @override
  String get backupNudgeTitle => 'Conserva una copia dei tuoi dati';

  @override
  String get backupNudgeBody =>
      'Tutto esiste solo su questo telefono. Se lo perdi, si rompe o viene ripristinato, la tua cronologia se ne va con lui — un backup cifrato richiede un attimo e solo tu puoi aprirlo.';

  @override
  String get backupNudgeCta => 'Fai il backup ora';

  @override
  String get backupNudgeDismiss => 'Più tardi';

  @override
  String backupLastDone(String date) {
    return 'Ultimo backup: $date';
  }

  @override
  String get backupNever => 'Ancora nessun backup';

  @override
  String get settingsRemindersBackupLabel => 'Ricordami di fare un backup';

  @override
  String get reminderBackupTitle => 'È ora di fare un backup di Vera';

  @override
  String get reminderBackupBody =>
      'La tua cronologia esiste solo su questo telefono. Un rapido backup cifrato la mette al sicuro.';

  @override
  String get notificationChannelPeriodStart => 'Mestruazioni in arrivo';

  @override
  String get notificationChannelPeriodEnd => 'Controllo fine mestruazioni';

  @override
  String get notificationChannelMedication => 'Farmaci';

  @override
  String get notificationChannelWater => 'Acqua';

  @override
  String get notificationChannelAppointment => 'Appuntamento';

  @override
  String get notificationChannelOvulation => 'Finestra fertile';

  @override
  String get notificationChannelBackup => 'Promemoria backup';

  @override
  String get calendarDayDetailTitle => 'Questo giorno';

  @override
  String get calendarDayNothingLogged =>
      'Ancora nessun dato registrato per questo giorno';

  @override
  String get calendarDayOpenLog => 'Apri il registro del giorno';

  @override
  String get cycleHistoryTitle => 'Cicli passati';

  @override
  String get cycleTrendsTitle => 'Andamento del ciclo';

  @override
  String get cycleHistoryEmpty =>
      'Registra un paio di mestruazioni e la cronologia dei cicli comparirà qui.';

  @override
  String get cycleHistoryOngoing => 'In corso';

  @override
  String cycleHistoryLength(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: 'Ciclo di $days giorni',
      one: 'Ciclo di $days giorno',
    );
    return '$_temp0';
  }

  @override
  String cycleHistoryPeriodLength(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: 'Le mestruazioni sono durate $days giorni',
      one: 'Le mestruazioni sono durate 1 giorno',
    );
    return '$_temp0';
  }

  @override
  String cycleHistoryVsAverage(String diff) {
    return '$diff rispetto alla tua media';
  }

  @override
  String get insightsCycleHistoryEntry => 'Cicli passati';

  @override
  String get homeEmptyTitle => 'Iniziamo dalle tue ultime mestruazioni';

  @override
  String get homeEmptyBody =>
      'Tocca il pulsante qui sopra il giorno in cui iniziano le mestruazioni. Dopo due cicli completi Vera può iniziare a stimare — fino ad allora non farà finta di sapere.';

  @override
  String get homeEmptyBackdate => 'Sono già iniziate prima';

  @override
  String get settingsAdPrivacyEntry => 'Opzioni privacy per gli annunci';

  @override
  String a11yCycleRing(int day, int length) {
    return 'Giorno $day di un ciclo di circa $length giorni';
  }

  @override
  String a11yChartSummary(int count, String min, String max) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Grafico con $count voci, da $min a $max',
      one: 'Grafico con $count voce, da $min a $max',
    );
    return '$_temp0';
  }

  @override
  String a11yPhaseBar(int day, int length) {
    return 'Avanzamento del ciclo: giorno $day di circa $length';
  }

  @override
  String a11yFrequencyItem(String label, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count volte',
      one: '$count volta',
    );
    return '$label: $_temp0';
  }

  @override
  String get importTitle => 'Importa da un\'altra app';

  @override
  String get importBody =>
      'Esporta la cronologia dalla tua app precedente in formato CSV, poi scegli il file qui. Vengono importati solo le date e il flusso: i termini per sintomi e umore cambiano da app ad app e Vera non indovinerà cosa intendevi.';

  @override
  String get importPickFile => 'Scegli il file CSV';

  @override
  String importPreview(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Trovati $count giorni di cronologia',
      one: 'Trovato $count giorno di cronologia',
    );
    return '$_temp0';
  }

  @override
  String importSkipped(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count righe non sono state lette e verranno escluse',
      one: '$count riga non è stata letta e verrà esclusa',
    );
    return '$_temp0';
  }

  @override
  String get importConfirm => 'Aggiungi alla mia cronologia';

  @override
  String get importMergeNote =>
      'I giorni importati vengono uniti. I giorni già registrati in Vera restano invariati.';

  @override
  String importDone(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Importati $count giorni',
      one: 'Importato $count giorno',
    );
    return '$_temp0';
  }

  @override
  String get importErrorEmpty => 'Questo file sembra vuoto.';

  @override
  String get importErrorNoDate =>
      'Non è stata trovata una colonna con le date in questo file.';

  @override
  String get settingsImportEntry => 'Importa da un\'altra app';

  @override
  String get settingsHealthSyncLabel =>
      'Sincronizza con Apple Health / Health Connect';

  @override
  String get settingsHealthSyncBody =>
      'Scrive nell\'app salute del telefono solo il flusso mestruale, il peso e la temperatura basale. Sintomi, umore e note restano in Vera. Non viene letto nulla in senso inverso.';

  @override
  String healthSyncBackfilled(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Inviati $count giorni alla tua app salute',
      one: 'Inviato $count giorno alla tua app salute',
    );
    return '$_temp0';
  }

  @override
  String get healthSyncDenied =>
      'L\'autorizzazione non è stata concessa, quindi la sincronizzazione resta disattivata.';

  @override
  String get settingsDiagnosticsEntry => 'Diagnostica';

  @override
  String get diagnosticsBody =>
      'Se l\'app si comporta male, i dettagli tecnici vengono registrati qui — solo su questo dispositivo. Non viene inviato nulla se non lo decidi tu, e puoi leggere prima esattamente cosa invieresti.';

  @override
  String get diagnosticsEmpty =>
      'Nessuna registrazione — non è stato rilevato alcun problema.';

  @override
  String get diagnosticsShare => 'Invia allo sviluppatore';

  @override
  String get diagnosticsClear => 'Cancella';

  @override
  String get diagnosticsNoteLabel => 'Cosa è successo? (facoltativo)';

  @override
  String get diagnosticsTechnicalDetail => 'Dettagli tecnici';

  @override
  String get unitHoursShort => 'h';

  @override
  String get unitMinutesShort => 'min';

  @override
  String get unitHoursLong => 'ore';

  @override
  String get unitMinutesLong => 'minuti';

  @override
  String get unitMilliliters => 'ml';

  @override
  String get unitKilograms => 'kg';

  @override
  String get calendarJumpTitle => 'Vai al mese';

  @override
  String get calendarJumpYearLabel => 'Anno';

  @override
  String get settingsAdPrivacyUnavailable =>
      'Nella tua regione non sono previste opzioni di personalizzazione degli annunci — qui gli annunci sono già non personalizzati.';

  @override
  String get settingsGroupAppearance => 'Aspetto';

  @override
  String get settingsGroupTracking => 'Preferenze di monitoraggio';

  @override
  String get dayLogCustomTagsLabel => 'I miei monitoraggi';

  @override
  String get customTagAddButton => 'Aggiungi un monitoraggio';

  @override
  String get customTagDialogTitle => 'Nuovo monitoraggio';

  @override
  String get customTagDialogHint => 'es. emicrania, palestra, insonnia';

  @override
  String get customTagManageEntry => 'Gestisci i miei monitoraggi';

  @override
  String get customTagRenameTitle => 'Rinomina monitoraggio';

  @override
  String get customTagDeleteTitle => 'Eliminare questo monitoraggio?';

  @override
  String get customTagDeleteBody =>
      'Verrà rimosso da tutti i giorni in cui l\'hai usato. Gli altri dati restano invariati.';

  @override
  String get customTagEmpty => 'Non hai ancora monitoraggi personali.';

  @override
  String get premiumLockedTitle => 'Funzione Premium';

  @override
  String get premiumLockedAction => 'Scopri Premium';

  @override
  String get premiumBenefitCustomTrackers =>
      'Monitora quello che vuoi, con parole tue';

  @override
  String get premiumBenefitAdvancedInsights =>
      'Statistiche avanzate: cosa tende a succedere, e quando';

  @override
  String get premiumBenefitPersonalisation => 'Sfondi e compagni aggiuntivi';

  @override
  String get premiumBenefitAdvancedReminders =>
      'Promemoria secondo i tuoi tempi';

  @override
  String get advancedInsightsTitle => 'Statistiche avanzate';

  @override
  String get advancedInsightsEntry => 'Statistiche avanzate';

  @override
  String get advancedInsightsNotEnough =>
      'Registra tre cicli completi e i tuoi schemi compariranno qui. Con meno, qualsiasi \"schema\" sarebbe solo una coincidenza.';

  @override
  String get advancedInsightsPatternsTitle => 'Quando tendono a comparire';

  @override
  String advancedInsightsPatternLine(String label, String segment) {
    return '$label — più spesso $segment';
  }

  @override
  String advancedInsightsPatternDetail(int count, int day) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count giorni registrati, intorno al giorno $day del ciclo',
      one: '$count giorno registrato, intorno al giorno $day del ciclo',
    );
    return '$_temp0';
  }

  @override
  String advancedInsightsNoPattern(String label) {
    return '$label — ancora nessuna tempistica chiara';
  }

  @override
  String get advancedInsightsTrendTitle => 'Durata del ciclo nel tempo';

  @override
  String advancedInsightsDriftLonger(String days, String cycles) {
    return 'Confrontando i tuoi primi $cycles cicli con gli ultimi $cycles, quelli recenti durano circa $days giorni in più.';
  }

  @override
  String advancedInsightsDriftShorter(String days, String cycles) {
    return 'Confrontando i tuoi primi $cycles cicli con gli ultimi $cycles, quelli recenti durano circa $days giorni in meno.';
  }

  @override
  String advancedInsightsDriftStable(String cycles) {
    return 'Confrontando i tuoi primi $cycles cicli con gli ultimi $cycles, la durata del tuo ciclo è rimasta più o meno la stessa.';
  }

  @override
  String get advancedInsightsDriftNotEnough =>
      'Quando avrai sei cicli completi, Vera potrà confrontare i primi con i più recenti per vedere se la durata del tuo ciclo sta cambiando.';

  @override
  String get advancedInsightsMoodTitle => 'Umore per parte del ciclo';

  @override
  String get advancedInsightsDisclaimer =>
      'Questi sono soltanto conteggi di ciò che hai registrato, nulla di più. Non sono una diagnosi, e uno schema qui non è una causa.';

  @override
  String get segmentPeriod => 'durante le mestruazioni';

  @override
  String get segmentAfterPeriod => 'dopo le mestruazioni';

  @override
  String get segmentMidCycle => 'a metà ciclo';

  @override
  String get segmentBeforePeriod => 'prima delle mestruazioni';

  @override
  String get customRemindersEntry => 'I miei promemoria';

  @override
  String get customRemindersTitle => 'I miei promemoria';

  @override
  String get customRemindersEmpty => 'Non hai ancora promemoria personali.';

  @override
  String get customRemindersAdd => 'Aggiungi un promemoria';

  @override
  String get customReminderLabelHint => 'es. prendere la pillola, bere acqua';

  @override
  String get customReminderLockScreenNote =>
      'Il testo del promemoria compare sulla schermata di blocco, quindi scrivilo tenendo conto di quanto vuoi che resti privato.';

  @override
  String get customReminderDelete => 'Elimina promemoria';

  @override
  String get homeThemeDusk => 'Crepuscolo';

  @override
  String get homeThemeMeadow => 'Prato';

  @override
  String get homeThemePetal => 'Petalo';

  @override
  String get homeThemeBloom => 'Fioritura';

  @override
  String get homeThemeOcean => 'Oceano';

  @override
  String get homeThemeAutumn => 'Autunno';

  @override
  String get homeThemeNight => 'Notte';

  @override
  String get mascotStar => 'Stella';

  @override
  String get mascotLeaf => 'Foglia';

  @override
  String get mascotCat => 'Gatto';

  @override
  String get mascotRabbit => 'Coniglio';

  @override
  String get mascotBird => 'Uccellino';

  @override
  String get tipDetailWhatsHappening => 'Cosa succede nel tuo corpo';

  @override
  String get tipDetailGeneralHeading => 'Suggerimenti generali';

  @override
  String get tipDetailDisclaimer =>
      'Queste sono informazioni generali, non un consiglio medico personale. Ogni corpo reagisce in modo diverso, e come ti senti davvero conta più di qualsiasi suggerimento riportato qui. Se qualcosa ti preoccupa, parlane con un medico.';

  @override
  String get phaseExplainerMenstrual =>
      'Stai sanguinando perché il rivestimento dell\'utero si sfalda. Estrogeni e progesterone sono al punto più basso del ciclo, ed è per questo che molte persone si sentono più stanche e più raccolte nei primi giorni. Il sanguinamento dura di solito dai tre ai sette giorni ed è più abbondante all\'inizio. I crampi nascono dalle contrazioni dell\'utero, innescate dalle prostaglandine — composti simili agli ormoni rilasciati mentre il rivestimento si sfalda, ed è anche il motivo per cui alcune persone hanno insieme mal di schiena o intestino più mosso. Il sanguinamento costa anche ferro, e questo spiega una parte della stanchezza. Calore, movimento e sonno di solito aiutano. Se la protezione si riempie ogni ora, se il sanguinamento supera nettamente la settimana o se il dolore ti impedisce di fare le cose normali, vale la pena parlarne con un medico invece di aspettare che passi.';

  @override
  String get phaseExplainerFollicular =>
      'Finito il sanguinamento, gli estrogeni ricominciano a salire. Nelle ovaie matura un gruppo di follicoli, ciascuno con un ovulo, e di norma solo uno arriva a essere rilasciato. Gli estrogeni ricostruiscono il rivestimento appena perso, e la maggior parte delle persone sente tornare energia, umore, pelle e resistenza insieme a loro. Questa è anche la parte del ciclo che varia di più tra le persone e tra un mese e l\'altro: stress, malattie, viaggi e sonno si fanno sentire soprattutto qui, allungandola o accorciandola. È la ragione onesta per cui una previsione è un intervallo e non una data: la seconda metà del ciclo è piuttosto stabile, ed è questa che si muove.';

  @override
  String get phaseExplainerFertile =>
      'Gli estrogeni sono vicini al picco e l\'ovulazione è attesa in questi giorni. Un picco di ormone luteinizzante innesca il rilascio dell\'ovulo circa un giorno o un giorno e mezzo dopo. L\'ovulo sopravvive all\'incirca dalle 12 alle 24 ore, ma gli spermatozoi possono restare vivi diversi giorni in un muco cervicale fertile — ecco perché la finestra si conta in più giorni e non in uno solo. Il muco di solito diventa trasparente, filante e scivoloso, un po\' come l\'albume crudo; alcune persone notano più desiderio, seno più sensibile o una fitta breve da un lato. L\'energia è spesso al punto più alto del ciclo. Ricorda che questa finestra è una stima ricavata dal tuo storico, non una misurazione, e non è un metodo contraccettivo.';

  @override
  String get phaseExplainerLuteal =>
      'Dopo l\'ovulazione il follicolo svuotato diventa corpo luteo e inizia a produrre progesterone, che mantiene stabile il rivestimento uterino nel caso si impianti una gravidanza. Se non accade, progesterone ed estrogeni calano bruscamente e arrivano le mestruazioni. Questa metà del ciclo è la più costante, di solito intorno ai 12-14 giorni. Il progesterone alza leggermente la temperatura a riposo — è il cambiamento che coglie un termometro basale — e può rallentare la digestione, il che spiega parte del gonfiore. Il calo finale è ciò che scatena la sindrome premestruale in molte persone: seno teso, cambiamenti dell\'appetito, sonno interrotto, mal di testa e sbalzi d\'umore, che di solito si attenuano quando inizia il sanguinamento. Se questi sintomi ti disturbano il lavoro o le relazioni nella maggior parte dei mesi, vale la pena parlarne con un medico.';

  @override
  String get phaseExplainerUnknown =>
      'Non ci sono ancora abbastanza registrazioni per dire in che fase sei. Vera ha bisogno di almeno due cicli completi — l\'inizio di un ciclo e poi il successivo — per calcolare la tua media e la tua variabilità, e preferisce dirlo piuttosto che inventarsi una fase. Nel frattempo non si perde nulla: ogni giorno che registri fa parte di quel primo calcolo, e la stima si restringe man mano che lo storico cresce. Fino ad allora, i suggerimenti qui sotto sono generali e valgono in qualsiasi punto del ciclo.';

  @override
  String get tipFitnessDetailMenstrual =>
      'L\'allenamento intenso non è adatto alla maggior parte delle persone nei primi giorni, e non è una questione di disciplina: l\'energia è davvero più bassa, e perdere ferro con il sanguinamento rende il lavoro di resistenza più faticoso di quanto fosse la stessa seduta la settimana scorsa. Camminare, allungamenti dolci, yoga restorative e lavoro sul respiro migliorano il flusso sanguigno e possono smussare i crampi; in alcune persone muoversi con regolarità per tutto il mese riduce l\'intensità dei crampi più di qualsiasi cosa fatta nel giorno stesso. Se ti senti bene, non c\'è motivo di evitare le sedute impegnative: sanguinare non è una ragione per smettere di allenarsi, e molte atlete gareggiano proprio in quei giorni. Qualche nota pratica: le sedute lunghe e impegnative nei giorni di flusso abbondante possono accentuare la stanchezza, il calore sul basso ventre prima di iniziare rende il movimento più confortevole, e bere un po\' più del solito aiuta con il mal di testa di questi giorni. Giudica la seduta da come la senti mentre la fai, non da com\'era la tua settimana migliore.';

  @override
  String get tipFitnessDetailFollicular =>
      'Con gli estrogeni in salita la maggior parte delle persone si sente più forte e più resistente; di solito è il periodo migliore del ciclo per iniziare qualcosa di nuovo, aggiungere carico o alzare il ritmo. La riparazione muscolare qui è relativamente efficiente, quindi le sedute dure vengono assorbite meglio e lasciano meno indolenzimento persistente. È anche una buona finestra per ciò che richiede testa lucida oltre che corpo forte: imparare un movimento nuovo, correggere la tecnica o affrontare una distanza più lunga del solito. Due avvertenze da tenere: aumenta gradualmente, perché avere molta energia non significa rischio zero di infortunio e la maggior parte degli infortuni da sovraccarico comincia in una buona settimana, non in una brutta. E proteggi il sonno: l\'adattamento avviene nel recupero, non durante la seduta.';

  @override
  String get tipFitnessDetailFertile =>
      'Energia e motivazione sono di solito al massimo, quindi le sedute impegnative funzionano bene — spesso i record personali cadono qui. Alcuni studi suggeriscono che le articolazioni siano un po\' più lasse intorno all\'ovulazione; l\'effetto pratico è discusso, ma un riscaldamento più lungo resta una precauzione poco costosa negli sport con cambi di direzione bruschi, salti e atterraggi. La temperatura corporea è ancora bassa rispetto alla seconda metà del ciclo, quindi il caldo limita meno di quanto farà tra una o due settimane. Una fitta breve da un lato del basso ventre intorno all\'ovulazione è frequente e di solito passa in poche ore. Se invece il dolore è forte, da un solo lato e persistente, se c\'è febbre o ti senti svenire, fermati e fatti controllare invece di continuare.';

  @override
  String get tipFitnessDetailLuteal =>
      'Con l\'avvicinarsi delle mestruazioni l\'energia può calare, la frequenza cardiaca può essere più alta a parità di sforzo e il recupero può allungarsi. È un\'oscillazione prevedibile, non un arretramento, e non cancella il lavoro delle ultime due settimane. Il progesterone alza leggermente la temperatura a riposo e rende più difficile disperdere calore, quindi le sedute con caldo o umidità qui sembrano sproporzionatamente dure: allenarsi nelle ore più fresche e bere più del necessario aiutano entrambi. Sedute moderate, una versione un po\' più leggera del lavoro di forza e la camminata sono di solito più sostenibili. Con gonfiore e seno sensibile, un reggiseno sportivo che sostiene bene e un riscaldamento più lungo fanno una differenza reale. Se l\'umore è basso, rendi la seduta breve e facile invece di saltarla del tutto: la soglia perché conti è più bassa di quanto sembri.';

  @override
  String get tipFitnessDetailUnknown =>
      'Anche senza conoscere la fase, muoversi aiuta in qualsiasi momento: l\'indicazione generale è circa 150 minuti di attività moderata a settimana, distribuiti sulla maggior parte dei giorni, più due sedute di rinforzo — e per quasi tutti questo schema rende più delle sedute molto intense occasionali. La costanza conta più dell\'intensità, e la seduta migliore è quella che ripeterai davvero la settimana prossima. Regolati su come ti senti: nei giorni stanchi una camminata conta, e una seduta breve fatta vale più di una lunga saltata. Dopo qualche ciclo registrato, qui compariranno suggerimenti specifici per fase.';

  @override
  String get tipNutritionDetailMenstrual =>
      'Il sanguinamento ti costa ferro; carne rossa, lenticchie, ceci, verdure a foglia verde scuro e melassa aiutano a reintegrarlo. Il ferro vegetale si assorbe nettamente meglio insieme alla vitamina C — spremere del limone su un piatto di lenticchie è la versione più pratica, e un\'insalata di pomodori accanto fa lo stesso. Tè e caffè durante il pasto riducono l\'assorbimento del ferro a causa dei tannini, quindi basta lasciare circa un\'ora di distanza; non serve rinunciarvi. Bere abbastanza acqua può alleviare la stanchezza e il mal di testa legati al sanguinamento, e gli alimenti ricchi di magnesio come frutta secca, semi e verdure scure aiutano alcune persone con i crampi. Nei giorni in cui la digestione va a rilento, pasti piccoli e regolari stanno meglio di quelli abbondanti. Se intorno alle mestruazioni ti senti spesso senza fiato, con capogiri o insolitamente esausta, vale la pena dirlo a un medico: la carenza di ferro è comune, si controlla facilmente, e non è qualcosa che debba diagnosticare un\'app.';

  @override
  String get tipNutritionDetailFollicular =>
      'Con l\'energia che torna, il corpo è in modalità ricostruzione: proteine a sufficienza, cereali integrali e verdure la sostengono, e questa è la fase in cui l\'appetito è di solito più stabile e più facile da gestire. Ha senso anche continuare a ricostituire le scorte di ferro dopo il sanguinamento invece di trattarlo come un compito della sola settimana mestruale: le scorte si rifanno in settimane, non in giorni. Non saltare i pasti è più semplice qui, e ti fa entrare più equilibrata negli sbalzi di appetito della fase successiva. Se vuoi cambiare il modo in cui mangi, questo periodo è di solito più clemente per cominciare rispetto alla settimana prima delle mestruazioni, quando voglie e umore basso fanno sembrare qualsiasi nuova routine più difficile di quanto sia.';

  @override
  String get tipNutritionDetailFertile =>
      'Qui non serve nessuna dieta particolare; pasti equilibrati e acqua a sufficienza fanno quasi tutto il lavoro. Alcune persone si sentono gonfie intorno all\'ovulazione: di solito è ormonale e passeggero, non colpa di ciò che hai mangiato. L\'appetito cala leggermente in alcune e aumenta in altre — entrambe le cose sono normali. Mantenere proteine e fibre nei pasti stabilizza l\'energia in quello che è spesso il tratto più attivo del mese. Se stai programmando una gravidanza, è un buon momento per chiedere a un medico dell\'acido folico, che di norma si consiglia prima del concepimento e non dopo — ma è una conversazione con lui, non un consiglio che debba dare un\'app.';

  @override
  String get tipNutritionDetailLuteal =>
      'L\'aumento dell\'appetito e la voglia di dolce mentre il progesterone sale sono molto comuni; è uno spostamento ormonale, non un problema di volontà, e il corpo in questa fase consuma davvero un po\' più energia. Aggiungere proteine e fibre ai pasti mantiene la glicemia più stabile e smorza la voglia molto meglio che provare a ignorarla — una voglia soddisfatta con qualcosa di sostanzioso di solito finisce prima di una contro cui combatti per un\'ora. Meno sale e più acqua possono alleviare il gonfiore; sembra il contrario ma non lo è: ben idratato, il corpo trattiene meno. Gli alimenti ricchi di magnesio (mandorle, noci, verdure scure, cioccolato fondente) riducono crampi e tensione in alcune persone. Ridurre la caffeina dopo mezzogiorno aiuta con il sonno interrotto di questa fase, e vale la pena tenere d\'occhio anche l\'alcol, perché frammenta il sonno proprio nel punto del ciclo in cui è già più leggero.';

  @override
  String get tipNutritionDetailUnknown =>
      'Qualunque sia la fase, ad aiutare di più sono sempre le stesse cose: pasti regolari, proteine a sufficienza, molta verdura, acqua a sufficienza e alimenti ricchi di ferro. Poiché il sanguinamento costa ferro, basta prestarci un po\' più attenzione in quei giorni: non serve una dieta diversa per ogni settimana del mese. Mangiare a orari più o meno costanti fa più per un\'energia stabile di qualsiasi singolo alimento, e non c\'è nessun ingrediente da eliminare perché un ciclo sia sano. Dopo qualche ciclo registrato, qui compariranno suggerimenti specifici per fase.';

  @override
  String get tipSleepLabel => 'Sonno';

  @override
  String get tipSleepMenstrual =>
      'I crampi e il disagio possono frammentare il sonno; una doccia calda o una borsa dell\'acqua calda prima di dormire può aiutare.';

  @override
  String get tipSleepFollicular =>
      'Con l\'energia in aumento, molte si sentono più sveglie — il vero bisogno di sonno però non diminuisce.';

  @override
  String get tipSleepFertile =>
      'Il leggero aumento di temperatura vicino all\'ovulazione può rendere un po\' più difficile addormentarsi; una stanza più fresca può compensare.';

  @override
  String get tipSleepLuteal =>
      'Il progesterone alza leggermente la temperatura a riposo e può alleggerire il sonno profondo; una stanza fresca e buia e un orario fisso aiutano di più qui.';

  @override
  String get tipSleepUnknown =>
      'La qualità del sonno spesso varia nel ciclo — solitamente più fragile appena prima e durante il ciclo. Un orario di sonno costante è la base più affidabile in ogni fase.';

  @override
  String get tipSleepDetailMenstrual =>
      'Durante il ciclo il sonno è spesso più frammentato — crampi, disagio e per alcune più frequenti visite in bagno possono svegliare di notte. Una doccia calda, una borsa dell\'acqua calda o uno stretching leggero prima di dormire possono alleviare i crampi. Se prendi antidolorifici, calcolarne il momento perché l\'effetto copra la prima parte della notte può proteggere il sonno iniziale. Se il sonno resta difficile, è normale — di solito migliora con la fase.';

  @override
  String get tipSleepDetailFollicular =>
      'Con l\'estrogeno in aumento, molte si sentono più sveglie ed energiche, il che può sembrare minor bisogno di sonno. Non è proprio così — restare svegli viene solo più facile. Mantenere un orario fisso qui ripaga più avanti, quando il sonno diventa più fragile in altre fasi.';

  @override
  String get tipSleepDetailFertile =>
      'Il leggero aumento di temperatura vicino all\'ovulazione può rendere un po\' più difficile addormentarsi, perché il corpo vuole naturalmente raffreddarsi prima di dormire. Una stanza più fresca, una coperta più leggera o una doccia calda prima di dormire possono compensare. Chi nota più desiderio o energia sociale in questa finestra potrebbe anche restare sveglia più a lungo per scelta.';

  @override
  String get tipSleepDetailLuteal =>
      'Il progesterone che sale dopo l\'ovulazione alza leggermente la temperatura a riposo, il che può alleggerire il sonno profondo — a volte come una lieve vampata, a volte solo come sonno meno rigenerante. Con l\'avvicinarsi del ciclo, la tensione premestruale può aggiungersi. Una stanza fresca e buia, meno schermo prima di dormire e un orario fisso aiutano di più qui.';

  @override
  String get tipSleepDetailUnknown =>
      'Non ci sono ancora dati sufficienti per stabilire la fase, ma la qualità del sonno che varia nel ciclo è uno schema comune — di solito più fragile appena prima e durante il ciclo, più stabile nella prima metà. La base più affidabile in ogni fase: orari di sonno e risveglio costanti, meno schermo prima di dormire e una stanza fresca e buia.';
}
