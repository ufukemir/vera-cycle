import 'package:flutter/material.dart';

import '../../l10n/app_localizations.dart';
import '../../widgets/number_wheel.dart';

/// One reminder's own screen: on/off, when it fires, and the words it
/// fires with — instead of a single row on the list screen that only ever
/// opened a time picker.
///
/// [offsetDays] is `null` for reminders with no "how many days before"
/// concept — medication and water repeat daily, and the appointment
/// reminder already carries an explicit date. Passing `null` hides the
/// Uyarı row rather than showing one that would do nothing.
class ReminderDetailScreen extends StatefulWidget {
  const ReminderDetailScreen({
    super.key,
    required this.title,
    required this.enabled,
    required this.onEnabledChanged,
    required this.time,
    required this.onTimeChanged,
    required this.message,
    required this.onMessageChanged,
    required this.defaultMessage,
    this.offsetDays,
    this.onOffsetDaysChanged,
  });

  final String title;
  final bool enabled;
  final ValueChanged<bool> onEnabledChanged;
  final TimeOfDay time;
  final ValueChanged<TimeOfDay> onTimeChanged;
  final String? message;
  final ValueChanged<String?> onMessageChanged;
  final String defaultMessage;
  final int? offsetDays;
  final ValueChanged<int>? onOffsetDaysChanged;

  @override
  State<ReminderDetailScreen> createState() => _ReminderDetailScreenState();
}

class _ReminderDetailScreenState extends State<ReminderDetailScreen> {
  Future<void> _pickTime() async {
    final picked = await showTimePicker(
      context: context,
      initialTime: widget.time,
      initialEntryMode: TimePickerEntryMode.input,
    );
    if (picked != null) widget.onTimeChanged(picked);
  }

  Future<void> _pickOffset() async {
    var days = widget.offsetDays ?? 0;
    final l10n = AppLocalizations.of(context)!;
    final result = await showDialog<int>(
      context: context,
      builder: (dialogContext) => StatefulBuilder(
        builder: (dialogContext, setState) => AlertDialog(
          title: Text(l10n.reminderDetailAlert),
          content: SizedBox(
            height: 160,
            child: NumberWheel(
              value: days,
              min: 0,
              max: 14,
              onChanged: (v) => setState(() => days = v),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(dialogContext),
              child: Text(l10n.actionCancel),
            ),
            FilledButton(
              onPressed: () => Navigator.pop(dialogContext, days),
              child: Text(l10n.actionSave),
            ),
          ],
        ),
      ),
    );
    if (result != null) widget.onOffsetDaysChanged?.call(result);
  }

  Future<void> _editMessage() async {
    final l10n = AppLocalizations.of(context)!;
    final controller = TextEditingController(text: widget.message ?? '');
    final result = await showDialog<String>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: Text(l10n.reminderDetailMessageEditTitle),
        content: TextField(
          controller: controller,
          autofocus: true,
          maxLines: 3,
          maxLength: 120,
          decoration: InputDecoration(hintText: widget.defaultMessage),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext),
            child: Text(l10n.actionCancel),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(dialogContext, controller.text),
            child: Text(l10n.actionSave),
          ),
        ],
      ),
    );
    // Empty text clears the override rather than saving an empty body —
    // handled by AppPreferences.setReminderMessage, so passing '' straight
    // through is safe either way.
    if (result != null) widget.onMessageChanged(result.trim());
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: IconButton.filled(
              icon: const Icon(Icons.check),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            Card(
              margin: EdgeInsets.zero,
              child: Column(
                children: [
                  SwitchListTile(
                    title: Text(l10n.reminderDetailNotification),
                    value: widget.enabled,
                    onChanged: widget.onEnabledChanged,
                  ),
                  if (widget.enabled) ...[
                    if (widget.offsetDays != null) ...[
                      const Divider(height: 1),
                      ListTile(
                        title: Text(l10n.reminderDetailAlert),
                        trailing: Text(
                          widget.offsetDays == 0
                              ? l10n.reminderDetailAlertToday
                              : l10n.reminderDetailAlertDaysBefore(
                                  widget.offsetDays!,
                                ),
                          style: theme.textTheme.bodyMedium?.copyWith(
                            color: scheme.primary,
                          ),
                        ),
                        onTap: _pickOffset,
                      ),
                    ],
                    const Divider(height: 1),
                    ListTile(
                      title: Text(l10n.reminderDetailTime),
                      trailing: Text(
                        widget.time.format(context),
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: scheme.primary,
                        ),
                      ),
                      onTap: _pickTime,
                    ),
                  ],
                ],
              ),
            ),
            if (widget.enabled) ...[
              const SizedBox(height: 24),
              Text(
                l10n.reminderDetailMessage,
                style: theme.textTheme.labelLarge,
              ),
              const SizedBox(height: 8),
              Card(
                margin: EdgeInsets.zero,
                child: ListTile(
                  title: Text(widget.message ?? widget.defaultMessage),
                  trailing: const Icon(Icons.edit_outlined, size: 20),
                  onTap: _editMessage,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
