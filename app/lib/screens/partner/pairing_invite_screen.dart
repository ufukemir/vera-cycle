import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';

import '../../l10n/app_localizations.dart';
import '../../state/app_lock_controller.dart';
import '../../state/partner_controller.dart';

/// Generates a one-time pairing code and offers to share it. The code is
/// created eagerly on open, not behind a button — there's exactly one thing
/// to do on this screen, so asking first would just be a second tap.
class PairingInviteScreen extends StatefulWidget {
  const PairingInviteScreen({super.key});

  @override
  State<PairingInviteScreen> createState() => _PairingInviteScreenState();
}

class _PairingInviteScreenState extends State<PairingInviteScreen> {
  String? _code;
  bool _requested = false;

  Future<void> _generate() async {
    _requested = true;
    final controller = context.read<PartnerController>();
    final code = await controller.createPairingCode();
    if (!mounted) return;
    setState(() => _code = code);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final controller = context.watch<PartnerController>();
    final scheme = Theme.of(context).colorScheme;

    if (!_requested) {
      // Fire once; `build` re-runs on every notifyListeners() from the
      // controller and must not re-request a fresh code each time.
      WidgetsBinding.instance.addPostFrameCallback((_) => _generate());
    }

    return Scaffold(
      appBar: AppBar(title: Text(l10n.partnerModeInviteTitle)),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              Text(
                l10n.partnerModeInviteBody,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: scheme.onSurfaceVariant,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),
              if (_code == null && controller.loading)
                const CircularProgressIndicator()
              else if (_code == null)
                Text(
                  l10n.partnerModeErrorUnknown,
                  style: TextStyle(color: scheme.error),
                )
              else ...[
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 28,
                    vertical: 18,
                  ),
                  decoration: BoxDecoration(
                    color: scheme.surfaceContainerHigh,
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: Text(
                    _code!,
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      letterSpacing: 6,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  l10n.partnerModeInviteExpiry,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: scheme.onSurfaceVariant,
                  ),
                ),
                const SizedBox(height: 28),
                FilledButton.icon(
                  icon: const Icon(Icons.ios_share),
                  label: Text(l10n.partnerModeInviteShare),
                  onPressed: () =>
                      context.read<AppLockController>().duringSystemSheet(
                        () => SharePlus.instance.share(
                          ShareParams(
                            text: l10n.partnerModeInviteMessage(_code!),
                          ),
                        ),
                      ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
