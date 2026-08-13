/// Date-only helpers.
///
/// Cycle tracking is a *calendar day* domain, not an instant-in-time domain: a
/// period starts on a day, not at 14:32. Every [DateTime] that crosses into the
/// model layer must be normalised with [dateOnly] first, otherwise day
/// arithmetic silently drifts across DST boundaries and time zones.
library;

/// Strips the time component, keeping the local calendar date.
DateTime dateOnly(DateTime d) => DateTime(d.year, d.month, d.day);

/// Today's local calendar date.
DateTime today() => dateOnly(DateTime.now());

/// Whole calendar days from [a] to [b]; negative when [b] precedes [a].
///
/// Uses UTC internally so that a DST transition between the two dates cannot
/// turn a 24-hour day into 23 and round the result down.
int daysBetween(DateTime a, DateTime b) {
  final ua = DateTime.utc(a.year, a.month, a.day);
  final ub = DateTime.utc(b.year, b.month, b.day);
  return ub.difference(ua).inDays;
}

/// [d] shifted by [n] calendar days, DST-safe.
DateTime addDays(DateTime d, int n) {
  final u = DateTime.utc(d.year, d.month, d.day).add(Duration(days: n));
  return DateTime(u.year, u.month, u.day);
}

/// `true` when [a] and [b] are the same calendar day.
bool isSameDay(DateTime a, DateTime b) =>
    a.year == b.year && a.month == b.month && a.day == b.day;

/// Sortable `YYYY-MM-DD` key used as the storage identity of a day log.
String dayKey(DateTime d) =>
    '${d.year.toString().padLeft(4, '0')}-'
    '${d.month.toString().padLeft(2, '0')}-'
    '${d.day.toString().padLeft(2, '0')}';

/// Parses a [dayKey]. Throws [FormatException] on malformed input so that a
/// corrupted store fails loudly rather than silently dropping days.
DateTime parseDayKey(String key) {
  final parts = key.split('-');
  if (parts.length != 3) {
    throw FormatException('Malformed day key', key);
  }
  final y = int.parse(parts[0]);
  final m = int.parse(parts[1]);
  final d = int.parse(parts[2]);
  return DateTime(y, m, d);
}
