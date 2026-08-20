import 'package:flutter/material.dart';

import '../../../l10n/app_localizations.dart';
import '../../../models/enums.dart';
import '../../../theme/app_theme.dart';
import '../../../theme/log_icons.dart';
import '../../../widgets/option_chip.dart';

/// Single-select flow chips, including an explicit "None" option — clearing a
/// mistaken entry needs to be as easy as making one.
class FlowSelector extends StatelessWidget {
  const FlowSelector({super.key, required this.value, required this.onChanged});

  final FlowIntensity? value;
  final ValueChanged<FlowIntensity?> onChanged;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final options = <FlowIntensity?, String>{
      null: l10n.flowNone,
      FlowIntensity.spotting: l10n.flowSpotting,
      FlowIntensity.light: l10n.flowLight,
      FlowIntensity.medium: l10n.flowMedium,
      FlowIntensity.heavy: l10n.flowHeavy,
    };

    return OptionChipWrap(
      children: [
        for (final entry in options.entries)
          OptionChip(
            icon: LogIcons.flow(entry.key),
            label: entry.value,
            selected: value == entry.key,
            tint: AppPalette.roseSoft,
            ink: AppPalette.roseSoftText,
            onTap: () => onChanged(entry.key),
          ),
      ],
    );
  }
}
