import 'package:cycle_app/models/day_log.dart';
import 'package:cycle_app/models/enums.dart';
import 'package:cycle_app/services/in_memory_day_log_repository.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('starts empty', () async {
    final repo = InMemoryDayLogRepository();
    expect(await repo.loadAll(), isEmpty);
  });

  test('upsert then loadAll round-trips a log', () async {
    final repo = InMemoryDayLogRepository();

    await repo.upsert(
      DayLog(date: DateTime(2026, 5, 1), flow: FlowIntensity.medium),
    );

    final all = await repo.loadAll();
    expect(all, hasLength(1));
    expect(all.single.flow, FlowIntensity.medium);
  });

  test('delete removes a log', () async {
    final repo = InMemoryDayLogRepository();
    await repo.upsert(
      DayLog(date: DateTime(2026, 5, 1), flow: FlowIntensity.medium),
    );

    await repo.delete(DateTime(2026, 5, 1));

    expect(await repo.loadAll(), isEmpty);
  });

  test('replaceAll swaps the entire history', () async {
    final repo = InMemoryDayLogRepository([
      DayLog(date: DateTime(2026, 1, 1), flow: FlowIntensity.medium),
    ]);

    await repo.replaceAll([
      DayLog(date: DateTime(2026, 2, 1), flow: FlowIntensity.light),
      DayLog(date: DateTime(2026, 2, 2), flow: FlowIntensity.light),
    ]);

    final all = await repo.loadAll();
    expect(all, hasLength(2));
    expect(all.first.date, DateTime(2026, 2, 1));
  });

  test('eraseEverything empties the store', () async {
    final repo = InMemoryDayLogRepository([
      DayLog(date: DateTime(2026, 1, 1), flow: FlowIntensity.medium),
    ]);

    await repo.eraseEverything();

    expect(await repo.loadAll(), isEmpty);
  });

  test('loadAll returns a snapshot that later writes cannot mutate', () async {
    final repo = InMemoryDayLogRepository();
    await repo.upsert(
      DayLog(date: DateTime(2026, 1, 1), flow: FlowIntensity.medium),
    );

    final snapshot = await repo.loadAll();
    await repo.upsert(
      DayLog(date: DateTime(2026, 1, 2), flow: FlowIntensity.medium),
    );

    expect(snapshot, hasLength(1));
  });
}
