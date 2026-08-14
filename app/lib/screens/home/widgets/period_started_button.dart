import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../l10n/app_localizations.dart';
import '../../../state/cycle_controller.dart';
import '../../../util/day.dart';

/// One-tap period logging. Uses a snackbar with Undo rather than a
/// confirmation dialog — real friction belongs on destructive actions
/// (erase-everything), not on ordinary data entry.
///
/// A brief icon-morph + scale pulse on tap gives the "this mattered" feedback
/// the redesign brief asked for, without a confetti package or anything that
/// delays the snackbar/undo affordance appearing.
class PeriodStartedButton extends StatefulWidget {
  const PeriodStartedButton({super.key});

  @override
  State<PeriodStartedButton> createState() => _PeriodStartedButtonState();
}

class _PeriodStartedButtonState extends State<PeriodStartedButton>
    with SingleTickerProviderStateMixin {
  late final AnimationController _pulse = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 260),
  );
  bool _justLogged = false;

  @override
  void dispose() {
    _pulse.dispose();
    super.dispose();
  }

  Future<void> _handleTap(BuildContext context) async {
    final l10n = AppLocalizations.of(context)!;
    final controller = context.read<CycleController>();
    final previous = controller.logFor(today());

    setState(() => _justLogged = true);
    _pulse.forward(from: 0).then((_) => _pulse.reverse());

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
            if (mounted) setState(() => _justLogged = false);
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return ScaleTransition(
      scale: Tween(begin: 1.0, end: 1.08)
          .chain(CurveTween(curve: Curves.easeOutBack))
          .animate(_pulse),
      child: FilledButton.icon(
        onPressed: () => _handleTap(context),
        icon: AnimatedSwitcher(
          duration: const Duration(milliseconds: 200),
          transitionBuilder: (child, anim) => ScaleTransition(scale: anim, child: child),
          child: Icon(
            _justLogged ? Icons.check_circle : Icons.water_drop_outlined,
            key: ValueKey(_justLogged),
          ),
        ),
        label: Text(l10n.homePeriodStartedButton),
      ),
    );
  }
}
