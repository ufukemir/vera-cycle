import 'package:cycle_app/main.dart';
import 'package:cycle_app/services/in_memory_day_log_repository.dart';
import 'package:cycle_app/state/app_preferences.dart';
import 'package:cycle_app/screens/home/widgets/vera_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<AppPreferences> _emptyPreferences() async {
  SharedPreferences.setMockInitialValues({});
  return AppPreferences.load();
}

void main() {
  testWidgets('a fresh install lands on onboarding, not the home shell', (
    tester,
  ) async {
    final preferences = await _emptyPreferences();

    await tester.pumpWidget(
      MainApp(preferences: preferences, repository: InMemoryDayLogRepository()),
    );
    // First frame is the splash screen while CycleController.load() runs.
    await tester.pumpAndSettle();

    expect(find.byType(MaterialApp), findsOneWidget);
    // Onboarding's first screen shows a Continue button and no bottom nav —
    // proves AppRoot did not skip straight to the home shell.
    expect(find.byType(VeraBottomBar), findsNothing);
  });

  testWidgets('onboardingComplete=true with no PIN set still does not crash '
      'into the lock screen', (tester) async {
    // Regression guard for AppRoot's branching order: an inconsistent state
    // (onboarding done, but somehow no PIN) must not throw — it should just
    // show the lock screen, whose PIN entry will simply never match.
    SharedPreferences.setMockInitialValues({'onboarding_complete': true});
    final preferences = await AppPreferences.load();

    await tester.pumpWidget(
      MainApp(preferences: preferences, repository: InMemoryDayLogRepository()),
    );
    await tester.pumpAndSettle();

    expect(find.byType(MaterialApp), findsOneWidget);
  });
}
