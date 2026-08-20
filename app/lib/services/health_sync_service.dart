import 'dart:io';

import 'package:health/health.dart';

import '../models/day_log.dart';
import '../models/enums.dart';

/// One-way export of a few data types to Apple Health / Health Connect.
///
/// Deliberately **write-only and opt-in**. Reading back would mean asking
/// for read scopes on someone's whole health record to solve a problem
/// they don't have; writing is what actually helps — it stops Vera being
/// a silo, so leaving the app doesn't mean losing the data to the system
/// health record too.
///
/// Only three types are written: menstrual flow, weight, and basal body
/// temperature. Symptoms, moods, notes and the intimate trackers stay in
/// Vera's encrypted store and are never handed to the OS health database.
class HealthSyncService {
  HealthSyncService({Health? health}) : _health = health ?? Health();

  final Health _health;
  bool _configured = false;

  static const _types = [
    HealthDataType.MENSTRUATION_FLOW,
    HealthDataType.WEIGHT,
    HealthDataType.BODY_TEMPERATURE,
  ];

  static bool get isSupported => Platform.isAndroid || Platform.isIOS;

  Future<void> _ensureConfigured() async {
    if (_configured) return;
    await _health.configure();
    _configured = true;
  }

  /// Asks for write permission. Returns false on any refusal or on
  /// platforms without a health store — callers treat that as "stay off".
  Future<bool> requestPermissions() async {
    if (!isSupported) return false;
    try {
      await _ensureConfigured();
      return await _health.requestAuthorization(
        _types,
        permissions: List.filled(_types.length, HealthDataAccess.WRITE),
      );
    } on Object {
      return false;
    }
  }

  /// Whether [before] and [after] differ in anything this service exports.
  ///
  /// The day-log screen saves on every tap and every debounced keystroke,
  /// so without this check a single afternoon of logging symptoms, moods
  /// and a note fired dozens of health writes that all carried identical
  /// values. Keeping the knowledge of *which* fields are exported next to
  /// the code that exports them means the two can't drift apart.
  static bool exportedFieldsDiffer(DayLog? before, DayLog after) {
    if (before == null) {
      return after.flow != null ||
          after.weightKg != null ||
          after.basalTempC != null;
    }
    return before.flow != after.flow ||
        before.weightKg != after.weightKg ||
        before.basalTempC != after.basalTempC;
  }

  /// Writes whatever [log] has that maps to a health type, replacing
  /// whatever Vera wrote for that day before. Silent on failure by design:
  /// a rejected health write must never block or undo saving the day
  /// locally, which is the source of truth.
  ///
  /// Each type is cleared over the day's range first. Appending without
  /// that left every edit behind as its own record — correct the weight
  /// three times and the health app showed three weights for one day —
  /// and re-running the backfill duplicated the entire history. Clearing
  /// also means deleting a value in Vera deletes it in the health app,
  /// which is what "Vera is the source of truth" has to mean if it means
  /// anything.
  ///
  /// The delete is safe to run unconditionally: both platforms scope it to
  /// records this app wrote — HealthKit via an `HKSource.default()`
  /// predicate, Health Connect by refusing to delete other apps' records —
  /// so a smart scale's weight entries are never touched.
  Future<void> writeDay(DayLog log) async {
    if (!isSupported) return;
    try {
      await _ensureConfigured();
      final start = log.date;
      final end = start.add(const Duration(hours: 23, minutes: 59));

      await _clearDay(HealthDataType.MENSTRUATION_FLOW, start, end);
      await _clearDay(HealthDataType.WEIGHT, start, end);
      await _clearDay(HealthDataType.BODY_TEMPERATURE, start, end);

      final flow = _mapFlow(log.flow);
      if (flow != null) {
        await _health.writeMenstruationFlow(
          flow: flow,
          startTime: start,
          endTime: end,
          // Vera can't know from one day's entry whether it's day 1 —
          // CycleAnalyzer decides that from the whole history, so this
          // stays false rather than asserting something it hasn't checked.
          isStartOfCycle: false,
          recordingMethod: RecordingMethod.manual,
        );
      }

      if (log.weightKg != null) {
        await _health.writeHealthData(
          value: log.weightKg!,
          type: HealthDataType.WEIGHT,
          startTime: start,
          endTime: start,
          recordingMethod: RecordingMethod.manual,
        );
      }

      if (log.basalTempC != null) {
        await _health.writeHealthData(
          value: log.basalTempC!,
          type: HealthDataType.BODY_TEMPERATURE,
          startTime: start,
          endTime: start,
          recordingMethod: RecordingMethod.manual,
        );
      }
    } on Object {
      // Permission revoked, Health Connect missing, type unavailable on
      // this device — none of which should surface as an app error.
    }
  }

  /// Removes Vera's own records of one type for one day, so the write that
  /// follows replaces rather than appends.
  Future<void> _clearDay(
      HealthDataType type, DateTime start, DateTime end) async {
    try {
      await _health.delete(type: type, startTime: start, endTime: end);
    } on Object {
      // Nothing stored yet, or this type isn't available on the device.
      // The write below is still worth attempting either way.
    }
  }

  /// Backfills existing history after the user first turns sync on.
  /// Returns how many days were attempted.
  Future<int> writeAll(List<DayLog> logs) async {
    if (!isSupported) return 0;
    var count = 0;
    for (final log in logs) {
      if (log.flow == null && log.weightKg == null && log.basalTempC == null) {
        continue;
      }
      await writeDay(log);
      count++;
    }
    return count;
  }

  static MenstrualFlow? _mapFlow(FlowIntensity? flow) => switch (flow) {
        FlowIntensity.spotting => MenstrualFlow.spotting,
        FlowIntensity.light => MenstrualFlow.light,
        FlowIntensity.medium => MenstrualFlow.medium,
        FlowIntensity.heavy => MenstrualFlow.heavy,
        null => null,
      };
}
