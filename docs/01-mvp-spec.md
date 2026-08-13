# 01 — MVP Spesifikasyonu (DONDURULMUŞ)

Bu listede olmayan özellik v1'e girmez. Yeni fikirler `backlog.md`'ye yazılır.

## Ürün tek cümlede
Adet döngünü, verin telefonundan hiç çıkmadan takip et — ve tahminlerin sana dürüst olsun.

## Neden var (farklılaşma tezi)
| Flo'nun zaafı | Bizim cevabımız |
|---|---|
| FTC cezası, veri paylaşımı geçmişi, güven açığı | Ağ izni bile yok; kullanıcı doğrulayabilir |
| Sahte kesinlik ("adetin 14 Mart'ta") | Belirsizlik aralığı + güven seviyesi |
| Agresif paywall, iptal zorluğu | Çekirdek takip daima ücretsiz, karanlık desen yok |
| Şişkin arayüz, alakasız içerik akışı | Sade; içerik akışı yok |
| Herkesi gebe kalmak isteyen sayan ton | Amaç sorulmaz, varsayılmaz |

## v1 kapsamı

### 1. Kurulum (onboarding)
- En fazla 3 soru: son adet başlangıcı, tipik döngü uzunluğu, tipik adet süresi.
  Üçü de "bilmiyorum" ile geçilebilir.
- Hesap yok, e-posta yok, izin istemi yok.
- Bir ekran: mahremiyet sözü — düz Türkçe/İngilizce, hukuk dili değil.

### 2. Ana ekran
- Döngünün kaçıncı günü + evre (adet / foliküler / ovülasyon penceresi / luteal).
- Sonraki adet tahmini **aralık olarak** + güven göstergesi (yüksek/orta/düşük).
- Tek dokunuşla "bugün adet başladı" kaydı.

### 3. Gün kaydı
- Akış: leke / hafif / orta / yoğun.
- Semptomlar: kramp, baş ağrısı, şişkinlik, göğüs hassasiyeti, akne, yorgunluk, bulantı,
  bel ağrısı, iştah değişimi, uyku sorunu (çoklu seçim).
- Ruh hali: nötr etiketlerle (sakin, kaygılı, sinirli, düşük, enerjik).
- Not alanı (serbest metin).
- **Opsiyonel, varsayılan KAPALI**: cinsel aktivite, bazal vücut sıcaklığı, servikal mukus.

### 4. Takvim
- Ay görünümü; gerçekleşen adet günleri ile tahmin edilen günler görsel olarak AYRI.
- Geçmiş güne dokunup geriye dönük kayıt/düzeltme.

### 5. Tahmin motoru (cihazda)
- İstatistiksel: son N döngünün ortalaması + standart sapması.
- Çıktı daima bir aralık. Sapma yüksekse aralık genişler ve güven "düşük" olur.
- 2 döngüden az veri varsa tahmin yapılmaz; "henüz yeterli veri yok" denir.
- Düzensizliği gizlemez; nazikçe işaret eder (tanı koymadan).

### 6. İçgörüler
- Ortalama döngü uzunluğu, değişkenlik, ortalama adet süresi, kayıtlı döngü sayısı.
- Basit semptom örüntüsü: "kramplar en çok 1-2. günlerde".

### 7. Mahremiyet özellikleri (ürünün kalbi)
- Uygulama kilidi: biyometrik + PIN yedeği.
- Diskte AES-GCM şifreleme, anahtar Keychain/Keystore'da.
- Ayarlarda görünür "Mahremiyet" ekranı: hangi verinin nerede durduğunu düz dille anlatır.
- **Tüm veriyi sil**: gerçek, geri dönüşsüz, tek dokunuş uzağında.

### 8. Dışa aktarma
- Şifreli yedek dosyası (kullanıcı parolasıyla) — cihaz değiştirince geri yükleme.
- Doktor için sade rapor (CSV + yazdırılabilir özet).
- Paylaşım daima kullanıcının başlattığı sistem paylaşım sayfası üzerinden.

### 9. Ayarlar
- Dil (EN/TR), hafta başlangıcı, sıcaklık birimi.
- Yerel hatırlatmalar: yaklaşan adet, kayıt hatırlatıcısı. Varsayılan kapalı.

## v1 KAPSAM DIŞI (net)
Topluluk/sosyal akış · sohbet · yapay zekâ asistanı · gebelik modu · partner paylaşımı ·
bulut senkron · hesap sistemi · reklam · abonelik · giyilebilir cihaz entegrasyonu ·
menopoz modu · doğum kontrolü hapı hatırlatıcısı · içerik/makale akışı

## Bitti tanımı
- Tahmin motoru ve şifreleme katmanı testli.
- Android manifest'inde `INTERNET` izni yok; uygulama uçak modunda tam çalışıyor.
- iOS ve Android'de kurulum → 3 döngü kaydı → tahmin → dışa aktarma akışı elle doğrulandı.
