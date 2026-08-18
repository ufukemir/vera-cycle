import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
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

  const ReminderCategory(this.notificationId, this.channelId, this.fallbackName);

  final int notificationId;
  final String channelId;

  /// English name, used only if a caller cannot supply a localized one.
  ///
  /// Android shows the channel name in Settings → Apps → Vera →
  /// Notifications. These literals used to be passed straight through, so
  /// every user in every language read an English list there — while the
  /// custom-reminder channel right beside it was correctly localized.
  /// Callers now pass [channelName]; this stays as a last resort.
  final String fallbackName;
}

/// Local-only notification scheduling — no push server exists, so
/// "scheduling" means asking the OS to fire the notification itself at a
/// future instant.
///
/// [tz.local] is resolved to the device's real IANA timezone via
/// `flutter_timezone`, falling back to UTC if that lookup fails.
///
/// It used to be pinned to UTC unconditionally, which broke in two layers.
/// First, the daily paths built their fire time directly in [tz.local] and
/// so read the user's picked time as a UTC wall clock — a reminder set for
/// 09:00 fired at 12:00 in Istanbul. Second, even once the instant was
/// computed correctly, `matchDateTimeComponents: DateTimeComponents.time`
/// matches the time-of-day *in [tz.local]*, so a UTC-pinned repeat held its
/// UTC instant and slid an hour against the user's clock at every DST
/// transition. Only the real zone fixes the second one; there is nothing to
/// compute your way out of.
///
/// `flutter_timezone` was weighed against CLAUDE.md principle 3 before being
/// added: it opens no socket and sends no telemetry — it reads one string
/// from the OS. That is a different class of thing from an analytics or
/// crash-reporting SDK.
///
/// Fire times are still built as a plain local-wall-clock [DateTime] and
/// converted with [DateTime.toUtc] (see [nextOccurrenceOf]). That is
/// belt-and-braces: it stays correct even in the UTC-fallback case.
class ReminderService {
  ReminderService({FlutterLocalNotificationsPlugin? plugin})
      : _plugin = plugin ?? FlutterLocalNotificationsPlugin();

  final FlutterLocalNotificationsPlugin _plugin;
  bool _initialized = false;

  /// Loads the zone database and pins [tz.local] to UTC.
  ///
  /// Split out from [_ensureInitialized] so it can be tested without the
  /// plugin: this is the step that broke, and neither the notifications
  /// plugin nor `flutter_timezone`'s platform interface can be instantiated
  /// under `flutter test`.
  @visibleForTesting
  static void initializeTimezoneDatabase() {
    tz_data.initializeTimeZones();
    // tz.UTC, not getLocation('UTC'): UTC is a built-in constant and is not
    // a row in the zone database, so the lookup threw "Location with the
    // name UTC doesn't exist" — before any plugin call, which made every
    // reminder action (including the onboarding "Turn on reminders" button)
    // fail silently.
    tz.setLocalLocation(tz.UTC);
  }

  /// Upgrades [tz.local] from the UTC fallback to the device's real zone.
  ///
  /// Deliberately non-fatal: if the lookup fails or returns a name the
  /// database doesn't carry, reminders stay on the UTC fallback — which
  /// still fires at the right instant (see [nextOccurrenceOf]) and only
  /// loses the DST follow-through. A missing timezone must never be the
  /// reason a reminder cannot be set at all.
  static Future<void> _adoptDeviceTimezone() async {
    try {
      final name = await FlutterTimezone.getLocalTimezone();
      tz.setLocalLocation(tz.getLocation(name.identifier));
    } catch (_) {
      // Keep the UTC fallback set by initializeTimezoneDatabase().
    }
  }

  Future<void> _ensureInitialized() async {
    if (_initialized) return;
    initializeTimezoneDatabase();
    await _adoptDeviceTimezone();

    const androidInit = AndroidInitializationSettings('@mipmap/ic_launcher');
    const darwinInit = DarwinInitializationSettings();
    await _plugin.initialize(
      settings: const InitializationSettings(android: androidInit, iOS: darwinInit),
    );
    _initialized = true;
  }

  /// The next real-world instant at which the wall clock reads [time] on
  /// the *device's* clock.
  ///
  /// The daily paths used to build this as `TZDateTime(tz.local, …, hour,
  /// minute)` back when [tz.local] was pinned to UTC, which read the user's
  /// picked time as a UTC wall clock: a reminder set for 09:00 in Istanbul
  /// fired at 12:00. Going through a plain [DateTime] and [DateTime.toUtc]
  /// uses the OS's real zone rules for that date, exactly as
  /// [scheduleOneOff] already did.
  ///
  /// Kept in this form even now that [tz.local] is the device's real zone:
  /// it is the one construction that stays correct in the UTC-fallback case
  /// too, so a failed timezone lookup degrades to "loses DST follow-through"
  /// rather than "fires at the wrong hour".
  ///
  /// The DST follow-through itself comes from [tz.local] being real — the
  /// repeat is anchored with [DateTimeComponents.time], which matches the
  /// time-of-day *in [tz.local]*.
  @visibleForTesting
  static tz.TZDateTime nextOccurrenceOf(TimeOfDay time, {DateTime? now}) {
    final localNow = now ?? DateTime.now();
    var first = DateTime(
      localNow.year,
      localNow.month,
      localNow.day,
      time.hour,
      time.minute,
    );
    if (!first.isAfter(localNow)) {
      first = DateTime(
        localNow.year,
        localNow.month,
        localNow.day + 1,
        time.hour,
        time.minute,
      );
    }
    return tz.TZDateTime.from(first.toUtc(), tz.local);
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
    String? channelName,
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
        android: AndroidNotificationDetails(
            category.channelId, channelName ?? category.fallbackName),
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
    String? channelName,
  }) async {
    await _ensureInitialized();

    await _plugin.zonedSchedule(
      id: category.notificationId,
      title: title,
      body: body,
      scheduledDate: nextOccurrenceOf(time),
      notificationDetails: NotificationDetails(
        android: AndroidNotificationDetails(
            category.channelId, channelName ?? category.fallbackName),
        iOS: const DarwinNotificationDetails(),
      ),
      androidScheduleMode: AndroidScheduleMode.inexactAllowWhileIdle,
      matchDateTimeComponents: DateTimeComponents.time,
    );
  }

  /// A daily reminder outside the fixed [ReminderCategory] set — used by
  /// user-authored reminders, which need their own ids.
  Future<void> scheduleCustomDaily({
    required int notificationId,
    required TimeOfDay time,
    required String title,
    required String channelName,
  }) async {
    await _ensureInitialized();

    await _plugin.zonedSchedule(
      id: notificationId,
      title: title,
      // No body: the user wrote the title, and inventing a second line would
      // put words in their mouth on their lock screen.
      body: '',
      scheduledDate: nextOccurrenceOf(time),
      notificationDetails: NotificationDetails(
        // Localized by the caller: this string is what the user sees in
        // the Android system notification settings, so leaving it in
        // English put one untranslated label in an otherwise translated app.
        android: AndroidNotificationDetails('custom', channelName),
        iOS: const DarwinNotificationDetails(),
      ),
      androidScheduleMode: AndroidScheduleMode.inexactAllowWhileIdle,
      matchDateTimeComponents: DateTimeComponents.time,
    );
  }

  /// Brings the OS's pending custom notifications back in line with the
  /// stored list.
  ///
  /// Custom reminders were only ever handed to the OS at the instant the
  /// user created, edited or toggled them. Anything that cleared pending
  /// notifications behind their back — "erase everything", an OS that
  /// dropped them, a restore onto a new device — left the list saying ON
  /// with nothing scheduled. This also cancels ids that no longer have a
  /// record, which is how a delete that failed mid-way gets cleaned up.
  ///
  /// [wanted] is the reminders that should be live: enabled, and only
  /// while Premium is active.
  Future<void> reconcileCustomReminders({
    required Iterable<({int notificationId, TimeOfDay time, String title})>
        wanted,
    required Iterable<int> knownIds,
    required String channelName,
  }) async {
    await _ensureInitialized();

    final live = {for (final r in wanted) r.notificationId};
    for (final id in knownIds) {
      if (!live.contains(id)) await _plugin.cancel(id: id);
    }
    for (final reminder in wanted) {
      await scheduleCustomDaily(
        notificationId: reminder.notificationId,
        time: reminder.time,
        title: reminder.title,
        channelName: channelName,
      );
    }
  }

  Future<void> cancelId(int notificationId) async {
    await _ensureInitialized();
    await _plugin.cancel(id: notificationId);
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
