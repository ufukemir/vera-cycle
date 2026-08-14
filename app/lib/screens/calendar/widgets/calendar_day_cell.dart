import 'package:flutter/material.dart';

/// How a single calendar cell should be decorated.
///
/// [predicted] deliberately styles every day in the predicted window
/// identically — there is no "this is the most likely day" emphasis. Bolding
/// one day inside the range would silently reintroduce the false precision
/// [PredictionRangeCard] is built to avoid.
enum CalendarDayMark { none, actual, predicted, fertile }

class CalendarDayCell extends StatelessWidget {
  const CalendarDayCell({
    super.key,
    required this.day,
    required this.mark,
    this.isToday = false,
    this.isEstimatedOvulation = false,
  });

  final DateTime day;
  final CalendarDayMark mark;
  final bool isToday;

  /// A single day inside the fertile-window estimate, singled out as "the"
  /// ovulation estimate. Shown as a small corner dot, not a bolder/bigger
  /// ring — the fertile-window ring itself still renders identically on
  /// every day in the range, so this never reintroduces the false precision
  /// [CalendarDayMark.predicted]'s doc comment warns against; it only adds
  /// a distinct, clearly-labelled (see [CalendarLegend]) data point.
  final bool isEstimatedOvulation;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    Decoration? decoration;
    Color textColor = scheme.onSurface;

    switch (mark) {
      case CalendarDayMark.actual:
        decoration = BoxDecoration(shape: BoxShape.circle, color: scheme.primary);
        textColor = scheme.onPrimary;
      case CalendarDayMark.predicted:
        decoration = BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: scheme.primary, width: 2),
        );
      case CalendarDayMark.fertile:
        decoration = BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: scheme.tertiary, width: 2),
        );
      case CalendarDayMark.none:
        decoration = null;
    }

    return Center(
      child: SizedBox(
        width: 36,
        height: 36,
        child: Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.center,
          children: [
            Container(
              decoration: decoration,
              alignment: Alignment.center,
              child: Text(
                '${day.day}',
                style: TextStyle(
                  color: textColor,
                  fontWeight: isToday ? FontWeight.bold : FontWeight.normal,
                ),
              ),
            ),
            if (isEstimatedOvulation)
              Positioned(
                top: -2,
                right: -2,
                child: Container(
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(shape: BoxShape.circle, color: scheme.tertiary),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
