import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../l10n/app_localizations.dart';
import '../../models/custom_reminder.dart';
import '../../services/reminder_service.dart';
import '../../state/app_preferences.dart';

/// Premium: reminders on the user's own schedule, in their own words.
///
/// Scheduling and preferences are kept in step here rather than in
/// [AppPreferences]: a stored reminder that was never handed to the OS is
/// worse than no reminder, because the list says it is on.
class CustomRemindersScreen extends StatelessWidget {
  const CustomRemindersScreen({super.key});

  /// Hands one reminder to the OS, asking for notification permission
  /// first.
  ///
  /// Every built-in reminder toggle prompts before scheduling; these three
  /// call sites did not, so a user whose first ever reminder was a custom
  /// one got a row that said ON and a notification that could never
  /// appear — the exact failure this screen's doc comment forbids.
  static Future<void> _schedule(
    ReminderService reminders,
    AppLocalizations l10n, {
    required int notificationId,
    required TimeOfDay time,
    required String title,
  }) async {
    await reminders.requestPermission();
    await reminders.scheduleCustomDaily(
      notificationId: notificationId,
      time: time,
      title: title,
      channelName: l10n.customRemindersTitle,
    );
  }

  Future<void> _add(BuildContext context) async {
    final l10n = AppLocalizations.of(context)!;
    final result = await _promptForReminder(context, l10n: l10n);
    if (result == null || !context.mounted) return;

    final prefs = context.read<AppPreferences>();
    final reminders = context.read<ReminderService>();
    final created = await prefs.addCustomReminder(
      label: result.label,
      time: result.time,
    );
    await _schedule(
      reminders,
      l10n,
      notificationId: created.notificationId,
      time: result.time,
      title: created.label,
    );
  }

  Future<void> _edit(BuildContext context, CustomReminder reminder) async {
    final l10n = AppLocalizations.of(context)!;
    final result = await _promptForReminder(
      context,
      l10n: l10n,
      initialLabel: reminder.label,
      initialTime: TimeOfDay(hour: reminder.hour, minute: reminder.minute),
    );
    if (result == null || !context.mounted) return;

    final updated = reminder.copyWith(
      label: result.label,
      minuteOfDay: result.time.hour * 60 + result.time.minute,
    );
    final prefs = context.read<AppPreferences>();
    final reminders = context.read<ReminderService>();
    await prefs.updateCustomReminder(updated);
    if (updated.enabled) {
      await _schedule(
        reminders,
        l10n,
        notificationId: updated.notificationId,
        time: result.time,
        title: updated.label,
      );
    }
  }

  Future<void> _toggle(
    BuildContext context,
    CustomReminder reminder,
    bool enabled,
  ) async {
    final l10n = AppLocalizations.of(context)!;
    final prefs = context.read<AppPreferences>();
    final reminders = context.read<ReminderService>();
    await prefs.updateCustomReminder(reminder.copyWith(enabled: enabled));
    if (enabled) {
      await _schedule(
        reminders,
        l10n,
        notificationId: reminder.notificationId,
        time: TimeOfDay(hour: reminder.hour, minute: reminder.minute),
        title: reminder.label,
      );
    } else {
      await reminders.cancelId(reminder.notificationId);
    }
  }

  Future<void> _delete(BuildContext context, CustomReminder reminder) async {
    final prefs = context.read<AppPreferences>();
    final reminders = context.read<ReminderService>();
    // Remove the stored row FIRST. The Dismissible has already taken the
    // row out of the tree, so if the platform cancel throws (plugin init
    // failure — the very class of failure this screen was written after)
    // and the record survives, it reappears on the next rebuild and trips
    // "a dismissed Dismissible widget is still part of the tree".
    await prefs.removeCustomReminder(reminder.id);
    try {
      await reminders.cancelId(reminder.notificationId);
    } catch (_) {
      // Nothing useful to tell the user here: the reminder is gone from
      // their list either way, and reconcileCustomReminders() cancels the
      // orphaned OS notification on the next launch.
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final prefs = context.watch<AppPreferences>();
    final reminders = prefs.customReminders;

    return Scaffold(
      appBar: AppBar(title: Text(l10n.customRemindersTitle)),
      // Reachable without Premium so a lapsed user can still turn their own
      // reminders off and delete them; only *adding* a new one is the
      // Premium part.
      floatingActionButton: prefs.premiumActive
          ? FloatingActionButton.extended(
              onPressed: () => _add(context),
              icon: const Icon(Icons.add),
              label: Text(l10n.customRemindersAdd),
            )
          : null,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.only(bottom: 96),
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 4),
              child: Text(
                l10n.customReminderLockScreenNote,
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ),
            if (reminders.isEmpty)
              Padding(
                padding: const EdgeInsets.all(32),
                child: Text(
                  l10n.customRemindersEmpty,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
            for (final reminder in reminders)
              Dismissible(
                key: ValueKey(reminder.id),
                direction: DismissDirection.endToStart,
                background: Container(
                  alignment: AlignmentDirectional.centerEnd,
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  color: Theme.of(context).colorScheme.errorContainer,
                  // Icon-only swipe action: without this the only cue that
                  // the gesture deletes is visual.
                  child: Icon(
                    Icons.delete_outline,
                    semanticLabel: l10n.customReminderDelete,
                  ),
                ),
                onDismissed: (_) => _delete(context, reminder),
                child: SwitchListTile(
                  title: Text(reminder.label),
                  subtitle: Text(
                    TimeOfDay(
                      hour: reminder.hour,
                      minute: reminder.minute,
                    ).format(context),
                  ),
                  value: reminder.enabled,
                  onChanged: (v) => _toggle(context, reminder, v),
                  secondary: IconButton(
                    icon: const Icon(Icons.edit_outlined),
                    onPressed: () => _edit(context, reminder),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class _ReminderDraft {
  const _ReminderDraft({required this.label, required this.time});

  final String label;
  final TimeOfDay time;
}

Future<_ReminderDraft?> _promptForReminder(
  BuildContext context, {
  required AppLocalizations l10n,
  String? initialLabel,
  TimeOfDay? initialTime,
}) async {
  final controller = TextEditingController(text: initialLabel ?? '');
  var time = initialTime ?? const TimeOfDay(hour: 9, minute: 0);

  final String? label;
  try {
    label = await showDialog<String>(
      context: context,
      builder: (dialogContext) => StatefulBuilder(
        builder: (dialogContext, setState) => AlertDialog(
          title: Text(l10n.customRemindersAdd),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: controller,
                autofocus: true,
                maxLength: 40,
                textCapitalization: TextCapitalization.sentences,
                decoration: InputDecoration(
                  hintText: l10n.customReminderLabelHint,
                ),
              ),
              ListTile(
                contentPadding: EdgeInsets.zero,
                title: Text(time.format(dialogContext)),
                trailing: const Icon(Icons.access_time),
                onTap: () async {
                  final picked = await showTimePicker(
                    context: dialogContext,
                    initialTime: time,
                  );
                  if (picked != null) setState(() => time = picked);
                },
              ),
            ],
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
      ),
    );
  } finally {
    controller.dispose();
  }

  final trimmed = label?.trim() ?? '';
  if (trimmed.isEmpty) return null;
  return _ReminderDraft(label: trimmed, time: time);
}
