# Backlog — v1 kapsamı dışı fikirler

v1'in dondurulmuş kapsamı `01-mvp-spec.md`'de. Buradaki hiçbir şey v1'e
girmez. Sıralama, küçük bir ekip için ne kadar savunulabilir/taklit
edilmesi zor olduğuna göre (pazar araştırmasından, bkz. `03-rakip-analizi.md`).

## Regülasyona takılmadan eklenebilir (öncelik sırasına göre)

1. **Cihaz-üstü AI sohbet** — kullanıcının kendi loglanmış verisi üzerinde,
   sunucuya hiç gitmeden. Rakiplerin "AI" özellikleri (GlowGPT, Maven
   Intelligence) hep buluta dayalı; gerçekten cihaz-üstü olan bir asistan
   parite değil gerçek bir farklılaşma olur.
2. **Döngü-senkronlu fitness/beslenme ipuçları** — Wild.AI/FitrWoman
   modeli. Eklemesi ucuz, regülasyon riski sıfır, "hesapsız/sunucusuz"
   konumlanmayla iyi örtüşüyor (Oura/Whoop bunu asla eşleyemez, onlar
   hesap+bulut gerektiriyor).
3. **Hamilelik içerik/takip modu** — en büyük hazır içerik kütüphanesi
   fırsatı, düşük regülasyon riski, mevcut kullanıcılar için doğal sonraki
   yaşam evresi.
4. **Perimenopoz/menopoz takip+içerik** — dikkatli girilmeli: Flo bunu
   2025-2026'da en kalabalık kategoriye çevirdi. Mahremiyetle kazanmak
   lazım, ilk olmakla değil.
5. **PCOS/endometriozis eğitici kontrol listeleri** (tanı koymadan, Flo'nun
   "Endometriosis Digital Symptom Checker" ifade tarzı örnek alınabilir) —
   gerçek farklılaşma ama bir tıbbi danışman gerektiriyor (ilk sabit
   maliyet).
6. **Doğum sonrası/bebek takibi** — düşük regülasyon riski ama içerik
   üretim yükü gerçek; satın al/lisansla, sıfırdan yazma.
7. **Topluluk/akran desteği** (Peanut/Perry modeli) — en düşük öncelik;
   moderasyon pahalı ve "sunucu yok/hesap yok" ilkesiyle felsefi olarak
   çelişiyor. Muhtemelen hiç eklenmemeli.

## Asla eklenmemeli (küçük bir ekip için ulaşılamaz veya ilkelerle çelişiyor)

- **Gebeliği önleme iddiası** — anında FDA/CE Sınıf II tıbbi cihaz
  bölgesi (bkz. Natural Cycles emsali).
- **Hormon ölçen donanım** (Mira/Inito/Oova/Ava modeli) — 510(k)/CE-IVD
  regülasyonu tetikler.
- **Gerçek telesağlık/reçete** (Nurx/Wisp/Midi modeli) — klinik lisans,
  eyalet bazlı hukuk uyumu, farklı bir şirket demek.
- **PCOS/endometriozis için tanı iddiası** (kontrol listesi değil, teşhis).
- **Pelvik taban biofeedback donanımı** (Perifit/Elvie modeli) — sensör +
  terapötik iddia = cihaz regülasyonu.

## Diğer notlar

- Uygulama adı/marka henüz kesinleşmedi (`CLAUDE.md`'de not edildi) —
  mağaza çakışma kontrolü sonrası netleştirilecek.
- İslami fıkıh katmanı (hayız/istihaza/nifas, kaza namaz-oruç takibi)
  kasıtlı olarak v1 dışında tutuldu (kullanıcı "mahremiyet-önce herkes
  için" konumlanmasını seçti). Pazar boşluğu gerçek ve doğrulandı — bkz.
  `03-rakip-analizi.md`. İleride katmanlı/opsiyonel bir modül olarak
  eklenmesi değerlendirilebilir (Halis projesindeki mezhep profili
  altyapısından ilham alınabilir).
