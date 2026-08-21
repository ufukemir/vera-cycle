import 'package:flutter/material.dart';

import '../../../l10n/app_localizations.dart';
import '../../../widgets/number_wheel.dart';
import 'onboarding_question_scaffold.dart';

/// Birth year, asked and then let go.
///
/// It follows the same rule the class doc on [OnboardingFlow] states for
/// cycle length, regularity and cramps: nothing here may ever feed a
/// prediction-shaped estimate, and age is no exception — this app makes no
/// age-based medical inference (CLAUDE.md principle 7). The question earns
/// its place for a plainer reason: an onboarding sequence about a body ought
/// to ask how old that body is, the way every comparable app does, and a
/// flow that skips straight from "why are you here" to "when was your last
/// period" reads as incomplete next to one that doesn't.
class BirthYearStep extends StatefulWidget {
  const BirthYearStep({
    super.key,
    required this.onSkip,
    required this.onContinue,
    required this.progress,
    this.onBack,
  });

  final VoidCallback onSkip;
  final VoidCallback onContinue;
  final double progress;
  final VoidCallback? onBack;

  @override
  State<BirthYearStep> createState() => _BirthYearStepState();
}

class _BirthYearStepState extends State<BirthYearStep> {
  // A wheel needs a concrete starting value even though the answer is
  // discarded either way; a round, unremarkable year rather than "now"
  // avoids the wheel opening on its own newest, most eye-catching end.
  int _value = 1998;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return OnboardingQuestionScaffold(
      photoAsset: 'assets/photos/tea_in_hands.jpg',
      title: l10n.onboardingBirthYearTitle,
      body: l10n.onboardingBirthYearBody,
      progress: widget.progress,
      onBack: widget.onBack,
      compactHero: true,
      onSkip: widget.onSkip,
      onContinue: widget.onContinue,
      content: NumberWheel(
        value: _value,
        min: 1940,
        max: DateTime.now().year - 8,
        onChanged: (v) => setState(() => _value = v),
        useGrouping: false,
      ),
    );
  }
}
