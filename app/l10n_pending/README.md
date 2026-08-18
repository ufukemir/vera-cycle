# Bekleyen diller

Buradaki dosyalar **tam çevrilmiş ama henüz yayımlanmamış** dillerdir.
Uygulamada listelenmezler; `lib/l10n/` altındaki 7 dil (en, tr, ar, es, fr,
de, id) yayındadır.

Tek eksikleri **anadili konuşan birinin gözden geçirmesi**. Bu bir formalite
değil, yayımlamanın önündeki gerçek koşul — gerekçesi aşağıda.

## Durum (2026-08-18)

Her dosya `lib/l10n/app_en.arb` ile yapısal olarak birebir aynıdır:

- aynı anahtar kümesi, **aynı sırada**
- aynı yer tutucular
- İngilizce'de ICU çoğul olan her anahtar, o dilin CLDR'de gerektirdiği
  kategorilerle (ru/pl/uk/cs `one·few·many·other`, ro `one·few·other`,
  ar altı form, ja/ko/zh/th/vi/ms/tl tek `other`)

Bunu `test/l10n_completeness_test.dart` içindeki "parked translations stay
structurally in step with English" grubu sabitler. İngilizce'ye anahtar
eklenip buraya yansıtılmazsa test kırmızıya döner — bu grup tam da öyle bir
kayma sessizce fark edilmediği için yazıldı.

## Bir dili yayına almak için

1. `app_<kod>.arb` dosyasını `lib/l10n/`'e taşı.
2. `lib/screens/settings/widgets/language_picker_tile.dart` içindeki
   `_supportedCodes` listesine kodu ekle **ve** `_labelFor` içine etiketini
   yaz. Etiketi unutursan seçicide dilin adı yerine ham kod ("pl") görünür;
   `l10n_completeness_test.dart` bunu yakalar.
3. `flutter gen-l10n` çalıştır.
4. `flutter test` — dil seçici ↔ üretilen diller uyum testi geçmeli.

## Neden anadili gözden geçirmesi şart

İçerik sağlıkla ilgili. "Doğurgan pencere", "luteal faz", "lekelenme" gibi
terimlerin yanlış çevrilmesi kullanıcıyı bedeni hakkında yanıltır. Bu soyut
bir endişe değil — bu dosyalar üretilirken **yayındaki** çevirilerde iki
gerçek hata çıktı:

- Endonezce'de nohut `buncis` (taze fasulye) diye çevrilmişti; cümle demir
  kaynaklarını sayıyordu, yani besin bilgisi yanlıştı.
- Urduca'da ovülasyon `بیضہ دانی` (yumurtalık **organı**) diye çevrilmişti.

Ayrıca uygulamanın tonu bilinçli olarak yargılayıcı değil ve kullanıcının
kadın olduğunu varsaymaz — makine çevirisinde ilk kaybolan incelik budur.
Üretim sırasında Almanca'da `Nutzerin`/`Assistentin`, İtalyanca'da
`Benvenuta`, Hintçe ve Urduca'da dişil birinci tekil asistan bulunup
düzeltildi.

## Gözden geçirene ne verilecek

Her dil için üreten ajan, **önce bakılması gereken 6-10 dizeyi** ve verdiği
terim kararlarını raporladı. Bunlar sohbet geçmişinde duruyor; bir dili
incelemeye verirken o listeyi de iletmek incelemeyi hızlandırır.
