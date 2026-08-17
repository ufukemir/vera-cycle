import 'package:flutter/material.dart';

import '../../../l10n/app_localizations.dart';
import '../../../models/prediction.dart';
import '../../../util/day.dart';

/// A horizontal segmented bar of the current cycle — period days, estimated
/// fertile window, and the rest — with a marker on today. Uses
/// [PositionedDirectional] throughout so the whole bar mirrors in RTL
/// locales (ar, ur) instead of running backwards. The reference
/// app's "Bugün — Döngü Günü N" strip, honesty-adjusted: fertile-window
/// styling matches the calendar's estimate colors and every segment scales
/// off the same decorative cycle length the ring uses (nothing here claims
/// prediction precision).
class PhaseTimelineBar extends StatelessWidget {
  const PhaseTimelineBar({
    super.key,
    required this.status,
    required this.cycleLength,
    required this.periodLength,
  });

  final CycleStatus status;

  /// Decorative scale, same source as [CycleRing.cycleLength].
  final int cycleLength;
  final int periodLength;

  @override
  Widget build(BuildContext context) {
    final day = status.cycleDay;
    if (day == null || status.currentCycleStart == null) {
      return const SizedBox.shrink();
    }
    final scheme = Theme.of(context).colorScheme;

    int? fertileStartDay;
    int? fertileEndDay;
    if (status.hasFertileEstimate) {
      fertileStartDay =
          daysBetween(status.currentCycleStart!, status.fertileWindowStart!) + 1;
      fertileEndDay =
          daysBetween(status.currentCycleStart!, status.fertileWindowEnd!) + 1;
    }

    return Semantics(
      container: true,
      label: AppLocalizations.of(context)!.a11yPhaseBar(day, cycleLength),
      child: SizedBox(
      height: 26,
      child: LayoutBuilder(
        builder: (context, constraints) {
          final width = constraints.maxWidth;
          final dayWidth = width / cycleLength;
          double x(int d) => ((d - 1).clamp(0, cycleLength)) * dayWidth;

          return Stack(
            clipBehavior: Clip.none,
            children: [
              // Track
              Positioned(
                left: 0,
                right: 0,
                top: 9,
                child: Container(
                  height: 8,
                  decoration: BoxDecoration(
                    color: scheme.outlineVariant.withValues(alpha: 0.35),
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
              // Period segment
              PositionedDirectional(
                start: 0,
                top: 9,
                child: Container(
                  width: x(periodLength + 1),
                  height: 8,
                  decoration: BoxDecoration(
                    color: scheme.primary,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
              // Fertile estimate segment
              if (fertileStartDay != null && fertileEndDay != null)
                PositionedDirectional(
                  start: x(fertileStartDay),
                  top: 9,
                  child: Container(
                    width: (x(fertileEndDay + 1) - x(fertileStartDay))
                        .clamp(dayWidth, width),
                    height: 8,
                    decoration: BoxDecoration(
                      color: scheme.tertiary.withValues(alpha: 0.7),
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ),
              // Today marker
              PositionedDirectional(
                start: (x(day) + dayWidth / 2 - 6).clamp(0, width - 12),
                top: 3,
                child: Container(
                  width: 12,
                  height: 20,
                  decoration: BoxDecoration(
                    color: Theme.of(context).cardTheme.color,
                    border: Border.all(color: scheme.onSurface, width: 2),
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
              ),
            ],
          );
        },
      ),
      ),
    );
  }
}
