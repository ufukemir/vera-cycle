import 'package:flutter/material.dart';

import '../../../l10n/app_localizations.dart';
import '../../../widgets/organic_blob_background.dart';

/// A short "getting things ready" screen shown after PIN setup and before
/// landing on Home. [widget.onFinished] — which does the real work (seeding
/// logs, flipping `onboardingComplete`, unlocking) — only fires once the
/// checklist finishes, so [AppRoot] doesn't swap this screen out from under
/// itself mid-animation. The checklist itself ticks on a fixed, short timer
/// (~2.2s total): it never blocks on anything real, since there's nothing
/// slow to wait for — see CLAUDE.md, animation must decorate, not hide or
/// delay real information.
class BuildingPlanStep extends StatefulWidget {
  const BuildingPlanStep({super.key, required this.onFinished});

  final VoidCallback onFinished;

  @override
  State<BuildingPlanStep> createState() => _BuildingPlanStepState();
}

class _BuildingPlanStepState extends State<BuildingPlanStep> {
  static const _stepDuration = Duration(milliseconds: 550);
  int _completedSteps = 0;

  @override
  void initState() {
    super.initState();
    _advance();
  }

  Future<void> _advance() async {
    for (var i = 0; i < 3; i++) {
      await Future<void>.delayed(_stepDuration);
      if (!mounted) return;
      setState(() => _completedSteps = i + 1);
    }
    await Future<void>.delayed(_stepDuration);
    if (!mounted) return;
    widget.onFinished();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final steps = [
      l10n.onboardingBuildingPlanStep1,
      l10n.onboardingBuildingPlanStep2,
      l10n.onboardingBuildingPlanStep3,
    ];

    return Scaffold(
      body: OrganicBlobBackground(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  _completedSteps >= steps.length
                      ? l10n.onboardingBuildingPlanDone
                      : l10n.onboardingBuildingPlanTitle,
                  style: Theme.of(context).textTheme.headlineSmall,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 32),
                for (var i = 0; i < steps.length; i++)
                  _ChecklistRow(label: steps[i], done: i < _completedSteps),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _ChecklistRow extends StatelessWidget {
  const _ChecklistRow({required this.label, required this.done});

  final String label;
  final bool done;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            child: done
                ? Icon(Icons.check_circle, key: const ValueKey('done'), color: scheme.primary)
                : SizedBox(
                    key: const ValueKey('pending'),
                    width: 24,
                    height: 24,
                    child: CircularProgressIndicator(strokeWidth: 2, color: scheme.outline),
                  ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              label,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: done ? null : scheme.onSurfaceVariant,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
