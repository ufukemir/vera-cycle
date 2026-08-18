import 'package:cycle_app/services/pin_vault.dart';
import 'package:cycle_app/state/app_lock_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

/// Both lock screens hardcoded a fingerprint icon regardless of what the
/// device actually offers — a Face ID iPhone, which is every iPhone since
/// the X, showed a fingerprint glyph for a feature it unlocks by looking
/// at the phone. [AppLockController.biometricIcon] is what both screens
/// now read from instead.
///
/// See onboarding_flow_walkthrough_test.dart for why the channel must be
/// mocked at all under `flutter test`: unmocked, `invokeMethod` never
/// completes, hanging every `await` on it forever with no exception for
/// the `on Object` catch to ever see.
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  const channel = MethodChannel('plugins.flutter.io/local_auth');

  void mockBiometrics(List<String> available) {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(channel, (call) async {
      switch (call.method) {
        case 'isDeviceSupported':
          return true;
        case 'getAvailableBiometrics':
          return available;
        default:
          return null;
      }
    });
  }

  AppLockController controller() =>
      AppLockController(pinVault: PinVault());

  tearDown(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(channel, null);
  });

  test('a Face ID device gets the face icon, not fingerprint', () async {
    mockBiometrics(['face']);
    expect(await controller().biometricIcon(), Icons.face_outlined);
  });

  test('a Touch ID / Android fingerprint device gets the fingerprint icon',
      () async {
    mockBiometrics(['fingerprint']);
    expect(await controller().biometricIcon(), Icons.fingerprint);
  });

  test('face is preferred when a device reports more than one type',
      () async {
    // getAvailableBiometrics can return several; face is the newer,
    // camera-based method and the one most likely to be what a modern
    // device actually presents to the user.
    mockBiometrics(['fingerprint', 'face']);
    expect(await controller().biometricIcon(), Icons.face_outlined);
  });

  test('iris falls back to a distinct icon, not fingerprint', () async {
    mockBiometrics(['iris']);
    expect(await controller().biometricIcon(), Icons.visibility_outlined);
  });

  test('an unrecognised or absent report defaults to fingerprint', () async {
    mockBiometrics([]);
    expect(await controller().biometricIcon(), Icons.fingerprint);
  });

  test('a channel failure degrades to fingerprint rather than throwing',
      () async {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(channel, (call) async {
      throw PlatformException(code: 'no_auth');
    });
    expect(await controller().biometricIcon(), Icons.fingerprint);
  });
}
