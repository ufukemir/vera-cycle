import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../l10n/app_localizations.dart';
import '../../l10n/enum_labels.dart';
import '../../services/reminder_service.dart';
import '../../state/app_preferences.dart';
import '../../state/cycle_controller.dart';
import '../../widgets/premium_lock.dart';
import 'custom_reminders_screen.dart';
import 'reminder_detail_screen.dart';

/// Every reminder the app can send, on one screen.
///
/// They were eight switches scattered down the middle of Settings, between
/// the mascot picker and the optional trackers, so "is the water one on?"
/// meant scrolling a long page and reading every row. Their own screen also
/// buys them headings, which is what makes a list of eight scannable rather
/// than merely present.
///
/// The rescheduling helpers came across with them. Each re-derives its
/// notification from current preferences and the current prediction, which
/// is why they take a BuildContext rather than plain values: the honest
/// answer to "when is the next period" changes as logs change.
class RemindersScreen extends StatelessWidget {
  const RemindersScreen({super.key});

  /// Re-derives the period-start reminder from current prefs + the current
  /// prediction. Called after any change that could affect it.
  ///
  /// Known v1 simplification: this only re-fires when the user touches a
  /// reminder-related control on this screen, not automatically every time
  /// [CycleController.prediction] changes elsewhere in the app (e.g. after
  /// logging a new period on Home). The reminder can drift stale until the
  /// user revisits Settings — acceptable for a default-off convenience
  /// feature, not acceptable for anything the app's honesty claims depend on.
  Future<void> _reschedulePeriodStartReminder(BuildContext context) async {
    final prefs = context.read<AppPreferences>();
    final reminders = context.read<ReminderService>();

    if (!prefs.remindersEnabled) {
      await reminders.cancel(ReminderCategory.periodStart);
      return;
    }

    final prediction = context.read<CycleController>().prediction;
    if (!prediction.hasPrediction) return;

    if (!context.mounted) return;
    final l10n = AppLocalizations.of(context)!;
    await reminders.requestPermission();

    final time = prefs.reminderTime;
    final anchor = prediction.earliestStart!.subtract(
      Duration(days: prefs.reminderOffsetDays(ReminderCategory.periodStart)),
    );
    final fireDate = DateTime(
      anchor.year,
      anchor.month,
      anchor.day,
      time.hour,
      time.minute,
    );
    await reminders.scheduleOneOff(
      category: ReminderCategory.periodStart,
      channelName: reminderChannelName(l10n, ReminderCategory.periodStart),
      fireAtLocalWallClock: fireDate,
      title: l10n.reminderNotificationTitle,
      body:
          prefs.reminderMessage(ReminderCategory.periodStart) ??
          l10n.reminderNotificationBody,
    );
  }

  /// Same idea as [_reschedulePeriodStartReminder], anchored to
  /// `earliestStart + estimatedPeriodLengthDays` — [AppPreferences]'s
  /// decorative period-length estimate. Using it here is fine: this only
  /// times a gentle nudge notification, never a claim shown as data (see
  /// docs/03-rakip-analizi.md and the "Tahmin Ayarları" screen doc comment
  /// for why that estimate must stay decorative everywhere it's presented
  /// as information).
  Future<void> _reschedulePeriodEndReminder(BuildContext context) async {
    final prefs = context.read<AppPreferences>();
    final reminders = context.read<ReminderService>();

    if (!prefs.periodEndRemindersEnabled) {
      await reminders.cancel(ReminderCategory.periodEnd);
      return;
    }

    final prediction = context.read<CycleController>().prediction;
    if (!prediction.hasPrediction) return;

    if (!context.mounted) return;
    final l10n = AppLocalizations.of(context)!;
    await reminders.requestPermission();

    final time = prefs.periodEndReminderTime;
    final estimatedEnd = prediction.earliestStart!
        .add(Duration(days: prefs.estimatedPeriodLengthDays))
        .subtract(
          Duration(days: prefs.reminderOffsetDays(ReminderCategory.periodEnd)),
        );
    final fireDate = DateTime(
      estimatedEnd.year,
      estimatedEnd.month,
      estimatedEnd.day,
      time.hour,
      time.minute,
    );
    await reminders.scheduleOneOff(
      category: ReminderCategory.periodEnd,
      channelName: reminderChannelName(l10n, ReminderCategory.periodEnd),
      fireAtLocalWallClock: fireDate,
      title: l10n.reminderPeriodEndTitle,
      body:
          prefs.reminderMessage(ReminderCategory.periodEnd) ??
          l10n.reminderPeriodEndBody,
    );
  }

  Future<void> _rescheduleOvulationReminder(BuildContext context) async {
    final prefs = context.read<AppPreferences>();
    final reminders = context.read<ReminderService>();

    if (!prefs.ovulationRemindersEnabled) {
      await reminders.cancel(ReminderCategory.ovulation);
      return;
    }

    final status = context.read<CycleController>().todayStatus;
    if (!status.hasFertileEstimate) return;

    if (!context.mounted) return;
    final l10n = AppLocalizations.of(context)!;
    await reminders.requestPermission();

    final time = prefs.reminderTime;
    final start = status.fertileWindowStart!.subtract(
      Duration(days: prefs.reminderOffsetDays(ReminderCategory.ovulation)),
    );
    await reminders.scheduleOneOff(
      category: ReminderCategory.ovulation,
      channelName: reminderChannelName(l10n, ReminderCategory.ovulation),
      fireAtLocalWallClock: DateTime(
        start.year,
        start.month,
        start.day,
        time.hour,
        time.minute,
      ),
      title: l10n.reminderOvulationTitle,
      body:
          prefs.reminderMessage(ReminderCategory.ovulation) ??
          l10n.reminderOvulationBody,
    );
  }

  Future<void> _rescheduleMedicationReminder(BuildContext context) async {
    final prefs = context.read<AppPreferences>();
    final reminders = context.read<ReminderService>();

    if (!prefs.medicationRemindersEnabled) {
      await reminders.cancel(ReminderCategory.medication);
      return;
    }
    final l10n = AppLocalizations.of(context)!;
    await reminders.requestPermission();
    await reminders.scheduleDaily(
      category: ReminderCategory.medication,
      channelName: reminderChannelName(l10n, ReminderCategory.medication),
      time: prefs.medicationReminderTime,
      title: l10n.reminderMedicationTitle,
      body:
          prefs.reminderMessage(ReminderCategory.medication) ??
          l10n.reminderMedicationBody,
    );
  }

  Future<void> _rescheduleWaterReminder(BuildContext context) async {
    final prefs = context.read<AppPreferences>();
    final reminders = context.read<ReminderService>();

    if (!prefs.waterRemindersEnabled) {
      await reminders.cancel(ReminderCategory.water);
      return;
    }
    final l10n = AppLocalizations.of(context)!;
    await reminders.requestPermission();
    await reminders.scheduleDaily(
      category: ReminderCategory.water,
      channelName: reminderChannelName(l10n, ReminderCategory.water),
      time: prefs.waterReminderTime,
      title: l10n.reminderWaterTitle,
      body:
          prefs.reminderMessage(ReminderCategory.water) ??
          l10n.reminderWaterBody,
    );
  }

  /// A monthly nudge, scheduled from "now + 30 days" each time the user
  /// touches the toggle. Deliberately coarse: this is a safety net, not a
  /// precise schedule.
  Future<void> _rescheduleBackupReminder(BuildContext context) async {
    final prefs = context.read<AppPreferences>();
    final reminders = context.read<ReminderService>();

    if (!prefs.backupRemindersEnabled) {
      await reminders.cancel(ReminderCategory.backup);
      return;
    }
    final l10n = AppLocalizations.of(context)!;
    await reminders.requestPermission();
    final time = prefs.reminderTime;
    final fire = DateTime.now().add(const Duration(days: 30));
    await reminders.scheduleOneOff(
      category: ReminderCategory.backup,
      channelName: reminderChannelName(l10n, ReminderCategory.backup),
      fireAtLocalWallClock: DateTime(
        fire.year,
        fire.month,
        fire.day,
        time.hour,
        time.minute,
      ),
      title: l10n.reminderBackupTitle,
      body: l10n.reminderBackupBody,
    );
  }

  Future<void> _rescheduleAppointmentReminder(BuildContext context) async {
    final prefs = context.read<AppPreferences>();
    final reminders = context.read<ReminderService>();

    final at = prefs.appointmentReminderAt;
    if (at == null) {
      await reminders.cancel(ReminderCategory.appointment);
      return;
    }
    final l10n = AppLocalizations.of(context)!;
    await reminders.requestPermission();
    await reminders.scheduleOneOff(
      category: ReminderCategory.appointment,
      channelName: reminderChannelName(l10n, ReminderCategory.appointment),
      fireAtLocalWallClock: at,
      title: l10n.reminderAppointmentTitle,
      body:
          prefs.reminderMessage(ReminderCategory.appointment) ??
          l10n.reminderAppointmentBody,
    );
  }

  /// Lets the appointment reminder carry a note of what it's actually for —
  /// "Dr. Aylin, kontrol" rather than a bare date, since the appointment
  /// reminder is the one category [_openDetail] doesn't cover (it needs a
  /// date, not just a time) and so never got the message editor the other
  /// reminders got for free.
  Future<void> _editAppointmentNote(BuildContext context) async {
    final prefs = context.read<AppPreferences>();
    final l10n = AppLocalizations.of(context)!;
    final controller = TextEditingController(
      text: prefs.reminderMessage(ReminderCategory.appointment) ?? '',
    );
    final result = await showDialog<String>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: Text(l10n.reminderDetailMessageEditTitle),
        content: TextField(
          controller: controller,
          autofocus: true,
          maxLines: 3,
          maxLength: 120,
          decoration: InputDecoration(hintText: l10n.reminderAppointmentBody),
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
    if (result == null) return;
    await prefs.setReminderMessage(ReminderCategory.appointment, result.trim());
    if (context.mounted) await _rescheduleAppointmentReminder(context);
  }

  /// Pushes [ReminderDetailScreen] for [category], wiring its four moving
  /// parts (on/off, offset, time, message) back to the right
  /// [AppPreferences] fields and rescheduling after any of them changes.
  ///
  /// The route's own `builder` calls `context.watch<AppPreferences>()`
  /// rather than closing over a value snapshotted when the tile was tapped
  /// — a plain snapshot left the switch on the detail screen visually stuck
  /// after toggling it, since nothing told that route to rebuild.
  /// [enabledOf]/[timeOf] read per-category fields that, unlike offset and
  /// message, aren't uniformly keyed by [ReminderCategory.channelId] and so
  /// can't be looked up generically the same way.
  Future<void> _openDetail({
    required BuildContext context,
    required String title,
    required ReminderCategory category,
    required bool Function(AppPreferences) enabledOf,
    required Future<void> Function(bool) setEnabled,
    required TimeOfDay Function(AppPreferences) timeOf,
    required Future<void> Function(TimeOfDay) setTime,
    required String defaultMessage,
    required bool hasOffset,
    required Future<void> Function(BuildContext) reschedule,
  }) async {
    final prefs = context.read<AppPreferences>();
    await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (routeContext) {
          final live = routeContext.watch<AppPreferences>();
          return ReminderDetailScreen(
            title: title,
            enabled: enabledOf(live),
            onEnabledChanged: (v) async {
              await setEnabled(v);
              if (context.mounted) await reschedule(context);
            },
            time: timeOf(live),
            onTimeChanged: (t) async {
              await setTime(t);
              if (context.mounted) await reschedule(context);
            },
            message: live.reminderMessage(category),
            onMessageChanged: (m) async {
              await prefs.setReminderMessage(category, m);
              if (context.mounted) await reschedule(context);
            },
            defaultMessage: defaultMessage,
            offsetDays: hasOffset ? live.reminderOffsetDays(category) : null,
            onOffsetDaysChanged: hasOffset
                ? (d) async {
                    await prefs.setReminderOffsetDays(category, d);
                    if (context.mounted) await reschedule(context);
                  }
                : null,
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final prefs = context.watch<AppPreferences>();

    return Scaffold(
      appBar: AppBar(title: Text(l10n.remindersScreenTitle)),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.only(bottom: 32),
          children: [
            _heading(context, l10n.remindersGroupCycle),
            SwitchListTile(
              title: Text(l10n.settingsRemindersLabel),
              value: prefs.remindersEnabled,
              onChanged: (v) async {
                await prefs.setRemindersEnabled(v);
                if (context.mounted) {
                  await _reschedulePeriodStartReminder(context);
                }
              },
            ),
            if (prefs.remindersEnabled)
              ListTile(
                title: Text(prefs.reminderTime.format(context)),
                trailing: const Icon(Icons.chevron_right),
                onTap: () => _openDetail(
                  context: context,
                  title: l10n.settingsRemindersLabel,
                  category: ReminderCategory.periodStart,
                  enabledOf: (p) => p.remindersEnabled,
                  setEnabled: prefs.setRemindersEnabled,
                  timeOf: (p) => p.reminderTime,
                  setTime: prefs.setReminderTime,
                  defaultMessage: l10n.reminderNotificationBody,
                  hasOffset: true,
                  reschedule: _reschedulePeriodStartReminder,
                ),
              ),
            SwitchListTile(
              title: Text(l10n.settingsRemindersPeriodEndLabel),
              value: prefs.periodEndRemindersEnabled,
              onChanged: (v) async {
                await prefs.setPeriodEndRemindersEnabled(v);
                if (context.mounted) {
                  await _reschedulePeriodEndReminder(context);
                }
              },
            ),
            if (prefs.periodEndRemindersEnabled)
              ListTile(
                title: Text(prefs.periodEndReminderTime.format(context)),
                trailing: const Icon(Icons.chevron_right),
                onTap: () => _openDetail(
                  context: context,
                  title: l10n.settingsRemindersPeriodEndLabel,
                  category: ReminderCategory.periodEnd,
                  enabledOf: (p) => p.periodEndRemindersEnabled,
                  setEnabled: prefs.setPeriodEndRemindersEnabled,
                  timeOf: (p) => p.periodEndReminderTime,
                  setTime: prefs.setPeriodEndReminderTime,
                  defaultMessage: l10n.reminderPeriodEndBody,
                  hasOffset: true,
                  reschedule: _reschedulePeriodEndReminder,
                ),
              ),
            _heading(context, l10n.remindersGroupMedication),
            SwitchListTile(
              title: Text(l10n.settingsRemindersMedicationLabel),
              value: prefs.medicationRemindersEnabled,
              onChanged: (v) async {
                await prefs.setMedicationRemindersEnabled(v);
                if (context.mounted) {
                  await _rescheduleMedicationReminder(context);
                }
              },
            ),
            if (prefs.medicationRemindersEnabled)
              ListTile(
                title: Text(prefs.medicationReminderTime.format(context)),
                trailing: const Icon(Icons.chevron_right),
                onTap: () => _openDetail(
                  context: context,
                  title: l10n.settingsRemindersMedicationLabel,
                  category: ReminderCategory.medication,
                  enabledOf: (p) => p.medicationRemindersEnabled,
                  setEnabled: prefs.setMedicationRemindersEnabled,
                  timeOf: (p) => p.medicationReminderTime,
                  setTime: prefs.setMedicationReminderTime,
                  defaultMessage: l10n.reminderMedicationBody,
                  hasOffset: false,
                  reschedule: _rescheduleMedicationReminder,
                ),
              ),
            _heading(context, l10n.remindersGroupLifestyle),
            SwitchListTile(
              title: Text(l10n.settingsRemindersWaterLabel),
              value: prefs.waterRemindersEnabled,
              onChanged: (v) async {
                await prefs.setWaterRemindersEnabled(v);
                if (context.mounted) await _rescheduleWaterReminder(context);
              },
            ),
            if (prefs.waterRemindersEnabled)
              ListTile(
                title: Text(prefs.waterReminderTime.format(context)),
                trailing: const Icon(Icons.chevron_right),
                onTap: () => _openDetail(
                  context: context,
                  title: l10n.settingsRemindersWaterLabel,
                  category: ReminderCategory.water,
                  enabledOf: (p) => p.waterRemindersEnabled,
                  setEnabled: prefs.setWaterRemindersEnabled,
                  timeOf: (p) => p.waterReminderTime,
                  setTime: prefs.setWaterReminderTime,
                  defaultMessage: l10n.reminderWaterBody,
                  hasOffset: false,
                  reschedule: _rescheduleWaterReminder,
                ),
              ),
            SwitchListTile(
              title: Text(l10n.settingsRemindersBackupLabel),
              value: prefs.backupRemindersEnabled,
              onChanged: (v) async {
                await prefs.setBackupRemindersEnabled(v);
                if (context.mounted) await _rescheduleBackupReminder(context);
              },
            ),
            _heading(context, l10n.remindersGroupCycle),
            SwitchListTile(
              title: Text(l10n.settingsRemindersOvulationLabel),
              value: prefs.ovulationRemindersEnabled,
              onChanged: (v) async {
                await prefs.setOvulationRemindersEnabled(v);
                if (context.mounted) {
                  await _rescheduleOvulationReminder(context);
                }
              },
            ),
            if (prefs.ovulationRemindersEnabled)
              ListTile(
                // Shares reminderTime with the period-start reminder — it
                // always has; this screen doesn't introduce a second time
                // of day to keep in sync, just a place to see and change it.
                title: Text(prefs.reminderTime.format(context)),
                trailing: const Icon(Icons.chevron_right),
                onTap: () => _openDetail(
                  context: context,
                  title: l10n.settingsRemindersOvulationLabel,
                  category: ReminderCategory.ovulation,
                  enabledOf: (p) => p.ovulationRemindersEnabled,
                  setEnabled: prefs.setOvulationRemindersEnabled,
                  timeOf: (p) => p.reminderTime,
                  setTime: prefs.setReminderTime,
                  defaultMessage: l10n.reminderOvulationBody,
                  hasOffset: true,
                  reschedule: _rescheduleOvulationReminder,
                ),
              ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: PremiumLock(
                title: l10n.customRemindersEntry,
                description: l10n.premiumBenefitAdvancedReminders,
                // Same reasoning, with teeth: a lapsed user whose reminders
                // were stored but unreachable had no in-app way to delete
                // them at all.
                lockedPreview: prefs.customReminders.isEmpty
                    ? null
                    : Card(
                        child: ListTile(
                          title: Text(l10n.customRemindersEntry),
                          trailing: const Icon(Icons.chevron_right),
                          onTap: () => Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => const CustomRemindersScreen(),
                            ),
                          ),
                        ),
                      ),
                child: Card(
                  child: ListTile(
                    title: Text(l10n.customRemindersEntry),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => const CustomRemindersScreen(),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            _heading(context, l10n.remindersGroupAppointment),
            ListTile(
              title: Text(l10n.settingsRemindersAppointmentLabel),
              subtitle: prefs.appointmentReminderAt == null
                  ? null
                  : Text(
                      MaterialLocalizations.of(
                        context,
                      ).formatMediumDate(prefs.appointmentReminderAt!),
                    ),
              trailing: prefs.appointmentReminderAt == null
                  ? const Icon(Icons.chevron_right)
                  : IconButton(
                      icon: const Icon(Icons.close),
                      tooltip: l10n.settingsRemindersAppointmentClear,
                      onPressed: () async {
                        await prefs.setAppointmentReminderAt(null);
                        if (context.mounted) {
                          await _rescheduleAppointmentReminder(context);
                        }
                      },
                    ),
              onTap: () async {
                final now = DateTime.now();
                final date = await showDatePicker(
                  context: context,
                  initialDate: prefs.appointmentReminderAt ?? now,
                  firstDate: now,
                  lastDate: now.add(const Duration(days: 365)),
                );
                if (date == null || !context.mounted) return;
                final time = await showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.fromDateTime(
                    prefs.appointmentReminderAt ?? now,
                  ),
                  initialEntryMode: TimePickerEntryMode.input,
                );
                if (time == null || !context.mounted) return;
                await prefs.setAppointmentReminderAt(
                  DateTime(
                    date.year,
                    date.month,
                    date.day,
                    time.hour,
                    time.minute,
                  ),
                );
                if (context.mounted) {
                  await _rescheduleAppointmentReminder(context);
                }
              },
            ),
            // The date alone doesn't say what the appointment is — the
            // person setting the reminder needs to see, at a glance, what
            // they're being reminded of.
            if (prefs.appointmentReminderAt != null)
              ListTile(
                title: Text(l10n.reminderDetailMessage),
                subtitle: Text(
                  prefs.reminderMessage(ReminderCategory.appointment) ??
                      l10n.reminderDetailMessageHint,
                ),
                trailing: const Icon(Icons.edit_outlined, size: 20),
                onTap: () => _editAppointmentNote(context),
              ),
          ],
        ),
      ),
    );
  }

  Widget _heading(BuildContext context, String text) => Padding(
    padding: const EdgeInsets.fromLTRB(16, 22, 16, 4),
    child: Text(
      text.toUpperCase(),
      style: Theme.of(context).textTheme.labelMedium?.copyWith(
        color: Theme.of(context).colorScheme.primary,
        letterSpacing: 1.1,
        fontWeight: FontWeight.w700,
      ),
    ),
  );
}
