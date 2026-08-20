import 'package:cycle_app/l10n/app_localizations.dart';
import 'package:cycle_app/models/enums.dart';
import 'package:cycle_app/screens/insights/phase_tip_detail_screen.dart';
import 'package:cycle_app/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

/// The detail screen is pure content: five phases × two categories × seven
/// languages. A missing translation or an unhandled phase would render a
/// blank block rather than crash, which is exactly the kind of failure a
/// manual pass walks straight past.
Widget _app(Widget child, Locale locale) => MaterialApp(
      theme: buildAppTheme(),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: locale,
      home: child,
    );

void main() {
  for (final locale in AppLocalizations.supportedLocales) {
    for (final phase in CyclePhase.values) {
      for (final category in PhaseTipCategory.values) {
        testWidgets(
            '${locale.languageCode}: ${phase.name}/${category.name} renders '
            'real text', (tester) async {
          // A tall surface, because ListView only builds what fits. The
          // explainer alone now fills a phone-sized viewport, so on the
          // default 800px surface the detail block below it was never
          // constructed and this test started failing for a content edit
          // rather than a content problem.
          tester.view.physicalSize = const Size(1200, 4000);
          tester.view.devicePixelRatio = 1;
          addTearDown(tester.view.reset);

          await tester.pumpWidget(_app(
            PhaseTipDetailScreen(
              phase: phase,
              category: category,
              photoAsset: 'assets/photos/pier_stretch.jpg',
            ),
            locale,
          ));
          await tester.pump();

          expect(tester.takeException(), isNull);

          // Every Text on the page must carry actual content — an empty or
          // whitespace-only string is the shape a missing ARB key takes.
          final texts = tester.widgetList<Text>(find.byType(Text));
          expect(texts, isNotEmpty);
          for (final text in texts) {
            expect(text.data?.trim().isNotEmpty ?? true, isTrue);
          }

          // The explainer and the detail must be substantial prose, not
          // placeholders.
          final long = texts.where((t) => (t.data?.length ?? 0) > 80);
          expect(long.length, greaterThanOrEqualTo(2),
              reason: 'expected explainer and detail prose');

          // Scrolling must not drop anything either — the disclaimer lives
          // at the bottom and is the block most likely to be lost.
          await tester.drag(find.byType(ListView), const Offset(0, -600));
          await tester.pump();
          expect(
            tester
                .widgetList<Text>(find.byType(Text))
                .where((t) => (t.data?.length ?? 0) > 80)
                .length,
            greaterThanOrEqualTo(2),
          );
          expect(tester.takeException(), isNull);
        });
      }
    }
  }
}
