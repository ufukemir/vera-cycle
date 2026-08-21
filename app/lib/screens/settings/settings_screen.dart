import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../l10n/app_localizations.dart';
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
import '../premium/premium_screen.dart';
import '../../theme/app_theme.dart';
import '../../widgets/premium_lock.dart';
import '../partner/partner_mode_screen.dart';
import 'custom_tags_screen.dart';
import 'diagnostics_screen.dart';
import 'feedback_screen.dart';
import 'prediction_settings_screen.dart';
import 'privacy_screen.dart';
import 'rate_app_screen.dart';
import 'reminders_screen.dart';
import 'theme_screen.dart';
import 'widgets/language_picker_tile.dart';

/// Localized weekday name, e.g. "Monday" / "Pazartesi" / "السبت".
///
/// Taken from `intl` rather than from ARB keys: adding Saturday as an
/// option would otherwise have meant one more string to translate into
/// every language, for a word every locale database already knows.
String _weekdayName(BuildContext context, int weekday) {
  // Any week works; 2024-01-01 was a Monday, so +offset lands on the day.
  final date = DateTime(2024, 1, 1).add(Duration(days: weekday - 1));
  return DateFormat.EEEE(
    Localizations.localeOf(context).toString(),
  ).format(date);
}

int _localeFirstWeekday(BuildContext context) =>
    switch (MaterialLocalizations.of(context).firstDayOfWeekIndex) {
      0 => DateTime.sunday,
      6 => DateTime.saturday,
      _ => DateTime.monday,
    };

/// Shrinks a [SegmentedButton] to fit a compact settings row — the default
/// sizing is comfortable as the sole control under a full [_SettingCard]
/// heading, but two of them stacked in one grouped card read as oversized
/// next to the group's own row height.
final ButtonStyle _compactSegmentStyle = SegmentedButton.styleFrom(
  visualDensity: VisualDensity.compact,
  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
  textStyle: const TextStyle(fontSize: 12.5),
);

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

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
        ..showSnackBar(
          SnackBar(
            content: Text(l10n.healthSyncDenied),
            behavior: SnackBarBehavior.floating,
            margin: const EdgeInsets.all(16),
          ),
        );
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
      ..showSnackBar(
        SnackBar(
          content: Text(l10n.healthSyncBackfilled(count)),
          behavior: SnackBarBehavior.floating,
          margin: const EdgeInsets.all(16),
        ),
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
            // Theme mode, home background and mascot moved to their own
            // screen (also reachable as the profile screen's "Tema" quick
            // action) — a real destination rather than "Ayarlar" scrolled to
            // a different spot, which read as the same tap twice.
            ListTile(
              leading: Icon(
                Icons.checkroom_outlined,
                color: Theme.of(context).colorScheme.primary,
              ),
              title: Text(l10n.settingsThemeLabel),
              trailing: const Icon(Icons.chevron_right),
              onTap: () => Navigator.of(
                context,
              ).push(MaterialPageRoute(builder: (_) => const ThemeScreen())),
            ),
            const Divider(height: 32),
            // Reminders moved to their own screen: eight switches in the
            // middle of Settings meant scrolling a long page to answer "is
            // the water one on?".
            ListTile(
              leading: Icon(
                Icons.notifications_active_outlined,
                color: Theme.of(context).colorScheme.primary,
              ),
              title: Text(l10n.remindersScreenTitle),
              trailing: const Icon(Icons.chevron_right),
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => const RemindersScreen()),
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.favorite_outline,
                color: Theme.of(context).colorScheme.primary,
              ),
              title: Text(l10n.partnerModeEntry),
              trailing: const Icon(Icons.chevron_right),
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => const PartnerModeScreen()),
              ),
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
                lockedPreview:
                    context.watch<CycleController>().customTags.isEmpty
                    ? null
                    : Card(
                        child: ListTile(
                          title: Text(l10n.customTagManageEntry),
                          trailing: const Icon(Icons.chevron_right),
                          onTap: () => Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => const CustomTagsScreen(),
                            ),
                          ),
                        ),
                      ),
                child: Card(
                  child: ListTile(
                    title: Text(l10n.customTagManageEntry),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => const CustomTagsScreen(),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const Divider(),
            _groupHeading(context, l10n.settingsGroupTracking),
            // One card, not two stacked full-height ones. Both are small
            // unit pickers a person sets once and rarely revisits — giving
            // each its own tinted panel with a 32px icon badge weighed as
            // much on screen as the reminder toggles and the custom-tracker
            // manager above them, which is what someone actually came to
            // this screen to change. Grouped under a shared roof with a
            // compact row each, the way iOS groups a whole block of
            // low-stakes settings under one table section.
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 4, 16, 0),
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surfaceContainerHigh,
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Column(
                  children: [
                    _CompactPreferenceRow(
                      icon: Icons.view_week_outlined,
                      tint: AppPalette.skySoft,
                      ink: AppPalette.skySoftText,
                      label: l10n.settingsWeekStartLabel,
                      // Three options now, not two: ar, fa and ur
                      // conventionally start the week on Saturday, which the
                      // old Monday/Sunday switch could not express at all.
                      //
                      // The labels come from `intl` rather than from ARB
                      // keys, so they are correct in all 36 languages for
                      // free and no new string has to be translated 36 times
                      // to add a weekday.
                      child: SegmentedButton<int>(
                        style: _compactSegmentStyle,
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
                        // Unset means "follow the locale", so show what the
                        // locale actually does rather than a hardcoded
                        // Monday. Touching the control pins the choice.
                        selected: {
                          prefs.weekStartWeekday ??
                              _localeFirstWeekday(context),
                        },
                        onSelectionChanged: (s) =>
                            prefs.setWeekStartWeekday(s.first),
                      ),
                    ),
                    Divider(
                      height: 1,
                      indent: 16,
                      endIndent: 16,
                      color: Theme.of(
                        context,
                      ).colorScheme.outlineVariant.withValues(alpha: 0.5),
                    ),
                    _CompactPreferenceRow(
                      icon: Icons.thermostat_outlined,
                      tint: AppPalette.terracottaSoft,
                      ink: AppPalette.terracottaSoftText,
                      label: l10n.settingsTemperatureUnitLabel,
                      child: SegmentedButton<TemperatureUnit>(
                        style: _compactSegmentStyle,
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
                        onSelectionChanged: (s) =>
                            prefs.setTemperatureUnit(s.first),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 14),
            _sectionHeading(context, l10n.settingsOptionalTrackersHeading),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                l10n.settingsOptionalTrackersBody,
                style: Theme.of(context).textTheme.bodySmall,
              ),
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
                subtitle: Text(
                  prefs.pregnancyLmp == null
                      ? l10n.pregnancyNeedsLmp
                      : MaterialLocalizations.of(
                          context,
                        ).formatMediumDate(prefs.pregnancyLmp!),
                ),
                trailing: const Icon(Icons.calendar_today_outlined),
                onTap: () => _pickLmp(context, prefs),
              ),
            const Divider(),
            ListTile(
              leading: Icon(
                Icons.workspace_premium_outlined,
                color: Theme.of(context).colorScheme.primary,
              ),
              title: Text(l10n.settingsPremiumEntry),
              subtitle: prefs.premiumActive
                  ? Text(l10n.premiumActiveBadge)
                  : null,
              trailing: const Icon(Icons.chevron_right),
              onTap: () => Navigator.of(
                context,
              ).push(MaterialPageRoute(builder: (_) => const PremiumScreen())),
            ),
            ListTile(
              title: Text(l10n.predictionSettingsEntry),
              trailing: const Icon(Icons.chevron_right),
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => const PredictionSettingsScreen(),
                ),
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
                final shown = await const AdConsentService()
                    .showPrivacyOptions();
                if (shown) return;
                messenger.hideCurrentSnackBar();
                messenger.showSnackBar(
                  SnackBar(
                    content: Text(l10n.settingsAdPrivacyUnavailable),
                    behavior: SnackBarBehavior.floating,
                    duration: const Duration(seconds: 5),
                  ),
                );
              },
            ),
            ListTile(
              title: Text(l10n.settingsPrivacyEntry),
              trailing: const Icon(Icons.chevron_right),
              onTap: () => Navigator.of(
                context,
              ).push(MaterialPageRoute(builder: (_) => const PrivacyScreen())),
            ),
            ListTile(
              leading: Icon(
                Icons.star_outline,
                color: Theme.of(context).colorScheme.primary,
              ),
              title: Text(l10n.settingsRateEntry),
              trailing: const Icon(Icons.chevron_right),
              onTap: () => Navigator.of(
                context,
              ).push(MaterialPageRoute(builder: (_) => const RateAppScreen())),
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
              onTap: () => Navigator.of(
                context,
              ).push(MaterialPageRoute(builder: (_) => const ImportScreen())),
            ),
            ListTile(
              title: Text(l10n.settingsExportEntry),
              trailing: const Icon(Icons.chevron_right),
              onTap: () => Navigator.of(
                context,
              ).push(MaterialPageRoute(builder: (_) => const ExportScreen())),
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
                      builder: (_) => const DiagnosticsScreen(),
                    ),
                  ),
                );
              },
            ),
            ListTile(
              title: Text(l10n.feedbackEntry),
              trailing: const Icon(Icons.chevron_right),
              onTap: () => Navigator.of(
                context,
              ).push(MaterialPageRoute(builder: (_) => const FeedbackScreen())),
            ),
            ListTile(
              title: Text(
                l10n.settingsDeleteAllData,
                style: TextStyle(color: errorColor),
              ),
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

/// One row inside a shared grouped card — an icon-badge and label at a
/// lighter weight than a full card needs, since the card's own background
/// already does the grouping a tinted panel would otherwise provide.
class _CompactPreferenceRow extends StatelessWidget {
  const _CompactPreferenceRow({
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
    final badge = isDark ? tint.withValues(alpha: 0.16) : tint;
    final labelInk = isDark ? tint : ink;

    return Padding(
      padding: const EdgeInsets.fromLTRB(14, 12, 14, 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(shape: BoxShape.circle, color: badge),
                child: Icon(icon, size: 13, color: labelInk),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  label,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          child,
        ],
      ),
    );
  }
}
