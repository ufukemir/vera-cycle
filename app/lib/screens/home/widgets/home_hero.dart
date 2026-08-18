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
    // Over a photo the text is white with a scrim; on the plain theme it
    // uses normal surface colors so contrast holds in both light and dark.
    final textColor = onPhoto ? Colors.white : scheme.onSurface;

    return ClipRRect(
      borderRadius: const BorderRadius.vertical(bottom: Radius.circular(32)),
      child: SizedBox(
        height: 330,
        width: double.infinity,
        child: Stack(
          fit: StackFit.expand,
          children: [
            if (asset != null)
              Image.asset(asset, fit: BoxFit.cover)
            else
              DecoratedBox(
                decoration: const BoxDecoration(gradient: AppPaletteGradient()),
              ),
            if (onPhoto)
              const DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Color(0x33000000), Color(0x99000000)],
                  ),
                ),
              ),
            Positioned.fill(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(24, 24, 24, 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      eyebrow,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            color: textColor.withValues(alpha: 0.9),
                          ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      headline,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.displaySmall?.copyWith(
                            color: textColor,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                    if (secondary != null) ...[
                      const SizedBox(height: 4),
                      Text(
                        secondary!,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: textColor.withValues(alpha: 0.9),
                            ),
                      ),
                    ],
                    const SizedBox(height: 16),
                    FilledButton(
                      onPressed: onCtaPressed,
                      style: FilledButton.styleFrom(
                        backgroundColor: scheme.primary,
                        foregroundColor: scheme.onPrimary,
                      ),
                      child: Text(ctaLabel),
                    ),
                  ],
                ),
              ),
            ),
            PositionedDirectional(
              end: 16,
              bottom: 12,
              child: MascotAvatar(mascot: mascot, size: 64),
            ),
          ],
        ),
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
