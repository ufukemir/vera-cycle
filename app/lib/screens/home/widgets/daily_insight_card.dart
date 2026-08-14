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

  String get _photoAsset {
    switch (phase) {
      case CyclePhase.menstrual:
        return 'assets/photos/sleeping_soft.jpg';
      case CyclePhase.follicular:
        return 'assets/photos/pier_stretch.jpg';
      case CyclePhase.fertileWindow:
        return 'assets/photos/lemon_water.jpg';
      case CyclePhase.luteal:
        return 'assets/photos/water_glass.jpg';
      case CyclePhase.unknown:
        return 'assets/photos/sunny_smile.jpg';
    }
  }

  List<String> _candidates(AppLocalizations l10n) {
    switch (phase) {
      case CyclePhase.menstrual:
        return [
          l10n.insightMenstrual1,
          l10n.insightMenstrual2,
          l10n.insightMenstrual3,
          l10n.insightMenstrual4,
          l10n.insightMenstrual5,
          l10n.insightMenstrual6,
        ];
      case CyclePhase.follicular:
        return [
          l10n.insightFollicular1,
          l10n.insightFollicular2,
          l10n.insightFollicular3,
          l10n.insightFollicular4,
          l10n.insightFollicular5,
          l10n.insightFollicular6,
        ];
      case CyclePhase.fertileWindow:
        return [
          l10n.insightFertile1,
          l10n.insightFertile2,
          l10n.insightFertile3,
          l10n.insightFertile4,
          l10n.insightFertile5,
          l10n.insightFertile6,
        ];
      case CyclePhase.luteal:
        return [
          l10n.insightLuteal1,
          l10n.insightLuteal2,
          l10n.insightLuteal3,
          l10n.insightLuteal4,
          l10n.insightLuteal5,
          l10n.insightLuteal6,
        ];
      case CyclePhase.unknown:
        return [
          l10n.insightUnknown1,
          l10n.insightUnknown2,
          l10n.insightUnknown3,
          l10n.insightUnknown4,
        ];
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
      clipBehavior: Clip.antiAlias,
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
          // Phase-matched licensed photo (assets/photos/NOTICE.md).
          Image.asset(_photoAsset,
              height: 110, width: double.infinity, fit: BoxFit.cover),
          Padding(
            padding: const EdgeInsets.all(18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(Icons.spa_outlined, size: 18),
                    const SizedBox(width: 6),
                    Text(l10n.dailyInsightLabel,
                        style: theme.textTheme.labelLarge),
                  ],
                ),
                const SizedBox(height: 8),
                Text(fact, style: theme.textTheme.bodyMedium),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
