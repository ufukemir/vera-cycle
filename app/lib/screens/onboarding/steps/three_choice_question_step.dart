import 'package:flutter/material.dart';

import '../../../l10n/app_localizations.dart';
import 'onboarding_choice_scaffold.dart';

/// Yes / No / Not sure — used for onboarding questions whose answer is
/// purely conversational (never fed into PredictionEngine or stored),
/// mirroring the discard pattern already used for the self-reported cycle
/// length. All three options simply advance via [onAnswer]; which one was
/// tapped is intentionally not distinguished, since nothing reads it.
class ThreeChoiceQuestionStep extends StatelessWidget {
  const ThreeChoiceQuestionStep({
    super.key,
    required this.title,
    required this.body,
    required this.onAnswer,
  });

  final String title;
  final String body;
  final VoidCallback onAnswer;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return OnboardingChoiceScaffold<String>(
      title: title,
      body: body,
      onSelected: (_) => onAnswer(),
      options: [
        OnboardingChoiceOption(value: 'yes', label: l10n.commonYes),
        OnboardingChoiceOption(value: 'no', label: l10n.commonNo),
        OnboardingChoiceOption(value: 'notSure', label: l10n.commonNotSure),
      ],
    );
  }
}
