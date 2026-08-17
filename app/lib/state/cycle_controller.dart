import 'package:flutter/foundation.dart';

import '../models/cycle.dart';
import '../models/day_log.dart';
import '../models/enums.dart';
import '../models/prediction.dart';
import '../services/cycle_analyzer.dart';
import '../services/day_log_repository.dart';
import '../services/health_sync_service.dart';
import '../services/prediction_engine.dart';
import '../util/day.dart';

/// The app's single source of truth for cycle data and everything derived
/// from it (cycles, prediction, current status).
///
/// Mutations update the in-memory log list with the already-tested pure
/// [applyUpsert]/[applyDelete] functions and recompute derived state
/// synchronously, then persist the *whole* list via
/// [DayLogRepository.replaceAll] in one write. This deliberately bypasses
/// [DayLogRepository.upsert]/[DayLogRepository.delete] on the write path:
/// those methods each do their own `loadAll()` (a full decrypt) before
/// writing, which is correct for a caller with no existing state but would
/// mean re-decrypting the whole file on every symptom tap here, where the
/// controller already holds the authoritative list in memory.
class CycleController extends ChangeNotifier {
  CycleController({
    required DayLogRepository repository,
    CycleAnalyzer analyzer = const CycleAnalyzer(),
    PredictionEngine predictionEngine = const PredictionEngine(),
    HealthSyncService? healthSync,
  })  : _repository = repository,
        _analyzer = analyzer,
        _predictionEngine = predictionEngine,
        _healthSync = healthSync;

  /// Set only when the user has opted into health export. Null keeps the
  /// controller free of platform channels, which is what tests rely on.
  HealthSyncService? _healthSync;

  set healthSync(HealthSyncService? value) => _healthSync = value;

  final DayLogRepository _repository;
  final CycleAnalyzer _analyzer;
  PredictionEngine _predictionEngine;

  bool _loading = true;
  List<DayLog> _logs = const [];
  List<ObservedCycle> _cycles = const [];
  CyclePrediction _prediction = const CyclePrediction.insufficient();

  bool get loading => _loading;
  List<DayLog> get logs => _logs;
  List<ObservedCycle> get cycles => _cycles;
  CyclePrediction get prediction => _prediction;

  CycleStatus statusOn(DateTime date) => _predictionEngine.status(
        cycles: _cycles,
        prediction: _prediction,
        on: date,
      );

  CycleStatus get todayStatus => statusOn(today());

  DayLog? logFor(DateTime date) {
    for (final log in _logs) {
      if (isSameDay(log.date, date)) return log;
    }
    return null;
  }

  Future<void> load() async {
    _loading = true;
    notifyListeners();

    _logs = await _repository.loadAll();
    _recompute();

    _loading = false;
    notifyListeners();
  }

  Future<void> upsertDay(DayLog log) async {
    _logs = applyUpsert(_logs, log);
    _recompute();
    notifyListeners();
    await _repository.replaceAll(_logs);
    // After the local write, never before: the encrypted store is the
    // source of truth and a health-export failure must not affect it.
    await _healthSync?.writeDay(log);
  }

  Future<void> deleteDay(DateTime date) async {
    _logs = applyDelete(_logs, date);
    _recompute();
    notifyListeners();
    await _repository.replaceAll(_logs);
  }

  /// One-tap "period started today" — creates today's log if absent, or
  /// upgrades it to menstrual flow if a lighter entry (e.g. spotting) already
  /// exists, without discarding any symptoms already logged for the day.
  Future<void> markPeriodStartedToday() async {
    final existing = logFor(today());
    final updated =
        (existing ?? DayLog(date: today())).copyWith(flow: FlowIntensity.medium);
    await upsertDay(updated);
  }

  /// Swaps the prediction engine (e.g. after the user changes the luteal
  /// phase assumption in Settings) and immediately recomputes — real logged
  /// cycles are unaffected, only how they're interpreted.
  void updatePredictionEngine(PredictionEngine engine) {
    _predictionEngine = engine;
    _recompute();
    notifyListeners();
  }

  /// Restores a full history from a decrypted backup.
  Future<void> replaceAll(List<DayLog> logs) async {
    _logs = List.of(logs)..sort((a, b) => a.date.compareTo(b.date));
    _recompute();
    notifyListeners();
    await _repository.replaceAll(_logs);
  }

  Future<void> eraseEverything() async {
    await _repository.eraseEverything();
    _logs = const [];
    _recompute();
    notifyListeners();
  }

  void _recompute() {
    _cycles = _analyzer.analyze(_logs);
    _prediction = _predictionEngine.predict(_cycles);
  }
}
