import 'package:flutter/material.dart';

import '../../../l10n/app_localizations.dart';
import '../../../widgets/illustrations.dart';

/// Yes / No as large circular buttons plus a quieter "Not sure" underneath —
/// the reference app's playful answer layout, rebuilt with original
/// illustration work. Used for onboarding questions whose answer is purely
/// conversational (never fed into PredictionEngine or stored), mirroring
/// the discard pattern already used for the self-reported cycle length. All
/// three options simply advance via [onAnswer]; which one was tapped is
/// intentionally not distinguished, since nothing reads it.
class ThreeChoiceQuestionStep extends StatelessWidget {
  const ThreeChoiceQuestionStep({
    super.key,
    required this.title,
    required this.body,
    required this.onAnswer,
    this.scene = IllustrationScene.calendarFlowers,
  });

  final String title;
  final String body;
  final VoidCallback onAnswer;
  final IllustrationScene scene;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Spacer(),
              HeroIllustration(scene: scene, height: 190),
              const SizedBox(height: 24),
              Text(title,
                  style: Theme.of(context).textTheme.headlineSmall,
                  textAlign: TextAlign.center),
              const SizedBox(height: 12),
              Text(body,
                  style: Theme.of(context).textTheme.bodyMedium,
                  textAlign: TextAlign.center),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _CircleAnswerButton(
                    label: l10n.commonYes,
                    filled: true,
                    onTap: onAnswer,
                  ),
                  _CircleAnswerButton(
                    label: l10n.commonNo,
                    filled: false,
                    onTap: onAnswer,
                  ),
                ],
              ),
              const SizedBox(height: 12),
              TextButton(
                onPressed: onAnswer,
                child: Text(l10n.commonNotSure),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _CircleAnswerButton extends StatelessWidget {
  const _CircleAnswerButton({
    required this.label,
    required this.filled,
    required this.onTap,
  });

  final String label;
  final bool filled;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Material(
      shape: const CircleBorder(),
      color: filled ? scheme.primary : scheme.surfaceContainerHigh,
      child: InkWell(
        customBorder: const CircleBorder(),
        onTap: onTap,
        child: SizedBox(
          width: 108,
          height: 108,
          child: Center(
            child: Text(
              label,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: filled ? scheme.onPrimary : scheme.onSurface,
                    fontWeight: FontWeight.w700,
                  ),
            ),
          ),
        ),
      ),
    );
  }
}
