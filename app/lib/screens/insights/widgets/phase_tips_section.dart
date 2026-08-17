import 'package:flutter/material.dart';

import '../../../l10n/app_localizations.dart';
import '../../../models/enums.dart';

/// Cycle-phase-synced movement/nutrition suggestions — general, hedged
/// language ("often", "many people", "can") never framed as personalized
/// medical advice, matching CLAUDE.md's content-tone rule (principle 7
/// applies to informational content too). This is a distinct content
/// category from [DailyInsightCard]'s purely descriptive "did you know"
/// facts: these are actionable suggestions, not physiology trivia.
///
/// Content is entirely local/static (no network, no third-party content
/// API) — see docs/backlog.md item 2, which explicitly flagged this as
/// cheap to add and zero regulatory risk.
class PhaseTipsSection extends StatelessWidget {
  const PhaseTipsSection({super.key, required this.phase});

  final CyclePhase phase;

  String _fitnessTip(AppLocalizations l10n) {
    switch (phase) {
      case CyclePhase.menstrual:
        return l10n.tipFitnessMenstrual;
      case CyclePhase.follicular:
        return l10n.tipFitnessFollicular;
      case CyclePhase.fertileWindow:
        return l10n.tipFitnessFertile;
      case CyclePhase.luteal:
        return l10n.tipFitnessLuteal;
      case CyclePhase.unknown:
        return l10n.tipFitnessUnknown;
    }
  }

  String _nutritionTip(AppLocalizations l10n) {
    switch (phase) {
      case CyclePhase.menstrual:
        return l10n.tipNutritionMenstrual;
      case CyclePhase.follicular:
        return l10n.tipNutritionFollicular;
      case CyclePhase.fertileWindow:
        return l10n.tipNutritionFertile;
      case CyclePhase.luteal:
        return l10n.tipNutritionLuteal;
      case CyclePhase.unknown:
        return l10n.tipNutritionUnknown;
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(l10n.insightsPhaseTipsTitle,
            style: Theme.of(context).textTheme.titleMedium),
        const SizedBox(height: 12),
        _TipCard(
          icon: Icons.directions_walk_outlined,
          label: l10n.tipFitnessLabel,
          tip: _fitnessTip(l10n),
          photoAsset: 'assets/photos/pier_stretch.jpg',
        ),
        const SizedBox(height: 12),
        _TipCard(
          icon: Icons.restaurant_outlined,
          label: l10n.tipNutritionLabel,
          tip: _nutritionTip(l10n),
          photoAsset: 'assets/photos/kitchen_salad.jpg',
        ),
      ],
    );
  }
}

class _TipCard extends StatelessWidget {
  const _TipCard({
    required this.icon,
    required this.label,
    required this.tip,
    required this.photoAsset,
  });

  final IconData icon;
  final String label;
  final String tip;

  /// Openly-licensed photo (assets/photos/NOTICE.md), shown as a rounded
  /// leading thumbnail.
  final String photoAsset;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainerHigh,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(14),
            // cacheWidth caps decode size: without it a 72px-wide
            // thumbnail still decodes the full-resolution bitmap.
            child: Image.asset(photoAsset,
                width: 72, height: 88, fit: BoxFit.cover, cacheWidth: 216),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(icon, size: 18, color: theme.colorScheme.primary),
                    const SizedBox(width: 6),
                    Text(label, style: theme.textTheme.labelLarge),
                  ],
                ),
                const SizedBox(height: 6),
                Text(tip, style: theme.textTheme.bodyMedium),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
