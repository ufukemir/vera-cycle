import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../l10n/app_localizations.dart';
import '../../../models/day_log.dart';
import '../../../models/enums.dart';
import '../../../state/cycle_controller.dart';
import '../../../util/day.dart';

/// The reference app's "how does your body feel today?" bottom sheet:
/// today's flow + the most common symptoms, saved in one tap without
/// leaving Home. Anything richer lives one tap away in [DayLogScreen].
Future<void> showQuickLogSheet(BuildContext context) {
  return showModalBottomSheet<void>(
    context: context,
    showDragHandle: true,
    isScrollControlled: true,
    builder: (_) => const _QuickLogSheet(),
  );
}

class _QuickLogSheet extends StatefulWidget {
  const _QuickLogSheet();

  @override
  State<_QuickLogSheet> createState() => _QuickLogSheetState();
}

class _QuickLogSheetState extends State<_QuickLogSheet> {
  static const _quickSymptoms = [
    Symptom.cramps,
    Symptom.headache,
    Symptom.bloating,
    Symptom.fatigue,
    Symptom.backPain,
  ];

  late DayLog _draft;

  @override
  void initState() {
    super.initState();
    _draft = context.read<CycleController>().logFor(today()) ??
        DayLog(date: today());
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final flowLabels = <FlowIntensity, String>{
      FlowIntensity.spotting: l10n.flowSpotting,
      FlowIntensity.light: l10n.flowLight,
      FlowIntensity.medium: l10n.flowMedium,
      FlowIntensity.heavy: l10n.flowHeavy,
    };
    final symptomLabels = <Symptom, String>{
      Symptom.cramps: l10n.symptomCramps,
      Symptom.headache: l10n.symptomHeadache,
      Symptom.bloating: l10n.symptomBloating,
      Symptom.fatigue: l10n.symptomFatigue,
      Symptom.backPain: l10n.symptomBackPain,
    };

    return SafeArea(
      child: Padding(
        padding: EdgeInsets.fromLTRB(
            20, 0, 20, 20 + MediaQuery.viewInsetsOf(context).bottom),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(l10n.homeQuickLogTitle,
                style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 16),
            Text(l10n.dayLogFlowLabel,
                style: Theme.of(context).textTheme.titleSmall),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                for (final entry in flowLabels.entries)
                  ChoiceChip(
                    label: Text(entry.value),
                    selected: _draft.flow == entry.key,
                    onSelected: (selected) => setState(() => _draft =
                        _draft.copyWith(
                            flow: selected ? entry.key : null,
                            clearFlow: !selected)),
                  ),
              ],
            ),
            const SizedBox(height: 16),
            Text(l10n.dayLogSymptomsLabel,
                style: Theme.of(context).textTheme.titleSmall),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                for (final symptom in _quickSymptoms)
                  FilterChip(
                    label: Text(symptomLabels[symptom]!),
                    selected: _draft.symptoms.contains(symptom),
                    onSelected: (selected) {
                      final next = Set<Symptom>.of(_draft.symptoms);
                      selected ? next.add(symptom) : next.remove(symptom);
                      setState(() => _draft = _draft.copyWith(symptoms: next));
                    },
                  ),
              ],
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: FilledButton(
                onPressed: () {
                  context.read<CycleController>().upsertDay(_draft);
                  Navigator.of(context).pop();
                },
                child: Text(l10n.actionSave),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
