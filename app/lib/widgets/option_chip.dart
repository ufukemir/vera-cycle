import 'package:flutter/material.dart';

import '../l10n/app_localizations.dart';

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
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 28,
                    height: 28,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: badge,
                    ),
                    child: Icon(icon, size: 16, color: glyph),
                  ),
                  const SizedBox(width: 8),
                  // Flexible, not a bare Text: every existing label happened
                  // to be short enough that this never mattered, until a
                  // longer one ("Kendini iyi hissetmeme") overflowed the Row
                  // by tens of pixels instead of wrapping to a second line.
                  Flexible(
                    child: Text(
                      label,
                      style:
                          theme.chipTheme.labelStyle?.copyWith(
                            color: labelColor,
                          ) ??
                          theme.textTheme.labelLarge?.copyWith(
                            color: labelColor,
                          ),
                    ),
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

/// An [OptionChipWrap] that starts collapsed to [collapsedCount] chips with
/// a "show N more" toggle, for lists too long to be scannable in one
/// screenful without scrolling past them — the symptom groups and the mood
/// list both grew well past a dozen entries once expanded to competitor
/// scale, and a screen that keeps going past the fold reads as an endless
/// list rather than a set of choices someone can scan at a glance.
class ExpandableOptionChipWrap extends StatefulWidget {
  const ExpandableOptionChipWrap({
    super.key,
    required this.children,
    this.collapsedCount = 6,
  });

  final List<Widget> children;
  final int collapsedCount;

  @override
  State<ExpandableOptionChipWrap> createState() =>
      _ExpandableOptionChipWrapState();
}

class _ExpandableOptionChipWrapState extends State<ExpandableOptionChipWrap> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final overflow = widget.children.length > widget.collapsedCount;
    final visible = !overflow || _expanded
        ? widget.children
        : widget.children.sublist(0, widget.collapsedCount);
    final hiddenCount = widget.children.length - widget.collapsedCount;

    return OptionChipWrap(
      children: [
        ...visible,
        if (overflow)
          _ToggleChip(
            expanded: _expanded,
            label: _expanded
                ? l10n.optionsShowLess
                : l10n.optionsShowMore(hiddenCount),
            onTap: () => setState(() => _expanded = !_expanded),
          ),
      ],
    );
  }
}

class _ToggleChip extends StatelessWidget {
  const _ToggleChip({
    required this.expanded,
    required this.label,
    required this.onTap,
  });

  final bool expanded;
  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;
    return Material(
      color: Colors.transparent,
      shape: StadiumBorder(
        side: BorderSide(color: scheme.onSurface.withValues(alpha: 0.2)),
      ),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                label,
                style: theme.textTheme.labelLarge?.copyWith(
                  color: scheme.onSurfaceVariant,
                ),
              ),
              const SizedBox(width: 2),
              Icon(
                expanded ? Icons.expand_less : Icons.expand_more,
                size: 18,
                color: scheme.onSurfaceVariant,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
