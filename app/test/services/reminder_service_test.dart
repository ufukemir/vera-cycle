import 'package:cycle_app/services/reminder_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:timezone/timezone.dart' as tz;

/// The device's own wall clock for [fire].
///
/// NOT `TZDateTime.toLocal()`: that returns a time in `tz.local`, which this
/// app pins to UTC, so it would report the very UTC reading these tests
/// exist to rule out. Going through the epoch gives Dart's system-local
/// DateTime, which is what the user actually reads off their phone.
DateTime _deviceLocal(tz.TZDateTime fire) =>
    DateTime.fromMillisecondsSinceEpoch(fire.millisecondsSinceEpoch);

/// [ReminderService] initialises the timezone database before every call.
/// That step once threw `Location with the name "UTC" doesn't exist`, which
/// killed the onboarding "Turn on reminders" button: the exception happened
/// before the permission request ever reached the plugin, so the button did
/// nothing at all and said nothing about why.
///
/// The plugin itself can't run under `flutter test` — its platform interface
/// is only registered on a real device — so these cover the pure setup and
/// the scheduling arithmetic built on top of it, which is where the bug was.
void main() {
  test('initialising the timezone database does not throw', () {
    expect(ReminderService.initializeTimezoneDatabase, returnsNormally);
  });

  test('the local location resolves to UTC', () {
    ReminderService.initializeTimezoneDatabase();
    expect(tz.local.name, 'Etc/UTC');
    expect(tz.local.currentTimeZone.offset, Duration.zero);
  });

  test('initialising twice is safe', () {
    ReminderService.initializeTimezoneDatabase();
    expect(ReminderService.initializeTimezoneDatabase, returnsNormally);
  });

  test('a wall-clock time keeps its real instant through the conversion', () {
    ReminderService.initializeTimezoneDatabase();
    // The service converts with DateTime.toUtc() before handing the value to
    // tz, so the resulting instant must match the original moment exactly
    // regardless of the device's own offset.
    final wallClock = DateTime(2026, 8, 17, 9, 30);
    final converted = tz.TZDateTime.from(wallClock.toUtc(), tz.local);

    expect(converted.millisecondsSinceEpoch,
        wallClock.millisecondsSinceEpoch);
  });

  group('nextOccurrenceOf', () {
    setUp(ReminderService.initializeTimezoneDatabase);

    test('fires at the picked time on the device clock, not in UTC', () {
      // The bug: the daily paths built the fire time directly in tz.local
      // (pinned to UTC), so a reminder set for 09:00 fired at the user's
      // UTC offset instead — 12:00 in Istanbul. The instant must map back
      // to 09:00 *local*, whatever this machine's offset happens to be.
      final now = DateTime(2026, 8, 17, 7, 0);
      final fire = ReminderService.nextOccurrenceOf(
        const TimeOfDay(hour: 9, minute: 0),
        now: now,
      );

      final asLocal = _deviceLocal(fire);
      expect(asLocal.hour, 9);
      expect(asLocal.minute, 0);
      expect(asLocal.day, 17, reason: 'still later today');
    });

    test('rolls to tomorrow when the time has already passed', () {
      final now = DateTime(2026, 8, 17, 21, 30);
      final fire = ReminderService.nextOccurrenceOf(
        const TimeOfDay(hour: 9, minute: 0),
        now: now,
      );

      final asLocal = _deviceLocal(fire);
      expect(asLocal.day, 18);
      expect(asLocal.hour, 9);
      expect(fire.isAfter(tz.TZDateTime.from(now.toUtc(), tz.local)), isTrue);
    });

    test('rolls over a month boundary rather than producing day 32', () {
      final now = DateTime(2026, 8, 31, 23, 0);
      final fire = ReminderService.nextOccurrenceOf(
        const TimeOfDay(hour: 7, minute: 15),
        now: now,
      );

      final asLocal = _deviceLocal(fire);
      expect(asLocal.month, 9);
      expect(asLocal.day, 1);
      expect(asLocal.hour, 7);
      expect(asLocal.minute, 15);
    });

    test('a time exactly equal to now goes to tomorrow, not right now', () {
      final now = DateTime(2026, 8, 17, 9, 0);
      final fire = ReminderService.nextOccurrenceOf(
        const TimeOfDay(hour: 9, minute: 0),
        now: now,
      );

      expect(_deviceLocal(fire).day, 18);
    });
  });
}
