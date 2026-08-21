import 'package:cycle_app/models/day_log.dart';
import 'package:cycle_app/models/enums.dart';
import 'package:cycle_app/services/day_log_repository.dart';
import 'package:cycle_app/services/health_sync_service.dart';
import 'package:cycle_app/services/in_memory_day_log_repository.dart';
import 'package:cycle_app/services/pin_vault.dart';
import 'package:cycle_app/state/app_lock_controller.dart';
import 'package:cycle_app/state/assistant_conversation.dart';
import 'package:cycle_app/state/cycle_controller.dart';
import 'package:cycle_app/theme/app_theme.dart';
import 'package:cycle_app/util/day.dart';
import 'package:cycle_app/widgets/illustrations.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_test/flutter_test.dart';

/// Each of these locks in a bug found on 2026-08-20. They share a shape:
/// nothing threw, nothing looked broken in a widget test, and the failure
/// only showed up on a real device or in a real theme.

/// Counts writes so "one import, one write" is testable.
class _CountingRepository implements DayLogRepository {
  _CountingRepository(this._inner);

  final DayLogRepository _inner;
  int writes = 0;

  @override
  Future<List<DayLog>> loadAll() => _inner.loadAll();

  @override
  Future<void> replaceAll(List<DayLog> logs) {
    writes++;
    return _inner.replaceAll(logs);
  }

  @override
  Future<void> upsert(DayLog log) => _inner.upsert(log);

  @override
  Future<void> delete(DateTime date) => _inner.delete(date);

  @override
  Future<void> eraseEverything() => _inner.eraseEverything();
}

class _RecordingHealthSync extends HealthSyncService {
  final written = <DateTime>[];

  @override
  Future<void> writeDay(DayLog log) async => written.add(log.date);
}

void main() {
  group('the app lock and the sheets the app opens itself', () {
    late AppLockController lock;

    setUp(() {
      lock = AppLockController(pinVault: PinVault())..unlockAfterSetup();
    });

    tearDown(() => lock.dispose());

    test('inactive does not lock', () {
      // Face ID prompts, permission alerts and Control Centre all report
      // inactive. Locking on it made the biometric prompt race its own
      // lock screen.
      lock.didChangeAppLifecycleState(AppLifecycleState.inactive);
      expect(lock.state, AppLockState.unlocked);
    });

    test('actually leaving the foreground still locks', () {
      lock.didChangeAppLifecycleState(AppLifecycleState.paused);
      expect(lock.state, AppLockState.locked);
    });

    test('a share sheet or file picker does not lock', () async {
      await lock.duringSystemSheet(() async {
        lock.didChangeAppLifecycleState(AppLifecycleState.paused);
        expect(
          lock.state,
          AppLockState.unlocked,
          reason: 'the picker would be unmounted mid-await',
        );
      });
      lock.didChangeAppLifecycleState(AppLifecycleState.resumed);
      expect(lock.state, AppLockState.unlocked);
    });

    test('the suspension ends with the sheet, not after it', () {
      lock.didChangeAppLifecycleState(AppLifecycleState.paused);
      expect(
        lock.state,
        AppLockState.locked,
        reason: 'no sheet is open, so this is an ordinary backgrounding',
      );
    });
  });

  group('health export', () {
    test('an edit that touches no exported field is not synced', () async {
      final sync = _RecordingHealthSync();
      final controller = CycleController(
        repository: InMemoryDayLogRepository(),
        healthSync: sync,
      );

      await controller.upsertDay(
        DayLog(date: today(), flow: FlowIntensity.medium),
      );
      expect(sync.written, hasLength(1));

      // The day-log screen saves on every tap; a symptom is not a health
      // type, so this must not become a second record for the same day.
      await controller.upsertDay(
        DayLog(
          date: today(),
          flow: FlowIntensity.medium,
          symptoms: const {Symptom.cramps},
        ),
      );
      expect(sync.written, hasLength(1));

      // Changing the flow itself is a real change and does sync.
      await controller.upsertDay(
        DayLog(
          date: today(),
          flow: FlowIntensity.heavy,
          symptoms: const {Symptom.cramps},
        ),
      );
      expect(sync.written, hasLength(2));
    });

    test('detaching the service stops the writes immediately', () async {
      final sync = _RecordingHealthSync();
      final controller = CycleController(
        repository: InMemoryDayLogRepository(),
        healthSync: sync,
      );

      // Turning the setting off used to leave this attached until the next
      // app launch, so an export the user had switched off kept running.
      controller.healthSync = null;
      await controller.upsertDay(
        DayLog(date: today(), flow: FlowIntensity.medium),
      );
      expect(sync.written, isEmpty);
    });

    test('exportedFieldsDiffer only fires on exported fields', () {
      final base = DayLog(date: today(), weightKg: 60);
      expect(
        HealthSyncService.exportedFieldsDiffer(
          base,
          base.copyWith(mood: Mood.calm),
        ),
        isFalse,
      );
      expect(
        HealthSyncService.exportedFieldsDiffer(
          base,
          base.copyWith(weightKg: 61),
        ),
        isTrue,
      );
      expect(
        HealthSyncService.exportedFieldsDiffer(null, DayLog(date: today())),
        isFalse,
      );
    });
  });

  group('CSV import', () {
    test('a whole import is one write, and existing days win', () async {
      final repo = _CountingRepository(InMemoryDayLogRepository());
      final controller = CycleController(repository: repo);
      await controller.upsertDay(
        DayLog(date: today(), flow: FlowIntensity.heavy),
      );
      repo.writes = 0;

      final added = await controller.addMissingDays([
        // Same day as an existing entry: the deliberate one must survive.
        DayLog(date: today(), flow: FlowIntensity.light),
        for (var i = 1; i <= 40; i++) DayLog(date: addDays(today(), -i)),
      ]);

      expect(added, 40);
      expect(
        repo.writes,
        1,
        reason: 'per-row upsert re-encrypted the whole store 40 times',
      );
      expect(controller.logFor(today())?.flow, FlowIntensity.heavy);
    });
  });

  group('theme', () {
    test('dark mode uses light ink', () {
      // Both themes were built from Typography's *black* text theme, so in
      // dark mode every string that did not set its own colour was painted
      // near-black on a near-black surface and simply vanished.
      final dark = buildDarkAppTheme();
      final light = buildAppTheme();

      double luminance(Color? c) => c!.computeLuminance();

      expect(
        luminance(dark.textTheme.titleMedium?.color),
        greaterThan(luminance(dark.colorScheme.surface)),
        reason: 'dark-mode body ink must be lighter than the surface',
      );
      expect(
        luminance(light.textTheme.titleMedium?.color),
        lessThan(luminance(light.colorScheme.surface)),
      );
    });

    test('chip labels keep the app font', () {
      // RawChip resolves the label *colour* per state but uses the
      // TextStyle verbatim, so a WidgetStateTextStyle silently degraded to
      // the empty style it subclasses — dropping the family and size.
      for (final theme in [buildAppTheme(), buildDarkAppTheme()]) {
        final label = theme.chipTheme.labelStyle;
        // fontSize is deliberately not asserted: Typography leaves it to
        // the Material defaults at this layer, so it is null here in a
        // perfectly healthy theme. The family is the thing that broke.
        expect(
          label?.fontFamily,
          'Quicksand',
          reason: 'chip labels fell back to the platform font',
        );
      }
    });

    test('a selected chip is not the colour of the card behind it', () {
      // Selected chips were filled with primaryContainer, which is exactly
      // the flow card's own background — the selection disappeared into it.
      for (final theme in [buildAppTheme(), buildDarkAppTheme()]) {
        final selected = theme.chipTheme.color?.resolve({WidgetState.selected});
        expect(selected, isNot(theme.colorScheme.primaryContainer));
      }
    });
  });

  group('widgets', () {
    testWidgets('a mascot avatar set to none disposes cleanly', (tester) async {
      // The controller was a lazy `late` field that build never touched for
      // Mascot.none, so dispose() was what first created it — building a
      // ticker against an already-deactivated element.
      await tester.pumpWidget(
        const MaterialApp(home: MascotAvatar(mascot: Mascot.none)),
      );
      await tester.pumpWidget(const MaterialApp(home: SizedBox()));
      expect(tester.takeException(), isNull);
    });
  });

  group('assistant', () {
    testWidgets('opens from Home without losing its provider', (tester) async {
      // The conversation is provided by HomeShell, below the Navigator, so
      // pushing the assistant as a route put it outside that scope and it
      // threw ProviderNotFoundException on open — a crash screen, on a tab
      // that had worked for weeks, caused by moving it off the bottom bar.
      final conversation = AssistantConversation();
      addTearDown(conversation.dispose);

      await tester.pumpWidget(
        MaterialApp(
          home: ChangeNotifierProvider<AssistantConversation>.value(
            value: conversation,
            child: Builder(
              builder: (context) => Scaffold(
                body: TextButton(
                  onPressed: () {
                    final held = context.read<AssistantConversation>();
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) =>
                            ChangeNotifierProvider<AssistantConversation>.value(
                              value: held,
                              child: Builder(
                                builder: (inner) => Text(
                                  '${inner.watch<AssistantConversation>().isEmpty}',
                                ),
                              ),
                            ),
                      ),
                    );
                  },
                  child: const Text('open'),
                ),
              ),
            ),
          ),
        ),
      );

      await tester.tap(find.text('open'));
      await tester.pumpAndSettle();
      expect(tester.takeException(), isNull);
      expect(find.text('true'), findsOneWidget);
    });

    test('the conversation survives until it is ended deliberately', () {
      // It used to live in the tab's State, which the shell disposes on
      // every tab switch — glancing at the calendar wiped the chat.
      final conversation = AssistantConversation()
        ..addUserMessage('merhaba')
        ..addReply('Merhaba.', const ['a', 'b']);

      expect(conversation.isEmpty, isFalse);
      expect(conversation.messages, hasLength(2));
      expect(conversation.typing, isFalse);

      conversation.clear();
      expect(conversation.isEmpty, isTrue);
      expect(conversation.followUps, isEmpty);
    });
  });
}
