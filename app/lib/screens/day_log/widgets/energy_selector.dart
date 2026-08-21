import 'package:flutter/material.dart';

import '../../../l10n/app_localizations.dart';
import '../../../models/enums.dart';
import '../../../theme/app_theme.dart';
import '../../../theme/log_icons.dart';
import '../../../widgets/option_chip.dart';

/// Single-select energy chips. Deliberately separate from [MoodSelector] —
/// see [EnergyLevel].
class EnergySelector extends StatelessWidget {
  const EnergySelector({
    super.key,
    required this.value,
    required this.onChanged,
  });

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

    return OptionChipWrap(
      children: [
        for (final level in EnergyLevel.values)
          OptionChip(
            icon: LogIcons.energy(level),
            label: labels[level]!,
            selected: value == level,
            tint: AppPalette.goldSoft,
            ink: AppPalette.goldSoftText,
            onTap: () => onChanged(value == level ? null : level),
          ),
      ],
    );
  }
}
