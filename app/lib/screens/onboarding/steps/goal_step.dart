import 'package:flutter/material.dart';

import '../../../l10n/app_localizations.dart';
import '../../../models/enums.dart';
import 'onboarding_choice_scaffold.dart';

class GoalStep extends StatelessWidget {
  const GoalStep({super.key, required this.onContinue});

  final ValueChanged<Goal> onContinue;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return OnboardingChoiceScaffold<Goal>(
      photoAsset: 'assets/photos/seaside_smile.jpg',
      title: l10n.onboardingGoalTitle,
      body: l10n.onboardingGoalBody,
      onSelected: onContinue,
      options: [
        OnboardingChoiceOption(
          value: Goal.trackPeriod,
          label: l10n.goalTrackPeriod,
          icon: Icons.water_drop_outlined,
        ),
        OnboardingChoiceOption(
          value: Goal.tryingToConceive,
          label: l10n.goalTryingToConceive,
          icon: Icons.favorite_outline,
        ),
        OnboardingChoiceOption(
          value: Goal.pregnancyTracking,
          label: l10n.goalPregnancyTracking,
          icon: Icons.child_care_outlined,
        ),
      ],
    );
  }
}
