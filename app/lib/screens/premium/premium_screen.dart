import 'package:flutter/foundation.dart' show kDebugMode;
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../l10n/app_localizations.dart';
import '../../state/app_preferences.dart';

/// The Premium upsell.
///
/// Deliberately not a dark-pattern paywall (CLAUDE.md principle 6 still
/// stands): no countdown timer, no invented discount, no fake user counts,
/// no "you'll lose your data" scare. It states what Premium does, names the
/// price plainly, and says cancelling is normal.
///
/// It used to state all that in a flat column of text, which made the one
/// screen meant to sell something the plainest screen in the app. The
/// rebuild borrows the shape every paywall in the category uses — photo
/// header, benefits with icons, two tappable plans, a CTA that stays on
/// screen — and none of the pressure tactics. The shape is not the dark
/// pattern; the fake scarcity is.
///
/// The yearly card shows a per-month figure. That is arithmetic on the real
/// price, not a "discount" against a price nobody ever pays.
///
/// Prices here are placeholders and purchases are not wired up — there is
/// no billing SDK yet, so the CTA is honest about being unavailable rather
/// than pretending to charge.
class PremiumScreen extends StatefulWidget {
  const PremiumScreen({super.key});

  @override
  State<PremiumScreen> createState() => _PremiumScreenState();
}

enum _Plan { monthly, yearly }

class _PremiumScreenState extends State<PremiumScreen> {
  // Yearly, because it is the one most people want and pre-selecting it
  // saves a tap. Both are one tap away either way; nothing is hidden.
  _Plan _selected = _Plan.yearly;

  static const _monthlyPrice = 39.99;
  static const _yearlyPrice = 249.99;

  /// Placeholder pricing in Turkish lira. Real prices come from the store
  /// once billing exists, already localised; until then the symbol is fixed
  /// and only the number formatting follows the locale.
  String _price(BuildContext context, double amount) =>
      NumberFormat.currency(
        locale: Localizations.localeOf(context).toString(),
        symbol: '₺',
        decimalDigits: 2,
      ).format(amount);

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
    final scheme = theme.colorScheme;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 260,
            pinned: true,
            foregroundColor: Colors.white,
            backgroundColor: scheme.primary,
            flexibleSpace: FlexibleSpaceBar(
              titlePadding:
                  const EdgeInsetsDirectional.only(start: 56, bottom: 14, end: 16),
              title: Text(
                l10n.premiumTitle,
                style: const TextStyle(color: Colors.white, fontSize: 18),
              ),
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset('assets/photos/seaside_smile.jpg',
                      fit: BoxFit.cover),
                  const DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        stops: [0, 0.5, 1],
                        colors: [
                          Color(0x33000000),
                          Color(0x1A000000),
                          Color(0xCC000000),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 8),
            sliver: SliverList.list(
              children: [
                if (prefs.premiumActive)
                  Card(
                    color: scheme.primaryContainer,
                    child: ListTile(
                      leading: Icon(Icons.check_circle,
                          color: scheme.onPrimaryContainer),
                      title: Text(
                        l10n.premiumActiveBadge,
                        style: TextStyle(color: scheme.onPrimaryContainer),
                      ),
                    ),
                  ),
                Text(l10n.premiumHeadline,
                    style: theme.textTheme.headlineSmall
                        ?.copyWith(fontWeight: FontWeight.w600)),
                const SizedBox(height: 8),
                Text(l10n.premiumSubhead, style: theme.textTheme.bodyMedium),
                const SizedBox(height: 22),
                _Benefit(
                    icon: Icons.do_not_disturb_on_outlined,
                    text: l10n.premiumBenefitNoAds),
                _Benefit(
                    icon: Icons.dashboard_customize_outlined,
                    text: l10n.premiumBenefitCustomTrackers),
                _Benefit(
                    icon: Icons.insights_outlined,
                    text: l10n.premiumBenefitAdvancedInsights),
                _Benefit(
                    icon: Icons.notifications_active_outlined,
                    text: l10n.premiumBenefitAdvancedReminders),
                _Benefit(
                    icon: Icons.palette_outlined,
                    text: l10n.premiumBenefitPersonalisation),
                _Benefit(
                    icon: Icons.favorite_outline,
                    text: l10n.premiumBenefitSupport),
                const SizedBox(height: 24),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: _PlanCard(
                        title: l10n.premiumMonthly,
                        price: _price(context, _monthlyPrice),
                        note: l10n.premiumBilledMonthly,
                        selected: _selected == _Plan.monthly,
                        onTap: () =>
                            setState(() => _selected = _Plan.monthly),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: _PlanCard(
                        title: l10n.premiumYearly,
                        price: _price(context, _yearlyPrice),
                        note: l10n.premiumYearlyNote,
                        // Plain division, shown so the two cards can be
                        // compared on the same unit.
                        footnote: l10n.premiumPerMonth(
                            _price(context, _yearlyPrice / 12)),
                        selected: _selected == _Plan.yearly,
                        onTap: () => setState(() => _selected = _Plan.yearly),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                // The promise this app is built on, restated where someone
                // is deciding whether to pay: nothing they already have
                // moves behind the paywall.
                Card(
                  color: scheme.surfaceContainerHighest,
                  elevation: 0,
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.lock_open_outlined,
                                size: 20, color: scheme.primary),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Text(l10n.premiumStaysFreeTitle,
                                  style: theme.textTheme.titleSmall),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Text(l10n.premiumStaysFreeBody,
                            style: theme.textTheme.bodySmall),
                      ],
                    ),
                  ),
                ),
                // Lets the ad-free state be exercised before billing exists.
                //
                // DEBUG ONLY. This shipped in release builds, where it was a
                // switch that handed every user Premium for free — and, next
                // to a paywall showing real prices behind a dead Subscribe
                // button, a guaranteed store rejection. `kDebugMode` is
                // compile-time const, so the whole subtree is tree-shaken
                // out of release.
                if (kDebugMode) ...[
                  const Divider(height: 40),
                  SwitchListTile(
                    title: Text(l10n.premiumDevToggle),
                    value: prefs.premiumActive,
                    onChanged: prefs.setPremiumActive,
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
      // Stays on screen while the benefits scroll: the decision and the
      // button that acts on it should never be separated by a scroll.
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 8, 20, 8),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: double.infinity,
                child: FilledButton(
                  onPressed: () => _showComingSoon(context, l10n),
                  style: FilledButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    textStyle: theme.textTheme.titleMedium,
                  ),
                  child: Text(l10n.premiumSubscribeCta),
                ),
              ),
              TextButton(
                onPressed: () => _showComingSoon(context, l10n),
                child: Text(l10n.premiumRestore),
              ),
              Text(
                l10n.premiumCancelNote,
                style: theme.textTheme.bodySmall
                    ?.copyWith(color: scheme.onSurfaceVariant),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Benefit extends StatelessWidget {
  const _Benefit({required this.icon, required this.text});

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              color: scheme.primary.withValues(alpha: 0.12),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, size: 19, color: scheme.primary),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Text(text, style: Theme.of(context).textTheme.bodyMedium),
          ),
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
    required this.selected,
    required this.onTap,
    this.footnote,
  });

  final String title;
  final String price;
  final String note;
  final String? footnote;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;
    return Semantics(
      selected: selected,
      button: true,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(18),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 160),
          padding: const EdgeInsets.fromLTRB(14, 16, 14, 14),
          decoration: BoxDecoration(
            color: selected
                ? scheme.primary.withValues(alpha: 0.08)
                : scheme.surfaceContainerHighest.withValues(alpha: 0.5),
            borderRadius: BorderRadius.circular(18),
            border: Border.all(
              color: selected ? scheme.primary : scheme.outlineVariant,
              width: selected ? 2 : 1,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(title, style: theme.textTheme.titleSmall),
                  ),
                  Icon(
                    selected
                        ? Icons.radio_button_checked
                        : Icons.radio_button_unchecked,
                    size: 20,
                    color: selected ? scheme.primary : scheme.outline,
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Text(
                price,
                style: theme.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.w700,
                  color: selected ? scheme.primary : scheme.onSurface,
                ),
              ),
              const SizedBox(height: 2),
              Text(note,
                  style: theme.textTheme.bodySmall
                      ?.copyWith(color: scheme.onSurfaceVariant)),
              if (footnote != null) ...[
                const SizedBox(height: 6),
                Text(
                  footnote!,
                  style: theme.textTheme.labelSmall?.copyWith(
                    color: scheme.primary,
                    fontWeight: FontWeight.w600,
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
