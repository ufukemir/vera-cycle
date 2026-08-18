import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../l10n/app_localizations.dart';
import '../../l10n/enum_labels.dart';
import '../../models/cycle.dart';
import '../../models/day_log.dart';
import '../../services/advanced_insights.dart';
import '../../state/cycle_controller.dart';

/// Premium: what the user's own history says about timing.
///
/// Two rules run through the whole screen. Nothing appears before three
/// completed cycles, and anything without a clear peak is shown as "no
/// clear timing yet" rather than quietly rounded into a claim. A pattern
/// engine that always finds something is a pattern engine you can't trust.
class AdvancedInsightsScreen extends StatefulWidget {
  const AdvancedInsightsScreen({super.key});

  @override
  State<AdvancedInsightsScreen> createState() => _AdvancedInsightsScreenState();
}

class _AdvancedInsightsScreenState extends State<AdvancedInsightsScreen> {
  AdvancedInsights? _cached;
  List<DayLog>? _cachedLogs;
  List<ObservedCycle>? _cachedCycles;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final controller = context.watch<CycleController>();

    // Recomputed only when the history actually changes. This walks every
    // log against every completed cycle, and it used to run on each rebuild
    // — including the ones a theme change or a keyboard opening triggers.
    //
    // Identity is the right key, not a length/date signature: CycleController
    // assigns a brand-new list on every mutation, so `identical` catches an
    // edit to an existing day (same length, same dates) that a cheaper
    // signature would miss and serve stale.
    if (_cached == null ||
        !identical(_cachedLogs, controller.logs) ||
        !identical(_cachedCycles, controller.cycles)) {
      _cachedLogs = controller.logs;
      _cachedCycles = controller.cycles;
      _cached = AdvancedInsights.compute(controller.cycles, controller.logs);
    }
    final insights = _cached!;

    return Scaffold(
      appBar: AppBar(title: Text(l10n.advancedInsightsTitle)),
      body: SafeArea(
        // Not `hasPatterns`: someone who logs flow faithfully but never
        // taps a symptom has no patterns and yet has a perfectly good
        // cycle-length trend sitting in this object. Gating the whole
        // screen on symptoms told her "log three full cycles" when she
        // already had twelve.
        child: insights.hasAnythingToShow
            ? _Report(insights: insights)
            : _NotEnough(message: l10n.advancedInsightsNotEnough),
      ),
    );
  }
}

class _NotEnough extends StatelessWidget {
  const _NotEnough({required this.message});

  final String message;

  @override
  Widget build(BuildContext context) => Center(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Text(
            message,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
      );
}

class _Report extends StatelessWidget {
  const _Report({required this.insights});

  final AdvancedInsights insights;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);

    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        Text(l10n.advancedInsightsPatternsTitle,
            style: theme.textTheme.titleMedium),
        const SizedBox(height: 12),
        for (final entry in insights.symptomPatterns)
          _PatternTile(
            label: symptomLabel(l10n, entry.key),
            pattern: entry.value,
          ),
        for (final entry in insights.customTagPatterns)
          _PatternTile(label: entry.key, pattern: entry.value),
        if (insights.cycleLengthTrend.length >= 2) ...[
          const SizedBox(height: 28),
          Text(l10n.advancedInsightsTrendTitle,
              style: theme.textTheme.titleMedium),
          const SizedBox(height: 12),
          _TrendBars(points: insights.cycleLengthTrend),
          const SizedBox(height: 8),
          Text(
            _driftLine(l10n, insights, Localizations.localeOf(context).toString()),
            style: theme.textTheme.bodyMedium,
          ),
        ],
        if (insights.dominantMoodBySegment.isNotEmpty) ...[
          const SizedBox(height: 28),
          Text(l10n.advancedInsightsMoodTitle,
              style: theme.textTheme.titleMedium),
          const SizedBox(height: 8),
          for (final entry in insights.dominantMoodBySegment.entries)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: Text(
                '${cycleSegmentLabel(l10n, entry.key)}: '
                '${moodLabel(l10n, entry.value)}',
                style: theme.textTheme.bodyMedium,
              ),
            ),
        ],
        const SizedBox(height: 28),
        Text(
          l10n.advancedInsightsDisclaimer,
          style: theme.textTheme.bodySmall
              ?.copyWith(color: theme.colorScheme.onSurfaceVariant),
        ),
      ],
    );
  }

  String _driftLine(
    AppLocalizations l10n,
    AdvancedInsights insights,
    String localeName,
  ) {
    final drift = insights.cycleLengthDrift;
    final groupSize = insights.driftGroupSize;

    // "Not enough history to compare" and "compared, and it held steady"
    // are different statements. Collapsing them into the stable string
    // told a user with 21/45/24-day cycles that her length had stayed the
    // same — the flattest possible lie on the most irregular data.
    if (drift == null || groupSize == null) {
      return l10n.advancedInsightsDriftNotEnough;
    }

    final cycles = NumberFormat.decimalPattern(localeName).format(groupSize);
    // Under a day either way is not a direction, it's rounding.
    if (drift.abs() < 1) return l10n.advancedInsightsDriftStable(cycles);

    // Locale-formatted like every other number on this screen: "6,0" in
    // tr/de/fr, not "6.0".
    final days = NumberFormat.decimalPattern(localeName).format(
      double.parse(drift.abs().toStringAsFixed(1)),
    );
    return drift > 0
        ? l10n.advancedInsightsDriftLonger(days, cycles)
        : l10n.advancedInsightsDriftShorter(days, cycles);
  }
}

class _PatternTile extends StatelessWidget {
  const _PatternTile({required this.label, required this.pattern});

  final String label;
  final OccurrencePattern pattern;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    final peak = pattern.peakSegment;

    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            pattern.isPronounced && peak != null
                ? l10n.advancedInsightsPatternLine(
                    label, cycleSegmentLabel(l10n, peak))
                : l10n.advancedInsightsNoPattern(label),
            style: theme.textTheme.bodyLarge,
          ),
          const SizedBox(height: 2),
          Text(
            l10n.advancedInsightsPatternDetail(
              pattern.totalDays,
              pattern.averageCycleDay.round(),
            ),
            style: theme.textTheme.bodySmall
                ?.copyWith(color: theme.colorScheme.onSurfaceVariant),
          ),
        ],
      ),
    );
  }
}

/// A bare bar row rather than a charting dependency: the series is a handful
/// of integers, and a package here would be a network-capable dependency
/// added for something twenty lines of paint can do.
class _TrendBars extends StatelessWidget {
  const _TrendBars({required this.points});

  final List<CycleLengthPoint> points;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final lengths = points.map((p) => p.length).toList();
    final max = lengths.reduce((a, b) => a > b ? a : b);
    final min = lengths.reduce((a, b) => a < b ? a : b);
    // A flat series must not render as flat-zero bars, so give an identical
    // run a fixed mid height instead of dividing by a zero range.
    final range = max - min;

    return SizedBox(
      height: 120,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          for (final point in points)
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 3),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text('${point.length}',
                        style: Theme.of(context).textTheme.labelSmall),
                    const SizedBox(height: 4),
                    Container(
                      height: range == 0
                          ? 60
                          : 30 + 60 * (point.length - min) / range,
                      decoration: BoxDecoration(
                        color: scheme.primary,
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
