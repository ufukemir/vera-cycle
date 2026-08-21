import 'dart:typed_data';

import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

import '../models/cycle.dart';
import '../models/day_log.dart';
import '../models/enums.dart';
import '../services/cycle_insights.dart';
import '../util/day.dart';
import '../util/number_format.dart';

/// Matches [AppPalette.rose]/[AppPalette.roseSoft] — the PDF is built
/// without any Flutter dependency (see class doc), so the brand colors are
/// duplicated here as raw values rather than imported.
const _periodBarColor = PdfColor.fromInt(0xFFB5406B);
const _cycleBarColor = PdfColor.fromInt(0xFFE8D3C8);

/// Builds the printable doctor summary PDF via `printing`'s native
/// print/PDF-save dialog. All copy is passed in by the caller (see
/// [DoctorReportPdfLabels]) rather than hardcoded, so this stays localized
/// without the pure PDF-building code depending on [AppLocalizations]/
/// [BuildContext].
class DoctorReportPdf {
  const DoctorReportPdf();

  Future<Uint8List> build({
    required List<DayLog> logs,
    required CycleInsights insights,
    required DateTime generatedAt,
    required DoctorReportPdfLabels labels,
    List<ObservedCycle> cycles = const [],
    DoctorReportFonts? fonts,
  }) async {
    // Without an explicit font the `pdf` package falls back to the Type1
    // base-14 Helvetica, which only maps U+0000–U+00FF. Anything above that
    // is not an error — it silently draws a crossed box. A Turkish user got
    // "Ak□□" for "Akış" and "Ba□ a□r□s□" for "Baş ağrısı" in the document
    // she was handing to her doctor; an Arabic user got boxes for the whole
    // report. Passing a real Unicode TTF is the entire fix.
    final doc = pw.Document(theme: fonts?.toTheme());

    doc.addPage(
      pw.MultiPage(
        build: (context) => [
          pw.Text(
            labels.title,
            style: pw.TextStyle(fontSize: 20, fontWeight: pw.FontWeight.bold),
          ),
          pw.SizedBox(height: 4),
          pw.Text(
            '${labels.generatedOn}: ${dayKey(generatedAt)}',
            style: const pw.TextStyle(fontSize: 10),
          ),
          pw.SizedBox(height: 12),
          pw.Text(
            labels.disclaimer,
            style: const pw.TextStyle(fontSize: 9, color: PdfColors.grey700),
          ),
          pw.Divider(height: 24),
          pw.Text(
            labels.summaryHeading,
            style: pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 13),
          ),
          pw.SizedBox(height: 6),
          pw.Text('${labels.cyclesLogged}: ${insights.cyclesLoggedCount}'),
          if (insights.hasPeriodLengthStats)
            pw.Text(
              '${labels.averagePeriodLength}: '
              '${formatDecimalIn(labels.localeName, insights.averagePeriodLength!)} ${labels.daysUnit}',
            ),
          if (insights.hasCycleLengthStats)
            pw.Text(
              '${labels.averageCycleLength}: '
              '${formatDecimalIn(labels.localeName, insights.averageCycleLength!)} ${labels.daysUnit} '
              '(± ${formatDecimalIn(labels.localeName, insights.cycleLengthStdDev!)})',
            ),
          if (cycles.isNotEmpty) ...[
            pw.Divider(height: 24),
            pw.Text(
              labels.timelineHeading,
              style: pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 13),
            ),
            pw.SizedBox(height: 8),
            _buildTimelineLegend(labels),
            pw.SizedBox(height: 8),
            ..._buildTimelineRows(cycles, labels),
          ],
          pw.Divider(height: 24),
          pw.Text(
            labels.dailyLogHeading,
            style: pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 13),
          ),
          pw.SizedBox(height: 6),
          pw.TableHelper.fromTextArray(
            headers: [
              labels.columnDate,
              labels.columnFlow,
              labels.columnSymptoms,
              labels.columnMood,
            ],
            data: [
              for (final log in logs)
                [
                  dayKey(log.date),
                  log.flow == null ? '' : (labels.flowNames[log.flow] ?? ''),
                  log.symptoms
                      .map((s) => labels.symptomNames[s] ?? '')
                      .where((s) => s.isNotEmpty)
                      .join(', '),
                  log.mood == null ? '' : (labels.moodNames[log.mood] ?? ''),
                ],
            ],
            cellStyle: const pw.TextStyle(fontSize: 9),
            headerStyle: pw.TextStyle(
              fontSize: 9,
              fontWeight: pw.FontWeight.bold,
            ),
          ),
        ],
      ),
    );

    return doc.save();
  }

  static const _barMaxWidth = 220.0;
  static const _barHeight = 10.0;

  pw.Widget _buildTimelineLegend(DoctorReportPdfLabels labels) {
    pw.Widget swatch(PdfColor color, String label) => pw.Row(
      mainAxisSize: pw.MainAxisSize.min,
      children: [
        pw.Container(width: 10, height: 10, color: color),
        pw.SizedBox(width: 4),
        pw.Text(label, style: const pw.TextStyle(fontSize: 9)),
      ],
    );

    return pw.Row(
      children: [
        swatch(_periodBarColor, labels.timelineLegendPeriod),
        pw.SizedBox(width: 16),
        swatch(_cycleBarColor, labels.timelineLegendCycle),
      ],
    );
  }

  /// One horizontal bar per recorded cycle: a solid segment for the period,
  /// a lighter segment for the rest of the cycle, both scaled to the same
  /// day-to-point ratio so bar lengths are visually comparable across rows
  /// — a doctor can see at a glance which cycles ran long or short.
  List<pw.Widget> _buildTimelineRows(
    List<ObservedCycle> cycles,
    DoctorReportPdfLabels labels,
  ) {
    final longestKnownLength = cycles
        .map((c) => c.length ?? c.periodLength)
        .fold<int>(1, (max, length) => length > max ? length : max);
    final pointsPerDay = _barMaxWidth / longestKnownLength;

    return [
      for (var i = 0; i < cycles.length; i++)
        pw.Padding(
          padding: const pw.EdgeInsets.only(bottom: 6),
          child: pw.Row(
            children: [
              pw.SizedBox(
                width: 60,
                child: pw.Text(
                  '${labels.cycleLabel} ${i + 1}',
                  style: const pw.TextStyle(fontSize: 9),
                ),
              ),
              pw.Container(
                width: cycles[i].periodLength * pointsPerDay,
                height: _barHeight,
                color: _periodBarColor,
              ),
              if (cycles[i].isComplete)
                pw.Container(
                  width:
                      (cycles[i].length! - cycles[i].periodLength) *
                      pointsPerDay,
                  height: _barHeight,
                  color: _cycleBarColor,
                )
              else ...[
                pw.SizedBox(width: 6),
                pw.Text(
                  labels.timelineOngoing,
                  style: pw.TextStyle(fontSize: 8, color: PdfColors.grey700),
                ),
              ],
            ],
          ),
        ),
    ];
  }
}

/// Fonts for the report, supplied by the caller.
///
/// Loaded from the app bundle by the caller rather than here, for the same
/// reason the labels are: this service stays free of Flutter dependencies so
/// it can be exercised in a plain unit test.
///
/// [fallbacks] exists because no single reasonable-sized font covers every
/// script the app is translated into. Quicksand carries the whole Latin
/// range (including Turkish ğ/ş/ı and Vietnamese), and anything outside it
/// — Arabic, Cyrillic, Greek, CJK, Indic — needs a face appended here, or
/// it prints as a crossed box.
class DoctorReportFonts {
  const DoctorReportFonts({
    required this.base,
    this.bold,
    this.fallbacks = const [],
  });

  final pw.Font base;
  final pw.Font? bold;
  final List<pw.Font> fallbacks;

  pw.ThemeData toTheme() => pw.ThemeData.withFont(
    base: base,
    bold: bold ?? base,
    fontFallback: fallbacks,
  );
}

/// All display strings [DoctorReportPdf] needs, supplied by the caller so
/// the PDF is localized without this service importing Flutter's l10n
/// machinery.
class DoctorReportPdfLabels {
  const DoctorReportPdfLabels({
    required this.title,
    required this.generatedOn,
    required this.disclaimer,
    required this.summaryHeading,
    required this.cyclesLogged,
    required this.averagePeriodLength,
    required this.averageCycleLength,
    required this.daysUnit,
    required this.dailyLogHeading,
    required this.columnDate,
    required this.columnFlow,
    required this.columnSymptoms,
    required this.columnMood,
    required this.timelineHeading,
    required this.cycleLabel,
    required this.timelineLegendPeriod,
    required this.timelineLegendCycle,
    required this.timelineOngoing,
    required this.flowNames,
    required this.symptomNames,
    required this.moodNames,
    required this.localeName,
  });

  /// BCP-47 name used to format the decimal averages.
  ///
  /// The report printed "28.4" to every reader, including the ones whose
  /// language writes "28,4" — a printed document handed to a clinician is
  /// the last place for an English decimal point in a German sentence.
  final String localeName;

  /// Localized cell values.
  ///
  /// The column headers were translated while the cells underneath printed
  /// raw Dart identifiers, so a Turkish user handed her doctor a table
  /// headed "Ruh hali" whose entries read `breastTenderness`. Unlike the
  /// CSV — which is machine-readable on purpose, English end to end — the
  /// PDF is meant to be read by a person, so every visible string in it
  /// has to be in the reader's language.
  final Map<FlowIntensity, String> flowNames;
  final Map<Symptom, String> symptomNames;
  final Map<Mood, String> moodNames;

  final String title;
  final String generatedOn;
  final String disclaimer;
  final String summaryHeading;
  final String cyclesLogged;
  final String averagePeriodLength;
  final String averageCycleLength;
  final String timelineHeading;
  final String cycleLabel;
  final String timelineLegendPeriod;
  final String timelineLegendCycle;
  final String timelineOngoing;
  final String daysUnit;
  final String dailyLogHeading;
  final String columnDate;
  final String columnFlow;
  final String columnSymptoms;
  final String columnMood;
}
