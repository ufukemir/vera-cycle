import 'package:cycle_app/l10n/app_localizations.dart';
import 'package:cycle_app/models/day_log.dart';
import 'package:cycle_app/models/enums.dart';
import 'package:cycle_app/screens/home/home_screen.dart';
import 'package:cycle_app/services/in_memory_day_log_repository.dart';
import 'package:cycle_app/state/app_preferences.dart';
import 'package:cycle_app/state/cycle_controller.dart';
import 'package:cycle_app/state/cloud_backup_controller.dart';
import 'package:cycle_app/state/partner_controller.dart';
import 'package:cycle_app/theme/app_theme.dart';
import 'package:cycle_app/util/day.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Renders Home with two completed cycles seeded, so the scenic hero shows
/// a real countdown rather than the empty state. Exists mainly as a visual
/// check on the photo-hero layout that can't be captured from a running
/// simulator once the app lock is set.
void main() {
  testWidgets('home renders the scenic hero with seeded cycles', (
    tester,
  ) async {
    SharedPreferences.setMockInitialValues({'onboarding_complete': true});
    final prefs = await AppPreferences.load();

    final repo = InMemoryDayLogRepository();
    final controller = CycleController(repository: repo);
    // Two complete cycles ending recently: enough for a real prediction.
    for (final start in [-56, -28]) {
      for (var i = 0; i < 5; i++) {
        await controller.upsertDay(
          DayLog(date: addDays(today(), start + i), flow: FlowIntensity.medium),
        );
      }
    }

    await tester.pumpWidget(
      MultiProvider(
        providers: [
          ChangeNotifierProvider<AppPreferences>.value(value: prefs),
          ChangeNotifierProvider<CycleController>.value(value: controller),
          // PartnerInviteCard reads this unconditionally on build (to decide
          // whether to render itself at all) — Firebase.initializeApp()
          // fails harmlessly under `flutter test` (see
          // PartnerService.ensureInitialized), so this resolves to
          // "unconfigured" without any platform-channel mocking.
          ChangeNotifierProvider<PartnerController>(
            create: (_) => PartnerController()..init(),
          ),
          ChangeNotifierProvider<CloudBackupController>(
            create: (_) => CloudBackupController()..init(),
          ),
        ],
        child: MaterialApp(
          theme: buildAppTheme(),
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          locale: const Locale('tr'),
          home: const HomeScreen(),
        ),
      ),
    );
    for (var i = 0; i < 6; i++) {
      await tester.pump(const Duration(milliseconds: 200));
    }

    await expectLater(
      find.byType(MaterialApp),
      matchesGoldenFile('goldens/home_scenic_hero.png'),
    );
  });
}
