import 'package:flutter/material.dart';

import '../../../l10n/app_localizations.dart';
import '../../../models/enums.dart';
import '../../../theme/app_theme.dart';
import '../../../theme/log_icons.dart';
import '../../../widgets/option_chip.dart';

/// Single-select mood chips. Labels are descriptive, not evaluative — there
/// is no "good day"/"bad day" framing anywhere in this list.
class MoodSelector extends StatelessWidget {
  const MoodSelector({super.key, required this.value, required this.onChanged});

  final Mood? value;
  final ValueChanged<Mood?> onChanged;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final labels = <Mood, String>{
      Mood.calm: l10n.moodCalm,
      Mood.anxious: l10n.moodAnxious,
      Mood.irritable: l10n.moodIrritable,
      Mood.low: l10n.moodLow,
      Mood.energetic: l10n.moodEnergetic,
      Mood.happy: l10n.moodHappy,
      Mood.content: l10n.moodContent,
      Mood.sad: l10n.moodSad,
      Mood.depressed: l10n.moodDepressed,
      Mood.emotional: l10n.moodEmotional,
    };

    return OptionChipWrap(
      children: [
        for (final mood in Mood.values)
          OptionChip(
            icon: LogIcons.mood(mood),
            label: labels[mood]!,
            selected: value == mood,
            tint: AppPalette.skySoft,
            ink: AppPalette.skySoftText,
            onTap: () => onChanged(value == mood ? null : mood),
          ),
      ],
    );
  }
}
