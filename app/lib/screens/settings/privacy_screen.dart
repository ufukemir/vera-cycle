import 'package:flutter/material.dart';

import '../../l10n/app_localizations.dart';

/// Static content, worded to match CLAUDE.md principle 4 directly — this is
/// the one screen where the product's core promise has to hold up to a
/// literal, technical reading, not just a marketing one.
class PrivacyScreen extends StatelessWidget {
  const PrivacyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final bodyStyle = Theme.of(context).textTheme.bodyLarge;

    return Scaffold(
      appBar: AppBar(title: Text(l10n.privacyScreenTitle)),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            Text(l10n.privacyScreenIntro,
                style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 20),
            Text(l10n.privacyScreenStorage, style: bodyStyle),
            const SizedBox(height: 16),
            Text(l10n.privacyScreenNoNetwork, style: bodyStyle),
            const SizedBox(height: 16),
            Text(l10n.privacyScreenNoThirdParty, style: bodyStyle),
            const SizedBox(height: 16),
            Text(l10n.privacyScreenExport, style: bodyStyle),
            const SizedBox(height: 16),
            Text(l10n.privacyScreenDelete, style: bodyStyle),
          ],
        ),
      ),
    );
  }
}
