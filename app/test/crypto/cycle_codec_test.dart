import 'package:cryptography/cryptography.dart';
import 'package:cycle_app/models/day_log.dart';
import 'package:cycle_app/models/enums.dart';
import 'package:cycle_app/services/crypto/cycle_codec.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const codec = CycleCodec();

  final sample = [
    DayLog(
      date: DateTime(2026, 3, 1),
      flow: FlowIntensity.medium,
      symptoms: const {Symptom.cramps, Symptom.fatigue},
      mood: Mood.calm,
      note: 'gayet iyi hissediyorum',
    ),
    DayLog(date: DateTime(2026, 3, 2), flow: FlowIntensity.light),
  ];

  test('round-trips a list of logs through encrypt and decrypt', () async {
    final key = await codec.newKey();

    final bytes = await codec.encode(sample, key);
    final decoded = await codec.decode(bytes, key);

    expect(decoded, hasLength(2));
    expect(decoded[0].date, sample[0].date);
    expect(decoded[0].symptoms, sample[0].symptoms);
    expect(decoded[0].note, sample[0].note);
    expect(decoded[1].flow, FlowIntensity.light);
  });

  test('round-trips an empty list', () async {
    final key = await codec.newKey();

    final bytes = await codec.encode(const [], key);
    final decoded = await codec.decode(bytes, key);

    expect(decoded, isEmpty);
  });

  test('the same plaintext encrypts differently each time', () async {
    final key = await codec.newKey();

    final a = await codec.encode(sample, key);
    final b = await codec.encode(sample, key);

    expect(
      a,
      isNot(equals(b)),
      reason:
          'a fresh random nonce must be used on every encrypt call, '
          'or an attacker could detect unchanged data across two backups',
    );
  });

  test('decrypting with the wrong key fails loudly', () async {
    final key = await codec.newKey();
    final wrongKey = await codec.newKey();

    final bytes = await codec.encode(sample, key);

    expect(
      () => codec.decode(bytes, wrongKey),
      throwsA(isA<SecretBoxAuthenticationError>()),
    );
  });

  test('a tampered ciphertext fails authentication rather than decoding '
      'garbage', () async {
    final key = await codec.newKey();
    final bytes = await codec.encode(sample, key);

    final tampered = List<int>.from(bytes);
    tampered[tampered.length - 1] ^= 0xFF;

    expect(
      () => codec.decode(tampered, key),
      throwsA(isA<SecretBoxAuthenticationError>()),
    );
  });
}
