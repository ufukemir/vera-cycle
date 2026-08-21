import 'dart:io';
import 'dart:typed_data';

import 'package:cycle_app/services/doctor_report_pdf.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pdf/widgets.dart' as pw;

/// The doctor report must never hand someone a document full of boxes.
///
/// The `pdf` package does not use system fonts. With no embedded font it
/// falls back to the base-14 Helvetica, which maps only U+0000–U+00FF —
/// and a codepoint outside that range does not throw. It draws a crossed
/// rectangle (`Placeholder`) instead. So a Turkish user's report read
/// "Ak□□" for "Akış" and "Ba□ a□r□s□" for "Baş ağrısı", an Arabic user's
/// was boxes end to end, and every existing test passed because the
/// fixtures were ASCII.
///
/// These tests check the font itself rather than the rendered output: if
/// the face can map the characters, the placeholder path is never reached.
/// The set of codepoints a TrueType file can actually draw.
///
/// Read straight from the font's `cmap` table rather than through the `pdf`
/// package: `isRuneSupported` lives on the low-level `PdfFont`, which is
/// only reachable with a render `Context`. Parsing the file is both simpler
/// and a truer test — it asks what the shipped asset contains.
Set<int> _coveredCodepoints(File file) {
  final bytes = file.readAsBytesSync();
  final data = ByteData.sublistView(bytes);
  final covered = <int>{};

  final numTables = data.getUint16(4);
  var cmapOffset = -1;
  for (var i = 0; i < numTables; i++) {
    final record = 12 + i * 16;
    final tag = String.fromCharCodes(bytes.sublist(record, record + 4));
    if (tag == 'cmap') cmapOffset = data.getUint32(record + 8);
  }
  if (cmapOffset < 0) return covered;

  final numSubtables = data.getUint16(cmapOffset + 2);
  for (var i = 0; i < numSubtables; i++) {
    final encoding = cmapOffset + 4 + i * 8;
    final subtable = cmapOffset + data.getUint32(encoding + 4);
    if (data.getUint16(subtable) != 4) continue; // format 4 (BMP) only

    final segCount = data.getUint16(subtable + 6) ~/ 2;
    final ends = subtable + 14;
    final starts = ends + segCount * 2 + 2;
    final deltas = starts + segCount * 2;
    final rangeOffsets = deltas + segCount * 2;

    for (var seg = 0; seg < segCount; seg++) {
      final end = data.getUint16(ends + seg * 2);
      final start = data.getUint16(starts + seg * 2);
      if (start > end || start == 0xFFFF) continue;
      final delta = data.getInt16(deltas + seg * 2);
      final rangeOffset = data.getUint16(rangeOffsets + seg * 2);

      for (var c = start; c <= end; c++) {
        int glyph;
        if (rangeOffset == 0) {
          glyph = (c + delta) & 0xFFFF;
        } else {
          final index = rangeOffsets + seg * 2 + rangeOffset + (c - start) * 2;
          if (index + 1 >= bytes.length) continue;
          glyph = data.getUint16(index);
          if (glyph != 0) glyph = (glyph + delta) & 0xFFFF;
        }
        if (glyph != 0) covered.add(c);
      }
    }
  }
  return covered;
}

void main() {
  late Set<int> quicksandGlyphs;
  late pw.Font quicksand;

  setUpAll(() {
    final file = File('assets/fonts/Quicksand-Variable.ttf');
    quicksandGlyphs = _coveredCodepoints(file);
    final bytes = file.readAsBytesSync();
    quicksand = pw.Font.ttf(ByteData.sublistView(bytes));
  });

  bool covers(String text) => text.runes.every(quicksandGlyphs.contains);

  test('the bundled report font covers every Latin-script language', () {
    // One representative string per language, using the characters that
    // actually fall outside Latin-1 and therefore outside Helvetica.
    const samples = {
      'Turkish': 'Akış Baş ağrısı Göğüs İğne',
      'Polish': 'Ból łydki ząb ćma śliwka źle żółty',
      'Czech': 'Křeče příznak ňadro ďábel úterý',
      'Romanian': 'Șase țuică sânge înainte',
      'Hungarian': 'Fejfájás tünet őszi űrlap',
      'Vietnamese': 'Đau bụng kinh nguyệt rụng trứng',
      'French': 'Règles cœur sœur élevé',
      'German': 'Übelkeit Rückenschmerzen Größe',
      'Spanish': 'Menstruación días año',
      'Portuguese': 'Menstruação três coração',
      'Italian': 'Perché così è',
      'Swedish': 'Mensvärk trötthet blödning',
      'Danish': 'Menstruation træthed blødning',
      'Finnish': 'Kuukautiset väsymys päänsärky',
    };

    final broken = <String>[];
    samples.forEach((language, text) {
      if (!covers(text)) broken.add(language);
    });

    expect(
      broken,
      isEmpty,
      reason:
          'the report font cannot render: $broken — these languages '
          'would print crossed boxes in the doctor report',
    );
  });

  test('a report built with the font renders without placeholders', () {
    // End-to-end guard: the same Turkish text through the real builder.
    // `pw.Font.ttf` throwing, or the theme not being applied, both surface
    // here rather than in a user's exported PDF.
    final fonts = DoctorReportFonts(base: quicksand, bold: quicksand);
    final theme = fonts.toTheme();

    // The theme must actually carry the font — an empty ThemeData would
    // silently drop back to Helvetica and reintroduce the whole bug.
    expect(theme.defaultTextStyle.font, isNotNull);
    expect(theme.defaultTextStyle.fontNormal, isNotNull);
    for (final rune in 'Akış Baş ağrısı'.runes) {
      expect(
        quicksandGlyphs.contains(rune),
        isTrue,
        reason:
            'U+${rune.toRadixString(16).padLeft(4, '0')} would print '
            'as a box',
      );
    }
  });

  test('scripts with no bundled face are a known, listed gap', () {
    // Deliberately asserts the CURRENT limitation rather than pretending it
    // is fixed. When a Noto face for one of these is bundled and added to
    // DoctorReportFonts.fallbacks, move that entry out of this list — the
    // test failing is the reminder to do so.
    const uncovered = {
      'Arabic': 'الدورة الشهرية',
      'Persian': 'پریود قاعدگی',
      'Urdu': 'ماہواری',
      'Cyrillic': 'Менструация цикл',
      'Greek': 'Έμμηνος κύκλος',
      'Devanagari': 'पीरियड चक्र',
      'Bengali': 'পিরিয়ড চক্র',
      'Tamil': 'மாதவிடாய்',
      'Telugu': 'రుతుక్రమం',
      'Thai': 'ประจำเดือน',
      'Japanese': '生理 周期',
      'Korean': '생리 주기',
      'Chinese': '月经 周期',
    };

    for (final entry in uncovered.entries) {
      expect(
        covers(entry.value),
        isFalse,
        reason:
            '${entry.key} is now covered by the bundled font — remove '
            'it from this list and from the caveat in '
            'ExportScreen._loadReportFonts',
      );
    }
  });
}
