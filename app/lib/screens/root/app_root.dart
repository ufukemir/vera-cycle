import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../state/app_lock_controller.dart';
import '../../state/app_preferences.dart';
import '../../state/cycle_controller.dart';
import '../home/home_shell.dart';
import '../lock/lock_screen.dart';
import '../onboarding/onboarding_flow.dart';
import 'splash_screen.dart';

/// A state machine, not a route: splash → onboarding → lock → home.
///
/// Each branch replaces the entire widget tree rather than layering on top,
/// so — critically for the lock branch — [HomeShell] and everything under it
/// is never mounted while locked, not merely obscured. The prediction card,
/// a logged symptom, calendar markers: none of it should exist in the widget
/// tree behind the lock screen, even transiently.
class AppRoot extends StatelessWidget {
  const AppRoot({super.key});

  @override
  Widget build(BuildContext context) {
    final prefs = context.watch<AppPreferences>();
    final cycle = context.watch<CycleController>();
    final lock = context.watch<AppLockController>();

    if (cycle.loading) return const SplashScreen();
    if (!prefs.onboardingComplete) return const OnboardingFlow();
    if (lock.state == AppLockState.locked) return const LockScreen();
    return const HomeShell();
  }
}
