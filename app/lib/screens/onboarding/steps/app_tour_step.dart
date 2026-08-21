import 'package:flutter/material.dart';

import '../../../l10n/app_localizations.dart';

/// A short, skippable walkthrough of the five things the bottom bar does —
/// shown once, right after PIN setup and before the app itself opens.
///
/// Onboarding until this point only asked questions; nobody had shown the
/// person what to actually do with the app once it opens. Each page mirrors
/// [VeraBottomBar]'s own icon for the destination it explains, so the shape
/// someone just learned here is the exact shape they tap next.
class AppTourStep extends StatefulWidget {
  const AppTourStep({super.key, required this.onContinue});

  final VoidCallback onContinue;

  @override
  State<AppTourStep> createState() => _AppTourStepState();
}

class _AppTourStepState extends State<AppTourStep> {
  final _controller = PageController();
  int _page = 0;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  List<({IconData icon, String title, String body})> _pages(
    AppLocalizations l10n,
  ) => [
    (
      icon: Icons.home_outlined,
      title: l10n.tourHomeTitle,
      body: l10n.tourHomeBody,
    ),
    (
      icon: Icons.calendar_month_outlined,
      title: l10n.tourCalendarTitle,
      body: l10n.tourCalendarBody,
    ),
    (
      icon: Icons.add_circle_outline,
      title: l10n.tourTrackTitle,
      body: l10n.tourTrackBody,
    ),
    (
      icon: Icons.notifications_active_outlined,
      title: l10n.tourRemindersTitle,
      body: l10n.tourRemindersBody,
    ),
    (
      icon: Icons.person_outline,
      title: l10n.tourProfileTitle,
      body: l10n.tourProfileBody,
    ),
  ];

  void _next(int pageCount) {
    if (_page == pageCount - 1) {
      widget.onContinue();
      return;
    }
    _controller.nextPage(
      duration: const Duration(milliseconds: 320),
      curve: Curves.easeOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final scheme = Theme.of(context).colorScheme;
    final pages = _pages(l10n);
    final isLast = _page == pages.length - 1;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Align(
              alignment: AlignmentDirectional.centerEnd,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 8, 8, 0),
                child: TextButton(
                  onPressed: widget.onContinue,
                  child: Text(
                    l10n.tourSkip,
                    style: TextStyle(color: scheme.onSurfaceVariant),
                  ),
                ),
              ),
            ),
            Expanded(
              child: PageView(
                controller: _controller,
                onPageChanged: (i) => setState(() => _page = i),
                children: [
                  for (final page in pages)
                    _TourPage(
                      icon: page.icon,
                      title: page.title,
                      body: page.body,
                    ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (var i = 0; i < pages.length; i++)
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      margin: const EdgeInsets.symmetric(horizontal: 3),
                      width: i == _page ? 20 : 6,
                      height: 6,
                      decoration: BoxDecoration(
                        color: i == _page
                            ? scheme.primary
                            : scheme.onSurface.withValues(alpha: 0.2),
                        borderRadius: BorderRadius.circular(3),
                      ),
                    ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
              child: SizedBox(
                width: double.infinity,
                child: FilledButton(
                  onPressed: () => _next(pages.length),
                  child: Text(isLast ? l10n.tourStart : l10n.tourNext),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _TourPage extends StatelessWidget {
  const _TourPage({
    required this.icon,
    required this.title,
    required this.body,
  });

  final IconData icon;
  final String title;
  final String body;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 108,
            height: 108,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: scheme.primary.withValues(alpha: 0.16),
            ),
            child: Icon(icon, size: 52, color: scheme.primary),
          ),
          const SizedBox(height: 32),
          Text(
            title,
            style: theme.textTheme.headlineSmall,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 12),
          Text(
            body,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: scheme.onSurfaceVariant,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
