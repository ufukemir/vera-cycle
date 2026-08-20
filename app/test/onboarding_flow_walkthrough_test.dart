import 'package:cycle_app/l10n/app_localizations_en.dart';
import 'package:cycle_app/main.dart';
import 'package:cycle_app/services/in_memory_day_log_repository.dart';
import 'package:cycle_app/state/app_preferences.dart';
import 'package:cycle_app/screens/home/widgets/vera_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Stands in for the real Keychain/Keystore-backed platform channel
/// `flutter_secure_storage` uses — unmocked, it throws
/// `MissingPluginException` under `flutter test`, which [PinVault.setPin]
/// (awaited, uncaught inside PinPad's fire-and-forget `onSubmit`) silently
/// swallows into the test framework's zone error handler, leaving the app
/// stuck on the PIN confirm screen with no visible failure — hence this
/// fake, so the PIN-setup step of onboarding can actually be exercised.
void _mockSecureStorageChannel() {
  final store = <String, String>{};
  const channel =
      MethodChannel('plugins.it_nomads.com/flutter_secure_storage');
  TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
      .setMockMethodCallHandler(channel, (call) async {
    final args = (call.arguments as Map?)?.cast<String, dynamic>();
    switch (call.method) {
      case 'write':
        store[args!['key'] as String] = args['value'] as String;
        return null;
      case 'read':
        return store[args!['key'] as String];
      case 'containsKey':
        return store.containsKey(args!['key'] as String);
      case 'delete':
        store.remove(args!['key'] as String);
        return null;
      case 'deleteAll':
        store.clear();
        return null;
      case 'readAll':
        return store;
      default:
        return null;
    }
  });
}

/// Same reasoning as [_mockSecureStorageChannel], for `local_auth`'s
/// channel: unmocked, `MethodChannel.invokeMethod` under `flutter test`
/// doesn't throw — it just never completes, hanging
/// `AppLockController.canUseBiometrics()`'s `await` forever with no
/// exception for its `on Object` catch to ever catch. Confirmed by an
/// isolated probe test before adding this.
void _mockLocalAuthChannel() {
  const channel = MethodChannel('plugins.flutter.io/local_auth');
  TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
      .setMockMethodCallHandler(channel, (call) async {
    switch (call.method) {
      case 'isDeviceSupported':
        return false;
      case 'getAvailableBiometrics':
        return <String>[];
      default:
        return null;
    }
  });
}

/// Walks a fresh install through every screen of the expanded onboarding
/// flow (goal → 3 cycle questions → 2 conversational questions →
/// notification priming → PIN setup → building-plan animation) and asserts
/// it lands cleanly on the home shell.
///
/// This exists because several of these steps (GoalStep,
/// ThreeChoiceQuestionStep, NotificationPrimingStep, BuildingPlanStep) were
/// only ever exercised by `flutter analyze`/first-frame widget tests before
/// this file — a real device build proves they compile, not that tapping
/// through them actually works end to end.
void main() {
  final l10n = AppLocalizationsEn();

  testWidgets('fresh install reaches the home shell via every new step',
      (tester) async {
    _mockSecureStorageChannel();
    _mockLocalAuthChannel();
    SharedPreferences.setMockInitialValues({});
    final preferences = await AppPreferences.load();

    await tester.pumpWidget(MainApp(
      preferences: preferences,
      repository: InMemoryDayLogRepository(),
    ));
    await tester.pumpAndSettle();

    // 1. Welcome/privacy.
    expect(find.text(l10n.onboardingPrivacyTitle), findsOneWidget);
    await expectLater(
      find.byType(MaterialApp),
      matchesGoldenFile('goldens/onboarding_01_welcome.png'),
    );
    await tester.tap(find.text(l10n.actionContinue));
    await tester.pumpAndSettle();

    // 2. Goal selection — a tap-to-advance card, not Skip/Continue.
    expect(find.text(l10n.onboardingGoalTitle), findsOneWidget);
    await expectLater(
      find.byType(MaterialApp),
      matchesGoldenFile('goldens/onboarding_02_goal.png'),
    );
    await tester.tap(find.text(l10n.goalTrackPeriod));
    await tester.pumpAndSettle();

    // 3-5. Last period / cycle length / period length — all skippable.
    expect(find.text(l10n.onboardingLastPeriodTitle), findsOneWidget);
    await tester.tap(find.text(l10n.commonIDontKnow));
    await tester.pumpAndSettle();

    expect(find.text(l10n.onboardingCycleLengthTitle), findsOneWidget);
    await tester.tap(find.text(l10n.commonIDontKnow));
    await tester.pumpAndSettle();

    expect(find.text(l10n.onboardingPeriodLengthTitle), findsOneWidget);
    await tester.tap(find.text(l10n.commonIDontKnow));
    await tester.pumpAndSettle();

    // 6-7. Regularity / cramps — conversational, discarded answers.
    expect(find.text(l10n.onboardingRegularityTitle), findsOneWidget);
    await tester.tap(find.text(l10n.commonNotSure));
    await tester.pumpAndSettle();

    expect(find.text(l10n.onboardingCrampsTitle), findsOneWidget);
    await tester.tap(find.text(l10n.commonNotSure));
    await tester.pumpAndSettle();

    // 8. Notification priming — decline, to avoid touching the (unmocked
    // under `flutter test`) notifications platform channel.
    expect(find.text(l10n.onboardingNotificationTitle), findsOneWidget);
    await tester.tap(find.text(l10n.onboardingNotificationNotNow));
    await tester.pumpAndSettle();

    // 9. Mandatory PIN setup — enter, then confirm.
    expect(find.text(l10n.pinSetupEnterPrompt), findsOneWidget);
    for (final digit in ['1', '2', '3', '4', '5', '6']) {
      await tester.tap(find.text(digit));
      await tester.pump();
    }
    await tester.pumpAndSettle();

    expect(find.text(l10n.pinSetupConfirmPrompt), findsOneWidget);
    for (final digit in ['1', '2', '3', '4', '5', '6']) {
      await tester.tap(find.text(digit));
      await tester.pump();
    }
    // With both platform channels mocked, canUseBiometrics() resolves to
    // false cleanly — the biometric-offer stage is skipped and onComplete
    // fires directly, straight into BuildingPlanStep's ~2.2s checklist.
    // Bounded pumps rather than pumpAndSettle: the home screen hosts an
    // endlessly-repeating mascot animation, so the tree never "settles".
    for (var i = 0; i < 14; i++) {
      await tester.pump(const Duration(milliseconds: 300));
    }

    // 10. Home shell.
    expect(find.byType(VeraBottomBar), findsOneWidget);
    await expectLater(
      find.byType(MaterialApp),
      matchesGoldenFile('goldens/onboarding_03_home.png'),
    );
  });
}
