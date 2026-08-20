import 'package:flutter/material.dart';

/// A loggable option: a round icon badge, a label, and a selected state.
///
/// Replaces the plain text chips the day log used everywhere. The icon is
/// the point — a twelve-item symptom list is scanned, not read, and a bare
/// list of words gives the eye nothing to aim at on a screen someone taps
/// several times a day.
///
/// [tint] comes from the section this chip sits in, so a card's colour runs
/// through its options instead of every chip being the same grey. Selected
/// fills with the accent rather than tinting it: on a pastel card, a pastel
/// selection is invisible, which is the bug this app already had once.
class OptionChip extends StatelessWidget {
  const OptionChip({
    super.key,
    required this.icon,
    required this.label,
    required this.selected,
    required this.onTap,
    required this.tint,
    this.ink,
  });

  final IconData icon;
  final String label;
  final bool selected;
  final VoidCallback onTap;

  /// The section's pastel. Used for the icon badge when unselected.
  final Color tint;

  /// Ink for the badge glyph. Defaults to the theme's onSurface.
  final Color? ink;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;
    final isDark = theme.brightness == Brightness.dark;

    final badge = selected
        ? scheme.onPrimary.withValues(alpha: isDark ? 0.22 : 0.9)
        : (isDark ? tint.withValues(alpha: 0.22) : tint);
    final glyph = selected
        ? (isDark ? scheme.onPrimary : scheme.primary)
        : (isDark ? tint : (ink ?? scheme.onSurface));
    final labelColor = selected ? scheme.onPrimary : scheme.onSurface;

    return Semantics(
      button: true,
      selected: selected,
      label: label,
      child: ExcludeSemantics(
        child: Material(
          color: selected
              ? scheme.primary
              : scheme.surface.withValues(alpha: 0.78),
          shape: StadiumBorder(
            side: BorderSide(
              color: selected
                  ? scheme.primary
                  : scheme.onSurface.withValues(alpha: 0.12),
              width: selected ? 1.4 : 1,
            ),
          ),
          clipBehavior: Clip.antiAlias,
          child: InkWell(
            onTap: onTap,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(6, 6, 14, 6),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 28,
                    height: 28,
                    decoration:
                        BoxDecoration(shape: BoxShape.circle, color: badge),
                    child: Icon(icon, size: 16, color: glyph),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    label,
                    style: theme.chipTheme.labelStyle
                            ?.copyWith(color: labelColor) ??
                        theme.textTheme.labelLarge?.copyWith(color: labelColor),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// The [Wrap] every option group uses, so spacing is decided once.
class OptionChipWrap extends StatelessWidget {
  const OptionChipWrap({super.key, required this.children});

  final List<Widget> children;

  @override
  Widget build(BuildContext context) =>
      Wrap(spacing: 8, runSpacing: 8, children: children);
}
