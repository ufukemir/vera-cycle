import 'dart:async';
import 'dart:io';

import 'package:google_mobile_ads/google_mobile_ads.dart';

/// Runs Google's User Messaging Platform consent flow before any ad loads.
///
/// This is not optional polish. Since January 2024 Google requires a
/// certified consent message for users in the EEA/UK; without one, ad
/// serving there is blocked and the AdMob account risks a policy strike.
/// The flow also provides the "manage privacy options" entry that has to
/// stay reachable after the first answer.
///
/// [ensureConsent] gates ad loading: when consent is required and not yet
/// given it returns false and the banner simply doesn't load. Showing an
/// ad anyway would be the violation this class exists to prevent.
class AdConsentService {
  const AdConsentService();

  /// Cycle trackers are widely used by teenagers. Tagging requests as
  /// possibly under the age of consent stops Google serving personalized
  /// ads to minors — a policy requirement and the right default for this
  /// audience. It costs some ad revenue; that trade is deliberate.
  ///
  /// It also decides the rest of the ad stack: with personalization off,
  /// the advertising identifier is never used, so the app declares no
  /// AD_ID permission and never shows iOS's tracking prompt. Asking to
  /// track and then not tracking would be a scarier dialog for no gain.
  static const _tagForUnderAgeOfConsent = true;

  /// Guards against a callback that never fires (no network, SDK absent
  /// on this platform) leaving the caller awaiting forever.
  static const _timeout = Duration(seconds: 10);

  /// Refreshes consent info, shows the form if one is required, and
  /// reports whether ads may now be requested. Never throws: an
  /// unreachable consent service degrades to "no ads", not a broken app.
  Future<bool> ensureConsent() async {
    // google_mobile_ads only implements Android and iOS. Anywhere else —
    // including the host VM under `flutter test` — the platform channel
    // is absent and throws asynchronously, where a try/catch around the
    // call site can't reach it. Not starting the flow is the only
    // reliable guard.
    if (!_adsSupported) return false;
    try {
      await _requestUpdate();
      await _loadAndShowFormIfRequired();
      return await ConsentInformation.instance.canRequestAds();
    } on Object {
      return false;
    }
  }

  Future<void> _requestUpdate() {
    final completer = Completer<void>();
    ConsentInformation.instance.requestConsentInfoUpdate(
      ConsentRequestParameters(
        tagForUnderAgeOfConsent: _tagForUnderAgeOfConsent,
      ),
      () {
        if (!completer.isCompleted) completer.complete();
      },
      // A failure here isn't fatal: canRequestAds() below decides, and it
      // stays false unless consent is genuinely satisfied.
      (error) {
        if (!completer.isCompleted) completer.complete();
      },
    );
    return completer.future.timeout(_timeout, onTimeout: () {});
  }

  Future<void> _loadAndShowFormIfRequired() {
    final completer = Completer<void>();
    ConsentForm.loadAndShowConsentFormIfRequired((error) {
      if (!completer.isCompleted) completer.complete();
    });
    return completer.future.timeout(_timeout, onTimeout: () {});
  }

  static bool get _adsSupported => Platform.isAndroid || Platform.isIOS;

  /// Whether Settings should show a "privacy options" entry — required to
  /// be reachable wherever the user's region mandates it.
  Future<bool> privacyOptionsRequired() async {
    if (!_adsSupported) return false;
    try {
      final status = await ConsentInformation.instance
          .getPrivacyOptionsRequirementStatus();
      return status == PrivacyOptionsRequirementStatus.required;
    } on Object {
      return false;
    }
  }

  /// Reopens the consent form so a user can change their mind later.
  Future<void> showPrivacyOptions() async {
    if (!_adsSupported) return;
    try {
      final completer = Completer<void>();
      ConsentForm.showPrivacyOptionsForm((error) {
        if (!completer.isCompleted) completer.complete();
      });
      await completer.future.timeout(_timeout, onTimeout: () {});
    } on Object {
      // Nothing to do — the entry just won't open.
    }
  }

}
