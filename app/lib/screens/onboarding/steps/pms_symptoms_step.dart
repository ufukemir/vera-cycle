import 'package:flutter/material.dart';

import '../../../l10n/app_localizations.dart';
import '../../../l10n/enum_labels.dart';
import '../../../models/enums.dart';
import '../../../theme/app_theme.dart';
import '../../../theme/log_icons.dart';
import '../../../widgets/option_chip.dart';
import 'onboarding_question_scaffold.dart';

/// "What usually shows up beforehand?" — multi-select, discarded like
/// [BirthYearStep] and the regularity/cramps steps before it.
///
/// A user's own list would be the obvious thing to carry into the day log
/// as a shortcut, but doing that quietly changes what onboarding is: instead
/// of one honest question, it becomes a setup step whose answer configures
/// the app, which needs its own undo path if the answer stops being true a
/// few cycles later. The plain question, asked and let go, doesn't need one.
class PmsSymptomsStep extends StatefulWidget {
  const PmsSymptomsStep({
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
  State<PmsSymptomsStep> createState() => _PmsSymptomsStepState();
}

class _PmsSymptomsStepState extends State<PmsSymptomsStep> {
  static const _options = [
    Symptom.cramps,
    Symptom.bloating,
    Symptom.fatigue,
    Symptom.breastTenderness,
    Symptom.headache,
    Symptom.appetiteChange,
    Symptom.sleepTrouble,
    Symptom.backPain,
  ];

  final Set<Symptom> _selected = {};

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return OnboardingQuestionScaffold(
      photoAsset: 'assets/photos/couch_blanket_nap.jpg',
      title: l10n.onboardingPmsTitle,
      body: l10n.onboardingPmsBody,
      progress: widget.progress,
      onBack: widget.onBack,
      onSkip: widget.onSkip,
      onContinue: widget.onContinue,
      content: OptionChipWrap(
        children: [
          for (final symptom in _options)
            OptionChip(
              icon: LogIcons.symptom(symptom),
              label: symptomLabel(l10n, symptom),
              selected: _selected.contains(symptom),
              tint: AppPalette.lavenderSoft,
              ink: AppPalette.lavenderSoftText,
              onTap: () => setState(() {
                _selected.contains(symptom)
                    ? _selected.remove(symptom)
                    : _selected.add(symptom);
              }),
            ),
        ],
      ),
    );
  }
}
