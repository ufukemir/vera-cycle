import 'package:flutter/material.dart';

import '../../../l10n/app_localizations.dart';
import '../../../models/enums.dart';

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
    };

    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: [
        for (final mood in Mood.values)
          ChoiceChip(
            label: Text(labels[mood]!),
            selected: value == mood,
            onSelected: (selected) => onChanged(selected ? mood : null),
          ),
      ],
    );
  }
}
