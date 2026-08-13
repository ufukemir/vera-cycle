import 'package:flutter/material.dart';

import '../../../l10n/app_localizations.dart';
import '../../../models/enums.dart';

String _phaseLabel(AppLocalizations l10n, CyclePhase phase) {
  switch (phase) {
    case CyclePhase.menstrual:
      return l10n.homePhaseMenstrual;
    case CyclePhase.follicular:
      return l10n.homePhaseFollicular;
    case CyclePhase.fertileWindow:
      return l10n.homePhaseFertileWindow;
    case CyclePhase.luteal:
      return l10n.homePhaseLuteal;
    case CyclePhase.unknown:
      return l10n.homePhaseUnknown;
  }
}

/// Current cycle day + phase. Shows an honest empty state rather than a
/// fabricated "Day 1" when nothing has been logged yet.
class CycleDayBadge extends StatelessWidget {
  const CycleDayBadge({super.key, required this.cycleDay, required this.phase});

  final int? cycleDay;
  final CyclePhase phase;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);

    if (cycleDay == null) {
      return Text(l10n.homeNoCycleYet, style: theme.textTheme.titleMedium);
    }

    return Column(
      children: [
        Text(
          l10n.homeCycleDayLabel(cycleDay!),
          style: theme.textTheme.displaySmall,
        ),
        const SizedBox(height: 4),
        Text(_phaseLabel(l10n, phase), style: theme.textTheme.titleMedium),
      ],
    );
  }
}
