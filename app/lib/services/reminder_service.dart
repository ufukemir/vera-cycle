import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest.dart' as tz_data;
import 'package:timezone/timezone.dart' as tz;

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

  static const _upcomingPeriodId = 1;

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

  /// Replaces any previously scheduled "upcoming period" reminder — there is
  /// only ever one, since a new prediction supersedes the old one rather
  /// than stacking reminders.
  Future<void> scheduleUpcomingPeriodReminder({
    required DateTime fireAtLocalWallClock,
    required String title,
    required String body,
  }) async {
    await _ensureInitialized();
    final target = tz.TZDateTime.from(fireAtLocalWallClock.toUtc(), tz.local);
    if (!target.isAfter(tz.TZDateTime.now(tz.local))) return;

    await _plugin.zonedSchedule(
      id: _upcomingPeriodId,
      title: title,
      body: body,
      scheduledDate: target,
      notificationDetails: const NotificationDetails(
        android: AndroidNotificationDetails(
          'upcoming_period',
          'Upcoming period',
        ),
        iOS: DarwinNotificationDetails(),
      ),
      // Inexact rather than exact: a period reminder firing within a rough
      // window of the target time is fine, and this avoids requesting
      // Android's SCHEDULE_EXACT_ALARM permission — a fairly invasive prompt
      // for what's explicitly a default-off convenience feature.
      androidScheduleMode: AndroidScheduleMode.inexactAllowWhileIdle,
    );
  }

  Future<void> cancelAll() async {
    await _ensureInitialized();
    await _plugin.cancelAll();
  }
}
