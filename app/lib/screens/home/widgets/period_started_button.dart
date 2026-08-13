import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../l10n/app_localizations.dart';
import '../../../state/cycle_controller.dart';
import '../../../util/day.dart';

/// One-tap period logging. Uses a snackbar with Undo rather than a
/// confirmation dialog — real friction belongs on destructive actions
/// (erase-everything), not on ordinary data entry.
class PeriodStartedButton extends StatelessWidget {
  const PeriodStartedButton({super.key});

  Future<void> _handleTap(BuildContext context) async {
    final l10n = AppLocalizations.of(context)!;
    final controller = context.read<CycleController>();
    final previous = controller.logFor(today());

    await controller.markPeriodStartedToday();
    if (!context.mounted) return;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(l10n.homePeriodStartedSnackbar),
        action: SnackBarAction(
          label: l10n.actionUndo,
          onPressed: () {
            if (previous != null) {
              controller.upsertDay(previous);
            } else {
              controller.deleteDay(today());
            }
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return FilledButton.icon(
      onPressed: () => _handleTap(context),
      icon: const Icon(Icons.water_drop_outlined),
      label: Text(l10n.homePeriodStartedButton),
    );
  }
}
