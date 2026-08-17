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
}
