import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../l10n/app_localizations.dart';
import '../../state/app_preferences.dart';
import '../../widgets/illustrations.dart';

/// The Premium upsell.
///
/// Deliberately not a dark-pattern paywall (CLAUDE.md principle 6 still
/// stands): no countdown timer, no invented discount, no fake user counts,
/// no "you'll lose your data" scare. It states what Premium does (removes
/// ads), names the price plainly, and says cancelling is normal.
///
/// Prices here are placeholders and purchases are not wired up — there is
/// no billing SDK yet, so the CTA is honest about being unavailable rather
/// than pretending to charge.
class PremiumScreen extends StatelessWidget {
  const PremiumScreen({super.key});

  /// Replaces any visible snackbar instead of queueing behind it — two
  /// taps used to mean two sequential toasts.
  void _showComingSoon(BuildContext context, AppLocalizations l10n) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(
        content: Text(l10n.comingSoon),
        duration: const Duration(seconds: 3),
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.all(16),
      ));
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final prefs = context.watch<AppPreferences>();
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(title: Text(l10n.premiumTitle)),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            const PhotoHero(
                asset: 'assets/photos/seaside_smile.jpg', height: 180),
            const SizedBox(height: 20),
            Text(l10n.premiumHeadline, style: theme.textTheme.headlineSmall),
            const SizedBox(height: 8),
            Text(l10n.premiumSubhead, style: theme.textTheme.bodyMedium),
            const SizedBox(height: 20),
            if (prefs.premiumActive)
              Card(
                child: ListTile(
                  leading: Icon(Icons.check_circle,
                      color: theme.colorScheme.primary),
                  title: Text(l10n.premiumActiveBadge),
                ),
              ),
            _Benefit(text: l10n.premiumBenefitNoAds),
            _Benefit(text: l10n.premiumBenefitSupport),
            _Benefit(text: l10n.premiumBenefitFuture),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: _PlanCard(
                    title: l10n.premiumMonthly,
                    price: '₺39,99',
                    note: null,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _PlanCard(
                    title: l10n.premiumYearly,
                    price: '₺249,99',
                    note: l10n.premiumYearlyNote,
                    highlighted: true,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            FilledButton(
              onPressed: () => _showComingSoon(context, l10n),
              child: Text(l10n.premiumSubscribeCta),
            ),
            TextButton(
              onPressed: () => _showComingSoon(context, l10n),
              child: Text(l10n.premiumRestore),
            ),
            const SizedBox(height: 8),
            Text(l10n.premiumCancelNote,
                style: theme.textTheme.bodySmall, textAlign: TextAlign.center),
            const Divider(height: 40),
            // Lets the ad-free state be exercised before billing exists.
            SwitchListTile(
              title: Text(l10n.premiumDevToggle),
              value: prefs.premiumActive,
              onChanged: prefs.setPremiumActive,
            ),
          ],
        ),
      ),
    );
  }
}

class _Benefit extends StatelessWidget {
  const _Benefit({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.check_rounded,
              size: 20, color: Theme.of(context).colorScheme.primary),
          const SizedBox(width: 10),
          Expanded(
              child: Text(text, style: Theme.of(context).textTheme.bodyMedium)),
        ],
      ),
    );
  }
}

class _PlanCard extends StatelessWidget {
  const _PlanCard({
    required this.title,
    required this.price,
    required this.note,
    this.highlighted = false,
  });

  final String title;
  final String price;
  final String? note;
  final bool highlighted;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: highlighted ? scheme.primaryContainer : scheme.surfaceContainerHigh,
        borderRadius: BorderRadius.circular(20),
        border: highlighted ? Border.all(color: scheme.primary, width: 2) : null,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: Theme.of(context).textTheme.labelLarge),
          const SizedBox(height: 6),
          Text(price, style: Theme.of(context).textTheme.titleLarge),
          if (note != null) ...[
            const SizedBox(height: 4),
            Text(note!, style: Theme.of(context).textTheme.bodySmall),
          ],
        ],
      ),
    );
  }
}
