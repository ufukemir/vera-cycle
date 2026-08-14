import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart' hide isSameDay;

import '../../l10n/app_localizations.dart';
import '../../models/prediction.dart';
import '../../state/cycle_controller.dart';
import '../../util/day.dart';
import '../day_log/day_log_screen.dart';
import 'widgets/calendar_day_cell.dart';
import 'widgets/calendar_legend.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  DateTime _focusedDay = today();

  CalendarDayMark _markFor(
    DateTime day,
    CycleController controller,
    CyclePrediction prediction,
  ) {
    final date = dateOnly(day);
    if (controller.logFor(date)?.hasBleeding ?? false) {
      return CalendarDayMark.actual;
    }
    if (prediction.hasPrediction &&
        !date.isBefore(prediction.earliestStart!) &&
        !date.isAfter(prediction.latestStart!)) {
      return CalendarDayMark.predicted;
    }
    final status = controller.statusOn(date);
    if (status.hasFertileEstimate &&
        !date.isBefore(status.fertileWindowStart!) &&
        !date.isAfter(status.fertileWindowEnd!)) {
      return CalendarDayMark.fertile;
    }
    return CalendarDayMark.none;
  }

  /// The fertile window's last day is always ovulation + 1 (see
  /// [PredictionEngine.status]'s `fertileEnd = addDays(ovulation, 1)`) — so
  /// it can be derived here without exposing a new field on [CycleStatus].
  bool _isEstimatedOvulation(DateTime day, CycleController controller) {
    final date = dateOnly(day);
    final status = controller.statusOn(date);
    if (!status.hasFertileEstimate) return false;
    return isSameDay(date, addDays(status.fertileWindowEnd!, -1));
  }

  void _openDay(DateTime day) {
    final date = dateOnly(day);
    if (date.isAfter(today())) return;
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (_) => DayLogScreen(date: date)));
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final controller = context.watch<CycleController>();
    final prediction = controller.prediction;

    return Scaffold(
      appBar: AppBar(title: Text(l10n.navCalendar)),
      body: SafeArea(
        child: Column(
          children: [
            TableCalendar(
              firstDay: DateTime(2015),
              lastDay: today(),
              focusedDay: _focusedDay,
              currentDay: today(),
              // Future months simply don't exist to scroll into — this is
              // the page-level half of "future dates not tappable"; the day
              // level half is `_openDay`'s own guard, kept even though it's
              // currently unreachable, because a future onDaySelected caller
              // must not silently lose the guard.
              onPageChanged: (day) => setState(() => _focusedDay = day),
              onDaySelected: (selected, focused) {
                setState(() => _focusedDay = focused);
                _openDay(selected);
              },
              headerStyle: const HeaderStyle(formatButtonVisible: false),
              calendarBuilders: CalendarBuilders(
                defaultBuilder: (context, day, focusedDay) => CalendarDayCell(
                  day: day,
                  mark: _markFor(day, controller, prediction),
                  isEstimatedOvulation: _isEstimatedOvulation(day, controller),
                ),
                todayBuilder: (context, day, focusedDay) => CalendarDayCell(
                  day: day,
                  mark: _markFor(day, controller, prediction),
                  isEstimatedOvulation: _isEstimatedOvulation(day, controller),
                  isToday: true,
                ),
              ),
            ),
            const CalendarLegend(),
          ],
        ),
      ),
    );
  }
}
