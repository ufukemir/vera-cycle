import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../l10n/app_localizations.dart';
import '../../l10n/enum_labels.dart';
import '../../models/enums.dart';
import '../../services/ad_consent_service.dart';
import '../../services/crash_log.dart';
import '../../services/health_sync_service.dart';
import '../../services/pin_vault.dart';
import '../../services/reminder_service.dart';
import '../../state/app_lock_controller.dart';
import '../../state/app_preferences.dart';
import '../../state/cycle_controller.dart';
import '../export/export_screen.dart';
import '../export/import_screen.dart';
import '../home/widgets/home_hero.dart';
import '../premium/premium_screen.dart';
import '../../theme/app_theme.dart';
import '../../widgets/illustrations.dart';
import '../../widgets/premium_lock.dart';
import 'custom_reminders_screen.dart';
import 'custom_tags_screen.dart';
import 'diagnostics_screen.dart';
import 'prediction_settings_screen.dart';
import 'privacy_screen.dart';
import 'widgets/language_picker_tile.dart';

/// Localized weekday name, e.g. "Monday" / "Pazartesi" / "السبت".
///
/// Taken from `intl` rather than from ARB keys: adding Saturday as an
/// option would otherwise have meant one more string to translate into
/// every language, for a word every locale database already knows.
String _weekdayName(BuildContext context, int weekday) {
  // Any week works; 2024-01-01 was a Monday, so +offset lands on the day.
  final date = DateTime(2024, 1, 1).add(Duration(days: weekday - 1));
  return DateFormat.EEEE(Localizations.localeOf(context).toString())
      .format(date);
}

int _localeFirstWeekday(BuildContext context) =>
    switch (MaterialLocalizations.of(context).firstDayOfWeekIndex) {
      0 => DateTime.sunday,
      6 => DateTime.saturday,
      _ => DateTime.monday,
    };

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
      channelName: reminderChannelName(l10n, ReminderCategory.periodStart),
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
      channelName: reminderChannelName(l10n, ReminderCategory.periodEnd),
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
      channelName: reminderChannelName(l10n, ReminderCategory.ovulation),
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
      channelName: reminderChannelName(l10n, ReminderCategory.medication),
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
      channelName: reminderChannelName(l10n, ReminderCategory.water),
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
      channelName: reminderChannelName(l10n, ReminderCategory.backup),
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
      channelName: reminderChannelName(l10n, ReminderCategory.appointment),
      fireAtLocalWallClock: at,
      title: l10n.reminderAppointmentTitle,
      body: l10n.reminderAppointmentBody,
    );
  }

  /// Turning this on asks for permission first and only sticks if it's
  /// granted — a toggle that looks on while writes silently fail would be
  /// worse than one that refuses to move.
  Future<void> _toggleHealthSync(BuildContext context, bool enable) async {
    final prefs = context.read<AppPreferences>();
    final l10n = AppLocalizations.of(context)!;
    final controller = context.read<CycleController>();
    final lock = context.read<AppLockController>();

    if (!enable) {
      await prefs.setHealthSyncEnabled(false);
      // Detach the live service too, not just the stored preference.
      // Only `main.dart` read that preference, and only at startup, so
      // the controller went on writing every edited day to the health
      // record until the app was next launched — an export the user had
      // explicitly switched off.
      controller.healthSync = null;
      return;
    }

    final service = HealthSyncService();
    // Health Connect's permission screen is a separate activity, so this
    // has to hold the auto-lock off the same way the export sheets do.
    final granted = await lock.duringSystemSheet(service.requestPermissions);
    if (!context.mounted) return;
    if (!granted) {
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(SnackBar(
          content: Text(l10n.healthSyncDenied),
          behavior: SnackBarBehavior.floating,
          margin: const EdgeInsets.all(16),
        ));
      return;
    }

    await prefs.setHealthSyncEnabled(true);
    // Same reason as the off branch: without this, days edited after
    // turning sync on went nowhere until the next launch, so the backfill
    // below looked like the whole feature.
    controller.healthSync = service;
    final count = await service.writeAll(controller.logs);
    if (!context.mounted) return;
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(
        content: Text(l10n.healthSyncBackfilled(count)),
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.all(16),
      ));
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
    final prefs = context.read<AppPreferences>();
    // The user wrote these labels themselves; they are as much "their data"
    // as a logged symptom is.
    await prefs.clearCustomReminders();
    await prefs.setOnboardingComplete(false);
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
            // Grouped by what the user is actually deciding, rather than
            // alternating heading/control/divider down the whole screen:
            // appearance, then reminders, then tracking.
            //
            // Week start and temperature unit live in the tracking group
            // rather than up here, even though both are presentation
            // choices. A group called "tracking preferences" holding only
            // two unit pickers, while the switches that decide what is
            // actually tracked sat under a separate heading much further
            // down, read as a misfiled section. Temperature unit in
            // particular only means anything to someone who turns on the
            // basal temperature tracker, which is now the next control
            // after it.
            _groupHeading(context, l10n.settingsGroupAppearance),
            const LanguagePickerTile(),
            // Light/dark is a card too, for the same reason the unit
            // pickers are: a heading floating above a segmented button ties
            // the two together only by proximity.
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
              child: _SettingCard(
                icon: Icons.brightness_6_outlined,
                tint: AppPalette.lavenderSoft,
                ink: AppPalette.lavenderSoftText,
                label: l10n.settingsThemeLabel,
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
            ),
            const SizedBox(height: 6),
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
                    HomeTheme.dusk: l10n.homeThemeDusk,
                    HomeTheme.meadow: l10n.homeThemeMeadow,
                    HomeTheme.petal: l10n.homeThemePetal,
                    HomeTheme.bloom: l10n.homeThemeBloom,
                  }.entries)
                    Padding(
                      // Directional: in RTL the gap belongs after the
                      // swatch in reading order, not on its physical right.
                      padding: const EdgeInsetsDirectional.only(end: 10),
                      child: _ThemeSwatch(
                        label: entry.value,
                        theme: entry.key,
                        // The companion previews inside the swatch, so
                        // picking a background shows the scene you will
                        // actually land on rather than an empty backdrop.
                        mascot: prefs.mascot,
                        // The user's actual choice, not the one currently
                        // rendered: a lapsed Premium theme stays ticked
                        // here so resubscribing restores it, and so the
                        // picker never shows two swatches as selected.
                        selected: prefs.selectedHomeTheme == entry.key,
                        // Locked swatches are shown, not hidden: seeing what
                        // Premium adds is the honest version of an upsell.
                        locked: entry.key.premium && !prefs.premiumActive,
                        onTap: () => entry.key.premium && !prefs.premiumActive
                            ? _openPremium(context)
                            : prefs.setHomeTheme(entry.key),
                      ),
                    ),
                ],
              ),
            ),
            _sectionHeading(context, l10n.settingsMascotLabel),
            // Characters, not words. The picker listed "Droplet", "Flower",
            // "Moon" as text chips — you had to choose a companion you could
            // not see, then leave Settings to find out what you picked. They
            // are drawn characters; showing them is the whole point of
            // having them.
            SizedBox(
              height: 108,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                children: [
                  for (final entry in {
                    Mascot.droplet: l10n.mascotDroplet,
                    Mascot.flower: l10n.mascotFlower,
                    Mascot.moon: l10n.mascotMoon,
                    Mascot.star: l10n.mascotStar,
                    Mascot.leaf: l10n.mascotLeaf,
                    Mascot.none: l10n.mascotNone,
                  }.entries)
                    _MascotOption(
                      mascot: entry.key,
                      label: entry.value,
                      selected: prefs.selectedMascot == entry.key,
                      locked: entry.key.premium && !prefs.premiumActive,
                      onTap: () => entry.key.premium && !prefs.premiumActive
                          ? _openPremium(context)
                          : prefs.setMascot(entry.key),
                    ),
                ],
              ),
            ),
            const Divider(height: 32),
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: PremiumLock(
                title: l10n.customTagManageEntry,
                description: l10n.premiumBenefitCustomTrackers,
                // Still reachable without Premium: renaming and deleting
                // your own trackers is managing your own data, and locking
                // the door on it would strand whatever you recorded before
                // the subscription lapsed.
                lockedPreview: context.watch<CycleController>().customTags.isEmpty
                    ? null
                    : Card(
                        child: ListTile(
                          title: Text(l10n.customTagManageEntry),
                          trailing: const Icon(Icons.chevron_right),
                          onTap: () => Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (_) => const CustomTagsScreen())),
                        ),
                      ),
                child: Card(
                  child: ListTile(
                    title: Text(l10n.customTagManageEntry),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () => Navigator.of(context).push(MaterialPageRoute(
                        builder: (_) => const CustomTagsScreen())),
                  ),
                ),
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
                                  builder: (_) =>
                                      const CustomRemindersScreen())),
                        ),
                      ),
                child: Card(
                  child: ListTile(
                    title: Text(l10n.customRemindersEntry),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () => Navigator.of(context).push(MaterialPageRoute(
                        builder: (_) => const CustomRemindersScreen())),
                  ),
                ),
              ),
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
            _groupHeading(context, l10n.settingsGroupTracking),
            // Both unit choices sit in cards, like every other settings
            // screen in the app. They were bare controls on the page
            // background: a heading, a segmented button, a heading, another
            // segmented button, with nothing tying either label to the
            // control under it.
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 4, 16, 0),
              child: _SettingCard(
                icon: Icons.view_week_outlined,
                tint: AppPalette.skySoft,
                ink: AppPalette.skySoftText,
                label: l10n.settingsWeekStartLabel,
                // Three options now, not two: ar, fa and ur conventionally
                // start the week on Saturday, which the old Monday/Sunday
                // switch could not express at all.
                //
                // The labels come from `intl` rather than from ARB keys, so
                // they are correct in all 36 languages for free and no new
                // string has to be translated 36 times to add a weekday.
                child: SegmentedButton<int>(
                  segments: [
                    for (final weekday in const [
                      DateTime.monday,
                      DateTime.sunday,
                      DateTime.saturday,
                    ])
                      ButtonSegment(
                        value: weekday,
                        label: Text(_weekdayName(context, weekday)),
                      ),
                  ],
                  // Unset means "follow the locale", so show what the locale
                  // actually does rather than a hardcoded Monday. Touching
                  // the control pins the choice.
                  selected: {
                    prefs.weekStartWeekday ?? _localeFirstWeekday(context),
                  },
                  onSelectionChanged: (s) =>
                      prefs.setWeekStartWeekday(s.first),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 10, 16, 0),
              child: _SettingCard(
                icon: Icons.thermostat_outlined,
                tint: AppPalette.terracottaSoft,
                ink: AppPalette.terracottaSoftText,
                label: l10n.settingsTemperatureUnitLabel,
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
            ),
            const SizedBox(height: 14),
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
            // Required to stay reachable wherever the user's region
            // mandates it, so it is rendered unconditionally rather than
            // hidden behind an async region check.
            ListTile(
              title: Text(l10n.settingsAdPrivacyEntry),
              trailing: const Icon(Icons.chevron_right),
              onTap: () async {
                final messenger = ScaffoldMessenger.of(context);
                final shown =
                    await const AdConsentService().showPrivacyOptions();
                if (shown) return;
                messenger.hideCurrentSnackBar();
                messenger.showSnackBar(SnackBar(
                  content: Text(l10n.settingsAdPrivacyUnavailable),
                  behavior: SnackBarBehavior.floating,
                  duration: const Duration(seconds: 5),
                ));
              },
            ),
            ListTile(
              title: Text(l10n.settingsPrivacyEntry),
              trailing: const Icon(Icons.chevron_right),
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => const PrivacyScreen()),
              ),
            ),
            if (HealthSyncService.isSupported) ...[
              SwitchListTile(
                title: Text(l10n.settingsHealthSyncLabel),
                subtitle: Text(l10n.settingsHealthSyncBody),
                value: prefs.healthSyncEnabled,
                onChanged: (v) => _toggleHealthSync(context, v),
              ),
            ],
            ListTile(
              title: Text(l10n.settingsImportEntry),
              trailing: const Icon(Icons.chevron_right),
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => const ImportScreen()),
              ),
            ),
            ListTile(
              title: Text(l10n.settingsExportEntry),
              trailing: const Icon(Icons.chevron_right),
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => const ExportScreen()),
              ),
            ),
            // Only once something has actually been recorded. A permanent
            // "Diagnostics" row led, for almost every user forever, to a
            // screen saying nothing had gone wrong — an entry that exists
            // to advertise the possibility of crashes.
            FutureBuilder<String?>(
              future: CrashLog.instance.read(),
              builder: (context, snapshot) {
                if (snapshot.data == null) return const SizedBox.shrink();
                return ListTile(
                  title: Text(l10n.settingsDiagnosticsEntry),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (_) => const DiagnosticsScreen()),
                  ),
                );
              },
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

  void _openPremium(BuildContext context) => Navigator.of(context).push(
        MaterialPageRoute(builder: (_) => const PremiumScreen()),
      );

  Widget _sectionHeading(BuildContext context, String text) => Padding(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
        child: Text(text, style: Theme.of(context).textTheme.titleMedium),
      );

  /// One level above [_sectionHeading]: names a whole group of related
  /// settings, in the accent colour so the two tiers read as a hierarchy
  /// rather than as identical repeated labels.
  Widget _groupHeading(BuildContext context, String text) => Padding(
        padding: const EdgeInsets.fromLTRB(16, 20, 16, 4),
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

class _ThemeSwatch extends StatelessWidget {
  const _ThemeSwatch({
    required this.label,
    required this.theme,
    required this.selected,
    required this.onTap,
    required this.mascot,
    this.locked = false,
  });

  final String label;
  final HomeTheme theme;
  final Mascot mascot;
  final bool selected;
  final VoidCallback onTap;
  final bool locked;

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
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: selected ? scheme.primary : scheme.outlineVariant,
                width: selected ? 3 : 1,
              ),
              image: asset == null
                  ? null
                  : DecorationImage(
                      image: ResizeImage(AssetImage(asset), width: 186),
                      fit: BoxFit.cover,
                      // Dimmed rather than blurred out: the point is to show
                      // what it looks like, not to tease it.
                      opacity: locked ? 0.45 : 1,
                    ),
              gradient: asset == null ? const AppPaletteGradient() : null,
            ),
            child: locked
                ? Icon(Icons.lock_outline, size: 20, color: scheme.primary)
                : mascot != Mascot.none
                    ? Align(
                        alignment: AlignmentDirectional.bottomStart,
                        child: Padding(
                          padding: const EdgeInsets.all(4),
                          child: MascotAvatar(mascot: mascot, size: 24),
                        ),
                      )
                : null,
          ),
          const SizedBox(height: 4),
          Text(label, style: Theme.of(context).textTheme.labelSmall),
        ],
      ),
    );
  }
}

/// One companion in the picker: the character itself, its name, and a lock
/// when it is a Premium one.
class _MascotOption extends StatelessWidget {
  const _MascotOption({
    required this.mascot,
    required this.label,
    required this.selected,
    required this.locked,
    required this.onTap,
  });

  final Mascot mascot;
  final String label;
  final bool selected;
  final bool locked;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;

    return Padding(
      padding: const EdgeInsetsDirectional.only(end: 10),
      child: Material(
        color: selected
            ? scheme.primary.withValues(alpha: 0.12)
            : scheme.surfaceContainerLow,
        borderRadius: BorderRadius.circular(20),
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: onTap,
          child: Container(
            width: 86,
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: selected
                    ? scheme.primary
                    : scheme.outlineVariant.withValues(alpha: 0.5),
                width: selected ? 1.6 : 1,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 52,
                  child: Center(
                    child: mascot == Mascot.none
                        ? Icon(Icons.do_not_disturb_alt,
                            size: 30, color: scheme.onSurfaceVariant)
                        : Stack(
                            alignment: Alignment.center,
                            children: [
                              MascotAvatar(mascot: mascot, size: 46),
                              if (locked)
                                Positioned(
                                  right: 0,
                                  bottom: 0,
                                  child: Icon(Icons.lock,
                                      size: 15, color: scheme.primary),
                                ),
                            ],
                          ),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  label,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: theme.textTheme.labelSmall?.copyWith(
                    color: selected ? scheme.primary : scheme.onSurface,
                    fontWeight: selected ? FontWeight.w700 : null,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// A settings control in a card with its own label and colour — the same
/// shape the prediction-settings screen uses, so a unit picker in Settings
/// looks like a unit picker anywhere else in the app.
class _SettingCard extends StatelessWidget {
  const _SettingCard({
    required this.icon,
    required this.tint,
    required this.ink,
    required this.label,
    required this.child,
  });

  final IconData icon;
  final Color tint;
  final Color ink;
  final String label;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final panel = isDark
        ? Color.alphaBlend(
            tint.withValues(alpha: 0.09), theme.colorScheme.surface)
        : tint.withValues(alpha: 0.45);
    final badge = isDark ? tint.withValues(alpha: 0.16) : tint;
    final labelInk = isDark ? tint : ink;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(16, 14, 16, 16),
      decoration: BoxDecoration(
        color: panel,
        borderRadius: BorderRadius.circular(22),
        border: isDark ? Border.all(color: tint.withValues(alpha: 0.18)) : null,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 32,
                height: 32,
                decoration:
                    BoxDecoration(shape: BoxShape.circle, color: badge),
                child: Icon(icon, size: 17, color: labelInk),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(label,
                    style:
                        theme.textTheme.titleSmall?.copyWith(color: labelInk)),
              ),
            ],
          ),
          const SizedBox(height: 12),
          child,
        ],
      ),
    );
  }
}
