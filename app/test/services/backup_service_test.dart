import 'dart:typed_data';

import 'package:cryptography/cryptography.dart';
import 'package:cycle_app/models/day_log.dart';
import 'package:cycle_app/models/enums.dart';
import 'package:cycle_app/services/backup_service.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const service = BackupService();

  final sample = [
    DayLog(date: DateTime(2026, 1, 1), flow: FlowIntensity.medium),
    DayLog(
      date: DateTime(2026, 1, 2),
      flow: FlowIntensity.light,
      symptoms: const {Symptom.cramps},
      note: 'feeling okay',
    ),
  ];

  test('round-trips a history with the correct password', () async {
    final bytes = await service.createBackup(sample, 'correct horse battery');
    final restored = await service.restoreBackup(
      bytes,
      'correct horse battery',
    );

    expect(restored, hasLength(2));
    expect(restored[1].note, 'feeling okay');
    expect(restored[1].symptoms, {Symptom.cramps});
  });

  test(
    'the wrong password fails loudly rather than returning garbage',
    () async {
      final bytes = await service.createBackup(sample, 'right password');

      expect(
        () => service.restoreBackup(bytes, 'wrong password'),
        throwsA(isA<SecretBoxAuthenticationError>()),
      );
    },
  );

  test('two backups of the same data are not byte-identical', () async {
    final a = await service.createBackup(sample, 'same password');
    final b = await service.createBackup(sample, 'same password');

    expect(
      a,
      isNot(equals(b)),
      reason: 'a fresh salt and nonce must be used each time',
    );
  });

  test('rejects a file that is too short to contain a header', () async {
    final tooShort = Uint8List.fromList([1, 2]);

    expect(
      () => service.restoreBackup(tooShort, 'x'),
      throwsA(isA<FormatException>()),
    );
  });

  test('rejects a file whose header is not valid JSON', () async {
    // A 4-byte big-endian length prefix claiming 5 header bytes, followed by
    // 5 bytes that are not valid JSON.
    final bogus = Uint8List.fromList([0, 0, 0, 5, ...'notjs'.codeUnits]);

    expect(
      () => service.restoreBackup(bogus, 'x'),
      throwsA(isA<FormatException>()),
    );
  });

  test('an empty history still round-trips', () async {
    final bytes = await service.createBackup(const [], 'pw');
    final restored = await service.restoreBackup(bytes, 'pw');

    expect(restored, isEmpty);
  });
}
