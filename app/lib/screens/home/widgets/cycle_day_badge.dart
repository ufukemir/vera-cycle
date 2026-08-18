import 'package:flutter/material.dart';

import '../../../l10n/app_localizations.dart';
import '../../../l10n/enum_labels.dart';
import '../../../models/enums.dart';

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
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          l10n.homeCycleDayLabel(cycleDay!),
          style: theme.textTheme.displaySmall,
        ),
        const SizedBox(height: 4),
        Text(phaseLabel(l10n, phase), style: theme.textTheme.titleMedium),
      ],
    );
  }
}
