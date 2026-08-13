import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../l10n/app_localizations.dart';
import '../../services/cycle_insights.dart';
import '../../state/cycle_controller.dart';
import 'widgets/symptom_frequency_bar_row.dart';

class InsightsScreen extends StatelessWidget {
  const InsightsScreen({super.key});

  String _daysLabel(AppLocalizations l10n, double value) =>
      '${value.toStringAsFixed(1)} ${l10n.onboardingDaysUnit}';

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final controller = context.watch<CycleController>();
    final insights = CycleInsights.compute(controller.cycles, controller.logs);

    return Scaffold(
      appBar: AppBar(title: Text(l10n.navInsights)),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            _StatTile(
              label: l10n.insightsCyclesLoggedLabel,
              value: '${insights.cyclesLoggedCount}',
            ),
            if (insights.hasPeriodLengthStats)
              _StatTile(
                label: l10n.insightsAveragePeriodLengthLabel,
                value: _daysLabel(l10n, insights.averagePeriodLength!),
              ),
            if (insights.hasCycleLengthStats)
              _StatTile(
                label: l10n.insightsAverageCycleLengthLabel,
                value: _daysLabel(l10n, insights.averageCycleLength!),
                subtitle: l10n.insightsVariabilityLabel(
                    insights.cycleLengthStdDev!.toStringAsFixed(1)),
              )
            else
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: _EmptyNotice(
                  title: l10n.insightsNotEnoughDataTitle,
                  body: l10n.insightsNotEnoughDataBody,
                ),
              ),
            const SizedBox(height: 28),
            Text(l10n.insightsSymptomFrequencyTitle,
                style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 12),
            if (insights.symptomFrequencyByCycleDay.isEmpty)
              Text(l10n.insightsNoSymptomsLogged)
            else
              SymptomFrequencyBarRow(
                frequencyByCycleDay: insights.symptomFrequencyByCycleDay,
                maxCycleDay: CycleInsights.maxCycleDay,
              ),
          ],
        ),
      ),
    );
  }
}

class _StatTile extends StatelessWidget {
  const _StatTile({required this.label, required this.value, this.subtitle});

  final String label;
  final String value;
  final String? subtitle;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(label, style: theme.textTheme.bodyMedium),
              if (subtitle != null)
                Text(subtitle!, style: theme.textTheme.bodySmall),
            ],
          ),
          Text(value, style: theme.textTheme.titleMedium),
        ],
      ),
    );
  }
}

class _EmptyNotice extends StatelessWidget {
  const _EmptyNotice({required this.title, required this.body});

  final String title;
  final String body;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: theme.textTheme.titleSmall),
        const SizedBox(height: 4),
        Text(body, style: theme.textTheme.bodySmall),
      ],
    );
  }
}
