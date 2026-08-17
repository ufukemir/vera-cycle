import 'package:flutter/material.dart';

import '../../../l10n/app_localizations.dart';
import '../../../widgets/number_stepper.dart';

/// Water/sleep/weight — lifestyle stats shown to everyone, unlike the
/// fertility-awareness/intimate trackers in [OptionalTrackersSection]. Water
/// is a single tap-to-add glass (250ml); sleep and weight open a small
/// picker dialog since they need a specific value.
class QuickStatsRow extends StatelessWidget {
  const QuickStatsRow({
    super.key,
    required this.waterIntakeMl,
    required this.onWaterChanged,
    required this.sleepMinutes,
    required this.onSleepChanged,
    required this.weightKg,
    required this.onWeightChanged,
  });

  final int? waterIntakeMl;
  final ValueChanged<int?> onWaterChanged;
  final int? sleepMinutes;
  final ValueChanged<int?> onSleepChanged;
  final double? weightKg;
  final ValueChanged<double?> onWeightChanged;

  static const _waterStepMl = 250;
  static const _waterMaxMl = 4000;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    // IntrinsicHeight, not CrossAxisAlignment.stretch: this row lives in a
    // ListView, where the cross axis is unbounded — stretching there asks
    // for infinite height and throws before the screen ever paints.
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: _StatCard(
              icon: Icons.water_drop_outlined,
              label: l10n.dayLogWaterLabel,
              value: waterIntakeMl == null ? '—' : '${waterIntakeMl}ml',
              onTap: () {
                final next = (waterIntakeMl ?? 0) + _waterStepMl;
                onWaterChanged(next > _waterMaxMl ? _waterMaxMl : next);
              },
              onLongPress: waterIntakeMl == null
                  ? null
                  : () => onWaterChanged(null),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: _StatCard(
              icon: Icons.bedtime_outlined,
              label: l10n.dayLogSleepLabel,
              value: sleepMinutes == null ? '—' : _formatSleep(sleepMinutes!),
              onTap: () => _pickSleep(context),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: _StatCard(
              icon: Icons.monitor_weight_outlined,
              label: l10n.dayLogWeightLabel,
              value: weightKg == null
                  ? '—'
                  : '${weightKg!.toStringAsFixed(1)}kg',
              onTap: () => _pickWeight(context),
            ),
          ),
        ],
      ),
    );
  }

  static String _formatSleep(int minutes) {
    final h = minutes ~/ 60;
    final m = minutes % 60;
    return m == 0 ? '${h}h' : '${h}h${m}m';
  }

  Future<void> _pickSleep(BuildContext context) async {
    var hours = (sleepMinutes ?? 0) ~/ 60;
    var minutes = (sleepMinutes ?? 0) % 60;
    final l10n = AppLocalizations.of(context)!;

    final result = await showDialog<int>(
      context: context,
      builder: (dialogContext) {
        return StatefulBuilder(
          builder: (dialogContext, setState) => AlertDialog(
            title: Text(l10n.dayLogSleepLabel),
            content: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                NumberStepper(
                  value: hours,
                  min: 0,
                  max: 16,
                  unitLabel: 'h',
                  onChanged: (v) => setState(() => hours = v),
                ),
                NumberStepper(
                  value: minutes,
                  min: 0,
                  max: 59,
                  unitLabel: 'm',
                  onChanged: (v) => setState(() => minutes = v),
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(dialogContext),
                child: Text(
                  MaterialLocalizations.of(dialogContext).cancelButtonLabel,
                ),
              ),
              FilledButton(
                onPressed: () =>
                    Navigator.pop(dialogContext, hours * 60 + minutes),
                child: Text(
                  MaterialLocalizations.of(dialogContext).okButtonLabel,
                ),
              ),
            ],
          ),
        );
      },
    );

    if (result != null) onSleepChanged(result == 0 ? null : result);
  }

  Future<void> _pickWeight(BuildContext context) async {
    final controller = TextEditingController(
      text: weightKg == null ? '' : weightKg!.toStringAsFixed(1),
    );
    final l10n = AppLocalizations.of(context)!;

    final result = await showDialog<String>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: Text(l10n.dayLogWeightLabel),
        content: TextField(
          controller: controller,
          autofocus: true,
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
          decoration: const InputDecoration(suffixText: 'kg'),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext),
            child: Text(
              MaterialLocalizations.of(dialogContext).cancelButtonLabel,
            ),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(dialogContext, controller.text),
            child: Text(MaterialLocalizations.of(dialogContext).okButtonLabel),
          ),
        ],
      ),
    );

    if (result == null) return;
    final parsed = double.tryParse(result.trim().replaceAll(',', '.'));
    onWeightChanged(parsed);
  }
}

class _StatCard extends StatelessWidget {
  const _StatCard({
    required this.icon,
    required this.label,
    required this.value,
    required this.onTap,
    this.onLongPress,
  });

  final IconData icon;
  final String label;
  final String value;
  final VoidCallback onTap;
  final VoidCallback? onLongPress;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Material(
      color: theme.colorScheme.surfaceContainerHigh,
      borderRadius: BorderRadius.circular(20),
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: onTap,
        onLongPress: onLongPress,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
          child: Column(
            children: [
              Icon(icon, color: theme.colorScheme.primary),
              const SizedBox(height: 6),
              Text(value, style: theme.textTheme.titleMedium),
              const SizedBox(height: 2),
              Text(label, style: theme.textTheme.bodySmall),
            ],
          ),
        ),
      ),
    );
  }
}
