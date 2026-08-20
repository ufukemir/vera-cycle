import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:intl/intl.dart' hide TextDirection;
import 'package:provider/provider.dart';

import '../../l10n/app_localizations.dart';
import '../../models/prediction.dart';
import '../../state/cycle_controller.dart';
import '../../theme/app_theme.dart';
import '../../util/day.dart';

/// The fertile window, in full.
///
/// Home only ever showed a one-line disclaimer under the prediction card, so
/// the estimate people most want explained was the one the app said least
/// about. This screen gives it a shape, its dates, and the mechanism behind
/// it — the LH surge, the egg's day, the several days sperm can wait.
///
/// The curve is deliberately unlabelled on its vertical axis. Competitors
/// draw the same shape against a percentage and call it a chance of
/// conception; that number would be invented, and inventing confident
/// numbers is the one thing this product exists not to do (CLAUDE.md,
/// principle 5). It shows *when* the window sits and where today falls in
/// it. Nothing more is claimed, and the disclaimer at the bottom says so.
class FertilityDetailScreen extends StatelessWidget {
  const FertilityDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    final controller = context.watch<CycleController>();
    final status = controller.todayStatus;
    final fmt = DateFormat.MMMd(Localizations.localeOf(context).toString());

    final start = status.fertileWindowStart;
    final end = status.fertileWindowEnd;
    final cycleStart = status.currentCycleStart;

    return Scaffold(
      appBar: AppBar(title: Text(l10n.homePhaseFertileWindow)),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(20, 8, 20, 32),
          children: [
            if (status.cycleDay != null)
              Text(
                l10n.homeCycleDayLabel(status.cycleDay!),
                style: theme.textTheme.labelLarge
                    ?.copyWith(color: theme.colorScheme.onSurfaceVariant),
              ),
            const SizedBox(height: 4),
            Text(l10n.calendarLegendFertile,
                style: theme.textTheme.headlineSmall),
            const SizedBox(height: 20),
            if (start != null && end != null && cycleStart != null) ...[
              _CurveCard(
                cycleStart: cycleStart,
                windowStart: start,
                windowEnd: end,
                cycleLength: _cycleLength(controller.prediction),
              ),
              const SizedBox(height: 16),
              _DateRow(
                icon: Icons.date_range_outlined,
                label: l10n.calendarLegendFertile,
                value: '${fmt.format(start)} – ${fmt.format(end)}',
              ),
              const SizedBox(height: 10),
              _DateRow(
                icon: Icons.adjust,
                label: l10n.calendarLegendOvulation,
                // The window is built as ovulation minus five days through
                // plus one, so the day it was centred on is end - 1. Shown
                // as a single day only because that is exactly how it was
                // derived — the honesty is in the word "estimated".
                value: fmt.format(addDays(end, -1)),
              ),
              const SizedBox(height: 24),
            ],
            Text(l10n.phaseExplainerFertile,
                style: theme.textTheme.bodyMedium?.copyWith(height: 1.5)),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: theme.colorScheme.primary.withValues(alpha: 0.08),
                borderRadius: BorderRadius.circular(18),
                border: Border.all(
                    color: theme.colorScheme.primary.withValues(alpha: 0.22)),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Icons.info_outline_rounded,
                      size: 20, color: theme.colorScheme.primary),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(l10n.homeFertileWindowDisclaimer,
                        style:
                            theme.textTheme.bodyMedium?.copyWith(height: 1.45)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  static int _cycleLength(CyclePrediction prediction) =>
      prediction.meanLength?.round() ?? 28;
}

class _DateRow extends StatelessWidget {
  const _DateRow({
    required this.icon,
    required this.label,
    required this.value,
  });

  final IconData icon;
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      children: [
        Icon(icon, size: 18, color: theme.colorScheme.primary),
        const SizedBox(width: 10),
        Expanded(child: Text(label, style: theme.textTheme.bodyMedium)),
        Text(value,
            style: theme.textTheme.titleSmall
                ?.copyWith(color: theme.colorScheme.primary)),
      ],
    );
  }
}

class _CurveCard extends StatelessWidget {
  const _CurveCard({
    required this.cycleStart,
    required this.windowStart,
    required this.windowEnd,
    required this.cycleLength,
  });

  final DateTime cycleStart;
  final DateTime windowStart;
  final DateTime windowEnd;
  final int cycleLength;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;

    final startDay = daysBetween(cycleStart, windowStart);
    final endDay = daysBetween(cycleStart, windowEnd);
    final todayDay = daysBetween(cycleStart, today());

    return Container(
      padding: const EdgeInsets.fromLTRB(16, 18, 16, 12),
      decoration: BoxDecoration(
        color: scheme.surfaceContainerLow,
        borderRadius: BorderRadius.circular(22),
        border:
            Border.all(color: scheme.outlineVariant.withValues(alpha: 0.4)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Semantics(
            label: l10n.calendarLegendFertile,
            child: ExcludeSemantics(
              child: SizedBox(
                height: 150,
                child: CustomPaint(
                  size: const Size(double.infinity, 150),
                  painter: _FertilityCurvePainter(
                    cycleLength: math.max(cycleLength, endDay + 2),
                    windowStart: startDay,
                    windowEnd: endDay,
                    today: todayDay,
                    line: scheme.primary,
                    band: AppPalette.gold,
                    grid: scheme.outlineVariant,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(l10n.homeCycleDayLabel(1),
                  style: theme.textTheme.labelSmall),
              Text(l10n.homeCycleDayLabel(math.max(cycleLength, endDay + 2)),
                  style: theme.textTheme.labelSmall),
            ],
          ),
        ],
      ),
    );
  }
}

/// A hump over the fertile window with today marked.
///
/// The curve carries no vertical scale on purpose — see
/// [FertilityDetailScreen]. Its only job is to show that the window has a
/// middle and edges rather than being a hard on/off box, which is the one
/// thing about fertile windows people most often get wrong.
class _FertilityCurvePainter extends CustomPainter {
  _FertilityCurvePainter({
    required this.cycleLength,
    required this.windowStart,
    required this.windowEnd,
    required this.today,
    required this.line,
    required this.band,
    required this.grid,
  });

  final int cycleLength;
  final int windowStart;
  final int windowEnd;
  final int today;
  final Color line;
  final Color band;
  final Color grid;

  @override
  void paint(Canvas canvas, Size size) {
    if (cycleLength <= 1) return;
    final baseline = size.height - 18;
    double xFor(num day) => (day / cycleLength) * size.width;

    canvas.drawLine(Offset(0, baseline), Offset(size.width, baseline),
        Paint()..color = grid.withValues(alpha: 0.6)..strokeWidth = 1);

    // Gaussian centred on the window, wide enough that its tails reach the
    // window edges rather than stopping dead at them.
    final centre = (windowStart + windowEnd) / 2;
    final spread = math.max((windowEnd - windowStart) / 2.4, 0.9);
    double heightAt(double day) {
      final z = (day - centre) / spread;
      return math.exp(-0.5 * z * z);
    }

    final path = Path()..moveTo(0, baseline);
    for (var i = 0; i <= 240; i++) {
      final day = cycleLength * i / 240;
      path.lineTo(xFor(day), baseline - heightAt(day) * (baseline - 12));
    }

    final area = Path.from(path)
      ..lineTo(size.width, baseline)
      ..close();
    canvas.drawPath(
      area,
      Paint()
        ..shader = LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [band.withValues(alpha: 0.45), band.withValues(alpha: 0.0)],
        ).createShader(Rect.fromLTWH(0, 0, size.width, baseline)),
    );
    canvas.drawPath(
      path,
      Paint()
        ..color = line
        ..style = PaintingStyle.stroke
        ..strokeWidth = 2.5
        ..strokeCap = StrokeCap.round,
    );

    if (today < 0 || today > cycleLength) return;
    final x = xFor(today);
    canvas.drawLine(
      Offset(x, 6),
      Offset(x, baseline),
      Paint()
        ..color = line.withValues(alpha: 0.55)
        ..strokeWidth = 1.5,
    );
    canvas.drawCircle(
      Offset(x, baseline - heightAt(today.toDouble()) * (baseline - 12)),
      5,
      Paint()..color = line,
    );
  }

  @override
  bool shouldRepaint(covariant _FertilityCurvePainter old) =>
      old.today != today ||
      old.windowStart != windowStart ||
      old.windowEnd != windowEnd ||
      old.cycleLength != cycleLength;
}
