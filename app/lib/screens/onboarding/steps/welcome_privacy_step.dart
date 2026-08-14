import 'package:flutter/material.dart';

import '../../../l10n/app_localizations.dart';
import '../../../widgets/illustrations.dart';
import '../../../widgets/organic_blob_background.dart';

class WelcomePrivacyStep extends StatelessWidget {
  const WelcomePrivacyStep({super.key, required this.onContinue});

  final VoidCallback onContinue;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      body: OrganicBlobBackground(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // A gentle scale+fade entrance — the first thing a new user
                // sees, so it's the one place a little extra ceremony earns
                // its keep. See CLAUDE.md: motion here decorates, it never
                // delays or hides the actual privacy copy below it.
                TweenAnimationBuilder<double>(
                  tween: Tween(begin: 0, end: 1),
                  duration: const Duration(milliseconds: 700),
                  curve: Curves.easeOutBack,
                  builder: (context, t, child) => Transform.scale(
                    scale: 0.7 + 0.3 * t,
                    child: Opacity(opacity: t.clamp(0, 1), child: child),
                  ),
                  child: const HeroIllustration(
                    scene: IllustrationScene.shieldHeart,
                    height: 190,
                  ),
                ),
                const SizedBox(height: 24),
                Text(
                  l10n.onboardingPrivacyTitle,
                  style: Theme.of(context).textTheme.headlineMedium,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                Text(
                  l10n.onboardingPrivacyBody,
                  style: Theme.of(context).textTheme.bodyLarge,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 32),
                FilledButton(
                  onPressed: onContinue,
                  child: Text(l10n.actionContinue),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
