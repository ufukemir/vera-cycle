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

          // The disclaimer sits below the fold, so it only exists after a
          // scroll — and it must never be the thing that got dropped.
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
