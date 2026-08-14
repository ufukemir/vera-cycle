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
  };

  test('the main Android manifest requests only the permissions we vetted', () {
    final manifest = File('android/app/src/main/AndroidManifest.xml');
    expect(manifest.existsSync(), isTrue,
        reason: 'expected to find the manifest relative to the app/ '
            'directory — run flutter test from app/, not the repo root');

    final declared = RegExp(r'android\.permission\.[A-Z_]+')
        .allMatches(manifest.readAsStringSync())
        .map((m) => m.group(0)!)
        .toSet();

    expect(
      declared.difference(allowedPermissions),
      isEmpty,
      reason: 'a dependency requested a permission nobody reviewed; add it to '
          'allowedPermissions here only after deciding it is genuinely needed',
    );
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
