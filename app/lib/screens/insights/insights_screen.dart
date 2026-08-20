import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../l10n/app_localizations.dart';
import '../../services/cycle_insights.dart';
import '../../state/cycle_controller.dart';
import '../../widgets/premium_lock.dart';
import 'advanced_insights_screen.dart';
import 'cycle_history_screen.dart';
import 'tracker_history_screen.dart';
import 'widgets/phase_tips_section.dart';
import 'widgets/symptom_frequency_bar_row.dart';
import '../../util/number_format.dart';

class InsightsScreen extends StatelessWidget {
  const InsightsScreen({super.key});

  String _daysLabel(
          BuildContext context, AppLocalizations l10n, double value) =>
      '${formatDecimal(context, value)} ${l10n.onboardingDaysUnit}';

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
                value: _daysLabel(context, l10n, insights.averagePeriodLength!),
              ),
            if (insights.hasCycleLengthStats)
              _StatTile(
                label: l10n.insightsAverageCycleLengthLabel,
                value: _daysLabel(context, l10n, insights.averageCycleLength!),
                subtitle:
                    l10n.insightsVariabilityLabel(insights.cycleLengthStdDev!),
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
            const SizedBox(height: 12),
            // Premium sits next to the free stats rather than on top of
            // them: the basic averages above stay free forever, and this
            // adds a second, deeper view instead of locking the first.
            PremiumLock(
              title: l10n.advancedInsightsEntry,
              description: l10n.premiumBenefitAdvancedInsights,
              child: Card(
                child: ListTile(
                  leading: Icon(Icons.insights_outlined,
                      color: Theme.of(context).colorScheme.primary),
                  title: Text(l10n.advancedInsightsEntry),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (_) => const AdvancedInsightsScreen())),
                ),
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

/// One tracker in the hub grid.
///
/// The grid used to be ten identical pink squares whose only content was an
/// icon and a word — decorative, and no reason to tap any particular one.
/// Each tile now carries its tracker's own colour and, more usefully, its
/// latest value: the grid answers "what do I weigh lately?" without opening
/// anything, and an empty tracker says so plainly instead of looking the
/// same as a full one.
class _TrackerTile extends StatelessWidget {
  const _TrackerTile({required this.type});

  final TrackerType type;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final palette = trackerPalette(type);
    final logs = context.watch<CycleController>().logs;
    final latest = trackerLatestLabel(context, l10n, type, logs);

    final panel = isDark
        ? Color.alphaBlend(
            palette.tint.withValues(alpha: 0.12), theme.colorScheme.surface)
        : palette.tint.withValues(alpha: 0.5);
    final ink = isDark ? palette.tint : palette.ink;

    return Material(
      color: panel,
      borderRadius: BorderRadius.circular(20),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () => Navigator.of(context).push(
          MaterialPageRoute(builder: (_) => TrackerHistoryScreen(type: type)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 38,
                height: 38,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: isDark
                      ? palette.tint.withValues(alpha: 0.18)
                      : palette.tint,
                ),
                child: Icon(trackerIcon(type), size: 19, color: ink),
              ),
              const SizedBox(height: 8),
              Text(
                trackerTitle(l10n, type),
                style: theme.textTheme.labelMedium?.copyWith(color: ink),
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 2),
              Text(
                latest ?? '—',
                style: theme.textTheme.labelSmall?.copyWith(
                  color: ink.withValues(alpha: latest == null ? 0.5 : 0.85),
                  fontWeight:
                      latest == null ? FontWeight.w400 : FontWeight.w700,
                ),
                maxLines: 1,
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
          // Expanded, not bare: the label is a full sentence in most
          // languages ("Average cycle length" → "Durchschnittliche
          // Zykluslänge") and this Row overflowed by up to 69px on a 360dp
          // screen. A RenderFlex overflow is a red-striped bar, not an
          // ellipsis — it had never been caught because every test ran at
          // the default 800x600 surface.
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(label, style: theme.textTheme.bodyMedium),
                if (subtitle != null)
                  Text(subtitle!, style: theme.textTheme.bodySmall),
              ],
            ),
          ),
          const SizedBox(width: 12),
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
