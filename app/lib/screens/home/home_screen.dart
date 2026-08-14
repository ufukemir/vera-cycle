import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../l10n/app_localizations.dart';
import '../../state/app_preferences.dart';
import '../../state/cycle_controller.dart';
import '../../util/day.dart';
import '../../widgets/illustrations.dart';
import '../day_log/day_log_screen.dart';
import 'widgets/ad_placeholder_banner.dart';
import 'widgets/cycle_day_badge.dart';
import 'widgets/cycle_ring.dart';
import 'widgets/daily_insight_card.dart';
import 'widgets/period_started_button.dart';
import 'widgets/prediction_range_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final controller = context.watch<CycleController>();
    final status = controller.todayStatus;
    final prediction = controller.prediction;
    // The ring's scale is purely decorative framing, so falling back to the
    // user's own declared estimate (Settings → Prediction settings) is fine
    // even though `PredictionRangeCard` would never treat that estimate as a
    // real prediction — see CycleRing's doc comment.
    final ringLength = prediction.meanLength?.round() ??
        context.watch<AppPreferences>().estimatedCycleLengthDays;

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
              DoodleFrame(
                child: CycleRing(
                  cycleDay: status.cycleDay,
                  cycleLength: ringLength,
                  child:
                      CycleDayBadge(cycleDay: status.cycleDay, phase: status.phase),
                ),
              ),
              const SizedBox(height: 28),
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
          ),
        ),
      ),
    );
  }
}
