import 'dart:convert';
import 'dart:typed_data';

import 'package:cryptography/cryptography.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:printing/printing.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';

import '../../l10n/app_localizations.dart';
import '../../services/backup_service.dart';
import '../../services/cycle_insights.dart';
import '../../services/doctor_report_csv.dart';
import '../../services/doctor_report_pdf.dart';
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

  Future<void> _createBackup() async {
    final l10n = AppLocalizations.of(context)!;
    final password = await _promptNewPassword(context);
    if (password == null || !mounted) return;

    setState(() => _busy = true);
    try {
      final logs = context.read<CycleController>().logs;
      final bytes = await _backupService.createBackup(logs, password);
      if (!mounted) return;
      await SharePlus.instance.share(ShareParams(
        files: [
          XFile.fromData(
            bytes,
            name: 'cycle-backup-${dayKey(today())}.cyclebackup',
            mimeType: 'application/octet-stream',
          ),
        ],
      ));
      if (!mounted) return;
      _showSnack(l10n.exportBackupCreated);
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  Future<void> _restoreBackup() async {
    final l10n = AppLocalizations.of(context)!;

    final picked = await FilePicker.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['cyclebackup'],
    );
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

  Future<void> _shareCsv() async {
    final logs = context.read<CycleController>().logs;
    final csv = _csvBuilder.build(logs, includeNotes: _includeNotes);
    await SharePlus.instance.share(ShareParams(
      files: [
        XFile.fromData(
          Uint8List.fromList(utf8.encode(csv)),
          name: 'cycle-doctor-report-${dayKey(today())}.csv',
          mimeType: 'text/csv',
        ),
      ],
    ));
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
    );

    final bytes = await _pdfBuilder.build(
      logs: controller.logs,
      insights: insights,
      generatedAt: today(),
      labels: labels,
    );

    await Printing.layoutPdf(onLayout: (_) async => bytes);
  }

  void _showSnack(String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
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
