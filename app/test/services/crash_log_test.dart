import 'dart:io';

import 'package:cycle_app/services/crash_log.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:path_provider_platform_interface/path_provider_platform_interface.dart';

/// Serves a temp directory so the log writes somewhere real without
/// touching a device path.
class _TempPathProvider extends PathProviderPlatform {
  _TempPathProvider(this.root);

  final String root;

  @override
  Future<String?> getApplicationDocumentsPath() async => root;
}

void main() {
  late Directory temp;

  setUp(() async {
    temp = await Directory.systemTemp.createTemp('vera_crashlog_test');
    PathProviderPlatform.instance = _TempPathProvider(temp.path);
    await CrashLog.instance.clear();
  });

  tearDown(() async {
    await CrashLog.instance.clear();
    if (temp.existsSync()) temp.deleteSync(recursive: true);
  });

  test('reads back nothing before anything goes wrong', () async {
    expect(await CrashLog.instance.read(), isNull);
  });

  test('records an entry with the type, message, and stack', () async {
    await CrashLog.instance.record(
      StateError('boom'),
      StackTrace.fromString('#0 someFrame'),
    );

    final log = await CrashLog.instance.read();
    expect(log, contains('StateError'));
    expect(log, contains('boom'));
    expect(log, contains('someFrame'));
  });

  test('keeps the file bounded so it cannot grow forever', () async {
    for (var i = 0; i < CrashLog.maxEntries + 7; i++) {
      await CrashLog.instance.record(StateError('error $i'), StackTrace.empty);
    }

    final log = await CrashLog.instance.read();
    // The oldest are dropped, the newest survive.
    expect(log, isNot(contains('error 0')));
    expect(log,
        contains('error ${CrashLog.maxEntries + 6}'));
  });

  test('truncates a huge stack instead of writing it whole', () async {
    await CrashLog.instance.record(
      StateError('x'),
      StackTrace.fromString('F' * 20000),
    );

    final log = await CrashLog.instance.read();
    expect(log!.length, lessThan(8000));
    expect(log, contains('…'));
  });

  test('clear removes everything', () async {
    await CrashLog.instance.record(StateError('boom'), StackTrace.empty);
    await CrashLog.instance.clear();
    expect(await CrashLog.instance.read(), isNull);
  });

  test('a failure while recording never throws at the caller', () async {
    // Point at a path that can't be written to.
    PathProviderPlatform.instance = _TempPathProvider('/dev/null/nope');
    await expectLater(
      CrashLog.instance.record(StateError('boom'), StackTrace.empty),
      completes,
    );
  });
}
