import 'package:flutter/material.dart';

import '../../../l10n/app_localizations.dart';
import '../../../models/prediction.dart';
import '../../../util/day.dart';

/// Shown at the top of a day's log when that day falls inside the estimated
/// fertile window — and, more specifically, when it's the single day
/// singled out as the ovulation estimate (see [CalendarDayCell]). Always
/// carries the same "estimate, not a guarantee / not contraception" language
/// used everywhere else fertile-window data appears (home screen, insights)
/// — see CLAUDE.md principle 5 and 7.
class FertilityStatusBanner extends StatelessWidget {
  const FertilityStatusBanner({
    super.key,
    required this.date,
    required this.status,
  });

  final DateTime date;
  final CycleStatus status;

  @override
  Widget build(BuildContext context) {
    if (!status.hasFertileEstimate) return const SizedBox.shrink();
    final normalized = dateOnly(date);
    if (normalized.isBefore(status.fertileWindowStart!) ||
        normalized.isAfter(status.fertileWindowEnd!)) {
      return const SizedBox.shrink();
    }

    final isOvulation = isSameDay(
      normalized,
      addDays(status.fertileWindowEnd!, -1),
    );
    final l10n = AppLocalizations.of(context)!;
    final scheme = Theme.of(context).colorScheme;

    return Container(
      margin: const EdgeInsets.only(bottom: 24),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: scheme.tertiaryContainer,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.auto_awesome_outlined, color: scheme.onTertiaryContainer),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  isOvulation
                      ? l10n.dayDetailOvulationTitle
                      : l10n.dayDetailFertileTitle,
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    color: scheme.onTertiaryContainer,
                  ),
                ),
                if (isOvulation) ...[
                  const SizedBox(height: 4),
                  Text(
                    l10n.dayDetailOvulationBody,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: scheme.onTertiaryContainer,
                    ),
                  ),
                ],
                const SizedBox(height: 4),
                Text(
                  l10n.homeFertileWindowDisclaimer,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: scheme.onTertiaryContainer.withValues(alpha: 0.8),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
