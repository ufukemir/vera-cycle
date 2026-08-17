import 'package:cycle_app/models/day_log.dart';
import 'package:cycle_app/models/enums.dart';
import 'package:cycle_app/screens/home/widgets/backup_nudge_card.dart';
import 'package:cycle_app/services/in_memory_day_log_repository.dart';
import 'package:cycle_app/state/app_preferences.dart';
import 'package:cycle_app/state/cycle_controller.dart';
import 'package:cycle_app/util/day.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<CycleController> _controllerWith(int loggedDays) async {
  final controller = CycleController(repository: InMemoryDayLogRepository());
  for (var i = 0; i < loggedDays; i++) {
    await controller.upsertDay(
      DayLog(date: addDays(today(), -i), flow: FlowIntensity.medium),
    );
  }
  return controller;
}

void main() {
  test('stays quiet until there is history worth losing', () async {
    SharedPreferences.setMockInitialValues({});
    final prefs = await AppPreferences.load();
    expect(
      BackupNudgeCard.shouldShow(prefs, await _controllerWith(5)),
      isFalse,
    );
  });

  test('appears once enough days are logged and nothing is backed up',
      () async {
    SharedPreferences.setMockInitialValues({});
    final prefs = await AppPreferences.load();
    expect(
      BackupNudgeCard.shouldShow(prefs, await _controllerWith(20)),
      isTrue,
    );
  });

  test('goes quiet right after a backup', () async {
    SharedPreferences.setMockInitialValues({});
    final prefs = await AppPreferences.load();
    await prefs.markBackedUpNow();
    expect(
      BackupNudgeCard.shouldShow(prefs, await _controllerWith(20)),
      isFalse,
    );
  });

  test('returns once the last backup goes stale', () async {
    final stale = DateTime.now()
        .subtract(BackupNudgeCard.staleAfter + const Duration(days: 1));
    SharedPreferences.setMockInitialValues(
        {'last_backup_at': stale.millisecondsSinceEpoch});
    final prefs = await AppPreferences.load();
    expect(
      BackupNudgeCard.shouldShow(prefs, await _controllerWith(20)),
      isTrue,
    );
  });

  test('respects the user turning backup reminders off', () async {
    SharedPreferences.setMockInitialValues({'backup_reminders_enabled': false});
    final prefs = await AppPreferences.load();
    expect(
      BackupNudgeCard.shouldShow(prefs, await _controllerWith(20)),
      isFalse,
    );
  });
}
