import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../l10n/app_localizations.dart';
import '../../../state/app_preferences.dart';
import '../../../state/cycle_controller.dart';
import '../../export/export_screen.dart';

/// Shows only once there's history worth losing, and only if it isn't
/// already backed up recently.
///
/// A local-only app's worst real-world outcome isn't a bug — it's a user
/// losing their phone and finding out their whole history went with it.
/// This is the one nudge the app makes unprompted, and it's dismissible.
class BackupNudgeCard extends StatefulWidget {
  const BackupNudgeCard({super.key});

  /// Nudge again this long after the last backup.
  static const staleAfter = Duration(days: 60);

  /// Don't nag before the user has data they'd actually miss.
  static const _minLoggedDays = 12;

  static bool shouldShow(AppPreferences prefs, CycleController controller) {
    if (!prefs.backupRemindersEnabled) return false;
    if (controller.logs.length < _minLoggedDays) return false;
    final last = prefs.lastBackupAt;
    if (last == null) return true;
    return DateTime.now().difference(last) > staleAfter;
  }

  @override
  State<BackupNudgeCard> createState() => _BackupNudgeCardState();
}

class _BackupNudgeCardState extends State<BackupNudgeCard> {
  // Dismissal is per-session only: deliberately not persisted, because a
  // permanently-dismissed warning about total data loss is worse than a
  // mildly repetitive one.
  bool _dismissed = false;

  @override
  Widget build(BuildContext context) {
    final prefs = context.watch<AppPreferences>();
    final controller = context.watch<CycleController>();
    if (_dismissed || !BackupNudgeCard.shouldShow(prefs, controller)) {
      return const SizedBox.shrink();
    }

    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    final last = prefs.lastBackupAt;
    final dateFmt = DateFormat.yMMMd(Localizations.localeOf(context).toString());

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: theme.colorScheme.secondaryContainer.withValues(alpha: 0.65),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.shield_outlined,
                  size: 20, color: theme.colorScheme.onSecondaryContainer),
              const SizedBox(width: 8),
              Expanded(
                child: Text(l10n.backupNudgeTitle,
                    style: theme.textTheme.titleSmall),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(l10n.backupNudgeBody, style: theme.textTheme.bodySmall),
          const SizedBox(height: 6),
          Text(
            last == null
                ? l10n.backupNever
                : l10n.backupLastDone(dateFmt.format(last)),
            style: theme.textTheme.labelSmall,
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () => setState(() => _dismissed = true),
                child: Text(l10n.backupNudgeDismiss),
              ),
              const SizedBox(width: 8),
              FilledButton(
                onPressed: () => Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => const ExportScreen()),
                ),
                child: Text(l10n.backupNudgeCta),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
