import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../l10n/app_localizations.dart';
import '../../../state/cycle_controller.dart';
import '../../../widgets/premium_lock.dart';

/// Premium: trackers the user names themselves.
///
/// The available tags are whatever they've used before ([CycleController.
/// customTags]) plus whatever they add here — there is no separate
/// definitions list to manage, so adding a tracker is one field and one tap.
class CustomTagsSection extends StatelessWidget {
  const CustomTagsSection({
    super.key,
    required this.selected,
    required this.onChanged,
  });

  final Set<String> selected;
  final ValueChanged<Set<String>> onChanged;

  Future<void> _addTag(BuildContext context) async {
    final l10n = AppLocalizations.of(context)!;
    final controller = TextEditingController();

    // Disposed in the finally below: the dialog reads .text before it pops,
    // so the controller is safe to release as soon as the await returns.
    final String? name;
    try {
      name = await showDialog<String>(
        context: context,
        builder: (dialogContext) => AlertDialog(
          title: Text(l10n.customTagDialogTitle),
          content: TextField(
            controller: controller,
            autofocus: true,
            textCapitalization: TextCapitalization.sentences,
            maxLength: 30,
            decoration: InputDecoration(hintText: l10n.customTagDialogHint),
            onSubmitted: (v) => Navigator.pop(dialogContext, v),
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
              child: Text(
                MaterialLocalizations.of(dialogContext).okButtonLabel,
              ),
            ),
          ],
        ),
      );
    } finally {
      controller.dispose();
    }

    final trimmed = name?.trim() ?? '';
    if (trimmed.isEmpty) return;
    onChanged({...selected, trimmed});
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    // Known tags plus any on this day, so a tag stays visible while it's
    // still only on an unsaved day.
    final known = <String>{
      ...context.watch<CycleController>().customTags,
      ...selected,
    }.toList()..sort((a, b) => a.toLowerCase().compareTo(b.toLowerCase()));

    final theme = Theme.of(context);
    return PremiumLock(
      title: l10n.dayLogCustomTagsLabel,
      // Without Premium the user can no longer add or change tags, but the
      // ones they already recorded on this day stay visible and stay in
      // the day's record. Hiding them would make their own history
      // unreadable — a thing Premium must never do.
      lockedPreview: selected.isEmpty
          ? null
          : Wrap(
              spacing: 8,
              runSpacing: 4,
              children: [
                for (final tag in selected.toList()..sort())
                  Chip(label: Text(tag)),
              ],
            ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(l10n.dayLogCustomTagsLabel, style: theme.textTheme.titleMedium),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            runSpacing: 4,
            children: [
              for (final tag in known)
                FilterChip(
                  label: Text(tag),
                  selected: selected.contains(tag),
                  onSelected: (on) => onChanged(
                    on ? {...selected, tag} : ({...selected}..remove(tag)),
                  ),
                ),
              ActionChip(
                avatar: const Icon(Icons.add, size: 18),
                label: Text(l10n.customTagAddButton),
                onPressed: () => _addTag(context),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
