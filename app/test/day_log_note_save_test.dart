import 'package:cycle_app/l10n/app_localizations.dart';
import 'package:cycle_app/screens/day_log/day_log_screen.dart';
import 'package:cycle_app/screens/day_log/widgets/note_field.dart';
import 'package:cycle_app/services/in_memory_day_log_repository.dart';
import 'package:cycle_app/state/app_preferences.dart';
import 'package:cycle_app/state/cycle_controller.dart';
import 'package:cycle_app/theme/app_theme.dart';
import 'package:cycle_app/util/day.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// The day log has no Save button by design, which puts two obligations on
/// it: a note must survive every way of leaving the screen, and the user
/// must be able to *see* that it saved. Both are tested here because both
/// fail silently — a lost note looks like nothing happened, and so does a
/// missing confirmation.
Future<(Widget, CycleController)> _app() async {
  SharedPreferences.setMockInitialValues({'onboarding_complete': true});
  final prefs = await AppPreferences.load();
  final controller = CycleController(repository: InMemoryDayLogRepository());

  return (
    MultiProvider(
      providers: [
        ChangeNotifierProvider<AppPreferences>.value(value: prefs),
        ChangeNotifierProvider<CycleController>.value(value: controller),
      ],
      child: MaterialApp(
        theme: buildAppTheme(),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        locale: const Locale('tr'),
        // A route below the log so popping it has somewhere to land.
        home: Builder(
          builder: (context) => Scaffold(
            body: Center(
              child: ElevatedButton(
                onPressed: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => DayLogScreen(date: today()),
                  ),
                ),
                child: const Text('open'),
              ),
            ),
          ),
        ),
      ),
    ),
    controller,
  );
}

Future<void> _openLog(WidgetTester tester) async {
  await tester.tap(find.text('open'));
  await tester.pump();
  await tester.pump(const Duration(milliseconds: 400));
}

/// The note sits well down a lazily-built ListView, so it doesn't exist in
/// the tree until scrolled into view.
Future<void> _scrollToNote(WidgetTester tester) async {
  await tester.scrollUntilVisible(
    find.byType(NoteField),
    300,
    scrollable: find.byType(Scrollable).first,
  );
  await tester.pump();
}

void main() {
  testWidgets('a note saves on its own and says so', (tester) async {
    final (app, controller) = await _app();
    await tester.pumpWidget(app);
    await _openLog(tester);

    await _scrollToNote(tester);
    await tester.enterText(find.byType(NoteField),'başım ağrıyor');
    await tester.pump(const Duration(milliseconds: 500));

    expect(controller.logFor(today())?.note, 'başım ağrıyor');
    expect(find.text('Kaydedildi'), findsOneWidget);
  });

  testWidgets('the confirmation fades back out', (tester) async {
    final (app, controller) = await _app();
    await tester.pumpWidget(app);
    await _openLog(tester);

    await _scrollToNote(tester);
    await tester.enterText(find.byType(NoteField),'not');
    await tester.pump(const Duration(milliseconds: 500));
    expect(
      tester
          .widget<AnimatedOpacity>(find.ancestor(
            of: find.text('Kaydedildi'),
            matching: find.byType(AnimatedOpacity),
          ))
          .opacity,
      1,
    );

    await tester.pump(const Duration(seconds: 3));
    expect(
      tester
          .widget<AnimatedOpacity>(find.ancestor(
            of: find.text('Kaydedildi'),
            matching: find.byType(AnimatedOpacity),
          ))
          .opacity,
      0,
    );
    expect(controller.logFor(today())?.note, 'not');
  });

  testWidgets('leaving inside the debounce window still saves the note',
      (tester) async {
    final (app, controller) = await _app();
    await tester.pumpWidget(app);
    await _openLog(tester);

    await _scrollToNote(tester);
    await tester.enterText(find.byType(NoteField),'yarıda kaldı');
    // Deliberately shorter than the 400ms debounce: this is the case that
    // used to lose the last keystrokes.
    await tester.pump(const Duration(milliseconds: 50));
    await tester.tap(find.text('Bitti'));
    await tester.pumpAndSettle();

    expect(find.byType(DayLogScreen), findsNothing);
    expect(controller.logFor(today())?.note, 'yarıda kaldı');
  });

  testWidgets('the back button saves the note too', (tester) async {
    final (app, controller) = await _app();
    await tester.pumpWidget(app);
    await _openLog(tester);

    await _scrollToNote(tester);
    await tester.enterText(find.byType(NoteField),'geri tuşu');
    await tester.pump(const Duration(milliseconds: 50));
    await tester.tap(find.byType(BackButton));
    await tester.pumpAndSettle();

    expect(controller.logFor(today())?.note, 'geri tuşu');
  });
}
