import 'package:flutter/material.dart';

/// A minus/value/plus row for a small bounded integer — cycle and period
/// lengths only ever range over a couple dozen plausible values, so a
/// stepper avoids both the fiddliness of a slider and the free-text
/// validation a raw number field would need.
class NumberStepper extends StatelessWidget {
  const NumberStepper({
    super.key,
    required this.value,
    required this.min,
    required this.max,
    required this.onChanged,
    this.unitLabel,
    this.step = 1,
  });

  final int value;
  final int min;
  final int max;
  final ValueChanged<int> onChanged;
  final String? unitLabel;

  /// Increment per tap. Minutes step by 5 — reaching 55 one tap at a time
  /// would be eleven taps of pure friction for no extra precision.
  final int step;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton.filledTonal(
          onPressed: value - step >= min ? () => onChanged(value - step) : null,
          icon: const Icon(Icons.remove),
        ),
        SizedBox(
          width: 96,
          child: Column(
            children: [
              Text('$value', style: Theme.of(context).textTheme.headlineMedium),
              if (unitLabel != null) Text(unitLabel!),
            ],
          ),
        ),
        IconButton.filledTonal(
          onPressed: value + step <= max ? () => onChanged(value + step) : null,
          icon: const Icon(Icons.add),
        ),
      ],
    );
  }
}
