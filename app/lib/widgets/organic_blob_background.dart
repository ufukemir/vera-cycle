import 'dart:math' as math;

import 'package:flutter/material.dart';

/// A soft backdrop of overlapping abstract blob shapes — hand-coded, original
/// vector art, not a licensed asset or a competitor's illustration.
///
/// Deliberately abstract rather than literal (no flowers, no moons, no
/// clip-art) per the visual-language research in docs/03-rakip-analizi.md:
/// the category's most premium-reading apps each commit to one unexpected
/// material rather than layering pastel + floral + clock-wheel clichés. Here
/// that material is the same warm gradient + soft organic form language as
/// [CycleRing], reused as ambient decoration so the brand reads consistently
/// behind data, not just in it.
class OrganicBlobBackground extends StatelessWidget {
  const OrganicBlobBackground({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Positioned.fill(
          child: CustomPaint(
            painter: _BlobPainter(Theme.of(context).colorScheme),
          ),
        ),
        child,
      ],
    );
  }
}

class _BlobPainter extends CustomPainter {
  _BlobPainter(this.scheme);
  final ColorScheme scheme;

  @override
  void paint(Canvas canvas, Size size) {
    _blob(
      canvas,
      center: Offset(size.width * 0.15, size.height * 0.08),
      radius: size.width * 0.55,
      color: scheme.primaryContainer.withValues(alpha: 0.55),
    );
    _blob(
      canvas,
      center: Offset(size.width * 0.95, size.height * 0.22),
      radius: size.width * 0.45,
      color: scheme.tertiaryContainer.withValues(alpha: 0.5),
    );
    _blob(
      canvas,
      center: Offset(size.width * 0.85, size.height * 0.92),
      radius: size.width * 0.5,
      color: scheme.secondaryContainer.withValues(alpha: 0.45),
    );
  }

  /// A wobbly circle built from four cubic Bézier arcs with randomized-looking
  /// (but deterministic) control-point offsets, so it reads as organic rather
  /// than a perfect geometric circle.
  void _blob(
    Canvas canvas, {
    required Offset center,
    required double radius,
    required Color color,
  }) {
    final paint = Paint()..color = color;
    final path = Path();
    const wobble = 0.18;
    final offsets = [1.0, 1.0 + wobble, 1.0 - wobble * 0.6, 1.0 + wobble * 0.4];

    Offset pointAt(double angle, double scale) => Offset(
      center.dx + radius * scale * math.cos(angle),
      center.dy + radius * scale * math.sin(angle),
    );

    final p0 = pointAt(-1.5708, offsets[0]);
    path.moveTo(p0.dx, p0.dy);
    for (var i = 0; i < 4; i++) {
      final startAngle = -1.5708 + i * 1.5708;
      final endAngle = startAngle + 1.5708;
      final c1 = pointAt(startAngle + 0.55, offsets[i] * 1.1);
      final c2 = pointAt(endAngle - 0.55, offsets[(i + 1) % 4] * 1.1);
      final end = pointAt(endAngle, offsets[(i + 1) % 4]);
      path.cubicTo(c1.dx, c1.dy, c2.dx, c2.dy, end.dx, end.dy);
    }
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant _BlobPainter oldDelegate) =>
      oldDelegate.scheme != scheme;
}
