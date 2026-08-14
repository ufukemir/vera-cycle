import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../l10n/app_localizations.dart';
import '../../../models/enums.dart';
import '../../../state/app_preferences.dart';

/// Sexual activity / BBT / cervical mucus fields — each gated independently
/// by its own [AppPreferences] flag. "Default hidden" means the field is
/// absent from the widget tree, not merely unchecked, until the user opts in
/// from Settings.
class OptionalTrackersSection extends StatelessWidget {
  const OptionalTrackersSection({
    super.key,
    required this.sexualActivity,
    required this.onSexualActivityChanged,
    required this.basalTempC,
    required this.onBasalTempChanged,
    required this.mucus,
    required this.onMucusChanged,
    required this.ovulationTest,
    required this.onOvulationTestChanged,
    required this.breastExam,
    required this.onBreastExamChanged,
    required this.cervixPosition,
    required this.onCervixPositionChanged,
    required this.cervixOpening,
    required this.onCervixOpeningChanged,
    required this.cervixFirmness,
    required this.onCervixFirmnessChanged,
  });

  final bool? sexualActivity;
  final ValueChanged<bool> onSexualActivityChanged;
  final double? basalTempC;
  final ValueChanged<double?> onBasalTempChanged;
  final CervicalMucus? mucus;
  final ValueChanged<CervicalMucus?> onMucusChanged;
  final OvulationTestResult? ovulationTest;
  final ValueChanged<OvulationTestResult?> onOvulationTestChanged;
  final Set<BreastExamFinding> breastExam;
  final ValueChanged<Set<BreastExamFinding>> onBreastExamChanged;
  final CervixPosition? cervixPosition;
  final ValueChanged<CervixPosition?> onCervixPositionChanged;
  final CervixOpening? cervixOpening;
  final ValueChanged<CervixOpening?> onCervixOpeningChanged;
  final CervixFirmness? cervixFirmness;
  final ValueChanged<CervixFirmness?> onCervixFirmnessChanged;

  @override
  Widget build(BuildContext context) {
    final prefs = context.watch<AppPreferences>();
    final l10n = AppLocalizations.of(context)!;

    final fields = <Widget>[
      if (prefs.sexualActivityTrackingEnabled)
        SwitchListTile(
          contentPadding: EdgeInsets.zero,
          title: Text(l10n.dayLogSexualActivityLabel),
          value: sexualActivity ?? false,
          onChanged: onSexualActivityChanged,
        ),
      if (prefs.bbtTrackingEnabled)
        _BasalTempField(
          valueC: basalTempC,
          unit: prefs.temperatureUnit,
          onChangedC: onBasalTempChanged,
        ),
      if (prefs.mucusTrackingEnabled)
        _MucusSelector(value: mucus, onChanged: onMucusChanged),
      if (prefs.ovulationTestTrackingEnabled)
        _OvulationTestSelector(
            value: ovulationTest, onChanged: onOvulationTestChanged),
      if (prefs.breastExamTrackingEnabled)
        _BreastExamMultiselect(value: breastExam, onChanged: onBreastExamChanged),
      if (prefs.cervixTrackingEnabled)
        _CervixSelectors(
          position: cervixPosition,
          onPositionChanged: onCervixPositionChanged,
          opening: cervixOpening,
          onOpeningChanged: onCervixOpeningChanged,
          firmness: cervixFirmness,
          onFirmnessChanged: onCervixFirmnessChanged,
        ),
    ];

    if (fields.isEmpty) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(l10n.dayLogOptionalTrackersLabel,
            style: Theme.of(context).textTheme.titleMedium),
        const SizedBox(height: 8),
        for (final field in fields) Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: field,
        ),
      ],
    );
  }
}

class _BasalTempField extends StatefulWidget {
  const _BasalTempField({
    required this.valueC,
    required this.unit,
    required this.onChangedC,
  });

  final double? valueC;
  final TemperatureUnit unit;
  final ValueChanged<double?> onChangedC;

  @override
  State<_BasalTempField> createState() => _BasalTempFieldState();
}

class _BasalTempFieldState extends State<_BasalTempField> {
  late final TextEditingController _controller =
      TextEditingController(text: _displayText());

  String _displayText() {
    if (widget.valueC == null) return '';
    return _toDisplayUnit(widget.valueC!).toStringAsFixed(1);
  }

  double _toDisplayUnit(double celsius) =>
      widget.unit == TemperatureUnit.fahrenheit ? celsius * 9 / 5 + 32 : celsius;

  @override
  void didUpdateWidget(covariant _BasalTempField oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.valueC != widget.valueC || oldWidget.unit != widget.unit) {
      _controller.text = _displayText();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onChanged(String text) {
    final parsed = double.tryParse(text.replaceAll(',', '.'));
    if (parsed == null) {
      widget.onChangedC(null);
      return;
    }
    final celsius =
        widget.unit == TemperatureUnit.fahrenheit ? (parsed - 32) * 5 / 9 : parsed;
    widget.onChangedC(celsius);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final suffix = widget.unit == TemperatureUnit.fahrenheit ? '°F' : '°C';
    return TextField(
      controller: _controller,
      keyboardType: const TextInputType.numberWithOptions(decimal: true),
      decoration: InputDecoration(labelText: l10n.dayLogBbtLabel, suffixText: suffix),
      onChanged: _onChanged,
    );
  }
}

class _MucusSelector extends StatelessWidget {
  const _MucusSelector({required this.value, required this.onChanged});

  final CervicalMucus? value;
  final ValueChanged<CervicalMucus?> onChanged;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final labels = <CervicalMucus, String>{
      CervicalMucus.dry: l10n.mucusDry,
      CervicalMucus.sticky: l10n.mucusSticky,
      CervicalMucus.creamy: l10n.mucusCreamy,
      CervicalMucus.watery: l10n.mucusWatery,
      CervicalMucus.eggWhite: l10n.mucusEggWhite,
    };

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(l10n.dayLogMucusLabel, style: Theme.of(context).textTheme.bodyMedium),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [
            for (final entry in labels.entries)
              ChoiceChip(
                label: Text(entry.value),
                selected: value == entry.key,
                onSelected: (selected) => onChanged(selected ? entry.key : null),
              ),
          ],
        ),
      ],
    );
  }
}

class _OvulationTestSelector extends StatelessWidget {
  const _OvulationTestSelector({required this.value, required this.onChanged});

  final OvulationTestResult? value;
  final ValueChanged<OvulationTestResult?> onChanged;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final labels = <OvulationTestResult, String>{
      OvulationTestResult.negative: l10n.ovulationTestNegative,
      OvulationTestResult.positive: l10n.ovulationTestPositive,
    };
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(l10n.dayLogOvulationTestLabel,
            style: Theme.of(context).textTheme.bodyMedium),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8,
          children: [
            for (final entry in labels.entries)
              ChoiceChip(
                label: Text(entry.value),
                selected: value == entry.key,
                onSelected: (selected) =>
                    onChanged(selected ? entry.key : null),
              ),
          ],
        ),
      ],
    );
  }
}

class _BreastExamMultiselect extends StatelessWidget {
  const _BreastExamMultiselect({required this.value, required this.onChanged});

  final Set<BreastExamFinding> value;
  final ValueChanged<Set<BreastExamFinding>> onChanged;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final labels = <BreastExamFinding, String>{
      BreastExamFinding.allNormal: l10n.breastExamAllNormal,
      BreastExamFinding.lump: l10n.breastExamLump,
      BreastExamFinding.indentation: l10n.breastExamIndentation,
      BreastExamFinding.redness: l10n.breastExamRedness,
      BreastExamFinding.crackedNipple: l10n.breastExamCrackedNipple,
      BreastExamFinding.discharge: l10n.breastExamDischarge,
    };

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(l10n.dayLogBreastExamLabel, style: Theme.of(context).textTheme.bodyMedium),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [
            for (final entry in labels.entries)
              FilterChip(
                label: Text(entry.value),
                selected: value.contains(entry.key),
                onSelected: (selected) {
                  final next = Set<BreastExamFinding>.of(value);
                  selected ? next.add(entry.key) : next.remove(entry.key);
                  onChanged(next);
                },
              ),
          ],
        ),
      ],
    );
  }
}

class _CervixSelectors extends StatelessWidget {
  const _CervixSelectors({
    required this.position,
    required this.onPositionChanged,
    required this.opening,
    required this.onOpeningChanged,
    required this.firmness,
    required this.onFirmnessChanged,
  });

  final CervixPosition? position;
  final ValueChanged<CervixPosition?> onPositionChanged;
  final CervixOpening? opening;
  final ValueChanged<CervixOpening?> onOpeningChanged;
  final CervixFirmness? firmness;
  final ValueChanged<CervixFirmness?> onFirmnessChanged;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final positionLabels = <CervixPosition, String>{
      CervixPosition.low: l10n.cervixPositionLow,
      CervixPosition.medium: l10n.cervixPositionMedium,
      CervixPosition.high: l10n.cervixPositionHigh,
    };
    final openingLabels = <CervixOpening, String>{
      CervixOpening.closed: l10n.cervixOpeningClosed,
      CervixOpening.medium: l10n.cervixOpeningMedium,
      CervixOpening.open: l10n.cervixOpeningOpen,
    };
    final firmnessLabels = <CervixFirmness, String>{
      CervixFirmness.soft: l10n.cervixFirmnessSoft,
      CervixFirmness.medium: l10n.cervixFirmnessMedium,
      CervixFirmness.firm: l10n.cervixFirmnessFirm,
    };

    Widget row<T>(String label, Map<T, String> labels, T? selected, ValueChanged<T?> onSelected) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: Theme.of(context).textTheme.bodyMedium),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              for (final entry in labels.entries)
                ChoiceChip(
                  label: Text(entry.value),
                  selected: selected == entry.key,
                  onSelected: (isSelected) => onSelected(isSelected ? entry.key : null),
                ),
            ],
          ),
        ],
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        row(l10n.cervixPositionLabel, positionLabels, position, onPositionChanged),
        const SizedBox(height: 12),
        row(l10n.cervixOpeningLabel, openingLabels, opening, onOpeningChanged),
        const SizedBox(height: 12),
        row(l10n.cervixFirmnessLabel, firmnessLabels, firmness, onFirmnessChanged),
      ],
    );
  }
}
