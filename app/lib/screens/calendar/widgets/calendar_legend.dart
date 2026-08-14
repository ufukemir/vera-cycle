import 'package:flutter/material.dart';

import '../../../l10n/app_localizations.dart';

class CalendarLegend extends StatelessWidget {
  const CalendarLegend({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final scheme = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Wrap(
        spacing: 16,
        runSpacing: 8,
        children: [
          _entry(_filledDot(scheme.primary), l10n.calendarLegendActual),
          _entry(_ringDot(scheme.primary), l10n.calendarLegendPredicted),
          _entry(_ringDot(scheme.tertiary), l10n.calendarLegendFertile),
          _entry(_filledDot(scheme.tertiary, size: 8), l10n.calendarLegendOvulation),
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

  Widget _entry(Widget dot, String label) => Row(
        mainAxisSize: MainAxisSize.min,
        children: [dot, const SizedBox(width: 6), Text(label)],
      );
}
