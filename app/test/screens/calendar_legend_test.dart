import 'package:cycle_app/l10n/app_localizations.dart';
import 'package:cycle_app/screens/calendar/widgets/calendar_legend.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

/// The legend used to list all four markers unconditionally. With fewer
/// than two logged cycles the prediction engine deliberately has nothing
/// to paint for three of them — but the legend still promised "Predicted
/// window" and "Ovulation", so someone with one cycle logged went looking
/// for rings on the grid that could not exist yet. The engine's own
/// honesty about insufficient data was being undercut by its own legend.
Future<void> _pump(
  WidgetTester tester, {
  required bool hasPredictedWindow,
  required bool hasFertileEstimate,
}) {
  return tester.pumpWidget(
    MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: Scaffold(
        body: CalendarLegend(
          hasPredictedWindow: hasPredictedWindow,
          hasFertileEstimate: hasFertileEstimate,
        ),
      ),
    ),
  );
}

void main() {
  testWidgets('with no estimates yet, only the logged-period entry shows', (
    tester,
  ) async {
    await _pump(tester, hasPredictedWindow: false, hasFertileEstimate: false);
    final l10n = await AppLocalizations.delegate.load(const Locale('en'));

    expect(find.text(l10n.calendarLegendActual), findsOneWidget);
    expect(
      find.text(l10n.calendarLegendPredicted),
      findsNothing,
      reason: 'promises a ring the grid has nothing to draw',
    );
    expect(find.text(l10n.calendarLegendFertile), findsNothing);
    expect(find.text(l10n.calendarLegendOvulation), findsNothing);
  });

  testWidgets(
    'a period prediction without a fertile estimate shows only that',
    (tester) async {
      // The two estimates come from different thresholds in the prediction
      // engine and can become available at different times, so the legend
      // has to reflect them independently rather than as one bundle.
      await _pump(tester, hasPredictedWindow: true, hasFertileEstimate: false);
      final l10n = await AppLocalizations.delegate.load(const Locale('en'));

      expect(find.text(l10n.calendarLegendPredicted), findsOneWidget);
      expect(find.text(l10n.calendarLegendFertile), findsNothing);
      expect(find.text(l10n.calendarLegendOvulation), findsNothing);
    },
  );

  testWidgets('once both estimates exist, every entry is shown', (
    tester,
  ) async {
    await _pump(tester, hasPredictedWindow: true, hasFertileEstimate: true);
    final l10n = await AppLocalizations.delegate.load(const Locale('en'));

    expect(find.text(l10n.calendarLegendActual), findsOneWidget);
    expect(find.text(l10n.calendarLegendPredicted), findsOneWidget);
    expect(find.text(l10n.calendarLegendFertile), findsOneWidget);
    expect(find.text(l10n.calendarLegendOvulation), findsOneWidget);
  });
}
