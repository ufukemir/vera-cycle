import 'package:cycle_app/models/cycle.dart';
import 'package:cycle_app/models/day_log.dart';
import 'package:cycle_app/models/enums.dart';
import 'package:cycle_app/services/cycle_insights.dart';
import 'package:cycle_app/services/doctor_report_pdf.dart';
import 'package:flutter_test/flutter_test.dart';

const _labels = DoctorReportPdfLabels(
  title: 'Cycle report',
  generatedOn: 'Generated on',
  disclaimer: 'Not a medical diagnosis.',
  summaryHeading: 'Summary',
  cyclesLogged: 'Cycles logged',
  averagePeriodLength: 'Average period length',
  averageCycleLength: 'Average cycle length',
  daysUnit: 'days',
  dailyLogHeading: 'Daily log',
  columnDate: 'Date',
  columnFlow: 'Flow',
  columnSymptoms: 'Symptoms',
  columnMood: 'Mood',
  timelineHeading: 'Cycle timeline',
  cycleLabel: 'Cycle',
  timelineLegendPeriod: 'Period',
  timelineLegendCycle: 'Rest of cycle',
  timelineOngoing: 'Ongoing',
);

void main() {
  const pdf = DoctorReportPdf();

  test('produces a non-trivial PDF for an empty history', () async {
    final bytes = await pdf.build(
      logs: const [],
      insights: CycleInsights.compute(const [], const []),
      generatedAt: DateTime(2026, 6, 1),
      labels: _labels,
    );

    // The %PDF header is the one thing worth asserting without a PDF parser.
    expect(bytes.length, greaterThan(200));
    expect(String.fromCharCodes(bytes.take(4)), '%PDF');
  });

  test('does not throw with a populated history', () async {
    final logs = [
      DayLog(date: DateTime(2026, 5, 1), flow: FlowIntensity.medium,
          symptoms: const {Symptom.cramps}),
      DayLog(date: DateTime(2026, 5, 2), flow: FlowIntensity.light),
    ];

    final bytes = await pdf.build(
      logs: logs,
      insights: CycleInsights.compute(const [], logs),
      generatedAt: DateTime(2026, 6, 1),
      labels: _labels,
    );

    expect(bytes.length, greaterThan(200));
  });

  test('does not throw with a mix of complete and ongoing cycles', () async {
    final cycles = [
      ObservedCycle(
        startDate: DateTime(2026, 3, 1),
        periodEndDate: DateTime(2026, 3, 5),
        nextStartDate: DateTime(2026, 3, 29),
      ),
      ObservedCycle(
        startDate: DateTime(2026, 3, 29),
        periodEndDate: DateTime(2026, 4, 2),
      ),
    ];

    final bytes = await pdf.build(
      logs: const [],
      insights: CycleInsights.compute(cycles, const []),
      generatedAt: DateTime(2026, 4, 10),
      labels: _labels,
      cycles: cycles,
    );

    expect(bytes.length, greaterThan(200));
    expect(String.fromCharCodes(bytes.take(4)), '%PDF');
  });
}
