import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../l10n/app_localizations.dart';
import '../../services/prediction_engine.dart';
import '../../theme/app_theme.dart';
import '../../state/app_preferences.dart';
import '../../state/cycle_controller.dart';
import '../../widgets/number_stepper.dart';

/// Exposes the assumptions [PredictionEngine] and [CycleRing] otherwise hide
/// inside code — in the same spirit as the rest of the app's honesty
/// principle, but pointed inward at our own defaults instead of just at the
/// prediction output.
///
/// Two of these numbers (period/cycle length) are purely decorative once
/// real data exists — see [AppPreferences.estimatedCycleLengthDays]'s doc
/// comment — and the screen says so explicitly rather than letting a user
/// believe editing them changes the real Home prediction.
class PredictionSettingsScreen extends StatelessWidget {
  const PredictionSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final prefs = context.watch<AppPreferences>();

    return Scaffold(
      appBar: AppBar(title: Text(l10n.predictionSettingsEntry)),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            _IntroNote(text: l10n.predictionSettingsIntro),
            const SizedBox(height: 20),
            _SettingCard(
              icon: Icons.water_drop_outlined,
              tint: AppPalette.roseSoft,
              ink: AppPalette.roseSoftText,
              label: l10n.predictionSettingsPeriodLengthLabel,
              hint: null,
              child: NumberStepper(
                value: prefs.estimatedPeriodLengthDays,
                min: 1,
                max: 14,
                unitLabel: l10n.onboardingDaysUnit,
                onChanged: (v) => prefs.setEstimatedPeriodLengthDays(v),
              ),
            ),
            const SizedBox(height: 14),
            _SettingCard(
              icon: Icons.autorenew_rounded,
              tint: AppPalette.skySoft,
              ink: AppPalette.skySoftText,
              label: l10n.predictionSettingsCycleLengthLabel,
              hint: l10n.predictionSettingsCycleLengthHint,
              child: NumberStepper(
                value: prefs.estimatedCycleLengthDays,
                min: 15,
                max: 90,
                unitLabel: l10n.onboardingDaysUnit,
                onChanged: (v) => prefs.setEstimatedCycleLengthDays(v),
              ),
            ),
            const SizedBox(height: 14),
            _SettingCard(
              icon: Icons.timelapse_rounded,
              tint: AppPalette.goldSoft,
              ink: AppPalette.goldSoftText,
              label: l10n.predictionSettingsLutealLabel,
              hint: l10n.predictionSettingsLutealHint,
              child: NumberStepper(
                value: prefs.lutealPhaseDays,
                min: 8,
                max: 20,
                unitLabel: l10n.onboardingDaysUnit,
                onChanged: (v) async {
                  await prefs.setLutealPhaseDays(v);
                  if (!context.mounted) return;
                  context.read<CycleController>().updatePredictionEngine(
                        PredictionEngine(lutealPhaseDays: v),
                      );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// The "these are assumptions, not your data" note.
///
/// It was the first paragraph of plain body text on the screen, which is
/// where a caveat goes to be skipped. Boxed and marked, it reads as the
/// framing for everything below it — which is what it is: without it, three
/// steppers labelled "typical cycle length" look like the controls that
/// drive the real prediction.
class _IntroNote extends StatelessWidget {
  const _IntroNote({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: scheme.primary.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: scheme.primary.withValues(alpha: 0.22)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.info_outline_rounded, size: 20, color: scheme.primary),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              text,
              style: theme.textTheme.bodyMedium?.copyWith(height: 1.45),
            ),
          ),
        ],
      ),
    );
  }
}

class _SettingCard extends StatelessWidget {
  const _SettingCard({
    required this.icon,
    required this.tint,
    required this.ink,
    required this.label,
    required this.hint,
    required this.child,
  });

  final IconData icon;
  final Color tint;
  final Color ink;
  final String label;
  final String? hint;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final panel = isDark
        ? Color.alphaBlend(
            tint.withValues(alpha: 0.09), theme.colorScheme.surface)
        : tint.withValues(alpha: 0.45);
    final badge = isDark ? tint.withValues(alpha: 0.16) : tint;
    final labelInk = isDark ? tint : ink;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 18),
      decoration: BoxDecoration(
        color: panel,
        borderRadius: BorderRadius.circular(22),
        border:
            isDark ? Border.all(color: tint.withValues(alpha: 0.18)) : null,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 32,
                height: 32,
                decoration:
                    BoxDecoration(shape: BoxShape.circle, color: badge),
                child: Icon(icon, size: 17, color: labelInk),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(label,
                    style:
                        theme.textTheme.titleMedium?.copyWith(color: labelInk)),
              ),
            ],
          ),
          if (hint != null) ...[
            const SizedBox(height: 8),
            Text(hint!,
                style: theme.textTheme.bodySmall?.copyWith(height: 1.4)),
          ],
          const SizedBox(height: 14),
          Center(child: child),
        ],
      ),
    );
  }
}
