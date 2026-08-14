import 'package:cycle_app/models/enums.dart';
import 'package:cycle_app/services/cycle_assistant.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const assistant = CycleAssistant();
  const ctx = AssistantContext(
    cycleDay: 12,
    phase: CyclePhase.follicular,
    meanCycleLength: 28.4,
    cyclesLogged: 3,
    predictionRangeLabel: 'May 12 – May 15',
  );

  test('answers a Turkish late-period question in Turkish, personalized', () {
    final answer = assistant.answer('reglim gecikti ne yapmalıyım', ctx, 'tr');
    expect(answer, contains('28.4'));
    expect(answer, contains('12'));
    expect(answer, contains('May 12 – May 15'));
    expect(answer.toLowerCase(), contains('stres'));
  });

  test('answers an English ovulation question in English', () {
    final answer = assistant.answer('when do I ovulate?', ctx, 'en');
    expect(answer, contains('14 days'));
    expect(answer, contains('May 12 – May 15'));
  });

  test('unsupported UI languages fall back to English content', () {
    final answer = assistant.answer('what helps with cramps', ctx, 'de');
    expect(answer.toLowerCase(), contains('heat'));
  });

  test('Turkish diacritics are normalized for matching', () {
    final answer = assistant.answer('DÖNGÜLERİM ÇOK DÜZENSİZ', ctx, 'tr');
    expect(answer, contains('21–35'));
  });

  test('never gives contraception guidance', () {
    final answer =
        assistant.answer('can I use this app for birth control', ctx, 'en');
    expect(answer, contains('NOT a method of contraception'));
  });

  test('missing prediction is stated honestly, not papered over', () {
    const emptyCtx = AssistantContext();
    final answer = assistant.answer('reglim gecikti', emptyCtx, 'tr');
    expect(answer, contains('yeterli veri yok'));
  });

  test('nonsense input gets the fallback with example questions', () {
    final answer = assistant.answer('asdf qwerty zzz', ctx, 'en');
    expect(answer, contains('You can ask things like'));
    expect(answer, contains('•'));
  });

  test('greets back instead of falling back on small talk', () {
    expect(assistant.answer('merhaba', ctx, 'tr'), contains('Merhaba'));
    expect(assistant.answer('hello', ctx, 'en'), contains('Hi'));
    expect(assistant.answer('kimsin sen', ctx, 'tr'), contains('Vera Asistan'));
  });

  test('follow-ups exclude the topic just answered', () {
    final followUps = assistant.followUps('tr', 'Reglim gecikti, normal mi?');
    expect(followUps, isNotEmpty);
    expect(followUps, isNot(contains('Reglim gecikti, normal mi?')));
  });

  test('suggestions come back in the requested language', () {
    expect(assistant.suggestions('tr').first, contains('Reglim'));
    expect(assistant.suggestions('en').first, contains('period'));
    expect(assistant.suggestions('fr'), equals(assistant.suggestions('en')));
  });
}
