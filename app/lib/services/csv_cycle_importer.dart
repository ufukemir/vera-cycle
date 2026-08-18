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

  // Header vocabularies covered only English and Turkish, so a German user
  // exporting from a German tracker ("Datum"/"Blutung"), or a Spanish one
  // ("Fecha"/"Flujo"), hit `noDateColumn` and the import failed outright —
  // with a localized error that gave no hint why. These lists cover every
  // language the app ships in, plus the parked ones most likely to follow.
  //
  // Matching is done on the diacritic-folded, lower-cased header (see
  // [_normalize]), so accented forms need no separate entry: "tarih" covers
  // "Tarih", "fecha" covers "Fecha". Entries that differ by more than
  // accents ("gun"/"gün") are listed once in folded form.
  static const _dateHeaders = {
    // en
    'date', 'day', 'period start', 'start date', 'timestamp',
    // tr
    'tarih', 'gun', 'baslangic',
    // de
    'datum', 'tag', 'beginn', 'startdatum',
    // es / pt
    'fecha', 'dia', 'inicio', 'data', 'data de inicio',
    // fr
    'jour', 'debut', 'date de debut',
    // id / ms
    'tanggal', 'hari', 'mulai', 'tarikh',
    // it
    'giorno', 'inizio',
    // nl
    'dag', 'begin', 'begindatum',
    // pl / cs
    'data poczatku', 'dzien', 'poczatek', 'datum zacatku', 'den',
    // ru / uk — 'data' and 'den' are already listed above (es/pt, cs)
    'nachalo', 'pochatok',
    'дата', 'день', 'начало', 'початок',
    // ar / fa / ur
    'التاريخ', 'تاريخ', 'اليوم', 'يوم', 'بداية', 'شروع',
    // ja / zh / ko
    '日付', '日', '開始', '开始', '日期', '날짜', '시작',
  };

  static const _flowHeaders = {
    // en
    'flow', 'period', 'bleeding', 'intensity', 'menstrual flow',
    // tr
    'akis', 'regl', 'adet', 'kanama', 'yogunluk',
    // de
    'blutung', 'starke', 'periode', 'menstruation',
    // es / pt
    'flujo', 'sangrado', 'intensidad', 'regla', 'fluxo', 'sangramento',
    // fr
    'flux', 'saignement', 'regles', 'intensite',
    // id / ms
    'aliran', 'pendarahan', 'haid', 'menstruasi',
    // it
    'flusso', 'sanguinamento', 'mestruazioni',
    // nl
    'bloeding', 'menstruatie',
    // pl / cs
    'krwawienie', 'przeplyw', 'krvaceni',
    // ru / uk
    'выделения', 'кровотечение', 'месячные', 'виділення', 'місячні',
    // ar / fa / ur
    'التدفق', 'نزيف', 'الدورة', 'خونریزی', 'خون',
    // ja / zh / ko
    '経血量', '出血', '经量', '月经', '생리', '출혈',
  };

  static const _heavy = {
    'heavy', 'strong', 'yogun', 'cok',
    'stark', 'abundante', 'intenso', 'abondant', 'banyak', 'lebat',
    'zwaar', 'hevig', 'obfite', 'silne', 'обильные', 'сильное',
    'غزير', 'شدید', '多い', '多', '많음',
    '4', '3',
  };
  static const _medium = {
    'medium', 'moderate', 'normal', 'orta',
    'mittel', 'moderado', 'medio', 'moyen', 'sedang', 'gemiddeld', 'matig',
    'umiarkowane', 'srednie', 'умеренные', 'средние', 'помірні',
    'متوسط', '普通', '中等', '보통',
    '2',
  };
  static const _light = {
    'light', 'mild', 'hafif',
    'leicht', 'ligero', 'leve', 'leger', 'ringan', 'licht',
    'lekkie', 'slabe', 'скудные', 'легкое', 'слабкі',
    'خفيف', 'کم', '少ない', '少', '적음',
    '1',
  };
  static const _spotting = {
    'spotting', 'spot', 'leke', 'lekelenme',
    'schmierblutung', 'manchado', 'goteo', 'bercak', 'flek',
    'plamienie', 'spotting bloeding', 'мазня', 'мажущие', 'мазкі',
    'تبقيع', 'لکه بینی', '少量出血', '点滴出血', '점상 출혈',
  };
  static const _none = {
    '', 'none', 'no', 'false', '0', 'yok', 'hayir',
    'keine', 'nein', 'ninguno', 'nenhum', 'aucun', 'tidak', 'tiada',
    'nessuno', 'geen', 'brak', 'nie', 'нет', 'немає', '없음',
    'لا', 'هیچ', 'なし', '无', '無',
  };

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

  /// Latin diacritic folding for header and value matching.
  ///
  /// This folded exactly six Turkish characters, which was fine while the
  /// vocabularies were English + Turkish. With German, Spanish, French,
  /// Polish and Czech headers in the mix it is not: `ä`, `ß`, `é`, `ą`, `ř`
  /// all survived unfolded, and Czech `š` (U+0161) is a different codepoint
  /// from Turkish `ş` (U+015F), so it was never covered at all.
  ///
  /// Non-Latin scripts pass through untouched — Cyrillic, Arabic and CJK
  /// headers are matched as written, which is why those entries in the
  /// vocabularies above are in their own script.
  static const _fold = {
    'à': 'a', 'á': 'a', 'â': 'a', 'ã': 'a', 'ä': 'a', 'å': 'a', 'ā': 'a',
    'ă': 'a', 'ą': 'a',
    'ç': 'c', 'ć': 'c', 'č': 'c',
    'ď': 'd', 'đ': 'd',
    'è': 'e', 'é': 'e', 'ê': 'e', 'ë': 'e', 'ē': 'e', 'ė': 'e', 'ę': 'e',
    'ě': 'e',
    'ğ': 'g',
    'ì': 'i', 'í': 'i', 'î': 'i', 'ï': 'i', 'ī': 'i', 'į': 'i', 'ı': 'i',
    'ł': 'l',
    'ñ': 'n', 'ń': 'n', 'ň': 'n',
    'ò': 'o', 'ó': 'o', 'ô': 'o', 'õ': 'o', 'ö': 'o', 'ø': 'o', 'ō': 'o',
    'ő': 'o',
    'ř': 'r',
    'ś': 's', 'š': 's', 'ş': 's', 'ș': 's',
    'ť': 't', 'ţ': 't', 'ț': 't',
    'ù': 'u', 'ú': 'u', 'û': 'u', 'ü': 'u', 'ū': 'u', 'ů': 'u', 'ű': 'u',
    'ý': 'y', 'ÿ': 'y',
    'ź': 'z', 'ż': 'z', 'ž': 'z',
    'æ': 'ae', 'œ': 'oe', 'ß': 'ss',
  };

  String _normalize(String s) {
    final out = StringBuffer();
    for (final rune in s.toLowerCase().trim().runes) {
      final ch = String.fromCharCode(rune);
      out.write(_fold[ch] ?? (ch == '_' ? ' ' : ch));
    }
    return out.toString();
  }

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
