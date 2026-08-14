# Vera (kod adı: cycle/cycle_app) — Proje Talimatları

Mahremiyet-önce adet ve döngü takip uygulaması. Konumlanma: **"Verin telefonundan çıkmaz —
ve bunu kanıtlayabiliriz."** Flo'nun yapısal olarak kopyalayamayacağı şey budur: Flo'nun iş
modeli veriye dayanır, bizimki dayanmaz.

> Uygulama içi görünen ad **Vera** (2026-08-13'te seçildi — Latince "gerçek/doğru",
> dürüst tahmin ilkesini isme kodluyor). Dart paket adı/dizin adı/bundle id hâlâ
> `cycle`/`cycle_app`/`com.ufukemir.cycle_app` — bunları değiştirmek daha büyük bir
> refactor, mağaza hesapları açılmadan önce yapılabilir. Mağaza ASO taslağı:
> `docs/04-magaza-listesi.md`.

## Belgeler (önce bunları oku)
- `docs/01-mvp-spec.md` — DONDURULMUŞ özellik seti. Bu listede olmayan özellik yazılmaz.
- `docs/02-mimari.md` — veri modeli, şifreleme, tahmin motoru
- `docs/03-rakip-analizi.md` — Flo ve diğerleri: araştırma çıktısı
- `docs/04-magaza-listesi.md` — mağaza adı/altyazı/anahtar kelime taslağı (ASO)
- `docs/backlog.md` — kapsam dışı fikirler buraya

## Mimari ilkeler (değiştirilemez)

1. **Veri cihazdan çıkmaz.** Sunucu yok, hesap yok, e-posta yok, bulut senkronu yok.
   Kullanıcının kendi başlattığı dışa aktarma dışında veri hiçbir yere gitmez.
2. **Android'de `INTERNET` izni YOKTUR.** Bu, pazarlama sözü değil; kullanıcının manifest'ten
   kendi doğrulayabileceği teknik kanıttır. Bir özellik ağ gerektiriyorsa o özellik yazılmaz.
3. **Üçüncü taraf SDK yok.** Analitik yok, çökme raporlama yok, reklam yok, attribution yok.
   Bağımlılık eklemeden önce: bu paket ağ açar mı, telemetri gönderir mi? Gönderiyorsa girmez.
4. **Diskte şifreli.** Tüm döngü verisi AES-GCM ile şifrelenir; anahtar Keychain/Keystore'da
   (donanım destekli). Cihaz yedeklerine düz metin sızmaz.
5. **Dürüst tahmin.** Sahte kesinlik yasak. Tahmin daima belirsizlik aralığıyla gösterilir
   ("28–31 Ağustos arası", tek bir gün değil). Veri azsa/döngü düzensizse bunu açıkça söyleriz.
6. **Sömürücü paywall yok.** Karanlık desen yok, sahte geri sayım yok, iptali zorlaştırma yok.
   Çekirdek takip özellikleri daima ücretsiz kalır.
7. **Tıbbi teşhis değil.** Uygulama tanı koymaz, gebeliği önleme yöntemi olarak sunulmaz.
   Bu iddialar tıbbi cihaz regülasyonunu tetikler (bkz. Natural Cycles / FDA). Sınırın
   dışında kalırız.

## Teknik kurallar
- Flutter (`app/` dizini). iOS + Android eşit öncelikli.
- Depolama: şifreli yerel dosya deposu; repository arayüzü arkasında (sonradan SQLCipher'a
  geçiş UI'a dokunmadan mümkün olsun).
- Bildirimler yereldir (`flutter_local_notifications`), sunucu push YOK.
- UI dili: sistem dilini takip eder, kullanıcı ayarlardan değiştirebilir. Desteklenen diller
  büyüyor (bkz. `lib/l10n/`) — her yeni dil gerçek çeviri kalitesi iddiası taşımaz, MVP
  hızında makine/LLM çevirisiyle başlar; yayın öncesi anadili konuşan gözden geçirmesi
  önerilir. Kod/commit dili: İngilizce. Ufuk'la konuşma: Türkçe.
- Fontlar (Quicksand, Fraunces) `assets/fonts/`'ta yerel paketlenir, `google_fonts`
  paketinin çalışma zamanı ağ indirmesi KULLANILMAZ — ilke 2'yi ihlal eder.
- Test: tahmin motoru, şifreleme katmanı ve saf servisler için test zorunlu.
  `cd app && flutter test`.

## Görsel tasarım ilkeleri
- **2026-08-13'te yön değişti**: ilk sürümün nötr teal/slate paleti (trans/non-binary
  kapsayıcılığı gerekçesiyle) kullanıcı talebiyle terk edildi. Yeni palet sıcak/"kadınsı"
  (gül/mercan/altın, bkz. `lib/theme/app_theme.dart`) ama kapsayıcılık kaygısı tamamen
  atılmadı: çocuksu pembe-çiçek klişesinden kaçınılır, cinsiyetlendirilmiş dil (ilke aşağıda)
  hâlâ geçerlidir. Sıcak renk ile kapsayıcı dil çelişmez.
- **Rakiplerden fikir/desen almak serbest, varlık kopyalamak YASAK.** Döngü halkası
  görselleştirmesi, onboarding illüstrasyon akışı gibi UX kalıpları kategori genelinde
  ortak ve kopyalanabilir. Gerçek görsel/fotoğraf/metin varlıkları asla kopyalanmaz —
  telif ihlali. Görseller ya elle kodlanmış orijinal vektör (CustomPainter/SVG) ya da
  açık lisanslı (OFL, CC0) kaynaklardır; kaynak/lisans her zaman not edilir.
- Animasyon önemli bir tasarım aracıdır (geçişler, mikro-etkileşimler, kutlama anları)
  ama asla bilgiyi gizleyecek/geciktirecek şekilde kullanılmaz — dürüst tahmin ilkesi
  (ilke 5) animasyonlu bir ekranda da geçerlidir.

## Ton ve içerik kuralları
- Kullanıcının neden takip ettiğine dair varsayım yapma. Gebe kalmaya çalıştığı varsayılmaz.
- Beden imajı, "güzellik", utandırıcı dil yok. Sıcak ama saygılı; asla küçümseyici/çocuksu.
- Cinsel içerikli sorular varsayılan olarak KAPALI; kullanıcı açarsa gelir.
- Cinsiyet dili kapsayıcı; uygulama "kadın" varsaymadan çalışır.
- Bilgilendirici içerik (ör. "biliyor muydun" kartları) her zaman doğru, kaynaklanabilir,
  tanı koymayan dille yazılır — ilke 7 bilgilendirici içerikte de geçerlidir.
