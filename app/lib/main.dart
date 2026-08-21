import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart';

import 'l10n/app_localizations.dart';
import 'screens/root/app_root.dart';
import 'services/day_log_repository.dart';
import 'services/file_day_log_repository.dart';
import 'services/pin_vault.dart';
import 'services/crash_log.dart';
import 'services/health_sync_service.dart';
import 'services/prediction_engine.dart';
import 'services/reminder_service.dart';
import 'state/app_lock_controller.dart';
import 'state/app_preferences.dart';
import 'state/cloud_backup_controller.dart';
import 'state/cycle_controller.dart';
import 'state/partner_controller.dart';
import 'theme/app_theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Local-only: records crashes to a file the user can read and choose to
  // send. See CrashLog for why there's no third-party reporter.
  CrashLog.instance.install();
  // Ad SDK init is fire-and-forget: a slow or failed init must never delay
  // or block the app, which works entirely offline apart from ads.
  unawaited(MobileAds.instance.initialize());
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
            predictionEngine: PredictionEngine(
              lutealPhaseDays: preferences.lutealPhaseDays,
            ),
            healthSync: preferences.healthSyncEnabled
                ? HealthSyncService()
                : null,
          )..load(),
        ),
        ChangeNotifierProvider<AppLockController>(
          create: (ctx) => AppLockController(pinVault: ctx.read<PinVault>()),
        ),
        // Firebase init is attempted lazily inside PartnerController.init()
        // and swallows failure (see PartnerService.ensureInitialized) — a
        // checkout with no GoogleService-Info.plist/google-services.json
        // yet must still boot the rest of the app normally, Partner Modu
        // just reports itself unconfigured.
        ChangeNotifierProvider<PartnerController>(
          create: (_) => PartnerController()..init(),
        ),
        // Same lazy-init/swallow-failure reasoning as PartnerController —
        // see CloudBackupService's doc comment.
        ChangeNotifierProvider<CloudBackupController>(
          create: (_) => CloudBackupController()..init(),
        ),
      ],
      child: Consumer<AppPreferences>(
        builder: (context, prefs, _) {
          return MaterialApp(
            onGenerateTitle: (context) =>
                AppLocalizations.of(context)!.appTitle,
            debugShowCheckedModeBanner: false,
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
