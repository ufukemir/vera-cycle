import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../l10n/app_localizations.dart';
import '../../services/launch_intent.dart';
import '../../services/reminder_service.dart';
import '../../state/app_lock_controller.dart';
import '../../state/app_preferences.dart';
import '../../state/cycle_controller.dart';
import '../home/home_shell.dart';
import '../lock/lock_screen.dart';
import '../onboarding/onboarding_flow.dart';
import '../settings/privacy_screen.dart';
import 'splash_screen.dart';

/// A state machine, not a route: splash → onboarding → lock → home.
///
/// Each branch replaces the entire widget tree rather than layering on top,
/// so — critically for the lock branch — [HomeShell] and everything under it
/// is never mounted while locked, not merely obscured. The prediction card,
/// a logged symptom, calendar markers: none of it should exist in the widget
/// tree behind the lock screen, even transiently.
class AppRoot extends StatefulWidget {
  const AppRoot({super.key});

  @override
  State<AppRoot> createState() => _AppRootState();
}

class _AppRootState extends State<AppRoot> {
  LaunchAction? _launchAction;
  bool _launchActionHandled = false;
  bool _remindersReconciled = false;

  @override
  void initState() {
    super.initState();
    _readLaunchAction();
    // After the first frame, so AppLocalizations is available for the
    // notification channel name.
    WidgetsBinding.instance.addPostFrameCallback((_) => _reconcileReminders());
  }

  Future<void> _readLaunchAction() async {
    final action = await const LaunchIntent().take();
    if (!mounted || action == null) return;
    setState(() => _launchAction = action);
  }

  /// Re-hands the user's own reminders to the OS on every launch.
  ///
  /// They used to be scheduled only at the moment of create/edit/toggle, so
  /// anything that cleared pending notifications behind the user's back
  /// left the list saying ON with nothing scheduled. This also cancels
  /// reminders that should no longer fire — the ones disabled, deleted, or
  /// left over from a lapsed subscription, which the user otherwise had no
  /// in-app way to silence.
  Future<void> _reconcileReminders() async {
    if (_remindersReconciled || !mounted) return;
    _remindersReconciled = true;

    final prefs = context.read<AppPreferences>();
    final reminders = context.read<ReminderService>();
    final l10n = AppLocalizations.of(context)!;
    final stored = prefs.customReminders;

    try {
      await reminders.reconcileCustomReminders(
        wanted: [
          for (final r in stored)
            if (r.enabled && prefs.premiumActive)
              (
                notificationId: r.notificationId,
                time: TimeOfDay(hour: r.hour, minute: r.minute),
                title: r.label,
              ),
        ],
        knownIds: [for (final r in stored) r.notificationId],
        channelName: l10n.customRemindersTitle,
      );
    } catch (_) {
      // Best-effort: a notification plugin that fails to initialize must
      // never keep the app off the home screen.
    }
  }

  @override
  Widget build(BuildContext context) {
    final prefs = context.watch<AppPreferences>();
    final cycle = context.watch<CycleController>();
    final lock = context.watch<AppLockController>();

    if (cycle.loading) return const SplashScreen();
    if (!prefs.onboardingComplete) return const OnboardingFlow();
    if (lock.state == AppLockState.locked) return const LockScreen();

    // Opened from Health Connect's "how does this app use my data?" — show
    // the answer rather than the home screen. Pushed after the shell so
    // dismissing it lands the user in the app proper, and only once: the
    // lock branch above still runs first, so this can't bypass the PIN.
    if (_launchAction == LaunchAction.privacyPolicy && !_launchActionHandled) {
      _launchActionHandled = true;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!mounted) return;
        Navigator.of(context).push(
          MaterialPageRoute(builder: (_) => const PrivacyScreen()),
        );
      });
    }

    return const HomeShell();
  }
}
