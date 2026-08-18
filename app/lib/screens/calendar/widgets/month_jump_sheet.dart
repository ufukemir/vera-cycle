import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../l10n/app_localizations.dart';
import '../../../util/day.dart';

/// Jump straight to any month instead of paging back one at a time.
///
/// A year with twelve months fits on one screen, so this shows the whole
/// year at once rather than a scrolling wheel: reaching a month two years
/// back costs two taps on the year arrow and one on the month, and you can
/// see where you're going the whole time.
///
/// Months after today are disabled rather than hidden — a greyed-out
/// December explains itself, a missing one looks like a bug.
Future<DateTime?> showMonthJumpSheet(
  BuildContext context, {
  required DateTime focused,
  required DateTime firstDay,
}) {
  return showModalBottomSheet<DateTime>(
    context: context,
    showDragHandle: true,
    builder: (_) => _MonthJumpSheet(focused: focused, firstDay: firstDay),
  );
}

class _MonthJumpSheet extends StatefulWidget {
  const _MonthJumpSheet({required this.focused, required this.firstDay});

  final DateTime focused;
  final DateTime firstDay;

  @override
  State<_MonthJumpSheet> createState() => _MonthJumpSheetState();
}

class _MonthJumpSheetState extends State<_MonthJumpSheet> {
  late int _year = widget.focused.year;

  /// Whether the grid is showing years instead of months.
  ///
  /// Stepping the year one arrow-tap at a time is fine for last month and
  /// tedious for two years back, which is exactly when someone opens this
  /// sheet. Tapping the year swaps the same grid to years, so the gesture
  /// that already means "pick one of these" works at both levels.
  bool _pickingYear = false;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    final locale = Localizations.localeOf(context).toString();
    final now = today();
    final monthName = DateFormat.MMM(locale);

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              l10n.calendarJumpTitle,
              style: theme.textTheme.titleMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: _pickingYear || _year <= widget.firstDay.year
                      ? null
                      : () => setState(() => _year--),
                  icon: const Icon(Icons.chevron_left),
                ),
                SizedBox(
                  width: 120,
                  // A bare number between two chevrons says nothing to a
                  // screen reader about what it steps through, and gives no
                  // hint that it is tappable.
                  child: Semantics(
                    button: true,
                    label: '${l10n.calendarJumpYearLabel}: $_year',
                    child: ExcludeSemantics(
                      child: InkWell(
                        borderRadius: BorderRadius.circular(10),
                        onTap: () =>
                            setState(() => _pickingYear = !_pickingYear),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '$_year',
                                style: theme.textTheme.headlineSmall,
                              ),
                              Icon(
                                _pickingYear
                                    ? Icons.arrow_drop_up
                                    : Icons.arrow_drop_down,
                                color: theme.colorScheme.onSurfaceVariant,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                IconButton(
                  onPressed: _pickingYear || _year >= now.year
                      ? null
                      : () => setState(() => _year++),
                  icon: const Icon(Icons.chevron_right),
                ),
              ],
            ),
            const SizedBox(height: 12),
            if (_pickingYear)
              _YearGrid(
                firstYear: widget.firstDay.year,
                lastYear: now.year,
                selected: _year,
                onPick: (year) => setState(() {
                  _year = year;
                  _pickingYear = false;
                }),
              )
            else
              GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 4,
                childAspectRatio: 2.1,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
                children: List.generate(12, (i) {
                  final month = DateTime(_year, i + 1);
                  final enabled =
                      !month.isAfter(DateTime(now.year, now.month)) &&
                      !month.isBefore(
                        DateTime(widget.firstDay.year, widget.firstDay.month),
                      );
                  final selected =
                      _year == widget.focused.year &&
                      i + 1 == widget.focused.month;

                  return _MonthChip(
                    label: monthName.format(month),
                    selected: selected,
                    onTap: enabled
                        ? () => Navigator.of(context).pop(
                            // Day 1 unless it's the current month, where
                            // landing on today is what you actually wanted.
                            month.year == now.year && month.month == now.month
                                ? now
                                : month,
                          )
                        : null,
                  );
                }),
              ),
          ],
        ),
      ),
    );
  }
}

/// The same chip grid as the months, one row of four per four years.
///
/// Newest first: someone jumping to a year almost always wants a recent
/// one, and the list is bounded by the first day they ever logged, so it
/// stays short for real users and does not need a scroll wheel.
class _YearGrid extends StatelessWidget {
  const _YearGrid({
    required this.firstYear,
    required this.lastYear,
    required this.selected,
    required this.onPick,
  });

  final int firstYear;
  final int lastYear;
  final int selected;
  final ValueChanged<int> onPick;

  @override
  Widget build(BuildContext context) {
    final years = [for (var year = lastYear; year >= firstYear; year--) year];

    return ConstrainedBox(
      // Bounded so a long history scrolls inside the sheet rather than
      // pushing the sheet past the top of the screen.
      constraints: const BoxConstraints(maxHeight: 260),
      child: GridView.count(
        shrinkWrap: true,
        crossAxisCount: 4,
        childAspectRatio: 2.1,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
        children: [
          for (final year in years)
            _MonthChip(
              label: '$year',
              selected: year == selected,
              onTap: () => onPick(year),
            ),
        ],
      ),
    );
  }
}

class _MonthChip extends StatelessWidget {
  const _MonthChip({
    required this.label,
    required this.selected,
    required this.onTap,
  });

  final String label;
  final bool selected;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final disabled = onTap == null;

    return Material(
      color: selected ? scheme.primary : scheme.surfaceContainerHigh,
      borderRadius: BorderRadius.circular(14),
      child: InkWell(
        borderRadius: BorderRadius.circular(14),
        onTap: onTap,
        child: Center(
          child: Text(
            label,
            style: Theme.of(context).textTheme.labelLarge?.copyWith(
              color: selected
                  ? scheme.onPrimary
                  : disabled
                  ? scheme.onSurfaceVariant.withValues(alpha: 0.4)
                  : scheme.onSurface,
            ),
          ),
        ),
      ),
    );
  }
}
