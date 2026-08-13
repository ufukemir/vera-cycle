import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/day_log.dart';
import '../../models/enums.dart';
import '../../state/app_lock_controller.dart';
import '../../state/app_preferences.dart';
import '../../state/cycle_controller.dart';
import '../../util/day.dart';
import '../lock/pin_setup_screen.dart';
import 'steps/cycle_length_step.dart';
import 'steps/last_period_step.dart';
import 'steps/period_length_step.dart';
import 'steps/welcome_privacy_step.dart';

enum _Step { privacy, lastPeriod, cycleLength, periodLength, pin }

/// Onboarding: privacy promise → 3 skippable questions → mandatory PIN setup.
///
/// All answers live in local ephemeral state here — nothing is written to
/// [AppPreferences] or [CycleController] until [_finish] runs at the very
/// end, so backing out mid-flow (killing the app, etc.) never leaves a
/// half-onboarded state.
///
/// The self-reported cycle length is deliberately collected and then
/// discarded rather than stored anywhere: per the product decision recorded
/// in docs/01-mvp-spec.md and the implementation plan, it must never feed a
/// prediction-shaped estimate, and there is no other use for it in v1.
class OnboardingFlow extends StatefulWidget {
  const OnboardingFlow({super.key});

  @override
  State<OnboardingFlow> createState() => _OnboardingFlowState();
}

class _OnboardingFlowState extends State<OnboardingFlow> {
  _Step _step = _Step.privacy;
  DateTime? _lastPeriodStart;
  int? _periodLength;

  Future<void> _finish() async {
    final cycleController = context.read<CycleController>();
    final start = _lastPeriodStart;

    if (start != null) {
      final length = _periodLength ?? 1;
      for (var i = 0; i < length; i++) {
        await cycleController.upsertDay(
          DayLog(date: addDays(start, i), flow: FlowIntensity.medium),
        );
      }
    }

    if (!mounted) return;
    await context.read<AppPreferences>().setOnboardingComplete(true);
    if (!mounted) return;
    context.read<AppLockController>().unlockAfterSetup();
  }

  @override
  Widget build(BuildContext context) {
    switch (_step) {
      case _Step.privacy:
        return WelcomePrivacyStep(
          onContinue: () => setState(() => _step = _Step.lastPeriod),
        );
      case _Step.lastPeriod:
        return LastPeriodStep(
          onSkip: () => setState(() => _step = _Step.cycleLength),
          onContinue: (date) => setState(() {
            _lastPeriodStart = date;
            _step = _Step.cycleLength;
          }),
        );
      case _Step.cycleLength:
        return CycleLengthStep(
          onSkip: () => setState(() => _step = _Step.periodLength),
          // The value itself is intentionally not kept — see class doc.
          onContinue: (_) => setState(() => _step = _Step.periodLength),
        );
      case _Step.periodLength:
        return PeriodLengthStep(
          onSkip: () => setState(() => _step = _Step.pin),
          onContinue: (days) => setState(() {
            _periodLength = days;
            _step = _Step.pin;
          }),
        );
      case _Step.pin:
        return PinSetupScreen(onComplete: _finish);
    }
  }
}
