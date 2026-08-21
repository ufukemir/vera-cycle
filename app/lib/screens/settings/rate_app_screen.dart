import 'package:flutter/material.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:provider/provider.dart';

import '../../l10n/app_localizations.dart';
import '../../state/app_preferences.dart';
import '../../theme/app_theme.dart';
import '../../widgets/illustrations.dart';

/// Asks for a store rating — reachable from Settings, never a popup that
/// fires on its own. An unprompted rating sheet on launch is the pattern
/// this screen deliberately isn't: no "we noticed you've used this 5 times"
/// trigger, no gate that only routes a five-star tap to the store and
/// quietly swallows anything lower. The stars here are decoration, not a
/// filter — every rating leads to the same button, because a rating this
/// app can selectively suppress isn't an honest one.
class RateAppScreen extends StatefulWidget {
  const RateAppScreen({super.key});

  @override
  State<RateAppScreen> createState() => _RateAppScreenState();
}

class _RateAppScreenState extends State<RateAppScreen> {
  int _hoveredStars = 5;

  Future<void> _rate() async {
    final review = InAppReview.instance;
    // requestReviewIfAvailable shows the OS's own in-place sheet when the
    // platform allows it (a quota Apple/Google enforce, not this app); the
    // store listing is the honest fallback rather than a dead button.
    if (await review.isAvailable()) {
      await review.requestReview();
    } else {
      // No App Store ID to fall back on until Vera actually has a listing;
      // harmless no-op on iOS until then. Fill this in at launch.
      await review.openStoreListing();
    }
    if (mounted) Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;
    final mascot = context.watch<AppPreferences>().mascot;

    return Scaffold(
      backgroundColor: scheme.surface,
      body: DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppPalette.roseSoft.withValues(alpha: 0.6),
              scheme.surface,
            ],
          ),
        ),
        child: SafeArea(
          child: Stack(
            children: [
              Positioned(
                top: 4,
                left: 4,
                child: IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      MascotAvatar(mascot: mascot, size: 96),
                      const SizedBox(height: 24),
                      Text(
                        l10n.rateAppTitle,
                        style: theme.textTheme.headlineSmall,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 12),
                      Text(
                        l10n.rateAppBody,
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: scheme.onSurfaceVariant,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 28),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          for (var i = 1; i <= 5; i++)
                            Semantics(
                              excludeSemantics: true,
                              child: IconButton(
                                onPressed: () =>
                                    setState(() => _hoveredStars = i),
                                icon: Icon(
                                  i <= _hoveredStars
                                      ? Icons.star
                                      : Icons.star_border,
                                  color: scheme.primary,
                                  size: 32,
                                ),
                              ),
                            ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        width: double.infinity,
                        child: FilledButton(
                          onPressed: _rate,
                          style: FilledButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 16),
                          ),
                          child: Text(l10n.rateAppCta),
                        ),
                      ),
                      const SizedBox(height: 8),
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(),
                        child: Text(l10n.rateAppDismiss),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
