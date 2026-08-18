import 'package:cycle_app/state/app_preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// The week used to start on Monday for everyone.
///
/// That is wrong for a large share of the app's languages — en-US, ja, ko,
/// pt-BR and hi all start on Sunday, and ar/fa/ur on Saturday. The user had
/// to notice and fix it by hand, in a calendar that is the second tab.
void main() {
  test('no stored preference means "follow the locale"', () async {
    SharedPreferences.setMockInitialValues({});
    final prefs = await AppPreferences.load();
    expect(prefs.weekStartWeekday, isNull,
        reason: 'an unset preference must not masquerade as a Monday choice');
  });

  test('an explicit choice is stored and survives a reload', () async {
    SharedPreferences.setMockInitialValues({});
    final prefs = await AppPreferences.load();

    await prefs.setWeekStartWeekday(DateTime.sunday);
    expect(prefs.weekStartWeekday, DateTime.sunday);

    // Saturday is the whole point of widening this: ar, fa and ur start
    // the week there, and the old boolean could not express it.
    await prefs.setWeekStartWeekday(DateTime.saturday);
    expect(prefs.weekStartWeekday, DateTime.saturday);

    // Clearing goes back to following the locale rather than to a default.
    await prefs.setWeekStartWeekday(null);
    expect(prefs.weekStartWeekday, isNull);
  });

  group('migration from the old boolean key', () {
    test('a stored Monday=true reads as Monday', () async {
      SharedPreferences.setMockInitialValues({'week_start_monday': true});
      final prefs = await AppPreferences.load();
      expect(prefs.weekStartWeekday, DateTime.monday);
    });

    test('a stored Monday=false reads as Sunday', () async {
      SharedPreferences.setMockInitialValues({'week_start_monday': false});
      final prefs = await AppPreferences.load();
      expect(prefs.weekStartWeekday, DateTime.sunday);
    });

    test('writing the new key retires the old one so they cannot disagree',
        () async {
      SharedPreferences.setMockInitialValues({'week_start_monday': true});
      final prefs = await AppPreferences.load();

      await prefs.setWeekStartWeekday(DateTime.saturday);
      expect(prefs.weekStartWeekday, DateTime.saturday,
          reason: 'the stale boolean must not win over the new value');

      await prefs.setWeekStartWeekday(null);
      expect(prefs.weekStartWeekday, isNull,
          reason: 'clearing must clear both keys, not fall back to the old '
              'boolean');
    });
  });

  testWidgets('MaterialLocalizations disagrees across locales', (tester) async {
    // The premise the fix rests on: Flutter already knows the right answer
    // per locale, and it is not the same answer everywhere. If this ever
    // stopped being true, following the locale would be pointless.
    final firstDays = <String, int>{};
    for (final code in ['en', 'tr', 'ar', 'de', 'es', 'fr', 'id']) {
      late BuildContext captured;
      await tester.pumpWidget(MaterialApp(
        locale: Locale(code),
        localizationsDelegates: GlobalMaterialLocalizations.delegates,
        supportedLocales: [Locale(code)],
        home: Builder(builder: (context) {
          captured = context;
          return const SizedBox();
        }),
      ));
      firstDays[code] =
          MaterialLocalizations.of(captured).firstDayOfWeekIndex;
    }

    expect(firstDays.values.toSet().length, greaterThan(1),
        reason: 'locales must not all agree, or this setting is moot');
  });
}
