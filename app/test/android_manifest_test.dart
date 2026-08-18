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
