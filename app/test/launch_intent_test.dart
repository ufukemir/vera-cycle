import 'package:cycle_app/services/launch_intent.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  const channel = MethodChannel('vera/launch_intent');
  final messenger =
      TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger;

  tearDown(() => messenger.setMockMethodCallHandler(channel, null));

  test('maps the Health Connect action to the privacy screen', () async {
    messenger.setMockMethodCallHandler(channel, (call) async {
      expect(call.method, 'takeLaunchAction');
      return 'privacy_policy';
    });

    expect(await const LaunchIntent().take(), LaunchAction.privacyPolicy);
  });

  test('a normal launch reports no action', () async {
    messenger.setMockMethodCallHandler(channel, (call) async => null);
    expect(await const LaunchIntent().take(), isNull);
  });

  test('an unknown action is ignored rather than crashing', () async {
    messenger.setMockMethodCallHandler(
        channel, (call) async => 'something_added_later');
    expect(await const LaunchIntent().take(), isNull);
  });

  test('no platform channel (iOS, tests) just means a normal launch',
      () async {
    // No handler registered at all.
    expect(await const LaunchIntent().take(), isNull);
  });

  test('a platform error is swallowed into a normal launch', () async {
    messenger.setMockMethodCallHandler(channel, (call) async {
      throw PlatformException(code: 'boom');
    });
    expect(await const LaunchIntent().take(), isNull);
  });
}
