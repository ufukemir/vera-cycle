import 'package:cycle_app/models/enums.dart';
import 'package:cycle_app/services/csv_cycle_importer.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const importer = CsvCycleImporter();

  test('reads an ISO date + flow export', () {
    final result = importer.parse(
      'date,flow\n'
      '2026-03-01,heavy\n'
      '2026-03-02,medium\n'
      '2026-03-03,light\n',
    );

    expect(result.logs.length, 3);
    expect(result.logs.first.date, DateTime(2026, 3, 1));
    expect(result.logs.first.flow, FlowIntensity.heavy);
    expect(result.logs.last.flow, FlowIntensity.light);
    expect(result.skippedRows, 0);
  });

  test('finds columns by Turkish headers too', () {
    final result = importer.parse('Tarih;Akış\n01.03.2026;yoğun\n');
    expect(result.logs.single.flow, FlowIntensity.heavy);
    expect(result.logs.single.date, DateTime(2026, 3, 1));
  });

  test('matches headers that merely contain a known word', () {
    final result =
        importer.parse('Period start date,Menstrual flow\n2026-03-01,light\n');
    expect(result.detectedDateHeader, 'Period start date');
    expect(result.detectedFlowHeader, 'Menstrual flow');
    expect(result.logs.single.flow, FlowIntensity.light);
  });

  test('rows with no bleeding are not imported and are not errors', () {
    final result = importer.parse(
      'date,flow\n2026-03-01,none\n2026-03-02,\n2026-03-03,medium\n',
    );
    expect(result.logs.length, 1);
    expect(result.skippedRows, 0);
  });

  test('unparseable dates are counted, not silently dropped', () {
    final result = importer.parse(
      'date,flow\n2026-03-01,medium\nnot a date,medium\n31/02/2026,medium\n',
    );
    expect(result.logs.length, 1);
    expect(result.skippedRows, 2);
  });

  test('handles quoted fields containing the delimiter', () {
    final result = importer.parse('date,note,flow\n2026-03-01,"a, b",heavy\n');
    expect(result.logs.single.flow, FlowIntensity.heavy);
  });

  test('a boolean-style period column becomes medium flow', () {
    final result = importer.parse('date,period\n2026-03-01,yes\n');
    expect(result.logs.single.flow, FlowIntensity.medium);
  });

  test('duplicate dates collapse to one entry', () {
    final result = importer.parse(
      'date,flow\n2026-03-01,light\n2026-03-01,heavy\n',
    );
    expect(result.logs.length, 1);
    expect(result.logs.single.flow, FlowIntensity.heavy);
  });

  test('unambiguous day-first dates are read correctly', () {
    final result = importer.parse('date,flow\n14/03/2026,medium\n');
    expect(result.logs.single.date, DateTime(2026, 3, 14));
  });

  test('year-first slashed dates are read correctly', () {
    final result = importer.parse('date,flow\n2026/03/14,medium\n');
    expect(result.logs.single.date, DateTime(2026, 3, 14));
  });

  test('results come back sorted regardless of file order', () {
    final result = importer.parse(
      'date,flow\n2026-03-05,medium\n2026-03-01,medium\n',
    );
    expect(result.logs.first.date, DateTime(2026, 3, 1));
  });

  test('an empty file is rejected outright', () {
    expect(
      () => importer.parse('   \n'),
      throwsA(isA<CsvImportException>()
          .having((e) => e.reason, 'reason', CsvImportFailure.empty)),
    );
  });

  test('a file without a date column is rejected outright', () {
    expect(
      () => importer.parse('mood,note\nhappy,hello\n'),
      throwsA(isA<CsvImportException>()
          .having((e) => e.reason, 'reason', CsvImportFailure.noDateColumn)),
    );
  });

  test('a date-only export still imports nothing rather than guessing', () {
    final result = importer.parse('date\n2026-03-01\n');
    expect(result.isEmpty, isTrue);
    expect(result.detectedFlowHeader, isNull);
  });

  group('exports from other languages', () {
    // The header vocabularies covered only English and Turkish, so a German
    // user exporting from a German tracker hit `noDateColumn` and the import
    // failed outright — with a localized error that gave no hint why. Every
    // language the app ships in has to be able to get its data in.
    final cases = <String, String>{
      'German': 'Datum,Blutung\n2026-03-01,stark\n',
      'Spanish': 'Fecha,Flujo\n2026-03-01,abundante\n',
      'French': 'Date,Saignement\n2026-03-01,abondant\n',
      'Indonesian': 'Tanggal,Aliran\n2026-03-01,banyak\n',
      'Italian': 'Giorno,Flusso\n2026-03-01,intenso\n',
      'Dutch': 'Datum,Bloeding\n2026-03-01,zwaar\n',
      'Polish': 'Data,Krwawienie\n2026-03-01,obfite\n',
      'Russian': 'Дата,Кровотечение\n2026-03-01,обильные\n',
      'Arabic': 'التاريخ,التدفق\n2026-03-01,غزير\n',
      'Japanese': '日付,経血量\n2026-03-01,多い\n',
    };

    cases.forEach((language, csv) {
      test('$language headers import instead of failing', () {
        final result = importer.parse(csv);
        expect(result.logs, hasLength(1), reason: '$language row was dropped');
        expect(result.logs.single.flow, FlowIntensity.heavy,
            reason: '$language flow value was not understood');
      });
    });
  });

  test('accented headers fold beyond the six Turkish characters', () {
    // Only ı ğ ü ş ö ç were folded, so Czech š (U+0161, caron) — a different
    // codepoint from Turkish ş (U+015F, cedilla) — never matched.
    for (final header in ['Datum', 'DATUM', 'Fecha', 'Début', 'Data']) {
      final result = importer.parse('$header\n2026-03-01\n');
      expect(result.detectedDateHeader, header,
          reason: '"$header" was not recognised as a date column');
    }
  });
}
