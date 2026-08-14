import 'package:flutter/material.dart';

import '../../../l10n/app_localizations.dart';
import '../../../widgets/illustrations.dart';

/// Shared layout for a skippable onboarding question, with an illustrated
/// hero card up top (see [IllustrationScene]).
///
/// Skip and Continue render as equal-weight buttons, not a dismissive small
/// link for Skip — an onboarding question the user genuinely doesn't know the
/// answer to (a very common, expected case here) should never read as
/// "you're doing this wrong" (see docs/01-mvp-spec.md, dark-pattern principle).
class OnboardingQuestionScaffold extends StatelessWidget {
  const OnboardingQuestionScaffold({
    super.key,
    required this.title,
    required this.body,
    required this.content,
    required this.onSkip,
    required this.onContinue,
    this.scene,
    this.photoAsset,
  });

  final String title;
  final String body;
  final Widget content;
  final VoidCallback onSkip;
  final VoidCallback onContinue;
  final IllustrationScene? scene;

  /// When set, wins over [scene] — a real licensed photo hero.
  final String? photoAsset;

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
              if (photoAsset != null) ...[
                PhotoHero(asset: photoAsset!, height: 200),
                const SizedBox(height: 24),
              ] else if (scene != null) ...[
                HeroIllustration(scene: scene!, height: 180),
                const SizedBox(height: 24),
              ],
              Text(title,
                  style: Theme.of(context).textTheme.headlineSmall,
                  textAlign: TextAlign.center),
              const SizedBox(height: 12),
              Text(body,
                  style: Theme.of(context).textTheme.bodyMedium,
                  textAlign: TextAlign.center),
              const SizedBox(height: 32),
              content,
              const Spacer(),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: onSkip,
                      child: Text(l10n.commonIDontKnow),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: FilledButton(
                      onPressed: onContinue,
                      child: Text(l10n.actionContinue),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
