import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../l10n/app_localizations.dart';
import '../../services/cycle_insights.dart';
import '../../state/cycle_controller.dart';
import '../../theme/app_theme.dart';
import '../../widgets/premium_lock.dart';
import '../day_log/day_log_screen.dart';
import '../settings/feedback_screen.dart';
import '../settings/reminders_screen.dart';
import '../settings/settings_screen.dart';
import '../settings/theme_screen.dart';
import 'advanced_insights_screen.dart';
import 'cycle_history_screen.dart';
import 'tracker_history_screen.dart';
import 'widgets/phase_tips_section.dart';
import 'widgets/symptom_frequency_bar_row.dart';
import '../../util/day.dart';
import '../../util/number_format.dart';

/// The fourth tab: cycle stats, the tracker hub and phase tips, under the
/// "Profilim" heading rather than "İçgörüler" — it is now also where
/// Settings lives, one gear-icon tap away instead of its own bottom-bar
/// slot. The class keeps its old name; renaming it earns nothing that
/// isn't already said by the AppBar title people actually see.
class InsightsScreen extends StatelessWidget {
  const InsightsScreen({super.key});

  String _daysLabel(
    BuildContext context,
    AppLocalizations l10n,
    double value,
  ) => '${formatDecimal(context, value)} ${l10n.onboardingDaysUnit}';

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final controller = context.watch<CycleController>();
    final insights = CycleInsights.compute(controller.cycles, controller.logs);

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.navProfile),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings_outlined),
            tooltip: l10n.navSettings,
            onPressed: () => Navigator.of(
              context,
            ).push(MaterialPageRoute(builder: (_) => const SettingsScreen())),
          ),
        ],
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            const _QuickActionsRow(),
            const SizedBox(height: 24),
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
                subtitle: l10n.insightsVariabilityLabel(
                  insights.cycleLengthStdDev!,
                ),
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
            Text(
              l10n.insightsSymptomFrequencyTitle,
              style: Theme.of(context).textTheme.titleMedium,
            ),
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
                leading: Icon(
                  Icons.history,
                  color: Theme.of(context).colorScheme.primary,
                ),
                title: Text(l10n.insightsCycleHistoryEntry),
                trailing: const Icon(Icons.chevron_right),
                onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => const CycleHistoryScreen()),
                ),
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
                  leading: Icon(
                    Icons.insights_outlined,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  title: Text(l10n.advancedInsightsEntry),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => const AdvancedInsightsScreen(),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 28),
            Text(
              l10n.insightsTrackerHubTitle,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 12),
            GridView.count(
              crossAxisCount: 3,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              // 0.95 was tuned for the old single-line-badge tile. The
              // bigger badge and the value/"add" row added to it overflowed
              // by a couple of pixels on any tile whose label wraps to two
              // lines ("Bazal vücut sıcaklığı", "Kendi kendine göğüs
              // muayenesi") — not visible on a one-word tracker, which is
              // why it went unnoticed until someone saw it next to one.
              childAspectRatio: 0.8,
              children: [
                for (final type in TrackerType.values) _TrackerTile(type: type),
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

/// Four shortcuts to the destinations someone visits most from their own
/// profile: Settings and Reminders already have their own entry points
/// elsewhere (the app bar gear, the bottom bar), but repeating them here
/// costs nothing and saves the trip back out for someone already on this
/// screen. Tema opens [ThemeScreen] directly — it used to open Settings
/// scrolled to the appearance section, which read as the same tap as
/// "Ayarlar" with extra steps rather than a different destination.
class _QuickActionsRow extends StatelessWidget {
  const _QuickActionsRow();

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Row(
      children: [
        Expanded(
          child: _QuickAction(
            icon: Icons.settings_outlined,
            label: l10n.navSettings,
            onTap: () => Navigator.of(
              context,
            ).push(MaterialPageRoute(builder: (_) => const SettingsScreen())),
          ),
        ),
        Expanded(
          child: _QuickAction(
            icon: Icons.notifications_active_outlined,
            label: l10n.navReminders,
            onTap: () => Navigator.of(
              context,
            ).push(MaterialPageRoute(builder: (_) => const RemindersScreen())),
          ),
        ),
        Expanded(
          child: _QuickAction(
            icon: Icons.checkroom_outlined,
            label: l10n.settingsThemeLabel,
            onTap: () => Navigator.of(
              context,
            ).push(MaterialPageRoute(builder: (_) => const ThemeScreen())),
          ),
        ),
        Expanded(
          child: _QuickAction(
            icon: Icons.send_outlined,
            label: l10n.feedbackEntry,
            onTap: () => Navigator.of(
              context,
            ).push(MaterialPageRoute(builder: (_) => const FeedbackScreen())),
          ),
        ),
      ],
    );
  }
}

class _QuickAction extends StatelessWidget {
  const _QuickAction({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  final IconData icon;
  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final badge = isDark
        ? AppPalette.lavenderSoft.withValues(alpha: 0.18)
        : AppPalette.lavenderSoft;
    final ink = isDark ? AppPalette.lavenderSoft : AppPalette.lavenderSoftText;

    return Material(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(16),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 52,
                height: 52,
                decoration: BoxDecoration(
                  color: badge,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Icon(icon, size: 24, color: ink),
              ),
              const SizedBox(height: 8),
              Text(
                label,
                style: theme.textTheme.labelSmall?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
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
    final scheme = theme.colorScheme;
    final isDark = theme.brightness == Brightness.dark;
    final palette = trackerPalette(type);
    final logs = context.watch<CycleController>().logs;
    final latest = trackerLatestLabel(context, l10n, type, logs);

    // A near-neutral card with one strong colour on the badge, not a whole
    // tile painted in a 50%-alpha pastel: nine tiles at that strength read
    // as a flat colour-block grid rather than nine distinct trackers, and
    // an empty one gave the bare value line nothing to contrast against.
    final panel = isDark
        ? Color.alphaBlend(palette.tint.withValues(alpha: 0.07), scheme.surface)
        : Color.alphaBlend(
            palette.tint.withValues(alpha: 0.16),
            scheme.surface,
          );
    final ink = isDark ? palette.tint : palette.ink;

    return Material(
      color: panel,
      borderRadius: BorderRadius.circular(20),
      clipBehavior: Clip.antiAlias,
      child: Stack(
        children: [
          InkWell(
            // Tapping the tile itself goes straight to today's entry for
            // this tracker — someone tapping "Cinsel aktivite" wants to log
            // today, not read a history screen first. History moved to its
            // own small corner button instead of disappearing.
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => DayLogScreen(date: today(), scrollTo: type),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 14, 10, 12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 46,
                    height: 46,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: isDark
                          ? palette.tint.withValues(alpha: 0.22)
                          : palette.tint,
                      boxShadow: isDark
                          ? null
                          : [
                              BoxShadow(
                                color: palette.tint.withValues(alpha: 0.5),
                                blurRadius: 10,
                                offset: const Offset(0, 4),
                              ),
                            ],
                    ),
                    child: Icon(trackerIcon(type), size: 22, color: ink),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    trackerTitle(l10n, type),
                    style: theme.textTheme.labelMedium?.copyWith(
                      color: scheme.onSurface,
                      height: 1.15,
                    ),
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 5),
                  if (latest != null)
                    Text(
                      latest,
                      style: theme.textTheme.labelSmall?.copyWith(
                        color: ink,
                        fontWeight: FontWeight.w700,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    )
                  else
                    // A tap target, not a placeholder: an em dash on every
                    // untouched tile read as something missing or broken
                    // rather than as an invitation, on a screen where most
                    // tiles start empty.
                    Container(
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: ink.withValues(alpha: isDark ? 0.18 : 0.14),
                      ),
                      child: Icon(Icons.add, size: 13, color: ink),
                    ),
                ],
              ),
            ),
          ),
          PositionedDirectional(
            top: 2,
            end: 2,
            child: Material(
              color: Colors.transparent,
              shape: const CircleBorder(),
              child: IconButton(
                icon: const Icon(Icons.show_chart),
                iconSize: 15,
                color: ink.withValues(alpha: 0.75),
                tooltip: l10n.trackerHistoryEntry,
                constraints: const BoxConstraints(minWidth: 30, minHeight: 30),
                padding: EdgeInsets.zero,
                visualDensity: VisualDensity.compact,
                onPressed: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => TrackerHistoryScreen(type: type),
                  ),
                ),
              ),
            ),
          ),
        ],
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
