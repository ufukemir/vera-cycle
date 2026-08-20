import 'package:cycle_app/l10n/app_localizations.dart';
import 'package:cycle_app/models/day_log.dart';
import 'package:cycle_app/models/enums.dart';
import 'package:cycle_app/screens/assistant/assistant_screen.dart';
import 'package:cycle_app/screens/calendar/calendar_screen.dart';
import 'package:cycle_app/screens/insights/cycle_history_screen.dart';
import 'package:cycle_app/screens/insights/insights_screen.dart';
import 'package:cycle_app/screens/premium/premium_screen.dart';
import 'package:cycle_app/screens/settings/settings_screen.dart';
import 'package:cycle_app/screens/day_log/day_log_screen.dart';
import 'package:cycle_app/screens/home/home_screen.dart';
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

/// Arabic and Urdu ship as supported locales, so every screen has to
/// survive right-to-left layout. Hand-positioned widgets (the hero's
/// mascot, the phase bar's today marker, chart painters) are the risky
/// ones — they use raw left/right offsets that don't mirror themselves.
///
/// These render in `ar` and assert the tree builds without overflow, then
/// capture goldens so the mirrored layout can be eyeballed.
Future<Widget> _wrap(Widget child, {required Locale locale}) async {
  SharedPreferences.setMockInitialValues({'onboarding_complete': true});
  final prefs = await AppPreferences.load();
  final controller = CycleController(repository: InMemoryDayLogRepository());
  for (final start in [-56, -28]) {
    for (var i = 0; i < 5; i++) {
      await controller.upsertDay(DayLog(
        date: addDays(today(), start + i),
        flow: FlowIntensity.medium,
        symptoms: const {Symptom.cramps},
      ));
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
      locale: locale,
      home: child,
    ),
  );
}

void main() {
  testWidgets('home lays out in Arabic (RTL) without overflow',
      (tester) async {
    await tester.pumpWidget(
        await _wrap(const HomeScreen(), locale: const Locale('ar')));
    for (var i = 0; i < 6; i++) {
      await tester.pump(const Duration(milliseconds: 200));
    }

    expect(tester.takeException(), isNull);
    expect(Directionality.of(tester.element(find.byType(HomeScreen))),
        TextDirection.rtl);

    await expectLater(
      find.byType(MaterialApp),
      matchesGoldenFile('goldens/rtl_home_ar.png'),
    );
  });

  testWidgets('day log lays out in Arabic (RTL) without overflow',
      (tester) async {
    await tester.pumpWidget(await _wrap(DayLogScreen(date: today()),
        locale: const Locale('ar')));
    await tester.pump(const Duration(milliseconds: 300));

    expect(tester.takeException(), isNull);

    await expectLater(
      find.byType(MaterialApp),
      matchesGoldenFile('goldens/rtl_daylog_ar.png'),
    );
  });

  testWidgets('the painted phase bar exposes a label to screen readers',
      (tester) async {
    final handle = tester.ensureSemantics();
    await tester.pumpWidget(
        await _wrap(const HomeScreen(), locale: const Locale('en')));
    for (var i = 0; i < 6; i++) {
      await tester.pump(const Duration(milliseconds: 200));
    }

    // The phase bar is painted, so without this label a screen-reader user
    // gets nothing from it at all.
    //
    // The ring used to be asserted here too. It is gone from Home: it drew
    // the same cycle-day number the hero already states, at twice the size,
    // directly beneath it. The number is still exposed — as the hero's own
    // text, which needs no Semantics wrapper because it is real text.
    expect(find.bySemanticsLabel(RegExp(r'Cycle progress: day \d+')),
        findsOneWidget);
    handle.dispose();
  });

  testWidgets('the chat mirrors: assistant at start, user at end',
      (tester) async {
    // The bubbles were pinned with Alignment.centerLeft/centerRight, so in
    // Arabic the whole conversation read as an LTR chat dropped into an RTL
    // screen — the assistant on the right, the user on the left, each on
    // the other's side. Nothing overflowed, so no existing test noticed.
    await tester.pumpWidget(
        await _wrap(const AssistantScreen(), locale: const Locale('ar')));
    for (var i = 0; i < 6; i++) {
      await tester.pump(const Duration(milliseconds: 200));
    }

    await tester.enterText(find.byType(TextField), 'مرحبا');
    await tester.testTextInput.receiveAction(TextInputAction.send);
    for (var i = 0; i < 8; i++) {
      await tester.pump(const Duration(milliseconds: 200));
    }

    expect(tester.takeException(), isNull);

    // Both bubbles must use directional alignment. A physical
    // Alignment.centerLeft/Right here is the bug returning.
    final aligns = tester
        .widgetList<Align>(find.descendant(
          of: find.byType(ListView),
          matching: find.byType(Align),
        ))
        .where((a) =>
            a.alignment == Alignment.centerLeft ||
            a.alignment == Alignment.centerRight);
    expect(aligns, isEmpty,
        reason: 'chat bubbles must align with AlignmentDirectional so they '
            'mirror in RTL');
  });

  testWidgets('every screen builds in Arabic without overflow',
      (tester) async {
    // The previous RTL coverage was Home and Day Log only; the four real
    // RTL bugs found in review were all on screens no test ever opened.
    final screens = <String, Widget Function()>{
      'assistant': () => const AssistantScreen(),
      'calendar': () => const CalendarScreen(),
      'insights': () => const InsightsScreen(),
      'settings': () => const SettingsScreen(),
      'premium': () => const PremiumScreen(),
      'cycle history': () => const CycleHistoryScreen(),
    };

    for (final entry in screens.entries) {
      await tester.pumpWidget(
          await _wrap(entry.value(), locale: const Locale('ar')));
      for (var i = 0; i < 6; i++) {
        await tester.pump(const Duration(milliseconds: 200));
      }
      expect(tester.takeException(), isNull,
          reason: '${entry.key} threw in Arabic');
    }
  });

  testWidgets('home survives a large text scale', (tester) async {
    tester.platformDispatcher.textScaleFactorTestValue = 1.6;
    addTearDown(tester.platformDispatcher.clearTextScaleFactorTestValue);

    await tester.pumpWidget(
        await _wrap(const HomeScreen(), locale: const Locale('tr')));
    for (var i = 0; i < 6; i++) {
      await tester.pump(const Duration(milliseconds: 200));
    }

    expect(tester.takeException(), isNull);
  });
}
