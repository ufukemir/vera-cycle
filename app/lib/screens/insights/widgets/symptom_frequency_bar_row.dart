import 'package:flutter/material.dart';

/// A hand-rolled bar per cycle day — deliberately not a charting package.
/// At ~10 bars this doesn't need axes, tooltips, or zoom; a charting
/// dependency would be pure overhead for something this small.
class SymptomFrequencyBarRow extends StatelessWidget {
  const SymptomFrequencyBarRow({
    super.key,
    required this.frequencyByCycleDay,
    required this.maxCycleDay,
  });

  final Map<int, int> frequencyByCycleDay;
  final int maxCycleDay;

  static const _maxBarHeight = 64.0;
  static const _minBarHeight = 4.0;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final maxCount = frequencyByCycleDay.values.isEmpty
        ? 0
        : frequencyByCycleDay.values.reduce((a, b) => a > b ? a : b);

    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        for (var day = 1; day <= maxCycleDay; day++)
          Expanded(
            child: Column(
              children: [
                Container(
                  height: maxCount == 0
                      ? _minBarHeight
                      : _minBarHeight +
                          (_maxBarHeight - _minBarHeight) *
                              (frequencyByCycleDay[day] ?? 0) /
                              maxCount,
                  margin: const EdgeInsets.symmetric(horizontal: 2),
                  decoration: BoxDecoration(
                    color: scheme.primary,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                const SizedBox(height: 4),
                Text('$day', style: Theme.of(context).textTheme.bodySmall),
              ],
            ),
          ),
      ],
    );
  }
}
