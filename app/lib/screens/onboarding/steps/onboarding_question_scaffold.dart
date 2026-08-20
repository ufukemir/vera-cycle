import 'package:flutter/material.dart';

import '../../../l10n/app_localizations.dart';
import '../../../widgets/illustrations.dart';
import 'onboarding_header.dart';

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
    required this.progress,
    this.onBack,
    this.scene,
    this.photoAsset,
    this.compactHero = false,
  });

  final String title;
  final String body;
  final Widget content;
  final VoidCallback onSkip;
  final VoidCallback onContinue;
  final IllustrationScene? scene;

  /// How far through onboarding this step sits, 0–1.
  final double progress;

  /// Null on the first step of the flow.
  final VoidCallback? onBack;

  /// When set, wins over [scene] — a real licensed photo hero.
  final String? photoAsset;

  /// Shrinks the hero so a tall control (a wheel) still fits without the
  /// page scrolling.
  final bool compactHero;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            OnboardingHeader(
              progress: progress,
              onBack: onBack,
              onSkip: onSkip,
            ),
            // The question scrolls; the buttons do not. A hero, a question
            // and a tall control together do not fit a short phone, and an
            // onboarding step whose Continue button is pushed off-screen is
            // one the user cannot finish. Pinning the actions also means
            // they are always in the same place across ten steps.
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(24, 8, 24, 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    if (photoAsset != null) ...[
                      PhotoHero(
                          asset: photoAsset!,
                          height: compactHero ? 130 : 200),
                      const SizedBox(height: 20),
                    ] else if (scene != null) ...[
                      HeroIllustration(
                          scene: scene!, height: compactHero ? 120 : 180),
                      const SizedBox(height: 20),
                    ],
                    Text(title,
                        style: theme.textTheme.headlineSmall,
                        textAlign: TextAlign.center),
                    const SizedBox(height: 12),
                    Text(body,
                        style: theme.textTheme.bodyMedium,
                        textAlign: TextAlign.center),
                    const SizedBox(height: 20),
                    content,
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 8, 24, 20),
              child: Row(
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
            ),
          ],
        ),
      ),
    );
  }
}
