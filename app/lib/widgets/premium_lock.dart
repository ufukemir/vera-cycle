import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../l10n/app_localizations.dart';
import '../screens/premium/premium_screen.dart';
import '../state/app_preferences.dart';

/// Wraps a Premium-only section: shows it outright when Premium is active,
/// and otherwise a plain card naming the feature with one link to the
/// Premium screen.
///
/// Deliberately dull. No countdown, no "limited offer", no blurred preview
/// teasing the user back — the locked state says what the feature is and
/// leaves. Core tracking is never behind this.
///
/// [lockedPreview] is the one thing the locked card DOES show: the user's
/// own already-recorded data, rendered read-only. Premium gates the ability
/// to add and edit, never the ability to see what you already wrote.
/// Without it, a lapsed subscription made the custom tags a user had logged
/// vanish from the day log with no route to them anywhere in the app — the
/// data was still on disk, but "your history is never locked away" was no
/// longer true (CLAUDE.md principle 6).
class PremiumLock extends StatelessWidget {
  const PremiumLock({
    super.key,
    required this.title,
    required this.child,
    this.description,
    this.lockedPreview,
  });

  /// Names the feature on the locked card. The unlocked branch renders
  /// [child] alone — call sites whose child already carries a header would
  /// otherwise show the same string twice.
  final String title;
  final Widget child;
  final String? description;

  /// Read-only rendering of whatever the user already recorded here.
  final Widget? lockedPreview;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);

    if (context.watch<AppPreferences>().premiumActive) return child;

    final preview = lockedPreview;
    return Card(
      elevation: 0,
      color: theme.colorScheme.surfaceContainerHigh,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  Icons.lock_outline,
                  size: 18,
                  color: theme.colorScheme.primary,
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(title, style: theme.textTheme.titleMedium),
                ),
              ],
            ),
            const SizedBox(height: 4),
            Text(
              description ?? l10n.premiumLockedTitle,
              style: theme.textTheme.bodySmall,
            ),
            if (preview != null) ...[const SizedBox(height: 12), preview],
            Align(
              alignment: AlignmentDirectional.centerEnd,
              child: TextButton(
                onPressed: () => Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => const PremiumScreen()),
                ),
                child: Text(l10n.premiumLockedAction),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
