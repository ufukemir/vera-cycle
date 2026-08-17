import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../services/launch_intent.dart';
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

  @override
  void initState() {
    super.initState();
    _readLaunchAction();
  }

  Future<void> _readLaunchAction() async {
    final action = await const LaunchIntent().take();
    if (!mounted || action == null) return;
    setState(() => _launchAction = action);
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
