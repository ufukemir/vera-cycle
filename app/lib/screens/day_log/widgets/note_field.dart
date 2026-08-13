import 'package:flutter/material.dart';

import '../../../l10n/app_localizations.dart';

/// Free-text note. The caller owns debouncing the save — this widget just
/// reports every keystroke.
class NoteField extends StatelessWidget {
  const NoteField({super.key, required this.controller, required this.onChanged});

  final TextEditingController controller;
  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return TextField(
      controller: controller,
      maxLines: 4,
      decoration: InputDecoration(
        labelText: l10n.dayLogNoteLabel,
        hintText: l10n.dayLogNoteHint,
        border: const OutlineInputBorder(),
      ),
      onChanged: onChanged,
    );
  }
}
