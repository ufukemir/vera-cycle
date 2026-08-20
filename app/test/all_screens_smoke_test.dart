import 'package:cycle_app/l10n/app_localizations.dart';
import 'package:cycle_app/models/day_log.dart';
import 'package:cycle_app/models/enums.dart';
import 'package:cycle_app/screens/assistant/assistant_screen.dart';
import 'package:cycle_app/screens/calendar/calendar_screen.dart';
import 'package:cycle_app/screens/day_log/day_log_screen.dart';
import 'package:cycle_app/screens/export/export_screen.dart';
import 'package:cycle_app/screens/export/import_screen.dart';
import 'package:cycle_app/screens/home/home_screen.dart';
import 'package:cycle_app/screens/insights/cycle_history_screen.dart';
import 'package:cycle_app/screens/insights/advanced_insights_screen.dart';
import 'package:cycle_app/screens/insights/insights_screen.dart';
import 'package:cycle_app/screens/insights/tracker_history_screen.dart';
import 'package:cycle_app/screens/premium/premium_screen.dart';
import 'package:cycle_app/screens/settings/custom_reminders_screen.dart';
import 'package:cycle_app/screens/settings/custom_tags_screen.dart';
import 'package:cycle_app/screens/settings/prediction_settings_screen.dart';
import 'package:cycle_app/screens/settings/privacy_screen.dart';
import 'package:cycle_app/screens/settings/settings_screen.dart';
import 'package:cycle_app/services/in_memory_day_log_repository.dart';
import 'package:cycle_app/services/pin_vault.dart';
import 'package:cycle_app/services/reminder_service.dart';
import 'package:cycle_app/state/app_preferences.dart';
import 'package:cycle_app/state/assistant_conversation.dart';
import 'package:cycle_app/state/cycle_controller.dart';
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
        await controller.upsertDay(DayLog(
          date: addDays(today(), start + i),
          flow: FlowIntensity.medium,
          symptoms: const {Symptom.cramps},
          mood: Mood.calm,
          weightKg: 62.0,
          basalTempC: 36.6,
          sleepMinutes: 450,
          waterIntakeMl: 1500,
        ));
      }
    }
  }

  return MultiProvider(
    providers: [
      ChangeNotifierProvider<AppPreferences>.value(value: prefs),
      ChangeNotifierProvider<AssistantConversation>(
          create: (_) => AssistantConversation()),
      ChangeNotifierProvider<CycleController>.value(value: controller),
      Provider<PinVault>(create: (_) => PinVault()),
      Provider<ReminderService>(create: (_) => ReminderService()),
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
    'prediction settings': () => const PredictionSettingsScreen(),
    'cycle history': () => const CycleHistoryScreen(),
    'advanced insights': () => const AdvancedInsightsScreen(),
    'custom reminders': () => const CustomRemindersScreen(),
    'custom tags': () => const CustomTagsScreen(),
  };

  for (final entry in screens.entries) {
    testWidgets('${entry.key} renders with data', (tester) async {
      await tester.pumpWidget(await _app(entry.value()));
      for (var i = 0; i < 5; i++) {
        await tester.pump(const Duration(milliseconds: 200));
      }
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
      await tester.pumpWidget(await _app(screens[key]!(), withData: false));
      for (var i = 0; i < 5; i++) {
        await tester.pump(const Duration(milliseconds: 200));
      }
      expect(tester.takeException(), isNull);
    });
  }

  for (final type in TrackerType.values) {
    testWidgets('tracker history: ${type.name} renders', (tester) async {
      await tester.pumpWidget(await _app(TrackerHistoryScreen(type: type)));
      for (var i = 0; i < 5; i++) {
        await tester.pump(const Duration(milliseconds: 200));
      }
      expect(tester.takeException(), isNull);
    });
  }
}
