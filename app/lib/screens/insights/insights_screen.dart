import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../l10n/app_localizations.dart';
import '../../services/cycle_insights.dart';
import '../../state/cycle_controller.dart';
import 'cycle_history_screen.dart';
import 'tracker_history_screen.dart';
import 'widgets/phase_tips_section.dart';
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
            const SizedBox(height: 20),
            Card(
              child: ListTile(
                leading: Icon(Icons.history,
                    color: Theme.of(context).colorScheme.primary),
                title: Text(l10n.insightsCycleHistoryEntry),
                trailing: const Icon(Icons.chevron_right),
                onTap: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (_) => const CycleHistoryScreen())),
              ),
            ),
            const SizedBox(height: 28),
            Text(l10n.insightsTrackerHubTitle,
                style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 12),
            GridView.count(
              crossAxisCount: 3,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              childAspectRatio: 0.95,
              children: [
                for (final type in TrackerType.values)
                  _TrackerTile(type: type),
              ],
            ),
            const SizedBox(height: 28),
            PhaseTipsSection(phase: controller.todayStatus.phase),
          ],
        ),
      ),
    );
  }
}

class _TrackerTile extends StatelessWidget {
  const _TrackerTile({required this.type});

  final TrackerType type;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final scheme = Theme.of(context).colorScheme;
    return Material(
      color: scheme.surfaceContainerHigh,
      borderRadius: BorderRadius.circular(18),
      child: InkWell(
        borderRadius: BorderRadius.circular(18),
        onTap: () => Navigator.of(context).push(
          MaterialPageRoute(builder: (_) => TrackerHistoryScreen(type: type)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: scheme.primaryContainer),
                child: Icon(trackerIcon(type),
                    size: 20, color: scheme.onPrimaryContainer),
              ),
              const SizedBox(height: 8),
              Text(
                trackerTitle(l10n, type),
                style: Theme.of(context).textTheme.labelMedium,
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
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
