import 'package:flutter/material.dart';

import '../../../l10n/app_localizations.dart';
import '../../../l10n/enum_labels.dart';
import '../../../models/enums.dart';
import '../../../theme/app_theme.dart';
import '../../../theme/log_icons.dart';
import '../../../widgets/option_chip.dart';

/// The day's medication, in the two halves people actually keep it in.
///
/// It was one free-text list, which meant the most-tracked medication of
/// all — contraception, taken on the same schedule by the same name every
/// single day — had to be typed in by hand each time. Anyone using it gave
/// up after a week, and what was left was a list nobody filled.
///
/// So: tappable birth-control entries on top, free text underneath for
/// everything else. Still no structured drug database behind the free-text
/// half — no third-party data source is allowed in (CLAUDE.md).
class MedicationsSection extends StatelessWidget {
  const MedicationsSection({
    super.key,
    required this.value,
    required this.onChanged,
    required this.birthControl,
    required this.onBirthControlChanged,
  });

  final List<String> value;
  final ValueChanged<List<String>> onChanged;
  final Set<BirthControlEntry> birthControl;
  final ValueChanged<Set<BirthControlEntry>> onBirthControlChanged;

  /// The three pill entries answer one question, so picking one replaces
  /// whichever was there. The methods below them do not: someone can be on
  /// a patch and have an IUD fitted the same day.
  static const _pillStates = {
    BirthControlEntry.pillTaken,
    BirthControlEntry.pillLate,
    BirthControlEntry.pillMissed,
  };

  void _toggleBirthControl(BirthControlEntry entry) {
    final next = Set<BirthControlEntry>.of(birthControl);
    if (next.contains(entry)) {
      next.remove(entry);
    } else {
      if (_pillStates.contains(entry)) next.removeAll(_pillStates);
      next.add(entry);
    }
    onBirthControlChanged(next);
  }

  Future<void> _add(BuildContext context) async {
    final controller = TextEditingController();
    final l10n = AppLocalizations.of(context)!;

    final name = await showDialog<String>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: Text(l10n.dayLogAddMedication),
        content: TextField(
          controller: controller,
          autofocus: true,
          decoration: InputDecoration(hintText: l10n.dayLogMedicationNameHint),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext),
            child: Text(
              MaterialLocalizations.of(dialogContext).cancelButtonLabel,
            ),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(dialogContext, controller.text),
            child: Text(MaterialLocalizations.of(dialogContext).okButtonLabel),
          ),
        ],
      ),
    );

    final trimmed = name?.trim();
    if (trimmed == null || trimmed.isEmpty) return;
    onChanged([...value, trimmed]);
  }

  void _remove(int index) {
    final next = [...value]..removeAt(index);
    onChanged(next);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    // Section heading comes from the parent's category card; these two are
    // the halves inside it.
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          l10n.dayLogBirthControlLabel,
          style: theme.textTheme.labelLarge?.copyWith(
            color: theme.colorScheme.onSurfaceVariant,
          ),
        ),
        const SizedBox(height: 8),
        OptionChipWrap(
          children: [
            for (final entry in BirthControlEntry.values)
              OptionChip(
                icon: LogIcons.birthControl(entry),
                label: birthControlLabel(l10n, entry),
                selected: birthControl.contains(entry),
                tint: AppPalette.lavenderSoft,
                ink: AppPalette.lavenderSoftText,
                onTap: () => _toggleBirthControl(entry),
              ),
          ],
        ),
        const SizedBox(height: 18),
        Text(
          l10n.dayLogOtherMedicationsLabel,
          style: theme.textTheme.labelLarge?.copyWith(
            color: theme.colorScheme.onSurfaceVariant,
          ),
        ),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [
            for (var i = 0; i < value.length; i++)
              InputChip(label: Text(value[i]), onDeleted: () => _remove(i)),
            ActionChip(
              avatar: const Icon(Icons.add, size: 18),
              label: Text(l10n.dayLogAddMedication),
              onPressed: () => _add(context),
            ),
          ],
        ),
      ],
    );
  }
}
