import 'package:flutter/material.dart';

import '../../../l10n/app_localizations.dart';
import '../../../models/enums.dart';

/// Single-select energy chips. Deliberately separate from [MoodSelector] —
/// see [EnergyLevel].
class EnergySelector extends StatelessWidget {
  const EnergySelector({super.key, required this.value, required this.onChanged});

  final EnergyLevel? value;
  final ValueChanged<EnergyLevel?> onChanged;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final labels = <EnergyLevel, String>{
      EnergyLevel.low: l10n.energyLevelLow,
      EnergyLevel.medium: l10n.energyLevelMedium,
      EnergyLevel.high: l10n.energyLevelHigh,
      EnergyLevel.energetic: l10n.energyLevelEnergetic,
    };

    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: [
        for (final level in EnergyLevel.values)
          ChoiceChip(
            label: Text(labels[level]!),
            selected: value == level,
            onSelected: (selected) => onChanged(selected ? level : null),
          ),
      ],
    );
  }
}
