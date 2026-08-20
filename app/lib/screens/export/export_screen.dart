import 'dart:convert';
import 'dart:typed_data';

import 'package:cryptography/cryptography.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:intl/intl.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';

import '../../l10n/app_localizations.dart';
import '../../l10n/enum_labels.dart';
import '../../models/enums.dart';
import '../../services/backup_service.dart';
import '../../services/cycle_insights.dart';
import '../../services/doctor_report_csv.dart';
import '../../services/doctor_report_pdf.dart';
import '../../state/app_lock_controller.dart';
import '../../state/app_preferences.dart';
import '../../state/cycle_controller.dart';
import '../../util/day.dart';

/// Backup/restore and the doctor-report exports. Reached from Settings.
///
/// Every path here is user-initiated sharing via the OS share sheet or print
/// dialog — nothing here talks to a network, matching CLAUDE.md's "the only
/// way data leaves the device is if the user exports it themselves".
class ExportScreen extends StatefulWidget {
  const ExportScreen({super.key});

  @override
  State<ExportScreen> createState() => _ExportScreenState();
}

class _ExportScreenState extends State<ExportScreen> {
  static const _backupService = BackupService();
  static const _csvBuilder = DoctorReportCsv();
  static const _pdfBuilder = DoctorReportPdf();

  bool _includeNotes = false;
  bool _busy = false;

  /// Every OS sheet on this screen goes through here.
  ///
  /// Without it the auto-lock fires the moment the share chooser or file
  /// picker takes the foreground, [AppRoot] replaces this screen with the
  /// lock screen, and the `await` below resumes unmounted — which is how
  /// restore-from-backup managed to do nothing at all on a real device
  /// while every test passed.
  Future<T> _sheet<T>(Future<T> Function() action) =>
      context.read<AppLockController>().duringSystemSheet(action);

  Future<void> _createBackup() async {
    final l10n = AppLocalizations.of(context)!;
    final password = await _promptNewPassword(context);
    if (password == null || !mounted) return;

    setState(() => _busy = true);
    try {
      final logs = context.read<CycleController>().logs;
      final bytes = await _backupService.createBackup(logs, password);
      if (!mounted) return;
      await _sheet(() => SharePlus.instance.share(ShareParams(
            files: [
              XFile.fromData(
                bytes,
                name: 'cycle-backup-${dayKey(today())}.cyclebackup',
                mimeType: 'application/octet-stream',
              ),
            ],
          )));
      if (!mounted) return;
      await context.read<AppPreferences>().markBackedUpNow();
      if (!mounted) return;
      _showSnack(l10n.exportBackupCreated);
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  Future<void> _restoreBackup() async {
    final l10n = AppLocalizations.of(context)!;

    final picked = await _sheet(() => FilePicker.pickFiles(
          type: FileType.custom,
          allowedExtensions: ['cyclebackup'],
        ));
    if (picked == null || picked.files.isEmpty || !mounted) return;
    final bytes = await picked.files.first.readAsBytes();
    if (!mounted) return;

    final password = await _promptSinglePassword(context);
    if (password == null || !mounted) return;

    final confirmed = await _confirmReplaceAllData(context);
    if (confirmed != true || !mounted) return;

    setState(() => _busy = true);
    try {
      final restored = await _backupService.restoreBackup(bytes, password);
      if (!mounted) return;
      await context.read<CycleController>().replaceAll(restored);
      if (!mounted) return;
      _showSnack(l10n.exportRestoreSuccess);
    } on SecretBoxAuthenticationError {
      if (mounted) _showSnack(l10n.exportWrongPassword);
    } on FormatException {
      if (mounted) _showSnack(l10n.exportInvalidFile);
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  /// The privacy-compatible answer to the reference app's "partner mode":
  /// a short text summary the user sends themselves through the OS share
  /// sheet. Live partner sync would need a server and an account, which
  /// this app deliberately does not have — so instead of a fake version of
  /// that, this shares exactly what the user chooses to send, once.
  Future<void> _sharePartnerSummary() async {
    final l10n = AppLocalizations.of(context)!;
    final controller = context.read<CycleController>();
    final status = controller.todayStatus;
    final prediction = controller.prediction;
    final fmt = DateFormat.yMMMMd(Localizations.localeOf(context).toString());

    final phaseLabel = switch (status.phase) {
      CyclePhase.menstrual => l10n.homePhaseMenstrual,
      CyclePhase.follicular => l10n.homePhaseFollicular,
      CyclePhase.fertileWindow => l10n.homePhaseFertileWindow,
      CyclePhase.luteal => l10n.homePhaseLuteal,
      CyclePhase.unknown => l10n.homePhaseUnknown,
    };

    final lines = <String>[
      l10n.partnerSummaryHeader,
      '',
      if (status.cycleDay != null) l10n.homeCycleDayLabel(status.cycleDay!),
      phaseLabel,
    ];
    if (prediction.hasPrediction) {
      lines.add('${l10n.calendarLegendPredicted}: '
          '${fmt.format(prediction.earliestStart!)} – '
          '${fmt.format(prediction.latestStart!)}');
    }
    lines
      ..add('')
      ..add(l10n.homeFertileWindowDisclaimer);

    await _sheet(
        () => SharePlus.instance.share(ShareParams(text: lines.join('\n'))));
  }

  Future<void> _shareCsv() async {
    final logs = context.read<CycleController>().logs;
    final csv = _csvBuilder.build(logs, includeNotes: _includeNotes);
    await _sheet(() => SharePlus.instance.share(ShareParams(
          files: [
            XFile.fromData(
              Uint8List.fromList(utf8.encode(csv)),
              name: 'cycle-doctor-report-${dayKey(today())}.csv',
              mimeType: 'text/csv',
            ),
          ],
        )));
  }

  /// Loads the report font from the app bundle.
  ///
  /// The `pdf` package does not use system fonts: whatever is not in the
  /// embedded face prints as a crossed box, silently. Quicksand is already
  /// bundled and covers the whole Latin range, which fixes Turkish (ğ ş ı),
  /// Vietnamese, Polish, Czech, Romanian and Hungarian.
  ///
  /// It does NOT cover Arabic, Cyrillic, Greek, CJK or Indic — those still
  /// print boxes and need an extra face bundled here as a fallback. That is
  /// a deliberate open gap, tracked by `doctor_report_pdf_font_test.dart`,
  /// not an oversight.
  Future<DoctorReportFonts> _loadReportFonts() async {
    final data = await rootBundle.load('assets/fonts/Quicksand-Variable.ttf');
    final font = pw.Font.ttf(data);
    return DoctorReportFonts(base: font, bold: font);
  }

  Future<void> _printPdf() async {
    final l10n = AppLocalizations.of(context)!;
    final controller = context.read<CycleController>();
    final insights = CycleInsights.compute(controller.cycles, controller.logs);

    final labels = DoctorReportPdfLabels(
      title: l10n.exportDoctorReportHeading,
      generatedOn: l10n.doctorReportGeneratedOn,
      disclaimer: l10n.doctorReportDisclaimer,
      summaryHeading: l10n.doctorReportSummaryHeading,
      cyclesLogged: l10n.insightsCyclesLoggedLabel,
      averagePeriodLength: l10n.insightsAveragePeriodLengthLabel,
      averageCycleLength: l10n.insightsAverageCycleLengthLabel,
      daysUnit: l10n.onboardingDaysUnit,
      dailyLogHeading: l10n.doctorReportDailyLogHeading,
      columnDate: l10n.doctorReportColumnDate,
      columnFlow: l10n.dayLogFlowLabel,
      columnSymptoms: l10n.dayLogSymptomsLabel,
      columnMood: l10n.dayLogMoodLabel,
      timelineHeading: l10n.doctorReportTimelineHeading,
      cycleLabel: l10n.doctorReportCycleLabel,
      timelineLegendPeriod: l10n.doctorReportTimelineLegendPeriod,
      timelineLegendCycle: l10n.doctorReportTimelineLegendCycle,
      timelineOngoing: l10n.doctorReportTimelineOngoing,
      // The table cells, in the reader's language — the headers already
      // were, and printing `breastTenderness` underneath a translated
      // header is worse than not translating either.
      flowNames: {
        for (final flow in FlowIntensity.values) flow: flowLabel(l10n, flow),
      },
      symptomNames: {
        for (final symptom in Symptom.values)
          symptom: symptomLabel(l10n, symptom),
      },
      moodNames: {for (final mood in Mood.values) mood: moodLabel(l10n, mood)},
      localeName: Localizations.localeOf(context).toString(),
    );

    final bytes = await _pdfBuilder.build(
      logs: controller.logs,
      insights: insights,
      generatedAt: today(),
      labels: labels,
      cycles: controller.cycles,
      fonts: await _loadReportFonts(),
    );

    await _sheet(() => Printing.layoutPdf(onLayout: (_) async => bytes));
  }

  void _showSnack(String message) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 3),
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.all(16),
      ));
  }

  Future<String?> _promptNewPassword(BuildContext context) {
    return showDialog<String>(
      context: context,
      builder: (_) => const _NewPasswordDialog(),
    );
  }

  Future<String?> _promptSinglePassword(BuildContext context) {
    return showDialog<String>(
      context: context,
      builder: (_) => const _SinglePasswordDialog(),
    );
  }

  Future<bool?> _confirmReplaceAllData(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return showDialog<bool>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: Text(l10n.exportRestoreConfirmTitle),
        content: Text(l10n.exportRestoreConfirmBody),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(false),
            child: Text(l10n.actionCancel),
          ),
          FilledButton(
            style: FilledButton.styleFrom(
              backgroundColor: Theme.of(dialogContext).colorScheme.error,
            ),
            onPressed: () => Navigator.of(dialogContext).pop(true),
            child: Text(l10n.exportRestoreConfirmAction),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(title: Text(l10n.settingsExportEntry)),
      body: SafeArea(
        child: AbsorbPointer(
          absorbing: _busy,
          child: Opacity(
            opacity: _busy ? 0.5 : 1,
            child: ListView(
              padding: const EdgeInsets.all(20),
              children: [
                Text(l10n.exportBackupHeading,
                    style: Theme.of(context).textTheme.titleMedium),
                const SizedBox(height: 8),
                Text(l10n.exportBackupBody),
                const SizedBox(height: 16),
                FilledButton(
                  onPressed: _createBackup,
                  child: Text(l10n.exportCreateBackupButton),
                ),
                const SizedBox(height: 8),
                OutlinedButton(
                  onPressed: _restoreBackup,
                  child: Text(l10n.exportRestoreBackupButton),
                ),
                const SizedBox(height: 32),
                Text(l10n.partnerShareTitle,
                    style: Theme.of(context).textTheme.titleMedium),
                const SizedBox(height: 8),
                Text(l10n.partnerShareBody),
                const SizedBox(height: 12),
                OutlinedButton.icon(
                  onPressed: _sharePartnerSummary,
                  icon: const Icon(Icons.favorite_outline),
                  label: Text(l10n.partnerShareCta),
                ),
                const SizedBox(height: 32),
                Text(l10n.exportDoctorReportHeading,
                    style: Theme.of(context).textTheme.titleMedium),
                const SizedBox(height: 8),
                Text(l10n.exportDoctorReportBody),
                CheckboxListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text(l10n.exportIncludeNotesToggle),
                  value: _includeNotes,
                  onChanged: (v) => setState(() => _includeNotes = v ?? false),
                ),
                const SizedBox(height: 8),
                FilledButton(
                  onPressed: _shareCsv,
                  child: Text(l10n.exportShareCsvButton),
                ),
                const SizedBox(height: 8),
                OutlinedButton(
                  onPressed: _printPdf,
                  child: Text(l10n.exportPrintPdfButton),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _NewPasswordDialog extends StatefulWidget {
  const _NewPasswordDialog();

  @override
  State<_NewPasswordDialog> createState() => _NewPasswordDialogState();
}

class _NewPasswordDialogState extends State<_NewPasswordDialog> {
  final _password = TextEditingController();
  final _confirm = TextEditingController();
  String? _error;

  @override
  void dispose() {
    _password.dispose();
    _confirm.dispose();
    super.dispose();
  }

  void _submit() {
    final l10n = AppLocalizations.of(context)!;
    if (_password.text.length < 8) {
      setState(() => _error = l10n.exportPasswordTooShort);
      return;
    }
    if (_password.text != _confirm.text) {
      setState(() => _error = l10n.exportPasswordMismatch);
      return;
    }
    Navigator.of(context).pop(_password.text);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return AlertDialog(
      title: Text(l10n.exportCreateBackupButton),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: _password,
            obscureText: true,
            decoration: InputDecoration(labelText: l10n.exportPasswordLabel),
          ),
          TextField(
            controller: _confirm,
            obscureText: true,
            decoration: InputDecoration(labelText: l10n.exportPasswordConfirmLabel),
          ),
          if (_error != null) ...[
            const SizedBox(height: 8),
            Text(_error!, style: TextStyle(color: Theme.of(context).colorScheme.error)),
          ],
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text(l10n.actionCancel),
        ),
        FilledButton(onPressed: _submit, child: Text(l10n.actionContinue)),
      ],
    );
  }
}

class _SinglePasswordDialog extends StatefulWidget {
  const _SinglePasswordDialog();

  @override
  State<_SinglePasswordDialog> createState() => _SinglePasswordDialogState();
}

class _SinglePasswordDialogState extends State<_SinglePasswordDialog> {
  final _password = TextEditingController();

  @override
  void dispose() {
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return AlertDialog(
      title: Text(l10n.exportRestoreBackupButton),
      content: TextField(
        controller: _password,
        obscureText: true,
        autofocus: true,
        decoration: InputDecoration(labelText: l10n.exportPasswordLabel),
        onSubmitted: (_) => Navigator.of(context).pop(_password.text),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text(l10n.actionCancel),
        ),
        FilledButton(
          onPressed: () => Navigator.of(context).pop(_password.text),
          child: Text(l10n.actionContinue),
        ),
      ],
    );
  }
}
