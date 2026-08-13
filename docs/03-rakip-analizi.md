# 03 — Rakip Analizi (2026-08 araştırma özeti)

Bu belge, projeye başlarken yapılan çok-ajanlı pazar araştırmasının özetidir.
Ham raporlar çok daha uzundur; burada MVP kararlarını doğrudan etkileyen
bulgular tutuluyor. Tarihler ve rakamlar araştırma anına (2026-08) ait
anlık görüntülerdir, zamanla eskir.

## Flo — konumumuzu belirleyen referans nokta

- **Dağıtım**: Flo App Store/Play'de devasa (100M+ Play kurulumu, ~460M
  kayıtlı kullanıcı iddiası) ama **Türkiye'de zayıf** — TR App Store'da #15,
  74.649 yorum. Suudi Arabistan'da #21.
- **Dil boşluğu**: Flo 20 dil destekliyor, **Arapça/Urduca/Malayca/Farsça
  yok**. Bu boşluğu şu an dolduran ABISHKKING'in "Period & Cycle Tracker"ı —
  47 dilli ama hiçbir dini özelliği olmayan jenerik bir uygulama — ve
  Türkiye/Malezya'da Flo'yu geride bırakıyor (canlı chart verisiyle
  doğrulandı: TR #4 vs Flo #11, Malezya #3 vs Flo #8).
- **Hukuki/itibar yükü**: *Frasco v. Flo Health* davasında Ağustos 2025'te
  jüri Meta'yı sorumlu buldu (CIPA'nın ilk büyük jüri kararı); Flo 8M$'a
  uzlaştı (Temmuz 2025), Google 48M$. 2021 FTC cezası da cabası. Flo şimdi
  mağaza açıklamasında bir gizlilik ödülüyle bu geçmişi telafi etmeye
  çalışıyor.
- **Finansal ivme kaybı**: Gelir artışı %50 (2024) → %24 (2025); 2025'te
  22M$ zarar. "Kârlı unicorn" imajı artık gerçeği yansıtmıyor.
- **Perimenopoz'a genişleme**: Flo 2025-2026'da "Flo for Perimenopause"u
  büyük bir itişle piyasaya sürdü ve FDA-regüle tıbbi cihaz statüsüne
  geçiyor. Bu **bizim için bir uyarı**: onların girdiği regülasyon
  bataklığından uzak durmak avantaj, dezavantaj değil (bkz. CLAUDE.md ilke 7).

## Türkiye pazarı — asıl rakip Flo değil

- **Pepapp**: Türkiye'nin gerçek lideri. 241.735 TR App Store yorumu (Flo'nun
  3,2 katı), 1M+ Play kurulumu. "Türkiye'nin Dijital Kadın Asistanı"
  konumlanması, AstroPep burç özelliği + Pepzine içerik hub'ı ile elde
  tutma sağlıyor. Zayıf noktası: Play puanı 4.39 (iOS'ta 4.65).
- **beije**: DTC adet ürünü markasının companion app'i (Ocak 2025 lansman).
  **Hiç paywall yok** — gelir tamamen e-ticaret tarafından geliyor. KVKK/
  şeffaflık mesajıyla 19 ayda TR chart'ında ~#12-14'e çıktı ama puanı
  düşük (4.30) — mesaj doğru, uygulama cilası yetersiz kalmış.
- **Ders**: Dürüst/şeffaf mesaj Türkiye'de kanıtlanmış bir strateji
  (beije), ama tek başına yetmiyor — ürün kalitesi şart.

## Çapraz-uygulama şikayet örüntüleri (Flo, Clue, Glow, ABISHKKING, Pepapp dahil)

Önem sırasına göre (kaç farklı uygulama/kullanıcı grubunda tekrarlandığına göre):

1. **"28 günlük ders kitabı" varsayımı her yerde başarısız** — PCOS,
   perimenopoz, endometriozis, düzensiz döngü kullanıcıları hepsi aynı
   şikayeti yapıyor. *Bizim `PredictionEngine`'imiz bunu zaten çözüyor*:
   dürüst aralık + güven seviyesi, tek nokta tahmini yok.
2. **Kendi geçmiş verini paywall'a kilitleme** — Clue, Glow, Flo, hatta
   Pepapp'ta bile şikayet konusu. Evrensel bir güven kırıcı. *Bizim ilke
   6'mız ("çekirdek takip her zaman ücretsiz") bunu tam olarak hedefliyor.*
3. **Gizlilik güvensizliği** — reklam/analitik SDK paylaşımı (Flo→AppsFlyer→
   Pinterest/Snap), işveren erişimi (Ovia), Stardust'ın Mozilla'dan aldığı
   2/10 gizlilik puanı. *Bizim `INTERNET` izni bile olmayan mimarimiz bunu
   yapısal olarak imkansız kılıyor — pazarlama sözü değil, kanıtlanabilir.*
4. **Trans/non-binary kullanıcıları dışlayan pembe/çiçek varsayılan
   tasarım** — Clue tek istisna olarak gösteriliyor (nötr renk, kapsayıcı
   dil). *Bizim temamız da bilinçli olarak teal/slate, pembe değil.*
5. **Reklam/bildirim yorgunluğu** — Flo ve Glow'da yoğun şikayet; Pepapp
   ise tam tersi yönde, bildirim tonu için övgü topluyor. Kanıtlıyor ki bu
   çözülebilir bir sorun, kaçınılmaz bir maliyet değil.
6. **Yalnızca reklam/paywall değil: sadece gizlilik de tek başına
   ölçeklenmiyor** — açık kaynak `drip` ve `Periodical` yıllardır var,
   toplam kurulumları 100 binin altında. Mahremiyet bir *farklılaşma*
   olabilir ama tek başına bir *giriş kaması* değil; iyi bir ürünün üstüne
   binmesi gerekiyor.

## İslami/Müslüman uygulamalar — doğrulanmamış ama gerçek bir boşluk

En az 13-15 farklı "İslami adet takvimi" uygulaması var (Ayda, Nisaa,
MyHayd, Lunora, Tuhr, vb.), **neredeyse hepsi 0-46 yorum aralığında**. En
iyisi (Ayda) ~10K Play kurulumunda. Kategori dolmaya başlıyor ama hâlâ
gerçek anlamda kazanan yok.

**Önemli metodolojik not**: Bu alt-konudaki bazı spesifik rakamlar (Ayda'nın
tam kurulum sayısı, "en iyi ürün" hükmü vb.) araştırma zincirinde bir
ajan-arası iletişim sorunu nedeniyle bağımsız olarak doğrulanamadı ve
kasıtlı olarak nihai rapordan çıkarıldı — bkz. bu konuşmanın kayıtları.
Kategori genel görünümü (çok sayıda küçük, düşük-cilalı uygulama; net bir
lider yok) sağlam, ama tek tek rakamlara güvenmeden önce taze bir doğrulama
turu yapılmalı.

## Komşu kategoriler — v1'e girmeyecek ama savunulabilirlik sırasına göre not edildi

Bkz. `backlog.md`. Özet: hamilelik takibi ve döngü-senkronlu fitness en
düşük riskli/en kolay eklenebilir; perimenopoz artık Flo'nun girdiği en
kalabalık kategori; gerçek regülasyon tuzakları (gebeliği önleme iddiası,
hormon ölçen donanım, telesağlık) hiçbir zaman eklenmemeli.

## Sonuç: neden bu ürün kazanabilir

Flo'nun kopyalayamayacağı şey — çünkü iş modelleri veriye dayalı —
mahremiyeti *pazarlama sözü* değil *teknik kanıt* olarak sunmak
(`INTERNET` izni yok, açık kaynak felsefesiyle tutarlı mimari). Türkiye'de
asıl hedef Pepapp/beije'yi geçmek, global "herkes için mahremiyet"
hedefinden çok daha ulaşılabilir. Dürüst tahmin + sömürücü olmayan
paywall + nötr/kapsayıcı tasarım, araştırmada tekrar tekrar çıkan en geniş
şikayet örüntülerinin doğrudan cevabı.
