import 'package:flutter/material.dart';

import '../../../l10n/app_localizations.dart';
import '../../../util/day.dart';
import 'onboarding_question_scaffold.dart';

class LastPeriodStep extends StatefulWidget {
  const LastPeriodStep({
    super.key,
    required this.onSkip,
    required this.onContinue,
  });

  final VoidCallback onSkip;
  final ValueChanged<DateTime> onContinue;

  @override
  State<LastPeriodStep> createState() => _LastPeriodStepState();
}

class _LastPeriodStepState extends State<LastPeriodStep> {
  DateTime? _picked;

  Future<void> _pickDate() async {
    final now = today();
    final result = await showDatePicker(
      context: context,
      initialDate: _picked ?? now,
      firstDate: addDays(now, -365),
      lastDate: now,
    );
    if (result != null) setState(() => _picked = dateOnly(result));
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return OnboardingQuestionScaffold(
      title: l10n.onboardingLastPeriodTitle,
      body: l10n.onboardingLastPeriodBody,
      onSkip: widget.onSkip,
      onContinue: () {
        final picked = _picked;
        if (picked != null) {
          widget.onContinue(picked);
        } else {
          widget.onSkip();
        }
      },
      content: OutlinedButton.icon(
        onPressed: _pickDate,
        icon: const Icon(Icons.calendar_today_outlined),
        label: Text(_picked == null
            ? l10n.onboardingPickDate
            : dayKey(_picked!)),
      ),
    );
  }
}
