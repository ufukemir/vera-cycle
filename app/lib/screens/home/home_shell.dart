import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../l10n/app_localizations.dart';
import '../../state/app_preferences.dart';
import '../../state/assistant_conversation.dart';
import '../../state/cycle_controller.dart';
import '../../util/day.dart';
import 'widgets/quick_log_sheet.dart';
import '../calendar/calendar_screen.dart';
import '../day_log/day_log_screen.dart';
import '../insights/insights_screen.dart';
import '../settings/settings_screen.dart';
import 'home_screen.dart';
import 'widgets/vera_bottom_bar.dart';

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
  bool _dailyPromptChecked = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _maybePromptDaily());
  }

  /// Opens the quick-log sheet once a day, on arriving at Home.
  ///
  /// Three conditions, and all three matter. Once per day, recorded when the
  /// sheet *opens* rather than when something is saved, so dismissing it
  /// counts — otherwise returning to Home reopens it and a prompt becomes
  /// nagging. Not at all if today already has something logged, because
  /// asking how today feels right after being told is the app not listening.
  /// And never on the day onboarding finished: the user has just answered a
  /// screenful of questions.
  Future<void> _maybePromptDaily() async {
    if (_dailyPromptChecked || !mounted) return;
    _dailyPromptChecked = true;

    final prefs = context.read<AppPreferences>();
    final controller = context.read<CycleController>();
    if (controller.loading) return;

    final key = dayKey(today());
    if (prefs.lastDailyPromptDay == key) return;

    final logged = controller.logFor(today());
    if (logged != null && !logged.isEmpty) return;

    await prefs.setLastDailyPromptDay(key);
    if (!mounted) return;
    await showQuickLogSheet(context);
  }

  @override
  void dispose() {
    _conversation.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    // Four destinations; logging is the raised centre action, not a tab.
    // The assistant moved to the home screen's quick actions — see
    // VeraBottomBar for why the middle slot is worth a destination.
    const tabs = [
      HomeScreen(),
      CalendarScreen(),
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
      bottomNavigationBar: VeraBottomBar(
        selectedIndex: _index,
        onSelected: (i) => setState(() {
          _previousIndex = _index;
          _index = i;
        }),
        onTrack: () => Navigator.of(context).push(
          MaterialPageRoute(builder: (_) => DayLogScreen(date: today())),
        ),
      ),
    );
  }
}
