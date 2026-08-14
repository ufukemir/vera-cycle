import 'package:flutter/material.dart';

import '../../../l10n/app_localizations.dart';
import '../../../models/enums.dart';

/// Multi-select symptom chips — purely descriptive labels, never framed as a
/// severity score, per CLAUDE.md's "not a medical diagnostic device"
/// principle.
class SymptomMultiselect extends StatelessWidget {
  const SymptomMultiselect({super.key, required this.value, required this.onChanged});

  final Set<Symptom> value;
  final ValueChanged<Set<Symptom>> onChanged;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final labels = <Symptom, String>{
      Symptom.cramps: l10n.symptomCramps,
      Symptom.headache: l10n.symptomHeadache,
      Symptom.bloating: l10n.symptomBloating,
      Symptom.breastTenderness: l10n.symptomBreastTenderness,
      Symptom.acne: l10n.symptomAcne,
      Symptom.fatigue: l10n.symptomFatigue,
      Symptom.nausea: l10n.symptomNausea,
      Symptom.backPain: l10n.symptomBackPain,
      Symptom.appetiteChange: l10n.symptomAppetiteChange,
      Symptom.sleepTrouble: l10n.symptomSleepTrouble,
      Symptom.pelvicPain: l10n.symptomPelvicPain,
      Symptom.dizziness: l10n.symptomDizziness,
    };

    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: [
        for (final symptom in Symptom.values)
          FilterChip(
            label: Text(labels[symptom]!),
            selected: value.contains(symptom),
            onSelected: (selected) {
              final next = Set<Symptom>.of(value);
              selected ? next.add(symptom) : next.remove(symptom);
              onChanged(next);
            },
          ),
      ],
    );
  }
}
