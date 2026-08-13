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
  });

  final DateTime day;
  final CalendarDayMark mark;
  final bool isToday;

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
      child: Container(
        width: 36,
        height: 36,
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
    );
  }
}
