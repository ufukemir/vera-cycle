import 'dart:convert';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../l10n/app_localizations.dart';
import '../../services/csv_cycle_importer.dart';
import '../../state/app_lock_controller.dart';
import '../../state/cycle_controller.dart';

/// Brings history over from another tracker.
///
/// The whole point is removing the switching cost: someone with three
/// years of logs elsewhere shouldn't have to start from zero here.
///
/// Imported days are *merged*, never a wholesale replace — days already
/// logged in Vera win, because those were entered deliberately in this
/// app and a bulk import shouldn't quietly overwrite them.
class ImportScreen extends StatefulWidget {
  const ImportScreen({super.key});

  @override
  State<ImportScreen> createState() => _ImportScreenState();
}

class _ImportScreenState extends State<ImportScreen> {
  static const _importer = CsvCycleImporter();

  CsvImportResult? _preview;
  String? _error;
  bool _busy = false;

  Future<void> _pickFile() async {
    final l10n = AppLocalizations.of(context)!;
    // Through the lock controller: on Android the picker is a separate
    // activity, so the auto-lock would fire, unmount this screen, and the
    // await below would resume with `mounted == false` — dropping the
    // chosen file with no error and no import.
    final picked = await context.read<AppLockController>().duringSystemSheet(
      () => FilePicker.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['csv', 'txt'],
      ),
    );
    if (picked == null || picked.files.isEmpty || !mounted) return;

    setState(() {
      _busy = true;
      _error = null;
      _preview = null;
    });
    try {
      final bytes = await picked.files.first.readAsBytes();
      // Exports are commonly UTF-8 with a BOM; allowMalformed keeps a
      // stray byte from failing the whole file.
      final text = utf8.decode(bytes, allowMalformed: true);
      final result = _importer.parse(text);
      if (!mounted) return;
      setState(() => _preview = result);
    } on CsvImportException catch (e) {
      if (!mounted) return;
      setState(
        () => _error = switch (e.reason) {
          CsvImportFailure.empty => l10n.importErrorEmpty,
          CsvImportFailure.noDateColumn => l10n.importErrorNoDate,
        },
      );
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  Future<void> _commit() async {
    final preview = _preview;
    if (preview == null || preview.isEmpty) return;
    final l10n = AppLocalizations.of(context)!;
    final controller = context.read<CycleController>();

    setState(() => _busy = true);
    final added = await controller.addMissingDays(preview.logs);
    if (!mounted) return;
    setState(() {
      _busy = false;
      _preview = null;
    });
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text(l10n.importDone(added)),
          behavior: SnackBarBehavior.floating,
          margin: const EdgeInsets.all(16),
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    final preview = _preview;

    return Scaffold(
      appBar: AppBar(title: Text(l10n.importTitle)),
      body: SafeArea(
        child: AbsorbPointer(
          absorbing: _busy,
          child: Opacity(
            opacity: _busy ? 0.5 : 1,
            child: ListView(
              padding: const EdgeInsets.all(20),
              children: [
                Text(l10n.importBody, style: theme.textTheme.bodyMedium),
                const SizedBox(height: 20),
                OutlinedButton.icon(
                  onPressed: _pickFile,
                  icon: const Icon(Icons.upload_file_outlined),
                  label: Text(l10n.importPickFile),
                ),
                if (_error != null) ...[
                  const SizedBox(height: 16),
                  Text(
                    _error!,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: theme.colorScheme.error,
                    ),
                  ),
                ],
                if (preview != null) ...[
                  const SizedBox(height: 24),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            l10n.importPreview(preview.logs.length),
                            style: theme.textTheme.titleMedium,
                          ),
                          if (preview.detectedDateHeader != null) ...[
                            const SizedBox(height: 6),
                            Text(
                              [
                                preview.detectedDateHeader,
                                preview.detectedFlowHeader,
                              ].whereType<String>().join(' · '),
                              style: theme.textTheme.bodySmall,
                            ),
                          ],
                          if (preview.skippedRows > 0) ...[
                            const SizedBox(height: 6),
                            Text(
                              l10n.importSkipped(preview.skippedRows),
                              style: theme.textTheme.bodySmall,
                            ),
                          ],
                          const SizedBox(height: 10),
                          Text(
                            l10n.importMergeNote,
                            style: theme.textTheme.bodySmall,
                          ),
                          const SizedBox(height: 12),
                          SizedBox(
                            width: double.infinity,
                            child: FilledButton(
                              onPressed: preview.isEmpty ? null : _commit,
                              child: Text(l10n.importConfirm),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
