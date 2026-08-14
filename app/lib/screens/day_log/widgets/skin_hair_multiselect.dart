import 'package:flutter/material.dart';

import '../../../l10n/app_localizations.dart';
import '../../../models/enums.dart';

/// Multi-select skin & hair chips — descriptive observations, never a
/// dermatology diagnosis (see [SkinHairSymptom]).
class SkinHairMultiselect extends StatelessWidget {
  const SkinHairMultiselect({super.key, required this.value, required this.onChanged});

  final Set<SkinHairSymptom> value;
  final ValueChanged<Set<SkinHairSymptom>> onChanged;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final labels = <SkinHairSymptom, String>{
      SkinHairSymptom.healthyGlow: l10n.skinHealthyGlow,
      SkinHairSymptom.skinRedness: l10n.skinRedness,
      SkinHairSymptom.skinDryness: l10n.skinDryness,
      SkinHairSymptom.skinOiliness: l10n.skinOiliness,
      SkinHairSymptom.goodHairDay: l10n.hairGoodDay,
      SkinHairSymptom.badHairDay: l10n.hairBadDay,
      SkinHairSymptom.hairLoss: l10n.hairLoss,
      SkinHairSymptom.oilyScalp: l10n.scalpOily,
    };

    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: [
        for (final item in SkinHairSymptom.values)
          FilterChip(
            label: Text(labels[item]!),
            selected: value.contains(item),
            onSelected: (selected) {
              final next = Set<SkinHairSymptom>.of(value);
              selected ? next.add(item) : next.remove(item);
              onChanged(next);
            },
          ),
      ],
    );
  }
}
