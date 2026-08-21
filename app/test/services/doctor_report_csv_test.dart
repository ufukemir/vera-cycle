import 'package:cycle_app/models/day_log.dart';
import 'package:cycle_app/models/enums.dart';
import 'package:cycle_app/services/doctor_report_csv.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const csv = DoctorReportCsv();

  test('the header row lists every column', () {
    final output = csv.build(const []);
    expect(
      output,
      'date,flow,symptoms,mood,sexual_activity,basal_temp_c,'
      'cervical_mucus,note',
    );
  });

  test('one plain row after the header', () {
    final logs = [
      DayLog(date: DateTime(2026, 4, 1), flow: FlowIntensity.medium),
    ];

    final rows = csv.build(logs).split('\r\n');

    expect(rows, hasLength(2));
    expect(rows[1], '2026-04-01,medium,,,,,,');
  });

  test('multiple symptoms are semicolon-joined', () {
    final logs = [
      DayLog(
        date: DateTime(2026, 4, 1),
        symptoms: const {Symptom.cramps, Symptom.headache},
      ),
    ];

    final row = csv.build(logs).split('\r\n')[1];

    expect(row, contains('cramps;headache'));
  });

  test('notes are excluded by default even when present', () {
    final logs = [DayLog(date: DateTime(2026, 4, 1), note: 'private thoughts')];

    final output = csv.build(logs);

    expect(output, isNot(contains('private thoughts')));
  });

  test('notes are included when explicitly requested', () {
    final logs = [DayLog(date: DateTime(2026, 4, 1), note: 'private thoughts')];

    final output = csv.build(logs, includeNotes: true);

    expect(output, contains('private thoughts'));
  });

  test('a note containing a comma is quoted per RFC 4180', () {
    final logs = [
      DayLog(date: DateTime(2026, 4, 1), note: 'cramps, then better'),
    ];

    final row = csv.build(logs, includeNotes: true).split('\r\n')[1];

    expect(row, endsWith('"cramps, then better"'));
  });

  test('a note containing a quote is escaped by doubling it', () {
    final logs = [DayLog(date: DateTime(2026, 4, 1), note: 'felt "off" today')];

    final row = csv.build(logs, includeNotes: true).split('\r\n')[1];

    expect(row, endsWith('"felt ""off"" today"'));
  });

  test('sexual activity renders as true/false, not 1/0', () {
    final logs = [DayLog(date: DateTime(2026, 4, 1), sexualActivity: true)];

    final row = csv.build(logs).split('\r\n')[1];

    expect(row, contains(',true,'));
  });
}
