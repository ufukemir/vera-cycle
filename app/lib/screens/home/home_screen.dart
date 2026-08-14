import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../l10n/app_localizations.dart';
import '../../state/app_preferences.dart';
import '../../state/cycle_controller.dart';
import '../../services/pregnancy_info.dart';
import '../../util/day.dart';
import '../../widgets/illustrations.dart';
import '../day_log/day_log_screen.dart';
import 'widgets/ad_placeholder_banner.dart';
import 'widgets/cycle_day_badge.dart';
import 'widgets/cycle_ring.dart';
import 'widgets/daily_insight_card.dart';
import 'widgets/period_started_button.dart';
import 'widgets/phase_timeline_bar.dart';
import 'widgets/pregnancy_card.dart';
import 'widgets/prediction_range_card.dart';
import 'widgets/quick_log_sheet.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final controller = context.watch<CycleController>();
    final prefs = context.watch<AppPreferences>();
    final status = controller.todayStatus;
    final prediction = controller.prediction;
    // The ring's scale is purely decorative framing, so falling back to the
    // user's own declared estimate (Settings → Prediction settings) is fine
    // even though `PredictionRangeCard` would never treat that estimate as a
    // real prediction — see CycleRing's doc comment.
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

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.appTitle),
        actions: [
          IconButton(
            tooltip: l10n.homeOpenTodayLog,
            icon: const Icon(Icons.edit_note_outlined),
            onPressed: () => Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => DayLogScreen(date: today())),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const SizedBox(height: 8),
              if (pregnancyInfo != null) ...[
                PregnancyCard(info: pregnancyInfo),
                const SizedBox(height: 24),
                DailyInsightCard(phase: status.phase),
                const SizedBox(height: 24),
                const AdPlaceholderBanner(),
              ] else ...[
              DoodleFrame(
                child: Stack(
                  clipBehavior: Clip.none,
                  alignment: Alignment.center,
                  children: [
                    CycleRing(
                      cycleDay: status.cycleDay,
                      cycleLength: ringLength,
                      child: CycleDayBadge(
                          cycleDay: status.cycleDay, phase: status.phase),
                    ),
                    Positioned(
                      right: -18,
                      bottom: -6,
                      child: MascotAvatar(mascot: prefs.mascot),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              PhaseTimelineBar(
                status: status,
                cycleLength: ringLength,
                periodLength: prefs.estimatedPeriodLengthDays,
              ),
              if (daysToWindow != null) ...[
                const SizedBox(height: 10),
                Text(
                  l10n.homeWindowCountdown(daysToWindow),
                  style: Theme.of(context).textTheme.bodyMedium,
                  textAlign: TextAlign.center,
                ),
              ],
              if (daysToOvulation != null) ...[
                const SizedBox(height: 4),
                Text(
                  l10n.homeOvulationCountdown(daysToOvulation),
                  style: Theme.of(context).textTheme.bodySmall,
                  textAlign: TextAlign.center,
                ),
              ],
              const SizedBox(height: 20),
              OutlinedButton.icon(
                onPressed: () => showQuickLogSheet(context),
                icon: const Icon(Icons.add_reaction_outlined),
                label: Text(l10n.homeQuickLogTitle),
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
              const SizedBox(height: 20),
              DailyInsightCard(phase: status.phase),
              const SizedBox(height: 24),
              const PeriodStartedButton(),
              const SizedBox(height: 24),
              const AdPlaceholderBanner(),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
