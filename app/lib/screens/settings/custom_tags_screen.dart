import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../l10n/app_localizations.dart';
import '../../state/cycle_controller.dart';

/// Rename or remove the trackers the user invented.
///
/// Both operations rewrite history — a tag exists only because days carry
/// it — so the delete confirmation says exactly that instead of a generic
/// "are you sure?".
class CustomTagsScreen extends StatelessWidget {
  const CustomTagsScreen({super.key});

  Future<void> _rename(BuildContext context, String tag) async {
    final l10n = AppLocalizations.of(context)!;
    final controller = TextEditingController(text: tag);
    final cycles = context.read<CycleController>();

    final String? next;
    try {
      next = await showDialog<String>(
        context: context,
        builder: (dialogContext) => AlertDialog(
          title: Text(l10n.customTagRenameTitle),
          content: TextField(
            controller: controller,
            autofocus: true,
            maxLength: 30,
            textCapitalization: TextCapitalization.sentences,
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

    final trimmed = next?.trim() ?? '';
    if (trimmed.isEmpty || trimmed == tag) return;
    await cycles.renameCustomTag(tag, trimmed);
  }

  Future<void> _delete(BuildContext context, String tag) async {
    final l10n = AppLocalizations.of(context)!;
    final cycles = context.read<CycleController>();

    final confirmed = await showDialog<bool>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: Text(l10n.customTagDeleteTitle),
        content: Text(l10n.customTagDeleteBody),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext, false),
            child: Text(
              MaterialLocalizations.of(dialogContext).cancelButtonLabel,
            ),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(dialogContext, true),
            child: Text(l10n.actionDelete),
          ),
        ],
      ),
    );

    if (confirmed == true) await cycles.deleteCustomTag(tag);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final tags = context.watch<CycleController>().customTags;

    return Scaffold(
      appBar: AppBar(title: Text(l10n.customTagManageEntry)),
      body: SafeArea(
        child: tags.isEmpty
            ? Center(
                child: Padding(
                  padding: const EdgeInsets.all(32),
                  child: Text(
                    l10n.customTagEmpty,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
              )
            : ListView(
                children: [
                  for (final tag in tags)
                    ListTile(
                      title: Text(tag),
                      onTap: () => _rename(context, tag),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete_outline),
                        onPressed: () => _delete(context, tag),
                      ),
                    ),
                ],
              ),
      ),
    );
  }
}
