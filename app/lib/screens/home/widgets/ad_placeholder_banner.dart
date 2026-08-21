import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart';

import '../../../l10n/app_localizations.dart';
import '../../../services/ad_consent_service.dart';
import '../../../services/ad_ids.dart';
import '../../../state/app_preferences.dart';
import '../../premium/premium_screen.dart';

/// The free tier's banner ad, with an upgrade prompt underneath.
///
/// Renders nothing at all when [AppPreferences.premiumActive] — Premium's
/// whole promise is no ads, so the widget is absent from the tree rather
/// than merely hidden. The ad SDK is the only third-party component in the
/// app and never receives cycle data (see CLAUDE.md's revised principles).
class AdPlaceholderBanner extends StatefulWidget {
  const AdPlaceholderBanner({super.key});

  @override
  State<AdPlaceholderBanner> createState() => _AdPlaceholderBannerState();
}

class _AdPlaceholderBannerState extends State<AdPlaceholderBanner> {
  BannerAd? _ad;
  bool _loaded = false;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    // Ads exist on Android and iOS only; elsewhere (including tests) the
    // widget just renders its upgrade row.
    if (!Platform.isAndroid && !Platform.isIOS) return;
    // Consent first, always: loading an ad before the UMP flow says we
    // may is exactly the EEA/UK violation AdConsentService guards.
    if (!await const AdConsentService().ensureConsent()) return;
    if (!mounted) return;

    final ad = BannerAd(
      adUnitId: AdIds.banner,
      size: AdSize.banner,
      request: const AdRequest(),
      listener: BannerAdListener(
        onAdLoaded: (_) {
          if (mounted) setState(() => _loaded = true);
        },
        onAdFailedToLoad: (ad, error) => ad.dispose(),
      ),
    );
    _ad = ad;
    try {
      await ad.load();
    } on MissingPluginException {
      // No ad platform channel — this is `flutter test`, or a platform
      // where ads aren't wired up. The upgrade row still renders; an
      // absent ad must never take the screen down with it.
      _ad = null;
    }
  }

  @override
  void dispose() {
    _ad?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (context.watch<AppPreferences>().premiumActive) {
      return const SizedBox.shrink();
    }
    final l10n = AppLocalizations.of(context)!;
    final scheme = Theme.of(context).colorScheme;

    return Column(
      children: [
        if (_loaded && _ad != null)
          SizedBox(
            width: _ad!.size.width.toDouble(),
            height: _ad!.size.height.toDouble(),
            child: AdWidget(ad: _ad!),
          )
        else
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 14),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: scheme.outlineVariant),
            ),
            child: Center(
              child: Text(
                l10n.adPlaceholderLabel,
                style: Theme.of(
                  context,
                ).textTheme.bodySmall?.copyWith(color: scheme.outline),
              ),
            ),
          ),
        TextButton(
          onPressed: () => Navigator.of(
            context,
          ).push(MaterialPageRoute(builder: (_) => const PremiumScreen())),
          child: Text(
            l10n.adPlaceholderUpgradeCta,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
