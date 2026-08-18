# 01 — MVP Spesifikasyonu

Bu listede olmayan özellik v1'e girmez. Yeni fikirler `backlog.md`'ye yazılır.

> **Güncelleme notu (2026-08-13):** İlk sürüm burada "DONDURULMUŞ" olarak
> tanımlanmıştı. Kullanıcı, mağazada en çok kullanılan rakip uygulamalardan
> birinin (ekran görüntüleri + ekran kaydıyla) örnek alınarak kapsamın
> zenginleştirilmesini açıkça istedi — "telif yemeyeceğimiz şekilde
> kopyalayabilirsin" (UX kalıpları/bilgi mimarisi serbest, gerçek
> görsel/metin varlığı asla). Aşağıdaki liste artık bu genişletilmiş kapsamı
> yansıtıyor; mimari ilkeler (CLAUDE.md) ve "v1 KAPSAM DIŞI" sınırları
> değişmedi — sadece her ilkenin içi zenginleşti (bkz. `lib/screens/`,
> özellikle `day_log/`, `onboarding/`, `calendar/`, `settings/`).

## Ürün tek cümlede
Adet döngünü, sağlık verin telefonundan hiç çıkmadan takip et — ve tahminlerin
sana dürüst olsun.

## Neden var (farklılaşma tezi)
| Flo'nun zaafı | Bizim cevabımız |
|---|---|
| FTC cezası, veri paylaşımı geçmişi, güven açığı | Hesap yok, sunucu yok, sağlık verisi cihazdan çıkmaz |
| Sahte kesinlik ("adetin 14 Mart'ta") | Belirsizlik aralığı + güven seviyesi |
| Agresif paywall, iptal zorluğu | Çekirdek takip daima ücretsiz, karanlık desen yok |
| Şişkin arayüz, alakasız içerik akışı | Sade; içerik akışı yok |
| Herkesi gebe kalmak isteyen sayan ton | Amaç sorulmaz, varsayılmaz |

## v1 kapsamı

### 1. Kurulum (onboarding)
- Bir ekran: mahremiyet sözü — düz dilde, hukuk dili değil.
- Amaç seçimi: regl takibi / gebe kalmaya çalışıyorum / gebelik takibi
  (tek dokunuşla ilerleyen kart seçimi — sadece hafif kişiselleştirme için,
  hiçbir çekirdek özelliği kilitlemez; bkz. `Goal` enum'ı).
- 3 döngü sorusu (hepsi "bilmiyorum" ile geçilebilir): son adet başlangıcı,
  tipik döngü uzunluğu, tipik adet süresi.
- 2 sohbet niteliğinde evet/hayır/emin değilim sorusu (düzensizlik, kramp) —
  cevapları hiçbir yerde saklanmaz veya tahmine karıştırılmaz, sadece
  akışı daha sıcak hissettirir.
- Bildirim izni için önce uygulama-içi gerçekçi bir önizleme (gerçek OS
  isteminden önce), sonra gerçek izin isteği.
- Zorunlu PIN kurulumu, ardından kısa "senin için hazırlanıyor" animasyonu.
- Hesap yok, e-posta yok, sunucu yok.

### 2. Ana ekran
- Döngünün kaçıncı günü + evre (adet / foliküler / ovülasyon penceresi / luteal).
- Sonraki adet tahmini **aralık olarak** + güven göstergesi (yüksek/orta/düşük).
- Tek dokunuşla "bugün adet başladı" kaydı.

### 3. Gün kaydı
- Üstte hızlı istatistik kartları: su (dokunuşla +250ml), uyku, kilo —
  varsayılan açık, opsiyonel takip gruplarından ayrı.
- Akış: leke / hafif / orta / yoğun.
- Semptomlar: kramp, baş ağrısı, şişkinlik, göğüs hassasiyeti, akne, yorgunluk, bulantı,
  bel ağrısı, iştah değişimi, uyku sorunu, pelvik ağrı, baş dönmesi (çoklu seçim).
- Ruh hali: nötr etiketlerle (sakin, kaygılı, sinirli, düşük, enerjik, mutlu,
  huzurlu, üzgün, çökkün, duygusal).
- Enerji seviyesi: düşük/orta/yüksek/enerjik — ruh halinden ayrı bir eksen.
- Cilt & saç gözlemleri (çoklu seçim, tanı değil): parlaklık, kızarıklık,
  kuruluk, yağlanma, iyi/kötü saç günü, saç dökülmesi, yağlı saç derisi.
- İlaçlar: serbest metin liste (ekle/sil).
- Not alanı (serbest metin).
- **Opsiyonel, varsayılan KAPALI**: cinsel aktivite, bazal vücut sıcaklığı,
  servikal mukus, kendi kendine meme muayenesi, servikal pozisyon/açıklık/sertlik.
  Mukus takibi açıksa gün kaydında son 3 kaydın kısa özeti gösterilir.
- Gün, tahmini doğurgan pencere/ovülasyon içindeyse ekranın üstünde dürüst
  dilli bir bilgi kartı çıkar (her zaman "tahmindir, gebelikten korunma
  yöntemi değildir" notuyla).

### 4. Takvim
- Ay görünümü; gerçekleşen adet günleri, tahmin edilen adet penceresi ve
  tahmini doğurgan pencere görsel olarak AYRI (halka renkleri legend'da).
- Doğurgan pencere içindeki tek bir gün, tahmini ovülasyon günü olarak küçük
  bir nokta rozetiyle işaretlenir — pencerenin geri kalanı yine tek tip
  stillenir, "en olası gün" vurgusu yapılmaz (yanlış kesinlik ilkesi).
- Geçmiş güne dokunup geriye dönük kayıt/düzeltme.

### 5. Tahmin motoru (cihazda)
- İstatistiksel: son N döngünün ortalaması + standart sapması.
- Çıktı daima bir aralık. Sapma yüksekse aralık genişler ve güven "düşük" olur.
- 2 döngüden az veri varsa tahmin yapılmaz; "henüz yeterli veri yok" denir.
- Düzensizliği gizlemez; nazikçe işaret eder (tanı koymadan).

### 5b. Cihaz-üstü asistan (sohbet sekmesi)
- Küratörlü, elle yazılmış bilgi tabanı üzerinde anahtar-kelime eşleştirmeli
  soru-cevap (~22 konu; TR+EN tam içerik, diğer diller İngilizceye düşer).
- Cevaplar kullanıcının kendi verisiyle kişiselleşir (döngü günü, ortalama,
  tahmin penceresi) ama asla tanı koymaz; sohbet geçmişi bilerek KAYDEDİLMEZ.
- **Kişiselleştirme kuralı (2026-08-18):** her yer tutucu kendi birimini ve
  gerekirse kendi yan cümlesini taşır; "veri yok" hâli de tam bir cümle olarak
  okunmalıdır. Ayrıca ovülasyon penceresi regl penceresinden AYRI bir alandır
  (`ovulationRangeLabel`) — ikisi ~14 gün arayla olduğu için birini diğerinin
  yerine göstermek kullanıcıya yanlış tarihi tam bir güvenle söylemek olur.
- Bulut LLM (Gemini vb.) bilinçli olarak KULLANILMAZ: sağlık sorularını
  üçüncü tarafa göndermek, döngü verisinin cihazdan çıkmaması sözünü bozar
  (uygulamada INTERNET izni artık var ama yalnızca reklam SDK'sı için).

### 6. İçgörüler
- Ortalama döngü uzunluğu, değişkenlik, ortalama adet süresi, kayıtlı döngü sayısı.
- Basit semptom örüntüsü: "kramplar en çok 1-2. günlerde". Bir şeyin "örüntü"
  sayılması için en az 2 AYRI döngüde tekrar etmesi gerekir (2026-08-18):
  tek bir döngüde arka arkaya 4 gün kaydedilen şey bir olaydır, örüntü değil.
- Döngü uzunluğu eğilimi ancak 6 tam döngüden sonra raporlanır (her üçte bir
  grubunda en az 2 döngü olsun diye) ve karşılaştırılan grup büyüklüğü metinde
  açıkça yazılır. Yeterli veri yokken "aynı kaldı" DENMEZ — bu ikisi ayrı
  cümledir.
- Döngü evresine göre hareket/beslenme önerileri (bkz. `docs/backlog.md`
  madde 2) — tamamen yerel/statik içerik, hedge'lenmiş dille ("genelde",
  "bazı kişiler"), asla kişiselleştirilmiş tıbbi tavsiye gibi sunulmaz.

### 7. Mahremiyet özellikleri (ürünün kalbi)
- Uygulama kilidi: biyometrik + PIN yedeği.
- Diskte AES-GCM şifreleme, anahtar Keychain/Keystore'da.
- Ayarlarda görünür "Mahremiyet" ekranı: hangi verinin nerede durduğunu düz dille anlatır.
- **Tüm veriyi sil**: gerçek, geri dönüşsüz, tek dokunuş uzağında.

### 8. Dışa aktarma
- Şifreli yedek dosyası (kullanıcı parolasıyla) — cihaz değiştirince geri yükleme.
- Doktor için sade rapor: CSV + yazdırılabilir PDF özet. PDF'te her döngü
  için renkli yatay zaman çizelgesi çubuğu (regl günleri / döngünün geri
  kalanı) — düz tablonun yanında, göz taramasını kolaylaştırmak için.
- Paylaşım daima kullanıcının başlattığı sistem paylaşım sayfası üzerinden.

### 9. Ayarlar
- Dil: **tamamen çevrilmiş 7 dil** (EN/TR/AR/ES/FR/DE/ID), varsayılan
  sistem dili. Sekiz dil daha (%15 çeviriyle) `l10n_pending/`'de bekliyor
  — yarım çevrilmiş dili listelemek, o dili hiç sunmamaktan kötü bir
  deneyim olduğu için listeden çıkarıldılar (bkz. o klasördeki README).
- Hafta başlangıcı, sıcaklık birimi.
- Şeffaf "Tahmin Ayarları" ekranı: kullanıcının kendi bildirdiği regl/döngü
  uzunluğu (sadece süs — CycleRing'i ölçekler, tahmine karışmaz) ile luteal
  faz uzunluğu (gerçek girdi — PredictionEngine'in doğurgan pencereyi
  yerleştirmesinde kullanılır) açıkça ayrı gösterilir.
- Ayrıntılı yerel hatırlatıcı kategorileri, her biri kendi açma/kapama ve
  saatiyle: yaklaşan adet başlangıcı, tahmini adet bitişi, ilaç, su,
  randevu (tek seferlik, tarih+saat seçilir). Hepsi varsayılan kapalı.

### 10. Gelir modeli ve gebelik modu (2026-08-14 eklendi)
- **Reklam destekli ücretsiz sürüm**: Google AdMob banner'ı ana ekranın altında.
  Uygulamanın kendi kodu ağ çağrısı yapmaz; reklam SDK'sına sağlık verisi
  ASLA verilmez. `INTERNET` izni yalnızca bunun için vardır.
- **Vera Premium** (kapsam 2026-08-17'de genişletildi): reklamları kaldırır
  ve dört özellik ekler:
  1. **Özel takip alanları** — kullanıcının kendi adlandırdığı etiketler.
     Etiket listesi ayrı saklanmaz, şifreli günlüklerden türetilir (ilke 4:
     kullanıcının yazdığı sağlık terimi `shared_preferences`'a yazılmaz).
     Ayarlar'dan yeniden adlandırma/silme; ikisi de geçmişi yeniden yazar.
  2. **Gelişmiş içgörüler** (`advanced_insights.dart`) — semptomun döngünün
     hangi bölümünde yoğunlaştığı, uzunluk trendi ve kayma, bölüme göre
     baskın ruh hali. İki dürüstlük kuralı: 3 tam döngüden önce hiçbir şey
     söylenmez, ve berabere kalan bölümlerde "belirgin zamanlaması yok" denir.
  3. **Kendi hatırlatıcıların** — kullanıcı metni + saat. Bildirim kimliği
     silinen hatırlatıcıdan devralınmaz. Metin kilit ekranında görüneceği
     için şifresiz saklanır ve bu ekranda açıkça söylenir.
  4. **Kişiselleştirme** — 4 ek arka plan, 2 ek maskot.
- Fiyat kartları, "iptal her zaman serbest" notu. Sahte geri
  sayım/indirim/kullanıcı sayısı YASAK olmaya devam eder (ilke 6).
  Faturalandırma SDK'sı henüz bağlı değil.
- **Test edilebilir sınır**: Premium EKLER, geri almaz. Kullanıcının geçmişi
  ve temel istatistikleri (ortalamalar, takvim, dışa aktarma) paywall arkasına
  konmaz; abonelik biterse ücretsiz arka plana dönülür, veri kaybı olmaz.
  `premium_gating_test.dart` bunu sabitler.
- **Gebelik modu**: SAT'a dayalı gebelik haftası, tahmini doğum tarihi
  (280 gün), trimester, haftalık bilgilendirme notu. Ultrason daha doğrudur
  ve bunu ekranda söyler.
- **Partner özeti**: canlı senkron/partner hesabı YOK. Kullanıcının kendi
  gönderdiği kısa metin özeti (evre + tahmini pencere), sistem paylaşım
  sayfasıyla.

## v1 KAPSAM DIŞI (net)
Topluluk/sosyal akış · canlı partner senkronu/partner hesabı · bulut senkron ·
hesap sistemi · giyilebilir cihaz entegrasyonu · menopoz modu · içerik/makale
akışı · sahte kullanıcı sayısı rozetleri · sahte geri sayım/indirim

## Bitti tanımı
- Tahmin motoru ve şifreleme katmanı testli.
- Android manifest'i yalnızca gözden geçirilmiş izinleri istiyor
  (`android_manifest_test.dart` izin listesini sabitliyor); uygulama reklam
  dışında uçak modunda tam çalışıyor.
- iOS ve Android'de kurulum → 3 döngü kaydı → tahmin → dışa aktarma akışı elle doğrulandı.
