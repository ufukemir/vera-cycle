import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../l10n/app_localizations.dart';
import '../../models/day_log.dart';
import '../../state/app_preferences.dart';
import '../../state/cycle_controller.dart';
import '../../theme/app_theme.dart';
import 'widgets/energy_selector.dart';
import 'widgets/fertility_status_banner.dart';
import 'widgets/flow_selector.dart';
import 'widgets/medications_section.dart';
import 'widgets/mood_selector.dart';
import 'widgets/mucus_history_summary.dart';
import 'widgets/note_field.dart';
import 'widgets/optional_trackers_section.dart';
import 'widgets/quick_stats_row.dart';
import 'widgets/skin_hair_multiselect.dart';
import 'widgets/symptom_multiselect.dart';

/// A single day's log. Autosaves on every change — chip/selector taps commit
/// immediately, the note field debounces ~400ms — so backgrounding
/// mid-entry (which, per the app-lock policy, happens on every app switch)
/// never loses data. There is no Save button anywhere on this screen.
class DayLogScreen extends StatefulWidget {
  const DayLogScreen({super.key, required this.date});

  final DateTime date;

  @override
  State<DayLogScreen> createState() => _DayLogScreenState();
}

class _DayLogScreenState extends State<DayLogScreen> {
  late DayLog _current;
  late final TextEditingController _noteController;
  Timer? _noteDebounce;

  @override
  void initState() {
    super.initState();
    _current =
        context.read<CycleController>().logFor(widget.date) ?? DayLog(date: widget.date);
    _noteController = TextEditingController(text: _current.note ?? '');
  }

  @override
  void dispose() {
    _noteDebounce?.cancel();
    _noteController.dispose();
    super.dispose();
  }

  void _save(DayLog updated) {
    setState(() => _current = updated);
    context.read<CycleController>().upsertDay(updated);
  }

  void _onNoteChanged(String text) {
    _noteDebounce?.cancel();
    _noteDebounce = Timer(const Duration(milliseconds: 400), () {
      _save(_current.copyWith(note: text, clearNote: text.trim().isEmpty));
    });
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
      appBar: AppBar(title: Text(dateLabel)),
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
            _SectionCard(
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
            _SectionCard(
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
            _SectionCard(
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
            _SectionCard(
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
            _SectionCard(
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
            _SectionCard(
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
            NoteField(controller: _noteController, onChanged: _onNoteChanged),
            const SizedBox(height: 24),
            if (mucusTrackingEnabled)
              MucusHistorySummary(
                upToExclusive: widget.date,
                logs: cycleController.logs,
              ),
            OptionalTrackersSection(
              sexualActivity: _current.sexualActivity,
              onSexualActivityChanged: (v) => _save(_current.copyWith(sexualActivity: v)),
              basalTempC: _current.basalTempC,
              onBasalTempChanged: (v) => _save(
                _current.copyWith(basalTempC: v, clearBasalTemp: v == null),
              ),
              mucus: _current.mucus,
              onMucusChanged: (v) =>
                  _save(_current.copyWith(mucus: v, clearMucus: v == null)),
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

/// A pastel category card with a tinted icon badge — the reference app's
/// colorful sectioned-log pattern, using [AppPalette]'s soft tones.
class _SectionCard extends StatelessWidget {
  const _SectionCard({
    required this.icon,
    required this.title,
    required this.background,
    required this.foreground,
    required this.child,
  });

  final IconData icon;
  final String title;
  final Color background;
  final Color foreground;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: background.withValues(alpha: 0.55),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 34,
                height: 34,
                decoration: BoxDecoration(shape: BoxShape.circle, color: background),
                child: Icon(icon, size: 18, color: foreground),
              ),
              const SizedBox(width: 10),
              Text(
                title,
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(color: foreground),
              ),
            ],
          ),
          const SizedBox(height: 12),
          child,
        ],
      ),
    );
  }
}
