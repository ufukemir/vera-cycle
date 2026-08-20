import 'package:flutter/material.dart';

import '../models/enums.dart';
import '../theme/app_theme.dart';

/// A drawn test strip: a window with a control line and, depending on the
/// reading, a second line of some strength.
///
/// A word can say "high"; only a picture says what high *looks like* on the
/// strip in someone's hand. That is the whole reason to draw these — reading
/// an LH test is a comparison between two lines, and an app that asks about
/// the result without showing the comparison is asking the user to do the
/// translation twice.
///
/// Drawn here rather than shipped as artwork: two rectangles and two lines
/// need no asset, no licence note, and stay crisp at any size.
class TestStrip extends StatelessWidget {
  const TestStrip._({
    required this.secondLineOpacity,
    this.width = 66,
    this.height = 40,
  });

  /// An LH strip: no second line at all, a faint one, or one as dark as the
  /// control.
  factory TestStrip.ovulation(OvulationTestResult value,
          {double width = 66, double height = 40}) =>
      TestStrip._(
        secondLineOpacity: switch (value) {
          OvulationTestResult.negative => 0,
          OvulationTestResult.high => 0.42,
          OvulationTestResult.positive => 1,
        },
        width: width,
        height: height,
      );

  factory TestStrip.pregnancy(PregnancyTestResult value,
          {double width = 66, double height = 40}) =>
      TestStrip._(
        secondLineOpacity: switch (value) {
          PregnancyTestResult.negative => 0,
          PregnancyTestResult.faint => 0.38,
          PregnancyTestResult.positive => 1,
        },
        width: width,
        height: height,
      );

  final double secondLineOpacity;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return SizedBox(
      width: width,
      height: height,
      child: CustomPaint(
        painter: _StripPainter(
          secondLineOpacity: secondLineOpacity,
          line: AppPalette.rose,
          window: scheme.surface,
          border: scheme.onSurface.withValues(alpha: 0.25),
        ),
      ),
    );
  }
}

class _StripPainter extends CustomPainter {
  _StripPainter({
    required this.secondLineOpacity,
    required this.line,
    required this.window,
    required this.border,
  });

  final double secondLineOpacity;
  final Color line;
  final Color window;
  final Color border;

  @override
  void paint(Canvas canvas, Size size) {
    final rect = RRect.fromRectAndRadius(
      Rect.fromLTWH(0, 0, size.width, size.height),
      const Radius.circular(6),
    );
    canvas.drawRRect(rect, Paint()..color = window);
    canvas.drawRRect(
      rect,
      Paint()
        ..color = border
        ..style = PaintingStyle.stroke
        ..strokeWidth = 1.2,
    );

    final lineWidth = size.width * 0.09;
    final top = size.height * 0.18;
    final bottom = size.height * 0.82;

    void bar(double centreX, double opacity) {
      if (opacity <= 0) return;
      canvas.drawRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTRB(
              centreX - lineWidth / 2, top, centreX + lineWidth / 2, bottom),
          Radius.circular(lineWidth / 2),
        ),
        Paint()..color = line.withValues(alpha: opacity),
      );
    }

    // Control line first, always present — it is what the test line is read
    // against, so a strip drawn without it would be meaningless.
    bar(size.width * 0.66, 1);
    bar(size.width * 0.40, secondLineOpacity);
  }

  @override
  bool shouldRepaint(covariant _StripPainter old) =>
      old.secondLineOpacity != secondLineOpacity;
}
