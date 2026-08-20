import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../l10n/app_localizations.dart';
import '../../models/day_log.dart';
import '../../state/app_preferences.dart';
import '../../state/cycle_controller.dart';
import '../../theme/app_theme.dart';
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
  const DayLogScreen({super.key, required this.date});

  final DateTime date;

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

  @override
  void initState() {
    super.initState();
    _cycles = context.read<CycleController>();
    _current = _cycles.logFor(widget.date) ?? DayLog(date: widget.date);
    _noteController = TextEditingController(text: _current.note ?? '');
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

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final dateLabel = DateFormat.yMMMMd(Localizations.localeOf(context).toString())
        .format(widget.date);
    final cycleController = context.watch<CycleController>();
    final mucusTrackingEnabled =
        context.watch<AppPreferences>().mucusTrackingEnabled;

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
            QuickStatsRow(
              waterIntakeMl: _current.waterIntakeMl,
              onWaterChanged: (v) => _save(
                _current.copyWith(waterIntakeMl: v, clearWaterIntake: v == null),
              ),
              sleepMinutes: _current.sleepMinutes,
              onSleepChanged: (v) => _save(
                _current.copyWith(sleepMinutes: v, clearSleepMinutes: v == null),
              ),
              weightKg: _current.weightKg,
              onWeightChanged: (v) =>
                  _save(_current.copyWith(weightKg: v, clearWeight: v == null)),
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
            DayLogSectionCard(
              icon: Icons.healing_outlined,
              title: l10n.dayLogSymptomsLabel,
              background: AppPalette.lavenderSoft,
              foreground: AppPalette.lavenderSoftText,
              child: SymptomMultiselect(
                value: _current.symptoms,
                onChanged: (s) => _save(_current.copyWith(symptoms: s)),
              ),
            ),
            const SizedBox(height: 16),
            DayLogSectionCard(
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
            const SizedBox(height: 16),
            DayLogSectionCard(
              icon: Icons.bolt_outlined,
              title: l10n.dayLogEnergyLabel,
              background: AppPalette.goldSoft,
              foreground: AppPalette.goldSoftText,
              child: EnergySelector(
                value: _current.energyLevel,
                onChanged: (v) => _save(
                    _current.copyWith(energyLevel: v, clearEnergyLevel: v == null)),
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
              ),
            ),
            const SizedBox(height: 16),
            CustomTagsSection(
              selected: _current.customTags,
              onChanged: (tags) => _save(_current.copyWith(customTags: tags)),
            ),
            const SizedBox(height: 16),
            NoteField(controller: _noteController, onChanged: _onNoteChanged),
            const SizedBox(height: 24),
            if (mucusTrackingEnabled)
              MucusHistorySummary(
                upToExclusive: widget.date,
                logs: cycleController.logs,
              ),
            OptionalTrackersSection(
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
              onOvulationTestChanged: (v) => _save(_current.copyWith(
                  ovulationTest: v, clearOvulationTest: v == null)),
              breastExam: _current.breastExam,
              onBreastExamChanged: (s) => _save(_current.copyWith(breastExam: s)),
              cervixPosition: _current.cervixPosition,
              onCervixPositionChanged: (v) => _save(
                _current.copyWith(cervixPosition: v, clearCervixPosition: v == null),
              ),
              cervixOpening: _current.cervixOpening,
              onCervixOpeningChanged: (v) => _save(
                _current.copyWith(cervixOpening: v, clearCervixOpening: v == null),
              ),
              cervixFirmness: _current.cervixFirmness,
              onCervixFirmnessChanged: (v) => _save(
                _current.copyWith(cervixFirmness: v, clearCervixFirmness: v == null),
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
              style: Theme.of(context)
                  .textTheme
                  .labelMedium
                  ?.copyWith(color: scheme.primary),
            ),
          ],
        ),
      ),
    );
  }
}
