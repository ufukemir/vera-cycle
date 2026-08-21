import 'package:flutter/material.dart';

import '../../../l10n/app_localizations.dart';

/// Prompts for a new backup password (entered twice, ≥8 characters) —
/// shared by local export and cloud backup, since both ultimately call
/// [BackupService.createBackup] and need the exact same password.
class NewPasswordDialog extends StatefulWidget {
  const NewPasswordDialog({super.key});

  @override
  State<NewPasswordDialog> createState() => _NewPasswordDialogState();
}

class _NewPasswordDialogState extends State<NewPasswordDialog> {
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
            decoration: InputDecoration(
              labelText: l10n.exportPasswordConfirmLabel,
            ),
          ),
          if (_error != null) ...[
            const SizedBox(height: 8),
            Text(
              _error!,
              style: TextStyle(color: Theme.of(context).colorScheme.error),
            ),
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

/// Prompts for an existing backup password once — shared by local restore
/// and cloud restore.
class SinglePasswordDialog extends StatefulWidget {
  const SinglePasswordDialog({super.key});

  @override
  State<SinglePasswordDialog> createState() => _SinglePasswordDialogState();
}

class _SinglePasswordDialogState extends State<SinglePasswordDialog> {
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
