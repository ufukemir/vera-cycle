import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart' hide isSameDay;

import '../../l10n/app_localizations.dart';
import '../../models/prediction.dart';
import '../../state/app_preferences.dart';
import '../../state/cycle_controller.dart';
import '../../util/day.dart';
import 'widgets/calendar_day_cell.dart';
import 'widgets/calendar_legend.dart';
import 'widgets/day_detail_sheet.dart';
import 'widgets/month_jump_sheet.dart';

/// Resolves the stored week-start preference for `table_calendar`.
///
/// [weekday] is a [DateTime] weekday constant, or `null` for "follow the
/// locale" — in which case [MaterialLocalizations.firstDayOfWeekIndex]
/// decides (0 = Sunday … 6 = Saturday). Following the locale is what makes
/// Saturday-first languages (ar, fa, ur) correct by default.
StartingDayOfWeek startingDayFor(int? weekday, BuildContext context) {
  final effective =
      weekday ??
      switch (MaterialLocalizations.of(context).firstDayOfWeekIndex) {
        0 => DateTime.sunday,
        2 => DateTime.tuesday,
        3 => DateTime.wednesday,
        4 => DateTime.thursday,
        5 => DateTime.friday,
        6 => DateTime.saturday,
        _ => DateTime.monday,
      };

  return switch (effective) {
    DateTime.sunday => StartingDayOfWeek.sunday,
    DateTime.tuesday => StartingDayOfWeek.tuesday,
    DateTime.wednesday => StartingDayOfWeek.wednesday,
    DateTime.thursday => StartingDayOfWeek.thursday,
    DateTime.friday => StartingDayOfWeek.friday,
    DateTime.saturday => StartingDayOfWeek.saturday,
    _ => StartingDayOfWeek.monday,
  };
}

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  DateTime _focusedDay = today();

  static final _firstDay = DateTime(2015);

  Future<void> _jumpToMonth() async {
    final picked = await showMonthJumpSheet(
      context,
      focused: _focusedDay,
      firstDay: _firstDay,
    );
    if (picked != null && mounted) setState(() => _focusedDay = picked);
  }

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
    // A peek first — the full editor is one more tap from the sheet.
    showDayDetailSheet(context, date);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final controller = context.watch<CycleController>();
    final prediction = controller.prediction;
    // Whether the fertile-window / ovulation layer has anything to show
    // anywhere in the visible history — checked against today's estimate
    // since that's the same data source the grid itself paints from.
    final hasFertileEstimate = controller.todayStatus.hasFertileEstimate;

    return Scaffold(
      appBar: AppBar(title: Text(l10n.navCalendar)),
      body: SafeArea(
        child: Column(
          children: [
            TableCalendar(
              firstDay: _firstDay,
              lastDay: today(),
              focusedDay: _focusedDay,
              currentDay: today(),
              // Without these two the calendar silently ignores the app's
              // language and the week-start setting, rendering "August /
              // Sun Mon" to a Turkish user who picked Monday.
              locale: Localizations.localeOf(context).toString(),
              // No explicit choice means "do what this locale does".
              startingDayOfWeek: startingDayFor(
                context.watch<AppPreferences>().weekStartWeekday,
                context,
              ),
              onHeaderTapped: (_) => _jumpToMonth(),
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
              headerStyle: HeaderStyle(
                formatButtonVisible: false,
                titleCentered: true,
                // Coloured like a link, because it is one — this is the
                // only cue that the month name opens the jump sheet.
                titleTextStyle:
                    Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                    ) ??
                    const TextStyle(),
              ),
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
            CalendarLegend(
              hasPredictedWindow: prediction.hasPrediction,
              hasFertileEstimate: hasFertileEstimate,
            ),
          ],
        ),
      ),
    );
  }
}
