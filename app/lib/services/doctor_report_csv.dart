import '../models/day_log.dart';
import '../util/day.dart';

/// Builds a CSV a user can hand to a clinician.
///
/// Column values are the raw English enum names (`medium`, `cramps`, ...)
/// rather than localized prose — deliberately: this keeps the export
/// unambiguous regardless of the app's display language, and it's a smaller,
/// more testable surface than threading localized labels through a pure
/// service. Headers stay in English for the same reason.
class DoctorReportCsv {
  const DoctorReportCsv();

  static const _headers = [
    'date',
    'flow',
    'symptoms',
    'mood',
    'sexual_activity',
    'basal_temp_c',
    'cervical_mucus',
    'note',
  ];

  /// [includeNotes] defaults to `false`: free-text notes may contain content
  /// the user never intended to hand to a clinician, so including them is an
  /// explicit opt-in on the export screen, not a default.
  String build(List<DayLog> logs, {bool includeNotes = false}) {
    final rows = <List<String>>[_headers];
    for (final log in logs) {
      rows.add([
        dayKey(log.date),
        log.flow?.name ?? '',
        log.symptoms.map((s) => s.name).join(';'),
        log.mood?.name ?? '',
        log.sexualActivity?.toString() ?? '',
        log.basalTempC?.toStringAsFixed(1) ?? '',
        log.mucus?.name ?? '',
        includeNotes ? (log.note ?? '') : '',
      ]);
    }
    return rows.map(_encodeRow).join('\r\n');
  }

  String _encodeRow(List<String> fields) => fields.map(_encodeField).join(',');

  /// RFC 4180: quote a field if it contains a comma, quote, or newline;
  /// double any embedded quotes.
  String _encodeField(String value) {
    final needsQuoting =
        value.contains(',') || value.contains('"') || value.contains('\n') || value.contains('\r');
    if (!needsQuoting) return value;
    return '"${value.replaceAll('"', '""')}"';
  }
}
