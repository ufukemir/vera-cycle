import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

import '../../l10n/app_localizations.dart';
import '../../services/crash_log.dart';

/// Shows the local crash log verbatim and lets the user send it — or not.
///
/// Displaying the raw text is the point, not a detail: the user is being
/// asked to share a diagnostic from a health app, and "trust us, there's
/// nothing sensitive in here" is exactly the sort of claim this product
/// refuses to make about anything else.
class DiagnosticsScreen extends StatefulWidget {
  const DiagnosticsScreen({super.key});

  @override
  State<DiagnosticsScreen> createState() => _DiagnosticsScreenState();
}

class _DiagnosticsScreenState extends State<DiagnosticsScreen> {
  String? _log;
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _reload();
  }

  Future<void> _reload() async {
    final log = await CrashLog.instance.read();
    if (!mounted) return;
    setState(() {
      _log = log;
      _loading = false;
    });
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
              Row(
                children: [
                  Expanded(
                    child: FilledButton.icon(
                      onPressed: () => SharePlus.instance
                          .share(ShareParams(text: log)),
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
              const SizedBox(height: 16),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: theme.colorScheme.surfaceContainerHigh,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: SelectableText(
                  log,
                  style: theme.textTheme.bodySmall
                      ?.copyWith(fontFamily: 'monospace'),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
