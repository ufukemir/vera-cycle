import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../l10n/app_localizations.dart';
import '../../models/enums.dart';
import '../../services/home_widget_service.dart';
import '../../services/pregnancy_info.dart';
import '../../theme/app_theme.dart';
import '../../state/app_preferences.dart';
import '../../state/assistant_conversation.dart';
import '../../state/cycle_controller.dart';
import '../../util/day.dart';
import '../assistant/assistant_screen.dart';
import 'fertility_detail_screen.dart';
import '../day_log/day_log_screen.dart';
import 'widgets/ad_placeholder_banner.dart';
import 'widgets/backup_nudge_card.dart';
import 'widgets/cycle_ring.dart';
import 'widgets/daily_insight_card.dart';
import 'widgets/first_run_card.dart';
import 'widgets/home_hero.dart';
import 'widgets/phase_timeline_bar.dart';
import 'widgets/pregnancy_card.dart';
import 'widgets/prediction_range_card.dart';
import 'widgets/quick_log_sheet.dart';

/// Home: a scenic photo hero followed by a stack of cards — the reference
/// app's layout language, with our own palette, typography, illustrations,
/// and (crucially) our own honesty rules about what the numbers claim.
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  /// Last payload sent to the OS widget. Home rebuilds on every provider
  /// notification — scrolling, a theme tap, any save — and pushing an
  /// unchanged payload each time means a platform-channel write and an OS
  /// widget refresh for nothing.
  String? _lastWidgetPayload;

  void _syncHomeWidget({
    required String eyebrow,
    required String headline,
    String? secondary,
  }) {
    final payload = '$eyebrow|$headline|${secondary ?? ''}';
    if (payload == _lastWidgetPayload) return;
    _lastWidgetPayload = payload;
    // Fire-and-forget by design; HomeWidgetService swallows platform
    // failures, and a missing widget must never affect this screen.
    unawaited(const HomeWidgetService().update(
      eyebrow: eyebrow,
      headline: headline,
      secondary: secondary,
    ));
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final controller = context.watch<CycleController>();
    final prefs = context.watch<AppPreferences>();
    final status = controller.todayStatus;
    final prediction = controller.prediction;
    final ringLength =
        prediction.meanLength?.round() ?? prefs.estimatedCycleLengthDays;

    final pregnancyInfo = (prefs.pregnancyMode && prefs.pregnancyLmp != null)
        ? PregnancyInfo.from(prefs.pregnancyLmp!)
        : null;

    int? daysToWindow;
    int? daysToOvulation;
    if (prediction.hasPrediction) {
      final d = daysBetween(today(), prediction.earliestStart!);
      if (d > 0) daysToWindow = d;
    }
    if (status.hasFertileEstimate) {
      final ovulation = addDays(status.fertileWindowEnd!, -1);
      final d = daysBetween(today(), ovulation);
      if (d > 0) daysToOvulation = d;
    }

    final phaseLabel = switch (status.phase) {
      CyclePhase.menstrual => l10n.homePhaseMenstrual,
      CyclePhase.follicular => l10n.homePhaseFollicular,
      CyclePhase.fertileWindow => l10n.homePhaseFertileWindow,
      CyclePhase.luteal => l10n.homePhaseLuteal,
      CyclePhase.unknown => l10n.homePhaseUnknown,
    };

    // The hero headline prefers an honest countdown, falls back to the
    // plain cycle day, and finally to the no-data state.
    final String heroHeadline;
    final String heroEyebrow;
    if (daysToWindow != null) {
      heroHeadline = l10n.homeWindowCountdown(daysToWindow);
      heroEyebrow = phaseLabel;
    } else if (status.cycleDay != null) {
      heroHeadline = l10n.homeCycleDayLabel(status.cycleDay!);
      heroEyebrow = phaseLabel;
    } else {
      heroHeadline = l10n.homeNoCycleYet;
      heroEyebrow = l10n.appTitle;
    }

    // Keep the OS widget in step with what Home shows, but only when the
    // text actually changed — see [_syncHomeWidget].
    _syncHomeWidget(
      eyebrow: heroEyebrow,
      headline: heroHeadline,
      secondary: daysToOvulation != null
          ? l10n.homeOvulationCountdown(daysToOvulation)
          : null,
    );

    return Scaffold(
      body: SafeArea(
        top: false,
        child: SingleChildScrollView(
          child: Column(
            children: [
              if (pregnancyInfo == null)
                HomeHero(
                  theme: prefs.homeTheme,
                  status: status,
                  eyebrow: heroEyebrow,
                  headline: heroHeadline,
                  secondary: daysToOvulation != null
                      ? l10n.homeOvulationCountdown(daysToOvulation)
                      : null,
                  ctaLabel: l10n.homePeriodStartedButton,
                  onCtaPressed: () =>
                      context.read<CycleController>().markPeriodStartedToday(),
                  mascot: prefs.mascot,
                ),
              // The content rides up over the scene on a rounded sheet, so
              // the photo continues behind it instead of stopping at a hard
              // edge. Home reads as one place rather than a banner with a
              // list bolted underneath.
              Transform.translate(
                offset: const Offset(0, -28),
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.surface,
                    borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(30)),
                  ),
                  padding: const EdgeInsets.fromLTRB(20, 24, 20, 0),
                  child: Column(
                    children: [
                    if (pregnancyInfo != null) ...[
                      const SizedBox(height: 20),
                      PregnancyCard(info: pregnancyInfo),
                    ] else ...[
                      const FirstRunCard(),
                      PhaseTimelineBar(
                        status: status,
                        cycleLength: ringLength,
                        periodLength: prefs.estimatedPeriodLengthDays,
                      ),
                      const SizedBox(height: 20),
                      _QuickActionsRow(
                        onQuickLog: () => showQuickLogSheet(context),
                        onOpenDetails: () => Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (_) => DayLogScreen(date: today())),
                        ),
                        // The conversation is provided by HomeShell, which
                        // sits *below* the Navigator — so a pushed route is
                        // outside its scope and reading it there threw
                        // ProviderNotFoundException the moment the assistant
                        // opened. Handing the same instance to the route
                        // keeps the scope correct and the lifetime intact:
                        // it still dies with the shell, which is what the
                        // app lock tears down.
                        onOpenAssistant: () {
                          final conversation =
                              context.read<AssistantConversation>();
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) =>
                                  ChangeNotifierProvider<AssistantConversation>
                                      .value(
                                value: conversation,
                                child: const AssistantScreen(),
                              ),
                            ),
                          );
                        },
                      ),
                      const SizedBox(height: 20),
                      // The ring stays as the detailed, animated view of the
                      // same cycle the hero summarises.
                      CycleRing(
                        cycleDay: status.cycleDay,
                        cycleLength: ringLength,
                        child: Text(
                          status.cycleDay == null
                              ? '—'
                              : '${status.cycleDay}',
                          style: Theme.of(context).textTheme.displayMedium,
                        ),
                      ),
                      const SizedBox(height: 20),
                      PredictionRangeCard(prediction: prediction),
                      if (status.hasFertileEstimate) ...[
                        const SizedBox(height: 12),
                        // Was a bare line of grey disclaimer text. The
                        // fertile window is the estimate people most want
                        // explained, so it now opens the screen that
                        // explains it instead of only warning about it.
                        _FertileWindowTile(
                          onTap: () => Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (_) => const FertilityDetailScreen()),
                          ),
                        ),
                      ],
                    ],
                    const SizedBox(height: 20),
                    const BackupNudgeCard(),
                    const SizedBox(height: 20),
                    DailyInsightCard(phase: status.phase),
                    const SizedBox(height: 24),
                    const AdPlaceholderBanner(),
                    const SizedBox(height: 8),
                  ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _QuickActionsRow extends StatelessWidget {
  const _QuickActionsRow({
    required this.onQuickLog,
    required this.onOpenDetails,
    required this.onOpenAssistant,
  });

  final VoidCallback onQuickLog;
  final VoidCallback onOpenDetails;

  /// The assistant lost its tab when logging took the middle slot of the
  /// bottom bar. It lands here rather than in a menu: it is one of the few
  /// things this app has that competitors do not, and burying it would be
  /// the wrong trade for a bar slot.
  final VoidCallback onOpenAssistant;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Row(
      children: [
        Expanded(
          child: FilledButton.tonalIcon(
            onPressed: onQuickLog,
            icon: const Icon(Icons.add_reaction_outlined),
            label: Text(l10n.homeQuickLogTitle, overflow: TextOverflow.ellipsis),
          ),
        ),
        const SizedBox(width: 10),
        IconButton.filledTonal(
          tooltip: l10n.homeOpenTodayLog,
          onPressed: onOpenDetails,
          icon: const Icon(Icons.edit_note_outlined),
        ),
        const SizedBox(width: 10),
        IconButton.filledTonal(
          tooltip: l10n.navAssistant,
          onPressed: onOpenAssistant,
          icon: const Icon(Icons.chat_bubble_outline_rounded),
        ),
      ],
    );
  }
}

class _FertileWindowTile extends StatelessWidget {
  const _FertileWindowTile({required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;
    final isDark = theme.brightness == Brightness.dark;

    return Material(
      color: isDark
          ? Color.alphaBlend(
              AppPalette.goldSoft.withValues(alpha: 0.10), scheme.surface)
          : AppPalette.goldSoft.withValues(alpha: 0.45),
      borderRadius: BorderRadius.circular(20),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Row(
            children: [
              Container(
                width: 34,
                height: 34,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: isDark
                      ? AppPalette.goldSoft.withValues(alpha: 0.18)
                      : AppPalette.goldSoft,
                ),
                child: Icon(Icons.adjust,
                    size: 18,
                    color: isDark
                        ? AppPalette.goldSoft
                        : AppPalette.goldSoftText),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(l10n.calendarLegendFertile,
                        style: theme.textTheme.titleSmall),
                    const SizedBox(height: 2),
                    Text(l10n.homeFertileWindowDisclaimer,
                        style: theme.textTheme.bodySmall),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              Icon(Icons.chevron_right, color: scheme.onSurfaceVariant),
            ],
          ),
        ),
      ),
    );
  }
}
