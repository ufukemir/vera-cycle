import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'l10n/app_localizations.dart';
import 'screens/root/app_root.dart';
import 'services/day_log_repository.dart';
import 'services/file_day_log_repository.dart';
import 'services/pin_vault.dart';
import 'services/prediction_engine.dart';
import 'services/reminder_service.dart';
import 'state/app_lock_controller.dart';
import 'state/app_preferences.dart';
import 'state/cycle_controller.dart';
import 'theme/app_theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final preferences = await AppPreferences.load();
  runApp(MainApp(preferences: preferences));
}

/// Wires the provider tree once at startup. Kept as a single explicit
/// constructor call per provider (no service locator) so every dependency an
/// app-wide controller needs is visible right here.
///
/// [repository] defaults to the real encrypted [FileDayLogRepository], but is
/// injectable so widget tests can pass [InMemoryDayLogRepository] instead —
/// the real one touches `path_provider`/Keychain platform channels that don't
/// exist under `flutter test`.
class MainApp extends StatelessWidget {
  const MainApp({super.key, required this.preferences, this.repository});

  final AppPreferences preferences;
  final DayLogRepository? repository;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AppPreferences>.value(value: preferences),
        Provider<PinVault>(create: (_) => PinVault()),
        Provider<ReminderService>(create: (_) => ReminderService()),
        ChangeNotifierProvider<CycleController>(
          create: (_) => CycleController(
            repository: repository ?? FileDayLogRepository(),
            predictionEngine:
                PredictionEngine(lutealPhaseDays: preferences.lutealPhaseDays),
          )..load(),
        ),
        ChangeNotifierProvider<AppLockController>(
          create: (ctx) => AppLockController(pinVault: ctx.read<PinVault>()),
        ),
      ],
      child: Consumer<AppPreferences>(
        builder: (context, prefs, _) {
          return MaterialApp(
            onGenerateTitle: (context) => AppLocalizations.of(context)!.appTitle,
            theme: buildAppTheme(),
            darkTheme: buildDarkAppTheme(),
            themeMode: prefs.themeMode,
            locale: prefs.locale,
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            home: const AppRoot(),
          );
        },
      ),
    );
  }
}
