import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../l10n/app_localizations.dart';
import '../../../models/day_log.dart';
import '../../../models/enums.dart';
import '../../../util/day.dart';

/// A quick "last few days" cervical mucus trend, shown above the mucus
/// selector on the day-log screen — helps a fertility-awareness user spot a
/// pattern without leaving this screen. Read-only: editing still only
/// happens through [OptionalTrackersSection]'s selector.
class MucusHistorySummary extends StatelessWidget {
  const MucusHistorySummary({super.key, required this.upToExclusive, required this.logs});

  /// The day currently being edited — history is everything strictly before
  /// it, so today's own not-yet-saved selection never appears twice.
  final DateTime upToExclusive;
  final List<DayLog> logs;

  @override
  Widget build(BuildContext context) {
    final cutoff = dateOnly(upToExclusive);
    final recent = logs
        .where((log) => log.mucus != null && log.date.isBefore(cutoff))
        .toList()
      ..sort((a, b) => b.date.compareTo(a.date));
    final entries = recent.take(3).toList();
    if (entries.isEmpty) return const SizedBox.shrink();

    final l10n = AppLocalizations.of(context)!;
    final labels = <CervicalMucus, String>{
      CervicalMucus.dry: l10n.mucusDry,
      CervicalMucus.sticky: l10n.mucusSticky,
      CervicalMucus.creamy: l10n.mucusCreamy,
      CervicalMucus.watery: l10n.mucusWatery,
      CervicalMucus.eggWhite: l10n.mucusEggWhite,
    };
    final dateFormat = DateFormat.MMMd(Localizations.localeOf(context).toString());

    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Wrap(
        spacing: 8,
        runSpacing: 8,
        children: [
          for (final entry in entries.reversed)
            Chip(
              label: Text('${dateFormat.format(entry.date)}: ${labels[entry.mucus!]}'),
              visualDensity: VisualDensity.compact,
            ),
        ],
      ),
    );
  }
}
