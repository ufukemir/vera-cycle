import 'package:flutter/material.dart';

import '../../../l10n/app_localizations.dart';

/// A reserved space for where a banner ad will render once the free tier
/// ships. No ad SDK is wired up here — no network permission, no
/// third-party code — this is purely a layout/visual placeholder so the
/// eventual ad slot has a fixed, already-designed home, and the upgrade
/// CTA can be user-tested before any real ad integration happens.
class AdPlaceholderBanner extends StatelessWidget {
  const AdPlaceholderBanner({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final scheme = Theme.of(context).colorScheme;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: scheme.outlineVariant, style: BorderStyle.solid),
      ),
      child: Row(
        children: [
          Icon(Icons.ads_click_outlined, size: 18, color: scheme.outline),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              l10n.adPlaceholderLabel,
              style: Theme.of(context)
                  .textTheme
                  .bodySmall
                  ?.copyWith(color: scheme.outline),
            ),
          ),
          TextButton(
            onPressed: () => ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(l10n.comingSoon)),
            ),
            child: Text(l10n.adPlaceholderUpgradeCta),
          ),
        ],
      ),
    );
  }
}
