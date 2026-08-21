import 'package:firebase_core/firebase_core.dart';

/// Thrown when a caller asked for something that needs Firebase, but this
/// build has no Firebase configuration to talk to.
///
/// Not a crash: every call site checks [FirebaseBootstrap.isConfigured]
/// first and shows an honest "not set up yet" state instead of reaching
/// this — it exists as a backstop, not the normal path.
class CloudServiceNotConfiguredException implements Exception {
  const CloudServiceNotConfiguredException();

  @override
  String toString() =>
      'Firebase is not configured for this build — this feature is unavailable.';
}

/// One shared attempt at `Firebase.initializeApp()` for every feature built
/// on it (Partner Modu, cloud backup) — both need the exact same answer to
/// "is Firebase even here", and calling `Firebase.initializeApp()` more
/// than once per process is the kind of thing worth not risking twice.
///
/// There is no `GoogleService-Info.plist`/`google-services.json` in this
/// checkout yet, so [ensureInitialized] failing and [isConfigured] staying
/// false is the expected state until Ufuk supplies his own Firebase
/// project's config files — that must not crash the rest of the app on
/// launch, which is why the failure is swallowed here rather than left to
/// propagate.
class FirebaseBootstrap {
  FirebaseBootstrap._();

  static bool _attempted = false;
  static bool _succeeded = false;

  /// Safe to call repeatedly (and from multiple features) — only the first
  /// call does any work; later calls return immediately with the same
  /// answer already resolved.
  static Future<void> ensureInitialized() async {
    if (_attempted) return;
    _attempted = true;
    try {
      await Firebase.initializeApp();
      _succeeded = true;
    } on Object {
      _succeeded = false;
    }
  }

  static bool get isConfigured => _succeeded;
}
