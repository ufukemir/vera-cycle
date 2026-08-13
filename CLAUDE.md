# Cycle (kod adı) — Proje Talimatları

Mahremiyet-önce adet ve döngü takip uygulaması. Konumlanma: **"Verin telefonundan çıkmaz —
ve bunu kanıtlayabiliriz."** Flo'nun yapısal olarak kopyalayamayacağı şey budur: Flo'nun iş
modeli veriye dayanır, bizimki dayanmaz.

> Marka adı henüz kesinleşmedi. `cycle` / `cycle_app` geçici kod adıdır. Mağaza çakışma
> kontrolü sonrası değiştirilecek (bundle id, paket adı, dizin adı dahil).

## Belgeler (önce bunları oku)
- `docs/01-mvp-spec.md` — DONDURULMUŞ özellik seti. Bu listede olmayan özellik yazılmaz.
- `docs/02-mimari.md` — veri modeli, şifreleme, tahmin motoru
- `docs/03-rakip-analizi.md` — Flo ve diğerleri: araştırma çıktısı
- `docs/backlog.md` — kapsam dışı fikirler buraya

## Mimari ilkeler (değiştirilemez)

1. **Veri cihazdan çıkmaz.** Sunucu yok, hesap yok, e-posta yok, bulut senkronu yok.
   Kullanıcının kendi başlattığı dışa aktarma dışında veri hiçbir yere gitmez.
2. **Android'de `INTERNET` izni YOKTUR.** Bu, pazarlama sözü değil; kullanıcının manifest'ten
   kendi doğrulayabileceği teknik kanıttır. Bir özellik ağ gerektiriyorsa o özellik yazılmaz.
3. **Üçüncü taraf SDK yok.** Analitik yok, çökme raporlama yok, reklam yok, attribution yok.
   Bağımlılık eklemeden önce: bu paket ağ açar mı, telemetri gönderir mi? Gönderiyorsa girmez.
4. **Diskte şifreli.** Tüm döngü verisi AES-GCM ile şifrelenir; anahtar Keychain/Keystore'da
   (donanım destekli). Cihaz yedeklerine düz metin sızmaz.
5. **Dürüst tahmin.** Sahte kesinlik yasak. Tahmin daima belirsizlik aralığıyla gösterilir
   ("28–31 Ağustos arası", tek bir gün değil). Veri azsa/döngü düzensizse bunu açıkça söyleriz.
6. **Sömürücü paywall yok.** Karanlık desen yok, sahte geri sayım yok, iptali zorlaştırma yok.
   Çekirdek takip özellikleri daima ücretsiz kalır.
7. **Tıbbi teşhis değil.** Uygulama tanı koymaz, gebeliği önleme yöntemi olarak sunulmaz.
   Bu iddialar tıbbi cihaz regülasyonunu tetikler (bkz. Natural Cycles / FDA). Sınırın
   dışında kalırız.

## Teknik kurallar
- Flutter (`app/` dizini). iOS + Android eşit öncelikli.
- Depolama: şifreli yerel dosya deposu; repository arayüzü arkasında (sonradan SQLCipher'a
  geçiş UI'a dokunmadan mümkün olsun).
- Bildirimler yereldir (`flutter_local_notifications`), sunucu push YOK.
- UI dili: İngilizce (v1) + Türkçe. Kod/commit dili: İngilizce. Ufuk'la konuşma: Türkçe.
- Test: tahmin motoru ve şifreleme katmanı için test zorunlu. `cd app && flutter test`.

## Ton ve içerik kuralları
- Kullanıcının neden takip ettiğine dair varsayım yapma. Gebe kalmaya çalıştığı varsayılmaz.
- Beden imajı, "güzellik", utandırıcı dil yok. Nötr, saygılı, klinik ama soğuk olmayan.
- Cinsel içerikli sorular varsayılan olarak KAPALI; kullanıcı açarsa gelir.
- Cinsiyet dili kapsayıcı; uygulama "kadın" varsaymadan çalışır.
