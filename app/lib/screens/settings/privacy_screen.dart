import 'package:flutter/material.dart';

import '../../l10n/app_localizations.dart';
import '../../theme/app_theme.dart';

/// Static content, worded to match CLAUDE.md principle 4 directly — this is
/// the one screen where the product's core promise has to hold up to a
/// literal, technical reading, not just a marketing one.
///
/// Which is exactly why it cannot be six stacked paragraphs of body text.
/// The promise is the product; a page nobody finishes reading is a promise
/// nobody checks. Each claim now gets its own card with a heading, so the
/// page can be skimmed in five seconds *and* read in full — and so a
/// specific claim ("is anything uploaded?") can be found without re-reading
/// the whole wall.
class PrivacyScreen extends StatelessWidget {
  const PrivacyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);

    final sections = <_PrivacyPoint>[
      _PrivacyPoint(
        icon: Icons.lock_outline_rounded,
        tint: AppPalette.roseSoft,
        ink: AppPalette.roseSoftText,
        title: l10n.privacyScreenStorageTitle,
        body: l10n.privacyScreenStorage,
      ),
      _PrivacyPoint(
        icon: Icons.cloud_off_outlined,
        tint: AppPalette.skySoft,
        ink: AppPalette.skySoftText,
        title: l10n.privacyScreenNoNetworkTitle,
        body: l10n.privacyScreenNoNetwork,
      ),
      _PrivacyPoint(
        icon: Icons.visibility_off_outlined,
        tint: AppPalette.lavenderSoft,
        ink: AppPalette.lavenderSoftText,
        title: l10n.privacyScreenNoThirdPartyTitle,
        body: l10n.privacyScreenNoThirdParty,
      ),
      _PrivacyPoint(
        icon: Icons.ios_share_outlined,
        tint: AppPalette.goldSoft,
        ink: AppPalette.goldSoftText,
        title: l10n.privacyScreenExportTitle,
        body: l10n.privacyScreenExport,
      ),
      _PrivacyPoint(
        icon: Icons.delete_outline_rounded,
        tint: AppPalette.mintSoft,
        ink: AppPalette.mintSoftText,
        title: l10n.privacyScreenDeleteTitle,
        body: l10n.privacyScreenDelete,
      ),
    ];

    return Scaffold(
      appBar: AppBar(title: Text(l10n.privacyScreenTitle)),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(20, 8, 20, 32),
          children: [
            Text(
              l10n.privacyScreenIntro,
              style: theme.textTheme.headlineSmall?.copyWith(
                color: theme.colorScheme.onSurface,
              ),
            ),
            const SizedBox(height: 24),
            for (final section in sections)
              Padding(
                padding: const EdgeInsets.only(bottom: 14),
                child: _PrivacyCard(point: section),
              ),
          ],
        ),
      ),
    );
  }
}

class _PrivacyPoint {
  const _PrivacyPoint({
    required this.icon,
    required this.tint,
    required this.ink,
    required this.title,
    required this.body,
  });

  final IconData icon;
  final Color tint;
  final Color ink;
  final String title;
  final String body;
}

class _PrivacyCard extends StatelessWidget {
  const _PrivacyCard({required this.point});

  final _PrivacyPoint point;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    // Same inversion as the day-log cards: the pastels are light-mode ink
    // holders, so in dark mode the pastel becomes the ink and the panel
    // keeps only a trace of the hue.
    final panel = isDark
        ? Color.alphaBlend(
            point.tint.withValues(alpha: 0.09),
            theme.colorScheme.surface,
          )
        : point.tint.withValues(alpha: 0.45);
    final badge = isDark ? point.tint.withValues(alpha: 0.16) : point.tint;
    final ink = isDark ? point.tint : point.ink;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: panel,
        borderRadius: BorderRadius.circular(22),
        border: isDark
            ? Border.all(color: point.tint.withValues(alpha: 0.18))
            : null,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 34,
                height: 34,
                decoration: BoxDecoration(shape: BoxShape.circle, color: badge),
                child: Icon(point.icon, size: 18, color: ink),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  point.title,
                  style: theme.textTheme.titleMedium?.copyWith(color: ink),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            point.body,
            style: theme.textTheme.bodyMedium?.copyWith(height: 1.45),
          ),
        ],
      ),
    );
  }
}
