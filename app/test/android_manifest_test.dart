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

    // Only <uses-permission> counts as "the app asks for this". An
    // android:permission attribute elsewhere is the opposite — a
    // restriction on who may invoke a component.
    final declared = RegExp(
      r'<uses-permission\s+android:name="([^"]+)"',
    )
        .allMatches(manifest.readAsStringSync())
        .map((m) => m.group(1)!)
        .toSet();

    expect(
      declared.difference(allowedPermissions),
      isEmpty,
      reason: 'a dependency requested a permission nobody reviewed; add it to '
          'allowedPermissions here only after deciding it is genuinely needed',
    );
  });

  test('no health READ permissions are ever requested', () {
    final contents =
        File('android/app/src/main/AndroidManifest.xml').readAsStringSync();
    expect(contents.contains('permission.health.READ'), isFalse,
        reason: 'health sync is deliberately write-only — reading would '
            'mean asking for access to the whole health record');
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
