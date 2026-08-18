import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../l10n/app_localizations.dart';
import '../../models/day_log.dart';
import '../../models/enums.dart';
import '../../state/app_preferences.dart';
import '../../state/cycle_controller.dart';
import '../../util/day.dart';
import '../../util/number_format.dart';

/// Which per-tracker history the screen shows — the reference app's
/// "Benimki" hub, one generic screen instead of ten bespoke ones.
enum TrackerType {
  bbt,
  weight,
  sleep,
  water,
  symptoms,
  mood,
  energy,
  sexualActivity,
  ovulationTest,
  breastExam,
}

String trackerTitle(AppLocalizations l10n, TrackerType type) {
  switch (type) {
    case TrackerType.bbt:
      return l10n.dayLogBbtLabel;
    case TrackerType.weight:
      return l10n.dayLogWeightLabel;
    case TrackerType.sleep:
      return l10n.dayLogSleepLabel;
    case TrackerType.water:
      return l10n.dayLogWaterLabel;
    case TrackerType.symptoms:
      return l10n.dayLogSymptomsLabel;
    case TrackerType.mood:
      return l10n.dayLogMoodLabel;
    case TrackerType.energy:
      return l10n.dayLogEnergyLabel;
    case TrackerType.sexualActivity:
      return l10n.dayLogSexualActivityLabel;
    case TrackerType.ovulationTest:
      return l10n.dayLogOvulationTestLabel;
    case TrackerType.breastExam:
      return l10n.dayLogBreastExamLabel;
  }
}

IconData trackerIcon(TrackerType type) {
  switch (type) {
    case TrackerType.bbt:
      return Icons.thermostat_outlined;
    case TrackerType.weight:
      return Icons.monitor_weight_outlined;
    case TrackerType.sleep:
      return Icons.bedtime_outlined;
    case TrackerType.water:
      return Icons.water_drop_outlined;
    case TrackerType.symptoms:
      return Icons.healing_outlined;
    case TrackerType.mood:
      return Icons.sentiment_satisfied_outlined;
    case TrackerType.energy:
      return Icons.bolt_outlined;
    case TrackerType.sexualActivity:
      return Icons.favorite_outline;
    case TrackerType.ovulationTest:
      return Icons.science_outlined;
    case TrackerType.breastExam:
      return Icons.self_improvement_outlined;
  }
}

class TrackerHistoryScreen extends StatefulWidget {
  const TrackerHistoryScreen({super.key, required this.type});

  final TrackerType type;

  @override
  State<TrackerHistoryScreen> createState() => _TrackerHistoryScreenState();
}

class _TrackerHistoryScreenState extends State<TrackerHistoryScreen> {
  int _months = 3;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final logs = context.watch<CycleController>().logs;
    final cutoff = addDays(today(), -30 * _months);
    final inRange = logs
        .where((log) => !log.date.isBefore(cutoff) && !log.date.isAfter(today()))
        .toList()
      ..sort((a, b) => a.date.compareTo(b.date));

    return Scaffold(
      appBar: AppBar(title: Text(trackerTitle(l10n, widget.type))),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            SegmentedButton<int>(
              segments: [
                ButtonSegment(value: 1, label: Text(l10n.rangeFilter1m)),
                ButtonSegment(value: 3, label: Text(l10n.rangeFilter3m)),
                ButtonSegment(value: 6, label: Text(l10n.rangeFilter6m)),
              ],
              selected: {_months},
              onSelectionChanged: (s) => setState(() => _months = s.first),
            ),
            const SizedBox(height: 20),
            ..._content(context, l10n, inRange),
          ],
        ),
      ),
    );
  }

  List<Widget> _content(
      BuildContext context, AppLocalizations l10n, List<DayLog> logs) {
    switch (widget.type) {
      case TrackerType.bbt:
        final prefs = context.watch<AppPreferences>();
        final fahrenheit = prefs.temperatureUnit == TemperatureUnit.fahrenheit;
        return _numericSeries(
          l10n,
          logs,
          (log) => log.basalTempC == null
              ? null
              : (fahrenheit ? log.basalTempC! * 9 / 5 + 32 : log.basalTempC!),
          unit: fahrenheit ? '°F' : '°C',
          decimals: 1,
        );
      case TrackerType.weight:
        return _numericSeries(l10n, logs, (log) => log.weightKg,
            unit: l10n.unitKilograms, decimals: 1);
      case TrackerType.sleep:
        return _numericSeries(
            l10n, logs, (log) => log.sleepMinutes?.toDouble(),
            unit: l10n.unitMinutesShort, decimals: 0, bars: true);
      case TrackerType.water:
        return _numericSeries(
            l10n, logs, (log) => log.waterIntakeMl?.toDouble(),
            unit: l10n.unitMilliliters, decimals: 0, bars: true);
      case TrackerType.symptoms:
        final labels = <Symptom, String>{
          Symptom.cramps: l10n.symptomCramps,
          Symptom.headache: l10n.symptomHeadache,
          Symptom.bloating: l10n.symptomBloating,
          Symptom.breastTenderness: l10n.symptomBreastTenderness,
          Symptom.acne: l10n.symptomAcne,
          Symptom.fatigue: l10n.symptomFatigue,
          Symptom.nausea: l10n.symptomNausea,
          Symptom.backPain: l10n.symptomBackPain,
          Symptom.appetiteChange: l10n.symptomAppetiteChange,
          Symptom.sleepTrouble: l10n.symptomSleepTrouble,
          Symptom.pelvicPain: l10n.symptomPelvicPain,
          Symptom.dizziness: l10n.symptomDizziness,
        };
        final counts = <Symptom, int>{};
        for (final log in logs) {
          for (final symptom in log.symptoms) {
            counts[symptom] = (counts[symptom] ?? 0) + 1;
          }
        }
        return _countList(
            l10n, counts.map((k, v) => MapEntry(labels[k]!, v)));
      case TrackerType.mood:
        final labels = <Mood, String>{
          Mood.calm: l10n.moodCalm,
          Mood.anxious: l10n.moodAnxious,
          Mood.irritable: l10n.moodIrritable,
          Mood.low: l10n.moodLow,
          Mood.energetic: l10n.moodEnergetic,
          Mood.happy: l10n.moodHappy,
          Mood.content: l10n.moodContent,
          Mood.sad: l10n.moodSad,
          Mood.depressed: l10n.moodDepressed,
          Mood.emotional: l10n.moodEmotional,
        };
        final counts = <Mood, int>{};
        for (final log in logs) {
          if (log.mood != null) counts[log.mood!] = (counts[log.mood!] ?? 0) + 1;
        }
        return _countList(
            l10n, counts.map((k, v) => MapEntry(labels[k]!, v)));
      case TrackerType.energy:
        final labels = <EnergyLevel, String>{
          EnergyLevel.low: l10n.energyLevelLow,
          EnergyLevel.medium: l10n.energyLevelMedium,
          EnergyLevel.high: l10n.energyLevelHigh,
          EnergyLevel.energetic: l10n.energyLevelEnergetic,
        };
        final counts = <EnergyLevel, int>{};
        for (final log in logs) {
          if (log.energyLevel != null) {
            counts[log.energyLevel!] = (counts[log.energyLevel!] ?? 0) + 1;
          }
        }
        return _countList(
            l10n, counts.map((k, v) => MapEntry(labels[k]!, v)));
      case TrackerType.sexualActivity:
        final days = logs.where((log) => log.sexualActivity == true).toList();
        return _dateList(l10n, days, (_) => '');
      case TrackerType.ovulationTest:
        final days = logs.where((log) => log.ovulationTest != null).toList();
        return _dateList(
            l10n,
            days,
            (log) => log.ovulationTest == OvulationTestResult.positive
                ? l10n.ovulationTestPositive
                : l10n.ovulationTestNegative);
      case TrackerType.breastExam:
        final labels = <BreastExamFinding, String>{
          BreastExamFinding.allNormal: l10n.breastExamAllNormal,
          BreastExamFinding.lump: l10n.breastExamLump,
          BreastExamFinding.indentation: l10n.breastExamIndentation,
          BreastExamFinding.redness: l10n.breastExamRedness,
          BreastExamFinding.crackedNipple: l10n.breastExamCrackedNipple,
          BreastExamFinding.discharge: l10n.breastExamDischarge,
        };
        final days = logs.where((log) => log.breastExam.isNotEmpty).toList();
        return _dateList(l10n, days,
            (log) => log.breastExam.map((f) => labels[f]!).join(', '));
    }
  }

  List<Widget> _numericSeries(
    AppLocalizations l10n,
    List<DayLog> logs,
    double? Function(DayLog) valueOf, {
    required String unit,
    required int decimals,
    bool bars = false,
  }) {
    final points = <MapEntry<DateTime, double>>[
      for (final log in logs)
        if (valueOf(log) != null) MapEntry(log.date, valueOf(log)!),
    ];
    if (points.isEmpty) return [_empty(l10n)];
    final fmt = DateFormat.MMMd(Localizations.localeOf(context).toString());
    final values = [for (final p in points) p.value];
    final lo = values.reduce((a, b) => a < b ? a : b);
    final hi = values.reduce((a, b) => a > b ? a : b);

    return [
      // A painted chart is invisible to a screen reader, so it gets a
      // spoken summary and the per-entry list below carries the detail.
      Semantics(
        container: true,
        label: l10n.a11yChartSummary(
          values.length,
          '${formatDecimal(context, lo, decimals: decimals)} $unit',
          '${formatDecimal(context, hi, decimals: decimals)} $unit',
        ),
        child: ExcludeSemantics(
          child: SizedBox(
            height: 160,
            child: CustomPaint(
              size: const Size(double.infinity, 160),
              painter: _SeriesPainter(
                values: values,
                color: Theme.of(context).colorScheme.primary,
                trackColor: Theme.of(context).colorScheme.outlineVariant,
                bars: bars,
              ),
            ),
          ),
        ),
      ),
      const SizedBox(height: 12),
      Text(l10n.trackerEntriesCount(points.length),
          style: Theme.of(context).textTheme.bodySmall),
      const SizedBox(height: 8),
      for (final p in points.reversed.take(30))
        ListTile(
          dense: true,
          contentPadding: EdgeInsets.zero,
          title: Text(fmt.format(p.key)),
          trailing: Text('${formatDecimal(context, p.value, decimals: decimals)} $unit',
              style: Theme.of(context).textTheme.titleSmall),
        ),
    ];
  }

  List<Widget> _countList(AppLocalizations l10n, Map<String, int> counts) {
    if (counts.isEmpty) return [_empty(l10n)];
    final sorted = counts.entries.toList()
      ..sort((a, b) => b.value.compareTo(a.value));
    final max = sorted.first.value;
    return [
      for (final entry in sorted)
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 6),
          child: Semantics(
            container: true,
            label: l10n.a11yFrequencyItem(entry.key, entry.value),
            child: Row(
            children: [
              SizedBox(
                  width: 140,
                  child: Text(entry.key,
                      style: Theme.of(context).textTheme.bodyMedium)),
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: LinearProgressIndicator(
                    value: entry.value / max,
                    minHeight: 10,
                    backgroundColor: Theme.of(context)
                        .colorScheme
                        .outlineVariant
                        .withValues(alpha: 0.3),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Text('${entry.value}×',
                  style: Theme.of(context).textTheme.titleSmall),
            ],
            ),
          ),
        ),
    ];
  }

  List<Widget> _dateList(AppLocalizations l10n, List<DayLog> days,
      String Function(DayLog) detail) {
    if (days.isEmpty) return [_empty(l10n)];
    final fmt = DateFormat.yMMMd(Localizations.localeOf(context).toString());
    return [
      Text(l10n.trackerEntriesCount(days.length),
          style: Theme.of(context).textTheme.bodySmall),
      const SizedBox(height: 8),
      for (final log in days.reversed)
        ListTile(
          dense: true,
          contentPadding: EdgeInsets.zero,
          title: Text(fmt.format(log.date)),
          subtitle: detail(log).isEmpty ? null : Text(detail(log)),
        ),
    ];
  }

  Widget _empty(AppLocalizations l10n) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 40),
        child: Center(child: Text(l10n.trackerHistoryEmpty)),
      );
}

class _SeriesPainter extends CustomPainter {
  _SeriesPainter({
    required this.values,
    required this.color,
    required this.trackColor,
    required this.bars,
  });

  final List<double> values;
  final Color color;
  final Color trackColor;
  final bool bars;

  @override
  void paint(Canvas canvas, Size size) {
    if (values.isEmpty) return;
    final min = values.reduce((a, b) => a < b ? a : b);
    final max = values.reduce((a, b) => a > b ? a : b);
    final span = (max - min).abs() < 1e-9 ? 1.0 : max - min;
    double yFor(double v) => size.height - ((v - min) / span) * (size.height - 16) - 8;
    final step = values.length == 1 ? 0.0 : size.width / (values.length - 1);

    final grid = Paint()
      ..color = trackColor.withValues(alpha: 0.4)
      ..strokeWidth = 1;
    for (var i = 1; i < 4; i++) {
      final y = size.height * i / 4;
      canvas.drawLine(Offset(0, y), Offset(size.width, y), grid);
    }

    if (bars) {
      final barWidth = (size.width / values.length) * 0.6;
      final paint = Paint()..color = color;
      for (var i = 0; i < values.length; i++) {
        final x = values.length == 1 ? size.width / 2 : i * step;
        canvas.drawRRect(
          RRect.fromRectAndRadius(
            Rect.fromLTRB(x - barWidth / 2, yFor(values[i]), x + barWidth / 2,
                size.height),
            const Radius.circular(3),
          ),
          paint,
        );
      }
      return;
    }

    final line = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.5
      ..strokeCap = StrokeCap.round;
    final path = Path();
    for (var i = 0; i < values.length; i++) {
      final p = Offset(values.length == 1 ? size.width / 2 : i * step,
          yFor(values[i]));
      i == 0 ? path.moveTo(p.dx, p.dy) : path.lineTo(p.dx, p.dy);
    }
    canvas.drawPath(path, line);
    final dot = Paint()..color = color;
    for (var i = 0; i < values.length; i++) {
      canvas.drawCircle(
          Offset(values.length == 1 ? size.width / 2 : i * step,
              yFor(values[i])),
          3,
          dot);
    }
  }

  @override
  bool shouldRepaint(covariant _SeriesPainter oldDelegate) =>
      oldDelegate.values != values || oldDelegate.bars != bars;
}
