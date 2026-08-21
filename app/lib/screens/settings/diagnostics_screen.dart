import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';

import '../../l10n/app_localizations.dart';
import '../../services/crash_log.dart';
import '../../state/app_lock_controller.dart';

/// Lets the user send a note about a problem — with the crash log attached
/// automatically, so they don't have to reproduce or describe the technical
/// side of it themselves.
///
/// The screen used to open on the raw stack trace, then folded it away
/// behind a disclosure. Even collapsed, a `Element._debugCheckStateIsActive`
/// heading sitting on a health app's own screen read as more intimidating
/// than reassuring to someone who just wants to report a problem (2026-08-21,
/// Ufuk's call) — so the log itself no longer renders here at all. It is
/// still attached to what "Geliştiriciye gönder" shares (see [_report]);
/// only the in-app display of it is gone.
///
/// Rejecting Sentry/Crashlytics (see [CrashLog]) is what makes the log worth
/// attaching at all: there is no session replay to fall back on, so the
/// report is only as good as the technical detail that travels with it.
class DiagnosticsScreen extends StatefulWidget {
  const DiagnosticsScreen({super.key});

  @override
  State<DiagnosticsScreen> createState() => _DiagnosticsScreenState();
}

class _DiagnosticsScreenState extends State<DiagnosticsScreen> {
  final _note = TextEditingController();
  String? _log;
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _reload();
  }

  @override
  void dispose() {
    _note.dispose();
    super.dispose();
  }

  Future<void> _reload() async {
    final log = await CrashLog.instance.read();
    if (!mounted) return;
    setState(() {
      _log = log;
      _loading = false;
    });
  }

  /// The note first, then the log under a marker.
  ///
  /// Not localized: this text is read by a developer, not by the user, and
  /// a report whose section headings arrive in Tamil is harder to triage,
  /// not friendlier.
  String _report(String log) {
    final note = _note.text.trim();
    if (note.isEmpty) return log;
    return '$note\n\n----- LOG -----\n$log';
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    final log = _log;

    return Scaffold(
      appBar: AppBar(title: Text(l10n.settingsDiagnosticsEntry)),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            Text(l10n.diagnosticsBody, style: theme.textTheme.bodyMedium),
            const SizedBox(height: 20),
            if (_loading)
              const Center(child: CircularProgressIndicator())
            else if (log == null)
              Text(l10n.diagnosticsEmpty, style: theme.textTheme.bodyMedium)
            else ...[
              TextField(
                controller: _note,
                minLines: 3,
                maxLines: 6,
                textCapitalization: TextCapitalization.sentences,
                decoration: InputDecoration(
                  labelText: l10n.diagnosticsNoteLabel,
                  alignLabelWithHint: true,
                  filled: true,
                  fillColor: theme.colorScheme.surfaceContainerHigh,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: FilledButton.icon(
                      onPressed: () =>
                          context.read<AppLockController>().duringSystemSheet(
                            () => SharePlus.instance.share(
                              ShareParams(text: _report(log)),
                            ),
                          ),
                      icon: const Icon(Icons.ios_share),
                      label: Text(l10n.diagnosticsShare),
                    ),
                  ),
                  const SizedBox(width: 10),
                  OutlinedButton(
                    onPressed: () async {
                      await CrashLog.instance.clear();
                      await _reload();
                    },
                    child: Text(l10n.diagnosticsClear),
                  ),
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }
}
