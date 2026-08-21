import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../l10n/app_localizations.dart';
import '../../models/enums.dart';
import '../../state/app_preferences.dart';
import '../../theme/app_theme.dart';
import '../../widgets/illustrations.dart';
import '../home/widgets/home_hero.dart';
import '../premium/premium_screen.dart';

/// Appearance, on its own screen — light/dark mode, the home background,
/// and the mascot picker.
///
/// This used to be a section inside Settings, and the "Tema" quick action
/// on the profile screen opened Settings scrolled down to it — which read,
/// to someone tapping it right next to "Ayarlar", as the exact same
/// destination with extra steps. It is now an actual different place: its
/// own AppBar, reachable from the quick action directly and from Settings'
/// own entry for anyone who didn't come from there.
class ThemeScreen extends StatelessWidget {
  const ThemeScreen({super.key});

  void _openPremium(BuildContext context) => Navigator.of(
    context,
  ).push(MaterialPageRoute(builder: (_) => const PremiumScreen()));

  Widget _sectionHeading(BuildContext context, String text) => Padding(
    padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
    child: Text(text, style: Theme.of(context).textTheme.titleMedium),
  );

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final prefs = context.watch<AppPreferences>();

    return Scaffold(
      appBar: AppBar(title: Text(l10n.settingsThemeLabel)),
      body: SafeArea(
        child: ListView(
          children: [
            const SizedBox(height: 8),
            // Light/dark is a card too, for the same reason the unit
            // pickers are: a heading floating above a segmented button ties
            // the two together only by proximity.
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: _SettingCard(
                icon: Icons.brightness_6_outlined,
                tint: AppPalette.lavenderSoft,
                ink: AppPalette.lavenderSoftText,
                label: l10n.settingsThemeLabel,
                child: SegmentedButton<ThemeMode>(
                  segments: [
                    ButtonSegment(
                      value: ThemeMode.system,
                      label: Text(l10n.settingsThemeSystem),
                    ),
                    ButtonSegment(
                      value: ThemeMode.light,
                      label: Text(l10n.settingsThemeLight),
                    ),
                    ButtonSegment(
                      value: ThemeMode.dark,
                      label: Text(l10n.settingsThemeDark),
                    ),
                  ],
                  selected: {prefs.themeMode},
                  onSelectionChanged: (s) => prefs.setThemeMode(s.first),
                ),
              ),
            ),
            const SizedBox(height: 6),
            _sectionHeading(context, l10n.settingsHomeThemeLabel),
            SizedBox(
              height: 96,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                children: [
                  for (final entry in {
                    HomeTheme.wheat: l10n.homeThemeWheat,
                    HomeTheme.sky: l10n.homeThemeSky,
                    HomeTheme.field: l10n.homeThemeField,
                    HomeTheme.blossom: l10n.homeThemeBlossom,
                    HomeTheme.plain: l10n.homeThemePlain,
                    HomeTheme.dusk: l10n.homeThemeDusk,
                    HomeTheme.meadow: l10n.homeThemeMeadow,
                    HomeTheme.petal: l10n.homeThemePetal,
                    HomeTheme.bloom: l10n.homeThemeBloom,
                    HomeTheme.ocean: l10n.homeThemeOcean,
                    HomeTheme.autumn: l10n.homeThemeAutumn,
                    HomeTheme.night: l10n.homeThemeNight,
                  }.entries)
                    Padding(
                      // Directional: in RTL the gap belongs after the
                      // swatch in reading order, not on its physical right.
                      padding: const EdgeInsetsDirectional.only(end: 10),
                      child: _ThemeSwatch(
                        label: entry.value,
                        theme: entry.key,
                        // The companion previews inside the swatch, so
                        // picking a background shows the scene you will
                        // actually land on rather than an empty backdrop.
                        mascot: prefs.mascot,
                        // The user's actual choice, not the one currently
                        // rendered: a lapsed Premium theme stays ticked
                        // here so resubscribing restores it, and so the
                        // picker never shows two swatches as selected.
                        selected: prefs.selectedHomeTheme == entry.key,
                        // Locked swatches are shown, not hidden: seeing what
                        // Premium adds is the honest version of an upsell.
                        locked: entry.key.premium && !prefs.premiumActive,
                        onTap: () => entry.key.premium && !prefs.premiumActive
                            ? _openPremium(context)
                            : prefs.setHomeTheme(entry.key),
                      ),
                    ),
                ],
              ),
            ),
            _sectionHeading(context, l10n.settingsMascotLabel),
            // Characters, not words. The picker listed "Droplet", "Flower",
            // "Moon" as text chips — you had to choose a companion you could
            // not see, then leave Settings to find out what you picked. They
            // are drawn characters; showing them is the whole point of
            // having them.
            SizedBox(
              height: 108,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                children: [
                  for (final entry in {
                    Mascot.droplet: l10n.mascotDroplet,
                    Mascot.flower: l10n.mascotFlower,
                    Mascot.moon: l10n.mascotMoon,
                    Mascot.star: l10n.mascotStar,
                    Mascot.leaf: l10n.mascotLeaf,
                    Mascot.cat: l10n.mascotCat,
                    Mascot.rabbit: l10n.mascotRabbit,
                    Mascot.bird: l10n.mascotBird,
                    Mascot.none: l10n.mascotNone,
                  }.entries)
                    _MascotOption(
                      mascot: entry.key,
                      label: entry.value,
                      selected: prefs.selectedMascot == entry.key,
                      locked: entry.key.premium && !prefs.premiumActive,
                      onTap: () => entry.key.premium && !prefs.premiumActive
                          ? _openPremium(context)
                          : prefs.setMascot(entry.key),
                    ),
                ],
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}

class _ThemeSwatch extends StatelessWidget {
  const _ThemeSwatch({
    required this.label,
    required this.theme,
    required this.selected,
    required this.onTap,
    required this.mascot,
    this.locked = false,
  });

  final String label;
  final HomeTheme theme;
  final Mascot mascot;
  final bool selected;
  final VoidCallback onTap;
  final bool locked;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final asset = homeThemeAsset(theme);
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            width: 62,
            height: 62,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: selected ? scheme.primary : scheme.outlineVariant,
                width: selected ? 3 : 1,
              ),
              image: asset == null
                  ? null
                  : DecorationImage(
                      image: ResizeImage(AssetImage(asset), width: 186),
                      fit: BoxFit.cover,
                      // Dimmed rather than blurred out: the point is to show
                      // what it looks like, not to tease it.
                      opacity: locked ? 0.45 : 1,
                    ),
              gradient: asset == null ? const AppPaletteGradient() : null,
            ),
            child: locked
                ? Icon(Icons.lock_outline, size: 20, color: scheme.primary)
                : mascot != Mascot.none
                ? Align(
                    alignment: AlignmentDirectional.bottomStart,
                    child: Padding(
                      padding: const EdgeInsets.all(4),
                      child: MascotAvatar(mascot: mascot, size: 24),
                    ),
                  )
                : null,
          ),
          const SizedBox(height: 4),
          Text(label, style: Theme.of(context).textTheme.labelSmall),
        ],
      ),
    );
  }
}

/// One companion in the picker: the character itself, its name, and a lock
/// when it is a Premium one.
class _MascotOption extends StatelessWidget {
  const _MascotOption({
    required this.mascot,
    required this.label,
    required this.selected,
    required this.locked,
    required this.onTap,
  });

  final Mascot mascot;
  final String label;
  final bool selected;
  final bool locked;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;

    return Padding(
      padding: const EdgeInsetsDirectional.only(end: 10),
      child: Material(
        color: selected
            ? scheme.primary.withValues(alpha: 0.12)
            : scheme.surfaceContainerLow,
        borderRadius: BorderRadius.circular(20),
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: onTap,
          child: Container(
            width: 86,
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: selected
                    ? scheme.primary
                    : scheme.outlineVariant.withValues(alpha: 0.5),
                width: selected ? 1.6 : 1,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 52,
                  child: Center(
                    child: mascot == Mascot.none
                        ? Icon(
                            Icons.do_not_disturb_alt,
                            size: 30,
                            color: scheme.onSurfaceVariant,
                          )
                        : Stack(
                            alignment: Alignment.center,
                            children: [
                              MascotAvatar(mascot: mascot, size: 46),
                              if (locked)
                                Positioned(
                                  right: 0,
                                  bottom: 0,
                                  child: Icon(
                                    Icons.lock,
                                    size: 15,
                                    color: scheme.primary,
                                  ),
                                ),
                            ],
                          ),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  label,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: theme.textTheme.labelSmall?.copyWith(
                    color: selected ? scheme.primary : scheme.onSurface,
                    fontWeight: selected ? FontWeight.w700 : null,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// A settings control in a card with its own label and colour — the same
/// shape the prediction-settings screen uses, so a unit picker in Settings
/// looks like a unit picker anywhere else in the app.
class _SettingCard extends StatelessWidget {
  const _SettingCard({
    required this.icon,
    required this.tint,
    required this.ink,
    required this.label,
    required this.child,
  });

  final IconData icon;
  final Color tint;
  final Color ink;
  final String label;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final panel = isDark
        ? Color.alphaBlend(
            tint.withValues(alpha: 0.09),
            theme.colorScheme.surface,
          )
        : tint.withValues(alpha: 0.45);
    final badge = isDark ? tint.withValues(alpha: 0.16) : tint;
    final labelInk = isDark ? tint : ink;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(16, 14, 16, 16),
      decoration: BoxDecoration(
        color: panel,
        borderRadius: BorderRadius.circular(22),
        border: isDark ? Border.all(color: tint.withValues(alpha: 0.18)) : null,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(shape: BoxShape.circle, color: badge),
                child: Icon(icon, size: 17, color: labelInk),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  label,
                  style: theme.textTheme.titleSmall?.copyWith(color: labelInk),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          child,
        ],
      ),
    );
  }
}
