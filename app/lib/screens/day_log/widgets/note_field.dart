import 'package:flutter/material.dart';

import '../../../l10n/app_localizations.dart';
import '../../../theme/app_theme.dart';
import 'section_card.dart';

/// Free-text note. The caller owns debouncing the save — this widget just
/// reports every keystroke via [onChanged] and offers [onSave] as an
/// explicit, visible way to confirm and dismiss the keyboard, since the
/// app bar's "Saved" flash sits out of view behind the keyboard while
/// someone is mid-sentence here.
class NoteField extends StatefulWidget {
  const NoteField({
    super.key,
    required this.controller,
    required this.onChanged,
    required this.onSave,
  });

  final TextEditingController controller;
  final ValueChanged<String> onChanged;
  final VoidCallback onSave;

  @override
  State<NoteField> createState() => _NoteFieldState();
}

class _NoteFieldState extends State<NoteField> {
  final _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(_onFocusChanged);
  }

  void _onFocusChanged() => setState(() {});

  @override
  void dispose() {
    _focusNode.removeListener(_onFocusChanged);
    _focusNode.dispose();
    super.dispose();
  }

  void _save() {
    widget.onSave();
    _focusNode.unfocus();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);

    return DayLogSectionCard(
      icon: Icons.edit_note_outlined,
      title: l10n.dayLogNoteLabel,
      background: AppPalette.roseSoft,
      foreground: AppPalette.roseSoftText,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextField(
            controller: widget.controller,
            focusNode: _focusNode,
            maxLines: 4,
            minLines: 3,
            style: theme.textTheme.bodyMedium,
            decoration: InputDecoration(
              hintText: l10n.dayLogNoteHint,
              border: InputBorder.none,
              isCollapsed: true,
            ),
            onChanged: widget.onChanged,
          ),
          if (_focusNode.hasFocus) ...[
            const SizedBox(height: 10),
            Align(
              alignment: AlignmentDirectional.centerEnd,
              child: FilledButton.tonalIcon(
                onPressed: _save,
                icon: const Icon(Icons.check, size: 18),
                label: Text(l10n.actionSave),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
