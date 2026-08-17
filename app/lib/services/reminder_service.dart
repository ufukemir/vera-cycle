import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest.dart' as tz_data;
import 'package:timezone/timezone.dart' as tz;

/// One independently toggleable reminder category — each has its own
/// notification id, so turning one off (or rescheduling it after new data
/// comes in) never disturbs the others.
enum ReminderCategory {
  periodStart(1, 'period_start', 'Upcoming period'),
  periodEnd(2, 'period_end', 'Period end check-in'),
  medication(3, 'medication', 'Medication'),
  water(4, 'water', 'Water'),
  appointment(5, 'appointment', 'Appointment'),
  ovulation(6, 'ovulation', 'Fertile window'),
  backup(7, 'backup', 'Backup reminder');

  const ReminderCategory(this.notificationId, this.channelId, this.channelName);

  final int notificationId;
  final String channelId;
  final String channelName;
}

/// Local-only notification scheduling — no push server exists, so
/// "scheduling" means asking the OS to fire the notification itself at a
/// future instant.
///
/// [tz.local] is deliberately pinned to the UTC location rather than the
/// device's real IANA timezone (which would need the `flutter_timezone`
/// plugin just to look up). This is still correct: callers pass a plain
/// local-wall-clock [DateTime], which gets converted with Dart's own
/// [DateTime.toUtc] — that conversion already uses the OS's real timezone
/// rules for the specific date (including future DST transitions), so the
/// notification fires at the right real-world instant. Pinning [tz.local] to
/// UTC only means "the zone the already-correct UTC instant is labelled in,"
/// not "the zone used to compute the instant."
class ReminderService {
  ReminderService({FlutterLocalNotificationsPlugin? plugin})
      : _plugin = plugin ?? FlutterLocalNotificationsPlugin();

  final FlutterLocalNotificationsPlugin _plugin;
  bool _initialized = false;

  Future<void> _ensureInitialized() async {
    if (_initialized) return;
    tz_data.initializeTimeZones();
    tz.setLocalLocation(tz.getLocation('UTC'));

    const androidInit = AndroidInitializationSettings('@mipmap/ic_launcher');
    const darwinInit = DarwinInitializationSettings();
    await _plugin.initialize(
      settings: const InitializationSettings(android: androidInit, iOS: darwinInit),
    );
    _initialized = true;
  }

  /// Prompts for notification permission (Android 13+, iOS). Returns `true`
  /// if granted or if the platform doesn't require an explicit prompt.
  Future<bool> requestPermission() async {
    await _ensureInitialized();
    final androidGranted = await _plugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.requestNotificationsPermission();
    final iosGranted = await _plugin
        .resolvePlatformSpecificImplementation<
            IOSFlutterLocalNotificationsPlugin>()
        ?.requestPermissions(alert: true, badge: true, sound: true);
    return (androidGranted ?? true) && (iosGranted ?? true);
  }

  /// Schedules a single one-off notification for [category], replacing any
  /// previous one under the same id — used for date-anchored reminders
  /// (upcoming period, an estimated period end, a specific appointment) that
  /// supersede rather than stack as new data comes in.
  Future<void> scheduleOneOff({
    required ReminderCategory category,
    required DateTime fireAtLocalWallClock,
    required String title,
    required String body,
  }) async {
    await _ensureInitialized();
    final target = tz.TZDateTime.from(fireAtLocalWallClock.toUtc(), tz.local);
    if (!target.isAfter(tz.TZDateTime.now(tz.local))) {
      await _plugin.cancel(id: category.notificationId);
      return;
    }

    await _plugin.zonedSchedule(
      id: category.notificationId,
      title: title,
      body: body,
      scheduledDate: target,
      notificationDetails: NotificationDetails(
        android: AndroidNotificationDetails(category.channelId, category.channelName),
        iOS: const DarwinNotificationDetails(),
      ),
      // Inexact rather than exact: firing within a rough window of the
      // target time is fine for every category here, and this avoids
      // requesting Android's SCHEDULE_EXACT_ALARM permission — a fairly
      // invasive prompt for what's explicitly a default-off convenience
      // feature.
      androidScheduleMode: AndroidScheduleMode.inexactAllowWhileIdle,
    );
  }

  /// Schedules a daily-repeating notification for [category] at [time] —
  /// used for medication/water, which aren't anchored to a predicted date.
  Future<void> scheduleDaily({
    required ReminderCategory category,
    required TimeOfDay time,
    required String title,
    required String body,
  }) async {
    await _ensureInitialized();
    final now = tz.TZDateTime.now(tz.local);
    var first = tz.TZDateTime(
      tz.local,
      now.year,
      now.month,
      now.day,
      time.hour,
      time.minute,
    );
    if (!first.isAfter(now)) {
      first = first.add(const Duration(days: 1));
    }

    await _plugin.zonedSchedule(
      id: category.notificationId,
      title: title,
      body: body,
      scheduledDate: first,
      notificationDetails: NotificationDetails(
        android: AndroidNotificationDetails(category.channelId, category.channelName),
        iOS: const DarwinNotificationDetails(),
      ),
      androidScheduleMode: AndroidScheduleMode.inexactAllowWhileIdle,
      matchDateTimeComponents: DateTimeComponents.time,
    );
  }

  Future<void> cancel(ReminderCategory category) async {
    await _ensureInitialized();
    await _plugin.cancel(id: category.notificationId);
  }

  Future<void> cancelAll() async {
    await _ensureInitialized();
    await _plugin.cancelAll();
  }
}
