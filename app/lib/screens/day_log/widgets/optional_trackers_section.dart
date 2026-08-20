import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../l10n/app_localizations.dart';
import '../../../l10n/enum_labels.dart';
import '../../../models/enums.dart';
import '../../../state/app_preferences.dart';
import '../../../theme/app_theme.dart';
import '../../../theme/log_icons.dart';
import '../../../widgets/option_chip.dart';
import 'section_card.dart';

/// Sexual activity / BBT / cervical mucus fields — each gated independently
/// by its own [AppPreferences] flag. "Default hidden" means the field is
/// absent from the widget tree, not merely unchecked, until the user opts in
/// from Settings.
///
/// Each enabled tracker gets the same coloured [DayLogSectionCard] as flow,
/// symptoms and the rest. It used to be a flat column of grey labels and
/// outline chips trailing off the end of the screen, which made the fields
/// the user had deliberately switched on look like the leftovers.
class OptionalTrackersSection extends StatelessWidget {
  const OptionalTrackersSection({
    super.key,
    required this.sexualActivity,
    required this.onSexualActivityChanged,
    required this.sexLife,
    required this.onSexLifeChanged,
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
  final Set<SexLifeEntry> sexLife;
  final ValueChanged<Set<SexLifeEntry>> onSexLifeChanged;
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

    final cards = <Widget>[
      if (prefs.sexualActivityTrackingEnabled)
        DayLogSectionCard(
          icon: Icons.favorite_outline,
          title: l10n.dayLogSexualActivityLabel,
          background: AppPalette.roseSoft,
          foreground: AppPalette.roseSoftText,
          child: _SexLifeSelector(
            value: sexLife,
            onChanged: (next) {
              onSexLifeChanged(next);
              // The plain yes/no flag is what the tracker hub and the day
              // list still read, so it follows the detail rather than
              // being edited separately: "none" is an answer, not an
              // absence, and three of these entries mean something
              // happened.
              const activity = {
                SexLifeEntry.unprotected,
                SexLifeEntry.protectedSex,
                SexLifeEntry.masturbation,
              };
              onSexualActivityChanged(next.any(activity.contains));
            },
          ),
        ),
      if (prefs.bbtTrackingEnabled)
        DayLogSectionCard(
          icon: Icons.thermostat_outlined,
          title: l10n.dayLogBbtLabel,
          background: AppPalette.terracottaSoft,
          foreground: AppPalette.terracottaSoftText,
          child: _BasalTempField(
            valueC: basalTempC,
            unit: prefs.temperatureUnit,
            onChangedC: onBasalTempChanged,
          ),
        ),
      if (prefs.mucusTrackingEnabled)
        DayLogSectionCard(
          icon: Icons.water_outlined,
          title: l10n.dayLogMucusLabel,
          background: AppPalette.skySoft,
          foreground: AppPalette.skySoftText,
          child: _MucusSelector(value: mucus, onChanged: onMucusChanged),
        ),
      if (prefs.ovulationTestTrackingEnabled)
        DayLogSectionCard(
          icon: Icons.science_outlined,
          title: l10n.dayLogOvulationTestLabel,
          background: AppPalette.goldSoft,
          foreground: AppPalette.goldSoftText,
          child: _OvulationTestSelector(
              value: ovulationTest, onChanged: onOvulationTestChanged),
        ),
      if (prefs.breastExamTrackingEnabled)
        DayLogSectionCard(
          icon: Icons.spa_outlined,
          title: l10n.dayLogBreastExamLabel,
          background: AppPalette.mintSoft,
          foreground: AppPalette.mintSoftText,
          child: _BreastExamMultiselect(
              value: breastExam, onChanged: onBreastExamChanged),
        ),
      if (prefs.cervixTrackingEnabled)
        DayLogSectionCard(
          icon: Icons.donut_large_outlined,
          // Three observations, one card, titled with the string Settings
          // already uses for the whole group — position, opening and
          // firmness are read together or not at all.
          title: l10n.settingsCervixToggle,
          background: AppPalette.lavenderSoft,
          foreground: AppPalette.lavenderSoftText,
          child: _CervixSelectors(
            position: cervixPosition,
            onPositionChanged: onCervixPositionChanged,
            opening: cervixOpening,
            onOpeningChanged: onCervixOpeningChanged,
            firmness: cervixFirmness,
            onFirmnessChanged: onCervixFirmnessChanged,
          ),
        ),
    ];

    if (cards.isEmpty) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: Text(l10n.dayLogOptionalTrackersLabel,
              style: Theme.of(context).textTheme.titleMedium),
        ),
        for (final card in cards)
          Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: card,
          ),
      ],
    );
  }
}

/// Multi-select, because a day is not one of these things.
///
/// It replaces a bare on/off switch that could record only that *something*
/// happened. Behind the same opt-in preference as before — CLAUDE.md keeps
/// these questions off unless the user asks for them — and worded so that
/// "none" and "no orgasm" are ordinary entries rather than failures.
class _SexLifeSelector extends StatelessWidget {
  const _SexLifeSelector({required this.value, required this.onChanged});

  final Set<SexLifeEntry> value;
  final ValueChanged<Set<SexLifeEntry>> onChanged;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return OptionChipWrap(
      children: [
        for (final entry in SexLifeEntry.values)
          OptionChip(
            icon: LogIcons.sexLife(entry),
            label: sexLifeLabel(l10n, entry),
            selected: value.contains(entry),
            tint: AppPalette.roseSoft,
            ink: AppPalette.roseSoftText,
            onTap: () {
              // "None" is exclusive: it is the answer that rules the others
              // out, so picking it clears them and picking anything else
              // clears it.
              if (entry == SexLifeEntry.none) {
                onChanged(value.contains(entry) ? {} : {SexLifeEntry.none});
                return;
              }
              final next = Set<SexLifeEntry>.of(value)
                ..remove(SexLifeEntry.none);
              value.contains(entry) ? next.remove(entry) : next.add(entry);
              onChanged(next);
            },
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
    // Deliberately NOT locale-formatted: this seeds a TextField whose
    // text is parsed back with double.tryParse (after a comma->period
    // swap). Formatting it as "36,5" for an Arabic locale would seed the
    // field with Arabic-Indic digits that the parser cannot read back.
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
    final scheme = Theme.of(context).colorScheme;
    return TextField(
      controller: _controller,
      keyboardType: const TextInputType.numberWithOptions(decimal: true),
      // The card header already names the field, so the decoration only
      // has to say what unit the number is in.
      decoration: InputDecoration(
        hintText: l10n.dayLogBbtLabel,
        suffixText: suffix,
        filled: true,
        fillColor: scheme.surface.withValues(alpha: 0.7),
        isDense: true,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: scheme.primary, width: 1.4),
        ),
      ),
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

    return OptionChipWrap(
      children: [
        for (final entry in labels.entries)
          OptionChip(
            icon: LogIcons.mucus(entry.key),
            label: entry.value,
            selected: value == entry.key,
            tint: AppPalette.skySoft,
            ink: AppPalette.skySoftText,
            onTap: () => onChanged(value == entry.key ? null : entry.key),
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
    return Wrap(
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

    return OptionChipWrap(
      children: [
        for (final entry in labels.entries)
          OptionChip(
            icon: LogIcons.breastExam(entry.key),
            label: entry.value,
            selected: value.contains(entry.key),
            tint: AppPalette.mintSoft,
            ink: AppPalette.mintSoftText,
            onTap: () {
              final next = Set<BreastExamFinding>.of(value);
              value.contains(entry.key)
                  ? next.remove(entry.key)
                  : next.add(entry.key);
              onChanged(next);
            },
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

    Widget row<T>(String label, Map<T, String> labels, T? selected,
        ValueChanged<T?> onSelected, IconData Function(T) iconOf) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DayLogFieldLabel(label, color: AppPalette.lavenderSoftText),
          OptionChipWrap(
            children: [
              for (final entry in labels.entries)
                OptionChip(
                  icon: iconOf(entry.key),
                  label: entry.value,
                  selected: selected == entry.key,
                  tint: AppPalette.lavenderSoft,
                  ink: AppPalette.lavenderSoftText,
                  onTap: () =>
                      onSelected(selected == entry.key ? null : entry.key),
                ),
            ],
          ),
        ],
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        row(l10n.cervixPositionLabel, positionLabels, position,
            onPositionChanged, LogIcons.cervixPosition),
        const SizedBox(height: 12),
        row(l10n.cervixOpeningLabel, openingLabels, opening, onOpeningChanged,
            LogIcons.cervixOpening),
        const SizedBox(height: 12),
        row(l10n.cervixFirmnessLabel, firmnessLabels, firmness,
            onFirmnessChanged, LogIcons.cervixFirmness),
      ],
    );
  }
}
