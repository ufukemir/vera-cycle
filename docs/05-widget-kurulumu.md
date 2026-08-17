# 05 — Ana ekran widget'ı: kalan kurulum

Android tarafı **bitti ve derleniyor**: `VeraWidgetProvider.kt`, layout,
`vera_widget_info.xml` ve manifest kaydı repoda. Kullanıcı Android'de
widget'ı ana ekrana ekleyebilir.

iOS tarafı **Xcode'da elle bir adım gerektiriyor** — widget extension'ı
bir Xcode target'ıdır, `.pbxproj` dosyasını elle düzenleyerek eklemek
kırılgan ve hataya açık olurdu. Aşağıdaki adımlar bir kere yapılır:

## iOS widget extension (Xcode'da, ~10 dakika)

1. `open ios/Runner.xcworkspace`
2. **File → New → Target → Widget Extension**
   - Product Name: `VeraWidget` (kodda `HomeWidgetService.iOSWidgetName`
     bu adı bekliyor — değiştirirsen orayı da güncelle)
   - "Include Live Activity" ve "Include Configuration Intent": **kapalı**
3. Hem `Runner` hem `VeraWidget` target'ına **App Group** ekle:
   - Signing & Capabilities → + Capability → App Groups
   - Grup adı: `group.com.ufukemir.vera`
     (kodda `HomeWidgetService.iOSAppGroupId` ile birebir aynı olmalı)
4. `VeraWidget` target'ına Swift Package olarak `home_widget` ekle
   (Package Dependencies → home_widget → VeraWidget target'ını işaretle)
5. Oluşan `VeraWidget.swift` içinde veriyi şu anahtarlarla oku:
   `vera_eyebrow`, `vera_headline`, `vera_secondary`
   (`UserDefaults(suiteName: "group.com.ufukemir.vera")`)

## Neden bu üç anahtar

Widget'a yalnızca üç kısa metin gider: evre etiketi, başlık ve isteğe
bağlı bir alt satır. Semptom, not, tarih veya başka hiçbir kayıt
geçmez. Gerekçe `home_widget_service.dart` doc yorumunda: widget içeriği
kilit ekranında görünebilir, dolayısıyla kuralımız "birinin telefona
şöyle bir bakması utandırıcı olmasın".

## Doğrulama

- Android: `flutter build apk` sonrası cihazda widget ekle, uygulamayı
  aç-kapa, metinlerin güncellendiğini gör.
- iOS: extension eklendikten sonra `flutter run`, widget'ı ana ekrana
  ekle, aynı kontrolü yap.

Widget güncellemesi `HomeScreen` her oluştuğunda tetiklenir; platform
tarafı eksikse `HomeWidgetService` sessizce yutar — widget yokluğu
uygulamayı asla düşürmez.
