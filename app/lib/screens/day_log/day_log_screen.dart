import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../l10n/app_localizations.dart';
import '../../models/day_log.dart';
import '../../state/app_preferences.dart';
import '../../state/cycle_controller.dart';
import '../../theme/app_theme.dart';
import '../insights/tracker_history_screen.dart' show TrackerType;
import 'widgets/custom_tags_section.dart';
import 'widgets/energy_selector.dart';
import 'widgets/fertility_status_banner.dart';
import 'widgets/flow_selector.dart';
import 'widgets/medications_section.dart';
import 'widgets/mood_selector.dart';
import 'widgets/mucus_history_summary.dart';
import 'widgets/note_field.dart';
import 'widgets/optional_trackers_section.dart';
import 'widgets/quick_stats_row.dart';
import 'widgets/section_card.dart';
import 'widgets/skin_hair_multiselect.dart';
import 'widgets/symptom_multiselect.dart';

/// A single day's log. Autosaves on every change — chip/selector taps commit
/// immediately, the note field debounces ~400ms — so backgrounding
/// mid-entry (which, per the app-lock policy, happens on every app switch)
/// never loses data.
///
/// There is no Save button, but silence about that is its own bug: users
/// typed a note and went looking for one. So each save flashes a "Saved"
/// confirmation in the app bar, and Done is there for anyone who wants an
/// explicit way out.
class DayLogScreen extends StatefulWidget {
  const DayLogScreen({super.key, required this.date, this.scrollTo});

  final DateTime date;

  /// Which section to land on when this screen opens — set when someone
  /// taps a tracker in the Takiplerin grid wanting to add today's entry,
  /// not read its history. `null` opens at the top, same as before.
  final TrackerType? scrollTo;

  @override
  State<DayLogScreen> createState() => _DayLogScreenState();
}

class _DayLogScreenState extends State<DayLogScreen> {
  late DayLog _current;
  late final TextEditingController _noteController;
  // Captured once rather than read per call: [_flushNote] runs from dispose,
  // where the element is already defunct and context lookups would throw.
  late final CycleController _cycles;
  Timer? _noteDebounce;
  Timer? _savedFlash;
  bool _showSaved = false;

  // One key per section a tracker tile can point at. Weight/sleep/water
  // share [_quickStatsKey] — they're three fields in one row, not three
  // scroll targets — and the optional-tracker keys are handed down to
  // [OptionalTrackersSection], which builds those cards itself.
  final _quickStatsKey = GlobalKey();
  final _symptomsKey = GlobalKey();
  final _moodKey = GlobalKey();
  final _energyKey = GlobalKey();
  final _optionalTrackerKeys = {
    TrackerType.bbt: GlobalKey(),
    TrackerType.sexualActivity: GlobalKey(),
    TrackerType.ovulationTest: GlobalKey(),
    TrackerType.breastExam: GlobalKey(),
  };

  GlobalKey? _keyFor(TrackerType type) => switch (type) {
    TrackerType.weight ||
    TrackerType.sleep ||
    TrackerType.water => _quickStatsKey,
    TrackerType.symptoms => _symptomsKey,
    TrackerType.mood => _moodKey,
    TrackerType.energy => _energyKey,
    TrackerType.bbt ||
    TrackerType.sexualActivity ||
    TrackerType.ovulationTest ||
    TrackerType.breastExam => _optionalTrackerKeys[type],
  };

  @override
  void initState() {
    super.initState();
    _cycles = context.read<CycleController>();
    _current = _cycles.logFor(widget.date) ?? DayLog(date: widget.date);
    _noteController = TextEditingController(text: _current.note ?? '');
    final target = widget.scrollTo;
    if (target != null) {
      _revealScrollTarget(target);
    }
  }

  /// Turns on [target]'s tracker if it's currently opt-in-and-off, then
  /// scrolls to its card once the resulting rebuild has actually inserted
  /// it into the tree.
  ///
  /// Tapping "Cinsel aktivite" (or BBT/ovulation test/breast exam) in the
  /// Takiplerin grid used to silently land at the top of the day if that
  /// tracker's Settings switch was still off — the grid shows all ten
  /// trackers regardless of which ones are enabled, so this was the common
  /// case, not an edge case, and it read as the tap doing nothing. Tapping
  /// a tracker by name is itself the opt-in: nobody taps "Cinsel aktivite"
  /// by accident.
  Future<void> _revealScrollTarget(TrackerType target) async {
    await _ensureTrackerEnabled(target);
    // The preference write is async (SharedPreferences), and its
    // notifyListeners() round-trips through AppPreferences before
    // OptionalTrackersSection rebuilds with the new card in the tree — one
    // post-frame callback isn't enough to guarantee that's landed yet.
    for (var i = 0; i < 3; i++) {
      await WidgetsBinding.instance.endOfFrame;
    }
    if (!mounted) return;
    final targetContext = _keyFor(target)?.currentContext;
    if (targetContext == null || !targetContext.mounted) return;
    await Scrollable.ensureVisible(
      targetContext,
      duration: const Duration(milliseconds: 350),
      curve: Curves.easeOut,
      alignment: 0.1,
    );
  }

  Future<void> _ensureTrackerEnabled(TrackerType target) async {
    final prefs = context.read<AppPreferences>();
    switch (target) {
      case TrackerType.bbt:
        if (!prefs.bbtTrackingEnabled) {
          await prefs.setBbtTrackingEnabled(true);
        }
      case TrackerType.sexualActivity:
        if (!prefs.sexualActivityTrackingEnabled) {
          await prefs.setSexualActivityTrackingEnabled(true);
        }
      case TrackerType.ovulationTest:
        if (!prefs.ovulationTestTrackingEnabled) {
          await prefs.setOvulationTestTrackingEnabled(true);
        }
      case TrackerType.breastExam:
        if (!prefs.breastExamTrackingEnabled) {
          await prefs.setBreastExamTrackingEnabled(true);
        }
      // weight/sleep/water/symptoms/mood/energy are never gated.
      case _:
        break;
    }
  }

  @override
  void dispose() {
    // Leaving within the debounce window — back gesture, app switch, Done —
    // must not drop the last keystrokes.
    _flushNote();
    _savedFlash?.cancel();
    _noteController.dispose();
    super.dispose();
  }

  void _save(DayLog updated) {
    setState(() {
      _current = updated;
      _showSaved = true;
    });
    _cycles.upsertDay(updated);
    _savedFlash?.cancel();
    _savedFlash = Timer(const Duration(seconds: 2), () {
      if (mounted) setState(() => _showSaved = false);
    });
  }

  void _onNoteChanged(String text) {
    _noteDebounce?.cancel();
    _noteDebounce = Timer(const Duration(milliseconds: 400), () {
      _save(_current.copyWith(note: text, clearNote: text.trim().isEmpty));
    });
  }

  /// Commits a pending note edit immediately. Deliberately avoids [_save]:
  /// this also runs after unmount, where setState would throw.
  void _flushNote() {
    if (_noteDebounce?.isActive != true) return;
    _noteDebounce!.cancel();
    final text = _noteController.text;
    _current = _current.copyWith(note: text, clearNote: text.trim().isEmpty);
    _cycles.upsertDay(_current);
  }

  /// The note field's own "Kaydet" button: unlike [_flushNote], this only
  /// ever runs from a live tap, so it can safely go through [_save] and
  /// give the same visible "Saved" confirmation every other field gets —
  /// the app-bar flash alone is easy to miss while the keyboard is open.
  void _saveNoteNow() {
    _noteDebounce?.cancel();
    final text = _noteController.text;
    _save(_current.copyWith(note: text, clearNote: text.trim().isEmpty));
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final dateLabel = DateFormat.yMMMMd(
      Localizations.localeOf(context).toString(),
    ).format(widget.date);
    final cycleController = context.watch<CycleController>();
    final mucusTrackingEnabled = context
        .watch<AppPreferences>()
        .mucusTrackingEnabled;

    return Scaffold(
      appBar: AppBar(
        title: Text(dateLabel),
        actions: [
          _SavedFlash(visible: _showSaved, label: l10n.dayLogSavedIndicator),
          TextButton(
            onPressed: () {
              _flushNote();
              Navigator.of(context).pop();
            },
            child: Text(l10n.actionDone),
          ),
          const SizedBox(width: 4),
        ],
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            FertilityStatusBanner(
              date: widget.date,
              status: cycleController.statusOn(widget.date),
            ),
            KeyedSubtree(
              key: _quickStatsKey,
              child: QuickStatsRow(
                waterIntakeMl: _current.waterIntakeMl,
                onWaterChanged: (v) => _save(
                  _current.copyWith(
                    waterIntakeMl: v,
                    clearWaterIntake: v == null,
                  ),
                ),
                sleepMinutes: _current.sleepMinutes,
                onSleepChanged: (v) => _save(
                  _current.copyWith(
                    sleepMinutes: v,
                    clearSleepMinutes: v == null,
                  ),
                ),
                weightKg: _current.weightKg,
                onWeightChanged: (v) => _save(
                  _current.copyWith(weightKg: v, clearWeight: v == null),
                ),
              ),
            ),
            const SizedBox(height: 24),
            DayLogSectionCard(
              icon: Icons.water_drop_outlined,
              title: l10n.dayLogFlowLabel,
              background: AppPalette.roseSoft,
              foreground: AppPalette.roseSoftText,
              child: FlowSelector(
                value: _current.flow,
                onChanged: (v) =>
                    _save(_current.copyWith(flow: v, clearFlow: v == null)),
              ),
            ),
            const SizedBox(height: 16),
            KeyedSubtree(
              key: _symptomsKey,
              child: DayLogSectionCard(
                icon: Icons.healing_outlined,
                title: l10n.dayLogSymptomsLabel,
                background: AppPalette.lavenderSoft,
                foreground: AppPalette.lavenderSoftText,
                child: SymptomMultiselect(
                  value: _current.symptoms,
                  onChanged: (s) => _save(_current.copyWith(symptoms: s)),
                ),
              ),
            ),
            const SizedBox(height: 16),
            KeyedSubtree(
              key: _moodKey,
              child: DayLogSectionCard(
                icon: Icons.sentiment_satisfied_outlined,
                title: l10n.dayLogMoodLabel,
                background: AppPalette.skySoft,
                foreground: AppPalette.skySoftText,
                child: MoodSelector(
                  value: _current.mood,
                  onChanged: (v) =>
                      _save(_current.copyWith(mood: v, clearMood: v == null)),
                ),
              ),
            ),
            const SizedBox(height: 16),
            KeyedSubtree(
              key: _energyKey,
              child: DayLogSectionCard(
                icon: Icons.bolt_outlined,
                title: l10n.dayLogEnergyLabel,
                background: AppPalette.goldSoft,
                foreground: AppPalette.goldSoftText,
                child: EnergySelector(
                  value: _current.energyLevel,
                  onChanged: (v) => _save(
                    _current.copyWith(
                      energyLevel: v,
                      clearEnergyLevel: v == null,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            DayLogSectionCard(
              icon: Icons.face_retouching_natural_outlined,
              title: l10n.dayLogSkinHairLabel,
              background: AppPalette.mintSoft,
              foreground: AppPalette.mintSoftText,
              child: SkinHairMultiselect(
                value: _current.skinHair,
                onChanged: (s) => _save(_current.copyWith(skinHair: s)),
              ),
            ),
            const SizedBox(height: 16),
            DayLogSectionCard(
              icon: Icons.medication_outlined,
              title: l10n.dayLogMedicationsLabel,
              background: AppPalette.terracottaSoft,
              foreground: AppPalette.terracottaSoftText,
              child: MedicationsSection(
                value: _current.medications,
                onChanged: (m) => _save(_current.copyWith(medications: m)),
                birthControl: _current.birthControl,
                onBirthControlChanged: (b) =>
                    _save(_current.copyWith(birthControl: b)),
              ),
            ),
            const SizedBox(height: 16),
            CustomTagsSection(
              selected: _current.customTags,
              onChanged: (tags) => _save(_current.copyWith(customTags: tags)),
            ),
            const SizedBox(height: 16),
            NoteField(
              controller: _noteController,
              onChanged: _onNoteChanged,
              onSave: _saveNoteNow,
            ),
            const SizedBox(height: 24),
            if (mucusTrackingEnabled)
              MucusHistorySummary(
                upToExclusive: widget.date,
                logs: cycleController.logs,
              ),
            OptionalTrackersSection(
              sectionKeys: _optionalTrackerKeys,
              sexualActivity: _current.sexualActivity,
              onSexualActivityChanged: (v) =>
                  _save(_current.copyWith(sexualActivity: v)),
              sexLife: _current.sexLife,
              onSexLifeChanged: (v) => _save(_current.copyWith(sexLife: v)),
              basalTempC: _current.basalTempC,
              onBasalTempChanged: (v) => _save(
                _current.copyWith(basalTempC: v, clearBasalTemp: v == null),
              ),
              mucus: _current.mucus,
              onMucusChanged: (v) =>
                  _save(_current.copyWith(mucus: v, clearMucus: v == null)),
              ovulationTest: _current.ovulationTest,
              onOvulationTestChanged: (v) => _save(
                _current.copyWith(
                  ovulationTest: v,
                  clearOvulationTest: v == null,
                ),
              ),
              pregnancyTest: _current.pregnancyTest,
              onPregnancyTestChanged: (v) => _save(
                _current.copyWith(
                  pregnancyTest: v,
                  clearPregnancyTest: v == null,
                ),
              ),
              breastExam: _current.breastExam,
              onBreastExamChanged: (s) =>
                  _save(_current.copyWith(breastExam: s)),
              cervixPosition: _current.cervixPosition,
              onCervixPositionChanged: (v) => _save(
                _current.copyWith(
                  cervixPosition: v,
                  clearCervixPosition: v == null,
                ),
              ),
              cervixOpening: _current.cervixOpening,
              onCervixOpeningChanged: (v) => _save(
                _current.copyWith(
                  cervixOpening: v,
                  clearCervixOpening: v == null,
                ),
              ),
              cervixFirmness: _current.cervixFirmness,
              onCervixFirmnessChanged: (v) => _save(
                _current.copyWith(
                  cervixFirmness: v,
                  clearCervixFirmness: v == null,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// The "Saved" confirmation. Fades rather than appearing/disappearing so it
/// reads as reassurance instead of a flicker, and takes no layout space when
/// hidden so the app bar doesn't shift.
class _SavedFlash extends StatelessWidget {
  const _SavedFlash({required this.visible, required this.label});

  final bool visible;
  final String label;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return AnimatedOpacity(
      opacity: visible ? 1 : 0,
      duration: const Duration(milliseconds: 250),
      child: Center(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.check_circle, size: 16, color: scheme.primary),
            const SizedBox(width: 4),
            Text(
              label,
              style: Theme.of(
                context,
              ).textTheme.labelMedium?.copyWith(color: scheme.primary),
            ),
          ],
        ),
      ),
    );
  }
}
