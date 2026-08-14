import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../l10n/app_localizations.dart';
import '../../services/prediction_engine.dart';
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
            Text(l10n.predictionSettingsIntro,
                style: Theme.of(context).textTheme.bodyMedium),
            const SizedBox(height: 28),
            _SettingRow(
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
            const SizedBox(height: 24),
            _SettingRow(
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
            const SizedBox(height: 24),
            _SettingRow(
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

class _SettingRow extends StatelessWidget {
  const _SettingRow({required this.label, required this.hint, required this.child});

  final String label;
  final String? hint;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: theme.textTheme.titleMedium),
        if (hint != null) ...[
          const SizedBox(height: 4),
          Text(hint!, style: theme.textTheme.bodySmall),
        ],
        const SizedBox(height: 12),
        Center(child: child),
      ],
    );
  }
}
