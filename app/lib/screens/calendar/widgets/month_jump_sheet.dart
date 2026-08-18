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
                  onPressed: _year > widget.firstDay.year
                      ? () => setState(() => _year--)
                      : null,
                  icon: const Icon(Icons.chevron_left),
                ),
                SizedBox(
                  width: 96,
                  // A bare number between two chevrons says nothing to a
                  // screen reader about what it steps through.
                  child: Semantics(
                    label: '${l10n.calendarJumpYearLabel}: $_year',
                    child: ExcludeSemantics(
                      child: Text(
                        '$_year',
                        textAlign: TextAlign.center,
                        style: theme.textTheme.headlineSmall,
                      ),
                    ),
                  ),
                ),
                IconButton(
                  onPressed:
                      _year < now.year ? () => setState(() => _year++) : null,
                  icon: const Icon(Icons.chevron_right),
                ),
              ],
            ),
            const SizedBox(height: 12),
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 4,
              childAspectRatio: 2.1,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
              children: List.generate(12, (i) {
                final month = DateTime(_year, i + 1);
                final enabled = !month.isAfter(DateTime(now.year, now.month)) &&
                    !month
                        .isBefore(DateTime(widget.firstDay.year, widget.firstDay.month));
                final selected = _year == widget.focused.year &&
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
