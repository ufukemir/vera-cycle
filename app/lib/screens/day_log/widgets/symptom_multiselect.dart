import 'package:flutter/material.dart';

import '../../../l10n/app_localizations.dart';
import '../../../l10n/enum_labels.dart';
import '../../../models/enums.dart';
import '../../../theme/app_theme.dart';
import '../../../theme/log_icons.dart';
import '../../../widgets/option_chip.dart';

/// Multi-select symptom chips — purely descriptive labels, never framed as a
/// severity score, per CLAUDE.md's "not a medical diagnostic device"
/// principle.
///
/// Grouped under [SymptomGroup] headings rather than one long [Wrap]: at 12
/// symptoms a flat list was still scannable, but 30 in reading order asks
/// someone to read the whole list to find "shoulder pain." A heading that
/// says "body" lets the eye skip straight past "head" and "abdomen."
class SymptomMultiselect extends StatelessWidget {
  const SymptomMultiselect({
    super.key,
    required this.value,
    required this.onChanged,
  });

  final Set<Symptom> value;
  final ValueChanged<Set<Symptom>> onChanged;

  /// Selected items first, otherwise original order preserved — a manual
  /// partition rather than [List.sort], which Dart does not guarantee is
  /// stable and would otherwise reshuffle same-state chips on every tap.
  List<Symptom> _selectedFirst(List<Symptom> symptoms) => [
    ...symptoms.where(value.contains),
    ...symptoms.where((s) => !value.contains(s)),
  ];

  String _groupLabel(AppLocalizations l10n, SymptomGroup group) =>
      switch (group) {
        SymptomGroup.head => l10n.symptomGroupHead,
        SymptomGroup.body => l10n.symptomGroupBody,
        SymptomGroup.abdomen => l10n.symptomGroupAbdomen,
        SymptomGroup.general => l10n.symptomGroupGeneral,
        SymptomGroup.cognitive => l10n.symptomGroupCognitive,
      };

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    final bySymptomGroup = <SymptomGroup, List<Symptom>>{
      for (final group in SymptomGroup.values) group: [],
    };
    for (final symptom in Symptom.values) {
      bySymptomGroup[symptomGroup(symptom)]!.add(symptom);
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (final group in SymptomGroup.values) ...[
          Padding(
            padding: const EdgeInsets.only(bottom: 6),
            child: Text(
              _groupLabel(l10n, group),
              style: theme.textTheme.labelMedium?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 14),
            child: ExpandableOptionChipWrap(
              collapsedCount: 5,
              children: [
                for (final symptom in _selectedFirst(bySymptomGroup[group]!))
                  OptionChip(
                    icon: LogIcons.symptom(symptom),
                    label: symptomLabel(l10n, symptom),
                    selected: value.contains(symptom),
                    tint: AppPalette.lavenderSoft,
                    ink: AppPalette.lavenderSoftText,
                    onTap: () {
                      final next = Set<Symptom>.of(value);
                      value.contains(symptom)
                          ? next.remove(symptom)
                          : next.add(symptom);
                      onChanged(next);
                    },
                  ),
              ],
            ),
          ),
        ],
      ],
    );
  }
}
