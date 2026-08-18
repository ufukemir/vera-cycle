import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../l10n/app_localizations.dart';
import '../../../l10n/enum_labels.dart';
import '../../../models/day_log.dart';
import '../../../state/cycle_controller.dart';
import '../../day_log/day_log_screen.dart';
import '../../day_log/widgets/fertility_status_banner.dart';
import '../../day_log/widgets/quick_stats_row.dart';

/// A peek at one day before committing to the full editor — tapping a
/// calendar day used to jump straight into [DayLogScreen], which is a lot
/// of screen for "what did I log on the 12th?".
Future<void> showDayDetailSheet(BuildContext context, DateTime date) {
  return showModalBottomSheet<void>(
    context: context,
    showDragHandle: true,
    builder: (_) => _DayDetailSheet(date: date),
  );
}

class _DayDetailSheet extends StatelessWidget {
  const _DayDetailSheet({required this.date});

  final DateTime date;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final controller = context.watch<CycleController>();
    final log = controller.logFor(date);
    final locale = Localizations.localeOf(context).toString();
    final theme = Theme.of(context);

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              DateFormat.yMMMMEEEEd(locale).format(date),
              style: theme.textTheme.titleLarge,
            ),
            const SizedBox(height: 12),
            FertilityStatusBanner(
              date: date,
              status: controller.statusOn(date),
            ),
            if (log == null || log.isEmpty)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: Text(
                  l10n.calendarDayNothingLogged,
                  style: theme.textTheme.bodyMedium,
                ),
              )
            else
              ..._summaryRows(context, l10n, log),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: FilledButton.icon(
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => DayLogScreen(date: date)),
                  );
                },
                icon: const Icon(Icons.edit_note_outlined),
                label: Text(l10n.calendarDayOpenLog),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _summaryRows(
    BuildContext context,
    AppLocalizations l10n,
    DayLog log,
  ) {
    final rows = <Widget>[];

    void add(IconData icon, String label, String value) {
      rows.add(
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                icon,
                size: 18,
                color: Theme.of(context).colorScheme.primary,
              ),
              const SizedBox(width: 10),
              SizedBox(
                width: 96,
                child: Text(
                  label,
                  style: Theme.of(context).textTheme.labelMedium,
                ),
              ),
              Expanded(
                child: Text(
                  value,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
            ],
          ),
        ),
      );
    }

    if (log.flow != null) {
      add(
        Icons.water_drop_outlined,
        l10n.dayLogFlowLabel,
        flowLabel(l10n, log.flow!),
      );
    }
    if (log.symptoms.isNotEmpty) {
      add(
        Icons.healing_outlined,
        l10n.dayLogSymptomsLabel,
        log.symptoms.map((s) => symptomLabel(l10n, s)).join(', '),
      );
    }
    if (log.mood != null) {
      add(
        Icons.sentiment_satisfied_outlined,
        l10n.dayLogMoodLabel,
        moodLabel(l10n, log.mood!),
      );
    }
    if (log.waterIntakeMl != null) {
      add(
        Icons.local_drink_outlined,
        l10n.dayLogWaterLabel,
        '${log.waterIntakeMl}${l10n.unitMilliliters}',
      );
    }
    if (log.sleepMinutes != null) {
      add(
        Icons.bedtime_outlined,
        l10n.dayLogSleepLabel,
        QuickStatsRow.formatSleep(l10n, log.sleepMinutes!),
      );
    }
    if (log.weightKg != null) {
      add(
        Icons.monitor_weight_outlined,
        l10n.dayLogWeightLabel,
        '${log.weightKg!.toStringAsFixed(1)}${l10n.unitKilograms}',
      );
    }
    if (log.note != null && log.note!.trim().isNotEmpty) {
      add(Icons.sticky_note_2_outlined, l10n.dayLogNoteLabel, log.note!);
    }
    return rows;
  }
}
