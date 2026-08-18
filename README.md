# Vera

Adet ve döngü takip uygulaması. Flutter, iOS + Android.

**Neden var:** Bu kategorideki uygulamaların çoğu iki şeyde zayıf — verinizle
ne yaptıkları ve size ne kadar dürüst oldukları. Vera'nın iki karşı duruşu var:

- **Sağlık verin cihazında kalır.** Sunucu yok, hesap yok, bulut senkronu yok.
  Kayıtlar AES-GCM ile şifrelenir, anahtar telefonun güvenli donanımında durur.
  Veri yalnızca senin başlattığın dışa aktarmayla cihazdan çıkar.
- **Sahte kesinlik yok.** Tahmin asla tek bir gün olarak gösterilmez; daima bir
  aralık ve güven seviyesiyle gelir. İki tam döngü kaydedilmeden hiç tahmin
  yapılmaz — "henüz yeterli veri yok" demek, uydurmaktan iyidir.

## Durum

Kod tamam, mağazaya çıkmadı. 156 test geçiyor; iOS ve Android release
derlemeleri doğrulanmış durumda.

Yayın için kalanlar hesap gerektiriyor: AdMob kimlikleri, satın alma
altyapısı, gizlilik politikası URL'i, mağaza hesapları ve iOS widget'ının
Xcode adımı (`docs/05-widget-kurulumu.md`).

## Öne çıkanlar

| | |
|---|---|
| Takip | Akış, semptom, ruh hali, enerji, cilt/saç, ilaç, su/uyku/kilo; isteğe bağlı BBT, servikal mukus, ovülasyon testi, meme muayenesi, serviks |
| Tahmin | Kendi döngülerinden istatistiksel aralık + güven seviyesi; düzensizliği gizlemez, tanı da koymaz |
| Asistan | Cihaz üstünde çalışan soru-cevap; küratörlü bilgi tabanı, bulut LLM yok |
| Gebelik modu | SAT'a dayalı hafta/trimester/tahmini doğum tarihi, açıkça tahmin olduğu belirtilerek |
| Dışa/içe aktarma | Şifreli yedek, doktor için CSV + görsel PDF, başka uygulamalardan CSV içe aktarma |
| Gizlilik | PIN + biyometrik kilit, arka plana alınca anında kilitlenme, ekran görüntüsü engeli |
| Diğer | 7 tam çevrilmiş dil (+29'u gözden geçirme bekliyor), karanlık mod, ana ekran widget'ı (**yalnızca Android**), Health Connect / Apple Health'e yazma |

## Mimari kararlar

Bu depodaki bazı seçimler alışılmadık; gerekçeleri kodun yanında duruyor:

- **Reklam var, ama reklam kimliği yok.** Ücretsiz sürüm reklam destekli
  (`ad_ids.dart`), fakat kişiselleştirme kapalı ve `AD_ID` izni manifest'ten
  çıkarılmış — kullanılmayan bir tanımlayıcıyı beyan etmektense hiç almamak.
- **Çökme raporlayıcı yok.** Reklamı kullanıcı görür, çökme raporlayıcıyı
  görmez. Yerine yerel çökme günlüğü + kullanıcı onaylı paylaşım
  (`crash_log.dart`) ve her ekranı açan duman testi var.
- **Sağlık entegrasyonu tek yönlü.** Yalnızca yazma; okuma izni istemek,
  kullanıcının tüm sağlık kaydına erişim talep etmek olurdu
  (`health_sync_service.dart`).
- **Yarım çevrilmiş dil listelenmez.** Sekiz dil `%15` çeviriyle
  `l10n_pending/`'de bekliyor; yarım çeviri = karışık dilli ekran.

Daha fazlası: [`CLAUDE.md`](CLAUDE.md) (ilkeler ve revizyonları),
[`docs/`](docs/) (özellik spesifikasyonu, rakip analizi, mağaza taslağı).

## Geliştirme

```bash
cd app
flutter pub get
flutter test          # 156 test
flutter run
```

## Lisans

Depo, mahremiyet iddialarının bağımsız doğrulanabilmesi için herkese açık —
ama açık kaynak değil. Okuyabilir ve denetleyebilirsin; kopyalamak, türetmek
veya mağazada yayımlamak izne tabidir. Bkz. [`LICENSE`](LICENSE).

Görseller Pexels lisanslı ve yerel paketli, kaynakları
[`app/assets/photos/NOTICE.md`](app/assets/photos/NOTICE.md)'de; fontlar
(Quicksand, Fraunces) OFL lisanslı.
