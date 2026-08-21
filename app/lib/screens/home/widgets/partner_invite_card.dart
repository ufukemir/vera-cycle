import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../l10n/app_localizations.dart';
import '../../../state/partner_controller.dart';
import '../../partner/partner_mode_screen.dart';

/// A quiet, dismissible-for-the-session invitation to Partner Modu — shown
/// only when Firebase is actually configured for this build and the user
/// isn't already paired. On a checkout with no Firebase config yet (see
/// [PartnerController.isConfigured]) this renders nothing, matching how
/// [PartnerModeScreen] itself degrades.
class PartnerInviteCard extends StatefulWidget {
  const PartnerInviteCard({super.key});

  @override
  State<PartnerInviteCard> createState() => _PartnerInviteCardState();
}

class _PartnerInviteCardState extends State<PartnerInviteCard> {
  bool _dismissed = false;

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<PartnerController>();
    if (_dismissed ||
        !controller.ready ||
        !controller.isConfigured ||
        controller.isPaired) {
      return const SizedBox.shrink();
    }

    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: theme.colorScheme.tertiaryContainer.withValues(alpha: 0.55),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.favorite_outline,
                size: 20,
                color: theme.colorScheme.onTertiaryContainer,
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  l10n.homeInvitePartnerTitle,
                  style: theme.textTheme.titleSmall,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(l10n.homeInvitePartnerBody, style: theme.textTheme.bodySmall),
          const SizedBox(height: 10),
          Wrap(
            alignment: WrapAlignment.end,
            spacing: 8,
            runSpacing: 4,
            children: [
              TextButton(
                onPressed: () => setState(() => _dismissed = true),
                child: Text(l10n.backupNudgeDismiss),
              ),
              FilledButton(
                onPressed: () => Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => const PartnerModeScreen()),
                ),
                child: Text(l10n.homeInvitePartnerCta),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
