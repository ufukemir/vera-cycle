import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../l10n/app_localizations.dart';
import '../../../models/day_log.dart';
import '../../../models/enums.dart';
import '../../../state/cycle_controller.dart';
import '../../../util/day.dart';

/// Shown while there is genuinely nothing logged.
///
/// A brand-new install otherwise lands on a home screen full of dashes
/// and empty states with no hint of what to do. This says the one thing
/// that matters — mark the day your period starts — and sets the honest
/// expectation that predictions need two full cycles first, so their
/// absence doesn't read as the app being broken.
class FirstRunCard extends StatelessWidget {
  const FirstRunCard({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<CycleController>();
    if (controller.logs.isNotEmpty) return const SizedBox.shrink();

    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: theme.colorScheme.primaryContainer.withValues(alpha: 0.6),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.waving_hand_outlined,
                  size: 20, color: theme.colorScheme.onPrimaryContainer),
              const SizedBox(width: 8),
              Expanded(
                child:
                    Text(l10n.homeEmptyTitle, style: theme.textTheme.titleSmall),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(l10n.homeEmptyBody, style: theme.textTheme.bodySmall),
          const SizedBox(height: 8),
          Align(
            alignment: AlignmentDirectional.centerEnd,
            child: TextButton(
              onPressed: () => _pickPastStart(context),
              child: Text(l10n.homeEmptyBackdate),
            ),
          ),
        ],
      ),
    );
  }

  /// Most people install mid-cycle, so "it already started earlier" is the
  /// common case, not an edge case.
  Future<void> _pickPastStart(BuildContext context) async {
    final controller = context.read<CycleController>();
    final now = today();
    final picked = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: addDays(now, -120),
      lastDate: now,
    );
    if (picked == null) return;
    await controller.upsertDay(
      DayLog(date: dateOnly(picked), flow: FlowIntensity.medium),
    );
  }
}
