import 'package:cycle_app/l10n/app_localizations.dart';
import 'package:cycle_app/models/day_log.dart';
import 'package:cycle_app/models/enums.dart';
import 'package:cycle_app/screens/day_log/day_log_screen.dart';
import 'package:cycle_app/screens/home/home_screen.dart';
import 'package:cycle_app/services/in_memory_day_log_repository.dart';
import 'package:cycle_app/state/app_preferences.dart';
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
      ChangeNotifierProvider<CycleController>.value(value: controller),
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
