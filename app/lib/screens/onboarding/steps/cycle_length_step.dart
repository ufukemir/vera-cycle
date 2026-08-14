import 'package:flutter/material.dart';

import '../../../l10n/app_localizations.dart';
import '../../../widgets/number_stepper.dart';
import 'onboarding_question_scaffold.dart';

/// Bounds match [PredictionEngine.minPlausibleLength]/`maxPlausibleLength` so
/// onboarding never accepts a number the engine would later discard.
class CycleLengthStep extends StatefulWidget {
  const CycleLengthStep({
    super.key,
    required this.onSkip,
    required this.onContinue,
  });

  final VoidCallback onSkip;
  final ValueChanged<int> onContinue;

  @override
  State<CycleLengthStep> createState() => _CycleLengthStepState();
}

class _CycleLengthStepState extends State<CycleLengthStep> {
  int _value = 28;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return OnboardingQuestionScaffold(
      photoAsset: 'assets/photos/greenery_smile.jpg',
      title: l10n.onboardingCycleLengthTitle,
      body: l10n.onboardingCycleLengthBody,
      onSkip: widget.onSkip,
      onContinue: () => widget.onContinue(_value),
      content: NumberStepper(
        value: _value,
        min: 15,
        max: 90,
        unitLabel: l10n.onboardingDaysUnit,
        onChanged: (v) => setState(() => _value = v),
      ),
    );
  }
}
