import 'dart:math' as math;

import 'package:flutter/material.dart';

/// A circular progress ring showing how far through the estimated cycle
/// length the current day sits, with a warm rose→terracotta gradient sweep.
///
/// Animates in on first build and whenever the underlying values change —
/// motion is used for delight here, never to obscure information (per
/// CLAUDE.md's visual-design principles): the ring is purely decorative
/// framing around [child], which carries the actual day/phase text and reads
/// correctly even with the animation skipped (e.g. reduced-motion contexts).
class CycleRing extends StatefulWidget {
  const CycleRing({
    super.key,
    required this.cycleDay,
    required this.cycleLength,
    required this.child,
  });

  /// 1-based current cycle day, or `null` when nothing has been logged yet.
  final int? cycleDay;

  /// Estimated total cycle length used to scale the ring (falls back to a
  /// plausible default when no real average exists yet — the ring is
  /// decorative, so this never claims the precision `PredictionEngine`
  /// withholds).
  final int cycleLength;

  final Widget child;

  @override
  State<CycleRing> createState() => _CycleRingState();
}

class _CycleRingState extends State<CycleRing> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _reveal;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    );
    _reveal = CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic);
    _controller.forward();
  }

  @override
  void didUpdateWidget(covariant CycleRing oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.cycleDay != widget.cycleDay ||
        oldWidget.cycleLength != widget.cycleLength) {
      _controller.forward(from: 0);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final targetFraction = widget.cycleDay == null
        ? 0.0
        : (widget.cycleDay! / widget.cycleLength).clamp(0.0, 1.0);

    return AnimatedBuilder(
      animation: _reveal,
      builder: (context, _) {
        return CustomPaint(
          painter: _RingPainter(
            fraction: targetFraction * _reveal.value,
            trackColor: scheme.outlineVariant.withValues(alpha: 0.35),
            gradientColors: [scheme.primary, scheme.secondary],
          ),
          child: SizedBox(
            width: 224,
            height: 224,
            child: Center(child: widget.child),
          ),
        );
      },
    );
  }
}

class _RingPainter extends CustomPainter {
  _RingPainter({
    required this.fraction,
    required this.trackColor,
    required this.gradientColors,
  });

  final double fraction;
  final Color trackColor;
  final List<Color> gradientColors;

  static const _strokeWidth = 14.0;

  @override
  void paint(Canvas canvas, Size size) {
    final center = size.center(Offset.zero);
    final radius = (math.min(size.width, size.height) - _strokeWidth) / 2;
    final rect = Rect.fromCircle(center: center, radius: radius);

    final trackPaint = Paint()
      ..color = trackColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = _strokeWidth
      ..strokeCap = StrokeCap.round;
    canvas.drawArc(rect, 0, 2 * math.pi, false, trackPaint);

    if (fraction <= 0) return;

    final progressPaint = Paint()
      ..shader = SweepGradient(
        startAngle: -math.pi / 2,
        endAngle: -math.pi / 2 + 2 * math.pi,
        colors: gradientColors,
      ).createShader(rect)
      ..style = PaintingStyle.stroke
      ..strokeWidth = _strokeWidth
      ..strokeCap = StrokeCap.round;

    canvas.drawArc(rect, -math.pi / 2, 2 * math.pi * fraction, false, progressPaint);
  }

  @override
  bool shouldRepaint(covariant _RingPainter oldDelegate) =>
      oldDelegate.fraction != fraction ||
      oldDelegate.trackColor != trackColor ||
      oldDelegate.gradientColors != gradientColors;
}
