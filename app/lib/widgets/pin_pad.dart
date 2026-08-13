import 'package:flutter/material.dart';

/// A numeric keypad that collects exactly [length] digits, then reports the
/// full PIN via [onSubmit] and clears itself.
///
/// Deliberately has no internal "submit" button — a PIN pad that waits for a
/// tap after the last digit adds friction with no security benefit, since the
/// digit count is fixed and known in advance.
class PinPad extends StatefulWidget {
  const PinPad({
    super.key,
    required this.length,
    required this.onSubmit,
    this.enabled = true,
  });

  final int length;
  final ValueChanged<String> onSubmit;
  final bool enabled;

  @override
  State<PinPad> createState() => PinPadState();
}

class PinPadState extends State<PinPad> {
  String _entered = '';

  /// Clears any partially-entered digits, e.g. after a rejected PIN.
  void clear() => setState(() => _entered = '');

  void _tapDigit(String digit) {
    if (!widget.enabled || _entered.length >= widget.length) return;
    setState(() => _entered += digit);
    if (_entered.length == widget.length) {
      final pin = _entered;
      // Clear before the callback: onSubmit may trigger a rebuild (e.g. an
      // error message) that this widget survives, and it must not be left
      // showing a full ring of dots for a PIN that was already rejected.
      setState(() => _entered = '');
      widget.onSubmit(pin);
    }
  }

  void _backspace() {
    if (!widget.enabled || _entered.isEmpty) return;
    setState(() => _entered = _entered.substring(0, _entered.length - 1));
  }

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(widget.length, (i) {
            final filled = i < _entered.length;
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 6),
              width: 14,
              height: 14,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: filled ? scheme.primary : Colors.transparent,
                border: Border.all(color: scheme.outline),
              ),
            );
          }),
        ),
        const SizedBox(height: 32),
        _keypadGrid(),
      ],
    );
  }

  Widget _keypadGrid() {
    const rows = [
      ['1', '2', '3'],
      ['4', '5', '6'],
      ['7', '8', '9'],
      ['', '0', '⌫'],
    ];
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        for (final row in rows)
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (final key in row) _keypadButton(key),
            ],
          ),
      ],
    );
  }

  Widget _keypadButton(String key) {
    if (key.isEmpty) return const SizedBox(width: 72, height: 64);

    final isBackspace = key == '⌫';
    return SizedBox(
      width: 72,
      height: 64,
      child: TextButton(
        onPressed: widget.enabled
            ? () => isBackspace ? _backspace() : _tapDigit(key)
            : null,
        child: isBackspace
            ? const Icon(Icons.backspace_outlined)
            : Text(key, style: const TextStyle(fontSize: 24)),
      ),
    );
  }
}
