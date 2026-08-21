import 'package:flutter/material.dart';

import '../../../l10n/app_localizations.dart';

class CalendarLegend extends StatelessWidget {
  const CalendarLegend({
    super.key,
    required this.hasPredictedWindow,
    required this.hasFertileEstimate,
  });

  /// Whether the prediction engine currently has a period-window estimate
  /// to paint (needs at least two complete cycles).
  final bool hasPredictedWindow;

  /// Whether it currently has a fertile-window / ovulation estimate.
  final bool hasFertileEstimate;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final scheme = Theme.of(context).colorScheme;

    // This used to list all four entries unconditionally, so with fewer
    // than two logged cycles — where the prediction engine deliberately
    // stays silent rather than guess — the legend still promised three
    // markers the grid never drew. Someone with one cycle logged saw
    // "Predicted window" and "Ovulation" in the key and went looking for
    // rings that could not exist yet. The engine's own honesty about
    // insufficient data was being undercut by its own legend.
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Wrap(
        spacing: 16,
        runSpacing: 8,
        children: [
          _entry(_filledDot(scheme.primary), l10n.calendarLegendActual),
          if (hasPredictedWindow)
            _entry(_ringDot(scheme.primary), l10n.calendarLegendPredicted),
          if (hasFertileEstimate) ...[
            _entry(_ringDot(scheme.tertiary), l10n.calendarLegendFertile),
            _entry(
              _filledDot(scheme.tertiary, size: 8),
              l10n.calendarLegendOvulation,
            ),
          ],
        ],
      ),
    );
  }

  Widget _filledDot(Color color, {double size = 14}) => Container(
    width: size,
    height: size,
    decoration: BoxDecoration(shape: BoxShape.circle, color: color),
  );

  Widget _ringDot(Color color) => Container(
    width: 14,
    height: 14,
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      border: Border.all(color: color, width: 2),
    ),
  );

  /// One legend entry: a dot and its label.
  ///
  /// [Flexible] on the label because these sit inside a [Wrap] whose runs
  /// are still bounded by the screen width — a single long label ("Geschätztes
  /// fruchtbares Fenster") overflowed the row by 34px on a 360dp screen
  /// rather than wrapping. `mainAxisSize.min` keeps the entry tight when it
  /// does fit.
  Widget _entry(Widget dot, String label) => Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      dot,
      const SizedBox(width: 6),
      Flexible(child: Text(label)),
    ],
  );
}
