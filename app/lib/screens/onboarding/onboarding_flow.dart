import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../l10n/app_localizations.dart';
import '../../models/day_log.dart';
import '../../models/enums.dart';
import '../../state/app_lock_controller.dart';
import '../../state/app_preferences.dart';
import '../../state/cycle_controller.dart';
import '../../util/day.dart';
import '../lock/pin_setup_screen.dart';
import 'steps/building_plan_step.dart';
import 'steps/cycle_length_step.dart';
import 'steps/goal_step.dart';
import 'steps/last_period_step.dart';
import 'steps/notification_priming_step.dart';
import 'steps/period_length_step.dart';
import 'steps/three_choice_question_step.dart';
import 'steps/welcome_privacy_step.dart';

enum _Step {
  privacy,
  goal,
  lastPeriod,
  cycleLength,
  periodLength,
  regularity,
  cramps,
  notifications,
  pin,
  buildingPlan,
}

/// Onboarding: privacy promise → goal → 3 skippable cycle questions → 2
/// conversational yes/no questions → notification priming → mandatory PIN
/// setup → a short "building your plan" animation.
///
/// All answers live in local ephemeral state here — nothing is written to
/// [AppPreferences] or [CycleController] until [_finish] runs at the very
/// end (triggered by [BuildingPlanStep] once its animation completes), so
/// backing out mid-flow (killing the app, etc.) never leaves a
/// half-onboarded state.
///
/// The self-reported cycle length, and the regularity/cramps answers, are
/// deliberately collected and then discarded rather than stored anywhere:
/// per the product decision recorded in docs/01-mvp-spec.md and the
/// implementation plan, none of them may ever feed a prediction-shaped
/// estimate, and there is no other use for them in v1. Only [_goal] is
/// persisted, and only for light personalization — see [_finish].
class OnboardingFlow extends StatefulWidget {
  const OnboardingFlow({super.key});

  @override
  State<OnboardingFlow> createState() => _OnboardingFlowState();
}

class _OnboardingFlowState extends State<OnboardingFlow> {
  _Step _step = _Step.privacy;
  Goal _goal = Goal.trackPeriod;
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
    final prefs = context.read<AppPreferences>();
    await prefs.setGoal(_goal);
    // A light, real personalization: someone trying to conceive has an
    // immediate use for BBT/mucus tracking, unlike the default tracker.
    if (_goal == Goal.tryingToConceive) {
      await prefs.setBbtTrackingEnabled(true);
      await prefs.setMucusTrackingEnabled(true);
    }
    if (!mounted) return;
    await prefs.setOnboardingComplete(true);
    if (!mounted) return;
    context.read<AppLockController>().unlockAfterSetup();
  }

  @override
  Widget build(BuildContext context) {
    // A soft cross-fade + slide between steps — purely decorative sequencing,
    // never a delay: `key: ValueKey(_step)` swaps instantly underneath, the
    // animation only smooths how it *looks* mid-swap.
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 320),
      transitionBuilder: (child, animation) => FadeTransition(
        opacity: animation,
        child: SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(0.04, 0),
            end: Offset.zero,
          ).animate(CurvedAnimation(parent: animation, curve: Curves.easeOut)),
          child: child,
        ),
      ),
      child: KeyedSubtree(key: ValueKey(_step), child: _buildStep()),
    );
  }

  Widget _buildStep() {
    final l10n = AppLocalizations.of(context)!;
    switch (_step) {
      case _Step.privacy:
        return WelcomePrivacyStep(
          onContinue: () => setState(() => _step = _Step.goal),
        );
      case _Step.goal:
        return GoalStep(
          onContinue: (goal) => setState(() {
            _goal = goal;
            _step = _Step.lastPeriod;
          }),
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
          onSkip: () => setState(() => _step = _Step.regularity),
          onContinue: (days) => setState(() {
            _periodLength = days;
            _step = _Step.regularity;
          }),
        );
      case _Step.regularity:
        return ThreeChoiceQuestionStep(
          photoAsset: 'assets/photos/cheerful_bangs.jpg',
          title: l10n.onboardingRegularityTitle,
          body: l10n.onboardingRegularityBody,
          onAnswer: () => setState(() => _step = _Step.cramps),
        );
      case _Step.cramps:
        return ThreeChoiceQuestionStep(
          photoAsset: 'assets/photos/joyful_laugh.jpg',
          title: l10n.onboardingCrampsTitle,
          body: l10n.onboardingCrampsBody,
          onAnswer: () => setState(() => _step = _Step.notifications),
        );
      case _Step.notifications:
        return NotificationPrimingStep(
          onContinue: () => setState(() => _step = _Step.pin),
        );
      case _Step.pin:
        return PinSetupScreen(
          onComplete: () => setState(() => _step = _Step.buildingPlan),
        );
      case _Step.buildingPlan:
        return BuildingPlanStep(onFinished: _finish);
    }
  }
}
