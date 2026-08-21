import 'package:flutter/material.dart';

import '../util/number_format.dart';

/// A scrolling wheel for a small bounded integer.
///
/// Replaces the minus/value/plus stepper on the onboarding questions. The
/// stepper is fine for nudging a number by one; it is poor for *choosing*
/// one, which is what onboarding asks — going from 28 to 21 was seven
/// deliberate taps, and the control showed only the current value, so there
/// was no sense of the range being chosen from. A wheel shows the
/// neighbours, moves as far as a flick, and reads as a decision rather than
/// an adjustment.
///
/// The stepper stays in Settings, where the task really is "nudge this by a
/// day".
class NumberWheel extends StatefulWidget {
  const NumberWheel({
    super.key,
    required this.value,
    required this.min,
    required this.max,
    required this.onChanged,
    this.unitLabel,
    this.height = 210,
    this.useGrouping = true,
  });

  final int value;
  final int min;
  final int max;
  final ValueChanged<int> onChanged;
  final String? unitLabel;
  final double height;

  /// Off for values like a calendar year, which no locale groups in
  /// thousands — on for everything else, matching [formatDecimal]'s default.
  final bool useGrouping;

  @override
  State<NumberWheel> createState() => _NumberWheelState();
}

class _NumberWheelState extends State<NumberWheel> {
  late final FixedExtentScrollController _controller =
      FixedExtentScrollController(initialItem: widget.value - widget.min);

  @override
  void didUpdateWidget(NumberWheel oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Only when something else changed the value — jumping the wheel while
    // the user is mid-scroll would fight their finger.
    final target = widget.value - widget.min;
    if (oldWidget.value != widget.value &&
        _controller.hasClients &&
        _controller.selectedItem != target) {
      _controller.jumpToItem(target);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;
    final count = widget.max - widget.min + 1;
    const extent = 64.0;

    return SizedBox(
      height: widget.height,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // The selection band, drawn behind the wheel so the chosen number
          // sits inside it rather than next to it.
          Container(
            height: extent,
            margin: const EdgeInsets.symmetric(horizontal: 24),
            decoration: BoxDecoration(
              color: scheme.primary.withValues(alpha: 0.10),
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          ListWheelScrollView.useDelegate(
            controller: _controller,
            itemExtent: extent,
            perspective: 0.002,
            diameterRatio: 2.2,
            physics: const FixedExtentScrollPhysics(),
            onSelectedItemChanged: (index) =>
                widget.onChanged(widget.min + index),
            childDelegate: ListWheelChildBuilderDelegate(
              childCount: count,
              builder: (context, index) {
                final number = widget.min + index;
                final selected = number == widget.value;
                return Semantics(
                  selected: selected,
                  child: Center(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          formatDecimal(
                            context,
                            number.toDouble(),
                            decimals: 0,
                            useGrouping: widget.useGrouping,
                          ),
                          style: theme.textTheme.headlineMedium?.copyWith(
                            color: selected
                                ? scheme.primary
                                : scheme.onSurface.withValues(alpha: 0.45),
                            fontWeight: selected
                                ? FontWeight.w700
                                : FontWeight.w500,
                          ),
                        ),
                        if (widget.unitLabel != null && selected) ...[
                          const SizedBox(width: 10),
                          Text(
                            widget.unitLabel!,
                            style: theme.textTheme.titleMedium?.copyWith(
                              color: scheme.primary,
                            ),
                          ),
                        ],
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
