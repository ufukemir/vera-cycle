import 'dart:io';

/// AdMob unit ids.
///
/// These are Google's **public test ids** — they serve test ads on any
/// device and are the documented way to develop before an AdMob account
/// exists. They MUST be replaced with the real unit ids (and the app ids in
/// AndroidManifest.xml / Info.plist) before release: shipping test ids
/// serves no revenue, and shipping real ids while developing risks an
/// invalid-traffic ban.
class AdIds {
  AdIds._();

  static const _androidTestBanner = 'ca-app-pub-3940256099942544/6300978111';
  static const _iosTestBanner = 'ca-app-pub-3940256099942544/2934735716';

  /// `true` while the placeholder test ids are still in use — the UI shows
  /// an honest "test ad" note rather than pretending it's a live ad.
  static const usingTestIds = true;

  static String get banner =>
      Platform.isIOS ? _iosTestBanner : _androidTestBanner;
}
