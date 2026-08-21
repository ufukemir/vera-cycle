import 'dart:io';

import 'package:cycle_app/models/day_log.dart';
import 'package:cycle_app/models/enums.dart';
import 'package:cycle_app/services/backup_exclusion.dart';
import 'package:cycle_app/services/file_day_log_repository.dart';
import 'package:cycle_app/util/day.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:path_provider_platform_interface/path_provider_platform_interface.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

/// The encrypted diary must be marked as excluded from iCloud backup, and it
/// must be re-marked on every save.
///
/// That second part is the subtle one: the write path renames a temp file
/// over the target, so the file the attribute was set on stops existing. A
/// set-once implementation would look correct on first run and quietly stop
/// applying from the second save onwards — with the visible symptom being
/// none at all, until someone's cycle history turned up in an iCloud backup.
class _RecordingExclusion implements BackupExclusion {
  final paths = <String>[];

  @override
  Future<void> exclude(String path) async => paths.add(path);
}

class _FakePathProvider extends PathProviderPlatform
    with MockPlatformInterfaceMixin {
  _FakePathProvider(this.root);

  final String root;

  @override
  Future<String?> getApplicationSupportPath() async => root;
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late Directory temp;
  late _RecordingExclusion exclusion;

  setUp(() async {
    temp = await Directory.systemTemp.createTemp('vera_backup_test');
    PathProviderPlatform.instance = _FakePathProvider(temp.path);
    exclusion = _RecordingExclusion();

    // The key store talks to a platform channel; stub it with a real store
    // so the generated key persists across calls. Returning null from every
    // read would mint a fresh key per save, and the second save would fail
    // to decrypt what the first one wrote.
    final keychain = <String, String>{};
    const channel = MethodChannel(
      'plugins.it_nomads.com/flutter_secure_storage',
    );
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(channel, (call) async {
          final key = (call.arguments as Map?)?['key'] as String?;
          switch (call.method) {
            case 'read':
              return keychain[key];
            case 'write':
              keychain[key!] = (call.arguments as Map)['value'] as String;
              return null;
            default:
              return null;
          }
        });
  });

  tearDown(() async {
    if (await temp.exists()) await temp.delete(recursive: true);
  });

  test('every save re-applies the backup exclusion to the data file', () async {
    final repository = FileDayLogRepository(backupExclusion: exclusion);

    await repository.upsert(DayLog(date: today(), flow: FlowIntensity.medium));
    expect(
      exclusion.paths,
      hasLength(1),
      reason: 'the first save must mark the file',
    );

    await repository.upsert(
      DayLog(date: addDays(today(), -1), flow: FlowIntensity.light),
    );
    expect(
      exclusion.paths,
      hasLength(2),
      reason: 'the rename replaces the file, so it must be re-marked',
    );

    expect(
      exclusion.paths.toSet().single,
      endsWith('cycle_data.enc'),
      reason: 'the marked path must be the diary, not the temp file',
    );
    expect(
      File(exclusion.paths.last).existsSync(),
      isTrue,
      reason: 'the attribute is set after the rename, not before',
    );
  });
}
