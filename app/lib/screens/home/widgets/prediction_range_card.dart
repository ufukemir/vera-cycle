import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../l10n/app_localizations.dart';
import '../../../models/enums.dart';
import '../../../models/prediction.dart';

/// Renders a [CyclePrediction] as a range with a confidence chip — never a
/// single date. There is deliberately no branch here that reads
/// `prediction.likelyStart` in isolation; every path either shows the full
/// earliest–latest range or the honest "not enough data" state.
class PredictionRangeCard extends StatelessWidget {
  const PredictionRangeCard({super.key, required this.prediction});

  final CyclePrediction prediction;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);

    if (!prediction.hasPrediction) {
      return Card(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(l10n.homePredictionInsufficientTitle,
                  style: theme.textTheme.titleMedium),
              const SizedBox(height: 4),
              Text(l10n.homePredictionInsufficientBody),
            ],
          ),
        ),
      );
    }

    final format = DateFormat.MMMd(Localizations.localeOf(context).toString());
    final rangeLabel = l10n.homePredictionRangeLabel(
      format.format(prediction.earliestStart!),
      format.format(prediction.latestStart!),
    );

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(rangeLabel, style: theme.textTheme.titleLarge),
                ),
                _ConfidenceChip(confidence: prediction.confidence),
              ],
            ),
            if (prediction.irregular) ...[
              const SizedBox(height: 12),
              Text(l10n.homeIrregularNote, style: theme.textTheme.bodySmall),
            ],
          ],
        ),
      ),
    );
  }
}

class _ConfidenceChip extends StatelessWidget {
  const _ConfidenceChip({required this.confidence});

  final PredictionConfidence confidence;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final (label, icon) = switch (confidence) {
      PredictionConfidence.high => (l10n.homeConfidenceHigh, Icons.check_circle_outline),
      PredictionConfidence.medium => (l10n.homeConfidenceMedium, Icons.remove_circle_outline),
      PredictionConfidence.low => (l10n.homeConfidenceLow, Icons.error_outline),
      PredictionConfidence.none => (l10n.homeConfidenceLow, Icons.error_outline),
    };
    return Chip(
      avatar: Icon(icon, size: 18),
      label: Text(label),
      visualDensity: VisualDensity.compact,
    );
  }
}
