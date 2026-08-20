import 'package:flutter/material.dart';

import '../../../models/enums.dart';
import '../../../models/prediction.dart';
import '../../../widgets/illustrations.dart';

String? homeThemeAsset(HomeTheme theme) {
  switch (theme) {
    case HomeTheme.wheat:
      return 'assets/photos/theme_wheat.jpg';
    case HomeTheme.sky:
      return 'assets/photos/theme_sky.jpg';
    case HomeTheme.field:
      return 'assets/photos/theme_field.jpg';
    case HomeTheme.blossom:
      return 'assets/photos/theme_blossom.jpg';
    case HomeTheme.plain:
      return null;
    case HomeTheme.dusk:
      return 'assets/photos/theme_dusk.jpg';
    case HomeTheme.meadow:
      return 'assets/photos/theme_meadow.jpg';
    case HomeTheme.petal:
      return 'assets/photos/theme_petal.jpg';
    case HomeTheme.bloom:
      return 'assets/photos/theme_bloom.jpg';
  }
}

/// The full-bleed scenic hero at the top of Home: a themed photo, the
/// headline number in large serif, a secondary line, and a pill CTA — the
/// reference app's home layout rebuilt with our own palette, typography,
/// and openly-licensed photography.
///
/// The copy stays honest: the big number is either the cycle day (a fact)
/// or a "~N days" countdown derived from the prediction *range*, never a
/// single confident date.
class HomeHero extends StatelessWidget {
  const HomeHero({
    super.key,
    required this.theme,
    required this.status,
    required this.headline,
    required this.eyebrow,
    this.secondary,
    required this.ctaLabel,
    required this.onCtaPressed,
    required this.mascot,
  });

  final HomeTheme theme;
  final CycleStatus status;

  /// Small label above the number ("Period", "Cycle day"…).
  final String eyebrow;

  /// The large line — a day count or countdown.
  final String headline;

  /// Optional supporting line (ovulation countdown).
  final String? secondary;

  final String ctaLabel;
  final VoidCallback onCtaPressed;
  final Mascot mascot;

  @override
  Widget build(BuildContext context) {
    final asset = homeThemeAsset(theme);
    final scheme = Theme.of(context).colorScheme;
    final onPhoto = asset != null;
    final textColor = onPhoto ? Colors.white : scheme.onSurface;

    // Half the screen, not a fixed 330. The hero used to be a banner with a
    // list of cards under it; it is now the screen you land on, so it has to
    // hold the eye on its own. Clamped at both ends so a small phone still
    // shows the card beneath and a tall one does not turn it into a poster.
    final height =
        (MediaQuery.sizeOf(context).height * 0.52).clamp(330.0, 480.0);
    final topInset = MediaQuery.paddingOf(context).top;

    return SizedBox(
      height: height,
      width: double.infinity,
      child: Stack(
        fit: StackFit.expand,
        children: [
          if (asset != null)
            Image.asset(asset, fit: BoxFit.cover)
          else
            const DecoratedBox(
              decoration: BoxDecoration(gradient: AppPaletteGradient()),
            ),
          if (onPhoto)
            const DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: [0, 0.45, 1],
                  colors: [Color(0x40000000), Color(0x1A000000), Color(0xB3000000)],
                ),
              ),
            ),
          // The mascot stands in the scene rather than floating in a corner
          // of it — it is part of the picture, which is the whole point of
          // having one.
          PositionedDirectional(
            start: 20,
            bottom: 24,
            child: MascotAvatar(mascot: mascot, size: 92),
          ),
          Positioned.fill(
            child: Padding(
              padding: EdgeInsets.fromLTRB(24, topInset + 16, 24, 56),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    eyebrow,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: textColor.withValues(alpha: 0.92),
                          letterSpacing: 0.4,
                        ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    headline,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.displayMedium?.copyWith(
                          color: textColor,
                          fontWeight: FontWeight.w600,
                          height: 1.05,
                        ),
                  ),
                  if (secondary != null) ...[
                    const SizedBox(height: 6),
                    Text(
                      secondary!,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: textColor.withValues(alpha: 0.92),
                          ),
                    ),
                  ],
                  const SizedBox(height: 20),
                  FilledButton(
                    onPressed: onCtaPressed,
                    style: FilledButton.styleFrom(
                      backgroundColor:
                          onPhoto ? Colors.white : scheme.primary,
                      foregroundColor:
                          onPhoto ? scheme.primary : scheme.onPrimary,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 28, vertical: 16),
                    ),
                    child: Text(ctaLabel),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// Fallback gradient for [HomeTheme.plain].
class AppPaletteGradient extends LinearGradient {
  const AppPaletteGradient()
      : super(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: const [Color(0xFFFFD9E4), Color(0xFFFFE3D4)],
        );
}
