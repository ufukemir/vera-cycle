import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../l10n/app_localizations.dart';
import '../../../models/day_log.dart';
import '../../../models/enums.dart';
import '../../../state/cycle_controller.dart';
import '../../day_log/day_log_screen.dart';
import '../../day_log/widgets/fertility_status_banner.dart';

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
            Text(DateFormat.yMMMMEEEEd(locale).format(date),
                style: theme.textTheme.titleLarge),
            const SizedBox(height: 12),
            FertilityStatusBanner(
                date: date, status: controller.statusOn(date)),
            if (log == null || log.isEmpty)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: Text(l10n.calendarDayNothingLogged,
                    style: theme.textTheme.bodyMedium),
              )
            else
              ..._summaryRows(context, l10n, log),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: FilledButton.icon(
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (_) => DayLogScreen(date: date)));
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
      BuildContext context, AppLocalizations l10n, DayLog log) {
    final rows = <Widget>[];

    void add(IconData icon, String label, String value) {
      rows.add(Padding(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, size: 18, color: Theme.of(context).colorScheme.primary),
            const SizedBox(width: 10),
            SizedBox(
              width: 96,
              child: Text(label,
                  style: Theme.of(context).textTheme.labelMedium),
            ),
            Expanded(
              child: Text(value,
                  style: Theme.of(context).textTheme.bodyMedium),
            ),
          ],
        ),
      ));
    }

    if (log.flow != null) {
      add(Icons.water_drop_outlined, l10n.dayLogFlowLabel,
          _flowLabel(l10n, log.flow!));
    }
    if (log.symptoms.isNotEmpty) {
      add(Icons.healing_outlined, l10n.dayLogSymptomsLabel,
          log.symptoms.map((s) => _symptomLabel(l10n, s)).join(', '));
    }
    if (log.mood != null) {
      add(Icons.sentiment_satisfied_outlined, l10n.dayLogMoodLabel,
          _moodLabel(l10n, log.mood!));
    }
    if (log.waterIntakeMl != null) {
      add(Icons.local_drink_outlined, l10n.dayLogWaterLabel,
          '${log.waterIntakeMl}ml');
    }
    if (log.weightKg != null) {
      add(Icons.monitor_weight_outlined, l10n.dayLogWeightLabel,
          '${log.weightKg!.toStringAsFixed(1)}kg');
    }
    if (log.note != null && log.note!.trim().isNotEmpty) {
      add(Icons.sticky_note_2_outlined, l10n.dayLogNoteLabel, log.note!);
    }
    return rows;
  }

  String _flowLabel(AppLocalizations l10n, FlowIntensity f) => switch (f) {
        FlowIntensity.spotting => l10n.flowSpotting,
        FlowIntensity.light => l10n.flowLight,
        FlowIntensity.medium => l10n.flowMedium,
        FlowIntensity.heavy => l10n.flowHeavy,
      };

  String _moodLabel(AppLocalizations l10n, Mood m) => switch (m) {
        Mood.calm => l10n.moodCalm,
        Mood.anxious => l10n.moodAnxious,
        Mood.irritable => l10n.moodIrritable,
        Mood.low => l10n.moodLow,
        Mood.energetic => l10n.moodEnergetic,
        Mood.happy => l10n.moodHappy,
        Mood.content => l10n.moodContent,
        Mood.sad => l10n.moodSad,
        Mood.depressed => l10n.moodDepressed,
        Mood.emotional => l10n.moodEmotional,
      };

  String _symptomLabel(AppLocalizations l10n, Symptom s) => switch (s) {
        Symptom.cramps => l10n.symptomCramps,
        Symptom.headache => l10n.symptomHeadache,
        Symptom.bloating => l10n.symptomBloating,
        Symptom.breastTenderness => l10n.symptomBreastTenderness,
        Symptom.acne => l10n.symptomAcne,
        Symptom.fatigue => l10n.symptomFatigue,
        Symptom.nausea => l10n.symptomNausea,
        Symptom.backPain => l10n.symptomBackPain,
        Symptom.appetiteChange => l10n.symptomAppetiteChange,
        Symptom.sleepTrouble => l10n.symptomSleepTrouble,
        Symptom.pelvicPain => l10n.symptomPelvicPain,
        Symptom.dizziness => l10n.symptomDizziness,
      };
}
