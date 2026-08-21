import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'cloud_auth_service.dart';
import 'firebase_bootstrap.dart';

/// Auth + Firestore pairing for Partner Modu — the one deliberate exception
/// to "health data never leaves the device" (CLAUDE.md, 2026-08-21
/// revision). Everything here is opt-in: nothing in this class runs unless
/// the user has explicitly opened Partner Modu and chosen to sign in.
///
/// Data model (see `firestore.rules` for the matching security rules):
///   pairingCodes/{code}       — {uid, createdAt} — one-time, deleted on redeem
///   partnerships/{uidA_uidB}  — {uidA, uidB, code, createdAt}, doc id is the
///                               two paired uids sorted and joined with `_`
///   sharedData/{uid}          — whatever fields the user has opted to
///                               share, readable only by the uid they're
///                               paired with
///
/// A pairing is NOT `users/{uid}.pairedWith` pointing at each other, which
/// was the first design here — that requires the redeemer to write into the
/// *other* user's own protected document, which no Firestore rule can grant
/// without a Cloud Function (a security rule can only judge a write against
/// the path being written and other documents it can `get()`/`exists()` by
/// a known path, never "the other side agrees"). A single shared
/// `partnerships` doc that either side may create (once, provably against a
/// real pairing code) or delete (to unpair) sidesteps that entirely — ownership
/// isn't per-user, it's "am I one of the two uids in this document."
///
/// This is a snapshot model, not live sync in the sense of "always
/// current": [shareSnapshot] is called explicitly (by the user tapping
/// "share"), not automatically on every log entry — see
/// [PartnerModeScreen]'s own doc comment for why that is the honest design
/// here rather than a limitation to hide.
class PartnerService {
  PartnerService({
    FirebaseAuth? auth,
    FirebaseFirestore? firestore,
    CloudAuthService? authService,
  }) : _firestoreOverride = firestore,
       _authService = authService ?? CloudAuthService(auth: auth);

  final FirebaseFirestore? _firestoreOverride;
  final CloudAuthService _authService;

  /// Delegates to the one shared init attempt — see [FirebaseBootstrap]'s
  /// doc comment for why this isn't its own separate attempt.
  static Future<void> ensureInitialized() =>
      FirebaseBootstrap.ensureInitialized();

  /// Whether Firebase actually came up. Every public method below throws
  /// [CloudServiceNotConfiguredException] when this is false; call sites are
  /// expected to check it first and never reach that path in practice.
  bool get isConfigured => FirebaseBootstrap.isConfigured;

  FirebaseFirestore get _firestore {
    if (!isConfigured) throw const CloudServiceNotConfiguredException();
    return _firestoreOverride ?? FirebaseFirestore.instance;
  }

  User? get currentUser => _authService.currentUser;

  Stream<User?> authStateChanges() => _authService.authStateChanges();

  Future<void> signOut() => _authService.signOut();

  Future<UserCredential> signInWithGoogle() => _authService.signInWithGoogle();

  Future<UserCredential> signInWithApple() => _authService.signInWithApple();

  // --- Pairing -------------------------------------------------------

  /// The deterministic `partnerships` doc id for a pair of uids — sorted so
  /// either side computes the same id independently, which is what lets the
  /// security rules resolve "are these two paired" with a single `exists()`
  /// check by path rather than a query.
  static String _pairId(String a, String b) =>
      a.compareTo(b) < 0 ? '${a}_$b' : '${b}_$a';

  /// The uid this account is currently paired with, or null. A person can
  /// only ever be in one partnership at a time in this model, so the first
  /// (only) match is authoritative.
  Stream<String?> pairedWithStream() {
    final uid = currentUser?.uid;
    if (uid == null) return Stream.value(null);
    return _firestore
        .collection('partnerships')
        .where(
          Filter.or(
            Filter('uidA', isEqualTo: uid),
            Filter('uidB', isEqualTo: uid),
          ),
        )
        .snapshots()
        .map((snapshot) {
          if (snapshot.docs.isEmpty) return null;
          final data = snapshot.docs.first.data();
          final a = data['uidA'] as String?;
          final b = data['uidB'] as String?;
          return a == uid ? b : a;
        });
  }

  static const _codeChars = 'ABCDEFGHJKLMNPQRSTUVWXYZ23456789'; // no 0/O/1/I
  static const _codeLength = 6;
  static const _codeValidity = Duration(days: 7);

  /// Creates a fresh one-time pairing code tied to this account and returns
  /// it. Any code this account created previously is left to expire on its
  /// own — deleting it would need a query this simple rules file can't
  /// safely allow (see `firestore.rules`).
  Future<String> createPairingCode() async {
    final uid = currentUser?.uid;
    if (uid == null) throw StateError('Not signed in');
    final random = Random.secure();
    final code = List.generate(
      _codeLength,
      (_) => _codeChars[random.nextInt(_codeChars.length)],
    ).join();
    await _firestore.collection('pairingCodes').doc(code).set({
      'uid': uid,
      'createdAt': FieldValue.serverTimestamp(),
    });
    return code;
  }

  /// Redeems [code], pairing this account with whoever created it.
  ///
  /// Returns the partner's uid on success. Throws [StateError] with a
  /// message meant to be shown as-is if the code is missing, expired, or
  /// points at the caller's own account.
  Future<String> redeemPairingCode(String code) async {
    final myUid = currentUser?.uid;
    if (myUid == null) throw StateError('not-signed-in');
    final normalized = code.trim().toUpperCase();

    final codeRef = _firestore.collection('pairingCodes').doc(normalized);
    final codeSnap = await codeRef.get();
    final data = codeSnap.data();
    if (!codeSnap.exists || data == null) {
      throw StateError('code-not-found');
    }
    final otherUid = data['uid'] as String?;
    final createdAt = (data['createdAt'] as Timestamp?)?.toDate();
    if (otherUid == null) throw StateError('code-not-found');
    if (otherUid == myUid) throw StateError('code-is-own');
    if (createdAt == null ||
        DateTime.now().difference(createdAt) > _codeValidity) {
      throw StateError('code-expired');
    }

    final pairId = _pairId(myUid, otherUid);
    final uidA = myUid.compareTo(otherUid) < 0 ? myUid : otherUid;
    final uidB = myUid.compareTo(otherUid) < 0 ? otherUid : myUid;

    final batch = _firestore.batch();
    // The security rule for this create checks this exact doc's `code`
    // field against `pairingCodes/{code}`, which is why it's carried here
    // rather than only in the (about to be deleted) code document itself.
    batch.set(_firestore.collection('partnerships').doc(pairId), {
      'uidA': uidA,
      'uidB': uidB,
      'code': normalized,
      'createdAt': FieldValue.serverTimestamp(),
    });
    batch.delete(codeRef);
    await batch.commit();
    return otherUid;
  }

  /// Deletes the shared `partnerships` doc, ending the pairing for both
  /// sides at once — there is exactly one such doc per pair (see
  /// [_pairId]), and either party is allowed to delete it (see
  /// `firestore.rules`), so unlike the earlier per-user-pointer design this
  /// needs no cooperation from the other side to take effect.
  Future<void> unpair() async {
    final uid = currentUser?.uid;
    if (uid == null) return;
    final snapshot = await _firestore
        .collection('partnerships')
        .where(
          Filter.or(
            Filter('uidA', isEqualTo: uid),
            Filter('uidB', isEqualTo: uid),
          ),
        )
        .get();
    for (final doc in snapshot.docs) {
      await doc.reference.delete();
    }
  }

  // --- Sharing ---------------------------------------------------------

  /// Overwrites this account's shared snapshot. Only the keys present in
  /// [fields] are written — the caller decides what belongs there based on
  /// the user's own share toggles, this method has no opinion about it.
  Future<void> shareSnapshot(Map<String, Object?> fields) async {
    final uid = currentUser?.uid;
    if (uid == null) throw StateError('Not signed in');
    await _firestore.collection('sharedData').doc(uid).set({
      ...fields,
      'updatedAt': FieldValue.serverTimestamp(),
    });
  }

  /// The partner's shared snapshot, live — updates whenever they call
  /// [shareSnapshot] again. Firestore's own security rules are what
  /// actually enforce that this only resolves data for someone paired with
  /// the caller; this method does not re-check that itself.
  Stream<Map<String, dynamic>?> partnerSnapshotStream(String partnerUid) {
    return _firestore
        .collection('sharedData')
        .doc(partnerUid)
        .snapshots()
        .map((doc) => doc.data());
  }
}
