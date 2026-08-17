# Bekleyen diller

Bu sekiz dil (pt, it, ru, hi, ja, ko, zh, ur) bir süre uygulamada
listelendi ama yalnızca **%15'i çevriliydi** — geri kalan her şey
İngilizceye düşüyordu. Japonca seçen biri ekranın %84'ünü İngilizce
görüyordu; bu, az dil desteklemekten daha kötü bir deneyim.

Bu yüzden dil listesinden çıkarıldılar. Dosyalar burada duruyor çünkü
mevcut çeviriler çöp değil, sadece eksik.

## Geri eklemek için

1. İlgili `app_<kod>.arb` dosyasını `lib/l10n/`'e taşı.
2. `lib/l10n/app_en.arb`'deki **tüm** anahtarları tamamla (şu an 423 anahtar).
3. `lib/screens/settings/widgets/language_picker_tile.dart` içindeki
   `_supportedCodes` listesine kodu ekle ve etiket eşlemesini yaz.
4. `flutter gen-l10n` çalıştır.

## Neden makine çevirisi yeterli değil

İçerik sağlıkla ilgili: "doğurgan pencere", "luteal faz", "lekelenme"
gibi terimlerin yanlış çevrilmesi kullanıcıyı yanıltır. Ayrıca
uygulamanın tonu bilinçli olarak yargılayıcı değil — bu incelik makine
çevirisinde ilk kaybolan şeydir. Bu diller için anadili konuşan bir
gözden geçirme gerekiyor.
