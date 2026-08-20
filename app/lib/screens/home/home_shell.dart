import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../l10n/app_localizations.dart';
import '../../state/assistant_conversation.dart';
import '../assistant/assistant_screen.dart';
import '../calendar/calendar_screen.dart';
import '../insights/insights_screen.dart';
import '../settings/settings_screen.dart';
import 'home_screen.dart';

/// The 5-tab shell shown once onboarding is done and the app is unlocked.
///
/// Tab switches animate with a quick fade+slide (AnimatedSwitcher keyed on
/// the index). This trades per-tab widget state for motion — screens derive
/// everything important from the shared controllers, so the only real loss
/// is trivia like the calendar's focused month resetting to today.
///
/// The one thing that was not trivia is the assistant chat, which the same
/// mechanism silently deleted whenever the user looked at another tab. It
/// now lives in [AssistantConversation], created here so that it outlives a
/// tab switch and dies with the shell — which is what the app lock tears
/// down.
class HomeShell extends StatefulWidget {
  const HomeShell({super.key});

  @override
  State<HomeShell> createState() => _HomeShellState();
}

class _HomeShellState extends State<HomeShell> {
  int _index = 0;
  int _previousIndex = 0;
  final _conversation = AssistantConversation();

  @override
  void dispose() {
    _conversation.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    const tabs = [
      HomeScreen(),
      CalendarScreen(),
      AssistantScreen(),
      InsightsScreen(),
      SettingsScreen(),
    ];
    final movingRight = _index >= _previousIndex;

    return ChangeNotifierProvider<AssistantConversation>.value(
      value: _conversation,
      child: _buildShell(context, l10n, tabs, movingRight),
    );
  }

  Widget _buildShell(BuildContext context, AppLocalizations l10n,
      List<Widget> tabs, bool movingRight) {
    return Scaffold(
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 280),
        switchInCurve: Curves.easeOutCubic,
        switchOutCurve: Curves.easeInCubic,
        transitionBuilder: (child, animation) {
          final isIncoming = child.key == ValueKey(_index);
          final beginX = isIncoming ? (movingRight ? 0.06 : -0.06) : 0.0;
          return FadeTransition(
            opacity: animation,
            child: SlideTransition(
              position: Tween<Offset>(
                begin: Offset(beginX, 0),
                end: Offset.zero,
              ).animate(animation),
              child: child,
            ),
          );
        },
        child: KeyedSubtree(key: ValueKey(_index), child: tabs[_index]),
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _index,
        onDestinationSelected: (i) => setState(() {
          _previousIndex = _index;
          _index = i;
        }),
        destinations: [
          NavigationDestination(
            icon: const Icon(Icons.home_outlined),
            selectedIcon: const Icon(Icons.home),
            label: l10n.navHome,
          ),
          NavigationDestination(
            icon: const Icon(Icons.calendar_month_outlined),
            selectedIcon: const Icon(Icons.calendar_month),
            label: l10n.navCalendar,
          ),
          NavigationDestination(
            icon: const Icon(Icons.chat_bubble_outline_rounded),
            selectedIcon: const Icon(Icons.chat_bubble_rounded),
            label: l10n.navAssistant,
          ),
          NavigationDestination(
            icon: const Icon(Icons.insights_outlined),
            selectedIcon: const Icon(Icons.insights),
            label: l10n.navInsights,
          ),
          NavigationDestination(
            icon: const Icon(Icons.settings_outlined),
            selectedIcon: const Icon(Icons.settings),
            label: l10n.navSettings,
          ),
        ],
      ),
    );
  }
}
