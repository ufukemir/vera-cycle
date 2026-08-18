import 'package:cycle_app/l10n/app_localizations.dart';
import 'package:cycle_app/models/custom_reminder.dart';
import 'package:cycle_app/models/day_log.dart';
import 'package:cycle_app/models/enums.dart';
import 'package:cycle_app/screens/day_log/day_log_screen.dart';
import 'package:cycle_app/services/in_memory_day_log_repository.dart';
import 'package:cycle_app/services/reminder_service.dart';
import 'package:cycle_app/state/app_preferences.dart';
import 'package:cycle_app/state/cycle_controller.dart';
import 'package:cycle_app/theme/app_theme.dart';
import 'package:cycle_app/widgets/premium_lock.dart';
import 'package:cycle_app/util/day.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Premium must add things, never take things away. These pin the line:
/// the paid features are locked when they should be, and the free tracking
/// surface is identical either way.
Future<(Widget, CycleController, AppPreferences)> _app({
  required bool premium,
  DayLog? log,
}) async {
  SharedPreferences.setMockInitialValues({
    'onboarding_complete': true,
    'premium_active': premium,
  });
  final prefs = await AppPreferences.load();
  final repository = InMemoryDayLogRepository();
  if (log != null) await repository.replaceAll([log]);
  final controller = CycleController(repository: repository);
  await controller.load();

  return (
    MultiProvider(
      providers: [
        ChangeNotifierProvider<AppPreferences>.value(value: prefs),
        ChangeNotifierProvider<CycleController>.value(value: controller),
        Provider<ReminderService>(create: (_) => ReminderService()),
      ],
      child: MaterialApp(
        theme: buildAppTheme(),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        locale: const Locale('tr'),
        home: DayLogScreen(date: today()),
      ),
    ),
    controller,
    prefs,
  );
}

Future<void> _settle(WidgetTester tester) async {
  for (var i = 0; i < 5; i++) {
    await tester.pump(const Duration(milliseconds: 200));
  }
}

void main() {
  testWidgets('custom trackers are locked without Premium', (tester) async {
    final (app, _, _) = await _app(premium: false);
    await tester.pumpWidget(app);
    await _settle(tester);

    await tester.scrollUntilVisible(find.text('Kendi takiplerim'), 300);
    expect(find.text('Premium\'a bak'), findsOneWidget);
    expect(find.text('Takip ekle'), findsNothing);
  });

  testWidgets('custom trackers are usable with Premium', (tester) async {
    final (app, _, _) = await _app(premium: true);
    await tester.pumpWidget(app);
    await _settle(tester);

    await tester.scrollUntilVisible(find.text('Kendi takiplerim'), 300);
    expect(find.text('Takip ekle'), findsOneWidget);
    expect(find.text('Premium\'a bak'), findsNothing);
  });

  // One test per state rather than a loop: pumping a second tree in the
  // same tester carries the first one's scroll offset over, which silently
  // hides widgets the second pass is looking for.
  for (final premium in [false, true]) {
    testWidgets('free tracking is present with premium=$premium',
        (tester) async {
      final (app, _, _) = await _app(premium: premium);
      await tester.pumpWidget(app);
      await _settle(tester);

      // Flow, symptoms and mood are the core of the app and are never gated.
      expect(find.text('Akış'), findsOneWidget);
      expect(find.text('Semptomlar'), findsOneWidget);

      await tester.scrollUntilVisible(find.text('Ruh hali'), 300);
      expect(find.text('Ruh hali'), findsOneWidget);
    });
  }

  // The assertion this replaces was `find.byType(PremiumLock), findsNothing`
  // with the reason "nothing above the note field is gated". It was
  // vacuous: CustomTagsSection *is* a PremiumLock and sits above the note
  // field, but the lazy ListView never built that far, so the expectation
  // passed in both premium states while proving nothing. Assert the actual
  // rule instead — the free fields are present and ungated.
  for (final premium in [false, true]) {
    testWidgets('no core tracking field sits behind a lock (premium=$premium)',
        (tester) async {
      final (app, _, _) = await _app(premium: premium);
      await tester.pumpWidget(app);
      await _settle(tester);

      for (final label in ['Akış', 'Semptomlar', 'Ruh hali']) {
        await tester.scrollUntilVisible(find.text(label), 300);
        expect(
          find.ancestor(
            of: find.text(label),
            matching: find.byType(PremiumLock),
          ),
          findsNothing,
          reason: '"$label" is core tracking and must never be gated',
        );
      }
    });
  }

  testWidgets('a lapsed subscription still shows tags already recorded',
      (tester) async {
    // Principle 6: Premium adds, it never takes away. Losing the ability to
    // ADD a tag is the deal; losing sight of what you already wrote is not.
    final (app, _, _) = await _app(
      premium: false,
      log: DayLog(date: today(), customTags: const {'migren'}),
    );
    await tester.pumpWidget(app);
    await _settle(tester);

    await tester.scrollUntilVisible(find.text('migren'), 300);
    expect(find.text('migren'), findsOneWidget,
        reason: 'the tag is the user\'s own record, not a Premium feature');
    expect(find.text('Takip ekle'), findsNothing,
        reason: 'adding is still the gated part');
  });

  test('a lapsed subscription falls back to a free background, and remembers',
      () async {
    // CLAUDE.md principle 6 and enums.dart both promised this; nothing
    // implemented it, so a lapsed user kept the paid background (and saw it
    // rendered as selected AND locked in the picker at the same time).
    SharedPreferences.setMockInitialValues({
      'onboarding_complete': true,
      'premium_active': true,
      'home_theme': HomeTheme.dusk.name,
      'mascot': Mascot.star.name,
    });
    final prefs = await AppPreferences.load();

    expect(prefs.homeTheme, HomeTheme.dusk);
    expect(prefs.mascot, Mascot.star);

    await prefs.setPremiumActive(false);

    expect(prefs.homeTheme, HomeTheme.wheat, reason: 'falls back to free');
    expect(prefs.mascot, Mascot.droplet);
    // The choice is remembered, not erased — resubscribing restores it.
    expect(prefs.selectedHomeTheme, HomeTheme.dusk);
    expect(prefs.selectedMascot, Mascot.star);

    await prefs.setPremiumActive(true);
    expect(prefs.homeTheme, HomeTheme.dusk);
    expect(prefs.mascot, Mascot.star);
  });

  test('erasing everything takes the user-written reminder labels with it',
      () async {
    SharedPreferences.setMockInitialValues({'premium_active': true});
    final prefs = await AppPreferences.load();
    await prefs.addCustomReminder(
      label: 'hapımı al',
      time: const TimeOfDay(hour: 9, minute: 0),
    );
    expect(prefs.customReminders, hasLength(1));

    await prefs.clearCustomReminders();

    expect(prefs.customReminders, isEmpty,
        reason: 'free text the user wrote about themselves must not survive '
            '"erase everything"');
  });

  test('custom tags round-trip through serialisation', () {
    final log = DayLog(
      date: today(),
      flow: FlowIntensity.medium,
      customTags: const {'migren', 'spor'},
    );
    final decoded = DayLog.fromJson(log.toJson());

    expect(decoded.customTags, {'migren', 'spor'});
    expect(decoded.isEmpty, isFalse);
  });

  test('a day holding only a custom tag is not treated as empty', () {
    expect(DayLog(date: today(), customTags: const {'spor'}).isEmpty, isFalse);
    expect(DayLog(date: today()).isEmpty, isTrue);
  });

  test('the tag list is derived from the logs, deduplicated and sorted',
      () async {
    final controller = CycleController(repository: InMemoryDayLogRepository());
    await controller.upsertDay(
      DayLog(date: addDays(today(), -2), customTags: const {'Spor', 'migren'}),
    );
    await controller.upsertDay(
      DayLog(date: addDays(today(), -1), customTags: const {'migren', 'ağrı'}),
    );

    expect(controller.customTags, ['ağrı', 'migren', 'Spor']);
  });

  test('deleting a tag removes it from every day that used it', () async {
    final controller = CycleController(repository: InMemoryDayLogRepository());
    await controller.upsertDay(
      DayLog(date: addDays(today(), -2), customTags: const {'migren', 'spor'}),
    );
    await controller.upsertDay(
      DayLog(date: addDays(today(), -1), customTags: const {'migren'}),
    );

    await controller.deleteCustomTag('migren');

    expect(controller.customTags, ['spor']);
    // The day that held only that tag becomes empty and is dropped, while
    // the day with another tag survives.
    expect(controller.logFor(addDays(today(), -1)), isNull);
    expect(controller.logFor(addDays(today(), -2))?.customTags, {'spor'});
  });

  test('renaming a tag rewrites it everywhere', () async {
    final controller = CycleController(repository: InMemoryDayLogRepository());
    await controller.upsertDay(
      DayLog(date: addDays(today(), -1), customTags: const {'migren'}),
    );

    await controller.renameCustomTag('migren', 'baş ağrısı');

    expect(controller.customTags, ['baş ağrısı']);
  });

  test('a malformed stored reminder is skipped, not fatal', () async {
    SharedPreferences.setMockInitialValues({
      'custom_reminders': ['not json', '{"id":1,"label":"","minuteOfDay":60}'],
    });
    final prefs = await AppPreferences.load();

    expect(prefs.customReminders, isEmpty);
  });

  test('custom reminder ids never collide with the fixed categories',
      () async {
    SharedPreferences.setMockInitialValues({});
    final prefs = await AppPreferences.load();

    final first = await prefs.addCustomReminder(
      label: 'hapımı al',
      time: const TimeOfDay(hour: 8, minute: 30),
    );
    final second = await prefs.addCustomReminder(
      label: 'su iç',
      time: const TimeOfDay(hour: 14, minute: 0),
    );

    final fixedIds =
        ReminderCategory.values.map((c) => c.notificationId).toSet();
    expect(fixedIds.contains(first.notificationId), isFalse);
    expect(fixedIds.contains(second.notificationId), isFalse);
    expect(first.notificationId, isNot(second.notificationId));
    expect(first.notificationId,
        greaterThanOrEqualTo(CustomReminder.notificationIdBase));
  });

  test('a deleted reminder does not hand its id to the next one', () async {
    SharedPreferences.setMockInitialValues({});
    final prefs = await AppPreferences.load();

    final first = await prefs.addCustomReminder(
      label: 'ilk',
      time: const TimeOfDay(hour: 8, minute: 0),
    );
    await prefs.removeCustomReminder(first.id);
    final second = await prefs.addCustomReminder(
      label: 'ikinci',
      time: const TimeOfDay(hour: 9, minute: 0),
    );

    expect(second.id, isNot(first.id));
  });
}
