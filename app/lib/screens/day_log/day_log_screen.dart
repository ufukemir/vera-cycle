import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../l10n/app_localizations.dart';
import '../../models/day_log.dart';
import '../../state/cycle_controller.dart';
import 'widgets/flow_selector.dart';
import 'widgets/mood_selector.dart';
import 'widgets/note_field.dart';
import 'widgets/optional_trackers_section.dart';
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

    return Scaffold(
      appBar: AppBar(title: Text(dateLabel)),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            _sectionLabel(context, l10n.dayLogFlowLabel),
            FlowSelector(
              value: _current.flow,
              onChanged: (v) => _save(_current.copyWith(flow: v, clearFlow: v == null)),
            ),
            const SizedBox(height: 24),
            _sectionLabel(context, l10n.dayLogSymptomsLabel),
            SymptomMultiselect(
              value: _current.symptoms,
              onChanged: (s) => _save(_current.copyWith(symptoms: s)),
            ),
            const SizedBox(height: 24),
            _sectionLabel(context, l10n.dayLogMoodLabel),
            MoodSelector(
              value: _current.mood,
              onChanged: (v) => _save(_current.copyWith(mood: v, clearMood: v == null)),
            ),
            const SizedBox(height: 24),
            NoteField(controller: _noteController, onChanged: _onNoteChanged),
            const SizedBox(height: 24),
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
            ),
          ],
        ),
      ),
    );
  }

  Widget _sectionLabel(BuildContext context, String text) => Padding(
        padding: const EdgeInsets.only(bottom: 8),
        child: Text(text, style: Theme.of(context).textTheme.titleMedium),
      );
}
