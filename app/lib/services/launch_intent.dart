import 'package:flutter/services.dart';

/// Why the app was opened, when something other than the launcher opened it.
///
/// Today there's exactly one case: Health Connect's "see how this app uses
/// your data" entry. Dropping that user on the home screen would be a
/// non-answer to the question they asked, so it routes to the privacy
/// screen instead.
enum LaunchAction { privacyPolicy }

class LaunchIntent {
  const LaunchIntent();

  static const _channel = MethodChannel('vera/launch_intent');

  /// Reads and clears the pending action. Returns null on iOS, on a
  /// normal launch, or if the channel isn't there — every one of which
  /// means "just start normally".
  Future<LaunchAction?> take() async {
    try {
      final raw = await _channel.invokeMethod<String>('takeLaunchAction');
      return switch (raw) {
        'privacy_policy' => LaunchAction.privacyPolicy,
        _ => null,
      };
    } on MissingPluginException {
      return null;
    } on PlatformException {
      return null;
    }
  }
}
