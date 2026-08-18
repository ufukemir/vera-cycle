# Vera (kod adı: cycle/cycle_app) — Proje Talimatları

Adet ve döngü takip uygulaması. Konumlanma (2026-08-14'te revize): **"Sağlık verilerin
telefonunda şifreli kalır — hesap yok, bulut yok."** Ücretsiz sürüm reklam destekli,
Premium reklamları kaldırır.

> **ÖNEMLİ İLKE REVİZYONU (2026-08-14, Ufuk'un kararı):** Aşağıdaki 1-2-3 numaralı
> ilkeler yumuşatıldı. Ufuk ücretsiz sürüme GERÇEK reklam (AdMob), abonelik ekranı,
> gebelik takip modu ve partner özelliği istedi. Reklam SDK'sı INTERNET izni
> gerektirdiğinden "internet izni bile yok" iddiası ARTIK GEÇERSİZDİR ve uygulama
> içinde/mağaza metinlerinde KULLANILMAZ. Yeni dürüst iddia: "Döngü/sağlık verilerin
> yalnızca cihazında, şifreli durur; hesap yok, bulut senkronu yok. Ücretsiz sürümde
> reklamlar Google AdMob üzerinden gösterilir ve AdMob kendi çerçevesinde cihaz
> tanımlayıcıları işleyebilir." Sağlık verisi hiçbir zaman reklam ağına GÖNDERİLMEZ.

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

## Mimari ilkeler (2026-08-14 revizyonuyla)

1. **Sağlık verisi cihazdan çıkmaz.** Sunucu yok, hesap yok, e-posta yok, bulut senkronu
   yok. Kullanıcının kendi başlattığı dışa aktarma/paylaşma dışında sağlık verisi hiçbir
   yere gitmez. Reklam SDK'sının kendi trafiği bu kapsamda değildir ama ona ASLA sağlık
   verisi, döngü bilgisi veya türevi sinyal verilmez.
2. ~~Android'de INTERNET izni yoktur~~ **(REVİZE)** INTERNET izni yalnızca reklam SDK'sı
   için vardır. Uygulamanın kendi kodu ağ çağrısı YAPMAZ; bunun regresyon testi
   `android_manifest_test.dart`'ta izin listesi sabitlemesiyle sürer.
3. ~~Üçüncü taraf SDK yok~~ **(REVİZE)** Tek istisna: Google Mobile Ads. Analitik,
   **çökme raporlama** ve attribution SDK'sı hâlâ YASAK — 2026-08-17'de yeniden
   değerlendirildi ve reddedildi: reklamı kullanıcı görür, çökme raporlayıcı
   görünmezdir; sağlık uygulamasının arka planda sessizce veri göndermesi
   "verin cihazından çıkmaz" sözünü doğrulanamaz hale getirir. Yerine yerel
   çökme günlüğü + kullanıcı onaylı paylaşım var (`crash_log.dart`), ve asıl
   koruma her ekranı açan duman testi (`all_screens_smoke_test.dart`). Yeni bağımlılık eklemeden önce aynı
   soru sorulur: ağ açar mı, telemetri gönderir mi?
4. **Diskte şifreli.** Tüm döngü verisi AES-GCM ile şifrelenir; anahtar Keychain/Keystore'da
   (donanım destekli). Cihaz yedeklerine düz metin sızmaz.
5. **Dürüst tahmin.** Sahte kesinlik yasak. Tahmin daima belirsizlik aralığıyla gösterilir
   ("28–31 Ağustos arası", tek bir gün değil). Veri azsa/döngü düzensizse bunu açıkça söyleriz.
6. **Sömürücü paywall yok.** Premium ekranı vardır (2026-08-14) ama karanlık desen yok:
   sahte geri sayım yok, sahte indirim yok, sahte kullanıcı sayısı yok, iptali
   zorlaştırma yok. Çekirdek takip özellikleri daima ücretsiz kalır.
   **Premium kapsamı (2026-08-17'de genişletildi, Ufuk'un kararı):** reklamsız
   deneyim + özel takip alanları + gelişmiş içgörüler + kendi hatırlatıcıların +
   ek arka planlar/maskotlar. Test edilebilir kural: *Premium bir şey EKLER,
   asla var olanı geri almaz.* Kullanıcının geçmiş verisi ve onun temel
   istatistikleri (ortalama döngü/regl uzunluğu, takvim, dışa aktarma) hiçbir
   koşulda paywall arkasına konmaz — kategorinin en büyük güven kırıcısı budur
   (bkz. `docs/03-rakip-analizi.md`). Abonelik biterse kullanıcı ücretsiz bir
   arka plana düşer, hiçbir kaydını kaybetmez. Bunu `premium_gating_test.dart`
   sabitler.
   **Kilitli durumun kuralı (2026-08-18 denetiminde eklendi):** `PremiumLock`
   kilitliyken `child`'ı hiç kurmaz, bu yüzden kullanıcının KENDİ yazdığı veri
   o ağacın içindeyse görünmez olur. Premium'a bağlanan her bölüm, kullanıcının
   zaten kaydettiği şeyi salt-okunur gösteren bir `lockedPreview` vermek
   zorundadır; kendi verisini yönetme (silme/yeniden adlandırma/kapatma) yolu
   da açık kalır — Premium sadece YENİ ekleme yeteneğidir. "Ekler, geri almaz"
   kuralı görünürlüğü de kapsar.
7. **Tıbbi teşhis değil.** Uygulama tanı koymaz, gebeliği önleme yöntemi olarak sunulmaz.
   Gebelik modu (2026-08-14) bilgilendirme amaçlıdır: gebelik yaşı/tahmini doğum tarihi
   SAT'a dayalı kaba hesaptır ve bunu açıkça söyler; tıbbi takip yerine geçmez.

## Teknik kurallar
- Flutter (`app/` dizini). iOS + Android eşit öncelikli.
- Depolama: şifreli yerel dosya deposu; repository arayüzü arkasında (sonradan SQLCipher'a
  geçiş UI'a dokunmadan mümkün olsun).
- Bildirimler yereldir (`flutter_local_notifications`), sunucu push YOK.
  **Saat kuralı (2026-08-18):** `tz.local`, `flutter_timezone` ile cihazın
  gerçek IANA saat dilimine ayarlanır; lookup başarısız olursa UTC'ye düşer ve
  hatırlatıcı yine doğru anda çalar (sadece yaz saati takibini kaybeder).
  Ateşleme anı buna rağmen ASLA doğrudan `tz.TZDateTime(tz.local, ...)` ile
  kurulmaz — önce düz bir yerel `DateTime`, sonra `.toUtc()`
  (`nextOccurrenceOf`); bu, UTC'ye düşülen durumda da doğru kalan tek kuruluş.
  Bunu ihlal eden günlük planlama yolları Türkiye'de hatırlatıcıyı 3 saat geç
  çalıştırıyordu (`reminder_service_test.dart` sabitler).
  **`flutter_timezone` istisnası:** ilke 3'e karşı tartılıp kabul edildi —
  soket açmıyor, telemetri göndermiyor, işletim sisteminden tek bir string
  okuyor. Analitik/çökme-raporlama SDK'sıyla aynı sınıfta değildir.
- Kullanıcının yazdığı serbest metin (hatırlatıcı etiketleri) `shared_preferences`'ta
  ŞİFRESİZ durur. Bu kabul edilebilir çünkü OS yedeği hem bulut hem cihaz-transferi
  için tamamen kapalıdır (`data_extraction_rules.xml`, `android_manifest_test.dart`
  sabitler). "Her şeyi sil" bu metinleri de siler.
- Yerelleştirme değişmezleri (2026-08-18 denetiminde eklendi, hepsi testli):
  sayı ve ondalık ayracı `util/number_format.dart` üzerinden **yerele göre**
  biçimlendirilir (`toStringAsFixed` doğrudan kullanılmaz — hep nokta basar);
  sayı içeren metinler ICU çoğul olur (Arapça altı, Slav dilleri dört form);
  hafta başlangıcı ve dil tercihi cihaz yereline düşer, dil tercihi tam
  BCP-47 etiketi saklar (`zh-Hans`, `pt-BR` ayrılabilsin diye); doktor PDF'i
  gömülü Unicode font kullanır (gömülü font yoksa `pdf` paketi sessizce
  çarpı işaretli kutu çizer, hata fırlatmaz).
- UI dili: sistem dilini takip eder, kullanıcı ayarlardan değiştirebilir. **Yalnızca
  %100 çevrilmiş diller listelenir** (`lib/l10n/`); kısmen çevrilmiş olanlar
  `l10n_pending/`'de bekler. Yarım çeviri = kullanıcıya karışık dilli ekran, bu
  yüzden "önce ekle sonra tamamla" yapılmaz. Sağlık terimlerinde makine çevirisi
  yanıltıcı olabilir; yeni dil için anadili konuşan gözden geçirme şart.
- Kod/commit dili: İngilizce. Ufuk'la konuşma: Türkçe.
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
- **Asistanın cinsiyeti YOKTUR — kişiliği de yoktur (2026-08-18, Ufuk'un kararı).**
  "Vera bir üründür, bir kişi değil." Dilbilgisel olarak cansız/nötr davranılır; dilin
  nötr seçeneği yoksa kişisel olmayan yapı kullanılır. Gerekçe: (a) uygulama kullanıcının
  kadın olduğunu varsaymamak için özel çaba harcıyor, asistana dişil kimlik vermek aynı
  varsayımı bir kat yukarıda geri getirir; (b) asistanın en güçlü tarafı kendisi hakkında
  doğruyu söylemesi ("bulut yapay zekâsı değilim, uydurmam") — üstüne kişilik kurgusu
  eklemek bunu zayıflatır; (c) 36 dilde her cinsiyetli dil ayrı karar ve ayrı tutarsızlık
  demektir. Sıcaklık kişilikten değil kelime seçiminden gelir.
  Yanlış: `لستُ طبيبة`, `No soy médica`, `Vera-Assistentin`, `जवाब दे सकती हूँ`.
  Doğru: "Bu tıbbi tavsiye değildir", "Vera yazıyor…", "Cevaplar cihazındaki bilgi
  tabanından gelir". Yeni dil eklerken bu kural ajanlara bağlayıcı olarak verilir.
- Kullanıcının neden takip ettiğine dair varsayım yapma. Gebe kalmaya çalıştığı varsayılmaz.
- Beden imajı, "güzellik", utandırıcı dil yok. Sıcak ama saygılı; asla küçümseyici/çocuksu.
- Cinsel içerikli sorular varsayılan olarak KAPALI; kullanıcı açarsa gelir.
- Cinsiyet dili kapsayıcı; uygulama "kadın" varsaymadan çalışır.
- Bilgilendirici içerik (ör. "biliyor muydun" kartları) her zaman doğru, kaynaklanabilir,
  tanı koymayan dille yazılır — ilke 7 bilgilendirici içerikte de geçerlidir.
