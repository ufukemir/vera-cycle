import 'package:flutter/material.dart';

import '../../../l10n/app_localizations.dart';
import '../../../l10n/enum_labels.dart';
import '../../../models/enums.dart';
import '../../../theme/app_theme.dart';
import '../../../theme/log_icons.dart';
import '../../../widgets/option_chip.dart';

/// Single-select mood chips. Labels are descriptive, not evaluative — there
/// is no "good day"/"bad day" framing anywhere in this list. Grown from 10
/// to 26; unlike [SymptomMultiselect] this stays one flat [Wrap] rather than
/// grouped sections — a feeling doesn't sort into "head" or "abdomen," and
/// forcing a taxonomy onto 26 emotions would invent categories that mean
/// nothing to the person scanning them.
class MoodSelector extends StatelessWidget {
  const MoodSelector({super.key, required this.value, required this.onChanged});

  final Mood? value;
  final ValueChanged<Mood?> onChanged;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    // Selected mood first, so it never lands in the collapsed-away tail —
    // a manual partition, not List.sort, which Dart doesn't guarantee stable.
    final moods = [
      ...Mood.values.where((m) => m == value),
      ...Mood.values.where((m) => m != value),
    ];

    return ExpandableOptionChipWrap(
      collapsedCount: 9,
      children: [
        for (final mood in moods)
          OptionChip(
            icon: LogIcons.mood(mood),
            label: moodLabel(l10n, mood),
            selected: value == mood,
            tint: AppPalette.skySoft,
            ink: AppPalette.skySoftText,
            onTap: () => onChanged(value == mood ? null : mood),
          ),
      ],
    );
  }
}
