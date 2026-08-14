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
      'Tus datos permanecen solo en este dispositivo. No hay cuenta, ni nube, no se envía nada a ningún lado — la app ni siquiera tiene permiso para usar internet, y puedes comprobarlo tú misma en los ajustes de tu teléfono.';

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
  String insightsVariabilityLabel(String days) {
    return 'Varía en unos $days días';
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
      'Esta app no tiene servidor. Ni siquiera tiene permiso para usar internet — puedes comprobarlo tú misma en los ajustes de tu teléfono.';

  @override
  String get privacyScreenNoThirdParty =>
      'No hay analítica, ni informes de fallos, ni ningún tipo de SDK de terceros.';

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
}
