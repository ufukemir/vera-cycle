import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../l10n/app_localizations.dart';
import '../../models/cycle.dart';
import '../../state/cycle_controller.dart';
import 'widgets/cycle_trends_chart.dart';

/// A plain list of recorded cycles, newest first, each compared against
/// the user's own average.
///
/// The comparison is descriptive only — "+3 days" never becomes "too
/// long". Variation between cycles is normal, and labelling it as a
/// problem is exactly the false-authority this app avoids.
class CycleHistoryScreen extends StatelessWidget {
  const CycleHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final ordered = context.watch<CycleController>().cycles;
    final cycles = ordered.reversed.toList();
    final completed = cycles.where((c) => c.isComplete).toList();
    final average = completed.isEmpty
        ? null
        : completed.map((c) => c.length!).reduce((a, b) => a + b) /
              completed.length;

    return Scaffold(
      appBar: AppBar(title: Text(l10n.cycleHistoryTitle)),
      body: SafeArea(
        child: cycles.isEmpty
            ? Center(
                child: Padding(
                  padding: const EdgeInsets.all(32),
                  child: Text(
                    l10n.cycleHistoryEmpty,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
              )
            : ListView.separated(
                padding: const EdgeInsets.all(20),
                // The chart sits above the list as item 0: it answers "is
                // this normal for me?", which the per-cycle "+3 days"
                // captions never could.
                itemCount: cycles.length + 1,
                separatorBuilder: (_, _) => const SizedBox(height: 12),
                itemBuilder: (context, i) {
                  if (i == 0) {
                    return CycleTrendsChart.canRender(ordered)
                        ? Padding(
                            padding: const EdgeInsets.only(bottom: 8),
                            child: CycleTrendsChart(cycles: ordered),
                          )
                        : const SizedBox.shrink();
                  }
                  return _CycleTile(cycle: cycles[i - 1], average: average);
                },
              ),
      ),
    );
  }
}

class _CycleTile extends StatelessWidget {
  const _CycleTile({required this.cycle, required this.average});

  final ObservedCycle cycle;
  final double? average;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    final locale = Localizations.localeOf(context).toString();
    final fmt = DateFormat.yMMMd(locale);
    final length = cycle.length;

    String? comparison;
    if (length != null && average != null && average! > 0) {
      final diff = (length - average!).round();
      if (diff != 0) {
        comparison = l10n.cycleHistoryVsAverage(
          '${diff > 0 ? '+' : ''}$diff ${l10n.onboardingDaysUnit}',
        );
      }
    }

    // Bar width relative to a 40-day ceiling, so cycles are comparable at
    // a glance without implying 40 is a limit.
    final fraction = ((length ?? cycle.periodLength) / 40).clamp(0.08, 1.0);

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainerHigh,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  '${fmt.format(cycle.startDate)}'
                  '${cycle.nextStartDate != null ? ' – ${fmt.format(cycle.nextStartDate!)}' : ''}',
                  style: theme.textTheme.labelLarge,
                ),
              ),
              Text(
                length == null
                    ? l10n.cycleHistoryOngoing
                    : l10n.cycleHistoryLength(length),
                style: theme.textTheme.titleSmall,
              ),
            ],
          ),
          const SizedBox(height: 10),
          ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: Stack(
              children: [
                Container(
                  height: 10,
                  color: theme.colorScheme.outlineVariant.withValues(
                    alpha: 0.3,
                  ),
                ),
                FractionallySizedBox(
                  widthFactor: fraction,
                  child: Container(
                    height: 10,
                    color: theme.colorScheme.primary,
                  ),
                ),
                FractionallySizedBox(
                  widthFactor: (cycle.periodLength / 40).clamp(0.05, 1.0),
                  child: Container(height: 10, color: theme.colorScheme.error),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          Text(
            l10n.cycleHistoryPeriodLength(cycle.periodLength),
            style: theme.textTheme.bodySmall,
          ),
          if (comparison != null)
            Text(comparison, style: theme.textTheme.bodySmall),
        ],
      ),
    );
  }
}
