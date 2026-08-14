import 'package:flutter/material.dart';

import '../../../l10n/app_localizations.dart';
import '../../../models/enums.dart';
import '../../../util/day.dart';

/// A short, phase-relevant educational fact. Content is deliberately
/// descriptive/general ("estrogen tends to rise in this phase"), never
/// diagnostic or personalized-sounding ("you have low estrogen") — see
/// CLAUDE.md's content-tone rule that principle 7 (not a medical device)
/// applies to this content too.
///
/// Which fact shows is picked deterministically from the date (not
/// [Random]) so it's stable across rebuilds within a day and reproducible in
/// tests, while still rotating day to day.
class DailyInsightCard extends StatelessWidget {
  const DailyInsightCard({super.key, required this.phase});

  final CyclePhase phase;

  List<String> _candidates(AppLocalizations l10n) {
    switch (phase) {
      case CyclePhase.menstrual:
        return [l10n.insightMenstrual1, l10n.insightMenstrual2];
      case CyclePhase.follicular:
        return [l10n.insightFollicular1, l10n.insightFollicular2];
      case CyclePhase.fertileWindow:
        return [l10n.insightFertile1, l10n.insightFertile2];
      case CyclePhase.luteal:
        return [l10n.insightLuteal1, l10n.insightLuteal2];
      case CyclePhase.unknown:
        return [l10n.insightUnknown1];
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    final candidates = _candidates(l10n);
    final fact = candidates[today().day % candidates.length];

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            theme.colorScheme.tertiaryContainer.withValues(alpha: 0.6),
            theme.colorScheme.primaryContainer.withValues(alpha: 0.6),
          ],
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.spa_outlined, size: 18),
              const SizedBox(width: 6),
              Text(l10n.dailyInsightLabel, style: theme.textTheme.labelLarge),
            ],
          ),
          const SizedBox(height: 8),
          Text(fact, style: theme.textTheme.bodyMedium),
        ],
      ),
    );
  }
}
