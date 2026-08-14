import '../models/enums.dart';

/// A snapshot of the user's own logged state, used to personalize answers.
/// Built by the caller from [CycleController]; the assistant itself never
/// touches storage.
class AssistantContext {
  const AssistantContext({
    this.cycleDay,
    this.phase = CyclePhase.unknown,
    this.meanCycleLength,
    this.cyclesLogged = 0,
    this.predictionRangeLabel,
  });

  final int? cycleDay;
  final CyclePhase phase;
  final double? meanCycleLength;
  final int cyclesLogged;

  /// Already-localized "12 – 15 May" style range, or null when no
  /// prediction exists yet.
  final String? predictionRangeLabel;
}

/// On-device Q&A over a curated, clinician-reviewable knowledge base —
/// backlog item 1's "gerçekten cihaz-üstü asistan". Deliberately NOT a
/// cloud LLM: a Gemini/GPT call would need the INTERNET permission and
/// instantly break the store-provable "your data never leaves the phone"
/// claim. Retrieval is keyword-scored; answers are hand-written (so they
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
  List<String> suggestions(String languageCode) {
    final lang = _lang(languageCode);
    return _topics
        .where((t) => t.suggested)
        .map((t) => t.sampleQuestion[lang]!)
        .toList();
  }

  String answer(String question, AssistantContext ctx, String languageCode) {
    final lang = _lang(languageCode);
    final normalized = _normalize(question);
    if (normalized.trim().isEmpty) return _fallback(ctx, lang);

    // Single-word keywords match as token *prefixes* ("gecik" → "gecikti",
    // "pregnan" → "pregnancy") — never as bare substrings, which once made
    // "late" match inside "ovulate". Multi-word keywords use plain contains.
    final tokens = normalized.split(RegExp(r'[^a-z0-9]+'));
    _Topic? best;
    var bestScore = 0;
    for (final topic in _topics) {
      var score = 0;
      for (final keyword in topic.keywords) {
        final hit = keyword.contains(' ')
            ? normalized.contains(keyword)
            : tokens.any((t) => t.startsWith(keyword));
        if (hit) score += keyword.length >= 6 ? 2 : 1;
      }
      if (score > bestScore) {
        bestScore = score;
        best = topic;
      }
    }
    if (best == null) return _fallback(ctx, lang);
    return _personalize(best.answer[lang]!, ctx, lang);
  }

  String _fallback(AssistantContext ctx, String lang) {
    final examples =
        _topics.where((t) => t.suggested).take(3).map((t) => '• ${t.sampleQuestion[lang]!}').join('\n');
    return lang == 'tr'
        ? 'Bunu tam anlayamadım. Şunlar gibi sorular sorabilirsin:\n$examples'
        : "I didn't quite catch that. You can ask things like:\n$examples";
  }

  String _personalize(String template, AssistantContext ctx, String lang) {
    var out = template;
    final unknownDay = lang == 'tr' ? 'henüz kayıt yok' : 'not logged yet';
    out = out.replaceAll('{cycleDay}', ctx.cycleDay?.toString() ?? unknownDay);
    out = out.replaceAll(
        '{meanLength}',
        ctx.meanCycleLength != null
            ? ctx.meanCycleLength!.toStringAsFixed(1)
            : (lang == 'tr' ? 'henüz bilinmiyor' : 'not known yet'));
    out = out.replaceAll('{cyclesLogged}', ctx.cyclesLogged.toString());
    if (out.contains('{prediction}')) {
      final p = ctx.predictionRangeLabel;
      out = out.replaceAll(
          '{prediction}',
          p ??
              (lang == 'tr'
                  ? 'henüz tahmin için yeterli veri yok (en az 2 tam döngü gerekir)'
                  : 'there is not enough data for a prediction yet (at least 2 full cycles needed)'));
    }
    return out;
  }

  String _normalize(String s) => s
      .toLowerCase()
      .replaceAll('ı', 'i')
      .replaceAll('ğ', 'g')
      .replaceAll('ü', 'u')
      .replaceAll('ş', 's')
      .replaceAll('ö', 'o')
      .replaceAll('ç', 'c');
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
          'Ara sıra gecikme çok yaygındır: stres, seyahat, hastalık, uyku düzeni ve kilo değişimi ovülasyonu kaydırabilir — regl de onunla birlikte kayar. Ortalama döngün {meanLength} gün ve şu an döngünün {cycleDay}. günündesin. Tahmini penceren: {prediction}. Gecikme birkaç haftayı bulur, tekrarlar ya da seni endişelendirirse bir sağlık profesyoneline danışmak iyi bir fikirdir.',
      'en':
          'An occasional late period is very common: stress, travel, illness, sleep changes, and weight shifts can move ovulation — and your period moves with it. Your average cycle is {meanLength} days and you are on day {cycleDay}. Your estimated window: {prediction}. If a delay stretches to weeks, keeps repeating, or worries you, checking in with a clinician is a good idea.',
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
    sampleQuestion: {
      'tr': 'Ovülasyonum ne zaman?',
      'en': 'When do I ovulate?',
    },
    answer: {
      'tr':
          'Ovülasyon genelde bir sonraki reglden yaklaşık 14 gün önce olur — döngü başından itibaren değil, sondan geriye sayılır. Şu an döngünün {cycleDay}. günündesin; tahmini pencerene göre hesaplıyorum: {prediction}. Bunlar tahmindir, kesin gün vermek dürüst olmaz — vücut belirtileri (servikal mukus, bazal sıcaklık) tabloyu netleştirebilir.',
      'en':
          'Ovulation typically happens about 14 days *before* your next period — counted back from the end, not forward from the start. You are on cycle day {cycleDay}; based on your estimated window: {prediction}. These are estimates — naming an exact day would be false precision. Body signs (cervical mucus, basal temperature) can sharpen the picture.',
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
          '21–35 gün arası döngüler tipik kabul edilir ve döngüden döngüye birkaç günlük fark tamamen normaldir. Şu ana kadar {cyclesLogged} döngü kaydettin; ortalaman {meanLength} gün. Döngülerin sürekli 21 günden kısa, 35 günden uzunsa ya da düzen aniden değiştiyse, bir hekimle konuşmak iyi olur — bu bir teşhis değil, sadece makul bir sonraki adımdır.',
      'en':
          'Cycles between 21–35 days are considered typical, and a few days of variation cycle-to-cycle is completely normal. You have logged {cyclesLogged} cycles so far; your average is {meanLength} days. If cycles are consistently shorter than 21 or longer than 35 days, or the pattern changed suddenly, talking to a clinician is sensible — not a diagnosis, just a reasonable next step.',
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
    sampleQuestion: {
      'tr': 'PMS neden olur?',
      'en': 'What causes PMS?',
    },
    answer: {
      'tr':
          'Regl öncesi progesteron ve östrojenin hızla düşmesi; duygu durumu, uyku ve iştahı etkileyebilir — PMS dediğimiz şey bu geçiş döneminin belirtileridir ve kanama başladıktan bir-iki gün sonra genelde hafifler. Düzenli uyku, hareket ve kaydettiğin belirtilere bakıp kendi örüntünü tanımak gerçekten yardımcı olur. Belirtiler hayatını ciddi etkiliyorsa (PMDD olasılığı) bir hekime danışmak önemli.',
      'en':
          'The rapid drop in progesterone and estrogen before a period can affect mood, sleep, and appetite — PMS is the set of symptoms from that transition, and it usually eases within a day or two of bleeding starting. Regular sleep, movement, and spotting your own pattern in your logs genuinely help. If symptoms seriously disrupt your life (possible PMDD), talking to a clinician matters.',
    },
  ),
  _Topic(
    keywords: ['yogun', 'heavy', 'asiri kanama', 'cok kanama', 'pihtili', 'clot'],
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
    keywords: ['tahmin nasil', 'prediction', 'how does vera', 'nasil hesap', 'nasil tahmin', 'dogru mu'],
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
    keywords: ['veri', 'mahremiyet', 'gizlilik', 'privacy', 'data', 'guvenli', 'secure', 'sunucu', 'server'],
    sampleQuestion: {
      'tr': 'Verilerim güvende mi?',
      'en': 'Is my data safe?',
    },
    answer: {
      'tr':
          'Verilerin yalnızca bu cihazda, AES-GCM ile şifreli durur; anahtar telefonunun güvenli donanımında (Keychain/Keystore) saklanır. Uygulamanın internet izni bile yok — bunu telefonunun ayarlarından kendin doğrulayabilirsin. Ben de dahil: bu sohbet tamamen cihazında çalışır, hiçbir soru veya cevap dışarı gitmez.',
      'en':
          'Your data lives only on this device, encrypted with AES-GCM; the key sits in your phone\'s secure hardware (Keychain/Keystore). The app does not even have internet permission — you can verify that yourself in your phone\'s settings. That includes me: this chat runs entirely on-device, and no question or answer ever leaves it.',
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
    keywords: ['doktor', 'hekim', 'clinician', 'when should i see', 'ne zaman git'],
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
];
