import 'dart:math' as math;

import 'package:flutter/material.dart' hide TextDirection;
import 'package:flutter/material.dart' as m show TextDirection;
import 'package:intl/intl.dart' hide TextDirection;

import '../../../l10n/app_localizations.dart';
import '../../../models/cycle.dart';
import '../../../theme/app_theme.dart';
import '../../../util/number_format.dart';

/// Cycle and period length over the last few cycles, each against the band
/// its own history says is typical.
///
/// The list of past cycles gave every number a "+3 days vs your average"
/// caption, which answers "is this one different?" but never "is this
/// normal for me?". Those are different questions, and the second is the
/// one people actually worry about. A shaded band — the mean plus or minus
/// one standard deviation, drawn from the user's own cycles and nobody
/// else's — answers it without ever labelling a cycle good or bad.
///
/// Needs at least three completed cycles: a band computed from two points
/// is not a range, it is a line between them dressed up as one.
class CycleTrendsChart extends StatelessWidget {
  const CycleTrendsChart({super.key, required this.cycles, this.maxPoints = 6});

  /// Oldest first.
  final List<ObservedCycle> cycles;
  final int maxPoints;

  static const minimumCycles = 3;

  static bool canRender(List<ObservedCycle> cycles) =>
      cycles.where((c) => c.isComplete).length >= minimumCycles;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;

    final completed = cycles.where((c) => c.isComplete).toList();
    if (completed.length < minimumCycles) return const SizedBox.shrink();
    final shown = completed.length <= maxPoints
        ? completed
        : completed.sublist(completed.length - maxPoints);

    final cycleLengths = [for (final c in shown) c.length!.toDouble()];
    final periodLengths = [for (final c in shown) c.periodLength.toDouble()];
    final fmt = DateFormat.MMMd(Localizations.localeOf(context).toString());

    return Container(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 12),
      decoration: BoxDecoration(
        color: scheme.surfaceContainerLow,
        borderRadius: BorderRadius.circular(22),
        border:
            Border.all(color: scheme.outlineVariant.withValues(alpha: 0.4)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(l10n.cycleTrendsTitle, style: theme.textTheme.titleMedium),
          const SizedBox(height: 14),
          Row(
            children: [
              Expanded(
                child: _AverageChip(
                  label: l10n.insightsAverageCycleLengthLabel,
                  value: _mean(cycleLengths),
                  tint: AppPalette.skySoft,
                  ink: AppPalette.skySoftText,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: _AverageChip(
                  label: l10n.insightsAveragePeriodLengthLabel,
                  value: _mean(periodLengths),
                  tint: AppPalette.roseSoft,
                  ink: AppPalette.roseSoftText,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Semantics(
            label: l10n.cycleTrendsTitle,
            child: ExcludeSemantics(
              child: SizedBox(
                height: 190,
                child: CustomPaint(
                  size: const Size(double.infinity, 190),
                  painter: _TrendsPainter(
                    series: [
                      (values: cycleLengths, color: _cycleColor(scheme)),
                      (values: periodLengths, color: scheme.primary),
                    ],
                    grid: scheme.outlineVariant,
                    labelStyle: theme.textTheme.labelSmall!
                        .copyWith(color: scheme.onSurfaceVariant),
                    textDirection: Directionality.of(context),
                    localeName: Localizations.localeOf(context).toString(),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 6),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(fmt.format(shown.first.startDate),
                  style: theme.textTheme.labelSmall),
              Text(fmt.format(shown.last.startDate),
                  style: theme.textTheme.labelSmall),
            ],
          ),
        ],
      ),
    );
  }

  static Color _cycleColor(ColorScheme scheme) =>
      scheme.brightness == Brightness.dark
          ? const Color(0xFF8FB8E8)
          : const Color(0xFF3E6D9C);

  static double _mean(List<double> xs) =>
      xs.isEmpty ? 0 : xs.reduce((a, b) => a + b) / xs.length;
}

class _AverageChip extends StatelessWidget {
  const _AverageChip({
    required this.label,
    required this.value,
    required this.tint,
    required this.ink,
  });

  final String label;
  final double value;
  final Color tint;
  final Color ink;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: isDark
            ? Color.alphaBlend(
                tint.withValues(alpha: 0.10), theme.colorScheme.surface)
            : tint.withValues(alpha: 0.45),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label,
              maxLines: 2,
              style: theme.textTheme.labelSmall
                  ?.copyWith(color: isDark ? tint : ink)),
          const SizedBox(height: 4),
          Text(
            formatDecimal(context, value),
            style: theme.textTheme.titleLarge
                ?.copyWith(color: isDark ? tint : ink),
          ),
        ],
      ),
    );
  }
}

typedef _Series = ({List<double> values, Color color});

class _TrendsPainter extends CustomPainter {
  _TrendsPainter({
    required this.series,
    required this.grid,
    required this.labelStyle,
    required this.textDirection,
    required this.localeName,
  });

  final List<_Series> series;
  final Color grid;
  final TextStyle labelStyle;
  final m.TextDirection textDirection;
  final String localeName;

  static const _gutter = 34.0;

  @override
  void paint(Canvas canvas, Size size) {
    final all = [for (final s in series) ...s.values];
    if (all.length < 2) return;

    // A little headroom so the band and the line never touch the edges.
    final lo = all.reduce(math.min) - 2;
    final hi = all.reduce(math.max) + 2;
    final span = (hi - lo).abs() < 1e-9 ? 1.0 : hi - lo;

    final left = textDirection == m.TextDirection.rtl ? 0.0 : _gutter;
    final right =
        textDirection == m.TextDirection.rtl ? size.width - _gutter : size.width;
    final plotWidth = right - left;
    double yFor(double v) => size.height - ((v - lo) / span) * size.height;

    for (var i = 0; i <= 3; i++) {
      final y = size.height * i / 3;
      canvas.drawLine(
        Offset(left, y),
        Offset(right, y),
        Paint()..color = grid.withValues(alpha: 0.35)..strokeWidth = 1,
      );
      _label(canvas, formatDecimalIn(localeName, lo + span * (3 - i) / 3,
              decimals: 0),
          Offset(textDirection == m.TextDirection.rtl ? right + 6 : 4, y - 7));
    }

    for (final s in series) {
      if (s.values.length < 2) continue;
      final step =
          s.values.length == 1 ? 0.0 : plotWidth / (s.values.length - 1);
      double xFor(int i) => left + i * step;

      // The band this series' own history calls typical.
      final mean = s.values.reduce((a, b) => a + b) / s.values.length;
      final variance = s.values
              .map((v) => (v - mean) * (v - mean))
              .reduce((a, b) => a + b) /
          (s.values.length - 1);
      final sd = math.sqrt(variance);
      if (sd > 0) {
        canvas.drawRect(
          Rect.fromLTRB(left, yFor(mean + sd), right, yFor(mean - sd)),
          Paint()..color = s.color.withValues(alpha: 0.14),
        );
      }

      final path = Path();
      for (var i = 0; i < s.values.length; i++) {
        final p = Offset(xFor(i), yFor(s.values[i]));
        i == 0 ? path.moveTo(p.dx, p.dy) : path.lineTo(p.dx, p.dy);
      }
      canvas.drawPath(
        path,
        Paint()
          ..color = s.color
          ..style = PaintingStyle.stroke
          ..strokeWidth = 2.5
          ..strokeCap = StrokeCap.round
          ..strokeJoin = StrokeJoin.round,
      );
      for (var i = 0; i < s.values.length; i++) {
        canvas.drawCircle(
            Offset(xFor(i), yFor(s.values[i])), 4, Paint()..color = s.color);
      }
    }
  }

  void _label(Canvas canvas, String text, Offset at) {
    final painter = TextPainter(
      text: TextSpan(text: text, style: labelStyle),
      textDirection: textDirection,
      maxLines: 1,
    )..layout(maxWidth: _gutter);
    painter.paint(canvas, at);
  }

  @override
  bool shouldRepaint(covariant _TrendsPainter old) => true;
}
