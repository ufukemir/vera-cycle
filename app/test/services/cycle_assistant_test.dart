import 'package:cycle_app/models/enums.dart';
import 'package:cycle_app/services/cycle_assistant.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const assistant = CycleAssistant();
  const ctx = AssistantContext(
    cycleDay: 12,
    phase: CyclePhase.follicular,
    meanCycleLengthLabel: '28.4',
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

  test('nonsense input admits the gap instead of guessing', () {
    final answer = assistant.answer('asdf qwerty zzz', ctx, 'en');
    expect(answer, contains("isn't in my knowledge base"));
    expect(answer, contains('•'));
    // It must point somewhere useful rather than dead-ending.
    expect(answer, contains('what can I ask'));
  });

  test('casual small talk gets an answer, not the fallback', () {
    for (final greeting in ['naber', 'nasılsın', 'günaydın', 'iyi geceler']) {
      final answer = assistant.answer(greeting, ctx, 'tr');
      expect(answer, isNot(contains('bilgi tabanımda yok')),
          reason: 'small talk "$greeting" fell through to the fallback');
    }
    expect(assistant.answer('how are you', ctx, 'en'),
        isNot(contains("isn't in my knowledge base")));
  });

  test('"what else can I ask" lists the whole range, not three examples', () {
    final tr = assistant.answer('başka ne sorabilirim', ctx, 'tr');
    final en = assistant.answer('what else can i ask', ctx, 'en');

    // Every topic is offered, so the count comfortably exceeds the handful
    // the fallback shows.
    expect('•'.allMatches(tr).length, greaterThan(10));
    expect('•'.allMatches(en).length, greaterThan(10));
    expect(tr, isNot(contains('bilgi tabanımda yok')));
  });

  test('a typo still finds the topic', () {
    // "kramlar" — one missing letter from "kramplar".
    expect(assistant.answer('kramlar için ne yapmalıyım', ctx, 'tr'),
        isNot(contains('bilgi tabanımda yok')));
    expect(assistant.answer('what helps with crmaps', ctx, 'en'),
        isNot(contains("isn't in my knowledge base")));
  });

  test('asking whether it is an AI is answered honestly', () {
    final tr = assistant.answer('sen yapay zeka mısın', ctx, 'tr');
    expect(tr, contains('uydurmam'));
    final en = assistant.answer('are you ai', ctx, 'en');
    expect(en, contains('never send your questions to the internet'));
  });

  test('questions about using the app are answered, not deflected', () {
    final cases = {
      'günlük kaydı nasıl eklerim': 'Takvim',
      'verimi doktoruma nasıl gösteririm': 'Dışa aktar',
      'premium ne veriyor': 'ücretsiz',
      'hatırlatıcıları nasıl açarım': 'Hatırlatıcılar',
      'telefonumu değiştirsem verim ne olur': 'yedek',
      'uygulamayı nasıl kilitlerim': 'PIN',
    };
    cases.forEach((question, expected) {
      expect(assistant.answer(question, ctx, 'tr'), contains(expected),
          reason: 'failed on "$question"');
    });
  });

  test('health questions outside the old list now land somewhere', () {
    final questions = [
      'menopoza yaklaştığımı nasıl anlarım',
      'pcos olabilir miyim',
      'tampon mu ped mi kullanmalıyım',
      'regl öncesi başım ağrıyor',
      'oruç reglimi etkiler mi',
      'seyahat reglimi geciktirir mi',
      'akıntımda kaşıntı var',
    ];
    for (final question in questions) {
      expect(assistant.answer(question, ctx, 'tr'),
          isNot(contains('bilgi tabanımda yok')),
          reason: 'failed on "$question"');
    }
  });

  test('a PCOS question refuses to diagnose', () {
    final answer = assistant.answer('pcos olabilir miyim', ctx, 'tr');
    expect(answer, contains('uygulama cevap veremez'));
  });

  test('every suggested question the app offers is answerable', () {
    for (final lang in ['tr', 'en']) {
      for (final question in assistant.suggestions(lang)) {
        final answer = assistant.answer(question, ctx, lang);
        expect(
          answer,
          isNot(anyOf(
            contains('bilgi tabanımda yok'),
            contains("isn't in my knowledge base"),
          )),
          reason: 'the app suggests "$question" but cannot answer it',
        );
      }
    }
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

  group('regressions', () {
    const ovulationCtx = AssistantContext(
      cycleDay: 12,
      phase: CyclePhase.follicular,
      meanCycleLengthLabel: '28.4',
      cyclesLogged: 3,
      predictionRangeLabel: 'May 12 – May 15',
      ovulationRangeLabel: 'Apr 28 – May 1',
    );

    test('the ovulation answer gives the ovulation window, not the period one',
        () {
      // The answer used to splice the *period* prediction in after "based
      // on your estimated window", so someone asking when they ovulate read
      // dates roughly two weeks off as the answer to their question.
      for (final lang in ['en', 'tr']) {
        final answer = assistant.answer(
          lang == 'en' ? 'when do I ovulate?' : 'ovulasyonum ne zaman',
          ovulationCtx,
          lang,
        );
        expect(answer, contains('Apr 28 – May 1'),
            reason: 'the ovulation window must be the one attributed to '
                'ovulation ($lang)');
      }
    });

    test('an empty context never produces a broken sentence', () {
      // "Your average cycle is not known yet days and you are on day not
      // logged yet." — the fallbacks were dropped into fixed sentences.
      const empty = AssistantContext();
      for (final entry in {
        'en': ['not known yet days', 'on day not logged yet'],
        'tr': ['bilinmiyor gün', 'henüz kayıt yok. günündesin'],
      }.entries) {
        for (final question in ['reglim gecikti', 'my period is late']) {
          final answer = assistant.answer(question, empty, entry.key);
          for (final broken in entry.value) {
            expect(answer, isNot(contains(broken)),
                reason: 'ungrammatical fallback leaked into ${entry.key}');
          }
        }
      }
    });

    test('a health question containing a greeting substring is not small talk',
        () {
      // 'hey' inside "are they normal?", 'sup' inside "supplements" and
      // "şüpheliyim": bare `contains` answered real questions with "Hi! 👋".
      final cases = {
        'are they normal?': 'en',
        'why are they irregular': 'en',
        'should I take supplements?': 'en',
        'hamile miyim şüpheliyim': 'tr',
      };
      for (final entry in cases.entries) {
        final answer = assistant.answer(entry.key, ctx, entry.value);
        expect(answer, isNot(contains('👋')),
            reason: '"${entry.key}" was answered with a greeting');
        expect(answer, isNot(contains('Doing well, thanks')),
            reason: '"${entry.key}" was answered with small talk');
      }
    });

    test('a thank-you attached to a real question answers the question', () {
      final answer =
          assistant.answer('thanks, is heavy bleeding normal?', ctx, 'en');
      expect(answer, isNot(contains("You're welcome")));
    });

    test('a non-Latin script produces tokens instead of nothing', () {
      // The tokenizer split on [^a-z0-9]+, which matches ALL of an Arabic,
      // Cyrillic, Greek, Thai, Devanagari or CJK question. The token list
      // came back empty, every topic scored zero, and the user was told
      // their question "isn't in my knowledge base" — every single time.
      // Arabic ships today, so this was live.
      //
      // The assistant still has no Arabic *content*, so the answer is
      // English. That is the documented fallback; silently claiming
      // ignorance is not.
      const questions = {
        'ar': 'ما هي الدورة الشهرية؟',
        'ru': 'Почему задержка месячных?',
        'el': 'Γιατί άργησε η περίοδός μου;',
        'th': 'ทำไมประจำเดือนมาช้า',
        'hi': 'मेरा पीरियड देर से क्यों है',
        'ja': '生理が遅れています',
      };

      for (final entry in questions.entries) {
        final answer = assistant.answer(entry.value, ctx, entry.key);
        expect(answer, isNotEmpty);
        // Not asserting a specific topic — the keywords are still tr/en, so
        // matching depends on content that does not exist yet. What must
        // hold is that the pipeline runs at all.
        expect(() => assistant.answer(entry.value, ctx, entry.key),
            returnsNormally);
      }
    });

    test('accented Latin words fold to whole tokens, not fragments', () {
      // Only six Turkish characters were folded, and the splitter treated
      // every other accent as a word boundary: "Verspätung" tokenized as
      // ["verspa","tung"] and "período" as ["per","odo"]. Czech š (U+0161)
      // is a different codepoint from Turkish ş (U+015F) and was never in
      // the list at all.
      expect(assistant.debugTokens('Verspätung'), ['verspatung']);
      expect(assistant.debugTokens('período'), ['periodo']);
      expect(assistant.debugTokens('spóźnienie'), ['spoznienie']);
      expect(assistant.debugTokens('křeče'), ['krece']);
      expect(assistant.debugTokens('Größe'), ['grosse']);
      expect(assistant.debugTokens('kinh nguyệt'), ['kinh', 'nguyet']);
      // The Turkish behaviour that already worked must not regress.
      expect(assistant.debugTokens('DÖNGÜLERİM ÇOK DÜZENSİZ'),
          ['dongulerim', 'cok', 'duzensiz']);
    });

    test('non-Latin scripts tokenize instead of vanishing', () {
      // `[^a-z0-9]+` matched the ENTIRE input for these scripts, so the
      // token list came back empty and every topic scored zero. The user
      // was told their question "isn't in my knowledge base" — for every
      // question. Arabic ships today, so this was live.
      expect(assistant.debugTokens('ما هي الدورة الشهرية؟'), isNotEmpty);
      expect(assistant.debugTokens('Почему задержка месячных?'),
          ['почему', 'задержка', 'месячных']);
      expect(assistant.debugTokens('ประจำเดือนมาช้า'), isNotEmpty);
      expect(assistant.debugTokens('मेरा पीरियड देर से'), hasLength(4));
      expect(assistant.debugTokens('生理が遅れています'), isNotEmpty);
      // Non-Latin scripts must pass through folding untouched.
      expect(assistant.debugTokens('Цикл').single, 'цикл');
    });

    test('the languages with real assistant content are declared', () {
      // Guards the gap rather than hiding it: any UI language outside this
      // set gets English answers, which is a product decision that should
      // be visible, not a silent surprise.
      expect(CycleAssistant.assistantContentLanguages, {'en', 'tr'});
    });

    test('"help me with X" answers X rather than listing topics', () {
      final answer = assistant.answer('help me with cramps', ctx, 'en');
      expect(answer.toLowerCase(), contains('heat'));

      // Bare "help me" is still a request for the topic list.
      expect(assistant.answer('help me', ctx, 'en'), contains('•'));
    });
  });
}
