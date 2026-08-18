import 'dart:io';

import 'package:flutter_test/flutter_test.dart';

/// Regression guard for CLAUDE.md's revised principles 1–3.
///
/// The app used to request no INTERNET permission at all. Since the
/// 2026-08-14 owner decision to ship an ad-supported free tier, INTERNET is
/// present — but *only* for the ad SDK. This test pins the full permission
/// list so a future dependency can't quietly add network-adjacent
/// capabilities (contacts, location, storage, exact alarms…) without a
/// deliberate edit here.
void main() {
  const allowedPermissions = {
    // Lets a scheduled local reminder survive a reboot.
    'android.permission.RECEIVE_BOOT_COMPLETED',
    // Ad SDK only. The app's own code makes no network calls.
    'android.permission.INTERNET',
    // Health Connect, write-only and opt-in. No read permissions: the
    // app never asks to see the rest of someone's health record.
    'android.permission.health.WRITE_MENSTRUATION',
    'android.permission.health.WRITE_WEIGHT',
    'android.permission.health.WRITE_BODY_TEMPERATURE',
  };

  test('the main Android manifest requests only the permissions we vetted', () {
    final manifest = File('android/app/src/main/AndroidManifest.xml');
    expect(manifest.existsSync(), isTrue,
        reason: 'expected to find the manifest relative to the app/ '
            'directory — run flutter test from app/, not the repo root');

    // Only <uses-permission> counts as "the app asks for this", and only
    // when it isn't a tools:node="remove" directive — those exist to take
    // a permission a dependency added back out again, so counting them
    // would flag the very thing that removes them. An android:permission
    // attribute elsewhere is also excluded: that's a restriction on who
    // may invoke a component, the opposite of a request.
    final declared = RegExp(
      r'<uses-permission\s+android:name="([^"]+)"([^>]*)>',
      multiLine: true,
      dotAll: true,
    )
        .allMatches(manifest.readAsStringSync())
        .where((m) => !m.group(2)!.contains('tools:node="remove"'))
        .map((m) => m.group(1)!)
        .toSet();

    expect(
      declared.difference(allowedPermissions),
      isEmpty,
      reason: 'a dependency requested a permission nobody reviewed; add it to '
          'allowedPermissions here only after deciding it is genuinely needed',
    );
  });

  test('the advertising id stays removed', () {
    final contents =
        File('android/app/src/main/AndroidManifest.xml').readAsStringSync();
    // Personalization is off (tagForUnderAgeOfConsent), so the ad id is
    // never used. If a dependency bump quietly reintroduces it, Play's
    // Data Safety answer stops being true.
    expect(
      RegExp(r'AD_ID"\s+tools:node="remove"').hasMatch(contents),
      isTrue,
      reason: 'AD_ID must stay explicitly removed',
    );
  });

  test('no health READ permissions are ever requested', () {
    final contents =
        File('android/app/src/main/AndroidManifest.xml').readAsStringSync();
    expect(contents.contains('permission.health.READ'), isFalse,
        reason: 'health sync is deliberately write-only — reading would '
            'mean asking for access to the whole health record');
  });

  test('the SHIPPED permission set is what the privacy policy claims', () {
    // The other manifest tests read the SOURCE manifest. The APK declares
    // whatever survives manifest merge, which is a longer list — plugins
    // add their own. The published privacy policy says categorically
    // "the complete set of permissions requested on Android is:" and then
    // lists five. Anyone running `aapt dump permissions` finds more.
    //
    // For an app whose whole pitch is verifiable honesty, that is the one
    // claim that must not be falsifiable. This pins the real list so the
    // policy can be written against it and stay true.
    final merged = Directory('build/app/intermediates/merged_manifests')
        .existsSync()
        ? Directory('build/app/intermediates/merged_manifests')
            .listSync(recursive: true)
            .whereType<File>()
            .where((f) => f.path.endsWith('AndroidManifest.xml'))
            .toList()
        : <File>[];

    if (merged.isEmpty) {
      markTestSkipped('no merged manifest on disk — run a build first');
      return;
    }

    final declared = <String>{};
    for (final file in merged) {
      for (final match in RegExp(
              r'<uses-permission[^>]*android:name="([^"]+)"[^>]*/?>')
          .allMatches(file.readAsStringSync())) {
        final name = match.group(1)!;
        // tools:node="remove" entries are removals, not requests.
        if (match.group(0)!.contains('tools:node="remove"')) continue;
        declared.add(name);
      }
    }

    // Everything here is either ours (vetted, see the whitelist above) or
    // added by a reviewed dependency: notifications, biometrics, the ads
    // SDK's connectivity check. Adding to this list is a deliberate act
    // that must be mirrored in the published policy.
    const expected = {
      'android.permission.ACCESS_NETWORK_STATE',
      'android.permission.FOREGROUND_SERVICE',
      'android.permission.INTERNET',
      'android.permission.POST_NOTIFICATIONS',
      'android.permission.RECEIVE_BOOT_COMPLETED',
      'android.permission.USE_BIOMETRIC',
      'android.permission.USE_FINGERPRINT',
      'android.permission.VIBRATE',
      'android.permission.WAKE_LOCK',
      'android.permission.health.WRITE_MENSTRUATION',
      'android.permission.health.WRITE_WEIGHT',
      'android.permission.health.WRITE_BODY_TEMPERATURE',
    };

    final unexpected = declared
        .where((p) => !expected.contains(p))
        // The app's own dynamic-receiver permission is generated from the
        // applicationId and is not a capability request.
        .where((p) => !p.endsWith('DYNAMIC_RECEIVER_NOT_EXPORTED_PERMISSION'))
        .toSet();

    expect(unexpected, isEmpty,
        reason: 'a dependency added a permission the privacy policy does '
            'not disclose: $unexpected');

    // The advertising id must stay OUT of the merged output, not just the
    // source — that is what the Data Safety answer rests on.
    expect(declared, isNot(contains('com.google.android.gms.permission.AD_ID')));
    expect(declared.where((p) => p.contains('ACCESS_ADSERVICES')), isEmpty);
    expect(declared.where((p) => p.contains('permission.health.READ')), isEmpty);
  });

  test('OS backup and device transfer stay switched off', () {
    // Principle 4: "cihaz yedeklerine düz metin sızmaz". The cycle store is
    // encrypted, but shared_preferences is not — it holds, among other
    // things, the reminder labels the user wrote themselves. Android's
    // default is allowBackup=true, so this has to be turned off explicitly
    // and stay off.
    final contents =
        File('android/app/src/main/AndroidManifest.xml').readAsStringSync();
    expect(contents.contains('android:allowBackup="false"'), isTrue);
    expect(contents.contains('android:fullBackupContent="false"'), isTrue);
    expect(
      contents.contains('android:dataExtractionRules="@xml/data_extraction_rules"'),
      isTrue,
    );

    // API 31+ path: both cloud backup and device-to-device transfer must
    // refuse every domain, sharedpref included.
    final rules =
        File('android/app/src/main/res/xml/data_extraction_rules.xml')
            .readAsStringSync();
    for (final section in ['cloud-backup', 'device-transfer']) {
      final body = RegExp('<$section>(.*?)</$section>', dotAll: true)
          .firstMatch(rules)
          ?.group(1);
      expect(body, isNotNull, reason: '<$section> must be declared');
      for (final domain in ['root', 'file', 'database', 'sharedpref', 'external']) {
        expect(body, contains('<exclude domain="$domain" />'),
            reason: '$section must exclude $domain');
      }
    }
  });

  test('location and contacts permissions stay out', () {
    final contents =
        File('android/app/src/main/AndroidManifest.xml').readAsStringSync();
    for (final banned in [
      'ACCESS_FINE_LOCATION',
      'ACCESS_COARSE_LOCATION',
      'READ_CONTACTS',
      'READ_EXTERNAL_STORAGE',
    ]) {
      expect(contents.contains(banned), isFalse,
          reason: '$banned has no business in a cycle tracker');
    }
  });
}
