import 'package:flutter/material.dart';

import '../../../l10n/app_localizations.dart';
import '../../../services/pregnancy_info.dart';

/// Weekly, non-diagnostic notes about a typical pregnancy. Deliberately
/// descriptive ("many people notice…"), never personalized medical advice
/// — CLAUDE.md principle 7 applies here as much as anywhere.
///
/// These used to live here as Dart literals behind `lang == 'tr'`, with an
/// English fallback — and the function took an [AppLocalizations] it never
/// used. So every ar/es/fr/de/id user in pregnancy mode read English prose
/// on the Home screen, inside an otherwise fully translated app.
String _weeklyNote(AppLocalizations l10n, int weeks) {
  if (weeks < 5) return l10n.pregnancyNoteUnder5;
  if (weeks < 9) return l10n.pregnancyNoteUnder9;
  if (weeks < 13) return l10n.pregnancyNoteUnder13;
  if (weeks < 20) return l10n.pregnancyNoteUnder20;
  if (weeks < 28) return l10n.pregnancyNoteUnder28;
  if (weeks < 34) return l10n.pregnancyNoteUnder34;
  if (weeks < 38) return l10n.pregnancyNoteUnder38;
  return l10n.pregnancyNoteTerm;
}

/// Replaces the cycle prediction UI on Home while pregnancy mode is on.
class PregnancyCard extends StatelessWidget {
  const PregnancyCard({super.key, required this.info});

  final PregnancyInfo info;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            theme.colorScheme.secondaryContainer.withValues(alpha: 0.7),
            theme.colorScheme.primaryContainer.withValues(alpha: 0.7),
          ],
        ),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Week, trimester, due date and progress all moved into the hero,
          // where they are the first thing on the screen. Repeating them
          // here made the card a second, smaller copy of the same facts.
          Text(l10n.pregnancyWeeklyNoteTitle,
              style: theme.textTheme.labelLarge),
          const SizedBox(height: 4),
          Text(_weeklyNote(l10n, info.weeks),
              style: theme.textTheme.bodyMedium),
          const SizedBox(height: 12),
          Text(
            l10n.pregnancyDisclaimer,
            style: theme.textTheme.bodySmall?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }
}
