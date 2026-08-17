import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../l10n/app_localizations.dart';
import '../../models/enums.dart';
import '../../services/pin_vault.dart';
import '../../services/reminder_service.dart';
import '../../state/app_preferences.dart';
import '../../state/cycle_controller.dart';
import '../export/export_screen.dart';
import '../home/widgets/home_hero.dart';
import '../premium/premium_screen.dart';
import 'prediction_settings_screen.dart';
import 'privacy_screen.dart';
import 'widgets/language_picker_tile.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

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
    final fireDate = DateTime(
      prediction.earliestStart!.year,
      prediction.earliestStart!.month,
      prediction.earliestStart!.day,
      time.hour,
      time.minute,
    );
    await reminders.scheduleOneOff(
      category: ReminderCategory.periodStart,
      fireAtLocalWallClock: fireDate,
      title: l10n.reminderNotificationTitle,
      body: l10n.reminderNotificationBody,
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
        .add(Duration(days: prefs.estimatedPeriodLengthDays));
    final fireDate = DateTime(
      estimatedEnd.year,
      estimatedEnd.month,
      estimatedEnd.day,
      time.hour,
      time.minute,
    );
    await reminders.scheduleOneOff(
      category: ReminderCategory.periodEnd,
      fireAtLocalWallClock: fireDate,
      title: l10n.reminderPeriodEndTitle,
      body: l10n.reminderPeriodEndBody,
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
    final start = status.fertileWindowStart!;
    await reminders.scheduleOneOff(
      category: ReminderCategory.ovulation,
      fireAtLocalWallClock: DateTime(
          start.year, start.month, start.day, time.hour, time.minute),
      title: l10n.reminderOvulationTitle,
      body: l10n.reminderOvulationBody,
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
      time: prefs.medicationReminderTime,
      title: l10n.reminderMedicationTitle,
      body: l10n.reminderMedicationBody,
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
      time: prefs.waterReminderTime,
      title: l10n.reminderWaterTitle,
      body: l10n.reminderWaterBody,
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
      fireAtLocalWallClock: DateTime(
          fire.year, fire.month, fire.day, time.hour, time.minute),
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
      fireAtLocalWallClock: at,
      title: l10n.reminderAppointmentTitle,
      body: l10n.reminderAppointmentBody,
    );
  }

  Future<void> _pickLmp(BuildContext context, AppPreferences prefs) async {
    final now = DateTime.now();
    final picked = await showDatePicker(
      context: context,
      initialDate: prefs.pregnancyLmp ?? now,
      firstDate: now.subtract(const Duration(days: 300)),
      lastDate: now,
    );
    if (picked == null) return;
    await prefs.setPregnancyLmp(picked);
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
            const LanguagePickerTile(),
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
            _sectionHeading(context, l10n.settingsThemeLabel),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SegmentedButton<ThemeMode>(
                segments: [
                  ButtonSegment(
                      value: ThemeMode.system,
                      label: Text(l10n.settingsThemeSystem)),
                  ButtonSegment(
                      value: ThemeMode.light,
                      label: Text(l10n.settingsThemeLight)),
                  ButtonSegment(
                      value: ThemeMode.dark,
                      label: Text(l10n.settingsThemeDark)),
                ],
                selected: {prefs.themeMode},
                onSelectionChanged: (s) => prefs.setThemeMode(s.first),
              ),
            ),
            _sectionHeading(context, l10n.settingsHomeThemeLabel),
            SizedBox(
              height: 96,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                children: [
                  for (final entry in {
                    HomeTheme.wheat: l10n.homeThemeWheat,
                    HomeTheme.sky: l10n.homeThemeSky,
                    HomeTheme.field: l10n.homeThemeField,
                    HomeTheme.blossom: l10n.homeThemeBlossom,
                    HomeTheme.plain: l10n.homeThemePlain,
                  }.entries)
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: _ThemeSwatch(
                        label: entry.value,
                        theme: entry.key,
                        selected: prefs.homeTheme == entry.key,
                        onTap: () => prefs.setHomeTheme(entry.key),
                      ),
                    ),
                ],
              ),
            ),
            _sectionHeading(context, l10n.settingsMascotLabel),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Wrap(
                spacing: 8,
                children: [
                  for (final entry in {
                    Mascot.droplet: l10n.mascotDroplet,
                    Mascot.flower: l10n.mascotFlower,
                    Mascot.moon: l10n.mascotMoon,
                    Mascot.none: l10n.mascotNone,
                  }.entries)
                    ChoiceChip(
                      label: Text(entry.value),
                      selected: prefs.mascot == entry.key,
                      onSelected: (_) => prefs.setMascot(entry.key),
                    ),
                ],
              ),
            ),
            const Divider(),
            SwitchListTile(
              title: Text(l10n.settingsRemindersLabel),
              value: prefs.remindersEnabled,
              onChanged: (v) async {
                await prefs.setRemindersEnabled(v);
                if (context.mounted) await _reschedulePeriodStartReminder(context);
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
                  if (context.mounted) await _reschedulePeriodStartReminder(context);
                },
              ),
            SwitchListTile(
              title: Text(l10n.settingsRemindersPeriodEndLabel),
              value: prefs.periodEndRemindersEnabled,
              onChanged: (v) async {
                await prefs.setPeriodEndRemindersEnabled(v);
                if (context.mounted) await _reschedulePeriodEndReminder(context);
              },
            ),
            if (prefs.periodEndRemindersEnabled)
              ListTile(
                title: Text(prefs.periodEndReminderTime.format(context)),
                trailing: const Icon(Icons.access_time),
                onTap: () async {
                  final picked = await showTimePicker(
                    context: context,
                    initialTime: prefs.periodEndReminderTime,
                  );
                  if (picked == null || !context.mounted) return;
                  await prefs.setPeriodEndReminderTime(picked);
                  if (context.mounted) await _reschedulePeriodEndReminder(context);
                },
              ),
            SwitchListTile(
              title: Text(l10n.settingsRemindersMedicationLabel),
              value: prefs.medicationRemindersEnabled,
              onChanged: (v) async {
                await prefs.setMedicationRemindersEnabled(v);
                if (context.mounted) await _rescheduleMedicationReminder(context);
              },
            ),
            if (prefs.medicationRemindersEnabled)
              ListTile(
                title: Text(prefs.medicationReminderTime.format(context)),
                trailing: const Icon(Icons.access_time),
                onTap: () async {
                  final picked = await showTimePicker(
                    context: context,
                    initialTime: prefs.medicationReminderTime,
                  );
                  if (picked == null || !context.mounted) return;
                  await prefs.setMedicationReminderTime(picked);
                  if (context.mounted) await _rescheduleMedicationReminder(context);
                },
              ),
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
                trailing: const Icon(Icons.access_time),
                onTap: () async {
                  final picked = await showTimePicker(
                    context: context,
                    initialTime: prefs.waterReminderTime,
                  );
                  if (picked == null || !context.mounted) return;
                  await prefs.setWaterReminderTime(picked);
                  if (context.mounted) await _rescheduleWaterReminder(context);
                },
              ),
            SwitchListTile(
              title: Text(l10n.settingsRemindersBackupLabel),
              value: prefs.backupRemindersEnabled,
              onChanged: (v) async {
                await prefs.setBackupRemindersEnabled(v);
                if (context.mounted) await _rescheduleBackupReminder(context);
              },
            ),
            SwitchListTile(
              title: Text(l10n.settingsRemindersOvulationLabel),
              value: prefs.ovulationRemindersEnabled,
              onChanged: (v) async {
                await prefs.setOvulationRemindersEnabled(v);
                if (context.mounted) await _rescheduleOvulationReminder(context);
              },
            ),
            ListTile(
              title: Text(l10n.settingsRemindersAppointmentLabel),
              subtitle: prefs.appointmentReminderAt == null
                  ? null
                  : Text(MaterialLocalizations.of(context)
                      .formatMediumDate(prefs.appointmentReminderAt!)),
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
                      prefs.appointmentReminderAt ?? now),
                );
                if (time == null || !context.mounted) return;
                await prefs.setAppointmentReminderAt(
                  DateTime(date.year, date.month, date.day, time.hour, time.minute),
                );
                if (context.mounted) await _rescheduleAppointmentReminder(context);
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
            SwitchListTile(
              title: Text(l10n.settingsBreastExamToggle),
              value: prefs.breastExamTrackingEnabled,
              onChanged: (v) => prefs.setBreastExamTrackingEnabled(v),
            ),
            SwitchListTile(
              title: Text(l10n.settingsCervixToggle),
              value: prefs.cervixTrackingEnabled,
              onChanged: (v) => prefs.setCervixTrackingEnabled(v),
            ),
            SwitchListTile(
              title: Text(l10n.settingsOvulationTestToggle),
              value: prefs.ovulationTestTrackingEnabled,
              onChanged: (v) => prefs.setOvulationTestTrackingEnabled(v),
            ),
            const Divider(),
            _sectionHeading(context, l10n.settingsPregnancyModeLabel),
            SwitchListTile(
              title: Text(l10n.settingsPregnancyModeLabel),
              value: prefs.pregnancyMode,
              onChanged: (v) async {
                await prefs.setPregnancyMode(v);
                if (!v || !context.mounted) return;
                if (prefs.pregnancyLmp == null) {
                  await _pickLmp(context, prefs);
                }
              },
            ),
            if (prefs.pregnancyMode)
              ListTile(
                title: Text(l10n.pregnancyLmpLabel),
                subtitle: Text(prefs.pregnancyLmp == null
                    ? l10n.pregnancyNeedsLmp
                    : MaterialLocalizations.of(context)
                        .formatMediumDate(prefs.pregnancyLmp!)),
                trailing: const Icon(Icons.calendar_today_outlined),
                onTap: () => _pickLmp(context, prefs),
              ),
            const Divider(),
            ListTile(
              leading: Icon(Icons.workspace_premium_outlined,
                  color: Theme.of(context).colorScheme.primary),
              title: Text(l10n.settingsPremiumEntry),
              subtitle:
                  prefs.premiumActive ? Text(l10n.premiumActiveBadge) : null,
              trailing: const Icon(Icons.chevron_right),
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => const PremiumScreen()),
              ),
            ),
            ListTile(
              title: Text(l10n.predictionSettingsEntry),
              trailing: const Icon(Icons.chevron_right),
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => const PredictionSettingsScreen()),
              ),
            ),
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

class _ThemeSwatch extends StatelessWidget {
  const _ThemeSwatch({
    required this.label,
    required this.theme,
    required this.selected,
    required this.onTap,
  });

  final String label;
  final HomeTheme theme;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final asset = homeThemeAsset(theme);
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            width: 62,
            height: 62,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: selected ? scheme.primary : scheme.outlineVariant,
                width: selected ? 3 : 1,
              ),
              image: asset == null
                  ? null
                  : DecorationImage(image: AssetImage(asset), fit: BoxFit.cover),
              gradient: asset == null ? const AppPaletteGradient() : null,
            ),
          ),
          const SizedBox(height: 4),
          Text(label, style: Theme.of(context).textTheme.labelSmall),
        ],
      ),
    );
  }
}
