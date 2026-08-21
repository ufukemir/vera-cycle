import 'package:cycle_app/l10n/app_localizations.dart';
import 'package:cycle_app/models/day_log.dart';
import 'package:cycle_app/models/enums.dart';
import 'package:cycle_app/screens/assistant/assistant_screen.dart';
import 'package:cycle_app/screens/calendar/calendar_screen.dart';
import 'package:cycle_app/screens/backup/cloud_backup_screen.dart';
import 'package:cycle_app/screens/day_log/day_log_screen.dart';
import 'package:cycle_app/screens/export/export_screen.dart';
import 'package:cycle_app/screens/export/import_screen.dart';
import 'package:cycle_app/screens/home/home_screen.dart';
import 'package:cycle_app/screens/insights/cycle_history_screen.dart';
import 'package:cycle_app/screens/insights/advanced_insights_screen.dart';
import 'package:cycle_app/screens/insights/insights_screen.dart';
import 'package:cycle_app/screens/insights/tracker_history_screen.dart';
import 'package:cycle_app/screens/partner/partner_mode_screen.dart';
import 'package:cycle_app/screens/premium/premium_screen.dart';
import 'package:cycle_app/screens/settings/custom_reminders_screen.dart';
import 'package:cycle_app/screens/settings/custom_tags_screen.dart';
import 'package:cycle_app/screens/settings/prediction_settings_screen.dart';
import 'package:cycle_app/screens/settings/reminder_detail_screen.dart';
import 'package:cycle_app/screens/settings/reminders_screen.dart';
import 'package:cycle_app/screens/settings/privacy_screen.dart';
import 'package:cycle_app/screens/settings/rate_app_screen.dart';
import 'package:cycle_app/screens/settings/settings_screen.dart';
import 'package:cycle_app/services/in_memory_day_log_repository.dart';
import 'package:cycle_app/services/pin_vault.dart';
import 'package:cycle_app/services/reminder_service.dart';
import 'package:cycle_app/state/app_preferences.dart';
import 'package:cycle_app/state/assistant_conversation.dart';
import 'package:cycle_app/state/cycle_controller.dart';
import 'package:cycle_app/state/cloud_backup_controller.dart';
import 'package:cycle_app/state/partner_controller.dart';
import 'package:cycle_app/theme/app_theme.dart';
import 'package:cycle_app/util/day.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Opens every screen in the app and asserts it renders.
///
/// This exists because the day-log screen once shipped throwing
/// "BoxConstraints forces an infinite height" the instant it opened, in
/// every locale, and nothing caught it: no test opened that screen, and
/// manual passes on the simulator happened to never navigate there.
///
/// A crash reporter would have told us *after* users hit it. This tells
/// us before they do, which is the better place to find out.
Future<Widget> _app(Widget screen, {bool withData = true}) async {
  SharedPreferences.setMockInitialValues({'onboarding_complete': true});
  final prefs = await AppPreferences.load();
  final controller = CycleController(repository: InMemoryDayLogRepository());

  if (withData) {
    for (final start in [-56, -28]) {
      for (var i = 0; i < 5; i++) {
        await controller.upsertDay(
          DayLog(
            date: addDays(today(), start + i),
            flow: FlowIntensity.medium,
            symptoms: const {Symptom.cramps},
            mood: Mood.calm,
            weightKg: 62.0,
            basalTempC: 36.6,
            sleepMinutes: 450,
            waterIntakeMl: 1500,
          ),
        );
      }
    }
  }

  return MultiProvider(
    providers: [
      ChangeNotifierProvider<AppPreferences>.value(value: prefs),
      ChangeNotifierProvider<AssistantConversation>(
        create: (_) => AssistantConversation(),
      ),
      ChangeNotifierProvider<CycleController>.value(value: controller),
      Provider<PinVault>(create: (_) => PinVault()),
      Provider<ReminderService>(create: (_) => ReminderService()),
      // PartnerInviteCard (Home) and PartnerModeScreen (Settings) both read
      // this unconditionally on build — Firebase.initializeApp() fails
      // harmlessly under `flutter test` (see
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
      home: screen,
    ),
  );
}

/// Drags every scrollable on screen to its end.
///
/// The default 800x600 test surface is taller than a short screen's content
/// but shorter than most of this app's — a sliver item below the fold is
/// never built, so it's never laid out, so a crash living in it never fires.
/// That is exactly how the premium screen's plan-card row — `stretch` inside
/// a sliver's unbounded height, "BoxConstraints forces an infinite height" —
/// passed this suite while crashing on a real device the first time someone
/// scrolled to it.
Future<void> _scrollToEnd(WidgetTester tester) async {
  // Only the outermost scrollable — enough to reach a crash living below
  // the fold in the screen's primary CustomScrollView/ListView, which is
  // what this guards against. A screen's nested scrollables (a horizontal
  // chart, a sub-list) are a separate concern from "does this screen's own
  // content lay out."
  if (find.byType(Scrollable).evaluate().isEmpty) return;
  final finder = find.byType(Scrollable).first;
  for (var i = 0; i < 20; i++) {
    if (finder.evaluate().isEmpty) break;
    await tester.drag(finder, const Offset(0, -600), warnIfMissed: false);
    await tester.pump(const Duration(milliseconds: 100));
  }
  await tester.pump(const Duration(milliseconds: 200));
}

/// Narrows the test surface to the narrowest phone this app still targets.
///
/// The default 800x600 surface is wider than any real phone, so a 3-column
/// grid tile gets far more horizontal room in a test than on a device — a
/// two-line label that wraps and overflows its tile at 390pt sat on one
/// line and passed clean at 800px. Same bug class as [_scrollToEnd]: the
/// fixed default surface hides a real-device-only failure, just on the
/// width axis instead of the scroll axis.
void _useNarrowPhone(WidgetTester tester) {
  const size = Size(390, 844);
  tester.view.physicalSize = size * tester.view.devicePixelRatio;
  addTearDown(tester.view.resetPhysicalSize);
}

void main() {
  final screens = <String, Widget Function()>{
    'home': () => const HomeScreen(),
    'calendar': () => const CalendarScreen(),
    'assistant': () => const AssistantScreen(),
    'insights': () => const InsightsScreen(),
    'settings': () => const SettingsScreen(),
    'day log': () => DayLogScreen(date: today()),
    'export': () => const ExportScreen(),
    'import': () => const ImportScreen(),
    'premium': () => const PremiumScreen(),
    'privacy': () => const PrivacyScreen(),
    'rate app': () => const RateAppScreen(),
    'prediction settings': () => const PredictionSettingsScreen(),
    'reminders': () => const RemindersScreen(),
    'reminder detail': () => ReminderDetailScreen(
      title: 'Test',
      enabled: true,
      onEnabledChanged: (_) {},
      time: const TimeOfDay(hour: 9, minute: 0),
      onTimeChanged: (_) {},
      message: null,
      onMessageChanged: (_) {},
      defaultMessage: 'Default message',
      offsetDays: 2,
      onOffsetDaysChanged: (_) {},
    ),
    'cycle history': () => const CycleHistoryScreen(),
    'advanced insights': () => const AdvancedInsightsScreen(),
    'custom reminders': () => const CustomRemindersScreen(),
    'custom tags': () => const CustomTagsScreen(),
    // Firebase.initializeApp() fails harmlessly under `flutter test` (see
    // PartnerService.ensureInitialized), so this exercises the
    // "not configured" state — the real sign-in states need a live
    // Firebase project and aren't reachable from this suite.
    'partner mode': () => const PartnerModeScreen(),
    // Same reasoning as 'partner mode' — exercises the "not configured"
    // state via FirebaseBootstrap.
    'cloud backup': () => const CloudBackupScreen(),
  };

  for (final entry in screens.entries) {
    testWidgets('${entry.key} renders with data', (tester) async {
      _useNarrowPhone(tester);
      await tester.pumpWidget(await _app(entry.value()));
      for (var i = 0; i < 5; i++) {
        await tester.pump(const Duration(milliseconds: 200));
      }
      await _scrollToEnd(tester);
      expect(tester.takeException(), isNull);
    });
  }

  // Empty state is its own risk: dashes, nulls and "no data yet" paths
  // take different branches than the populated ones above.
  for (final key in [
    'home',
    'insights',
    'day log',
    'cycle history',
    'advanced insights',
    'custom tags',
    'custom reminders',
    'settings',
    'premium',
  ]) {
    testWidgets('$key renders with no data at all', (tester) async {
      _useNarrowPhone(tester);
      await tester.pumpWidget(await _app(screens[key]!(), withData: false));
      for (var i = 0; i < 5; i++) {
        await tester.pump(const Duration(milliseconds: 200));
      }
      await _scrollToEnd(tester);
      expect(tester.takeException(), isNull);
    });
  }

  for (final type in TrackerType.values) {
    testWidgets('tracker history: ${type.name} renders', (tester) async {
      _useNarrowPhone(tester);
      await tester.pumpWidget(await _app(TrackerHistoryScreen(type: type)));
      for (var i = 0; i < 5; i++) {
        await tester.pump(const Duration(milliseconds: 200));
      }
      await _scrollToEnd(tester);
      expect(tester.takeException(), isNull);
    });
  }
}
