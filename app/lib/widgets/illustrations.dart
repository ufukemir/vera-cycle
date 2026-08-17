import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../models/enums.dart';
import '../theme/app_theme.dart';

/// Original, hand-coded flat vector illustrations — the app's answer to the
/// photo-collage style of competitor onboarding flows. Per CLAUDE.md, real
/// photography is never copied in; these scenes borrow only the *idea* of
/// warm illustrated hero moments and are drawn from scratch.

/// A framed hero scene: soft gradient rounded card, a main illustration,
/// and scattered doodles (petals/sparkles) around it.
class HeroIllustration extends StatelessWidget {
  const HeroIllustration({
    super.key,
    required this.scene,
    this.height = 220,
  });

  final IllustrationScene scene;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: AppPalette.heroGradient,
        borderRadius: BorderRadius.circular(28),
      ),
      child: CustomPaint(painter: _ScenePainter(scene)),
    );
  }
}

/// The assistant's friendly robot face — original flat vector art shown
/// beside chat bubbles and in the assistant's empty state.
class RobotAvatar extends StatelessWidget {
  const RobotAvatar({super.key, this.size = 34});

  final double size;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size.square(size),
      painter: _RobotPainter(),
    );
  }
}

class _RobotPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final c = size.center(Offset.zero);
    final r = size.width / 2;
    // Head circle
    canvas.drawCircle(c, r * 0.82, Paint()..color = AppPalette.rose);
    // Antenna
    final antenna = Paint()
      ..color = AppPalette.gold
      ..strokeWidth = r * 0.12
      ..strokeCap = StrokeCap.round;
    canvas.drawLine(
        c.translate(0, -r * 0.8), c.translate(0, -r * 1.05), antenna);
    canvas.drawCircle(
        c.translate(0, -r * 1.12), r * 0.14, Paint()..color = AppPalette.gold);
    // Visor
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromCenter(
            center: c.translate(0, -r * 0.08),
            width: r * 1.1,
            height: r * 0.62),
        Radius.circular(r * 0.3),
      ),
      Paint()..color = Colors.white,
    );
    // Eyes
    final eye = Paint()..color = AppPalette.plum;
    canvas.drawCircle(c.translate(-r * 0.26, -r * 0.08), r * 0.11, eye);
    canvas.drawCircle(c.translate(r * 0.26, -r * 0.08), r * 0.11, eye);
    // Smile
    final smile = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = r * 0.1
      ..strokeCap = StrokeCap.round;
    canvas.drawArc(
        Rect.fromCircle(center: c.translate(0, r * 0.34), radius: r * 0.24),
        math.pi * 0.15, math.pi * 0.7, false, smile);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

/// A small hand-drawn companion character (see [Mascot]) — original kawaii
/// vector art with a gentle bobbing animation. Purely decorative; renders
/// nothing for [Mascot.none].
class MascotAvatar extends StatefulWidget {
  const MascotAvatar({super.key, required this.mascot, this.size = 56});

  final Mascot mascot;
  final double size;

  @override
  State<MascotAvatar> createState() => _MascotAvatarState();
}

class _MascotAvatarState extends State<MascotAvatar>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 2400),
  )..repeat(reverse: true);

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.mascot == Mascot.none) return const SizedBox.shrink();
    // Decorative only — nothing for a screen reader to read out.
    return ExcludeSemantics(
      child: AnimatedBuilder(
      animation: _controller,
      builder: (context, child) => Transform.translate(
        offset: Offset(0, -3 * Curves.easeInOut.transform(_controller.value)),
        child: child,
      ),
        child: CustomPaint(
          size: Size.square(widget.size),
          painter: _MascotPainter(widget.mascot),
        ),
      ),
    );
  }
}

class _MascotPainter extends CustomPainter {
  _MascotPainter(this.mascot);

  final Mascot mascot;

  @override
  void paint(Canvas canvas, Size size) {
    final scene = _ScenePainter(IllustrationScene.dropletFriend);
    final c = size.center(Offset.zero);
    switch (mascot) {
      case Mascot.droplet:
        scene._droplet(canvas, c.translate(0, size.height * 0.06), size.height * 0.32);
      case Mascot.flower:
        scene._flower(canvas, c, size.height * 0.26, AppPalette.terracotta);
        _face(canvas, c, size.height * 0.30, AppPalette.plum);
      case Mascot.moon:
        scene._moon(canvas, c, size.height * 0.4);
        _face(canvas, c.translate(-size.width * 0.12, 0), size.height * 0.32,
            Colors.white);
      case Mascot.none:
        break;
    }
  }

  void _face(Canvas canvas, Offset c, double r, Color color) {
    final eye = Paint()..color = color;
    canvas.drawCircle(Offset(c.dx - r * 0.22, c.dy - r * 0.05), r * 0.07, eye);
    canvas.drawCircle(Offset(c.dx + r * 0.22, c.dy - r * 0.05), r * 0.07, eye);
    final smile = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = r * 0.06
      ..strokeCap = StrokeCap.round;
    canvas.drawArc(
        Rect.fromCircle(center: Offset(c.dx, c.dy + r * 0.12), radius: r * 0.18),
        math.pi * 0.15, math.pi * 0.7, false, smile);
  }

  @override
  bool shouldRepaint(covariant _MascotPainter oldDelegate) =>
      oldDelegate.mascot != mascot;
}

/// A real-photograph hero card: openly-licensed photo (see
/// assets/photos/NOTICE.md — Pexels License, bundled locally, never
/// fetched) framed like [HeroIllustration] and finished with the same
/// flower/sparkle doodle stickers the reference app lays over its photos.
class PhotoHero extends StatelessWidget {
  const PhotoHero({super.key, required this.asset, this.height = 220});

  final String asset;
  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: double.infinity,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(28),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(asset, fit: BoxFit.cover),
            // Soft warm wash at the bottom so the card blends into the
            // cream page instead of ending on a hard photographic edge.
            DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: const [0.6, 1.0],
                  colors: [
                    Colors.transparent,
                    AppPalette.cream.withValues(alpha: 0.55),
                  ],
                ),
              ),
            ),
            const Positioned.fill(
              child: CustomPaint(painter: _StickerOverlayPainter()),
            ),
          ],
        ),
      ),
    );
  }
}

class _StickerOverlayPainter extends CustomPainter {
  const _StickerOverlayPainter();

  @override
  void paint(Canvas canvas, Size size) {
    final p = _ScenePainter(IllustrationScene.calendarFlowers);
    p._flower(canvas, Offset(size.width * 0.08, size.height * 0.14),
        size.height * 0.05, AppPalette.roseSoft);
    p._flower(canvas, Offset(size.width * 0.92, size.height * 0.82),
        size.height * 0.055, AppPalette.gold);
    p._sparkle(canvas, Offset(size.width * 0.9, size.height * 0.12),
        size.height * 0.04, Colors.white);
    p._sparkle(canvas, Offset(size.width * 0.08, size.height * 0.86),
        size.height * 0.035, AppPalette.terracottaSoft);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

/// Scatters small flowers/sparkles around [child] — used to give the home
/// screen's cycle ring the reference app's decorated-hero feel without any
/// literal asset copying.
class DoodleFrame extends StatelessWidget {
  const DoodleFrame({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        Positioned.fill(child: CustomPaint(painter: _DoodleFramePainter())),
        child,
      ],
    );
  }
}

class _DoodleFramePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final p = _ScenePainter(IllustrationScene.calendarFlowers);
    p._flower(canvas, Offset(size.width * 0.06, size.height * 0.18),
        size.height * 0.045, AppPalette.gold);
    p._flower(canvas, Offset(size.width * 0.94, size.height * 0.72),
        size.height * 0.04, AppPalette.rose);
    p._sparkle(canvas, Offset(size.width * 0.9, size.height * 0.12),
        size.height * 0.035, AppPalette.terracotta);
    p._sparkle(canvas, Offset(size.width * 0.08, size.height * 0.85),
        size.height * 0.03, AppPalette.roseDeep);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

enum IllustrationScene {
  /// Flowers + calendar sheet — cycle questions.
  calendarFlowers,

  /// Kawaii droplet with a gentle face + petals — flow/period contexts.
  dropletFriend,

  /// Crescent moon, stars, small bell — reminders.
  moonAndStars,

  /// Chat bubble with sparkles — the assistant.
  chatSparkles,

  /// Shield with a heart + petals — privacy/welcome.
  shieldHeart,

  /// Sun rising over hills — building-plan/fresh start.
  sunrise,
}

class _ScenePainter extends CustomPainter {
  _ScenePainter(this.scene);

  final IllustrationScene scene;

  @override
  void paint(Canvas canvas, Size size) {
    final c = Offset(size.width / 2, size.height / 2);
    switch (scene) {
      case IllustrationScene.calendarFlowers:
        _calendar(canvas, c.translate(0, 6), size.height * 0.34);
        _flower(canvas, Offset(size.width * 0.18, size.height * 0.26),
            size.height * 0.09, AppPalette.rose);
        _flower(canvas, Offset(size.width * 0.84, size.height * 0.7),
            size.height * 0.07, AppPalette.gold);
        _flower(canvas, Offset(size.width * 0.8, size.height * 0.2),
            size.height * 0.055, AppPalette.terracotta);
        _sparkle(canvas, Offset(size.width * 0.12, size.height * 0.72),
            size.height * 0.045, AppPalette.roseDeep);
      case IllustrationScene.dropletFriend:
        _droplet(canvas, c, size.height * 0.3);
        _petals(canvas, size);
      case IllustrationScene.moonAndStars:
        _moon(canvas, c.translate(-size.width * 0.05, 0), size.height * 0.28);
        _sparkle(canvas, Offset(size.width * 0.74, size.height * 0.24),
            size.height * 0.07, AppPalette.gold);
        _sparkle(canvas, Offset(size.width * 0.8, size.height * 0.6),
            size.height * 0.045, AppPalette.terracotta);
        _sparkle(canvas, Offset(size.width * 0.2, size.height * 0.7),
            size.height * 0.05, AppPalette.rose);
      case IllustrationScene.chatSparkles:
        _chatBubble(canvas, c, size);
        _sparkle(canvas, Offset(size.width * 0.78, size.height * 0.22),
            size.height * 0.07, AppPalette.gold);
        _sparkle(canvas, Offset(size.width * 0.16, size.height * 0.68),
            size.height * 0.05, AppPalette.terracotta);
      case IllustrationScene.shieldHeart:
        _shieldHeart(canvas, c, size.height * 0.32);
        _petals(canvas, size);
      case IllustrationScene.sunrise:
        _sunrise(canvas, size);
    }
  }

  // ---- elements -------------------------------------------------------

  void _flower(Canvas canvas, Offset center, double r, Color color) {
    final petal = Paint()..color = color;
    for (var i = 0; i < 6; i++) {
      final a = i * math.pi / 3;
      canvas.drawOval(
        Rect.fromCenter(
          center: center + Offset(math.cos(a), math.sin(a)) * r,
          width: r * 1.2,
          height: r * 0.8,
        ),
        petal,
      );
    }
    canvas.drawCircle(center, r * 0.55, Paint()..color = AppPalette.goldSoft);
  }

  void _petals(Canvas canvas, Size size) {
    _flower(canvas, Offset(size.width * 0.16, size.height * 0.24),
        size.height * 0.06, AppPalette.gold);
    _flower(canvas, Offset(size.width * 0.85, size.height * 0.3),
        size.height * 0.05, AppPalette.rose);
    _sparkle(canvas, Offset(size.width * 0.82, size.height * 0.74),
        size.height * 0.05, AppPalette.terracotta);
  }

  void _sparkle(Canvas canvas, Offset c, double r, Color color) {
    final path = Path();
    for (var i = 0; i < 4; i++) {
      final a = i * math.pi / 2;
      final tip = c + Offset(math.cos(a), math.sin(a)) * r;
      final side1 = c + Offset(math.cos(a + math.pi / 4), math.sin(a + math.pi / 4)) * r * 0.28;
      if (i == 0) {
        path.moveTo(tip.dx, tip.dy);
      } else {
        path.lineTo(tip.dx, tip.dy);
      }
      path.lineTo(side1.dx, side1.dy);
    }
    path.close();
    canvas.drawPath(path, Paint()..color = color);
  }

  void _calendar(Canvas canvas, Offset c, double r) {
    final sheet = Rect.fromCenter(center: c, width: r * 2.4, height: r * 2);
    canvas.drawRRect(
      RRect.fromRectAndRadius(sheet, Radius.circular(r * 0.25)),
      Paint()..color = Colors.white,
    );
    // header band
    canvas.drawRRect(
      RRect.fromRectAndCorners(
        Rect.fromLTWH(sheet.left, sheet.top, sheet.width, r * 0.5),
        topLeft: Radius.circular(r * 0.25),
        topRight: Radius.circular(r * 0.25),
      ),
      Paint()..color = AppPalette.rose,
    );
    // rings
    final ringPaint = Paint()
      ..color = AppPalette.roseDeep
      ..strokeWidth = r * 0.09
      ..strokeCap = StrokeCap.round;
    canvas.drawLine(Offset(c.dx - r * 0.7, sheet.top - r * 0.18),
        Offset(c.dx - r * 0.7, sheet.top + r * 0.14), ringPaint);
    canvas.drawLine(Offset(c.dx + r * 0.7, sheet.top - r * 0.18),
        Offset(c.dx + r * 0.7, sheet.top + r * 0.14), ringPaint);
    // day dots, one marked
    final dot = Paint()..color = AppPalette.roseSoft;
    for (var row = 0; row < 3; row++) {
      for (var col = 0; col < 4; col++) {
        final p = Offset(
          sheet.left + r * 0.45 + col * r * 0.5,
          sheet.top + r * 0.85 + row * r * 0.38,
        );
        canvas.drawCircle(p, r * 0.09, dot);
      }
    }
    canvas.drawCircle(Offset(sheet.left + r * 0.45 + 2 * r * 0.5, sheet.top + r * 0.85 + r * 0.38),
        r * 0.14, Paint()..color = AppPalette.rose);
  }

  void _droplet(Canvas canvas, Offset c, double r) {
    final path = Path()
      ..moveTo(c.dx, c.dy - r * 1.15)
      ..quadraticBezierTo(c.dx + r * 1.05, c.dy - r * 0.1, c.dx + r * 0.75, c.dy + r * 0.45)
      ..arcToPoint(Offset(c.dx - r * 0.75, c.dy + r * 0.45),
          radius: Radius.circular(r * 0.78), clockwise: true)
      ..quadraticBezierTo(c.dx - r * 1.05, c.dy - r * 0.1, c.dx, c.dy - r * 1.15)
      ..close();
    canvas.drawPath(path, Paint()..color = AppPalette.rose);
    // gentle face
    final eye = Paint()..color = Colors.white;
    canvas.drawCircle(Offset(c.dx - r * 0.28, c.dy + r * 0.05), r * 0.09, eye);
    canvas.drawCircle(Offset(c.dx + r * 0.28, c.dy + r * 0.05), r * 0.09, eye);
    final smile = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = r * 0.07
      ..strokeCap = StrokeCap.round;
    canvas.drawArc(
        Rect.fromCircle(center: Offset(c.dx, c.dy + r * 0.22), radius: r * 0.22),
        math.pi * 0.15, math.pi * 0.7, false, smile);
    // cheek blush
    final blush = Paint()..color = AppPalette.roseSoft.withValues(alpha: 0.8);
    canvas.drawCircle(Offset(c.dx - r * 0.45, c.dy + r * 0.22), r * 0.08, blush);
    canvas.drawCircle(Offset(c.dx + r * 0.45, c.dy + r * 0.22), r * 0.08, blush);
  }

  void _moon(Canvas canvas, Offset c, double r) {
    final moon = Path()..addOval(Rect.fromCircle(center: c, radius: r));
    final bite = Path()
      ..addOval(Rect.fromCircle(center: c.translate(r * 0.55, -r * 0.25), radius: r * 0.85));
    canvas.drawPath(
      Path.combine(PathOperation.difference, moon, bite),
      Paint()..color = AppPalette.gold,
    );
  }

  void _chatBubble(Canvas canvas, Offset c, Size size) {
    final w = size.width * 0.46;
    final h = size.height * 0.34;
    final rect = Rect.fromCenter(center: c.translate(0, -h * 0.1), width: w, height: h);
    canvas.drawRRect(
      RRect.fromRectAndRadius(rect, Radius.circular(h * 0.4)),
      Paint()..color = Colors.white,
    );
    final tail = Path()
      ..moveTo(c.dx - w * 0.12, rect.bottom - 2)
      ..lineTo(c.dx - w * 0.02, rect.bottom + h * 0.28)
      ..lineTo(c.dx + w * 0.16, rect.bottom - 2)
      ..close();
    canvas.drawPath(tail, Paint()..color = Colors.white);
    final dot = Paint()..color = AppPalette.rose;
    for (var i = -1; i <= 1; i++) {
      canvas.drawCircle(c.translate(i * w * 0.18, -h * 0.1), h * 0.08, dot);
    }
  }

  void _shieldHeart(Canvas canvas, Offset c, double r) {
    final shield = Path()
      ..moveTo(c.dx, c.dy - r)
      ..quadraticBezierTo(c.dx + r * 0.9, c.dy - r * 0.75, c.dx + r * 0.9, c.dy - r * 0.2)
      ..quadraticBezierTo(c.dx + r * 0.9, c.dy + r * 0.6, c.dx, c.dy + r * 1.05)
      ..quadraticBezierTo(c.dx - r * 0.9, c.dy + r * 0.6, c.dx - r * 0.9, c.dy - r * 0.2)
      ..quadraticBezierTo(c.dx - r * 0.9, c.dy - r * 0.75, c.dx, c.dy - r)
      ..close();
    canvas.drawPath(shield, Paint()..color = AppPalette.rose);
    final hr = r * 0.42;
    final hc = c.translate(0, -r * 0.02);
    final heart = Path()
      ..moveTo(hc.dx, hc.dy + hr * 0.9)
      ..cubicTo(hc.dx - hr * 1.4, hc.dy, hc.dx - hr * 0.7, hc.dy - hr * 1.0, hc.dx, hc.dy - hr * 0.3)
      ..cubicTo(hc.dx + hr * 0.7, hc.dy - hr * 1.0, hc.dx + hr * 1.4, hc.dy, hc.dx, hc.dy + hr * 0.9)
      ..close();
    canvas.drawPath(heart, Paint()..color = Colors.white);
  }

  void _sunrise(Canvas canvas, Size size) {
    final horizon = size.height * 0.66;
    final sunC = Offset(size.width / 2, horizon);
    canvas.drawCircle(sunC, size.height * 0.22, Paint()..color = AppPalette.gold);
    // rays
    final ray = Paint()
      ..color = AppPalette.gold
      ..strokeWidth = size.height * 0.03
      ..strokeCap = StrokeCap.round;
    for (var i = 0; i < 5; i++) {
      final a = math.pi + i * math.pi / 4;
      final from = sunC + Offset(math.cos(a), math.sin(a)) * size.height * 0.3;
      final to = sunC + Offset(math.cos(a), math.sin(a)) * size.height * 0.38;
      canvas.drawLine(from, to, ray);
    }
    // hills
    final hill1 = Path()
      ..moveTo(0, size.height)
      ..lineTo(0, horizon + size.height * 0.08)
      ..quadraticBezierTo(size.width * 0.3, horizon - size.height * 0.06,
          size.width * 0.62, size.height)
      ..close();
    canvas.drawPath(hill1, Paint()..color = AppPalette.terracotta);
    final hill2 = Path()
      ..moveTo(size.width, size.height)
      ..lineTo(size.width, horizon + size.height * 0.04)
      ..quadraticBezierTo(size.width * 0.72, horizon - size.height * 0.1,
          size.width * 0.38, size.height)
      ..close();
    canvas.drawPath(hill2, Paint()..color = AppPalette.rose);
  }

  @override
  bool shouldRepaint(covariant _ScenePainter oldDelegate) => oldDelegate.scene != scene;
}
