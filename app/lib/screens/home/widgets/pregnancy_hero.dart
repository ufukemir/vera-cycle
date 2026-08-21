import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../l10n/app_localizations.dart';
import '../../../services/pregnancy_info.dart';

/// The pregnancy-mode scene, so Home is a place in that mode too.
///
/// Pregnancy mode had no hero at all: the content sheet was translated up
/// into empty space, which slid the week heading under the status bar and
/// left the mode looking like an unfinished version of the app rather than
/// a different one. Turning the mode on is a significant moment in someone's
/// life, and the screen it produced was a clipped title over a plain card.
///
/// It carries the same furniture as the cycle hero — photograph, eyebrow,
/// large line, supporting line, theme toggle — so the two modes read as the
/// same app rather than two apps sharing a binary. The progress bar rides at
/// the bottom because, unlike a cycle, a pregnancy really does run start to
/// finish, and that is the one place a filling bar is honest.
class PregnancyHero extends StatelessWidget {
  const PregnancyHero({
    super.key,
    required this.info,
    required this.isDark,
    required this.onToggleTheme,
  });

  final PregnancyInfo info;
  final bool isDark;
  final VoidCallback onToggleTheme;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    final dateFmt = DateFormat.yMMMMd(
      Localizations.localeOf(context).toString(),
    );
    final daysLeft = info.daysUntilDue();
    final height = (MediaQuery.sizeOf(context).height * 0.52).clamp(
      330.0,
      480.0,
    );
    final topInset = MediaQuery.paddingOf(context).top;

    return SizedBox(
      height: height,
      width: double.infinity,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset('assets/photos/pregnancy_shore.jpg', fit: BoxFit.cover),
          const DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0, 0.45, 1],
                colors: [
                  Color(0x40000000),
                  Color(0x1A000000),
                  Color(0xB3000000),
                ],
              ),
            ),
          ),
          PositionedDirectional(
            top: topInset + 8,
            end: 12,
            child: Material(
              color: Colors.black.withValues(alpha: 0.28),
              shape: const CircleBorder(),
              clipBehavior: Clip.antiAlias,
              child: IconButton(
                onPressed: onToggleTheme,
                tooltip: isDark
                    ? l10n.settingsThemeLight
                    : l10n.settingsThemeDark,
                icon: Icon(
                  isDark ? Icons.light_mode_outlined : Icons.dark_mode_outlined,
                  color: Colors.white,
                  size: 20,
                ),
              ),
            ),
          ),
          Positioned.fill(
            child: Padding(
              padding: EdgeInsets.fromLTRB(24, topInset + 16, 24, 52),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    l10n.pregnancyTrimesterLabel(info.trimester),
                    textAlign: TextAlign.center,
                    style: theme.textTheme.titleMedium?.copyWith(
                      color: Colors.white.withValues(alpha: 0.92),
                      letterSpacing: 0.4,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    l10n.pregnancyWeekLabel(info.weeks, info.daysIntoWeek),
                    textAlign: TextAlign.center,
                    style: theme.textTheme.displaySmall?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      height: 1.05,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '${l10n.pregnancyDueDateLabel}: '
                    '${dateFmt.format(info.dueDate)}',
                    textAlign: TextAlign.center,
                    style: theme.textTheme.bodyLarge?.copyWith(
                      color: Colors.white.withValues(alpha: 0.92),
                    ),
                  ),
                  if (daysLeft > 0) ...[
                    const SizedBox(height: 2),
                    Text(
                      l10n.pregnancyDaysLeft(daysLeft),
                      textAlign: TextAlign.center,
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: Colors.white.withValues(alpha: 0.8),
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),
          PositionedDirectional(
            start: 24,
            end: 24,
            bottom: 44,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(99),
              child: LinearProgressIndicator(
                value: info.progress,
                minHeight: 8,
                backgroundColor: Colors.white.withValues(alpha: 0.28),
                valueColor: const AlwaysStoppedAnimation<Color>(Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
