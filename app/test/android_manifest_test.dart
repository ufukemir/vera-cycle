import 'dart:io';

import 'package:flutter_test/flutter_test.dart';

/// Regression guard for CLAUDE.md principle 2: the release manifest must
/// never request INTERNET. This is meant to be checkable by the app's own
/// users, not just asserted in prose — a dependency added later (e.g. for
/// export/backup) could silently pull in a plugin that declares this
/// permission, and this test is what would catch that before it ships.
///
/// Only the main (release) manifest is checked. Flutter's debug/profile
/// manifests add INTERNET automatically for the VM service/DevTools
/// connection — that's normal tooling behavior for local development builds,
/// not something users ever install, so it's out of scope here.
void main() {
  test('the main Android manifest never requests INTERNET', () {
    final manifest = File('android/app/src/main/AndroidManifest.xml');
    expect(manifest.existsSync(), isTrue,
        reason: 'expected to find the manifest relative to the app/ '
            'directory — run flutter test from app/, not the repo root');

    final contents = manifest.readAsStringSync();
    expect(
      contents.contains('android.permission.INTERNET'),
      isFalse,
      reason: 'a dependency has requested network access; per CLAUDE.md this '
          'app must work fully in airplane mode and must not add this '
          'permission for any reason',
    );
  });
}
