import 'package:flutter/material.dart';

import '../../../l10n/app_localizations.dart';

/// Back, progress, skip — the strip that sits above every onboarding step.
///
/// Onboarding had none of this. Ten screens with no indication of how many
/// were left and no way back is the shape of a form people abandon: a
/// mistyped date could only be fixed by killing the app and starting over,
/// and every screen felt like it might be the first of fifty.
///
/// [progress] is a real fraction of the real step count, not a decorative
/// bar that fills at a fixed rate — a progress indicator that lies is worse
/// than none, and this app has a whole principle about that.
class OnboardingHeader extends StatelessWidget {
  const OnboardingHeader({
    super.key,
    required this.progress,
    this.onBack,
    this.onSkip,
  });

  /// 0–1. Shown as a bar; never animates ahead of the actual step.
  final double progress;

  /// Omitted on the first step, where there is nothing to go back to.
  final VoidCallback? onBack;

  /// Omitted on steps that must be answered (the PIN, the privacy promise).
  final VoidCallback? onSkip;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final scheme = Theme.of(context).colorScheme;

    // A Stack, not a three-column Row: "Skip" is one word in English and
    // three in Turkish, so a fixed side column either clipped the pill or
    // pushed the bar off centre depending on the language. Stacking centres
    // the bar on the screen regardless of what the buttons measure.
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 8, 12, 4),
      child: SizedBox(
        height: 48,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Semantics(
              value: '${(progress * 100).round()}%',
              child: ClipRRect(
                borderRadius: BorderRadius.circular(99),
                child: SizedBox(
                  width: 140,
                  child: LinearProgressIndicator(
                    value: progress.clamp(0.0, 1.0),
                    minHeight: 8,
                    backgroundColor: scheme.onSurface.withValues(alpha: 0.10),
                  ),
                ),
              ),
            ),
            if (onBack != null)
              Align(
                alignment: AlignmentDirectional.centerStart,
                child: IconButton(
                  onPressed: onBack,
                  icon: const Icon(Icons.chevron_left),
                  tooltip:
                      MaterialLocalizations.of(context).backButtonTooltip,
                  style: IconButton.styleFrom(
                    backgroundColor: scheme.onSurface.withValues(alpha: 0.06),
                  ),
                ),
              ),
            if (onSkip != null)
              Align(
                alignment: AlignmentDirectional.centerEnd,
                child: TextButton(
                  onPressed: onSkip,
                  style: TextButton.styleFrom(
                    shape: const StadiumBorder(),
                    backgroundColor: scheme.onSurface.withValues(alpha: 0.06),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 8),
                    minimumSize: Size.zero,
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                  child: Text(l10n.actionSkip),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
