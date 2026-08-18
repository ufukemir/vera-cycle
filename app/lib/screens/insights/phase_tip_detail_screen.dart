import 'package:flutter/material.dart';

import '../../l10n/app_localizations.dart';
import '../../l10n/enum_labels.dart';
import '../../models/enums.dart';
import '../../widgets/illustrations.dart';

/// Which side of the phase advice the user tapped into.
enum PhaseTipCategory { fitness, nutrition }

/// The long form of a phase tip: what is happening in the body right now,
/// and what the short card's suggestion actually means in practice.
///
/// The tone rules from [PhaseTipsSection] carry over unchanged and matter
/// more here, because length reads as authority: everything stays hedged
/// ("often", "many people"), nothing is framed as personalized medical
/// advice, and the page closes by saying plainly that bodies differ.
class PhaseTipDetailScreen extends StatelessWidget {
  const PhaseTipDetailScreen({
    super.key,
    required this.phase,
    required this.category,
    required this.photoAsset,
  });

  final CyclePhase phase;
  final PhaseTipCategory category;
  final String photoAsset;

  String _whatsHappening(AppLocalizations l10n) => switch (phase) {
        CyclePhase.menstrual => l10n.phaseExplainerMenstrual,
        CyclePhase.follicular => l10n.phaseExplainerFollicular,
        CyclePhase.fertileWindow => l10n.phaseExplainerFertile,
        CyclePhase.luteal => l10n.phaseExplainerLuteal,
        CyclePhase.unknown => l10n.phaseExplainerUnknown,
      };

  String _detail(AppLocalizations l10n) =>
      switch ((category, phase)) {
        (PhaseTipCategory.fitness, CyclePhase.menstrual) =>
          l10n.tipFitnessDetailMenstrual,
        (PhaseTipCategory.fitness, CyclePhase.follicular) =>
          l10n.tipFitnessDetailFollicular,
        (PhaseTipCategory.fitness, CyclePhase.fertileWindow) =>
          l10n.tipFitnessDetailFertile,
        (PhaseTipCategory.fitness, CyclePhase.luteal) =>
          l10n.tipFitnessDetailLuteal,
        (PhaseTipCategory.fitness, CyclePhase.unknown) =>
          l10n.tipFitnessDetailUnknown,
        (PhaseTipCategory.nutrition, CyclePhase.menstrual) =>
          l10n.tipNutritionDetailMenstrual,
        (PhaseTipCategory.nutrition, CyclePhase.follicular) =>
          l10n.tipNutritionDetailFollicular,
        (PhaseTipCategory.nutrition, CyclePhase.fertileWindow) =>
          l10n.tipNutritionDetailFertile,
        (PhaseTipCategory.nutrition, CyclePhase.luteal) =>
          l10n.tipNutritionDetailLuteal,
        (PhaseTipCategory.nutrition, CyclePhase.unknown) =>
          l10n.tipNutritionDetailUnknown,
      };

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    final title = category == PhaseTipCategory.fitness
        ? l10n.tipFitnessLabel
        : l10n.tipNutritionLabel;

    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            PhotoHero(asset: photoAsset, height: 170),
            const SizedBox(height: 20),
            Text(phaseLabel(l10n, phase), style: theme.textTheme.headlineSmall),
            const SizedBox(height: 16),
            _Block(
              heading: l10n.tipDetailWhatsHappening,
              body: _whatsHappening(l10n),
            ),
            const SizedBox(height: 20),
            _Block(heading: title, body: _detail(l10n)),
            const SizedBox(height: 24),
            Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: theme.colorScheme.surfaceContainerHigh,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Icons.info_outline,
                      size: 18, color: theme.colorScheme.primary),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      l10n.tipDetailDisclaimer,
                      style: theme.textTheme.bodySmall,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Block extends StatelessWidget {
  const _Block({required this.heading, required this.body});

  final String heading;
  final String body;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(heading, style: theme.textTheme.titleMedium),
        const SizedBox(height: 8),
        Text(body,
            style: theme.textTheme.bodyMedium?.copyWith(height: 1.5)),
      ],
    );
  }
}
