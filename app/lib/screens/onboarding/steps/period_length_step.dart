import 'package:flutter/material.dart';

import '../../../l10n/app_localizations.dart';
import '../../../widgets/number_wheel.dart';
import '../../../widgets/illustrations.dart';
import 'onboarding_question_scaffold.dart';

class PeriodLengthStep extends StatefulWidget {
  const PeriodLengthStep({
    super.key,
    required this.onSkip,
    required this.onContinue,
    required this.progress,
    this.onBack,
  });

  final VoidCallback onSkip;
  final ValueChanged<int> onContinue;
  final double progress;
  final VoidCallback? onBack;

  @override
  State<PeriodLengthStep> createState() => _PeriodLengthStepState();
}

class _PeriodLengthStepState extends State<PeriodLengthStep> {
  int _value = 5;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return OnboardingQuestionScaffold(
      scene: IllustrationScene.dropletFriend,
      title: l10n.onboardingPeriodLengthTitle,
      body: l10n.onboardingPeriodLengthBody,
      photoAsset: 'assets/photos/sleeping_soft.jpg',
      progress: widget.progress,
      onBack: widget.onBack,
      compactHero: true,
      onSkip: widget.onSkip,
      onContinue: () => widget.onContinue(_value),
      content: NumberWheel(
        value: _value,
        min: 1,
        max: 14,
        unitLabel: l10n.onboardingDaysUnit,
        onChanged: (v) => setState(() => _value = v),
      ),
    );
  }
}
