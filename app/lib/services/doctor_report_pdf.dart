import 'dart:typed_data';

import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

import '../models/day_log.dart';
import '../services/cycle_insights.dart';
import '../util/day.dart';

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
  }) async {
    final doc = pw.Document();

    doc.addPage(
      pw.MultiPage(
        build: (context) => [
          pw.Text(labels.title,
              style: pw.TextStyle(fontSize: 20, fontWeight: pw.FontWeight.bold)),
          pw.SizedBox(height: 4),
          pw.Text('${labels.generatedOn}: ${dayKey(generatedAt)}',
              style: const pw.TextStyle(fontSize: 10)),
          pw.SizedBox(height: 12),
          pw.Text(labels.disclaimer,
              style: const pw.TextStyle(fontSize: 9, color: PdfColors.grey700)),
          pw.Divider(height: 24),
          pw.Text(labels.summaryHeading,
              style: pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 13)),
          pw.SizedBox(height: 6),
          pw.Text('${labels.cyclesLogged}: ${insights.cyclesLoggedCount}'),
          if (insights.hasPeriodLengthStats)
            pw.Text(
              '${labels.averagePeriodLength}: '
              '${insights.averagePeriodLength!.toStringAsFixed(1)} ${labels.daysUnit}',
            ),
          if (insights.hasCycleLengthStats)
            pw.Text(
              '${labels.averageCycleLength}: '
              '${insights.averageCycleLength!.toStringAsFixed(1)} ${labels.daysUnit} '
              '(± ${insights.cycleLengthStdDev!.toStringAsFixed(1)})',
            ),
          pw.Divider(height: 24),
          pw.Text(labels.dailyLogHeading,
              style: pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 13)),
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
                  log.flow?.name ?? '',
                  log.symptoms.map((s) => s.name).join(', '),
                  log.mood?.name ?? '',
                ],
            ],
            cellStyle: const pw.TextStyle(fontSize: 9),
            headerStyle: pw.TextStyle(fontSize: 9, fontWeight: pw.FontWeight.bold),
          ),
        ],
      ),
    );

    return doc.save();
  }
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
  });

  final String title;
  final String generatedOn;
  final String disclaimer;
  final String summaryHeading;
  final String cyclesLogged;
  final String averagePeriodLength;
  final String averageCycleLength;
  final String daysUnit;
  final String dailyLogHeading;
  final String columnDate;
  final String columnFlow;
  final String columnSymptoms;
  final String columnMood;
}
