import 'dart:io';

import 'package:flutter_test/flutter_test.dart';

/// Things that must never reach a store build.
///
/// Each of these shipped, or was one careless merge away from shipping, and
/// none of them fails loudly at runtime — that is exactly why they need a
/// test. They are deliberately grep-based rather than behavioural: the point
/// is to catch the *source* being wrong before a build is ever cut, and a
/// widget test cannot see a release-mode constant.
void main() {
  String read(String path) => File(path).readAsStringSync();

  group('the Premium dev cheat stays out of release builds', () {
    // `premiumDevToggle` was a plain SwitchListTile with no guard. In a
    // release build it handed every user Premium for free, sitting directly
    // under a paywall that shows real prices behind a non-functional
    // Subscribe button. Both stores reject that on sight.
    test('the toggle is behind kDebugMode', () {
      final source = read('lib/screens/premium/premium_screen.dart');

      expect(
        source,
        contains('premiumDevToggle'),
        reason: 'test is stale — the toggle was renamed or removed',
      );
      expect(
        source,
        contains('kDebugMode'),
        reason: 'the dev toggle must be compiled out of release builds',
      );

      // The guard must come before the toggle, not merely exist somewhere.
      expect(
        source.indexOf('kDebugMode'),
        lessThan(source.indexOf('premiumDevToggle')),
        reason: 'kDebugMode must gate the toggle, not follow it',
      );
    });

    test('no other screen exposes a premium override', () {
      // setPremiumActive is the whole of the entitlement model right now, so
      // any unguarded caller is a free-Premium path.
      final offenders = <String>[];
      for (final file
          in Directory('lib')
              .listSync(recursive: true)
              .whereType<File>()
              .where((f) => f.path.endsWith('.dart'))) {
        final source = file.readAsStringSync();
        if (!source.contains('setPremiumActive')) continue;
        // app_preferences.dart defines it; premium_screen.dart guards it.
        if (file.path.endsWith('state/app_preferences.dart')) continue;
        if (file.path.endsWith('screens/premium/premium_screen.dart')) continue;
        offenders.add(file.path);
      }
      expect(
        offenders,
        isEmpty,
        reason:
            'setPremiumActive called from an unreviewed place: '
            '$offenders',
      );
    });
  });

  group('AdMob ids', () {
    // Google's public sample publisher id. Shipping it serves a "Test Ad"
    // banner to every real user at zero revenue, and using test ids in
    // production violates AdMob policy — a way to lose the account on day
    // one. Nothing crashes, which is what makes it easy to miss.
    const googleSamplePublisher = 'ca-app-pub-3940256099942544';

    test('the test-id flag matches what the ids actually are', () {
      final source = read('lib/services/ad_ids.dart');
      final hasSampleIds = source.contains(googleSamplePublisher);
      final claimsTestIds = RegExp(r'usingTestIds\s*=\s*true').hasMatch(source);

      expect(
        hasSampleIds,
        claimsTestIds,
        reason: hasSampleIds
            ? 'ad_ids.dart still holds Google sample ids but '
                  'usingTestIds says otherwise'
            : 'real ad ids are in place — set usingTestIds = false',
      );
    });

    test('the app id in each platform manifest agrees with ad_ids.dart', () {
      // These three live in different files and have drifted apart in other
      // projects: real unit ids with a sample app id still serves test ads.
      final usingTest = read(
        'lib/services/ad_ids.dart',
      ).contains(googleSamplePublisher);
      final android = read(
        'android/app/src/main/AndroidManifest.xml',
      ).contains(googleSamplePublisher);
      final ios = read('ios/Runner/Info.plist').contains(googleSamplePublisher);

      expect(
        android,
        usingTest,
        reason: 'AndroidManifest APPLICATION_ID disagrees with ad_ids.dart',
      );
      expect(
        ios,
        usingTest,
        reason:
            'Info.plist GADApplicationIdentifier disagrees with '
            'ad_ids.dart',
      );
    });
  });

  group('Android release signing', () {
    test(
      'release is not signed with the debug key',
      () {
        // Play rejects a debug-signed AAB outright, and the failure surfaces
        // only at upload time, after a full release build.
        final gradle = read('android/app/build.gradle.kts');
        final debugSignedRelease = RegExp(
          r'release\s*\{[^}]*signingConfig\s*=\s*signingConfigs\.getByName\('
          r'"debug"\)',
          dotAll: true,
        ).hasMatch(gradle);

        expect(
          debugSignedRelease,
          isFalse,
          reason:
              'release builds still use the debug signing config — '
              'create a keystore and a signingConfigs.release block',
        );
      },
      skip:
          'Known gap: no keystore exists yet. Un-skip when one is '
          'created (see the release audit).',
    );
  });
}
