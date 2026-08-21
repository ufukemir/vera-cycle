import 'package:flutter/material.dart';

import '../../../l10n/app_localizations.dart';
import '../../../models/enums.dart';
import '../../../theme/app_theme.dart';
import '../../../theme/log_icons.dart';
import '../../../widgets/option_chip.dart';

/// Multi-select skin & hair chips — descriptive observations, never a
/// dermatology diagnosis (see [SkinHairSymptom]).
class SkinHairMultiselect extends StatelessWidget {
  const SkinHairMultiselect({
    super.key,
    required this.value,
    required this.onChanged,
  });

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

    return OptionChipWrap(
      children: [
        for (final item in SkinHairSymptom.values)
          OptionChip(
            icon: LogIcons.skinHair(item),
            label: labels[item]!,
            selected: value.contains(item),
            tint: AppPalette.mintSoft,
            ink: AppPalette.mintSoftText,
            onTap: () {
              final next = Set<SkinHairSymptom>.of(value);
              value.contains(item) ? next.remove(item) : next.add(item);
              onChanged(next);
            },
          ),
      ],
    );
  }
}
