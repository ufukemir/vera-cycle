import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../l10n/app_localizations.dart';
import '../../services/pin_vault.dart';
import '../../services/reminder_service.dart';
import '../../state/app_preferences.dart';
import '../../state/cycle_controller.dart';
import '../export/export_screen.dart';
import 'privacy_screen.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  /// Re-derives the single scheduled reminder from current prefs + the
  /// current prediction. Called after any change that could affect it.
  ///
  /// Known v1 simplification: this only re-fires when the user touches a
  /// reminder-related control on this screen, not automatically every time
  /// [CycleController.prediction] changes elsewhere in the app (e.g. after
  /// logging a new period on Home). The reminder can drift stale until the
  /// user revisits Settings — acceptable for a default-off convenience
  /// feature, not acceptable for anything the app's honesty claims depend on.
  Future<void> _rescheduleReminder(BuildContext context) async {
    final prefs = context.read<AppPreferences>();
    final reminders = context.read<ReminderService>();

    if (!prefs.remindersEnabled) {
      await reminders.cancelAll();
      return;
    }

    final prediction = context.read<CycleController>().prediction;
    if (!prediction.hasPrediction) return;

    if (!context.mounted) return;
    final l10n = AppLocalizations.of(context)!;
    await reminders.requestPermission();

    final time = prefs.reminderTime;
    final fireDate = DateTime(
      prediction.earliestStart!.year,
      prediction.earliestStart!.month,
      prediction.earliestStart!.day,
      time.hour,
      time.minute,
    );
    await reminders.scheduleUpcomingPeriodReminder(
      fireAtLocalWallClock: fireDate,
      title: l10n.reminderNotificationTitle,
      body: l10n.reminderNotificationBody,
    );
  }

  Future<void> _confirmErase(BuildContext context) async {
    final l10n = AppLocalizations.of(context)!;
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: Text(l10n.lockScreenEraseTitle),
        content: Text(l10n.lockScreenEraseBody),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(false),
            child: Text(l10n.actionCancel),
          ),
          FilledButton(
            style: FilledButton.styleFrom(
              backgroundColor: Theme.of(dialogContext).colorScheme.error,
            ),
            onPressed: () => Navigator.of(dialogContext).pop(true),
            child: Text(l10n.lockScreenEraseConfirm),
          ),
        ],
      ),
    );
    if (confirmed != true || !context.mounted) return;

    await context.read<CycleController>().eraseEverything();
    if (!context.mounted) return;
    await context.read<PinVault>().clear();
    if (!context.mounted) return;
    await context.read<ReminderService>().cancelAll();
    if (!context.mounted) return;
    await context.read<AppPreferences>().setOnboardingComplete(false);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final prefs = context.watch<AppPreferences>();
    final errorColor = Theme.of(context).colorScheme.error;

    return Scaffold(
      appBar: AppBar(title: Text(l10n.navSettings)),
      body: SafeArea(
        child: ListView(
          children: [
            _sectionHeading(context, l10n.settingsLanguageLabel),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SegmentedButton<String>(
                segments: [
                  ButtonSegment(value: 'en', label: Text(l10n.settingsLanguageEnglish)),
                  ButtonSegment(value: 'tr', label: Text(l10n.settingsLanguageTurkish)),
                ],
                selected: {prefs.locale.languageCode},
                onSelectionChanged: (s) => prefs.setLocale(Locale(s.first)),
              ),
            ),
            const Divider(),
            _sectionHeading(context, l10n.settingsWeekStartLabel),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SegmentedButton<bool>(
                segments: [
                  ButtonSegment(value: true, label: Text(l10n.settingsWeekStartMonday)),
                  ButtonSegment(value: false, label: Text(l10n.settingsWeekStartSunday)),
                ],
                selected: {prefs.weekStartsMonday},
                onSelectionChanged: (s) => prefs.setWeekStartsMonday(s.first),
              ),
            ),
            const Divider(),
            _sectionHeading(context, l10n.settingsTemperatureUnitLabel),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SegmentedButton<TemperatureUnit>(
                segments: [
                  ButtonSegment(
                    value: TemperatureUnit.celsius,
                    label: Text(l10n.settingsTemperatureCelsius),
                  ),
                  ButtonSegment(
                    value: TemperatureUnit.fahrenheit,
                    label: Text(l10n.settingsTemperatureFahrenheit),
                  ),
                ],
                selected: {prefs.temperatureUnit},
                onSelectionChanged: (s) => prefs.setTemperatureUnit(s.first),
              ),
            ),
            const Divider(),
            SwitchListTile(
              title: Text(l10n.settingsRemindersLabel),
              value: prefs.remindersEnabled,
              onChanged: (v) async {
                await prefs.setRemindersEnabled(v);
                if (context.mounted) await _rescheduleReminder(context);
              },
            ),
            if (prefs.remindersEnabled)
              ListTile(
                title: Text(prefs.reminderTime.format(context)),
                trailing: const Icon(Icons.access_time),
                onTap: () async {
                  final picked = await showTimePicker(
                    context: context,
                    initialTime: prefs.reminderTime,
                  );
                  if (picked == null || !context.mounted) return;
                  await prefs.setReminderTime(picked);
                  if (context.mounted) await _rescheduleReminder(context);
                },
              ),
            const Divider(),
            _sectionHeading(context, l10n.settingsOptionalTrackersHeading),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(l10n.settingsOptionalTrackersBody,
                  style: Theme.of(context).textTheme.bodySmall),
            ),
            SwitchListTile(
              title: Text(l10n.settingsSexualActivityToggle),
              value: prefs.sexualActivityTrackingEnabled,
              onChanged: (v) => prefs.setSexualActivityTrackingEnabled(v),
            ),
            SwitchListTile(
              title: Text(l10n.settingsBbtToggle),
              value: prefs.bbtTrackingEnabled,
              onChanged: (v) => prefs.setBbtTrackingEnabled(v),
            ),
            SwitchListTile(
              title: Text(l10n.settingsMucusToggle),
              value: prefs.mucusTrackingEnabled,
              onChanged: (v) => prefs.setMucusTrackingEnabled(v),
            ),
            const Divider(),
            ListTile(
              title: Text(l10n.settingsPrivacyEntry),
              trailing: const Icon(Icons.chevron_right),
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => const PrivacyScreen()),
              ),
            ),
            ListTile(
              title: Text(l10n.settingsExportEntry),
              trailing: const Icon(Icons.chevron_right),
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => const ExportScreen()),
              ),
            ),
            ListTile(
              title: Text(l10n.settingsDeleteAllData,
                  style: TextStyle(color: errorColor)),
              onTap: () => _confirmErase(context),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget _sectionHeading(BuildContext context, String text) => Padding(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
        child: Text(text, style: Theme.of(context).textTheme.titleMedium),
      );
}
