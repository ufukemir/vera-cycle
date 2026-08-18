# iOS widget — hazır dosyalar

Bu klasör derlemeye girmez. İçindekiler, Xcode'da widget extension
target'ı oluşturduktan sonra **kopyala-yapıştır** yapılacak dosyalardır.

## Neden target'ı ben oluşturmuyorum

`project.pbxproj`'a `InfoPlist.strings` eklemeyi betikle yaptım ve build
ile doğruladım — düşük riskliydi. Widget extension bambaşka bir ölçek:
yeni bir `PBXNativeTarget` (app-extension ürün tipi), kendi Info.plist'i,
iki target için entitlement, üç build phase, ayrı build configuration'lar,
Runner'a "Embed App Extensions" adımı ve Swift Package bağımlılığının yeni
target'a bağlanması.

Bozulursa sessizce bozulmaz: `project.pbxproj` bozulursa Xcode projeyi hiç
açamaz, ve o dosya şu an çalışan iOS build'inin tek kaynağı. Kazanç
(10 dakikalık bir Xcode adımı) riske değmiyor.

## Adımlar

1. `open ios/Runner.xcworkspace`
2. **File → New → Target → Widget Extension**
   - Product Name: **`VeraWidget`** (birebir; Dart tarafı
     `HomeWidgetService.iOSWidgetName` bu adı bekliyor)
   - "Include Live Activity" ve "Include Configuration Intent": **kapalı**
3. Xcode'un ürettiği `VeraWidget.swift` dosyasının içeriğini bu klasördeki
   `VeraWidget.swift` ile **değiştir**.
4. App Group'u iki target'a da ekle — Signing & Capabilities → + Capability
   → App Groups → `group.com.ufukemir.vera`.
   Xcode entitlement dosyalarını kendi üretir; içerikleri buradaki
   `Runner.entitlements` / `VeraWidget.entitlements` ile aynı olmalı.
   Farklıysa bunları kullan.
5. Package Dependencies → `home_widget` → **VeraWidget** target'ını da işaretle.
6. `flutter build ios --debug --no-codesign` ile derlendiğini doğrula.

## Kontrol listesi (sessiz başarısızlık noktaları)

Bu üçünden biri yanlışsa widget hata vermez, sadece boş görünür:

- App Group id'si **iki target'ta da** `group.com.ufukemir.vera` mı
- Target adı birebir `VeraWidget` mı
- Anahtarlar `vera_eyebrow`, `vera_headline`, `vera_secondary` mı

## Bu iş bitene kadar

iOS'ta widget **yok**. `README.md` ve mağaza metinleri iOS için widget
vaat etmemeli — `HomeWidgetService.update()` hatayı yutuyor, yani
kullanıcı bir şey görmeden özellik yokmuş gibi davranıyor. Widget'ı
listelemeden önce ya bu adımı tamamla ya da metinlerden çıkar.

## Ne gönderiliyor

Yalnızca üç kısa metin: evre etiketi, başlık, isteğe bağlı alt satır.
Semptom, not, tarih geçmiyor. Gerekçe `home_widget_service.dart` doc
yorumunda: widget içeriği kilit ekranında görünebilir, kural "birinin
telefona şöyle bir bakması utandırıcı olmasın".
