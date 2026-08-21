import 'package:flutter/foundation.dart';

import '../models/enums.dart';

/// A snapshot of the user's own logged state, used to personalize answers.
/// Built by the caller from [CycleController]; the assistant itself never
/// touches storage.
class AssistantContext {
  const AssistantContext({
    this.cycleDay,
    this.phase = CyclePhase.unknown,
    this.meanCycleLengthLabel,
    this.cyclesLogged = 0,
    this.predictionRangeLabel,
    this.ovulationRangeLabel,
  });

  final int? cycleDay;
  final CyclePhase phase;

  /// Already locale-formatted ("28,4" in tr/de/fr, "٢٨٫٤" in ar).
  ///
  /// The assistant used to receive a raw double and render it with
  /// `toStringAsFixed`, which always emits a period — so the Turkish answer
  /// was a Turkish sentence built around an English decimal point.
  final String? meanCycleLengthLabel;
  final int cyclesLogged;

  /// Already-localized "12 – 15 May" style range for the next PERIOD, or
  /// null when no prediction exists yet.
  final String? predictionRangeLabel;

  /// Already-localized range for the estimated OVULATION window — roughly
  /// the period window shifted back by a luteal phase. Kept separate from
  /// [predictionRangeLabel] deliberately: the two are ~14 days apart, and
  /// showing the period window under an ovulation question told the user a
  /// wrong date with full confidence.
  final String? ovulationRangeLabel;
}

/// On-device Q&A over a curated, clinician-reviewable knowledge base —
/// backlog item 1's "gerçekten cihaz-üstü asistan". Deliberately NOT a
/// cloud LLM: even though the app now carries INTERNET for ads, sending
/// health questions to a third-party model would break the promise that
/// cycle data never leaves the device. Retrieval is keyword-scored; answers are hand-written (so they
/// are *correct*, hedged, non-diagnostic — CLAUDE.md principle 7) and get
/// personalized with the user's own numbers where relevant.
///
/// Content languages: tr + en are first-class; other UI languages fall
/// back to English answers (noted in CLAUDE.md's translation-quality
/// policy).
class CycleAssistant {
  const CycleAssistant();

  static const _fallbackLang = 'en';

  String _lang(String code) => (code == 'tr') ? 'tr' : _fallbackLang;

  /// Suggested tap-to-ask questions for the empty state.
  ///
  /// The hand-picked `suggested` topics lead (a mix of health and
  /// app-mechanics questions, so the opening screen shows both halves of
  /// what this assistant covers), then the list is topped up from the rest
  /// in order. Raised from 9 to 14 alongside the topic count nearly
  /// doubling — a fixed nine chips under a now much larger knowledge base
  /// would have shown a shrinking fraction of it on first launch.
  List<String> suggestions(String languageCode, {int count = 14}) {
    final lang = _lang(languageCode);
    final out = <String>[
      for (final t in _topics)
        if (t.suggested) t.sampleQuestion[lang]!,
    ];
    for (final t in _topics) {
      if (out.length >= count) break;
      final sample = t.sampleQuestion[lang]!;
      if (!out.contains(sample)) out.add(sample);
    }
    return out.take(count).toList();
  }

  /// Conversational niceties get a friendly reply instead of the topic
  /// fallback — a chatbot that answers "merhaba" with "I didn't catch
  /// that" feels broken.
  String? _smallTalk(String normalized, String lang) {
    // Whole-word matching, not bare `contains`. As substrings, 'hey' fired
    // inside "are they normal?" and 'sup' inside "should I take
    // supplements?" and "hamile miyim şüpheliyim" — real health questions
    // answered with "Hi! 👋". Every phrase below is matched as a complete
    // word or word sequence.
    final padded = ' ${_tokenize(normalized).join(' ')} ';
    bool hasAny(List<String> phrases) =>
        phrases.any((p) => padded.contains(' $p '));
    final short = normalized.length < 30;

    if (short &&
        hasAny(['merhaba', 'selam', 'selamlar', 'hello', 'hi', 'hey'])) {
      return lang == 'tr'
          ? 'Merhaba. Regl, döngü veya Vera hakkında ne merak ediyorsun?'
          : 'Hello. What would you like to know about periods, cycles, or Vera?';
    }
    // "naber" and friends: these were falling through to "I didn't catch
    // that", which reads as broken for the most casual thing a user can
    // type. Answer briefly, then steer back to what this assistant is for.
    if (short &&
        hasAny([
          'naber',
          'nabersin',
          'nasilsin',
          'ne haber',
          'nasil gidiyor',
          'iyi misin',
          'how are you',
          'whats up',
          'what s up',
          'sup',
        ])) {
      return lang == 'tr'
          ? 'Vera bir uygulama, o yüzden sorulacak bir hâli yok. Ama döngün, semptomların veya Vera\'nın nasıl çalıştığı hakkında ne istersen sorabilirsin.'
          : "Vera is an app, so there's no how-are-you to report. Ask anything about your cycle, your symptoms, or how Vera works, though.";
    }
    if (short && hasAny(['gunaydin', 'good morning'])) {
      return lang == 'tr'
          ? 'Günaydın. Bugün nasıl hissediyorsun? Kaydetmek istediğin bir şey varsa gün kaydına ekleyebilirsin.'
          : 'Good morning. How are you feeling today? Anything you want to note goes in your day log.';
    }
    if (short && hasAny(['iyi geceler', 'good night'])) {
      return lang == 'tr'
          ? 'İyi geceler. Uyku düzeni döngüyü de etkiler; dilersen uykunu da kaydedebilirsin.'
          : 'Good night. Sleep affects your cycle too — you can log it if you like.';
    }
    // Whole words, so "thanks, is heavy bleeding normal?" reaches the
    // topic matcher instead of being answered with "You're welcome!".
    if (short &&
        hasAny([
          'tesekkurler',
          'tesekkur ederim',
          'tesekkurr',
          'sagol',
          'sag ol',
          'sagolun',
          'thanks',
          'thank you',
          'thx',
        ])) {
      return lang == 'tr'
          ? 'Rica ederim. Başka bir sorun olduğunda yine yazabilirsin.'
          : "You're welcome. Ask again whenever something else comes up.";
    }
    if (short &&
        hasAny(['gorusuruz', 'hoscakal', 'bye', 'goodbye', 'see you'])) {
      return lang == 'tr'
          ? 'Görüşürüz. Bu sekme ihtiyacın olduğunda yerinde duruyor.'
          : 'See you. This tab stays here whenever you need it.';
    }
    if (hasAny(['kimsin', 'nesin sen', 'who are you', 'what are you'])) {
      return lang == 'tr'
          ? 'Vera Asistan, tamamen bu telefonda çalışan bir yardımcıdır. Cevaplar özenle yazılmış bir bilgi tabanından gelir ve senin kendi kayıtlarınla kişiselleşir; sorduklarının hiçbiri cihazdan çıkmaz.'
          : 'The Vera Assistant is a helper that runs entirely on this phone. Answers come from a hand-written knowledge base and are personalized with your own logs; your questions never leave the device.';
    }
    if (hasAny([
      'yapay zeka misin',
      'robot musun',
      'chatgpt',
      'are you ai',
      'are you a bot',
      'are you a robot',
    ])) {
      return lang == 'tr'
          ? 'Bulut tabanlı bir yapay zeka değil. Soruların internete gönderilmez. Sorduğun şey, elle yazılmış bir bilgi tabanıyla eşleştirilir ve cevap senin kendi kayıtlarınla kişiselleştirilir. Bu yüzden bazı sorular kapsam dışında kalabilir — ama cevap uydurulmaz ve verin kimseye verilmez.'
          : 'Not a cloud AI. Your questions are never sent to the internet. What you ask is matched against a hand-written knowledge base, and the answer is personalized with your own logs. Some questions therefore fall outside what it covers — but nothing is invented, and your data goes to no one.';
    }
    return null;
  }

  /// "What else can I ask?" — this was hitting the generic fallback, which
  /// answered a question about the assistant's range with three examples
  /// and no sense of the range. Answer it with the actual list.
  String? _capabilities(String normalized, String lang) {
    // Unambiguous — these can only be a question about the assistant's
    // range, so they match anywhere in the message.
    const asks = [
      'baska ne sor',
      'neler sorabil',
      'ne sorabilirim',
      'ne sorabiliyorum',
      'nelerden anliyorsun',
      'ne biliyorsun',
      'neler biliyorsun',
      'ne yapabilirsin',
      'what else can i ask',
      'what can i ask',
      'what do you know',
      'what can you do',
    ];
    // Generic pleas for help. On their own they mean "what can you do?",
    // but inside "help me with cramps" they are just filler — answering
    // those with a topic list instead of the cramps answer is a
    // regression, so they only count when they are the whole message.
    const asksAlone = ['yardim et', 'yardim', 'help me', 'help'];

    final stripped = normalized.replaceAll(RegExp(r'[^a-z0-9 ]'), ' ').trim();
    final collapsed = stripped.replaceAll(RegExp(r'\s+'), ' ');

    if (!asks.any(normalized.contains) && !asksAlone.contains(collapsed)) {
      return null;
    }

    final lines = _topics.map((t) => '• ${t.sampleQuestion[lang]!}').join('\n');
    return lang == 'tr'
        ? 'Şunların hepsini sorabilirsin — kendi cümlelerinle sorman da yeterli:\n$lines'
        : 'You can ask about any of these — your own wording is fine:\n$lines';
  }

  /// Follow-up questions to offer after an answer — the next-tap
  /// suggestions a chat UI shows under the reply.
  ///
  /// [askedQuestions] is the *whole* conversation so far (every message the
  /// user has sent, current one included), not just the one that was just
  /// answered. Checking only the last question let earlier ones resurface a
  /// couple of turns later — someone who'd already asked and read the
  /// answer to "Ovülasyonum ne zaman?" saw it offered again as if it were
  /// new, which reads as the assistant not remembering its own reply.
  List<String> followUps(
    String languageCode,
    List<String> askedQuestions, {
    int count = 3,
  }) {
    final lang = _lang(languageCode);
    final askedNormalized = askedQuestions.map(_normalize).toSet();
    final askedTokens = askedQuestions
        .expand((q) => _tokenize(_normalize(q)))
        .toSet();
    final out = <String>[];
    for (final topic in _topics) {
      final sample = topic.sampleQuestion[lang]!;
      if (askedNormalized.contains(_normalize(sample))) continue;
      if (topic.keywords.any(
        (k) => !k.contains(' ') && askedTokens.any((t) => t.startsWith(k)),
      )) {
        continue; // skip topics close to anything already asked
      }
      out.add(sample);
      if (out.length == count) break;
    }
    return out;
  }

  String answer(String question, AssistantContext ctx, String languageCode) {
    final lang = _lang(languageCode);
    final normalized = _normalize(question);
    if (normalized.trim().isEmpty) return _fallback(normalized, lang);

    final smallTalk = _smallTalk(normalized, lang);
    if (smallTalk != null) return smallTalk;

    final capabilities = _capabilities(normalized, lang);
    if (capabilities != null) return capabilities;

    final best = _bestTopic(normalized, lang);
    if (best == null) return _fallback(normalized, lang);
    return _personalize(best.answer[lang]!, ctx, lang);
  }

  /// Scores every topic and returns the winner, or `null` if nothing came
  /// close enough to be worth answering with.
  _Topic? _bestTopic(String normalized, String lang) {
    // Single-word keywords match as token *prefixes* ("gecik" → "gecikti",
    // "pregnan" → "pregnancy") — never as bare substrings, which once made
    // "late" match inside "ovulate". Multi-word keywords use plain contains.
    final tokens = _tokenize(normalized);

    _Topic? best;
    var bestScore = 0;
    for (final topic in _topics) {
      var score = 0;
      for (final keyword in topic.keywords) {
        final hit = keyword.contains(' ')
            ? normalized.contains(keyword)
            : tokens.any((t) => t.startsWith(keyword));
        if (hit) {
          score += keyword.length >= 6 ? 2 : 1;
          continue;
        }
        // Typo tolerance, single-word keywords only, and only for words
        // long enough that one edit can't turn them into a different word.
        if (!keyword.contains(' ') &&
            keyword.length >= 5 &&
            tokens.any((t) => _nearlyStartsWith(t, keyword))) {
          score += 1;
        }
      }
      // Words shared with the topic's own sample question, so phrasing the
      // question the way the app itself phrases it always lands.
      final sampleTokens = _tokenize(
        _normalize(topic.sampleQuestion[lang]!),
      ).where((t) => t.length >= 5).toSet();
      score += tokens.where(sampleTokens.contains).length;

      if (score > bestScore) {
        bestScore = score;
        best = topic;
      }
    }
    return best;
  }

  /// Whether [token] starts with something within one typo of [keyword].
  ///
  /// Comparing the whole token would be wrong: keywords are prefixes
  /// ("kramp" is meant to match "kramplar"), so a suffix the keyword never
  /// covers would count as a pile of edits. Only the leading window of the
  /// token is compared, at the three lengths a single edit can produce.
  static bool _nearlyStartsWith(String token, String keyword) {
    if (token.length < 4) return false;
    for (final length in [
      keyword.length - 1,
      keyword.length,
      keyword.length + 1,
    ]) {
      if (length < 4 || length > token.length) continue;
      if (_withinOneEdit(token.substring(0, length), keyword)) return true;
    }
    return false;
  }

  /// Damerau-Levenshtein distance ≤ 1, answered without the full matrix:
  /// one substitution, one insertion/deletion, or one adjacent swap.
  static bool _withinOneEdit(String a, String b) {
    if (a == b) return true;
    if ((a.length - b.length).abs() > 1) return false;

    if (a.length == b.length) {
      final diffs = <int>[];
      for (var i = 0; i < a.length; i++) {
        if (a[i] != b[i]) {
          diffs.add(i);
          if (diffs.length > 2) return false;
        }
      }
      if (diffs.length <= 1) return true;
      // Two differences are only forgivable as a swapped pair — "crmap"
      // for "cramp" is one slip of the fingers, not two errors.
      final [first, second] = diffs;
      return second == first + 1 &&
          a[first] == b[second] &&
          a[second] == b[first];
    }

    final shorter = a.length < b.length ? a : b;
    final longer = a.length < b.length ? b : a;
    var i = 0;
    var j = 0;
    var skipped = false;
    while (i < shorter.length && j < longer.length) {
      if (shorter[i] == longer[j]) {
        i++;
        j++;
        continue;
      }
      if (skipped) return false;
      skipped = true;
      j++;
    }
    return true;
  }

  /// Said when nothing matched. Names the limit plainly rather than
  /// implying the user asked badly, and offers a wider set of starting
  /// points than the three suggested ones — the old version answered every
  /// unmatched question with the same three lines, which made the assistant
  /// look like it only knew three things.
  String _fallback(String normalized, String lang) {
    final examples = _topics
        .where((t) => t.suggested)
        .take(6)
        .map((t) => '• ${t.sampleQuestion[lang]!}')
        .join('\n');
    return lang == 'tr'
        ? 'Bunun cevabı bilgi tabanımda yok — uydurmaktansa bilmediğimi söylerim. '
              'Tıbbi bir konuysa bir sağlık profesyoneline sormak en doğrusu. '
              'Bana şunları sorabilirsin:\n$examples\n\n'
              'Neleri bildiğimin tam listesi için "neler sorabilirim" yazabilirsin.'
        : "That one isn't in my knowledge base — I'd rather say so than invent an answer. "
              'If it is a medical question, a clinician is the right place to ask. '
              'Here is what I can help with:\n$examples\n\n'
              'Type "what can I ask" for the full list.';
  }

  /// Substitutes the user's own numbers into an answer template.
  ///
  /// Every placeholder carries its own unit and, where the surrounding
  /// sentence would otherwise break, its own clause. An earlier version
  /// substituted bare fallbacks into fixed sentences and produced
  /// "Your average cycle is not known yet days" for every new user — the
  /// unknown case has to read as a sentence too, not just fill a slot.
  String _personalize(String template, AssistantContext ctx, String lang) {
    final tr = lang == 'tr';
    var out = template;

    // "28.4 gün" / "28.4 days", or a phrase that stands alone.
    out = out.replaceAll(
      '{meanLength}',
      ctx.meanCycleLengthLabel != null
          ? (tr
                ? '${ctx.meanCycleLengthLabel} gün'
                : '${ctx.meanCycleLengthLabel} days')
          : (tr ? 'henüz bilinmiyor' : 'not known yet'),
    );

    // A full clause: the day number alone cannot be dropped into
    // "you are on day ___" when it is unknown.
    out = out.replaceAll(
      '{cycleDayClause}',
      ctx.cycleDay != null
          ? (tr
                ? 'şu an döngünün ${ctx.cycleDay}. günündesin'
                : 'you are on cycle day ${ctx.cycleDay}')
          : (tr
                ? 'bu döngü için henüz kayıt girmemişsin'
                : "you haven't logged this cycle yet"),
    );

    out = out.replaceAll('{cyclesLogged}', ctx.cyclesLogged.toString());

    out = out.replaceAll(
      '{prediction}',
      ctx.predictionRangeLabel ??
          (tr
              ? 'henüz tahmin için yeterli veri yok (en az 2 tam döngü gerekir)'
              : 'there is not enough data for a prediction yet (at least 2 full cycles needed)'),
    );

    // The ovulation window is NOT the period window — see
    // [AssistantContext.ovulationRangeLabel].
    out = out.replaceAll(
      '{ovulation}',
      ctx.ovulationRangeLabel ??
          (tr
              ? 'henüz tahmin için yeterli veri yok (en az 2 tam döngü gerekir)'
              : 'there is not enough data for an estimate yet (at least 2 full cycles needed)'),
    );

    return out;
  }

  /// Latin diacritic folding, so "Verspätung", "período" and "spóźnienie"
  /// reduce to the same shape their keywords are written in.
  ///
  /// This used to strip exactly six Turkish characters. Everything else
  /// survived and then hit an ASCII-only tokenizer, which shattered words
  /// at every accent: "Verspätung" became ["verspa", "tung"], "período"
  /// became ["per", "odo"]. Turkish `ş` (U+015F, cedilla) was folded while
  /// Czech `š` (U+0161, caron) was not — they are different codepoints, and
  /// only one was listed.
  ///
  /// Non-Latin scripts are deliberately left untouched: folding Arabic or
  /// Cyrillic would be wrong, and [_tokenize] no longer needs it.
  static const _fold = {
    'à': 'a',
    'á': 'a',
    'â': 'a',
    'ã': 'a',
    'ä': 'a',
    'å': 'a',
    'ā': 'a',
    'ă': 'a',
    'ą': 'a',
    'ç': 'c',
    'ć': 'c',
    'č': 'c',
    'ď': 'd',
    'đ': 'd',
    'è': 'e',
    'é': 'e',
    'ê': 'e',
    'ë': 'e',
    'ē': 'e',
    'ė': 'e',
    'ę': 'e',
    'ě': 'e',
    'ğ': 'g',
    'ģ': 'g',
    'ì': 'i',
    'í': 'i',
    'î': 'i',
    'ï': 'i',
    'ī': 'i',
    'į': 'i',
    'ı': 'i',
    'ł': 'l',
    'ļ': 'l',
    'ñ': 'n',
    'ń': 'n',
    'ň': 'n',
    'ņ': 'n',
    'ò': 'o',
    'ó': 'o',
    'ô': 'o',
    'õ': 'o',
    'ö': 'o',
    'ø': 'o',
    'ō': 'o',
    'ő': 'o',
    'ř': 'r',
    'ś': 's',
    'š': 's',
    'ş': 's',
    'ș': 's',
    'ť': 't',
    'ţ': 't',
    'ț': 't',
    'ù': 'u',
    'ú': 'u',
    'û': 'u',
    'ü': 'u',
    'ū': 'u',
    'ů': 'u',
    'ű': 'u',
    'ų': 'u',
    'ý': 'y',
    'ÿ': 'y',
    'ź': 'z',
    'ż': 'z',
    'ž': 'z',
    'æ': 'ae',
    'œ': 'oe',
    'ß': 'ss',
    'þ': 'th',
    'ð': 'd',
  };

  String _normalize(String s) {
    final lower = s.toLowerCase();
    final out = StringBuffer();
    // Rune-wise rather than grapheme-wise: every folded character is a
    // single codepoint, and runes avoid a dependency on `characters`.
    for (final rune in lower.runes) {
      final ranged = _foldVietnamese(rune);
      if (ranged != null) {
        out.write(ranged);
        continue;
      }
      final ch = String.fromCharCode(rune);
      out.write(_fold[ch] ?? ch);
    }
    return out.toString();
  }

  /// Folds the Latin Extended Additional block (U+1EA0–U+1EF9).
  ///
  /// Vietnamese stacks a tone mark on an already-accented vowel, producing
  /// ~90 precomposed codepoints. Listing them individually would be noise;
  /// the block is laid out in contiguous runs per base vowel, so a range
  /// check is both shorter and less error-prone. Tone is dropped on
  /// purpose: people routinely type Vietnamese without diacritics, and the
  /// keyword side is folded identically.
  static String? _foldVietnamese(int rune) {
    if (rune < 0x1EA0 || rune > 0x1EF9) return null;
    if (rune <= 0x1EB7) return 'a';
    if (rune <= 0x1EC7) return 'e';
    if (rune <= 0x1ECB) return 'i';
    if (rune <= 0x1EE3) return 'o';
    if (rune <= 0x1EF1) return 'u';
    return 'y';
  }

  /// Splits on anything that is not a letter or a digit, in ANY script.
  ///
  /// The old pattern was `[^a-z0-9]+`. For Arabic, Cyrillic, Greek, Thai,
  /// Devanagari, Hebrew and CJK that matches the entire input, so the token
  /// list came back empty, every topic scored zero, and the assistant told
  /// the user their question "isn't in my knowledge base" — for every
  /// question. Arabic ships today, so this was live.
  ///
  /// Note this makes matching *possible* for those scripts; it does not by
  /// itself make it *work*, because the keyword lists are still only tr/en.
  /// See `assistantContentLanguages`.
  /// `\p{M}` (combining marks) matters as much as `\p{L}` here: Devanagari,
  /// Bengali, Tamil, Telugu, Thai and Arabic write vowels as marks, so
  /// omitting them splits every word at its own vowels — "मेरा" came apart
  /// into ['म','र'].
  static final _tokenBoundary = RegExp(r'[^\p{L}\p{N}\p{M}]+', unicode: true);

  List<String> _tokenize(String normalized) =>
      normalized.split(_tokenBoundary).where((t) => t.isNotEmpty).toList();

  /// The normalize + tokenize pipeline, exposed for tests.
  ///
  /// Worth exposing because the failure it guards is invisible from the
  /// outside: a shattered or empty token list still produces a polite
  /// answer, just always the wrong one.
  @visibleForTesting
  List<String> debugTokens(String input) => _tokenize(_normalize(input));

  /// Languages the curated knowledge base actually has answers for.
  ///
  /// Everything else falls back to English content. Exposed so a test can
  /// assert that no UI language is offered while silently getting another
  /// language's assistant.
  static const assistantContentLanguages = {'en', 'tr'};
}

class _Topic {
  const _Topic({
    required this.keywords,
    required this.sampleQuestion,
    required this.answer,
    this.suggested = false,
  });

  /// Matched against normalized input — write keywords already normalized
  /// (no Turkish diacritics), both languages mixed in one list.
  final List<String> keywords;
  final Map<String, String> sampleQuestion;
  final Map<String, String> answer;
  final bool suggested;
}

const _topics = <_Topic>[
  _Topic(
    suggested: true,
    keywords: ['gecik', 'late', 'delay', 'gelmedi', 'missed', 'atladi'],
    sampleQuestion: {
      'tr': 'Reglim gecikti, normal mi?',
      'en': 'My period is late — is that normal?',
    },
    answer: {
      'tr':
          'Ara sıra gecikme çok yaygındır: stres, seyahat, hastalık, uyku düzeni ve kilo değişimi ovülasyonu kaydırabilir — regl de onunla birlikte kayar. Ortalama döngün {meanLength} ve {cycleDayClause}. Tahmini penceren: {prediction}. Gecikme birkaç haftayı bulur, tekrarlar ya da seni endişelendirirse bir sağlık profesyoneline danışmak iyi bir fikirdir.',
      'en':
          'An occasional late period is very common: stress, travel, illness, sleep changes, and weight shifts can move ovulation — and your period moves with it. Your average cycle is {meanLength} and {cycleDayClause}. Your estimated window: {prediction}. If a delay stretches to weeks, keeps repeating, or worries you, checking in with a clinician is a good idea.',
    },
  ),
  _Topic(
    suggested: true,
    keywords: ['kramp', 'cramp', 'agri', 'pain', 'sanci'],
    sampleQuestion: {
      'tr': 'Kramplara ne iyi gelir?',
      'en': 'What helps with cramps?',
    },
    answer: {
      'tr':
          'Alt karna sıcak uygulama (sıcak su torbası), hafif hareket, bol su ve gerekirse eczacına danışacağın ağrı kesiciler çoğu kişide işe yarar. Kramplar günlük hayatını aksatacak kadar şiddetliyse veya giderek kötüleşiyorsa bu "katlanılması gereken" bir şey değildir — bir hekime anlatmaya değer.',
      'en':
          'Heat on the lower belly (a warm water bottle), light movement, staying hydrated, and pharmacist-advised pain relief work for most people. If cramps are severe enough to disrupt your day or keep getting worse, that is not something you just have to endure — it is worth describing to a clinician.',
    },
  ),
  _Topic(
    suggested: true,
    keywords: ['ovulasyon', 'ovulat', 'yumurtlama', 'dogurgan', 'fertile'],
    sampleQuestion: {'tr': 'Ovülasyonum ne zaman?', 'en': 'When do I ovulate?'},
    answer: {
      'tr':
          'Ovülasyon genelde bir sonraki reglden yaklaşık 14 gün önce olur — döngü başından itibaren değil, sondan geriye sayılır. {cycleDayClause}. Regl tahminin {prediction} olduğuna göre ovülasyon penceren kabaca {ovulation} aralığına denk gelir. Bunlar tahmindir, kesin gün vermek dürüst olmaz — vücut belirtileri (servikal mukus, bazal sıcaklık) tabloyu netleştirebilir.',
      'en':
          'Ovulation typically happens about 14 days *before* your next period — counted back from the end, not forward from the start. {cycleDayClause}. Since your period is estimated for {prediction}, your ovulation window works out to roughly {ovulation}. These are estimates — naming an exact day would be false precision. Body signs (cervical mucus, basal temperature) can sharpen the picture.',
    },
  ),
  _Topic(
    keywords: ['hamile', 'gebe', 'pregnan', 'conceiv'],
    sampleQuestion: {
      'tr': 'Gebe kalma şansım ne zaman en yüksek?',
      'en': 'When are my chances of pregnancy highest?',
    },
    answer: {
      'tr':
          'Gebelik olasılığı, ovülasyondan önceki ~5 gün ve ovülasyon gününde en yüksektir — spermler birkaç gün canlı kalabildiği için pencere geniştir. Takvimdeki tahmini doğurgan pencere bunu gösterir; ama unutma, bu bir tahmindir ve Vera bir gebelikten korunma yöntemi değildir.',
      'en':
          'Pregnancy is most likely in the ~5 days before ovulation and on ovulation day itself — sperm can survive several days, which is why the window is wide. The estimated fertile window on your calendar shows this; remember it is an estimate, and Vera is not a method of contraception.',
    },
  ),
  _Topic(
    suggested: true,
    keywords: ['duzensiz', 'irregular', 'degisken', 'varie', 'farkli surel'],
    sampleQuestion: {
      'tr': 'Döngülerim düzensiz, endişelenmeli miyim?',
      'en': 'My cycles are irregular — should I worry?',
    },
    answer: {
      'tr':
          '21–35 gün arası döngüler tipik kabul edilir ve döngüden döngüye birkaç günlük fark tamamen normaldir. Şu ana kadar {cyclesLogged} döngü kaydettin; ortalaman {meanLength}. Döngülerin sürekli 21 günden kısa, 35 günden uzunsa ya da düzen aniden değiştiyse, bir hekimle konuşmak iyi olur — bu bir teşhis değil, sadece makul bir sonraki adımdır.',
      'en':
          'Cycles between 21–35 days are considered typical, and a few days of variation cycle-to-cycle is completely normal. You have logged {cyclesLogged} cycles so far; your average is {meanLength}. If cycles are consistently shorter than 21 or longer than 35 days, or the pattern changed suddenly, talking to a clinician is sensible — not a diagnosis, just a reasonable next step.',
    },
  ),
  _Topic(
    keywords: ['lekelen', 'spotting', 'ara kanama', 'breakthrough'],
    sampleQuestion: {
      'tr': 'Lekelenme ile regl farkı ne?',
      'en': 'What is the difference between spotting and a period?',
    },
    answer: {
      'tr':
          'Lekelenme; ped/tampon gerektirmeyecek kadar hafif, genelde pembe-kahverengi tonda kanamadır ve regl sayılmaz — Vera da lekelenmeyi döngü başlangıcı olarak saymaz, çünkü saymak tahminleri bozar. Regl öncesi 1-2 gün lekelenme yaygındır. Döngü ortasında tekrarlayan lekelenme varsa bir hekime bahsetmeye değer.',
      'en':
          'Spotting is bleeding light enough not to need a pad/tampon, often pink-brown — and it does not count as a period. Vera deliberately does not treat spotting as a cycle start, because doing so would skew predictions. A day or two of spotting before a period is common. Recurring mid-cycle spotting is worth mentioning to a clinician.',
    },
  ),
  _Topic(
    keywords: ['pms', 'gerginlik', 'sinirli', 'mood', 'ruh hali', 'duygu'],
    sampleQuestion: {'tr': 'PMS neden olur?', 'en': 'What causes PMS?'},
    answer: {
      'tr':
          'Regl öncesi progesteron ve östrojenin hızla düşmesi; duygu durumu, uyku ve iştahı etkileyebilir — PMS dediğimiz şey bu geçiş döneminin belirtileridir ve kanama başladıktan bir-iki gün sonra genelde hafifler. Düzenli uyku, hareket ve kaydettiğin belirtilere bakıp kendi örüntünü tanımak gerçekten yardımcı olur. Belirtiler hayatını ciddi etkiliyorsa (PMDD olasılığı) bir hekime danışmak önemli.',
      'en':
          'The rapid drop in progesterone and estrogen before a period can affect mood, sleep, and appetite — PMS is the set of symptoms from that transition, and it usually eases within a day or two of bleeding starting. Regular sleep, movement, and spotting your own pattern in your logs genuinely help. If symptoms seriously disrupt your life (possible PMDD), talking to a clinician matters.',
    },
  ),
  _Topic(
    keywords: [
      'yogun',
      'heavy',
      'asiri kanama',
      'cok kanama',
      'pihtili',
      'clot',
    ],
    sampleQuestion: {
      'tr': 'Kanamam çok yoğun, normal mi?',
      'en': 'My flow is very heavy — is that normal?',
    },
    answer: {
      'tr':
          'İlk 1-2 günün yoğun geçmesi tipiktir. Ama pedi/tamponu her 1-2 saatte bir değiştirmek zorunda kalıyorsan, 7 günden uzun kanıyorsan veya büyük pıhtılar görüyorsan bu "çok yoğun" sınıfına girer ve bir hekimle konuşmayı hak eder — utanılacak değil, çok sık görülen ve çoğu zaman çözülebilen bir durumdur.',
      'en':
          'Heavier flow on the first day or two is typical. But if you need to change a pad/tampon every 1–2 hours, bleed longer than 7 days, or pass large clots, that counts as heavy bleeding and deserves a conversation with a clinician — it is common, nothing to be embarrassed about, and usually treatable.',
    },
  ),
  _Topic(
    keywords: ['bazal', 'bbt', 'sicaklik', 'temperature', 'ates olc'],
    sampleQuestion: {
      'tr': 'Bazal vücut sıcaklığı nasıl ölçülür?',
      'en': 'How do I measure basal body temperature?',
    },
    answer: {
      'tr':
          'Sabah gözünü açar açmaz, yataktan çıkmadan, her gün aynı saatte ölç — hareket etmek değeri bozar. Ovülasyondan sonra sıcaklık ~0.3–0.5°C yükselir ve regle kadar yüksek kalır; yani BBT ovülasyonu önceden bildirmez, gerçekleştiğini doğrular. Ayarlar\'dan BBT takibini açarsan gün kaydına ölçüm alanı eklenir.',
      'en':
          'Measure the moment you wake, before getting out of bed, at the same time daily — moving around skews it. After ovulation, temperature rises ~0.3–0.5°C and stays up until your period; BBT confirms ovulation happened rather than predicting it. Turn on BBT tracking in Settings to add the field to your day log.',
    },
  ),
  _Topic(
    keywords: ['mukus', 'mucus', 'akinti', 'discharge', 'servikal'],
    sampleQuestion: {
      'tr': 'Servikal mukus neyi gösterir?',
      'en': 'What does cervical mucus tell me?',
    },
    answer: {
      'tr':
          'Mukus döngü boyunca değişir: regl sonrası kuru/az, sonra yapışkan, kremsi, ve ovülasyon yaklaşırken şeffaf-esnek (yumurta akı kıvamı) olur — o kıvam en doğurgan günlerin işaretidir. Kötü koku, kaşıntı veya olağandışı renk mukus değil enfeksiyon belirtisi olabilir; o durumda hekime görünmek gerekir.',
      'en':
          'Mucus shifts across the cycle: dry/scant after your period, then sticky, creamy, and clear-stretchy (egg-white) as ovulation nears — that texture marks your most fertile days. Bad odor, itching, or unusual color is not cycle mucus but a possible infection sign; that warrants seeing a clinician.',
    },
  ),
  _Topic(
    keywords: [
      'tahmin nasil',
      'prediction',
      'how does vera',
      'nasil hesap',
      'nasil tahmin',
      'dogru mu',
    ],
    sampleQuestion: {
      'tr': 'Vera tahminleri nasıl hesaplıyor?',
      'en': 'How does Vera calculate predictions?',
    },
    answer: {
      'tr':
          'Vera, kaydettiğin gerçek döngülerin ortalamasını ve değişkenliğini (standart sapma) kullanır; en az 2 tam döngü olmadan tahmin vermez. Sana asla tek bir gün söylemez — dürüst bir aralık ve güven seviyesi gösterir, çünkü tek gün vermek sahte kesinlik olur. Şu ana kadar {cyclesLogged} döngü kaydettin; mevcut tahmin penceren: {prediction}.',
      'en':
          'Vera uses the average and variability (standard deviation) of your real logged cycles, and refuses to predict before it has at least 2 complete cycles. It never gives you a single date — always an honest range plus a confidence level, because a single date would be false precision. You have logged {cyclesLogged} cycles; your current window: {prediction}.',
    },
  ),
  _Topic(
    suggested: true,
    keywords: [
      'veri',
      'mahremiyet',
      'gizlilik',
      'privacy',
      'data',
      'guvenli',
      'secure',
      'sunucu',
      'server',
    ],
    sampleQuestion: {'tr': 'Verilerim güvende mi?', 'en': 'Is my data safe?'},
    answer: {
      'tr':
          'Verilerin yalnızca bu cihazda, AES-GCM ile şifreli durur; anahtar telefonunun güvenli donanımında (Keychain/Keystore) saklanır. Hesap yok, bulut senkronu yok — kaydettiklerin hiçbir yere yüklenmez. Ben de dahil: bu sohbet tamamen cihazında çalışır, hiçbir soru veya cevap dışarı gitmez. Ücretsiz sürümde gösterilen reklamlar internete bağlanır ama sağlık verilerine erişmez; Premium reklamları tamamen kaldırır.',
      'en':
          'Your data lives only on this device, encrypted with AES-GCM; the key sits in your phone\'s secure hardware (Keychain/Keystore). There is no account and no cloud sync — nothing you log is uploaded. That includes me: this chat runs entirely on-device, and no question or answer ever leaves it. Ads in the free version do connect to the internet, but they never receive your health data; Premium removes them entirely.',
    },
  ),
  _Topic(
    keywords: ['luteal', 'progesteron'],
    sampleQuestion: {
      'tr': 'Luteal faz nedir?',
      'en': 'What is the luteal phase?',
    },
    answer: {
      'tr':
          'Luteal faz, ovülasyonla bir sonraki regl arasındaki dönemdir; çoğu kişide 11–17 gün sürer ve döngünün en sabit parçasıdır. Bu evrede progesteron yükselir — şişkinlik, göğüs hassasiyeti ve iştah artışı yaygındır. Kendi luteal faz varsayımını Ayarlar → Tahmin Ayarları\'ndan düzenleyebilirsin.',
      'en':
          'The luteal phase runs from ovulation to your next period; for most people it lasts 11–17 days and is the most constant part of the cycle. Progesterone rises here — bloating, breast tenderness, and appetite increases are common. You can adjust your own luteal-phase assumption in Settings → Prediction settings.',
    },
  ),
  _Topic(
    keywords: ['folikuler', 'follicular', 'ostrojen', 'estrogen'],
    sampleQuestion: {
      'tr': 'Foliküler faz nedir?',
      'en': 'What is the follicular phase?',
    },
    answer: {
      'tr':
          'Foliküler faz reglin ilk günüyle ovülasyon arasıdır: östrojen yükselir, rahim iç zarı yeniden inşa edilir ve bir yumurta olgunlaşır. Döngü uzunluğundaki kişisel farkların neredeyse tamamı bu fazın uzunluğundan gelir — luteal faz çok daha sabittir.',
      'en':
          'The follicular phase runs from day 1 of your period to ovulation: estrogen climbs, the uterine lining rebuilds, and an egg matures. Nearly all person-to-person differences in cycle length come from this phase — the luteal phase is far more constant.',
    },
  ),
  _Topic(
    keywords: ['stres', 'stress', 'sinav', 'is yogun'],
    sampleQuestion: {
      'tr': 'Stres döngümü etkiler mi?',
      'en': 'Does stress affect my cycle?',
    },
    answer: {
      'tr':
          'Evet — yoğun stres, beynin ovülasyonu tetikleyen hormon sinyallerini baskılayabilir; ovülasyon gecikince regl de gecikir. Tek seferlik stresli bir dönemin döngüyü birkaç gün kaydırması normaldir ve kalıcı bir soruna işaret etmez. Kayıtlarına not düşmen, geriye bakınca örüntüyü görmeni kolaylaştırır.',
      'en':
          'Yes — significant stress can suppress the brain\'s hormonal signals that trigger ovulation; when ovulation is late, the period is late too. A one-off stressful stretch shifting your cycle by a few days is normal and does not signal a lasting problem. Adding a note in your log makes the pattern easy to spot later.',
    },
  ),
  _Topic(
    keywords: ['spor', 'egzersiz', 'exercise', 'workout', 'hareket'],
    sampleQuestion: {
      'tr': 'Regl döneminde spor yapabilir miyim?',
      'en': 'Can I exercise during my period?',
    },
    answer: {
      'tr':
          'Evet, istiyorsan kesinlikle yapabilirsin — hafif hareket kramplara bile iyi gelebilir. Genel örüntü şöyledir: regl ve geç luteal dönemde daha hafif aktiviteler, foliküler/ovülasyon civarında daha yüksek tempolu antrenmanlar daha iyi hissettirir. Ama tek doğru kural, o gün vücudunun ne istediğidir.',
      'en':
          'Absolutely, if you want to — gentle movement can even ease cramps. The broad pattern: lighter activity tends to feel better during your period and late luteal phase, higher-intensity training around the follicular phase and ovulation. But the only real rule is what your body wants that day.',
    },
  ),
  _Topic(
    keywords: ['demir', 'iron', 'beslen', 'nutrition', 'yemek', 'vitamin'],
    sampleQuestion: {
      'tr': 'Regl döneminde nasıl beslenmeliyim?',
      'en': 'How should I eat during my period?',
    },
    answer: {
      'tr':
          'Katı bir kural yok; ama regl sırasında demir kaybı olduğundan yeşil yapraklılar, mercimek, kırmızı et gibi demir kaynakları mantıklıdır. Luteal fazda enerji ihtiyacı hafifçe artar — karbonhidrat isteği gerçektir, suçluluk gerektirmez. Bol su ve düzenli öğünler her evrede sağlam bir temeldir.',
      'en':
          'There is no strict rule; but since iron is lost during your period, iron sources like leafy greens, lentils, and red meat make sense. Energy needs rise slightly in the luteal phase — carb cravings are real and need no guilt. Hydration and regular meals are a solid base in every phase.',
    },
  ),
  _Topic(
    keywords: ['ilk regl', 'first period', 'menars', 'menarche', 'ergen'],
    sampleQuestion: {
      'tr': 'İlk yıllarda düzensizlik normal mi?',
      'en': 'Is irregularity normal in the first years?',
    },
    answer: {
      'tr':
          'Evet — ilk regl sonrası ilk birkaç yıl döngüler sıklıkla düzensizdir, çünkü hormon sistemi hâlâ olgunlaşıyordur. Bu dönemde uzun aralar veya değişken süreler genelde endişe gerektirmez. Kayıt tutmak, zamanla oturan örüntüyü görmenin en iyi yoludur.',
      'en':
          'Yes — cycles are often irregular for the first few years after a first period, because the hormonal system is still maturing. Long gaps or varying lengths in this stage usually are not cause for concern. Logging is the best way to watch your pattern settle over time.',
    },
  ),
  _Topic(
    keywords: [
      'doktor',
      'hekim',
      'clinician',
      'when should i see',
      'ne zaman git',
    ],
    sampleQuestion: {
      'tr': 'Ne zaman doktora gitmeliyim?',
      'en': 'When should I see a doctor?',
    },
    answer: {
      'tr':
          'Şunlarda bir hekime danışmak iyi olur: 3 aydan uzun regl yokluğu (gebelik dışında), sürekli 21 günden kısa/35 günden uzun döngüler, günlük hayatı aksatan ağrı, 7 günü aşan veya saatte bir ped değiştirten kanama, döngü ortasında tekrarlayan kanama. Vera\'daki doktor raporu (Ayarlar → Dışa aktar) kayıtlarını görüşmeye hazır bir özet halinde sunar.',
      'en':
          'Good reasons to see a clinician: no period for 3+ months (outside pregnancy), cycles consistently under 21 or over 35 days, pain that disrupts daily life, bleeding beyond 7 days or soaking a pad hourly, repeated mid-cycle bleeding. Vera\'s doctor report (Settings → Export) turns your logs into a visit-ready summary.',
    },
  ),
  _Topic(
    keywords: ['dogum kontrol', 'korunma', 'contracepti', 'birth control'],
    sampleQuestion: {
      'tr': 'Vera doğum kontrolü için kullanılabilir mi?',
      'en': 'Can Vera be used for birth control?',
    },
    answer: {
      'tr':
          'Hayır. Vera\'nın doğurgan pencere tahmini bilgilendirme amaçlıdır ve bir gebelikten korunma yöntemi DEĞİLDİR — tahminler geçmiş verine dayanır ve ovülasyon her döngüde kayabilir. Korunma için bir sağlık profesyoneliyle gerçek seçenekleri konuşmak gerekir.',
      'en':
          'No. Vera\'s fertile-window estimate is informational and is NOT a method of contraception — estimates rest on past data, and ovulation can shift any cycle. For contraception, discuss real options with a healthcare professional.',
    },
  ),
  _Topic(
    keywords: ['uyku', 'sleep', 'uyuyam'],
    sampleQuestion: {
      'tr': 'Döngüm uykumu etkiler mi?',
      'en': 'Does my cycle affect sleep?',
    },
    answer: {
      'tr':
          'Etkileyebilir: luteal fazın sonunda progesteron düşerken uykuya dalmak zorlaşabilir ve uyku bölünebilir; regl sırasında kramplar da uykuyu bozabilir. Serin oda, sabit yatış saati ve akşam kafeini azaltmak en çok işe yarayan basit adımlardır. Uyku verini kaydedersen kendi örüntünü İçgörüler\'de görebilirsin.',
      'en':
          'It can: falling asleep may get harder and sleep more broken in the late luteal phase as progesterone drops, and cramps can disturb sleep during your period. A cool room, consistent bedtime, and less evening caffeine are the simple steps that help most. Log your sleep and your own pattern shows up in Insights.',
    },
  ),
  _Topic(
    keywords: ['kilo', 'weight', 'sisman', 'zayif'],
    sampleQuestion: {
      'tr': 'Kilo değişimi döngüyü etkiler mi?',
      'en': 'Do weight changes affect the cycle?',
    },
    answer: {
      'tr':
          'Hızlı kilo kaybı, çok düşük vücut yağı veya yoğun diyet ovülasyonu durdurabilir; belirgin kilo artışı da hormon dengesini etkileyebilir. Regl sırasında 1-2 kiloluk geçici su tutulumu ise tamamen normaldir ve gerçek kilo değişimi değildir.',
      'en':
          'Rapid weight loss, very low body fat, or intense dieting can stop ovulation; significant weight gain can also affect hormonal balance. Meanwhile, 1–2 kg of temporary water retention around your period is completely normal and is not real weight change.',
    },
  ),

  // ---------------------------------------------------------------------
  // Using the app itself. These were missing entirely, which is an odd gap
  // for an assistant sitting inside the app: "how do I log a day" is the
  // single most likely question a new user has, and it used to fall through
  // to "I didn't catch that".
  // ---------------------------------------------------------------------
  _Topic(
    suggested: true,
    keywords: [
      'nasil kaydet',
      'kayit ekle',
      'gun kaydi',
      'how do i log',
      'add a log',
      'log a day',
      'kaydetmek',
    ],
    sampleQuestion: {
      'tr': 'Günlük kaydı nasıl eklerim?',
      'en': 'How do I log a day?',
    },
    answer: {
      'tr':
          'Takvim\'den istediğin güne dokun, açılan özetten gün kaydına geç — ya da Ana Sayfa\'daki "Bugüne detay ekle" düğmesini kullan. Akış, semptom, ruh hali, enerji, su, uyku, kilo ve notunu oradan girersin. Kaydet düğmesi yok: her dokunuş anında kaydedilir, üstteki "Kaydedildi" yazısı bunu doğrular. Gelecekteki günler kilitlidir, çünkü henüz yaşanmadılar.',
      'en':
          'Tap any day in the Calendar and open its day log from the summary sheet — or use "Add details for today" on Home. Flow, symptoms, mood, energy, water, sleep, weight and your note all live there. There is no Save button: every tap is saved immediately, and the "Saved" note at the top confirms it. Future days are not tappable, because they have not happened yet.',
    },
  ),
  _Topic(
    keywords: [
      'disa aktar',
      'export',
      'doktora goster',
      'rapor',
      'pdf',
      'csv',
      'yedek',
      'backup',
    ],
    sampleQuestion: {
      'tr': 'Verimi doktoruma nasıl gösteririm?',
      'en': 'How do I share my data with my doctor?',
    },
    answer: {
      'tr':
          'Ayarlar → Dışa aktar\'dan iki seçeneğin var: hekim için okunaklı bir PDF/CSV raporu, ve parolayla şifrelenmiş tam yedek. Notların rapora varsayılan olarak girmez — istersen kutucuğu işaretleyerek eklersin. Bu, verinin cihazından çıktığı tek yoldur ve her seferinde sen başlatırsın.',
      'en':
          'Settings → Export gives you two things: a readable PDF/CSV report for a clinician, and a full backup encrypted with a password you choose. Your free-text notes are left out of the report by default — tick the box if you want them in. This is the only way your data ever leaves the device, and you start it every time.',
    },
  ),
  _Topic(
    keywords: [
      'premium',
      'abonelik',
      'subscription',
      'ucretli',
      'para',
      'satin al',
      'reklamsiz',
    ],
    sampleQuestion: {
      'tr': 'Premium ne veriyor?',
      'en': 'What does Premium give me?',
    },
    answer: {
      'tr':
          'Premium reklamları kaldırır ve şunları ekler: kendi adını verdiğin takip alanları, gelişmiş içgörüler (neyin döngünün hangi bölümünde yoğunlaştığı), kendi hatırlatıcıların ve ek arka planlar/maskotlar. Takibin kendisi — akış, semptom, takvim, tahmin, dışa aktarma — sonsuza dek ücretsiz. Aboneliğin biterse tek bir kaydını bile kaybetmezsin; sadece ücretsiz bir arka plana dönersin.',
      'en':
          'Premium removes the ads and adds: trackers you name yourself, advanced insights (what clusters where in your cycle), your own reminders, and extra backgrounds and companions. Tracking itself — flow, symptoms, calendar, predictions, export — stays free forever. If your subscription ends you lose no entries at all; you just go back to a free background.',
    },
  ),
  _Topic(
    keywords: ['hatirlatici', 'bildirim', 'reminder', 'notification', 'alarm'],
    sampleQuestion: {
      'tr': 'Hatırlatıcıları nasıl açarım?',
      'en': 'How do I turn on reminders?',
    },
    answer: {
      'tr':
          'Ayarlar → Hatırlatıcılar\'dan aç. Yaklaşan regl, regl bitişi, ilaç, su, ovülasyon ve yedekleme için ayrı ayrı açılır, her birinin kendi saati vardır. Premium ile kendi metnini yazdığın hatırlatıcılar da ekleyebilirsin. Hepsi telefonunda kurulur — sunucu yok, push yok. Bildirim metni kilit ekranında görüneceği için, ne kadar mahrem olmasını istiyorsan ona göre yaz.',
      'en':
          'Settings → Reminders. Upcoming period, period end, medication, water, ovulation and backup each toggle separately with their own time. With Premium you can add reminders you write yourself. All of them are scheduled on your phone — no server, no push. Reminder text shows on your lock screen, so word it as privately as you want it.',
    },
  ),
  _Topic(
    keywords: [
      'telefonu kaybet',
      'yeni telefon',
      'lost my phone',
      'new phone',
      'aktarim',
      'transfer',
      'geri yukle',
      'restore',
    ],
    sampleQuestion: {
      'tr': 'Telefonumu değiştirirsem verim ne olur?',
      'en': 'What happens to my data if I change phones?',
    },
    answer: {
      'tr':
          'Bulut senkronu olmadığı için veri kendi kendine yeni telefona geçmez — bu, mahremiyet sözünün doğrudan bedeli ve sana açıkça söylüyoruz. Aktarmanın yolu: eski telefonda Ayarlar → Dışa aktar\'dan parolalı yedek al, yeni telefonda İçe aktar\'dan geri yükle. Parolayı unutursan yedeği kimse açamaz, biz de açamayız. Bu yüzden ara ara yedek almak iyi bir alışkanlıktır.',
      'en':
          'There is no cloud sync, so your data does not follow you automatically — that is the direct cost of the privacy promise, and we would rather say it plainly. To move it: on the old phone take a password-protected backup from Settings → Export, then restore it on the new phone from Import. If you forget the password nobody can open that backup, us included. Which is why taking one occasionally is a good habit.',
    },
  ),
  _Topic(
    keywords: [
      'pin',
      'kilit',
      'sifre',
      'passcode',
      'biyometrik',
      'biometric',
      'parmak izi',
      'face id',
    ],
    sampleQuestion: {
      'tr': 'Uygulamayı nasıl kilitlerim?',
      'en': 'How do I lock the app?',
    },
    answer: {
      'tr':
          'Kurulumda 6 haneli bir PIN belirlersin; istersen parmak izi/yüz tanımayı da açabilirsin, PIN yedek olarak kalır. Uygulama arka plana her alındığında anında kilitlenir ve uygulama değiştiricide içeriğin görünmez. PIN\'i unutursan kilit ekranındaki "PIN\'ini mi unuttun?" bağlantısına dokun: cihazının kendi kilidiyle (parmak izi/yüz/telefon şifresi) kimliğini doğrulayıp verini kaybetmeden yeni bir PIN belirleyebilirsin. Cihaz kimlik doğrulaman yoksa ya da onu tercih etmezsen tek alternatif tüm veriyi silmektir — sunucu tarafında kurtarma yok, çünkü sunucu yok.',
      'en':
          'You set a 6-digit PIN during setup, and can add fingerprint/face unlock on top — the PIN stays as the fallback. The app re-locks the instant it goes to the background, and your content is hidden in the app switcher. If you forget the PIN, tap "Forgot your PIN?" on the lock screen: verify with your device\'s own lock (fingerprint/face/passcode) and set a new PIN without losing your data. Without device authentication, or if you\'d rather not use it, the only alternative is erasing everything — there is no server-side recovery, because there is no server.',
    },
  ),

  // ---------------------------------------------------------------------
  // Common health questions that were missing.
  // ---------------------------------------------------------------------
  _Topic(
    keywords: [
      'menopoz',
      'menopause',
      'perimenopoz',
      'perimenopause',
      '40 yas',
    ],
    sampleQuestion: {
      'tr': 'Menopoza yaklaştığımı nasıl anlarım?',
      'en': 'How do I know if I am approaching menopause?',
    },
    answer: {
      'tr':
          'Perimenopozda en tipik değişim düzenin bozulmasıdır: döngüler kısalır ya da uzar, kanama miktarı değişir, aralar açılır. Sıcak basması, uyku bölünmesi ve ruh hali dalgalanmaları eşlik edebilir. Genellikle 40\'lı yaşlarda başlar ama daha erken de olabilir. Vera bunu teşhis edemez; kaydettiğin döngü uzunlukları hekiminle konuşurken en işe yarar veridir.',
      'en':
          'The most typical change in perimenopause is the pattern breaking up: cycles get shorter or longer, bleeding changes, gaps widen. Hot flushes, broken sleep and mood swings can come with it. It usually starts in the 40s but can be earlier. Vera cannot diagnose this; the cycle lengths you have logged are the most useful thing to bring to a clinician.',
    },
  ),
  _Topic(
    keywords: [
      'pcos',
      'polikistik',
      'endometriozis',
      'endometriosis',
      'adenomyoz',
      'miyom',
      'fibroid',
    ],
    sampleQuestion: {
      'tr': 'PCOS veya endometriozis olabilir miyim?',
      'en': 'Could I have PCOS or endometriosis?',
    },
    answer: {
      'tr':
          'Bu soruya bir uygulama cevap veremez ve vermemeli — ikisi de muayene ve tetkik gerektiren tanılar. Ama hekime gitmeye değer işaretler bellidir: çok uzun veya çok düzensiz döngüler, günlük hayatını aksatan ağrı, ilişkide ağrı, çok yoğun kanama, tüylenme veya ciltte belirgin değişim. Vera\'nın işi burada tanı koymak değil, hekime götüreceğin somut kaydı hazırlamak: Ayarlar → Dışa aktar\'dan rapor alabilirsin.',
      'en':
          'An app cannot answer this, and should not try — both are diagnoses that need examination and tests. But the signals worth taking to a clinician are clear: very long or very irregular cycles, pain that disrupts your day, pain during sex, very heavy bleeding, or marked hair or skin changes. Vera\'s job here is not to diagnose but to give you something concrete to bring: Settings → Export produces a report.',
    },
  ),
  _Topic(
    keywords: [
      'ped',
      'tampon',
      'kap',
      'kupa',
      'pad',
      'menstrual cup',
      'kullanmali',
    ],
    sampleQuestion: {
      'tr': 'Ped, tampon ve kap arasında ne fark var?',
      'en': 'What is the difference between pads, tampons and cups?',
    },
    answer: {
      'tr':
          'Ped dışarıdan kullanılır, en basit seçenektir. Tampon içeriden emer; 4–8 saatte bir değiştirilmesi gerekir. Adet kabı içeride kan toplar, 8–12 saate kadar kalabilir ve yıkanıp tekrar kullanılır. Hiçbiri diğerinden "daha doğru" değil — rahat ettiğin hangisiyse odur. Tek kesin kural: tampon ve kabı önerilen süreden uzun bırakma.',
      'en':
          'Pads sit outside and are the simplest option. Tampons absorb internally and need changing every 4–8 hours. A menstrual cup collects internally, can stay up to 8–12 hours, and is washed and reused. None is more "correct" than another — the right one is whichever you are comfortable with. The one firm rule: do not leave a tampon or cup in longer than recommended.',
    },
  ),
  _Topic(
    keywords: ['baş agri', 'bas agri', 'migren', 'migraine', 'headache'],
    sampleQuestion: {
      'tr': 'Regl öncesi başım ağrıyor, neden?',
      'en': 'Why do I get headaches before my period?',
    },
    answer: {
      'tr':
          'Regl öncesi ve ilk günlerinde östrojenin hızlı düşüşü bazı kişilerde baş ağrısını veya migreni tetikler — buna "menstrüel migren" denir ve yaygındır. Düzenli uyku, su, öğün atlamamak ve tetikleyicileri not etmek yardımcı olur. Ağrı çok şiddetliyse, görme değişikliği eşlik ediyorsa veya her ay işini aksatıyorsa hekime söylemeye değer; bunun tedavisi var.',
      'en':
          'The sharp drop in estrogen just before and during your period triggers headaches or migraine in some people — "menstrual migraine", and it is common. Regular sleep, hydration, not skipping meals and noting your triggers all help. If the pain is severe, comes with vision changes, or disrupts your month every month, it is worth telling a clinician: this is treatable.',
    },
  ),
  _Topic(
    keywords: ['cinsel iliski', 'seks', 'sex during', 'iliskiye gir'],
    sampleQuestion: {
      'tr': 'Regl sırasında ilişkiye girilir mi?',
      'en': 'Is it OK to have sex during my period?',
    },
    answer: {
      'tr':
          'Tıbbi bir sakıncası yoktur; tamamen ikinizin tercihine kalmış bir konudur. İki pratik not: kanama olduğu için enfeksiyon geçişi riski biraz artar, bu yüzden bariyer yöntemi mantıklıdır — ve regl sırasında gebelik ihtimali düşük olsa da sıfır değildir, özellikle kısa döngülerde. Vera doğum kontrol yöntemi değildir.',
      'en':
          'There is no medical reason not to; it is entirely a matter of what you both want. Two practical notes: with bleeding, the risk of passing an infection is slightly higher, so a barrier method makes sense — and while pregnancy is less likely during your period, it is not impossible, especially with short cycles. Vera is not a method of contraception.',
    },
  ),
  _Topic(
    keywords: ['oruc', 'ramazan', 'fasting', 'ramadan'],
    sampleQuestion: {
      'tr': 'Oruç döngümü etkiler mi?',
      'en': 'Does fasting affect my cycle?',
    },
    answer: {
      'tr':
          'Uzun süreli veya sert kalori kısıtlaması ovülasyonu geciktirebilir, dolayısıyla döngüyü uzatabilir; kısa süreli oruçların çoğu kişide belirgin etkisi olmaz. Sahur ve iftarda yeterli protein, demir ve su almak, uykuyu bölmemek farkı azaltır. Döngünde belirgin bir değişiklik olursa kaydet — birkaç döngü sonra İçgörüler\'de kendi örüntünü görürsün.',
      'en':
          'Prolonged or harsh calorie restriction can delay ovulation and so lengthen the cycle; shorter fasts have no clear effect for most people. Enough protein, iron and water at your meals, and protecting your sleep, reduce the difference. If your cycle shifts noticeably, log it — after a few cycles your own pattern shows up in Insights.',
    },
  ),
  _Topic(
    keywords: ['seyahat', 'ucak', 'travel', 'jet lag', 'tatil'],
    sampleQuestion: {
      'tr': 'Seyahat reglimi geciktirir mi?',
      'en': 'Can travel delay my period?',
    },
    answer: {
      'tr':
          'Evet, olabilir. Saat dilimi değişimi, bozulan uyku, yolculuk stresi ve rutin değişikliği ovülasyonu birkaç gün kaydırabilir; regl de onunla kayar. Bu geçicidir ve genelde bir sonraki döngüde düzelir. Tekrarlayan ya da haftalarca süren gecikmeler başka bir nedene işaret edebilir.',
      'en':
          'Yes, it can. A time-zone shift, disrupted sleep, travel stress and a changed routine can move ovulation by a few days — and your period moves with it. This is temporary and usually settles by the next cycle. Delays that keep repeating or stretch to weeks point at something else.',
    },
  ),
  _Topic(
    keywords: [
      'kokusu',
      'koku',
      'smell',
      'kasinti',
      'itch',
      'yanma',
      'enfeksiyon',
      'infection',
      'mantar',
    ],
    sampleQuestion: {
      'tr': 'Akıntının kokusu veya kaşıntı normal mi?',
      'en': 'Is unusual discharge smell or itching normal?',
    },
    answer: {
      'tr':
          'Akıntının döngü boyunca miktar ve kıvam değiştirmesi normaldir. Normal olmayan: keskin/kötü koku, kaşıntı, yanma, yeşilimsi veya köpüklü görünüm, idrar yaparken acı. Bunlar genelde tedavisi kolay bir enfeksiyona işaret eder ama kendi kendine geçmesini beklemek doğru değil — hekime görünmek gerekir. Bu, Vera\'nın yorumlayabileceği bir şey değil.',
      'en':
          'Discharge changing in amount and texture across the cycle is normal. What is not: a sharp or bad smell, itching, burning, a greenish or frothy look, or pain when peeing. These usually point at an infection that is easy to treat — but waiting it out is the wrong move; see a clinician. This is not something Vera can interpret for you.',
    },
  ),

  // ---------------------------------------------------------------------
  // More "how do I use this" and "what is this feature for" questions.
  // The first batch of app-mechanics topics only covered logging, export,
  // Premium, reminders, phone transfer and the lock screen — the six most
  // obvious ones. Everything else the app can do (optional trackers, the
  // theme/mascot picker, ads/permissions, feedback, rating, pregnancy mode)
  // still fell through to the fallback, which is a worse first impression
  // than not having an assistant at all.
  // ---------------------------------------------------------------------
  _Topic(
    suggested: true,
    keywords: [
      'internet izni',
      'internet permission',
      'neden internet',
      'why internet',
      'reklam veri',
      'ad data',
      'takip ediliyor',
      'tracked',
    ],
    sampleQuestion: {
      'tr': 'Uygulama neden internet izni istiyor?',
      'en': 'Why does the app need internet permission?',
    },
    answer: {
      'tr':
          'Tek nedeni ücretsiz sürümdeki reklamlar — Google AdMob reklam göstermek için ağa bağlanır. Vera\'nın kendi kodu hiçbir ağ çağrısı yapmaz: kayıtların, sohbetin, tahminlerin hep cihazında kalır. Reklam SDK\'sı kendi çerçevesinde bir cihaz tanımlayıcısı işleyebilir ama ona asla sağlık verisi, döngü bilgisi ya da bu sohbetten hiçbir şey verilmez. Premium reklamları tamamen kaldırır, ki o zaman internet izninin tek kullanım amacı da ortadan kalkar.',
      'en':
          'The only reason is ads in the free version — Google AdMob connects to the network to show them. Vera\'s own code makes no network calls at all: your logs, this chat, and your predictions stay on the device. The ad SDK may process a device identifier within its own framework, but it is never given health data, cycle information, or anything from this chat. Premium removes ads entirely, which removes internet permission\'s one purpose along with them.',
    },
  ),
  _Topic(
    keywords: [
      'cinsel aktivite',
      'sexual activity',
      'cinsellik',
      'sex tracking',
      'mahrem takip',
    ],
    sampleQuestion: {
      'tr': 'Cinsel aktivite takibi ne işe yarar, kimseyle paylaşılır mı?',
      'en': 'What is sexual activity tracking for, and who sees it?',
    },
    answer: {
      'tr':
          'Cinsel aktivite kendini, korumalı/korumasız birliktelik, mastürbasyon, orgazm ve cinsel istek gibi seçenekleri kaydetmeni sağlar — döngü ile ilişkiyi görmek, doğurgan pencereyle örtüşmeyi fark etmek ya da sadece kendi örüntünü takip etmek isteyenler için. Bu sorular varsayılan olarak KAPALIDIR; Ayarlar\'dan kendin açmadıkça hiçbir yerde görünmez. Açtığında bile veri diğer her şey gibi cihazında şifreli kalır, hiçbir yere gönderilmez.',
      'en':
          'Sexual activity lets you log protected/unprotected sex, masturbation, orgasm, and desire — useful for seeing the connection to your cycle, noticing overlap with the fertile window, or just tracking your own pattern. These questions are OFF by default and appear nowhere until you turn them on yourself in Settings. Even once on, the data stays encrypted on your device like everything else, and goes nowhere.',
    },
  ),
  _Topic(
    keywords: [
      'gogus muayene',
      'breast exam',
      'kendi kendine muayene',
      'self exam',
      'meme',
    ],
    sampleQuestion: {
      'tr': 'Kendi kendine göğüs muayenesi takibi nedir?',
      'en': 'What is the self breast-exam tracker?',
    },
    answer: {
      'tr':
          'Ayarlar\'dan açtığında, gün kaydına aylık kendi kendine göğüs muayeneni not edebileceğin bir alan eklenir — her şeyin normal olduğunu, ya da bir kitle, çekinti, kızarıklık, çatlak meme ucu ya da akıntı fark ettiğini işaretleyebilirsin. Bu bir tanı aracı değil, sadece bir hatırlatma ve kayıt yeridir; herhangi bir değişiklik fark edersen bir sağlık profesyoneline görünmen gerekir.',
      'en':
          'Turn it on in Settings and your day log gets a field for a monthly self breast-exam note — mark everything as normal, or flag a lump, dimpling, redness, a cracked nipple, or discharge. This is not a diagnostic tool, just a reminder and a place to keep the note; if you notice any change, see a healthcare professional.',
    },
  ),
  _Topic(
    keywords: [
      'ovulasyon testi',
      'ovulation test',
      'lh testi',
      'lh test',
      'ovulasyon seridi',
      'ovulation strip',
    ],
    sampleQuestion: {
      'tr': 'Ovülasyon testi takibi ne işe yarar?',
      'en': 'What is the ovulation test tracker for?',
    },
    answer: {
      'tr':
          'Eczaneden aldığın bir LH testinin sonucunu (pozitif/negatif) gün kaydına işlemeni sağlar. LH testi, vücudunun ovülasyondan hemen önceki hormon artışını yakalar — kendi ölçtüğün bu sonuç, Vera\'nın geçmiş döngülerinden çıkardığı tahminden daha doğrudan bir sinyaldir. Ayarlar\'dan açman gerekir; kapalıyken gün kaydında görünmez.',
      'en':
          'Lets you log an LH ovulation test result (positive/negative) from a drugstore kit into your day log. An LH test catches the hormone surge right before ovulation — a more direct signal than the estimate Vera derives from past cycles. Turn it on in Settings; it stays out of your day log until you do.',
    },
  ),
  _Topic(
    keywords: [
      'servikal pozisyon',
      'cervix position',
      'rahim agzi',
      'cervix opening',
      'cervix firmness',
    ],
    sampleQuestion: {
      'tr': 'Servikal pozisyon takibi nedir?',
      'en': 'What is cervical position tracking?',
    },
    answer: {
      'tr':
          'Doğurganlık farkındalığı yöntemi kullananlar için bir ileri-seviye takiptir: rahim ağzının konumu (alçak/orta/yüksek), açıklığı ve sertliği ovülasyona yaklaşırken değişir — yumuşar, yükselir ve hafifçe açılır. Servikal mukusla birlikte kullanıldığında doğurgan pencereyi daha net gösterir. Ayarlar\'dan açılan isteğe bağlı bir takip alanıdır.',
      'en':
          'An advanced tracker for people using fertility-awareness methods: cervix position (low/medium/high), opening, and firmness change as ovulation approaches — it softens, rises, and opens slightly. Combined with cervical mucus it gives a clearer picture of the fertile window. It is an optional field you turn on in Settings.',
    },
  ),
  _Topic(
    keywords: [
      'gebelik modu',
      'pregnancy mode',
      'hamileyim',
      'im pregnant',
      'gebelik takibi',
    ],
    sampleQuestion: {
      'tr': 'Gebelik modu nedir, nasıl açarım?',
      'en': 'What is pregnancy mode, and how do I turn it on?',
    },
    answer: {
      'tr':
          'Ayarlar\'dan son adet tarihini (LMP) girerek açarsın; Ana Sayfa döngü tahmini yerine gebelik haftana, trimesterine ve tahmini doğum tarihine döner, artı haftaya göre bir büyüklük karşılaştırması gösterir. Bunların hepsi LMP\'ye dayalı kaba bir hesaptır (Naegele kuralı) ve bir ultrason kadar kesin değildir — Vera tıbbi takibin yerini tutmaz, bilgilendirme amaçlıdır.',
      'en':
          'Turn it on in Settings by entering your last menstrual period (LMP) date; Home switches from a cycle prediction to your pregnancy week, trimester, and estimated due date, plus a size-for-week comparison. All of this is a rough LMP-based estimate (Naegele\'s rule), not as precise as an ultrasound — Vera is informational and does not replace medical care.',
    },
  ),
  _Topic(
    keywords: [
      'kendi hatirlatici',
      'custom reminder',
      'ozel hatirlatici',
      'kendi etiket',
      'custom tag',
      'kendi takip',
      'custom tracker',
    ],
    sampleQuestion: {
      'tr': 'Kendi hatırlatıcımı veya takip alanımı nasıl eklerim?',
      'en': 'How do I add my own reminder or tracker?',
    },
    answer: {
      'tr':
          'İkisi de Premium\'da: Ayarlar → Hatırlatıcılar → Özel hatırlatıcılar\'dan kendi metnini ve saatini yazdığın hatırlatıcılar ekleyebilirsin; Ayarlar\'dan da adını kendin verdiğin, kendi ikonunu seçtiğin takip alanları oluşturabilirsin. Premium biterse bu alanlar kaybolmaz, sadece yenisini eklemek kilitlenir — zaten kaydettiğin her şey elinde kalır.',
      'en':
          'Both are Premium: Settings → Reminders → Custom reminders lets you add ones with your own text and time, and Settings also lets you create trackers with a name and icon you choose. If Premium lapses these do not disappear — only adding new ones locks again — everything you already recorded stays yours.',
    },
  ),
  _Topic(
    keywords: [
      'tema degistir',
      'change theme',
      'maskot degistir',
      'change mascot',
      'ana ekran arka plan',
      'home background',
      'yol arkadasi',
    ],
    sampleQuestion: {
      'tr': 'Temamı veya yol arkadaşı maskotumu nasıl değiştiririm?',
      'en': 'How do I change my theme or companion mascot?',
    },
    answer: {
      'tr':
          'Profilim → Tema\'dan (ya da Ayarlar\'dan) açık/koyu mod, Ana Sayfa arka planı ve yol arkadaşı maskotunu seçersin. Bazı arka plan ve maskotlar Premium\'a özeldir ama kilitliyken de görünür, öyle olduğunu bilmen için — bu, görmeden karar vermeni istemeyen bir tercih.',
      'en':
          'Profilim → Tema (or Settings) is where you pick light/dark mode, your Home background, and your companion mascot. Some backgrounds and mascots are Premium-only but stay visible even locked, so you can see what you\'d be choosing rather than deciding blind.',
    },
  ),
  _Topic(
    keywords: [
      'dil degistir',
      'change language',
      'uygulama dili',
      'app language',
    ],
    sampleQuestion: {
      'tr': 'Uygulama dilini nasıl değiştiririm?',
      'en': 'How do I change the app language?',
    },
    answer: {
      'tr':
          'Ayarlar\'ın en üstünde bir dil seçici var. Vera yalnızca tamamen çevrilmiş dilleri listeler — yarım çevrilmiş bir sağlık uygulaması, hangi yarısının doğru olduğunu bilemeyeceğin bir şeydir, o yüzden eksik olanlar anadili konuşanlarca gözden geçirilene kadar listeye girmez.',
      'en':
          'There is a language picker right at the top of Settings. Vera only lists languages that are fully translated — a half-translated health app is one where you cannot tell which half to trust, so incomplete ones stay off the list until a native speaker has reviewed them.',
    },
  ),
  _Topic(
    keywords: ['widget', 'ana ekran widget', 'home screen widget'],
    sampleQuestion: {
      'tr': 'Widget\'ı ana ekranıma nasıl eklerim?',
      'en': 'How do I add the widget to my home screen?',
    },
    answer: {
      'tr':
          'iOS\'ta ana ekranda boş bir alana basılı tut → sağ üstteki "+" → Vera\'yı ara. Android\'de ana ekranda basılı tut → Widget\'lar → Vera. Widget döngü gününü ve en yakın tahmini gösterir, hiçbir sağlık ayrıntısı vermez — kilit ekranından da görünebileceği için özellikle mahrem tutulur.',
      'en':
          'On iOS, long-press an empty spot on your home screen → the "+" in the top corner → search for Vera. On Android, long-press the home screen → Widgets → Vera. The widget shows your cycle day and nearest estimate and nothing more detailed — deliberately kept plain since it can be visible from the lock screen too.',
    },
  ),
  _Topic(
    keywords: [
      'geri bildirim',
      'feedback',
      'sorun bildir',
      'report a problem',
      'hata bildir',
    ],
    sampleQuestion: {
      'tr': 'Bir sorunu nasıl bildiririm ya da geri bildirim gönderirim?',
      'en': 'How do I report a problem or send feedback?',
    },
    answer: {
      'tr':
          'Profilim\'deki "Geri Bildirim" kısayolundan ya da Ayarlar\'ın altındaki aynı isimli girişten: bir konu seç, istersen yaz, istersen bir ekran görüntüsü ekle, Gönder\'e dokun. Bu, seni bir e-posta göndermeye zorlamaz — kendi paylaşım penceren açılır ve nereden göndereceğini (e-posta uygulaman dahil) sen seçersin.',
      'en':
          'Use the "Geri Bildirim" shortcut on your profile, or the same entry under Settings: pick a topic, write more if you like, attach a screenshot if you like, tap Send. This does not force you into any one mail app — your own share sheet opens and you choose where it goes, your mail app included.',
    },
  ),
  _Topic(
    keywords: [
      'hesap',
      'account',
      'giris yap',
      'sign in',
      'uye ol',
      'sign up',
      'kayit ol',
    ],
    sampleQuestion: {
      'tr': 'Hesabım var mı, giriş yapmam gerekiyor mu?',
      'en': 'Do I have an account, or need to sign in?',
    },
    answer: {
      'tr':
          'Hayır — Vera\'nın çekirdek takip özellikleri için hesap yoktur, e-posta istemez, şifre belirlemezsin. Uygulamayı açtığın an kayda başlarsın. Kilit ekranındaki PIN bir hesap değil, sadece telefonundaki bu uygulamayı açan yerel bir anahtardır.',
      'en':
          'No — Vera\'s core tracking needs no account, no email, no password to set. You start logging the moment you open the app. The PIN on the lock screen is not an account; it is just a local key that opens this app on your own phone.',
    },
  ),
];
