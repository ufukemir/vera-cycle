import '../models/day_log.dart';
import '../models/enums.dart';
import '../util/day.dart';

/// What a parse produced, including what it refused to guess at.
///
/// Skipped rows are surfaced rather than silently dropped: importing
/// someone's years of history and quietly losing a third of it would be
/// worse than telling them up front.
class CsvImportResult {
  const CsvImportResult({
    required this.logs,
    required this.skippedRows,
    required this.detectedDateHeader,
    required this.detectedFlowHeader,
  });

  final List<DayLog> logs;
  final int skippedRows;
  final String? detectedDateHeader;
  final String? detectedFlowHeader;

  bool get isEmpty => logs.isEmpty;
}

/// Thrown when the file isn't something we can read at all — as opposed
/// to a readable file with some unparseable rows.
class CsvImportException implements Exception {
  const CsvImportException(this.reason);

  final CsvImportFailure reason;
}

enum CsvImportFailure { empty, noDateColumn }

/// Reads period history exported from another tracker.
///
/// Deliberately format-agnostic instead of hardcoding one competitor's
/// schema: exports differ between apps and change between versions, so
/// this looks for a date column and an optional flow column by header
/// name and shape, and ignores everything else.
///
/// Only dates and flow are imported. Symptom and mood vocabularies don't
/// map cleanly between apps, and guessing at them would put words in the
/// user's mouth about their own body.
class CsvCycleImporter {
  const CsvCycleImporter();

  static const _dateHeaders = {
    'date', 'day', 'period start', 'start date', 'timestamp',
    'tarih', 'gun', 'gün', 'baslangic', 'başlangıç',
  };

  static const _flowHeaders = {
    'flow', 'period', 'bleeding', 'intensity', 'menstrual flow',
    'akis', 'akış', 'regl', 'adet', 'kanama', 'yogunluk', 'yoğunluk',
  };

  static const _heavy = {'heavy', 'strong', 'yogun', 'yoğun', 'cok', 'çok', '4', '3'};
  static const _medium = {'medium', 'moderate', 'normal', 'orta', '2'};
  static const _light = {'light', 'mild', 'hafif', '1'};
  static const _spotting = {'spotting', 'spot', 'leke', 'lekelenme'};
  static const _none = {'', 'none', 'no', 'false', '0', 'yok', 'hayir', 'hayır'};

  CsvImportResult parse(String csv) {
    final rows = _splitRows(csv);
    if (rows.isEmpty) {
      throw const CsvImportException(CsvImportFailure.empty);
    }

    final header = rows.first.map(_normalize).toList();
    final dateIndex = _indexOfAny(header, _dateHeaders);
    if (dateIndex == null) {
      throw const CsvImportException(CsvImportFailure.noDateColumn);
    }
    final flowIndex = _indexOfAny(header, _flowHeaders);

    final byDate = <String, DayLog>{};
    var skipped = 0;
    for (final row in rows.skip(1)) {
      if (row.length <= dateIndex) {
        skipped++;
        continue;
      }
      final date = _parseDate(row[dateIndex]);
      if (date == null) {
        skipped++;
        continue;
      }

      final rawFlow =
          (flowIndex != null && row.length > flowIndex) ? row[flowIndex] : '';
      final flow = _parseFlow(rawFlow);
      // A dated row with no bleeding carries nothing we import, so it is
      // not an error — just nothing to add.
      if (flow == null) continue;

      // Later rows win on duplicate dates; exports sometimes repeat a day.
      byDate[dayKey(date)] = DayLog(date: date, flow: flow);
    }

    final logs = byDate.values.toList()
      ..sort((a, b) => a.date.compareTo(b.date));

    return CsvImportResult(
      logs: logs,
      skippedRows: skipped,
      detectedDateHeader: rows.first[dateIndex],
      detectedFlowHeader: flowIndex == null ? null : rows.first[flowIndex],
    );
  }

  List<List<String>> _splitRows(String csv) {
    final rows = <List<String>>[];
    for (final line in csv.split(RegExp(r'\r\n|\r|\n'))) {
      if (line.trim().isEmpty) continue;
      rows.add(_splitLine(line));
    }
    return rows;
  }

  /// Minimal RFC 4180 reader: handles quoted fields containing the
  /// delimiter and doubled quotes. Semicolons count as delimiters too —
  /// locale-configured spreadsheets export that way.
  List<String> _splitLine(String line) {
    final fields = <String>[];
    final buffer = StringBuffer();
    var inQuotes = false;

    for (var i = 0; i < line.length; i++) {
      final ch = line[i];
      if (inQuotes) {
        if (ch == '"') {
          if (i + 1 < line.length && line[i + 1] == '"') {
            buffer.write('"');
            i++;
          } else {
            inQuotes = false;
          }
        } else {
          buffer.write(ch);
        }
      } else if (ch == '"') {
        inQuotes = true;
      } else if (ch == ',' || ch == ';') {
        fields.add(buffer.toString().trim());
        buffer.clear();
      } else {
        buffer.write(ch);
      }
    }
    fields.add(buffer.toString().trim());
    return fields;
  }

  int? _indexOfAny(List<String> header, Set<String> candidates) {
    for (var i = 0; i < header.length; i++) {
      if (candidates.contains(header[i])) return i;
    }
    // Fall back to a contains-match: "Period start date" should still hit.
    for (var i = 0; i < header.length; i++) {
      for (final candidate in candidates) {
        if (candidate.length >= 4 && header[i].contains(candidate)) return i;
      }
    }
    return null;
  }

  String _normalize(String s) => s
      .toLowerCase()
      .trim()
      .replaceAll('ı', 'i')
      .replaceAll('ğ', 'g')
      .replaceAll('ü', 'u')
      .replaceAll('ş', 's')
      .replaceAll('ö', 'o')
      .replaceAll('ç', 'c')
      .replaceAll('_', ' ');

  /// Accepts ISO (2026-03-14), slashed (14/03/2026, 2026/03/14) and dotted
  /// (14.03.2026) dates. Ambiguous day/month order resolves to
  /// day-first only when the first number can't be a month.
  DateTime? _parseDate(String raw) {
    final value = raw.trim();
    if (value.isEmpty) return null;

    final iso = DateTime.tryParse(value);
    if (iso != null) return dateOnly(iso);

    final parts = value.split(RegExp(r'[/.\-]'));
    if (parts.length != 3) return null;
    final nums = parts.map((p) => int.tryParse(p.trim())).toList();
    if (nums.any((n) => n == null)) return null;

    int year, month, day;
    if (nums[0]! > 31) {
      year = nums[0]!;
      month = nums[1]!;
      day = nums[2]!;
    } else {
      year = nums[2]!;
      if (nums[0]! > 12) {
        day = nums[0]!;
        month = nums[1]!;
      } else if (nums[1]! > 12) {
        month = nums[0]!;
        day = nums[1]!;
      } else {
        // Genuinely ambiguous (03/04/2026). Day-first is the majority
        // convention outside the US and matches this app's locales.
        day = nums[0]!;
        month = nums[1]!;
      }
    }
    if (year < 100) year += 2000;
    if (month < 1 || month > 12 || day < 1 || day > 31) return null;

    final parsed = DateTime(year, month, day);
    // Reject rollovers like 31/02 that DateTime silently normalises.
    if (parsed.month != month || parsed.day != day) return null;
    return parsed;
  }

  FlowIntensity? _parseFlow(String raw) {
    final value = _normalize(raw);
    if (_none.contains(value)) return null;
    if (_spotting.any(value.contains)) return FlowIntensity.spotting;
    if (_heavy.contains(value)) return FlowIntensity.heavy;
    if (_medium.contains(value)) return FlowIntensity.medium;
    if (_light.contains(value)) return FlowIntensity.light;
    if (value.contains('heavy') || value.contains('yogun')) {
      return FlowIntensity.heavy;
    }
    if (value.contains('light') || value.contains('hafif')) {
      return FlowIntensity.light;
    }
    // A dated row marked as a period without an intensity is still a
    // period; medium is the neutral assumption and the user can edit it.
    if (value == 'true' || value == 'yes' || value == 'evet' ||
        value == 'x' || value.contains('period') || value.contains('regl') ||
        value.contains('adet')) {
      return FlowIntensity.medium;
    }
    return null;
  }
}
