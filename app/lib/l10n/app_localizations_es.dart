// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get appTitle => 'Vera';

  @override
  String get actionSkip => 'Omitir';

  @override
  String get actionContinue => 'Continuar';

  @override
  String get actionDone => 'Listo';

  @override
  String get actionCancel => 'Cancelar';

  @override
  String get actionDelete => 'Eliminar';

  @override
  String get actionEnable => 'Activar';

  @override
  String get commonIDontKnow => 'No lo sé';

  @override
  String get commonYes => 'Sí';

  @override
  String get commonNo => 'No';

  @override
  String get commonNotSure => 'No estoy segura';

  @override
  String get pinSetupTitle => 'Configura un PIN';

  @override
  String get pinSetupEnterPrompt =>
      'Elige un PIN de 6 dígitos para bloquear la app';

  @override
  String get pinSetupConfirmPrompt => 'Vuelve a escribirlo para confirmar';

  @override
  String get pinSetupMismatch => 'No coinciden — intentemos de nuevo';

  @override
  String get pinSetupBiometricTitle => '¿Desbloqueo más rápido?';

  @override
  String get pinSetupBiometricBody =>
      'También puedes usar tu huella o rostro para desbloquear — tu PIN sigue funcionando como respaldo.';

  @override
  String get lockScreenTitle => 'Bloqueado';

  @override
  String get lockScreenEnterPin => 'Ingresa tu PIN';

  @override
  String get lockScreenWrongPin => 'Ese PIN no coincide';

  @override
  String get lockScreenUseBiometrics => 'Usar biometría';

  @override
  String get lockScreenForgotPin => '¿Olvidaste tu PIN?';

  @override
  String lockScreenThrottled(int seconds) {
    return 'Demasiados intentos. Vuelve a intentarlo en ${seconds}s';
  }

  @override
  String get lockScreenEraseTitle => '¿Borrar todos los datos?';

  @override
  String get lockScreenEraseBody =>
      'Esto elimina permanentemente todo en este dispositivo. No hay cuenta ni copia de seguridad en un servidor, así que no se puede deshacer.';

  @override
  String get lockScreenEraseConfirm => 'Borrar todo';

  @override
  String get onboardingPrivacyTitle => 'Bienvenida';

  @override
  String get onboardingPrivacyBody =>
      'Los datos de tu ciclo se quedan solo en este dispositivo, cifrados. No hay cuenta ni sincronización en la nube — nada de lo que registras se sube. La clave vive en el hardware seguro de tu teléfono, y puedes exportar o borrar todo cuando quieras.';

  @override
  String get onboardingLastPeriodTitle => '¿Cuándo comenzó tu último periodo?';

  @override
  String get onboardingLastPeriodBody =>
      'Esto nos ayuda a empezar — siempre puedes corregirlo después desde el calendario.';

  @override
  String get onboardingPickDate => 'Elegir una fecha';

  @override
  String get onboardingCycleLengthTitle =>
      '¿Cuánto dura tu ciclo, normalmente?';

  @override
  String get onboardingCycleLengthBody =>
      'Un número aproximado está bien. Empezaremos a darte una estimación real en cuanto veamos un par de ciclos completos.';

  @override
  String get onboardingPeriodLengthTitle =>
      '¿Cuántos días suele durar tu periodo?';

  @override
  String get onboardingPeriodLengthBody =>
      'Usaremos esto para completar tu último periodo, así no empiezas de cero.';

  @override
  String get onboardingDaysUnit => 'días';

  @override
  String get onboardingGoalTitle => '¿Qué te trae por aquí?';

  @override
  String get onboardingGoalBody =>
      'Esto solo nos ayuda a mostrarte primero lo más relevante — puedes cambiarlo cuando quieras en Ajustes.';

  @override
  String get goalTrackPeriod => 'Seguir mi periodo';

  @override
  String get goalTryingToConceive => 'Intentando concebir';

  @override
  String get goalPregnancyTracking => 'Seguimiento del embarazo';

  @override
  String get onboardingRegularityTitle => '¿Tus periodos suelen ser regulares?';

  @override
  String get onboardingRegularityBody =>
      'No hay respuesta incorrecta — esto solo nos ayuda a conocer un poco tu cuerpo.';

  @override
  String get onboardingCrampsTitle => '¿Sueles tener cólicos?';

  @override
  String get onboardingCrampsBody =>
      'Nos aseguraremos de que sea fácil registrar cómo te sientes esos días.';

  @override
  String get onboardingNotificationTitle => '¿Quieres recordatorios suaves?';

  @override
  String get onboardingNotificationBody =>
      'Podemos avisarte antes de que se espere tu periodo.';

  @override
  String get onboardingNotificationMockTitle =>
      'Tu periodo podría empezar pronto';

  @override
  String get onboardingNotificationMockBody => 'Según tus ciclos registrados';

  @override
  String get onboardingNotificationAllow => 'Activar recordatorios';

  @override
  String get onboardingNotificationNotNow => 'Ahora no';

  @override
  String get onboardingBuildingPlanTitle => 'Preparando todo para ti';

  @override
  String get onboardingBuildingPlanStep1 =>
      'Asegurando tus datos en este dispositivo';

  @override
  String get onboardingBuildingPlanStep2 => 'Guardando tus preferencias';

  @override
  String get onboardingBuildingPlanStep3 => 'Preparando tu calendario';

  @override
  String get onboardingBuildingPlanDone => 'Todo listo';

  @override
  String get navHome => 'Inicio';

  @override
  String get navCalendar => 'Calendario';

  @override
  String get navInsights => 'Estadísticas';

  @override
  String get navSettings => 'Ajustes';

  @override
  String homeCycleDayLabel(int day) {
    return 'Día $day';
  }

  @override
  String get homeNoCycleYet => 'Aún no hay periodo registrado';

  @override
  String get homePhaseMenstrual => 'Periodo';

  @override
  String get homePhaseFollicular => 'Fase folicular';

  @override
  String get homePhaseFertileWindow => 'Ventana fértil estimada';

  @override
  String get homePhaseLuteal => 'Fase lútea';

  @override
  String get homePhaseUnknown => 'No hay datos recientes suficientes';

  @override
  String get homePredictionInsufficientTitle => 'Aún no hay datos suficientes';

  @override
  String get homePredictionInsufficientBody =>
      'Registra tu próximo periodo y empezaremos a estimar.';

  @override
  String homePredictionRangeLabel(String start, String end) {
    return '$start – $end';
  }

  @override
  String get homeConfidenceHigh => 'Alta confianza';

  @override
  String get homeConfidenceMedium => 'Confianza media';

  @override
  String get homeConfidenceLow => 'Confianza baja';

  @override
  String get homeIrregularNote =>
      'La duración de tu ciclo ha variado más de lo habitual últimamente. Si esto es nuevo para ti, podría valer la pena mencionarlo en una consulta.';

  @override
  String get homeFertileWindowDisclaimer =>
      'Basado en el ritmo típico del ciclo — no es un método anticonceptivo.';

  @override
  String get homePeriodStartedButton => 'El periodo empezó hoy';

  @override
  String get homePeriodStartedSnackbar => 'Registrado — el periodo empezó hoy';

  @override
  String get actionUndo => 'Deshacer';

  @override
  String get comingSoon => 'Próximamente';

  @override
  String get dayLogFlowLabel => 'Flujo';

  @override
  String get flowSpotting => 'Manchado';

  @override
  String get flowLight => 'Ligero';

  @override
  String get flowMedium => 'Moderado';

  @override
  String get flowHeavy => 'Abundante';

  @override
  String get flowNone => 'Ninguno';

  @override
  String get dayLogSymptomsLabel => 'Síntomas';

  @override
  String get symptomCramps => 'Cólicos';

  @override
  String get symptomHeadache => 'Dolor de cabeza';

  @override
  String get symptomBloating => 'Hinchazón';

  @override
  String get symptomBreastTenderness => 'Sensibilidad en los senos';

  @override
  String get symptomAcne => 'Acné';

  @override
  String get symptomFatigue => 'Fatiga';

  @override
  String get symptomNausea => 'Náuseas';

  @override
  String get symptomBackPain => 'Dolor de espalda';

  @override
  String get symptomAppetiteChange => 'Cambio de apetito';

  @override
  String get symptomSleepTrouble => 'Problemas para dormir';

  @override
  String get symptomPelvicPain => 'Dolor pélvico';

  @override
  String get symptomDizziness => 'Mareo';

  @override
  String get dayLogMoodLabel => 'Estado de ánimo';

  @override
  String get moodCalm => 'Tranquila';

  @override
  String get moodAnxious => 'Ansiosa';

  @override
  String get moodIrritable => 'Irritable';

  @override
  String get moodLow => 'Decaída';

  @override
  String get moodEnergetic => 'Con energía';

  @override
  String get moodHappy => 'Feliz';

  @override
  String get moodContent => 'Satisfecha';

  @override
  String get moodSad => 'Triste';

  @override
  String get moodDepressed => 'Deprimida';

  @override
  String get moodEmotional => 'Sensible';

  @override
  String get dayLogNoteLabel => 'Nota';

  @override
  String get dayLogNoteHint => 'Cualquier cosa que quieras recordar sobre hoy';

  @override
  String get dayLogOptionalTrackersLabel => 'Seguimientos opcionales';

  @override
  String get dayLogSexualActivityLabel => 'Actividad sexual';

  @override
  String get dayLogBbtLabel => 'Temperatura basal';

  @override
  String get dayLogMucusLabel => 'Moco cervical';

  @override
  String get mucusDry => 'Seco';

  @override
  String get mucusSticky => 'Pegajoso';

  @override
  String get mucusCreamy => 'Cremoso';

  @override
  String get mucusWatery => 'Acuoso';

  @override
  String get mucusEggWhite => 'Clara de huevo';

  @override
  String get dayLogSavedIndicator => 'Guardado';

  @override
  String get homeOpenTodayLog => 'Añadir detalles de hoy';

  @override
  String get calendarLegendActual => 'Periodo registrado';

  @override
  String get calendarLegendPredicted => 'Ventana prevista';

  @override
  String get calendarLegendFertile => 'Ventana fértil estimada';

  @override
  String get calendarLegendOvulation => 'Ovulación estimada';

  @override
  String get dayDetailFertileTitle => 'Estás en tu ventana fértil estimada';

  @override
  String get dayDetailOvulationTitle => 'Día de ovulación estimado';

  @override
  String get dayDetailOvulationBody =>
      'El embarazo suele ser más probable alrededor de este día, según la sincronización habitual — esto es una estimación, no una garantía.';

  @override
  String get insightsCyclesLoggedLabel => 'Ciclos registrados';

  @override
  String get insightsAveragePeriodLengthLabel => 'Duración media del periodo';

  @override
  String get insightsAverageCycleLengthLabel => 'Duración media del ciclo';

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
      other: 'Varía en unos $daysString días',
      one: 'Varía en un día',
    );
    return '$_temp0';
  }

  @override
  String get insightsNotEnoughDataTitle => 'Aún no hay datos suficientes';

  @override
  String get insightsNotEnoughDataBody =>
      'Registra un par de ciclos completos y tus promedios aparecerán aquí.';

  @override
  String get insightsSymptomFrequencyTitle => 'Síntomas por día del ciclo';

  @override
  String get insightsNoSymptomsLogged => 'Aún no hay síntomas registrados';

  @override
  String get settingsLanguageLabel => 'Idioma';

  @override
  String get settingsLanguageSystem => 'Idioma del sistema';

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
  String get settingsWeekStartLabel => 'La semana empieza el';

  @override
  String get settingsWeekStartMonday => 'Lunes';

  @override
  String get settingsWeekStartSunday => 'Domingo';

  @override
  String get settingsTemperatureUnitLabel => 'Unidad de temperatura';

  @override
  String get settingsTemperatureCelsius => 'Celsius';

  @override
  String get settingsTemperatureFahrenheit => 'Fahrenheit';

  @override
  String get settingsRemindersLabel => 'Avisarme antes de mi periodo';

  @override
  String get settingsRemindersPeriodEndLabel =>
      'Avisarme cuando mi periodo deba estar terminando';

  @override
  String get settingsRemindersMedicationLabel => 'Recordatorio de medicación';

  @override
  String get settingsRemindersWaterLabel => 'Recordatorio de agua';

  @override
  String get settingsRemindersAppointmentLabel => 'Recordatorio de cita';

  @override
  String get settingsRemindersAppointmentSet => 'Fijar fecha y hora';

  @override
  String get settingsRemindersAppointmentClear => 'Quitar';

  @override
  String get settingsOptionalTrackersHeading => 'Seguimientos opcionales';

  @override
  String get settingsOptionalTrackersBody =>
      'Desactivado por defecto. Al activar uno, se añade a la pantalla de registro diario.';

  @override
  String get settingsSexualActivityToggle => 'Actividad sexual';

  @override
  String get settingsBbtToggle => 'Temperatura basal';

  @override
  String get settingsMucusToggle => 'Moco cervical';

  @override
  String get settingsBreastExamToggle => 'Autoexamen de mama';

  @override
  String get settingsCervixToggle => 'Posición y firmeza del cuello uterino';

  @override
  String get settingsPrivacyEntry => 'Privacidad';

  @override
  String get settingsDeleteAllData => 'Eliminar todos los datos';

  @override
  String get privacyScreenTitle => 'Privacidad';

  @override
  String get privacyScreenIntro =>
      'Esto es exactamente lo que ocurre con tus datos, en lenguaje sencillo.';

  @override
  String get privacyScreenStorage =>
      'Todo lo que registras se cifra y se guarda solo en este dispositivo, en un único archivo. La clave de cifrado vive en el hardware seguro de tu teléfono — Keychain en iOS, Keystore en Android — no en el archivo en sí.';

  @override
  String get privacyScreenNoNetwork =>
      'Esta app no tiene servidor propio ni sistema de cuentas — tus registros nunca se suben. La versión gratuita incluye anuncios de Google que sí se conectan a internet; nunca reciben nada de lo que registras.';

  @override
  String get privacyScreenNoThirdParty =>
      'No hay analítica, ni informes de fallos, ni SDK de seguimiento. El único componente de terceros es el SDK de anuncios de Google en la versión gratuita — Premium lo elimina por completo.';

  @override
  String get privacyScreenExport =>
      'La única forma en que tus datos salen de este dispositivo es si tú misma los exportas, y esa exportación se cifra con una contraseña que solo tú conoces.';

  @override
  String get privacyScreenDelete =>
      'Eliminar tus datos es real e inmediato. No hay cuenta ni copia de seguridad de nuestra parte — una vez que se van, se van.';

  @override
  String get adPlaceholderLabel => 'Espacio publicitario';

  @override
  String get adPlaceholderUpgradeCta =>
      'Pasa a Premium para una experiencia sin anuncios';

  @override
  String get reminderNotificationTitle => 'Tu periodo podría empezar pronto';

  @override
  String get reminderNotificationBody =>
      'Según tus ciclos registrados, tu ventana estimada se acerca.';

  @override
  String get reminderPeriodEndTitle => 'Tu periodo podría estar terminando';

  @override
  String get reminderPeriodEndBody =>
      'Si sigue en curso, es completamente normal — solo un aviso amable.';

  @override
  String get reminderMedicationTitle => 'Recordatorio de medicación';

  @override
  String get reminderMedicationBody => 'Hora de tomar tu medicación.';

  @override
  String get reminderWaterTitle => 'Mantente hidratada';

  @override
  String get reminderWaterBody => 'Un pequeño recordatorio de agua.';

  @override
  String get reminderAppointmentTitle => 'Cita próxima';

  @override
  String get reminderAppointmentBody => 'Tienes una cita próxima.';

  @override
  String get settingsExportEntry => 'Exportar y respaldar';

  @override
  String get exportBackupHeading => 'Copia de seguridad cifrada';

  @override
  String get exportBackupBody =>
      'Guarda una copia cifrada de tu historial para moverla a otro dispositivo. Necesitarás la contraseña de nuevo para restaurarla — no hay otra forma de recuperarla.';

  @override
  String get exportCreateBackupButton => 'Crear copia de seguridad';

  @override
  String get exportRestoreBackupButton => 'Restaurar desde copia de seguridad';

  @override
  String get exportPasswordLabel => 'Contraseña';

  @override
  String get exportPasswordConfirmLabel => 'Confirmar contraseña';

  @override
  String get exportPasswordMismatch => 'Las contraseñas no coinciden';

  @override
  String get exportPasswordTooShort => 'Usa al menos 8 caracteres';

  @override
  String get exportRestoreConfirmTitle =>
      '¿Reemplazar todos los datos de este dispositivo?';

  @override
  String get exportRestoreConfirmBody =>
      'Restaurar una copia de seguridad reemplaza todo lo registrado actualmente en este dispositivo. Esto no se puede deshacer.';

  @override
  String get exportRestoreConfirmAction => 'Restaurar';

  @override
  String get exportWrongPassword =>
      'Esa contraseña no coincide con esta copia de seguridad';

  @override
  String get exportInvalidFile =>
      'Ese archivo no parece ser una copia de seguridad de Vera';

  @override
  String get exportBackupCreated => 'Copia de seguridad lista para compartir';

  @override
  String get exportRestoreSuccess => 'Copia de seguridad restaurada';

  @override
  String get exportDoctorReportHeading => 'Informe para el médico';

  @override
  String get exportDoctorReportBody =>
      'Un resumen que puedes compartir con un profesional de la salud.';

  @override
  String get exportIncludeNotesToggle => 'Incluir notas personales';

  @override
  String get exportShareCsvButton => 'Compartir como CSV';

  @override
  String get exportPrintPdfButton => 'Imprimir / Guardar como PDF';

  @override
  String get doctorReportDisclaimer =>
      'Generado por Vera a partir de datos introducidos por la usuaria. No es un diagnóstico médico.';

  @override
  String get doctorReportGeneratedOn => 'Generado el';

  @override
  String get doctorReportSummaryHeading => 'Resumen';

  @override
  String get doctorReportDailyLogHeading => 'Registro diario';

  @override
  String get doctorReportColumnDate => 'Fecha';

  @override
  String get doctorReportTimelineHeading => 'Cronología de ciclos';

  @override
  String get doctorReportCycleLabel => 'Ciclo';

  @override
  String get doctorReportTimelineLegendPeriod => 'Periodo';

  @override
  String get doctorReportTimelineLegendCycle => 'Resto del ciclo';

  @override
  String get doctorReportTimelineOngoing => 'En curso';

  @override
  String get dailyInsightLabel => '¿Sabías que...?';

  @override
  String get insightMenstrual1 =>
      'Tu revestimiento uterino se está desprendiendo ahora mismo — la mayoría de los periodos duran de 3 a 7 días, y eso es completamente normal.';

  @override
  String get insightMenstrual2 =>
      'Los alimentos ricos en hierro, como las verduras de hoja verde y las lentejas, pueden ayudar a compensar lo que tu cuerpo pierde esta semana.';

  @override
  String get insightFollicular1 =>
      'El estrógeno está subiendo, y muchas personas notan más energía y mejor concentración a partir de ahora.';

  @override
  String get insightFollicular2 =>
      'Tu cuerpo está preparando un óvulo para liberarlo — esta fase puede durar desde una semana hasta varias.';

  @override
  String get insightFertile1 =>
      'Esta es tu ventana fértil estimada — los días alrededor de la ovulación en los que el embarazo es más probable, según el ritmo típico.';

  @override
  String get insightFertile2 =>
      'Algunas personas notan una ligera subida en la temperatura basal o cambios en el moco cervical alrededor de la ovulación.';

  @override
  String get insightLuteal1 =>
      'La progesterona sube después de la ovulación — a menudo es cuando aparecen síntomas de SPM como cambios de humor o hinchazón.';

  @override
  String get insightLuteal2 =>
      'Si un embarazo no se ha implantado, los niveles hormonales bajan cerca del final de esta fase, desencadenando tu próximo periodo.';

  @override
  String get insightUnknown1 =>
      'La duración del ciclo varía mucho de una persona a otra — entre 21 y 35 días se considera típico.';

  @override
  String get insightsPhaseTipsTitle => 'Puede sentarte bien en esta fase';

  @override
  String get tipFitnessLabel => 'Movimiento';

  @override
  String get tipNutritionLabel => 'Nutrición';

  @override
  String get tipFitnessMenstrual =>
      'El movimiento suave — caminar, estirar o yoga restaurativo — puede sentar mejor que un entrenamiento intenso ahora mismo.';

  @override
  String get tipFitnessFollicular =>
      'La energía suele aumentar en esta fase — un buen momento para probar un entrenamiento nuevo o esforzarte un poco más.';

  @override
  String get tipFitnessFertile =>
      'Muchas personas se sienten más enérgicas aquí — una buena fase para entrenamiento de mayor intensidad si te apetece.';

  @override
  String get tipFitnessLuteal =>
      'Si la energía baja hacia el final de esta fase, el trabajo de fuerza de baja intensidad o nadar puede sentirse más sostenible.';

  @override
  String get tipFitnessUnknown =>
      'El movimiento que te siente bien hoy es una buena elección — no hay una única rutina \"correcta\" para cada día.';

  @override
  String get tipNutritionMenstrual =>
      'Los alimentos ricos en hierro como verduras de hoja verde, lentejas y carne roja pueden ayudar a compensar lo que tu cuerpo pierde esta semana.';

  @override
  String get tipNutritionFollicular =>
      'Las comidas más ligeras y frescas suelen sentar bien cuando sube la energía — pero no hay una única forma \"correcta\" de comer en esta fase.';

  @override
  String get tipNutritionFertile =>
      'Mantenerte hidratada y llevar comidas equilibradas apoya tu energía en esta fase que se siente más activa.';

  @override
  String get tipNutritionLuteal =>
      'Los antojos pueden cambiar aquí — los carbohidratos complejos y alimentos ricos en magnesio como frutos secos y chocolate negro son opciones habituales.';

  @override
  String get tipNutritionUnknown =>
      'Las comidas equilibradas y regulares son una buena opción por defecto cuando tu fase aún no está clara.';

  @override
  String get predictionSettingsEntry => 'Ajustes de predicción';

  @override
  String get predictionSettingsIntro =>
      'Estas son suposiciones, mostradas con transparencia. Una vez que registres 2 ciclos completos, tu predicción real en Inicio se calcula con tus propios datos — estos números dejan de usarse para eso.';

  @override
  String get predictionSettingsPeriodLengthLabel =>
      'Duración típica del periodo';

  @override
  String get predictionSettingsCycleLengthLabel => 'Duración típica del ciclo';

  @override
  String get predictionSettingsCycleLengthHint =>
      'Se usa para escalar el anillo de Inicio hasta que tengamos datos reales.';

  @override
  String get predictionSettingsLutealLabel => 'Duración de la fase lútea';

  @override
  String get predictionSettingsLutealHint =>
      'Los días típicos entre la ovulación y tu próximo periodo. Se usa para ubicar la ventana fértil estimada — este valor se sigue usando incluso después de que empiecen las predicciones reales.';

  @override
  String get dayLogEnergyLabel => 'Energía';

  @override
  String get energyLevelLow => 'Baja';

  @override
  String get energyLevelMedium => 'Media';

  @override
  String get energyLevelHigh => 'Alta';

  @override
  String get energyLevelEnergetic => 'Con mucha energía';

  @override
  String get dayLogSkinHairLabel => 'Piel y cabello';

  @override
  String get skinHealthyGlow => 'Piel radiante';

  @override
  String get skinRedness => 'Enrojecimiento';

  @override
  String get skinDryness => 'Sequedad';

  @override
  String get skinOiliness => 'Grasa';

  @override
  String get hairGoodDay => 'Buen día de cabello';

  @override
  String get hairBadDay => 'Mal día de cabello';

  @override
  String get hairLoss => 'Caída del cabello';

  @override
  String get scalpOily => 'Cuero cabelludo graso';

  @override
  String get dayLogBreastExamLabel => 'Autoexamen de mama';

  @override
  String get breastExamAllNormal => 'Nada fuera de lo normal';

  @override
  String get breastExamLump => 'Bulto';

  @override
  String get breastExamIndentation => 'Hundimiento';

  @override
  String get breastExamRedness => 'Enrojecimiento';

  @override
  String get breastExamCrackedNipple => 'Pezón agrietado';

  @override
  String get breastExamDischarge => 'Secreción';

  @override
  String get cervixPositionLabel => 'Posición del cuello uterino';

  @override
  String get cervixPositionLow => 'Baja';

  @override
  String get cervixPositionMedium => 'Media';

  @override
  String get cervixPositionHigh => 'Alta';

  @override
  String get cervixOpeningLabel => 'Apertura del cuello uterino';

  @override
  String get cervixOpeningClosed => 'Cerrado';

  @override
  String get cervixOpeningMedium => 'Media';

  @override
  String get cervixOpeningOpen => 'Abierto';

  @override
  String get cervixFirmnessLabel => 'Firmeza del cuello uterino';

  @override
  String get cervixFirmnessSoft => 'Blando';

  @override
  String get cervixFirmnessMedium => 'Media';

  @override
  String get cervixFirmnessFirm => 'Firme';

  @override
  String get dayLogWaterLabel => 'Agua';

  @override
  String get dayLogSleepLabel => 'Sueño';

  @override
  String get dayLogWeightLabel => 'Peso';

  @override
  String get dayLogMedicationsLabel => 'Medicación';

  @override
  String get dayLogAddMedication => 'Añadir medicamento';

  @override
  String get dayLogMedicationNameHint => 'Nombre del medicamento';

  @override
  String get navAssistant => 'Asistente';

  @override
  String get assistantTitle => 'Asistente Vera';

  @override
  String get assistantInputHint => 'Pregunta sobre tu ciclo…';

  @override
  String get assistantIntro =>
      '¡Hola! Puedo responder preguntas sobre el periodo, el ciclo y cómo funciona Vera — aquí en tu teléfono, nada sale de tu dispositivo. No soy médica y esto no es consejo médico.';

  @override
  String get insightMenstrual3 =>
      'La sangre menstrual no es \"sangre sucia\" — es una mezcla de sangre y revestimiento uterino, una parte completamente normal del ciclo.';

  @override
  String get insightMenstrual4 =>
      'El calor suave en el bajo vientre alivia de verdad los cólicos — la bolsa de agua caliente es un clásico con respaldo científico.';

  @override
  String get insightMenstrual5 =>
      'El flujo suele ser más abundante los dos primeros días y luego disminuye — ese patrón es típico.';

  @override
  String get insightMenstrual6 =>
      'Sentirse un poco más cansada durante el periodo es común — el hierro sale del cuerpo con la sangre menstrual.';

  @override
  String get insightFollicular3 =>
      'El estrógeno reconstruye el revestimiento uterino tras el periodo — tu cuerpo se prepara de nuevo.';

  @override
  String get insightFollicular4 =>
      'La piel suele verse más limpia en esta fase, a medida que las hormonas se estabilizan.';

  @override
  String get insightFollicular5 =>
      'La resistencia y los reflejos alcanzan su punto máximo al final de la fase folicular en muchas personas.';

  @override
  String get insightFollicular6 =>
      'La duración de esta fase es la que más varía entre personas — la fase lútea es mucho más constante.';

  @override
  String get insightFertile3 =>
      'El óvulo vive unas 12–24 horas, pero los espermatozoides pueden esperar hasta 5 días — por eso la ventana fértil abarca varios días.';

  @override
  String get insightFertile4 =>
      'Cerca de la ovulación, el moco cervical suele volverse claro y elástico — como clara de huevo cruda.';

  @override
  String get insightFertile5 =>
      'Algunas personas sienten una punzada breve en un lado al ovular — incluso tiene nombre: mittelschmerz.';

  @override
  String get insightFertile6 =>
      'La temperatura basal sube ligeramente *después* de la ovulación — la confirma, no la predice.';

  @override
  String get insightLuteal3 =>
      'La progesterona alcanza su pico una semana tras la ovulación — la hinchazón y la sensibilidad en los senos son comunes entonces.';

  @override
  String get insightLuteal4 =>
      'El antojo de carbohidratos antes del periodo es real — las necesidades energéticas suben un poco en la fase lútea.';

  @override
  String get insightLuteal5 =>
      'Los síntomas del SPM suelen aliviarse uno o dos días después de que empiece el sangrado.';

  @override
  String get insightLuteal6 =>
      'Una rutina de sueño constante puede suavizar notablemente los bajones de ánimo al final de la fase lútea.';

  @override
  String get insightUnknown2 =>
      'Registrar solo tres ciclos suele bastar para que emerja tu propio patrón.';

  @override
  String get insightUnknown3 =>
      'Los ciclos son personales — comparar el tuyo con el de una amiga rara vez dice algo útil.';

  @override
  String get insightUnknown4 =>
      'El estrés, los viajes y las enfermedades pueden desplazar la ovulación — un periodo \"tardío\" a menudo solo significa ovulación tardía.';

  @override
  String get settingsThemeLabel => 'Tema';

  @override
  String get settingsThemeSystem => 'Sistema';

  @override
  String get settingsThemeLight => 'Claro';

  @override
  String get settingsThemeDark => 'Oscuro';

  @override
  String get settingsMascotLabel => 'Mascota acompañante';

  @override
  String get mascotDroplet => 'Gotita';

  @override
  String get mascotFlower => 'Flor';

  @override
  String get mascotMoon => 'Luna';

  @override
  String get mascotNone => 'Ninguna';

  @override
  String homeWindowCountdown(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: 'La ventana prevista empieza en unos $days días',
      one: 'La ventana prevista empieza en un día',
    );
    return '$_temp0';
  }

  @override
  String homeOvulationCountdown(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: 'Ovulación estimada en unos $days días',
      one: 'Ovulación estimada en un día',
    );
    return '$_temp0';
  }

  @override
  String get homeQuickLogTitle => '¿Cómo se siente tu cuerpo hoy?';

  @override
  String get actionSave => 'Guardar';

  @override
  String get insightsTrackerHubTitle => 'Tus registros';

  @override
  String get trackerHistoryEmpty => 'Aún no hay registros en este rango';

  @override
  String get rangeFilter1m => '1 mes';

  @override
  String get rangeFilter3m => '3 meses';

  @override
  String get rangeFilter6m => '6 meses';

  @override
  String get dayLogOvulationTestLabel => 'Test de ovulación';

  @override
  String get ovulationTestNegative => 'Negativo';

  @override
  String get ovulationTestPositive => 'Positivo';

  @override
  String get settingsOvulationTestToggle => 'Test de ovulación';

  @override
  String get settingsRemindersOvulationLabel => 'Aviso de ventana fértil';

  @override
  String get reminderOvulationTitle => 'Se acerca la ventana fértil estimada';

  @override
  String get reminderOvulationBody =>
      'Según tus ciclos registrados, tu ventana fértil estimada podría empezar pronto.';

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
  String get assistantTyping => 'Vera está escribiendo…';

  @override
  String get premiumTitle => 'Vera Premium';

  @override
  String get premiumHeadline => 'Vera Premium';

  @override
  String get premiumSubhead =>
      'Todas las funciones de seguimiento siguen siendo gratuitas para siempre: tu historial nunca queda bloqueado. Premium añade tus propios registros, estadísticas más profundas, tus propios recordatorios y estilos extra, y quita los anuncios.';

  @override
  String get premiumBenefitNoAds => 'Sin anuncios en ninguna parte de la app';

  @override
  String get premiumBenefitSupport =>
      'Apoya una app independiente que prioriza la privacidad';

  @override
  String get premiumMonthly => 'Mensual';

  @override
  String get premiumYearly => 'Anual';

  @override
  String get premiumYearlyNote => 'Se cobra una vez al año';

  @override
  String get premiumSubscribeCta => 'Continuar';

  @override
  String get premiumRestore => 'Restaurar compra';

  @override
  String get premiumCancelNote =>
      'Cancela cuando quieras desde tu cuenta de la tienda. Sin cuentas atrás ni presión — si no es el momento, la versión gratuita sigue funcionando igual.';

  @override
  String get premiumActiveBadge => 'Premium está activo';

  @override
  String get premiumDevToggle => 'Simular Premium (desarrollo)';

  @override
  String get settingsPremiumEntry => 'Vera Premium';

  @override
  String get adTestNotice => 'Anuncio de prueba — aún no es real';

  @override
  String get settingsPregnancyModeLabel => 'Modo embarazo';

  @override
  String get pregnancyLmpLabel => 'Primer día de la última regla';

  @override
  String pregnancyWeekLabel(int weeks, int days) {
    return 'Semana $weeks, día $days';
  }

  @override
  String get pregnancyDueDateLabel => 'Fecha probable de parto';

  @override
  String pregnancyDaysLeft(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: 'Faltan unos $days días',
      one: 'Falta un día',
    );
    return '$_temp0';
  }

  @override
  String pregnancyTrimesterLabel(int n) {
    return 'Trimestre $n';
  }

  @override
  String get pregnancyDisclaimer =>
      'Las fechas se estiman desde tu última regla con la regla estándar de 280 días. Una ecografía da una fecha más precisa y una ovulación tardía desplaza estos números — esto es información, no atención médica.';

  @override
  String get pregnancyNoteUnder5 =>
      'La mayoría de las personas aún no nota nada — como la edad gestacional se cuenta desde tu última regla, las dos primeras semanas son en realidad anteriores a la concepción.';

  @override
  String get pregnancyNoteUnder9 =>
      'Las náuseas, la sensibilidad en los senos y la fatiga son frecuentes en estas semanas. Un buen momento para concertar una primera cita.';

  @override
  String get pregnancyNoteUnder13 =>
      'Se acerca el final del primer trimestre; en muchas personas las náuseas empiezan a aliviarse por estas fechas.';

  @override
  String get pregnancyNoteUnder20 =>
      'La energía suele volver en esta etapa. Los primeros movimientos pueden sentirse en cualquier momento entre las semanas 16 y 22.';

  @override
  String get pregnancyNoteUnder28 =>
      'Los movimientos se vuelven más definidos y empiezan a formar un patrón. El dolor de espalda y la acidez son frecuentes en esta etapa.';

  @override
  String get pregnancyNoteUnder34 =>
      'Estás en el tercer trimestre. La falta de aire, la micción frecuente y las contracciones de Braxton-Hicks son frecuentes.';

  @override
  String get pregnancyNoteUnder38 =>
      'El bebé se prepara para el nacimiento. Un buen momento para la bolsa del hospital y un plan de parto.';

  @override
  String get pregnancyNoteTerm =>
      'Estás a término — el parto puede producirse en cualquier momento entre las semanas 37 y 42; la semana 40 es un promedio, no una fecha límite.';

  @override
  String get pregnancyWeeklyNoteTitle => 'Esta semana';

  @override
  String get pregnancyNeedsLmp =>
      'Añade el primer día de tu última regla para empezar.';

  @override
  String get pregnancyOutOfRange =>
      'Esa fecha es de hace más de 42 semanas — actualízala o desactiva el modo embarazo.';

  @override
  String get partnerShareTitle => 'Compartir un resumen con tu pareja';

  @override
  String get partnerShareBody =>
      'Crea un resumen de texto corto — tu fase actual y ventana estimada — que envías tú por la app que quieras. No hay sincronización en vivo ni cuenta de pareja: nada se comparte salvo que lo envíes.';

  @override
  String get partnerShareCta => 'Crear resumen';

  @override
  String get partnerSummaryHeader => 'Resumen de ciclo de Vera';

  @override
  String get settingsHomeThemeLabel => 'Fondo de inicio';

  @override
  String get homeThemeWheat => 'Trigo';

  @override
  String get homeThemeSky => 'Cielo';

  @override
  String get homeThemeField => 'Campo';

  @override
  String get homeThemeBlossom => 'Flor';

  @override
  String get homeThemePlain => 'Liso';

  @override
  String get backupNudgeTitle => 'Guarda una copia de tus datos';

  @override
  String get backupNudgeBody =>
      'Todo vive solo en este teléfono. Si se pierde, se rompe o se restablece, tu historial se va con él — una copia cifrada lleva un momento y solo tú puedes abrirla.';

  @override
  String get backupNudgeCta => 'Hacer copia ahora';

  @override
  String get backupNudgeDismiss => 'Más tarde';

  @override
  String backupLastDone(String date) {
    return 'Última copia: $date';
  }

  @override
  String get backupNever => 'Aún sin copia';

  @override
  String get settingsRemindersBackupLabel => 'Recordarme hacer copia';

  @override
  String get reminderBackupTitle => 'Hora de hacer copia de Vera';

  @override
  String get reminderBackupBody =>
      'Tu historial solo existe en este teléfono. Una copia cifrada rápida lo mantiene a salvo.';

  @override
  String get notificationChannelPeriodStart => 'Próximo periodo';

  @override
  String get notificationChannelPeriodEnd => 'Aviso de fin de periodo';

  @override
  String get notificationChannelMedication => 'Medicación';

  @override
  String get notificationChannelWater => 'Agua';

  @override
  String get notificationChannelAppointment => 'Cita';

  @override
  String get notificationChannelOvulation => 'Ventana fértil';

  @override
  String get notificationChannelBackup => 'Recordatorio de copia de seguridad';

  @override
  String get calendarDayDetailTitle => 'Este día';

  @override
  String get calendarDayNothingLogged => 'Aún no hay registros para este día';

  @override
  String get calendarDayOpenLog => 'Abrir registro del día';

  @override
  String get cycleHistoryTitle => 'Ciclos anteriores';

  @override
  String get cycleHistoryEmpty =>
      'Registra un par de periodos y tu historial aparecerá aquí.';

  @override
  String get cycleHistoryOngoing => 'En curso';

  @override
  String cycleHistoryLength(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: 'Ciclo de $days días',
      one: 'Ciclo de un día',
    );
    return '$_temp0';
  }

  @override
  String cycleHistoryPeriodLength(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: 'El periodo duró $days días',
      one: 'El periodo duró 1 día',
    );
    return '$_temp0';
  }

  @override
  String cycleHistoryVsAverage(String diff) {
    return '$diff respecto a tu media';
  }

  @override
  String get insightsCycleHistoryEntry => 'Ciclos anteriores';

  @override
  String get homeEmptyTitle => 'Empecemos por tu último periodo';

  @override
  String get homeEmptyBody =>
      'Toca el botón de arriba el día que empiece tu periodo. Tras dos ciclos completos Vera podrá estimar — hasta entonces no fingirá saberlo.';

  @override
  String get homeEmptyBackdate => 'Ya empezó antes';

  @override
  String get settingsAdPrivacyEntry => 'Opciones de privacidad de anuncios';

  @override
  String a11yCycleRing(int day, int length) {
    return 'Día $day de un ciclo de unos $length';
  }

  @override
  String a11yChartSummary(int count, String min, String max) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Gráfico con $count registros, de $min a $max',
      one: 'Gráfico con $count registro, de $min a $max',
    );
    return '$_temp0';
  }

  @override
  String a11yPhaseBar(int day, int length) {
    return 'Progreso del ciclo: día $day de unos $length';
  }

  @override
  String a11yFrequencyItem(String label, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count veces',
      one: '$count vez',
    );
    return '$label: $_temp0';
  }

  @override
  String get importTitle => 'Importar de otra app';

  @override
  String get importBody =>
      'Exporta tu historial de tu app anterior en CSV y elige el archivo aquí. Solo se importan fechas y flujo — los términos de síntomas y ánimo difieren entre apps y Vera no adivinará lo que querías decir.';

  @override
  String get importPickFile => 'Elegir archivo CSV';

  @override
  String importPreview(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Se encontraron $count días de historial',
      one: 'Se encontró $count día de historial',
    );
    return '$_temp0';
  }

  @override
  String importSkipped(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'No se pudieron leer $count filas y quedarán fuera',
      one: 'No se pudo leer $count fila y quedará fuera',
    );
    return '$_temp0';
  }

  @override
  String get importConfirm => 'Añadir a mi historial';

  @override
  String get importMergeNote =>
      'Los días importados se combinan. Los días que ya registraste en Vera se mantienen igual.';

  @override
  String importDone(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Se importaron $count días',
      one: 'Se importó $count día',
    );
    return '$_temp0';
  }

  @override
  String get importErrorEmpty => 'Ese archivo parece vacío.';

  @override
  String get importErrorNoDate =>
      'No se encontró una columna de fecha en ese archivo.';

  @override
  String get settingsImportEntry => 'Importar de otra app';

  @override
  String get settingsHealthSyncLabel =>
      'Sincronizar con Apple Health / Health Connect';

  @override
  String get settingsHealthSyncBody =>
      'Escribe solo el flujo, el peso y la temperatura basal en la app de salud de tu teléfono. Síntomas, ánimo y notas se quedan en Vera. No se lee nada de vuelta.';

  @override
  String healthSyncBackfilled(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Se enviaron $count días a tu app de salud',
      one: 'Se envió $count día a tu app de salud',
    );
    return '$_temp0';
  }

  @override
  String get healthSyncDenied =>
      'No se concedió el permiso, así que la sincronización sigue desactivada.';

  @override
  String get settingsDiagnosticsEntry => 'Diagnóstico';

  @override
  String get diagnosticsBody =>
      'Si la app falla, los detalles técnicos se registran aquí — solo en este dispositivo. No se envía nada salvo que tú lo decidas, y puedes leer antes exactamente qué enviarías.';

  @override
  String get diagnosticsEmpty =>
      'Sin registros — no se han detectado problemas.';

  @override
  String get diagnosticsShare => 'Enviar al desarrollador';

  @override
  String get diagnosticsClear => 'Borrar';

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
  String get calendarJumpTitle => 'Ir a un mes';

  @override
  String get calendarJumpYearLabel => 'Año';

  @override
  String get settingsAdPrivacyUnavailable =>
      'En tu región no se ofrecen opciones de personalización de anuncios — aquí los anuncios ya no son personalizados.';

  @override
  String get settingsGroupAppearance => 'Apariencia';

  @override
  String get settingsGroupTracking => 'Preferencias de seguimiento';

  @override
  String get dayLogCustomTagsLabel => 'Mis propios registros';

  @override
  String get customTagAddButton => 'Añadir registro';

  @override
  String get customTagDialogTitle => 'Nuevo registro';

  @override
  String get customTagDialogHint => 'p. ej. migraña, gimnasio, insomnio';

  @override
  String get customTagManageEntry => 'Gestionar mis registros';

  @override
  String get customTagRenameTitle => 'Renombrar registro';

  @override
  String get customTagDeleteTitle => '¿Eliminar este registro?';

  @override
  String get customTagDeleteBody =>
      'Se quitará de todos los días en que lo usaste. El resto de tus datos se mantiene igual.';

  @override
  String get customTagEmpty => 'Aún no tienes registros propios.';

  @override
  String get premiumLockedTitle => 'Función Premium';

  @override
  String get premiumLockedAction => 'Ver Premium';

  @override
  String get premiumBenefitCustomTrackers =>
      'Registra lo que quieras, con tus palabras';

  @override
  String get premiumBenefitAdvancedInsights =>
      'Estadísticas avanzadas: qué suele pasar y cuándo';

  @override
  String get premiumBenefitPersonalisation => 'Fondos y compañeros adicionales';

  @override
  String get premiumBenefitAdvancedReminders =>
      'Recordatorios a tu propio ritmo';

  @override
  String get advancedInsightsTitle => 'Estadísticas avanzadas';

  @override
  String get advancedInsightsEntry => 'Estadísticas avanzadas';

  @override
  String get advancedInsightsNotEnough =>
      'Registra tres ciclos completos y tus patrones aparecerán aquí. Con menos, cualquier \"patrón\" sería solo casualidad.';

  @override
  String get advancedInsightsPatternsTitle => 'Cuándo suele aparecer cada cosa';

  @override
  String advancedInsightsPatternLine(String label, String segment) {
    return '$label — sobre todo $segment';
  }

  @override
  String advancedInsightsPatternDetail(int count, int day) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count días registrados, alrededor del día $day de tu ciclo',
      one: '$count día registrado, alrededor del día $day de tu ciclo',
    );
    return '$_temp0';
  }

  @override
  String advancedInsightsNoPattern(String label) {
    return '$label — todavía sin un momento claro';
  }

  @override
  String get advancedInsightsTrendTitle => 'Duración del ciclo con el tiempo';

  @override
  String advancedInsightsDriftLonger(String days, String cycles) {
    return 'Comparando tus primeros $cycles ciclos con los últimos $cycles, los recientes duran unos $days días más.';
  }

  @override
  String advancedInsightsDriftShorter(String days, String cycles) {
    return 'Comparando tus primeros $cycles ciclos con los últimos $cycles, los recientes duran unos $days días menos.';
  }

  @override
  String advancedInsightsDriftStable(String cycles) {
    return 'Comparando tus primeros $cycles ciclos con los últimos $cycles, la duración de tu ciclo se ha mantenido más o menos igual.';
  }

  @override
  String get advancedInsightsDriftNotEnough =>
      'Cuando tengas seis ciclos completos, podremos comparar los primeros con los más recientes para ver si la duración de tu ciclo está cambiando.';

  @override
  String get advancedInsightsMoodTitle => 'Ánimo por parte del ciclo';

  @override
  String get advancedInsightsDisclaimer =>
      'Esto es solo un recuento de lo que registraste. No es un diagnóstico, y un patrón aquí no es una causa.';

  @override
  String get segmentPeriod => 'durante tu periodo';

  @override
  String get segmentAfterPeriod => 'después de tu periodo';

  @override
  String get segmentMidCycle => 'a mitad del ciclo';

  @override
  String get segmentBeforePeriod => 'antes de tu periodo';

  @override
  String get customRemindersEntry => 'Mis propios recordatorios';

  @override
  String get customRemindersTitle => 'Mis propios recordatorios';

  @override
  String get customRemindersEmpty => 'Aún no tienes recordatorios propios.';

  @override
  String get customRemindersAdd => 'Añadir recordatorio';

  @override
  String get customReminderLabelHint => 'p. ej. tomar la pastilla, beber agua';

  @override
  String get customReminderLockScreenNote =>
      'El texto aparece en tu pantalla de bloqueo, así que escríbelo tan privado como quieras.';

  @override
  String get customReminderDelete => 'Eliminar recordatorio';

  @override
  String get homeThemeDusk => 'Atardecer';

  @override
  String get homeThemeMeadow => 'Pradera';

  @override
  String get homeThemePetal => 'Pétalo';

  @override
  String get homeThemeBloom => 'Floración';

  @override
  String get mascotStar => 'Estrella';

  @override
  String get mascotLeaf => 'Hoja';

  @override
  String get tipDetailWhatsHappening => 'Qué está pasando en tu cuerpo';

  @override
  String get tipDetailDisclaimer =>
      'Esto es información general, no un consejo médico personal. Cada cuerpo responde distinto, y cómo te sientes realmente importa más que cualquier sugerencia de aquí. Si algo te preocupa, habla con un profesional de la salud.';

  @override
  String get phaseExplainerMenstrual =>
      'Estás sangrando porque el endometrio se desprende. El estrógeno y la progesterona están en su punto más bajo del ciclo, por eso muchas personas se sienten más cansadas y más hacia adentro los primeros días. Los cólicos vienen de las contracciones del útero. El sangrado también te cuesta hierro, lo que explica parte del agotamiento.';

  @override
  String get phaseExplainerFollicular =>
      'Cuando termina el sangrado, el estrógeno vuelve a subir. La mayoría nota que la energía, el ánimo y la resistencia se recuperan. En los ovarios maduran folículos; el cuerpo se prepara para la siguiente ovulación.';

  @override
  String get phaseExplainerFertile =>
      'El estrógeno se acerca a su pico y se espera la ovulación en estos días. El moco cervical suele volverse transparente y resbaladizo, algunas personas notan más deseo y otras una punzada breve de un lado. La energía suele estar en su punto más alto del ciclo.';

  @override
  String get phaseExplainerLuteal =>
      'Tras la ovulación sube la progesterona y luego cae con fuerza al acercarse la regla. Esa caída puede desencadenar síntomas premenstruales: hinchazón, sensibilidad en los senos, cambios de apetito, sueño interrumpido y altibajos de ánimo. Tu temperatura corporal se mantiene algo más alta.';

  @override
  String get phaseExplainerUnknown =>
      'Todavía no hay suficientes registros para decir en qué fase estás. Vera prefiere decirlo antes que inventar una fase. Cuando registres unos cuantos ciclos, esta sección se llenará con tus propios datos; hasta entonces, las sugerencias de abajo sirven en cualquier momento.';

  @override
  String get tipFitnessDetailMenstrual =>
      'El entrenamiento duro no le sienta bien a la mayoría los primeros días, y no es un problema de disciplina: tu energía realmente está más baja. Caminar, estirar suave, yoga restaurativo y respiración mejoran la circulación y pueden aliviar los cólicos. Si te sientes bien, no hay motivo para evitar sesiones intensas: sangrar no es razón para dejar de moverte. Un apunte práctico: en los días de sangrado abundante, las sesiones largas y exigentes pueden aumentar el cansancio, así que ajústalo según cómo te sientas.';

  @override
  String get tipFitnessDetailFollicular =>
      'Con el estrógeno subiendo, la mayoría se siente más fuerte y resistente; suele ser el mejor tramo del ciclo para empezar algo nuevo, subir peso o apretar el ritmo. La recuperación muscular también es relativamente eficiente aquí. Aun así, progresa de forma gradual: tener energía no significa riesgo cero de lesión.';

  @override
  String get tipFitnessDetailFertile =>
      'La energía y la motivación suelen estar en su punto máximo, así que las sesiones exigentes encajan bien. En algunas personas las articulaciones están algo más laxas alrededor de la ovulación: en deportes con cambios bruscos de dirección conviene calentar más. Una punzada breve en un lado del abdomen es común, pero si es fuerte o dura, descansa y consúltalo.';

  @override
  String get tipFitnessDetailLuteal =>
      'Al acercarse la regla la energía puede bajar, el pulso subir para el mismo esfuerzo y la recuperación alargarse. Es una oscilación esperable, no un retroceso. Las sesiones moderadas, una versión algo más ligera de tu trabajo de fuerza y caminar suelen ser más sostenibles aquí. Con hinchazón y sensibilidad en los senos, un buen sujetador deportivo y un calentamiento más largo marcan la diferencia.';

  @override
  String get tipFitnessDetailUnknown =>
      'Aunque no sepamos tu fase, moverse ayuda siempre: actividad moderada repartida en la mayoría de los días de la semana rinde más que sesiones muy intensas ocasionales. Ajusta según cómo te sientas: en los días de cansancio, caminar también cuenta. Cuando registres unos ciclos verás aquí sugerencias específicas de tu fase.';

  @override
  String get tipNutritionDetailMenstrual =>
      'El sangrado te cuesta hierro; la carne roja, las lentejas, los garbanzos, las verduras de hoja oscura y la melaza ayudan a reponerlo. El hierro vegetal se absorbe bastante mejor junto con vitamina C: exprimir limón sobre un plato de lentejas es la versión más práctica de eso. El té y el café con la comida reducen la absorción de hierro, así que basta con dejar una hora entre medias. Beber suficiente agua puede aliviar el cansancio y el dolor de cabeza del sangrado.';

  @override
  String get tipNutritionDetailFollicular =>
      'Con la energía recuperándose, el cuerpo está en modo reconstrucción: suficiente proteína, cereales integrales y verduras lo apoyan. También tiene sentido seguir reponiendo las reservas de hierro tras el sangrado. No saltarse comidas suele ser más fácil en esta fase, y te deja mejor preparada para los altibajos de apetito de la siguiente.';

  @override
  String get tipNutritionDetailFertile =>
      'Aquí no hace falta ninguna dieta especial; comer equilibrado y beber suficiente agua es lo que más ayuda. Algunas personas se sienten hinchadas, algo normalmente hormonal y pasajero. Si estás planeando un embarazo, es un buen momento para preguntar por el ácido fólico a un profesional, pero esa es una conversación con quien te atiende, no un consejo que deba dar una app.';

  @override
  String get tipNutritionDetailLuteal =>
      'Que aumente el apetito y las ganas de dulce cuando sube la progesterona es muy común; es un cambio hormonal, no un problema de fuerza de voluntad. Añadir proteína y fibra a las comidas mantiene el azúcar en sangre más estable y suaviza el antojo. Menos sal y más agua pueden aliviar la hinchazón. Los alimentos ricos en magnesio (almendras, nueces, hojas verdes oscuras, chocolate negro) reducen los cólicos y la tensión en algunas personas. Bajar la cafeína ayuda con el sueño interrumpido de esta fase.';

  @override
  String get tipNutritionDetailUnknown =>
      'Sea cual sea la fase, ayudan las mismas cosas: comidas regulares, suficiente proteína, muchas verduras, suficiente agua y alimentos ricos en hierro. Como el sangrado cuesta hierro, basta con prestar un poco más de atención esos días. Cuando registres unos ciclos verás aquí sugerencias específicas de tu fase.';
}
