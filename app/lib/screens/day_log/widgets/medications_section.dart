import 'package:flutter/material.dart';

import '../../../l10n/app_localizations.dart';

/// Free-text medication names for the day — a list, not a structured drug
/// database (no third-party data source is allowed in, see CLAUDE.md).
class MedicationsSection extends StatelessWidget {
  const MedicationsSection({super.key, required this.value, required this.onChanged});

  final List<String> value;
  final ValueChanged<List<String>> onChanged;

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
            child: Text(MaterialLocalizations.of(dialogContext).cancelButtonLabel),
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(l10n.dayLogMedicationsLabel, style: Theme.of(context).textTheme.bodyMedium),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [
            for (var i = 0; i < value.length; i++)
              InputChip(
                label: Text(value[i]),
                onDeleted: () => _remove(i),
              ),
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
