// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Portuguese (`pt`).
class AppLocalizationsPt extends AppLocalizations {
  AppLocalizationsPt([String locale = 'pt']) : super(locale);

  @override
  String get appTitle => 'Vera';

  @override
  String get actionSkip => 'Pular';

  @override
  String get actionContinue => 'Continuar';

  @override
  String get actionDone => 'Concluído';

  @override
  String get actionCancel => 'Cancelar';

  @override
  String get actionClear => 'Limpar';

  @override
  String get actionDelete => 'Excluir';

  @override
  String get actionEnable => 'Ativar';

  @override
  String get commonIDontKnow => 'Não sei';

  @override
  String get commonYes => 'Sim';

  @override
  String get commonNo => 'Não';

  @override
  String get commonNotSure => 'Não tenho certeza';

  @override
  String get pinSetupTitle => 'Criar um PIN';

  @override
  String get pinSetupEnterPrompt =>
      'Escolha um PIN de 6 dígitos para bloquear o app';

  @override
  String get pinSetupConfirmPrompt => 'Digite novamente para confirmar';

  @override
  String get pinSetupMismatch => 'Não conferem — vamos tentar de novo';

  @override
  String get pinSetupBiometricTitle => 'Desbloqueio mais rápido?';

  @override
  String get pinSetupBiometricBody =>
      'Você também pode desbloquear com a digital ou o rosto — seu PIN continua funcionando como alternativa.';

  @override
  String get lockScreenTitle => 'Bloqueado';

  @override
  String get lockScreenEnterPin => 'Digite seu PIN';

  @override
  String get lockScreenWrongPin => 'Esse PIN não confere';

  @override
  String get lockScreenUseBiometrics => 'Usar biometria';

  @override
  String get lockScreenUseFaceId => 'Usar Face ID';

  @override
  String get lockScreenUseFingerprint => 'Usar impressão digital';

  @override
  String get lockScreenForgotPin => 'Esqueceu seu PIN?';

  @override
  String get lockScreenForgotPinChoiceTitle => 'Como você quer redefini-lo?';

  @override
  String get lockScreenResetViaDevice => 'Verificar com este dispositivo';

  @override
  String get lockScreenResetViaDeviceBody =>
      'Seus dados permanecem. Basta confirmar com o próprio bloqueio do seu telefone — Face ID, digital ou senha.';

  @override
  String get lockScreenResetViaDeviceReason =>
      'Verifique para definir um novo PIN';

  @override
  String lockScreenThrottled(int seconds) {
    return 'Tentativas demais. Tente de novo em ${seconds}s';
  }

  @override
  String get lockScreenEraseTitle => 'Apagar todos os dados?';

  @override
  String get lockScreenEraseBody =>
      'Isto exclui permanentemente tudo o que está neste dispositivo. Não há conta nem backup em servidor, então não dá para desfazer.';

  @override
  String get lockScreenEraseConfirm => 'Apagar tudo';

  @override
  String get onboardingPrivacyTitle => 'Boas-vindas';

  @override
  String get onboardingPrivacyBody =>
      'Os dados do seu ciclo ficam somente neste dispositivo, criptografados. Não há conta nem sincronização na nuvem — nada do que você registra é enviado. A chave fica no hardware seguro do seu celular, e você pode exportar ou apagar tudo quando quiser.';

  @override
  String get onboardingLastPeriodTitle =>
      'Quando começou sua última menstruação?';

  @override
  String get onboardingLastPeriodBody =>
      'Isso ajuda a começar — você pode corrigir depois pelo calendário, quando quiser.';

  @override
  String get onboardingPickDate => 'Escolher uma data';

  @override
  String get onboardingCycleLengthTitle =>
      'Qual a duração típica do seu ciclo?';

  @override
  String get onboardingCycleLengthBody =>
      'Um número aproximado já serve. Assim que virmos alguns ciclos completos, começamos a dar uma estimativa de verdade.';

  @override
  String get onboardingPeriodLengthTitle =>
      'Quantos dias costuma durar sua menstruação?';

  @override
  String get onboardingPeriodLengthBody =>
      'Vamos usar isso para preencher sua última menstruação, assim você não começa do zero.';

  @override
  String get onboardingDaysUnit => 'dias';

  @override
  String get onboardingGoalTitle => 'O que traz você aqui?';

  @override
  String get onboardingGoalBody =>
      'Isso só ajuda a mostrar primeiro o que faz sentido para você — dá para mudar de ideia quando quiser, nos Ajustes.';

  @override
  String get goalTrackPeriod => 'Acompanhar minha menstruação';

  @override
  String get goalTryingToConceive => 'Tentando engravidar';

  @override
  String get goalPregnancyTracking => 'Acompanhando uma gravidez';

  @override
  String get onboardingRegularityTitle => 'Seus ciclos costumam ser regulares?';

  @override
  String get onboardingRegularityBody =>
      'Não existe resposta errada aqui — isso só ajuda a conhecer um pouco o seu corpo.';

  @override
  String get onboardingCrampsTitle => 'Você costuma ter cólicas?';

  @override
  String get onboardingCrampsBody =>
      'Vamos deixar fácil registrar como você se sente em dias assim.';

  @override
  String get onboardingBirthYearTitle => 'Em que ano nasceste?';

  @override
  String get onboardingBirthYearBody =>
      'Só para um retrato mais completo — nunca é usado em nenhuma previsão.';

  @override
  String get onboardingPmsTitle => 'Costuma aparecer algo antes?';

  @override
  String get onboardingPmsBody =>
      'Escolhe quantos quiseres. Não fica guardado em lado nenhum, não há resposta errada.';

  @override
  String get onboardingNotificationTitle => 'Quer lembretes gentis?';

  @override
  String get onboardingNotificationBody =>
      'Podemos avisar você antes da data prevista da sua menstruação.';

  @override
  String get onboardingNotificationMockTitle =>
      'Sua menstruação pode começar em breve';

  @override
  String get onboardingNotificationMockBody =>
      'Com base nos ciclos que você registrou';

  @override
  String get onboardingNotificationAllow => 'Ativar lembretes';

  @override
  String get onboardingNotificationNotNow => 'Agora não';

  @override
  String get onboardingBuildingPlanTitle => 'Preparando tudo para você';

  @override
  String get onboardingBuildingPlanStep1 =>
      'Protegendo seus dados neste dispositivo';

  @override
  String get onboardingBuildingPlanStep2 => 'Salvando suas preferências';

  @override
  String get onboardingBuildingPlanStep3 => 'Deixando seu calendário pronto';

  @override
  String get onboardingBuildingPlanDone => 'Tudo pronto';

  @override
  String get navHome => 'Início';

  @override
  String get navCalendar => 'Calendário';

  @override
  String get navInsights => 'Estatísticas';

  @override
  String get navSettings => 'Ajustes';

  @override
  String get navReminders => 'Lembretes';

  @override
  String get navProfile => 'Perfil';

  @override
  String get navTrack => 'Registar';

  @override
  String homeCycleDayLabel(int day) {
    return 'Dia $day';
  }

  @override
  String get homeNoCycleYet => 'Nenhuma menstruação registrada ainda';

  @override
  String get homePhaseMenstrual => 'Menstruação';

  @override
  String get homePhaseFollicular => 'Fase folicular';

  @override
  String get homePhaseFertileWindow => 'Janela fértil estimada';

  @override
  String get homePhaseLuteal => 'Fase lútea';

  @override
  String get homePhaseUnknown => 'Dados recentes insuficientes';

  @override
  String get homePredictionInsufficientTitle =>
      'Ainda não há dados suficientes';

  @override
  String get homePredictionInsufficientBody =>
      'Registre sua próxima menstruação e começaremos a estimar.';

  @override
  String homePredictionRangeLabel(String start, String end) {
    return '$start – $end';
  }

  @override
  String get homeConfidenceHigh => 'Confiança alta';

  @override
  String get homeConfidenceMedium => 'Confiança média';

  @override
  String get homeConfidenceLow => 'Confiança baixa';

  @override
  String get homeIrregularNote =>
      'A duração do seu ciclo variou mais que o habitual nos últimos tempos. Se isso é novo para você, pode valer a pena comentar em uma consulta.';

  @override
  String get homeFertileWindowDisclaimer =>
      'Baseado no ritmo típico do ciclo — não é um método contraceptivo.';

  @override
  String get homePeriodStartedButton => 'Menstruação começou hoje';

  @override
  String get homePeriodStartedSnackbar =>
      'Registrado — menstruação começou hoje';

  @override
  String get actionUndo => 'Desfazer';

  @override
  String get comingSoon => 'Em breve';

  @override
  String get dayLogFlowLabel => 'Fluxo';

  @override
  String get flowSpotting => 'Escape';

  @override
  String get flowLight => 'Leve';

  @override
  String get flowMedium => 'Médio';

  @override
  String get flowHeavy => 'Intenso';

  @override
  String get flowNone => 'Nenhum';

  @override
  String get dayLogSymptomsLabel => 'Sintomas';

  @override
  String get symptomCramps => 'Cólicas';

  @override
  String get symptomHeadache => 'Dor de cabeça';

  @override
  String get symptomBloating => 'Inchaço';

  @override
  String get symptomBreastTenderness => 'Sensibilidade nos seios';

  @override
  String get symptomAcne => 'Acne';

  @override
  String get symptomFatigue => 'Cansaço';

  @override
  String get symptomNausea => 'Náusea';

  @override
  String get symptomBackPain => 'Dor nas costas';

  @override
  String get symptomAppetiteChange => 'Mudança no apetite';

  @override
  String get symptomSleepTrouble => 'Dificuldade para dormir';

  @override
  String get symptomPelvicPain => 'Dor pélvica';

  @override
  String get symptomDizziness => 'Tontura';

  @override
  String get symptomMigraine => 'Enxaqueca';

  @override
  String get symptomHighFever => 'Febre alta';

  @override
  String get symptomNeckPain => 'Dor no pescoço';

  @override
  String get symptomShoulderPain => 'Dor no ombro';

  @override
  String get symptomLimbPain => 'Dor nos membros';

  @override
  String get symptomMuscleAche => 'Dor muscular';

  @override
  String get symptomChills => 'Calafrios';

  @override
  String get symptomNightSweats => 'Suores noturnos';

  @override
  String get symptomHotFlashes => 'Ondas de calor';

  @override
  String get symptomWeightGain => 'Ganho de peso';

  @override
  String get symptomConstipation => 'Prisão de ventre';

  @override
  String get symptomDiarrhea => 'Diarreia';

  @override
  String get symptomIndigestion => 'Indigestão';

  @override
  String get symptomGasPain => 'Dor por gases';

  @override
  String get symptomFeelingUnwell => 'Mal-estar';

  @override
  String get symptomItching => 'Coceira';

  @override
  String get symptomTroubleFocusing => 'Dificuldade de concentração';

  @override
  String get symptomForgetfulness => 'Esquecimento';

  @override
  String get symptomGroupHead => 'Cabeça';

  @override
  String get symptomGroupBody => 'Corpo';

  @override
  String get symptomGroupAbdomen => 'Abdômen';

  @override
  String get symptomGroupGeneral => 'Geral';

  @override
  String get symptomGroupCognitive => 'Cognitivo';

  @override
  String get dayLogMoodLabel => 'Humor';

  @override
  String get moodCalm => 'Calma';

  @override
  String get moodAnxious => 'Ansiedade';

  @override
  String get moodIrritable => 'Irritação';

  @override
  String get moodLow => 'Desânimo';

  @override
  String get moodEnergetic => 'Com energia';

  @override
  String get moodHappy => 'Alegria';

  @override
  String get moodContent => 'Contentamento';

  @override
  String get moodSad => 'Tristeza';

  @override
  String get moodDepressed => 'Abatimento';

  @override
  String get moodEmotional => 'Sensibilidade';

  @override
  String get moodExcited => 'Animada';

  @override
  String get moodHopeful => 'Esperançosa';

  @override
  String get moodProud => 'Orgulhosa';

  @override
  String get moodDisappointed => 'Decepcionada';

  @override
  String get moodConfident => 'Confiante';

  @override
  String get moodSurprised => 'Surpresa';

  @override
  String get moodIndifferent => 'Indiferente';

  @override
  String get moodPeaceful => 'Serena';

  @override
  String get moodInLove => 'Apaixonada';

  @override
  String get moodShy => 'Tímida';

  @override
  String get moodPlayful => 'Brincalhona';

  @override
  String get moodExhausted => 'Exausta';

  @override
  String get moodLonely => 'Solitária';

  @override
  String get moodOverwhelmed => 'Sobrecarregada';

  @override
  String get moodGrateful => 'Grata';

  @override
  String get moodNostalgic => 'Nostálgica';

  @override
  String get dayLogNoteLabel => 'Nota';

  @override
  String get dayLogNoteHint =>
      'Qualquer coisa que você queira lembrar sobre hoje';

  @override
  String get dayLogOptionalTrackersLabel => 'Registros opcionais';

  @override
  String get dayLogSexualActivityLabel => 'Atividade sexual';

  @override
  String get sexLifeNone => 'Nada';

  @override
  String get sexLifeUnprotected => 'Sexo sem proteção';

  @override
  String get sexLifeProtected => 'Sexo com proteção';

  @override
  String get sexLifeMasturbation => 'Masturbação';

  @override
  String get sexLifeNoOrgasm => 'Sem orgasmo';

  @override
  String get sexLifeOrgasm => 'Orgasmo';

  @override
  String get sexLifeHighDesire => 'Muito desejo';

  @override
  String get dayLogBbtLabel => 'Temperatura basal';

  @override
  String get dayLogMucusLabel => 'Muco cervical';

  @override
  String get mucusDry => 'Seco';

  @override
  String get mucusSticky => 'Pegajoso';

  @override
  String get mucusCreamy => 'Cremoso';

  @override
  String get mucusWatery => 'Aquoso';

  @override
  String get mucusEggWhite => 'Clara de ovo';

  @override
  String get dayLogSavedIndicator => 'Salvo';

  @override
  String get homeOpenTodayLog => 'Adicionar detalhes de hoje';

  @override
  String get calendarLegendActual => 'Menstruação registrada';

  @override
  String get calendarLegendPredicted => 'Janela prevista';

  @override
  String get calendarLegendFertile => 'Janela fértil estimada';

  @override
  String get calendarLegendOvulation => 'Ovulação estimada';

  @override
  String get dayDetailFertileTitle => 'Dentro da sua janela fértil estimada';

  @override
  String get dayDetailOvulationTitle => 'Dia estimado de ovulação';

  @override
  String get dayDetailOvulationBody =>
      'A gravidez costuma ser mais provável por volta deste dia, considerando o ritmo habitual — isto é uma estimativa, não uma garantia.';

  @override
  String get insightsCyclesLoggedLabel => 'Ciclos registrados';

  @override
  String get insightsAveragePeriodLengthLabel => 'Duração média da menstruação';

  @override
  String get insightsAverageCycleLengthLabel => 'Duração média do ciclo';

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
      other: 'Varia cerca de $daysString dias',
      one: 'Varia cerca de $daysString dia',
    );
    return '$_temp0';
  }

  @override
  String get insightsNotEnoughDataTitle => 'Ainda não há dados suficientes';

  @override
  String get insightsNotEnoughDataBody =>
      'Registre alguns ciclos completos e suas médias aparecem aqui.';

  @override
  String get insightsSymptomFrequencyTitle => 'Sintomas por dia do ciclo';

  @override
  String get insightsNoSymptomsLogged => 'Nenhum sintoma registrado ainda';

  @override
  String get settingsLanguageLabel => 'Idioma';

  @override
  String get settingsLanguageSystem => 'Idioma do sistema';

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
  String get tourSkip => 'Saltar';

  @override
  String get tourNext => 'Seguinte';

  @override
  String get tourStart => 'Vamos começar';

  @override
  String get tourHomeTitle => 'Início';

  @override
  String get tourHomeBody =>
      'Vê num relance onde estás hoje — o teu dia de ciclo, quanto falta para a tua janela estimada, e a tua companhia estão sempre aqui.';

  @override
  String get tourCalendarTitle => 'Calendário';

  @override
  String get tourCalendarBody =>
      'Vê os teus ciclos passados e futuros no calendário. Toca em qualquer dia para abrir o seu registo.';

  @override
  String get tourTrackTitle => 'Registar';

  @override
  String get tourTrackBody =>
      'O botão + no meio abre o registo de hoje a partir de qualquer lugar — fluxo, sintomas, humor e mais.';

  @override
  String get tourRemindersTitle => 'Lembretes';

  @override
  String get tourRemindersBody =>
      'Define lembretes para o teu próximo período, medicação ou beber água — tudo fica no teu telemóvel e não vai para mais lado nenhum.';

  @override
  String get tourProfileTitle => 'Perfil';

  @override
  String get tourProfileBody =>
      'Encontra aqui as tuas informações, tudo o que segues e as tuas definições.';

  @override
  String get settingsWeekStartLabel => 'A semana começa em';

  @override
  String get settingsWeekStartMonday => 'Segunda-feira';

  @override
  String get settingsWeekStartSunday => 'Domingo';

  @override
  String get settingsTemperatureUnitLabel => 'Unidade de temperatura';

  @override
  String get settingsTemperatureCelsius => 'Celsius';

  @override
  String get settingsTemperatureFahrenheit => 'Fahrenheit';

  @override
  String get settingsRemindersLabel => 'Avisar antes da minha menstruação';

  @override
  String get remindersScreenTitle => 'Lembretes';

  @override
  String get reminderDetailNotification => 'Notificação';

  @override
  String get reminderDetailAlert => 'Alerta';

  @override
  String get reminderDetailAlertToday => 'No mesmo dia';

  @override
  String get reminderDetailTime => 'Hora';

  @override
  String get reminderDetailMessage => 'Mensagem';

  @override
  String get reminderDetailMessageEditTitle => 'Editar mensagem';

  @override
  String get reminderDetailMessageHint => 'Escreva sua própria mensagem';

  @override
  String reminderDetailAlertDaysBefore(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count dias antes',
      one: '$count dia antes',
    );
    return '$_temp0';
  }

  @override
  String optionsShowMore(int count) {
    return '+$count mais';
  }

  @override
  String get optionsShowLess => 'Mostrar menos';

  @override
  String get trackerHistoryEntry => 'Histórico';

  @override
  String get actionSend => 'Enviar';

  @override
  String get actionRemove => 'Remover';

  @override
  String get feedbackEntry => 'Feedback';

  @override
  String get cloudBackupEntry => 'Cópia de Segurança com Conta';

  @override
  String get cloudBackupTitle => 'Cópia de Segurança com Conta';

  @override
  String get cloudBackupNotConfiguredTitle =>
      'Ainda não disponível nesta versão';

  @override
  String get cloudBackupNotConfiguredBody =>
      'A cópia de segurança na nuvem precisa de um serviço de contas que ainda não foi configurado para esta versão. Nada aqui pode ser usado até lá.';

  @override
  String get cloudBackupIntro1Title => 'Nunca percas o teu histórico';

  @override
  String get cloudBackupIntro1Body =>
      'O teu histórico do ciclo mantém-se seguro mesmo que percas o telemóvel ou mudes para um novo.';

  @override
  String get cloudBackupIntro2Title => 'Só tu podes abri-lo';

  @override
  String get cloudBackupIntro2Body =>
      'A tua cópia de segurança é encriptada com uma palavra-passe antes de sair do teu telemóvel — não conseguimos lê-la, e mais ninguém consegue também.';

  @override
  String get cloudBackupIntro3Title => 'Restaura em segundos';

  @override
  String get cloudBackupIntro3Body =>
      'Inicia sessão num novo dispositivo e recupera o teu histórico com a mesma palavra-passe.';

  @override
  String get cloudBackupSignedInTitle => 'Sessão iniciada';

  @override
  String get cloudBackupUploadButton => 'Fazer cópia agora';

  @override
  String get cloudBackupDownloadButton => 'Restaurar da nuvem';

  @override
  String get cloudBackupUploadSuccess => 'Cópia guardada na tua conta';

  @override
  String get cloudBackupNoBackupFound =>
      'Ainda não foi encontrada nenhuma cópia na nuvem para esta conta.';

  @override
  String get partnerModeEntry => 'Modo Parceiro';

  @override
  String get partnerModeTitle => 'Modo Parceiro';

  @override
  String get partnerModeNotConfiguredTitle =>
      'Ainda não disponível nesta versão';

  @override
  String get partnerModeNotConfiguredBody =>
      'O Modo Parceiro precisa de um serviço de contas que ainda não foi configurado para esta versão. Nada aqui pode ser usado até lá.';

  @override
  String get partnerModeHeroTitle => 'Partilha um pouco, nos teus termos';

  @override
  String get partnerModeHeroBody =>
      'Emparelha-te com o teu parceiro e partilha apenas o que ativares abaixo — nunca todo o teu histórico, nunca automaticamente.';

  @override
  String get partnerModeSignInGoogle => 'Continuar com Google';

  @override
  String get partnerModeSignInApple => 'Continuar com Apple';

  @override
  String get partnerModeFaqTitle => 'Antes de iniciares sessão';

  @override
  String get partnerModeFaq1Q => 'O que o meu parceiro verá realmente?';

  @override
  String get partnerModeFaq1A =>
      'Apenas os campos que ativares no Modo Parceiro, e apenas o teu estado atual — nunca o teu histórico guardado, nem nada que não tenhas partilhado explicitamente.';

  @override
  String get partnerModeFaq2Q => 'Posso desativar isto mais tarde?';

  @override
  String get partnerModeFaq2A =>
      'Sim. Desemparelhar termina a partilha imediatamente para ambos, e podes desativar qualquer opção individual a qualquer momento sem desemparelhar.';

  @override
  String get partnerModeFaq3Q => 'O meu parceiro precisa desta aplicação?';

  @override
  String get partnerModeFaq3A =>
      'Sim — inicia sessão da mesma forma e emparelha com um código que lhe envias.';

  @override
  String get partnerModeNotPairedTitle => 'Ainda não emparelhado';

  @override
  String get partnerModeNotPairedBody =>
      'Convida o teu parceiro com um código de utilização única, ou introduz o código que ele te enviou.';

  @override
  String get partnerModeInviteButton => 'Convidar o meu parceiro';

  @override
  String get partnerModeEnterCodeButton => 'Introduzir um código';

  @override
  String get partnerModeSignOut => 'Terminar sessão';

  @override
  String get partnerModePairedTitle => 'Emparelhado';

  @override
  String get partnerModePairedBody =>
      'Tu e o teu parceiro estão ligados. A partilha continua limitada ao que ativares abaixo.';

  @override
  String get partnerModeShareSectionTitle => 'O que partilhas';

  @override
  String get partnerModeShareCyclePhase => 'Fase e dia do ciclo';

  @override
  String get partnerModeShareMood => 'Humor de hoje';

  @override
  String get partnerModeShareSymptoms => 'Sintomas de hoje';

  @override
  String get partnerModeShareHighDesire => 'Vontade de proximidade hoje';

  @override
  String get partnerModeShareNow => 'Partilhar agora';

  @override
  String get partnerModeShareSuccess => 'Partilhado com o teu parceiro';

  @override
  String get partnerModeUnpair => 'Desemparelhar';

  @override
  String get partnerModeUnpairConfirmTitle => 'Desemparelhar do teu parceiro?';

  @override
  String get partnerModeUnpairConfirmBody =>
      'Isto termina a partilha imediatamente para ambos. Podem emparelhar novamente mais tarde com um novo código.';

  @override
  String get partnerModePartnerSnapshotEmpty =>
      'O teu parceiro ainda não partilhou nada.';

  @override
  String get partnerModeErrorNotConfigured =>
      'O Modo Parceiro ainda não está configurado nesta versão.';

  @override
  String get partnerModeErrorCodeNotFound =>
      'Esse código não foi encontrado. Verifica-o e tenta novamente.';

  @override
  String get partnerModeErrorCodeExpired =>
      'Esse código expirou. Pede um novo.';

  @override
  String get partnerModeErrorCodeIsOwn =>
      'Esse é o teu próprio código — pede ao teu parceiro o dele.';

  @override
  String get partnerModeErrorNotSignedIn => 'Inicia sessão primeiro.';

  @override
  String get partnerModeErrorUnknown => 'Algo correu mal. Tenta novamente.';

  @override
  String get partnerModeInviteTitle => 'Convida o teu parceiro';

  @override
  String get partnerModeInviteBody =>
      'Envia este código ao teu parceiro. Ele irá inseri-lo na própria aplicação para emparelhar contigo.';

  @override
  String get partnerModeInviteExpiry => 'Válido por 7 dias';

  @override
  String get partnerModeInviteShare => 'Partilhar código';

  @override
  String partnerModeInviteMessage(String code) {
    return 'Aqui está o meu código de emparelhamento do Vera: $code';
  }

  @override
  String get partnerModeEnterTitle => 'Introduzir um código';

  @override
  String get partnerModeEnterBody =>
      'Introduz o código que o teu parceiro te enviou.';

  @override
  String get partnerModeEnterHint => 'Código de 6 caracteres';

  @override
  String get partnerModeEnterSubmit => 'Emparelhar';

  @override
  String get homeInvitePartnerTitle => 'Partilha com o teu parceiro';

  @override
  String get homeInvitePartnerBody =>
      'Emparelhem-se e partilha apenas o que escolheres — o teu histórico continua teu.';

  @override
  String get homeInvitePartnerCta => 'Configurar Modo Parceiro';

  @override
  String get feedbackTitle => 'O que não gostaste?';

  @override
  String get feedbackSubtitle =>
      'Escolhe um tópico e escreve mais se quiseres.';

  @override
  String get feedbackCategoryPredictions => 'Previsões';

  @override
  String get feedbackCategoryBackup => 'Cópia de segurança';

  @override
  String get feedbackCategorySubscription => 'Subscrição';

  @override
  String get feedbackCategoryAds => 'Anúncios';

  @override
  String get feedbackCategoryDesign => 'Design';

  @override
  String get feedbackCategoryTranslation => 'Tradução';

  @override
  String get feedbackCategoryOther => 'Outro';

  @override
  String get feedbackDescriptionLabel => 'Conta-nos mais (opcional)';

  @override
  String get feedbackDescriptionHint =>
      'O que aconteceu? Ao tocar em Enviar, escolhes onde partilhar — a tua app de email ou outro sítio.';

  @override
  String get feedbackAttachPhoto => 'Adicionar uma foto';

  @override
  String get feedbackPhotoAttached => 'Foto anexada';

  @override
  String get remindersGroupCycle => 'Menstruação e fertilidade';

  @override
  String get remindersGroupMedication => 'Medicação';

  @override
  String get remindersGroupLifestyle => 'Estilo de vida';

  @override
  String get remindersGroupAppointment => 'Consultas médicas';

  @override
  String get settingsRemindersPeriodEndLabel =>
      'Avisar quando minha menstruação estiver perto do fim';

  @override
  String get settingsRemindersMedicationLabel => 'Lembrete de medicação';

  @override
  String get settingsRemindersWaterLabel => 'Lembrete de água';

  @override
  String get settingsRemindersAppointmentLabel => 'Lembrete de consulta médica';

  @override
  String get settingsRemindersAppointmentSet => 'Definir data e hora';

  @override
  String get settingsRemindersAppointmentClear => 'Limpar';

  @override
  String get settingsOptionalTrackersHeading => 'Registros opcionais';

  @override
  String get settingsOptionalTrackersBody =>
      'Desativados por padrão. Ao ativar um, ele passa a aparecer na tela de registro do dia.';

  @override
  String get settingsSexualActivityToggle => 'Atividade sexual';

  @override
  String get settingsBbtToggle => 'Temperatura basal';

  @override
  String get settingsMucusToggle => 'Muco cervical';

  @override
  String get settingsBreastExamToggle => 'Autoexame das mamas';

  @override
  String get settingsCervixToggle => 'Posição e firmeza do colo do útero';

  @override
  String get settingsPrivacyEntry => 'Privacidade';

  @override
  String get settingsRateEntry => 'Avalie-nos';

  @override
  String get rateAppTitle => 'O Vera está funcionando para você?';

  @override
  String get rateAppBody =>
      'Se sim, alguns segundos avaliando na loja ajudam outras pessoas que procuram algo assim a encontrá-lo.';

  @override
  String get rateAppCta => 'Avaliar Vera';

  @override
  String get rateAppDismiss => 'Agora não';

  @override
  String get settingsDeleteAllData => 'Excluir todos os dados';

  @override
  String get privacyScreenTitle => 'Privacidade';

  @override
  String get privacyScreenIntro =>
      'Aqui está exatamente o que acontece com os seus dados, em linguagem simples.';

  @override
  String get privacyScreenStorageTitle => 'Encriptado neste dispositivo';

  @override
  String get privacyScreenNoNetworkTitle => 'Sem servidor, sem conta';

  @override
  String get privacyScreenNoThirdPartyTitle => 'Sem rastreio';

  @override
  String get privacyScreenExportTitle => 'Só tu podes exportar';

  @override
  String get privacyScreenDeleteTitle => 'Apagar é definitivo';

  @override
  String get privacyScreenStorage =>
      'Tudo o que você registra é criptografado e guardado somente neste dispositivo, em um único arquivo. A chave de criptografia fica no hardware seguro do seu celular — Keychain no iOS, Keystore no Android — e não dentro do arquivo.';

  @override
  String get privacyScreenNoNetwork =>
      'Este app não tem servidor próprio nem sistema de contas — os seus registros nunca são enviados. A versão gratuita inclui anúncios do Google, que se conectam à internet; eles nunca recebem nada do que você registra.';

  @override
  String get privacyScreenNoThirdParty =>
      'Não há análise de uso, relatório de falhas nem SDK de rastreamento. O único componente de terceiros é o SDK de anúncios do Google na versão gratuita — o Premium o remove por completo.';

  @override
  String get privacyScreenExport =>
      'A única forma de os seus dados saírem deste dispositivo é você exportá-los, e essa exportação é criptografada com uma senha que só você conhece.';

  @override
  String get privacyScreenDelete =>
      'Excluir seus dados é real e imediato. Não há conta nem backup do nosso lado — depois que some, some de vez.';

  @override
  String get adPlaceholderLabel => 'Espaço publicitário';

  @override
  String get adPlaceholderUpgradeCta => 'Fique sem anúncios com o Premium';

  @override
  String get reminderNotificationTitle =>
      'Sua menstruação pode começar em breve';

  @override
  String get reminderNotificationBody =>
      'Com base nos ciclos que você registrou, sua janela estimada está chegando.';

  @override
  String get reminderPeriodEndTitle => 'Sua menstruação pode estar terminando';

  @override
  String get reminderPeriodEndBody =>
      'Se ainda estiver acontecendo, é completamente normal — isto é só um aviso gentil.';

  @override
  String get reminderMedicationTitle => 'Lembrete de medicação';

  @override
  String get reminderMedicationBody => 'Hora de tomar seu medicamento.';

  @override
  String get reminderWaterTitle => 'Lembre-se de beber água';

  @override
  String get reminderWaterBody => 'Um lembrete rápido para beber água.';

  @override
  String get reminderAppointmentTitle => 'Próxima consulta médica';

  @override
  String get reminderAppointmentBody => 'Tens uma consulta médica a chegar.';

  @override
  String get settingsExportEntry => 'Exportar e backup';

  @override
  String get exportBackupHeading => 'Backup criptografado';

  @override
  String get exportBackupBody =>
      'Salve uma cópia criptografada do seu histórico para levar para outro dispositivo. Você vai precisar da senha de novo para restaurar — não há outra forma de recuperá-la.';

  @override
  String get exportCreateBackupButton => 'Criar backup';

  @override
  String get exportRestoreBackupButton => 'Restaurar de um backup';

  @override
  String get exportPasswordLabel => 'Senha';

  @override
  String get exportPasswordConfirmLabel => 'Confirmar senha';

  @override
  String get exportPasswordMismatch => 'As senhas não conferem';

  @override
  String get exportPasswordTooShort => 'Use pelo menos 8 caracteres';

  @override
  String get exportRestoreConfirmTitle =>
      'Substituir todos os dados deste dispositivo?';

  @override
  String get exportRestoreConfirmBody =>
      'Restaurar um backup substitui tudo o que está registrado neste dispositivo agora. Isso não pode ser desfeito.';

  @override
  String get exportRestoreConfirmAction => 'Restaurar';

  @override
  String get exportWrongPassword => 'Essa senha não confere com este backup';

  @override
  String get exportInvalidFile =>
      'Esse arquivo não parece ser um backup do Vera';

  @override
  String get exportBackupCreated => 'Backup pronto para compartilhar';

  @override
  String get exportRestoreSuccess => 'Backup restaurado';

  @override
  String get exportDoctorReportHeading => 'Relatório para o médico';

  @override
  String get exportDoctorReportBody =>
      'Um resumo que você pode compartilhar com um profissional de saúde.';

  @override
  String get exportIncludeNotesToggle => 'Incluir notas pessoais';

  @override
  String get exportShareCsvButton => 'Compartilhar como CSV';

  @override
  String get exportPrintPdfButton => 'Imprimir / Salvar como PDF';

  @override
  String get doctorReportDisclaimer =>
      'Gerado pelo Vera a partir de dados informados pela pessoa usuária. Não é um diagnóstico médico.';

  @override
  String get doctorReportGeneratedOn => 'Gerado em';

  @override
  String get doctorReportSummaryHeading => 'Resumo';

  @override
  String get doctorReportDailyLogHeading => 'Registro diário';

  @override
  String get doctorReportColumnDate => 'Data';

  @override
  String get doctorReportTimelineHeading => 'Linha do tempo dos ciclos';

  @override
  String get doctorReportCycleLabel => 'Ciclo';

  @override
  String get doctorReportTimelineLegendPeriod => 'Menstruação';

  @override
  String get doctorReportTimelineLegendCycle => 'Restante do ciclo';

  @override
  String get doctorReportTimelineOngoing => 'Em andamento';

  @override
  String get dailyInsightLabel => 'Você sabia?';

  @override
  String get insightMenstrual1 =>
      'O revestimento do seu útero está descamando agora — a maioria das menstruações dura de 3 a 7 dias, e isso é completamente normal.';

  @override
  String get insightMenstrual2 =>
      'Alimentos ricos em ferro, como folhas verdes escuras e lentilha, ajudam a repor o que o corpo perde nesta semana.';

  @override
  String get insightFollicular1 =>
      'O estrogênio está subindo, e muitas pessoas notam mais energia e melhor concentração a partir de agora.';

  @override
  String get insightFollicular2 =>
      'Seu corpo está preparando um óvulo para ser liberado — esta fase pode durar de uma semana a algumas semanas.';

  @override
  String get insightFertile1 =>
      'Esta é a sua janela fértil estimada — os dias em torno da ovulação em que a gravidez é mais provável, considerando o ritmo típico.';

  @override
  String get insightFertile2 =>
      'Algumas pessoas notam uma leve alta na temperatura basal ou mudanças no muco cervical por volta da ovulação.';

  @override
  String get insightLuteal1 =>
      'A progesterona sobe depois da ovulação — costuma ser quando aparecem sintomas de TPM, como mudanças de humor ou inchaço.';

  @override
  String get insightLuteal2 =>
      'Se não houve implantação de uma gravidez, os níveis hormonais caem perto do fim desta fase, o que desencadeia a próxima menstruação.';

  @override
  String get insightUnknown1 =>
      'A duração do ciclo varia muito de pessoa para pessoa — de 21 a 35 dias é considerado típico.';

  @override
  String get insightsPhaseTipsTitle => 'Pode fazer bem nesta fase';

  @override
  String get tipFitnessLabel => 'Movimento';

  @override
  String get tipNutritionLabel => 'Alimentação';

  @override
  String get tipFitnessMenstrual =>
      'Movimento leve — caminhar, alongar ou ioga restaurativa — pode cair melhor do que treinos intensos neste momento.';

  @override
  String get tipFitnessFollicular =>
      'A energia costuma subir nesta fase — uma boa janela para experimentar um treino novo ou puxar um pouco mais.';

  @override
  String get tipFitnessFertile =>
      'Muitas pessoas se sentem com o máximo de energia aqui — uma boa fase para treinos de maior intensidade, se isso te agrada.';

  @override
  String get tipFitnessLuteal =>
      'Se a energia cair no fim desta fase, trabalho de força mais leve ou natação pode ser mais sustentável.';

  @override
  String get tipFitnessUnknown =>
      'O movimento que fizer bem hoje já é uma boa escolha — não existe uma única rotina \"certa\" para todo dia.';

  @override
  String get tipNutritionMenstrual =>
      'Alimentos ricos em ferro, como folhas verdes escuras, lentilha e carne vermelha, ajudam a repor o que o corpo perde nesta semana.';

  @override
  String get tipNutritionFollicular =>
      'Refeições mais leves e frescas costumam cair bem conforme a energia sobe — mas não existe um único jeito \"certo\" de comer nesta fase.';

  @override
  String get tipNutritionFertile =>
      'Beber bastante água e manter refeições equilibradas sustenta a energia nesta fase que costuma parecer mais ativa.';

  @override
  String get tipNutritionLuteal =>
      'A vontade de comer pode mudar aqui — carboidratos complexos e alimentos ricos em magnésio, como castanhas e chocolate amargo, são escolhas comuns.';

  @override
  String get tipNutritionUnknown =>
      'Refeições equilibradas e regulares são uma boa escolha padrão sempre que a sua fase ainda não estiver clara.';

  @override
  String get predictionSettingsEntry => 'Ajustes de previsão';

  @override
  String get predictionSettingsIntro =>
      'Estas são suposições, mostradas abertamente. Depois que você registrar 2 ciclos completos, a previsão real na tela inicial passa a ser calculada com os seus próprios dados — estes números deixam de ser usados para isso.';

  @override
  String get predictionSettingsPeriodLengthLabel =>
      'Duração típica da menstruação';

  @override
  String get predictionSettingsCycleLengthLabel => 'Duração típica do ciclo';

  @override
  String get predictionSettingsCycleLengthHint =>
      'Usado para dimensionar o anel da tela inicial até termos dados reais.';

  @override
  String get predictionSettingsLutealLabel => 'Duração da fase lútea';

  @override
  String get predictionSettingsLutealHint =>
      'Os dias típicos entre a ovulação e a sua próxima menstruação. Usado para posicionar a janela fértil estimada — este continua sendo usado mesmo depois que as previsões reais começam.';

  @override
  String get dayLogEnergyLabel => 'Energia';

  @override
  String get energyLevelLow => 'Baixa';

  @override
  String get energyLevelMedium => 'Média';

  @override
  String get energyLevelHigh => 'Alta';

  @override
  String get energyLevelEnergetic => 'Muita energia';

  @override
  String get dayLogSkinHairLabel => 'Pele e cabelo';

  @override
  String get skinHealthyGlow => 'Pele saudável';

  @override
  String get skinRedness => 'Vermelhidão';

  @override
  String get skinDryness => 'Ressecamento';

  @override
  String get skinOiliness => 'Oleosidade';

  @override
  String get hairGoodDay => 'Cabelo bom hoje';

  @override
  String get hairBadDay => 'Cabelo ruim hoje';

  @override
  String get hairLoss => 'Queda de cabelo';

  @override
  String get scalpOily => 'Couro cabeludo oleoso';

  @override
  String get dayLogBreastExamLabel => 'Autoexame das mamas';

  @override
  String get breastExamAllNormal => 'Nada fora do normal';

  @override
  String get breastExamLump => 'Nódulo';

  @override
  String get breastExamIndentation => 'Afundamento na pele';

  @override
  String get breastExamRedness => 'Vermelhidão';

  @override
  String get breastExamCrackedNipple => 'Mamilo rachado';

  @override
  String get breastExamDischarge => 'Secreção no mamilo';

  @override
  String get cervixPositionLabel => 'Posição do colo do útero';

  @override
  String get cervixPositionLow => 'Baixo';

  @override
  String get cervixPositionMedium => 'Médio';

  @override
  String get cervixPositionHigh => 'Alto';

  @override
  String get cervixOpeningLabel => 'Abertura do colo do útero';

  @override
  String get cervixOpeningClosed => 'Fechado';

  @override
  String get cervixOpeningMedium => 'Médio';

  @override
  String get cervixOpeningOpen => 'Aberto';

  @override
  String get cervixFirmnessLabel => 'Firmeza do colo do útero';

  @override
  String get cervixFirmnessSoft => 'Macio';

  @override
  String get cervixFirmnessMedium => 'Médio';

  @override
  String get cervixFirmnessFirm => 'Firme';

  @override
  String get dayLogWaterLabel => 'Água';

  @override
  String get dayLogSleepLabel => 'Sono';

  @override
  String get dayLogWeightLabel => 'Peso';

  @override
  String get dayLogMedicationsLabel => 'Medicação';

  @override
  String get dayLogAddMedication => 'Adicionar medicamento';

  @override
  String get dayLogMedicationNameHint => 'Nome do medicamento';

  @override
  String get dayLogBirthControlLabel => 'Contraceção';

  @override
  String get dayLogOtherMedicationsLabel => 'Outros medicamentos';

  @override
  String get birthControlPillTaken => 'Pílula tomada';

  @override
  String get birthControlPillLate => 'Pílula tomada tarde';

  @override
  String get birthControlPillMissed => 'Pílula esquecida';

  @override
  String get birthControlPatch => 'Adesivo';

  @override
  String get birthControlRing => 'Anel';

  @override
  String get birthControlInjection => 'Injeção';

  @override
  String get birthControlImplant => 'Implante';

  @override
  String get birthControlIud => 'DIU';

  @override
  String get navAssistant => 'Assistente';

  @override
  String get assistantTitle => 'Assistente Vera';

  @override
  String get assistantEndChatTitle => 'Terminar esta conversa?';

  @override
  String get assistantEndChatBody =>
      'As mensagens estão apenas na memória e não são guardadas em lado nenhum, por isso não podem ser recuperadas.';

  @override
  String get assistantEndChatConfirm => 'Terminar conversa';

  @override
  String get assistantInputHint => 'Pergunte sobre seu ciclo…';

  @override
  String get assistantIntro =>
      'Oi! Posso responder perguntas sobre menstruação, ciclos e como a Vera funciona — aqui no seu celular, nada sai do aparelho. Não sou médica e isto não é aconselhamento médico.';

  @override
  String get insightMenstrual3 =>
      'Sangue menstrual não é \"sangue sujo\" — é uma mistura de sangue e revestimento do útero, uma parte completamente normal do ciclo.';

  @override
  String get insightMenstrual4 =>
      'Calor suave na parte baixa da barriga alivia cólicas de verdade — a bolsa de água quente é um clássico com respaldo científico.';

  @override
  String get insightMenstrual5 =>
      'O fluxo costuma ser mais intenso nos dois primeiros dias e diminuir depois — esse padrão é típico.';

  @override
  String get insightMenstrual6 =>
      'Sentir um pouco mais de cansaço durante a menstruação é comum — o ferro sai do corpo junto com o sangue menstrual.';

  @override
  String get insightFollicular3 =>
      'O estrogênio está reconstruindo o revestimento do útero depois da menstruação — seu corpo está se preparando de novo.';

  @override
  String get insightFollicular4 =>
      'A pele costuma ficar mais limpa nesta fase, conforme os níveis hormonais se estabilizam.';

  @override
  String get insightFollicular5 =>
      'Em muitas pessoas, a resistência e o tempo de reação atingem o pico no fim da fase folicular.';

  @override
  String get insightFollicular6 =>
      'A duração desta fase é o que mais varia entre as pessoas — a fase lútea é bem mais constante.';

  @override
  String get insightFertile3 =>
      'O óvulo vive cerca de 12–24 horas, mas os espermatozoides podem esperar até 5 dias — por isso a janela fértil abrange vários dias.';

  @override
  String get insightFertile4 =>
      'Perto da ovulação, o muco cervical costuma ficar transparente e elástico — parecido com clara de ovo crua.';

  @override
  String get insightFertile5 =>
      'Algumas pessoas sentem uma fisgada curta de um lado só na ovulação — isso até tem nome: mittelschmerz.';

  @override
  String get insightFertile6 =>
      'A temperatura basal sobe um pouco *depois* da ovulação — ela confirma que a ovulação aconteceu, em vez de prevê-la.';

  @override
  String get insightLuteal3 =>
      'A progesterona atinge o pico cerca de uma semana depois da ovulação — inchaço e sensibilidade nos seios por volta dessa época são comuns.';

  @override
  String get insightLuteal4 =>
      'A vontade de comer carboidrato antes da menstruação é real — a necessidade de energia sobe um pouco na fase lútea.';

  @override
  String get insightLuteal5 =>
      'Os sintomas de TPM costumam aliviar um ou dois dias depois que o sangramento começa.';

  @override
  String get insightLuteal6 =>
      'Uma rotina de sono constante pode suavizar bastante as quedas de humor no fim da fase lútea.';

  @override
  String get insightUnknown2 =>
      'Registrar só três ciclos já costuma bastar para o seu próprio padrão começar a aparecer.';

  @override
  String get insightUnknown3 =>
      'Os ciclos são pessoais — comparar o seu com o de outra pessoa raramente diz algo útil.';

  @override
  String get insightUnknown4 =>
      'Estresse, viagens e doenças podem deslocar a ovulação — uma menstruação \"atrasada\" muitas vezes é só uma ovulação atrasada.';

  @override
  String get settingsThemeLabel => 'Tema';

  @override
  String get settingsThemeSystem => 'Sistema';

  @override
  String get settingsThemeLight => 'Claro';

  @override
  String get settingsThemeDark => 'Escuro';

  @override
  String get settingsMascotLabel => 'Mascote companheiro';

  @override
  String get mascotDroplet => 'Gotinha';

  @override
  String get mascotFlower => 'Flor';

  @override
  String get mascotMoon => 'Lua';

  @override
  String get mascotNone => 'Nenhum';

  @override
  String homeWindowCountdown(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: 'A janela prevista começa em cerca de $days dias',
      one: 'A janela prevista começa em cerca de $days dia',
    );
    return '$_temp0';
  }

  @override
  String homeOvulationCountdown(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: 'Ovulação estimada em cerca de $days dias',
      one: 'Ovulação estimada em cerca de $days dia',
    );
    return '$_temp0';
  }

  @override
  String get homeQuickLogTitle => 'Como o seu corpo está hoje?';

  @override
  String get actionSave => 'Salvar';

  @override
  String get insightsTrackerHubTitle => 'Seus registros';

  @override
  String get trackerHistoryEmpty => 'Ainda não há registros neste período';

  @override
  String get trackerStatAverage => 'Média';

  @override
  String get trackerStatLowest => 'Mínimo';

  @override
  String get trackerStatHighest => 'Máximo';

  @override
  String get trackerStatLatest => 'Último';

  @override
  String get rangeFilter1m => '1 mês';

  @override
  String get rangeFilter3m => '3 meses';

  @override
  String get rangeFilter6m => '6 meses';

  @override
  String get dayLogOvulationTestLabel => 'Teste de ovulação';

  @override
  String get ovulationTestNegative => 'Negativo';

  @override
  String get ovulationTestPositive => 'Positivo';

  @override
  String get ovulationTestLow => 'Baixo';

  @override
  String get ovulationTestHigh => 'Alto';

  @override
  String get ovulationTestPeak => 'Pico';

  @override
  String get pregnancyTestLabel => 'Teste de gravidez';

  @override
  String get pregnancyTestPositive => 'Positivo';

  @override
  String get pregnancyTestFaint => 'Linha ténue';

  @override
  String get pregnancyTestNegative => 'Negativo';

  @override
  String get settingsOvulationTestToggle => 'Teste de ovulação';

  @override
  String get settingsRemindersOvulationLabel => 'Aviso da janela fértil';

  @override
  String get reminderOvulationTitle => 'Janela fértil estimada se aproximando';

  @override
  String get reminderOvulationBody =>
      'Com base nos ciclos que você registrou, sua janela fértil estimada pode começar em breve.';

  @override
  String trackerEntriesCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count registros',
      one: '$count registro',
    );
    return '$_temp0';
  }

  @override
  String get trackerLowSampleNote =>
      'Com tão poucos registros, as porcentagens ainda não são confiáveis — vão ficar mais precisas conforme você registra mais.';

  @override
  String get assistantTyping => 'Vera está digitando…';

  @override
  String get premiumTitle => 'Vera Premium';

  @override
  String get premiumHeadline => 'Vera Premium';

  @override
  String get premiumSubhead =>
      'Todos os recursos de acompanhamento continuam gratuitos para sempre — o seu histórico nunca fica trancado. O Premium acrescenta os seus próprios registros, estatísticas mais profundas, os seus próprios lembretes e visuais extras, e tira os anúncios.';

  @override
  String get premiumBenefitNoAds => 'Nenhum anúncio, em nenhuma parte do app';

  @override
  String get premiumBenefitSupport =>
      'Apoia um app independente que coloca a privacidade em primeiro lugar';

  @override
  String get premiumMonthly => 'Mensal';

  @override
  String get premiumYearly => 'Anual';

  @override
  String get premiumYearlyNote => 'Cobrado uma vez por ano';

  @override
  String premiumPerMonth(String price) {
    return '$price / mês';
  }

  @override
  String get premiumBilledMonthly => 'Cobrado mensalmente';

  @override
  String get premiumStaysFreeTitle => 'O que continua gratuito';

  @override
  String get premiumStaysFreeBody =>
      'O calendário, todo o teu histórico, as estatísticas básicas e a exportação são gratuitos para sempre. O Premium acrescenta; nunca retira nada.';

  @override
  String get premiumSubscribeCta => 'Continuar';

  @override
  String get premiumRestore => 'Restaurar compra';

  @override
  String get premiumCancelNote =>
      'Cancele quando quiser na conta da sua loja de apps. Sem contagem regressiva, sem pressão — se agora não é a hora, a versão gratuita continua funcionando exatamente como hoje.';

  @override
  String get premiumActiveBadge => 'Premium está ativo';

  @override
  String get premiumDevToggle => 'Simular Premium (desenvolvimento)';

  @override
  String get settingsPremiumEntry => 'Vera Premium';

  @override
  String get adTestNotice => 'Anúncio de teste — ainda não é um anúncio real';

  @override
  String get settingsPregnancyModeLabel => 'Modo gravidez';

  @override
  String get pregnancyLmpLabel => 'Primeiro dia da última menstruação';

  @override
  String pregnancyWeekLabel(int weeks, int days) {
    return 'Semana $weeks, dia $days';
  }

  @override
  String get pregnancyDueDateLabel => 'Data provável do parto';

  @override
  String pregnancyDaysLeft(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: 'Faltam cerca de $days dias',
      one: 'Falta cerca de $days dia',
    );
    return '$_temp0';
  }

  @override
  String pregnancyTrimesterLabel(int n) {
    return '$nº trimestre';
  }

  @override
  String get pregnancyDisclaimer =>
      'As datas são estimadas a partir da sua última menstruação, pela regra padrão de 280 dias. Um ultrassom dá uma data mais precisa, e uma ovulação tardia desloca esses números — isto é informação, não acompanhamento médico.';

  @override
  String get pregnancySizeLabel => 'Tamanho do bebé';

  @override
  String get pregnancySizeUnder5 => 'Semente de papoula (~2 mm)';

  @override
  String get pregnancySizeUnder9 => 'Mirtilo (~1.6 cm)';

  @override
  String get pregnancySizeUnder13 => 'Lima (~5.4 cm)';

  @override
  String get pregnancySizeUnder20 => 'Abacate (~11.6 cm)';

  @override
  String get pregnancySizeUnder28 => 'Manga (~30 cm)';

  @override
  String get pregnancySizeUnder34 => 'Ananás (~44 cm)';

  @override
  String get pregnancySizeUnder38 => 'Melão (~46 cm)';

  @override
  String get pregnancySizeTerm => 'Melancia pequena (~51 cm)';

  @override
  String get pregnancyNoteUnder5 =>
      'A maioria das pessoas ainda não sente nada — como a idade gestacional é contada a partir da última menstruação, as duas primeiras semanas são, na verdade, anteriores à concepção.';

  @override
  String get pregnancyNoteUnder9 =>
      'Enjoo, sensibilidade nos seios e cansaço são comuns nestas semanas. Um bom momento para marcar a primeira consulta.';

  @override
  String get pregnancyNoteUnder13 =>
      'Você está chegando ao fim do primeiro trimestre; para muitas pessoas o enjoo começa a aliviar por volta de agora.';

  @override
  String get pregnancyNoteUnder20 =>
      'A energia costuma voltar nesta fase. Os primeiros movimentos podem ser sentidos em qualquer momento entre as semanas 16 e 22.';

  @override
  String get pregnancyNoteUnder28 =>
      'Os movimentos ficam mais nítidos e começam a formar um padrão. Dor nas costas e azia são comuns nesta fase.';

  @override
  String get pregnancyNoteUnder34 =>
      'Você está no terceiro trimestre. Falta de ar, vontade frequente de urinar e contrações de Braxton-Hicks são comuns.';

  @override
  String get pregnancyNoteUnder38 =>
      'O bebê está se preparando para o nascimento. Um bom momento para a mala da maternidade e o plano de parto.';

  @override
  String get pregnancyNoteTerm =>
      'Você chegou ao termo — o parto pode acontecer a qualquer momento entre as semanas 37 e 42; a semana 40 é uma média, não um prazo.';

  @override
  String get pregnancyWeeklyNoteTitle => 'Esta semana';

  @override
  String get pregnancyNeedsLmp =>
      'Adicione o primeiro dia da sua última menstruação para começar a acompanhar.';

  @override
  String get pregnancyOutOfRange =>
      'Essa data tem mais de 42 semanas — atualize-a ou desative o modo gravidez.';

  @override
  String get partnerShareTitle =>
      'Compartilhar um resumo com seu parceiro ou parceira';

  @override
  String get partnerShareBody =>
      'Cria um resumo curto em texto — a sua fase atual e a janela estimada — que você envia pelo app que quiser. Não há sincronização ao vivo nem conta de parceiro: nada é compartilhado a menos que você envie.';

  @override
  String get partnerShareCta => 'Criar resumo';

  @override
  String get partnerSummaryHeader => 'Resumo do ciclo, do Vera';

  @override
  String get settingsHomeThemeLabel => 'Fundo da tela inicial';

  @override
  String get homeThemeWheat => 'Trigo';

  @override
  String get homeThemeSky => 'Céu';

  @override
  String get homeThemeField => 'Campo';

  @override
  String get homeThemeBlossom => 'Flor';

  @override
  String get homeThemePlain => 'Liso';

  @override
  String get backupNudgeTitle => 'Guarde uma cópia dos seus dados';

  @override
  String get backupNudgeBody =>
      'Tudo existe só neste celular. Se ele se perder, quebrar ou for resetado, o seu histórico vai junto — um backup criptografado leva um instante e só você consegue abrir.';

  @override
  String get backupNudgeCta => 'Fazer backup agora';

  @override
  String get backupNudgeDismiss => 'Depois';

  @override
  String backupLastDone(String date) {
    return 'Último backup: $date';
  }

  @override
  String get backupNever => 'Nenhum backup ainda';

  @override
  String get settingsRemindersBackupLabel => 'Lembrar de fazer backup';

  @override
  String get reminderBackupTitle => 'Hora de fazer backup do Vera';

  @override
  String get reminderBackupBody =>
      'O seu histórico só existe neste celular. Um backup criptografado rápido mantém tudo seguro.';

  @override
  String get notificationChannelPeriodStart => 'Próxima menstruação';

  @override
  String get notificationChannelPeriodEnd => 'Aviso de fim da menstruação';

  @override
  String get notificationChannelMedication => 'Medicação';

  @override
  String get notificationChannelWater => 'Água';

  @override
  String get notificationChannelAppointment => 'Consulta';

  @override
  String get notificationChannelOvulation => 'Janela fértil';

  @override
  String get notificationChannelBackup => 'Lembrete de backup';

  @override
  String get calendarDayDetailTitle => 'Este dia';

  @override
  String get calendarDayNothingLogged => 'Nada registrado neste dia ainda';

  @override
  String get calendarDayOpenLog => 'Abrir registro do dia';

  @override
  String get cycleHistoryTitle => 'Ciclos anteriores';

  @override
  String get cycleTrendsTitle => 'Tendências do ciclo';

  @override
  String get cycleHistoryEmpty =>
      'Registre algumas menstruações e o seu histórico de ciclos aparece aqui.';

  @override
  String get cycleHistoryOngoing => 'Em andamento';

  @override
  String cycleHistoryLength(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: 'Ciclo de $days dias',
      one: 'Ciclo de $days dia',
    );
    return '$_temp0';
  }

  @override
  String cycleHistoryPeriodLength(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: 'A menstruação durou $days dias',
      one: 'A menstruação durou 1 dia',
    );
    return '$_temp0';
  }

  @override
  String cycleHistoryVsAverage(String diff) {
    return '$diff em relação à sua média';
  }

  @override
  String get insightsCycleHistoryEntry => 'Ciclos anteriores';

  @override
  String get homeEmptyTitle => 'Vamos começar pela sua última menstruação';

  @override
  String get homeEmptyBody =>
      'Toque no botão acima no dia em que a sua menstruação começar. Depois de dois ciclos completos a Vera pode começar a estimar — até lá, ela não finge saber.';

  @override
  String get homeEmptyBackdate => 'Ela já começou antes';

  @override
  String get settingsAdPrivacyEntry => 'Opções de privacidade dos anúncios';

  @override
  String a11yCycleRing(int day, int length) {
    return 'Dia $day de um ciclo de cerca de $length';
  }

  @override
  String a11yChartSummary(int count, String min, String max) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Gráfico com $count registros, de $min a $max',
      one: 'Gráfico com $count registro, de $min a $max',
    );
    return '$_temp0';
  }

  @override
  String a11yPhaseBar(int day, int length) {
    return 'Progresso do ciclo: dia $day de cerca de $length';
  }

  @override
  String a11yFrequencyItem(String label, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count vezes',
      one: '$count vez',
    );
    return '$label: $_temp0';
  }

  @override
  String get importTitle => 'Importar de outro app';

  @override
  String get importBody =>
      'Exporte o seu histórico do app anterior em CSV e escolha o arquivo aqui. Só datas e fluxo são importados — as palavras usadas para sintomas e humor mudam de app para app, e a Vera não vai adivinhar o que você quis dizer.';

  @override
  String get importPickFile => 'Escolher arquivo CSV';

  @override
  String importPreview(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Encontramos $count dias de histórico',
      one: 'Encontramos $count dia de histórico',
    );
    return '$_temp0';
  }

  @override
  String importSkipped(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count linhas não puderam ser lidas e ficarão de fora',
      one: '$count linha não pôde ser lida e ficará de fora',
    );
    return '$_temp0';
  }

  @override
  String get importConfirm => 'Adicionar ao meu histórico';

  @override
  String get importMergeNote =>
      'Os dias importados são mesclados. Os dias que você já registrou na Vera ficam como estão.';

  @override
  String importDone(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count dias importados',
      one: '$count dia importado',
    );
    return '$_temp0';
  }

  @override
  String get importErrorEmpty => 'Esse arquivo parece vazio.';

  @override
  String get importErrorNoDate =>
      'Não foi possível encontrar uma coluna de data nesse arquivo.';

  @override
  String get settingsImportEntry => 'Importar de outro app';

  @override
  String get settingsHealthSyncLabel =>
      'Sincronizar com Apple Health / Health Connect';

  @override
  String get settingsHealthSyncBody =>
      'Envia apenas fluxo menstrual, peso e temperatura basal para o app de saúde do seu celular. Sintomas, humor e notas continuam na Vera. Nada é lido de volta.';

  @override
  String healthSyncBackfilled(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count dias enviados para o seu app de saúde',
      one: '$count dia enviado para o seu app de saúde',
    );
    return '$_temp0';
  }

  @override
  String get healthSyncDenied =>
      'A permissão não foi concedida, então a sincronização continua desligada.';

  @override
  String get settingsDiagnosticsEntry => 'Diagnóstico';

  @override
  String get diagnosticsBody =>
      'Se o app apresentar problemas, os detalhes técnicos ficam registrados aqui — somente neste dispositivo. Nada é enviado a lugar nenhum, a menos que você escolha enviar, e você pode ler antes exatamente o que enviaria.';

  @override
  String get diagnosticsEmpty =>
      'Nada registrado — nenhum problema foi detectado.';

  @override
  String get diagnosticsShare => 'Enviar para o desenvolvedor';

  @override
  String get diagnosticsClear => 'Limpar';

  @override
  String get diagnosticsNoteLabel => 'O que aconteceu? (opcional)';

  @override
  String get diagnosticsTechnicalDetail => 'Detalhes técnicos';

  @override
  String get unitHoursShort => 'h';

  @override
  String get unitMinutesShort => 'min';

  @override
  String get unitHoursLong => 'horas';

  @override
  String get unitMinutesLong => 'minutos';

  @override
  String get unitMilliliters => 'ml';

  @override
  String get unitKilograms => 'kg';

  @override
  String get calendarJumpTitle => 'Ir para o mês';

  @override
  String get calendarJumpYearLabel => 'Ano';

  @override
  String get settingsAdPrivacyUnavailable =>
      'As opções de personalização de anúncios não são oferecidas na sua região — aqui os anúncios já não são personalizados.';

  @override
  String get settingsGroupAppearance => 'Aparência';

  @override
  String get settingsGroupTracking => 'Preferências de acompanhamento';

  @override
  String get dayLogCustomTagsLabel => 'Meus próprios registros';

  @override
  String get customTagAddButton => 'Adicionar um registro';

  @override
  String get customTagDialogTitle => 'Novo registro';

  @override
  String get customTagDialogHint => 'ex.: enxaqueca, academia, insônia';

  @override
  String get customTagManageEntry => 'Gerenciar meus registros';

  @override
  String get customTagRenameTitle => 'Renomear registro';

  @override
  String get customTagDeleteTitle => 'Excluir este registro?';

  @override
  String get customTagDeleteBody =>
      'Ele será removido de todos os dias em que você o usou. Os seus outros registros ficam como estão.';

  @override
  String get customTagEmpty => 'Você ainda não tem registros próprios.';

  @override
  String get premiumLockedTitle => 'Recurso Premium';

  @override
  String get premiumLockedAction => 'Ver o Premium';

  @override
  String get premiumBenefitCustomTrackers =>
      'Acompanhe o que quiser, com as suas próprias palavras';

  @override
  String get premiumBenefitAdvancedInsights =>
      'Estatísticas avançadas: o que costuma acontecer, e quando';

  @override
  String get premiumBenefitPersonalisation => 'Fundos e companheiros extras';

  @override
  String get premiumBenefitAdvancedReminders =>
      'Lembretes no seu próprio ritmo';

  @override
  String get advancedInsightsTitle => 'Estatísticas avançadas';

  @override
  String get advancedInsightsEntry => 'Estatísticas avançadas';

  @override
  String get advancedInsightsNotEnough =>
      'Registre três ciclos completos e os seus padrões aparecem aqui. Com menos que isso, qualquer \"padrão\" seria só coincidência.';

  @override
  String get advancedInsightsPatternsTitle =>
      'Quando cada coisa costuma aparecer';

  @override
  String advancedInsightsPatternLine(String label, String segment) {
    return '$label — na maioria das vezes $segment';
  }

  @override
  String advancedInsightsPatternDetail(int count, int day) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count dias registrados, por volta do dia $day do seu ciclo',
      one: '$count dia registrado, por volta do dia $day do seu ciclo',
    );
    return '$_temp0';
  }

  @override
  String advancedInsightsNoPattern(String label) {
    return '$label — ainda sem um momento claro';
  }

  @override
  String get advancedInsightsTrendTitle => 'Duração do ciclo ao longo do tempo';

  @override
  String advancedInsightsDriftLonger(String days, String cycles) {
    return 'Comparando os seus $cycles primeiros ciclos com os $cycles mais recentes, os recentes estão cerca de $days dias mais longos.';
  }

  @override
  String advancedInsightsDriftShorter(String days, String cycles) {
    return 'Comparando os seus $cycles primeiros ciclos com os $cycles mais recentes, os recentes estão cerca de $days dias mais curtos.';
  }

  @override
  String advancedInsightsDriftStable(String cycles) {
    return 'Comparando os seus $cycles primeiros ciclos com os $cycles mais recentes, a duração do seu ciclo ficou praticamente a mesma.';
  }

  @override
  String get advancedInsightsDriftNotEnough =>
      'Quando você tiver seis ciclos completos, a Vera pode comparar os primeiros com os mais recentes para ver se a duração do seu ciclo está mudando.';

  @override
  String get advancedInsightsMoodTitle => 'Humor por parte do ciclo';

  @override
  String get advancedInsightsDisclaimer =>
      'Isto é apenas a contagem do que você registrou, nada além disso. Não é um diagnóstico, e um padrão aqui não é uma causa.';

  @override
  String get segmentPeriod => 'durante a menstruação';

  @override
  String get segmentAfterPeriod => 'depois da menstruação';

  @override
  String get segmentMidCycle => 'no meio do ciclo';

  @override
  String get segmentBeforePeriod => 'antes da menstruação';

  @override
  String get customRemindersEntry => 'Meus próprios lembretes';

  @override
  String get customRemindersTitle => 'Meus próprios lembretes';

  @override
  String get customRemindersEmpty => 'Você ainda não tem lembretes próprios.';

  @override
  String get customRemindersAdd => 'Adicionar um lembrete';

  @override
  String get customReminderLabelHint => 'ex.: tomar meu remédio, beber água';

  @override
  String get customReminderLockScreenNote =>
      'O texto do lembrete aparece na sua tela de bloqueio, então escreva com a discrição que você quiser.';

  @override
  String get customReminderDelete => 'Excluir lembrete';

  @override
  String get homeThemeDusk => 'Anoitecer';

  @override
  String get homeThemeMeadow => 'Prado';

  @override
  String get homeThemePetal => 'Pétala';

  @override
  String get homeThemeBloom => 'Floração';

  @override
  String get homeThemeOcean => 'Oceano';

  @override
  String get homeThemeAutumn => 'Outono';

  @override
  String get homeThemeNight => 'Noite';

  @override
  String get mascotStar => 'Estrela';

  @override
  String get mascotLeaf => 'Folha';

  @override
  String get mascotCat => 'Gato';

  @override
  String get mascotRabbit => 'Coelho';

  @override
  String get mascotBird => 'Pássaro';

  @override
  String get tipDetailWhatsHappening => 'O que está acontecendo no seu corpo';

  @override
  String get tipDetailGeneralHeading => 'Sugestões gerais';

  @override
  String get tipDetailDisclaimer =>
      'Isto é informação geral, não orientação médica pessoal. Cada corpo responde de um jeito, e como você realmente se sente importa mais do que qualquer sugestão daqui. Se algo preocupar você, converse com um profissional de saúde.';

  @override
  String get phaseExplainerMenstrual =>
      'Estás a sangrar porque o revestimento do útero se está a soltar. O estrogénio e a progesterona estão no ponto mais baixo do ciclo, e é por isso que muitas pessoas se sentem mais cansadas e mais recolhidas nos primeiros dias. O sangramento dura normalmente três a sete dias e é mais intenso no início. As cólicas vêm das contrações do útero, desencadeadas pelas prostaglandinas — compostos semelhantes a hormonas libertados enquanto o revestimento se solta, e também a razão pela qual algumas pessoas têm ao mesmo tempo dores lombares ou o intestino mais solto. O sangramento também custa ferro, e isso explica parte do cansaço. Calor, movimento e sono costumam ajudar. Se a proteção encher a cada hora, se o sangramento passar claramente de uma semana ou se a dor te impedir de fazer coisas normais, vale a pena falar com um profissional de saúde em vez de esperar que passe.';

  @override
  String get phaseExplainerFollicular =>
      'Depois de terminar o sangramento, o estrogénio volta a subir. Nos ovários amadurece um grupo de folículos, cada um com um óvulo, e normalmente só um chega a ser libertado. O estrogénio reconstrói o revestimento que acabou de ser eliminado, e a maioria das pessoas sente a energia, o humor, a pele e a resistência a recuperar com ele. Esta é também a parte do ciclo que mais varia entre pessoas e entre meses: stress, doença, viagens e sono aparecem sobretudo aqui, alongando-a ou encurtando-a. É a razão honesta pela qual uma previsão é um intervalo e não uma data: a segunda metade do ciclo é bastante estável, e é esta que se mexe.';

  @override
  String get phaseExplainerFertile =>
      'O estrogénio está perto do pico e a ovulação é esperada por estes dias. Um pico da hormona luteinizante desencadeia a libertação do óvulo cerca de um dia a um dia e meio depois. O óvulo sobrevive aproximadamente 12 a 24 horas, mas os espermatozoides podem viver vários dias num muco cervical fértil — por isso a janela conta-se em vários dias e não num só. O muco torna-se tipicamente transparente, elástico e escorregadio, um pouco como clara de ovo crua; algumas pessoas notam mais desejo, mamas sensíveis ou uma pontada breve de um lado. A energia está muitas vezes no ponto mais alto do ciclo. Lembra-te de que esta janela é uma estimativa feita a partir do teu próprio histórico, não uma medição, e não é um método contracetivo.';

  @override
  String get phaseExplainerLuteal =>
      'Depois da ovulação, o folículo vazio torna-se corpo lúteo e começa a produzir progesterona, que mantém o revestimento estável caso uma gravidez se implante. Se isso não acontecer, a progesterona e o estrogénio caem bruscamente e a menstruação começa. Esta metade do ciclo é a mais constante, normalmente cerca de 12 a 14 dias. A progesterona sobe ligeiramente a temperatura em repouso — é a mudança que um termómetro basal capta — e pode abrandar a digestão, o que explica parte do inchaço. A queda no final é o que desencadeia a TPM em muitas pessoas: mamas tensas, alterações do apetite, sono interrompido, dores de cabeça e oscilações de humor, que costumam aliviar quando o sangramento começa. Se esses sintomas perturbarem o trabalho ou as relações na maioria dos meses, vale a pena falar com um profissional de saúde.';

  @override
  String get phaseExplainerUnknown =>
      'Ainda não há registos suficientes para dizer em que fase estás. A Vera precisa de pelo menos dois ciclos completos — um início de menstruação e depois o seguinte — para calcular a tua média e a tua variabilidade, e prefere dizê-lo a inventar uma fase. Entretanto nada se perde: cada dia que registas faz parte desse primeiro cálculo, e a estimativa aperta à medida que o histórico cresce. Até lá, as sugestões abaixo são gerais e valem em qualquer ponto do ciclo.';

  @override
  String get tipFitnessDetailMenstrual =>
      'O treino intenso não serve à maioria das pessoas nos primeiros dias, e isso não é falta de disciplina: a energia está mesmo mais baixa, e perder ferro com o sangramento faz o trabalho de resistência parecer mais duro do que a mesma sessão na semana passada. Caminhar, alongar suavemente, yoga restaurativo e trabalho de respiração melhoram a circulação e podem suavizar as cólicas; em algumas pessoas, mexer-se com regularidade ao longo do mês reduz a intensidade das cólicas mais do que qualquer coisa feita no próprio dia. Se te sentes bem, não há razão para evitar sessões exigentes: sangrar não é motivo para deixar de treinar, e muitas atletas competem durante a menstruação. Algumas notas práticas: sessões longas e exigentes nos dias de fluxo intenso podem aprofundar o cansaço, aplicar calor no baixo-ventre antes de começar torna o movimento mais confortável, e beber um pouco mais do que o habitual ajuda com as dores de cabeça destes dias. Avalia a sessão pelo que sentes durante ela, não pelo que foi a tua melhor semana.';

  @override
  String get tipFitnessDetailFollicular =>
      'Com o estrogénio a subir, a maioria sente-se mais forte e mais resistente; é geralmente o melhor período do ciclo para começar algo novo, aumentar a carga ou acelerar o ritmo. A reparação muscular é relativamente eficiente aqui, por isso as sessões duras são melhor absorvidas e deixam menos dores persistentes. É também uma boa janela para o que exige cabeça clara além de corpo forte: aprender um movimento novo, corrigir a técnica ou fazer uma distância maior do que o costume. Duas ressalvas a manter: aumenta gradualmente, porque muita energia não significa risco zero de lesão e a maioria das lesões por uso excessivo começa numa boa semana, não numa má. E protege o sono: a adaptação acontece na recuperação, não durante a sessão.';

  @override
  String get tipFitnessDetailFertile =>
      'A energia e a motivação estão normalmente no auge, por isso as sessões exigentes correm bem — é muitas vezes aqui que caem os recordes pessoais. Alguns estudos sugerem que as articulações ficam ligeiramente mais laxas à volta da ovulação; o efeito prático é discutido, mas um aquecimento mais longo é uma precaução barata em desportos com mudanças bruscas de direção, saltos e aterragens. A temperatura corporal ainda é baixa em relação à segunda metade do ciclo, por isso o calor limita menos do que limitará daqui a uma ou duas semanas. Uma pontada breve de um lado do baixo-ventre à volta da ovulação é frequente e passa geralmente em horas. Se a dor for forte, de um só lado e persistente, se houver febre ou sensação de desmaio, para e manda ver em vez de treinar na mesma.';

  @override
  String get tipFitnessDetailLuteal =>
      'Com a menstruação a aproximar-se, a energia pode baixar, a frequência cardíaca pode ficar mais alta para o mesmo esforço e a recuperação pode demorar mais. É uma oscilação esperada, não um retrocesso, e não apaga o trabalho das últimas duas semanas. A progesterona sobe ligeiramente a temperatura em repouso e dificulta a libertação de calor, por isso sessões com calor ou humidade parecem aqui desproporcionadamente duras: treinar nas horas mais frescas e beber mais do que parece necessário ajudam ambas as coisas. Sessões moderadas, uma versão um pouco mais leve do treino de força e caminhar são geralmente mais sustentáveis. Com inchaço e mamas sensíveis, um soutien desportivo com bom apoio e um aquecimento mais longo fazem uma diferença real. Se o humor estiver em baixo, faz a sessão curta e fácil em vez de a saltares: o limite para contar é mais baixo do que parece.';

  @override
  String get tipFitnessDetailUnknown =>
      'Mesmo sem saber a fase, mexer-se ajuda em qualquer altura: a recomendação geral é cerca de 150 minutos de atividade moderada por semana, distribuídos pela maioria dos dias, mais trabalho de força duas vezes por semana — e esse padrão resulta melhor, para quase toda a gente, do que sessões muito intensas ocasionais. A constância importa mais do que a intensidade, e a melhor sessão é a que vais mesmo repetir para a semana. Ajusta ao que sentes: nos dias cansados uma caminhada conta, e uma sessão curta feita vale mais do que uma longa saltada. Assim que registares alguns ciclos, aparecerão aqui sugestões específicas por fase.';

  @override
  String get tipNutritionDetailMenstrual =>
      'O sangramento custa-te ferro; carne vermelha, lentilhas, grão-de-bico, verduras de folha verde-escura e melaço ajudam a repô-lo. O ferro vegetal absorve-se bastante melhor com vitamina C — espremer limão sobre um prato de lentilhas é a versão mais prática, e uma salada de tomate ao lado faz o mesmo. O chá e o café à refeição reduzem a absorção de ferro por causa dos taninos, por isso basta deixar cerca de uma hora entre eles; não é preciso abdicar de nenhum. Beber água suficiente pode aliviar o cansaço e as dores de cabeça associados ao sangramento, e alimentos ricos em magnésio como frutos secos, sementes e verduras escuras ajudam algumas pessoas com as cólicas. Nos dias em que a digestão está lenta, refeições pequenas e frequentes assentam melhor do que grandes. Se por altura da menstruação sentires muitas vezes falta de ar, tonturas ou um cansaço fora do normal, vale a pena mencioná-lo a um profissional de saúde: o ferro baixo é comum, fácil de analisar, e não é algo que uma app deva diagnosticar.';

  @override
  String get tipNutritionDetailFollicular =>
      'Com a energia a recuperar, o corpo está em modo de reconstrução: proteína suficiente, cereais integrais e vegetais apoiam isso, e é nesta fase que o apetite costuma ser mais estável e mais fácil de gerir. Faz também sentido continuar a repor as reservas de ferro depois do sangramento em vez de tratar isso como tarefa apenas da semana menstrual: as reservas refazem-se em semanas, não em dias. Não saltar refeições é mais fácil aqui, e deixa-te entrar mais equilibrada nas oscilações de apetite da fase seguinte. Se vais mudar a forma como comes, este período costuma ser mais amável para começar do que a semana antes da menstruação, quando os desejos e o humor em baixo fazem qualquer rotina nova parecer mais difícil do que é.';

  @override
  String get tipNutritionDetailFertile =>
      'Aqui não é preciso nenhuma dieta especial; refeições equilibradas e água suficiente fazem quase todo o trabalho. Algumas pessoas sentem-se inchadas à volta da ovulação, o que costuma ser hormonal e passageiro e não consequência do que comeram. O apetite baixa ligeiramente numas e sobe noutras — as duas coisas são normais. Manter proteína e fibra nas refeições estabiliza a energia naquele que é muitas vezes o período mais ativo do mês. Se estás a planear uma gravidez, é boa altura para perguntar a um profissional de saúde sobre o ácido fólico, geralmente aconselhado antes da conceção e não depois — mas essa é uma conversa com essa pessoa, não um conselho que uma app deva dar.';

  @override
  String get tipNutritionDetailLuteal =>
      'O aumento do apetite e a vontade de doces enquanto a progesterona sobe são muito comuns; é uma alteração hormonal, não um problema de força de vontade, e o corpo gasta mesmo um pouco mais de energia nesta fase. Juntar proteína e fibra às refeições mantém a glicemia mais estável e suaviza a vontade muito melhor do que tentar ignorá-la — uma vontade satisfeita com algo substancial costuma acabar mais cedo do que outra contra a qual se luta durante uma hora. Menos sal e mais água podem aliviar o inchaço; parece ao contrário mas não é: bem hidratado, o corpo retém menos. Alimentos ricos em magnésio (amêndoas, nozes, verduras escuras, chocolate preto) reduzem cólicas e tensão em algumas pessoas. Reduzir a cafeína depois do meio-dia ajuda com o sono interrompido desta fase, e vale a pena vigiar também o álcool, porque fragmenta o sono exatamente no ponto do ciclo em que já está mais leve.';

  @override
  String get tipNutritionDetailUnknown =>
      'Seja qual for a fase, o que mais ajuda é o mesmo: refeições regulares, proteína suficiente, muitos vegetais, água suficiente e alimentos ricos em ferro. Como o sangramento custa ferro, basta prestar um pouco mais de atenção nesses dias — não é preciso uma alimentação diferente para cada semana do mês. Comer a horas mais ou menos constantes faz mais pela estabilidade da energia do que qualquer alimento isolado, e não há nenhum ingrediente que tenha de ser cortado para um ciclo ser saudável. Assim que registares alguns ciclos, aparecerão aqui sugestões específicas por fase.';

  @override
  String get tipSleepLabel => 'Sono';

  @override
  String get tipSleepMenstrual =>
      'Cólicas e desconforto podem fragmentar o sono; um banho quente ou uma bolsa térmica antes de dormir pode ajudar.';

  @override
  String get tipSleepFollicular =>
      'Com o aumento de energia, muitas se sentem mais despertas — a necessidade real de sono, porém, não diminui.';

  @override
  String get tipSleepFertile =>
      'O leve aumento de temperatura perto da ovulação pode dificultar um pouco pegar no sono; um quarto mais fresco pode ajudar.';

  @override
  String get tipSleepLuteal =>
      'A progesterona eleva ligeiramente a temperatura de repouso e pode deixar o sono profundo mais leve; um quarto fresco e escuro e um horário fixo ajudam mais aqui.';

  @override
  String get tipSleepUnknown =>
      'A qualidade do sono costuma variar ao longo do ciclo — geralmente mais frágil logo antes e durante a menstruação. Um horário de sono constante é a base mais confiável, independente da fase.';

  @override
  String get tipSleepDetailMenstrual =>
      'Durante a menstruação, o sono costuma ser mais fragmentado — cólicas, desconforto e, para algumas, idas mais frequentes ao banheiro podem acordar durante a noite. Um banho quente, bolsa térmica ou alongamento leve antes de dormir podem aliviar as cólicas. Se tomar analgésico, cronometrar para que o efeito cubra a primeira parte da noite pode proteger o sono inicial.';

  @override
  String get tipSleepDetailFollicular =>
      'Com o aumento do estrogênio, muitas se sentem mais alertas e cheias de energia, o que pode parecer menos necessidade de sono. Não é bem assim — ficar acordada apenas fica mais fácil. Manter um horário fixo aqui compensa mais tarde, quando o sono fica mais frágil em outras fases.';

  @override
  String get tipSleepDetailFertile =>
      'O leve aumento de temperatura perto da ovulação pode dificultar um pouco pegar no sono, já que o corpo naturalmente quer esfriar antes de dormir. Um quarto mais fresco, um cobertor mais leve ou um banho quente antes de dormir podem compensar isso. Quem percebe mais desejo ou energia social nessa janela também pode ficar acordada até mais tarde por escolha.';

  @override
  String get tipSleepDetailLuteal =>
      'A progesterona que sobe após a ovulação eleva ligeiramente a temperatura de repouso, o que pode deixar o sono profundo mais leve — às vezes como um leve calor súbito, às vezes só como um sono menos revigorante. Perto da menstruação, a tensão pré-menstrual pode se somar a isso. Um quarto fresco e escuro, menos tela antes de dormir e um horário fixo ajudam mais aqui.';

  @override
  String get tipSleepDetailUnknown =>
      'Ainda não há dados suficientes para determinar a fase, mas a variação na qualidade do sono ao longo do ciclo é um padrão comum — geralmente mais frágil logo antes e durante a menstruação, mais estável na primeira metade. A base mais confiável independente da fase: horários fixos de dormir e acordar, menos tela antes de dormir e um quarto fresco e escuro.';
}
