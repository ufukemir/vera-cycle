import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../l10n/app_localizations.dart';
import '../../state/cycle_controller.dart';
import '../../util/day.dart';
import '../day_log/day_log_screen.dart';
import 'widgets/cycle_day_badge.dart';
import 'widgets/period_started_button.dart';
import 'widgets/prediction_range_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final controller = context.watch<CycleController>();
    final status = controller.todayStatus;

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
              CycleDayBadge(cycleDay: status.cycleDay, phase: status.phase),
              const SizedBox(height: 24),
              PredictionRangeCard(prediction: controller.prediction),
              if (status.hasFertileEstimate) ...[
                const SizedBox(height: 12),
                Text(
                  l10n.homeFertileWindowDisclaimer,
                  style: Theme.of(context).textTheme.bodySmall,
                  textAlign: TextAlign.center,
                ),
              ],
              const SizedBox(height: 24),
              const PeriodStartedButton(),
            ],
          ),
        ),
      ),
    );
  }
}
