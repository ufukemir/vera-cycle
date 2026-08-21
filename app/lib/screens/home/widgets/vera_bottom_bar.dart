import 'package:flutter/material.dart';

import '../../../l10n/app_localizations.dart';

/// The five-slot bottom bar, with logging raised into the middle.
///
/// The old bar was five equal destinations, which meant the thing people
/// open the app to do — write down how today went — was a tab like any
/// other, and on most days it took two taps to reach. Making it a raised
/// centre button costs one destination and buys the app's primary action a
/// permanent, unmissable target.
///
/// It is an action, not a tab: it opens today's log over whatever screen
/// you are on and returns you there. So [selectedIndex] indexes the four
/// destinations only, and the middle slot never appears "selected".
class VeraBottomBar extends StatelessWidget {
  const VeraBottomBar({
    super.key,
    required this.selectedIndex,
    required this.onSelected,
    required this.onTrack,
  });

  /// 0–3, over [_destinations] — the centre action is not one of them.
  final int selectedIndex;
  final ValueChanged<int> onSelected;
  final VoidCallback onTrack;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;
    final isDark = theme.brightness == Brightness.dark;

    final destinations = <({IconData icon, IconData active, String label})>[
      (icon: Icons.home_outlined, active: Icons.home, label: l10n.navHome),
      (
        icon: Icons.calendar_month_outlined,
        active: Icons.calendar_month,
        label: l10n.navCalendar,
      ),
      (
        icon: Icons.notifications_active_outlined,
        active: Icons.notifications_active,
        label: l10n.navReminders,
      ),
      (
        icon: Icons.person_outline,
        active: Icons.person,
        label: l10n.navProfile,
      ),
    ];

    return SafeArea(
      top: false,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(12, 0, 12, 10),
        child: Container(
          decoration: BoxDecoration(
            color: isDark ? scheme.surfaceContainerHigh : Colors.white,
            borderRadius: BorderRadius.circular(28),
            border: Border.all(
              color: scheme.outlineVariant.withValues(alpha: 0.4),
            ),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
          child: Row(
            children: [
              for (var i = 0; i < 2; i++)
                _BarDestination(
                  icon: destinations[i].icon,
                  activeIcon: destinations[i].active,
                  label: destinations[i].label,
                  selected: selectedIndex == i,
                  onTap: () => onSelected(i),
                ),
              _TrackButton(label: l10n.navTrack, onTap: onTrack),
              for (var i = 2; i < 4; i++)
                _BarDestination(
                  icon: destinations[i].icon,
                  activeIcon: destinations[i].active,
                  label: destinations[i].label,
                  selected: selectedIndex == i,
                  onTap: () => onSelected(i),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class _BarDestination extends StatelessWidget {
  const _BarDestination({
    required this.icon,
    required this.activeIcon,
    required this.label,
    required this.selected,
    required this.onTap,
  });

  final IconData icon;
  final IconData activeIcon;
  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;
    final color = selected
        ? scheme.primary
        : scheme.onSurface.withValues(alpha: 0.55);

    return Expanded(
      child: Semantics(
        button: true,
        selected: selected,
        label: label,
        child: ExcludeSemantics(
          child: InkWell(
            onTap: onTap,
            borderRadius: BorderRadius.circular(20),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 2),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Same box as the centre button's circle, so all five
                  // labels sit on one line instead of the middle one
                  // hanging below its taller neighbour.
                  SizedBox(
                    height: 40,
                    child: Icon(
                      selected ? activeIcon : icon,
                      size: 22,
                      color: color,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    label,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: theme.textTheme.labelSmall?.copyWith(color: color),
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

class _TrackButton extends StatelessWidget {
  const _TrackButton({required this.label, required this.onTap});

  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;

    return Expanded(
      child: Semantics(
        button: true,
        label: label,
        child: ExcludeSemantics(
          child: InkWell(
            onTap: onTap,
            borderRadius: BorderRadius.circular(20),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 2),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: scheme.primary,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(Icons.add, size: 24, color: scheme.onPrimary),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    label,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: theme.textTheme.labelSmall?.copyWith(
                      color: scheme.primary,
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
