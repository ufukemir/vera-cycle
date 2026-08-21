import 'package:flutter/material.dart';

/// A pastel category card with a tinted icon badge — the reference app's
/// colorful sectioned-log pattern, using [AppPalette]'s soft tones.
///
/// Shared rather than private to the day-log screen because the optional
/// trackers used to be the one section that skipped it: flow, symptoms,
/// mood, energy, skin and medications each arrived in a coloured card while
/// cervical mucus, ovulation tests and the rest were a bare column of grey
/// labels under the last card. Same screen, two visual languages, and the
/// half that looked unfinished was the half the user had gone to Settings to
/// switch on.
class DayLogSectionCard extends StatelessWidget {
  const DayLogSectionCard({
    super.key,
    required this.icon,
    required this.title,
    required this.background,
    required this.foreground,
    this.child,
    this.trailing,
  });

  final IconData icon;
  final String title;
  final Color background;
  final Color foreground;

  /// The card's contents. Omitted by a card whose whole control is a
  /// [trailing] switch, which would otherwise sit under an empty gap.
  final Widget? child;

  /// A control on the title row itself.
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    // [background] and [foreground] are the *light* pair: a pale pastel with
    // dark ink on it. Used as-is in dark mode they turned every card into
    // the same muddy grey — a pale colour at 55% over a near-black surface
    // loses its hue — and printed near-black titles on it. So dark mode
    // inverts the roles: the pastel becomes the ink (it is already a light
    // colour, which is exactly what dark mode needs) and the panel is a
    // whisper of that hue over the surface, enough to keep the six sections
    // distinguishable without pretending to be a pastel card.
    final panel = isDark
        ? Color.alphaBlend(
            background.withValues(alpha: 0.10),
            theme.colorScheme.surface,
          )
        : background.withValues(alpha: 0.55);
    final badge = isDark ? background.withValues(alpha: 0.16) : background;
    final ink = isDark ? background : foreground;

    final header = Row(
      children: [
        Container(
          width: 34,
          height: 34,
          decoration: BoxDecoration(shape: BoxShape.circle, color: badge),
          child: Icon(icon, size: 18, color: ink),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Text(
            title,
            style: theme.textTheme.titleMedium?.copyWith(color: ink),
          ),
        ),
        ?trailing,
      ],
    );

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: panel,
        borderRadius: BorderRadius.circular(24),
        border: isDark
            ? Border.all(color: background.withValues(alpha: 0.18))
            : null,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Merged so a bare trailing switch is announced with the title
          // that names it, instead of as an unlabelled "switch, off".
          if (trailing != null) MergeSemantics(child: header) else header,
          if (child != null) ...[const SizedBox(height: 12), child!],
        ],
      ),
    );
  }
}

/// The label above one group of chips *inside* a section card.
///
/// The cervix card carries three of these, and the breast-exam card one, so
/// they need to read as a rung below the card's own title without becoming
/// the faint grey body text they were before.
class DayLogFieldLabel extends StatelessWidget {
  const DayLogFieldLabel(this.text, {super.key, required this.color});

  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(
        text,
        style: Theme.of(context).textTheme.labelLarge?.copyWith(
          color: color.withValues(alpha: 0.85),
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
