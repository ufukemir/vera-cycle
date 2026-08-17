import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../l10n/app_localizations.dart';
import '../../models/enums.dart';
import '../../services/home_widget_service.dart';
import '../../services/pregnancy_info.dart';
import '../../state/app_preferences.dart';
import '../../state/cycle_controller.dart';
import '../../util/day.dart';
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
              Padding(
                padding: const EdgeInsets.all(20),
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
                        Text(
                          l10n.homeFertileWindowDisclaimer,
                          style: Theme.of(context).textTheme.bodySmall,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ],
                    const SizedBox(height: 20),
                    const BackupNudgeCard(),
                    const SizedBox(height: 20),
                    DailyInsightCard(phase: status.phase),
                    const SizedBox(height: 24),
                    const AdPlaceholderBanner(),
                  ],
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
  });

  final VoidCallback onQuickLog;
  final VoidCallback onOpenDetails;

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
      ],
    );
  }
}
