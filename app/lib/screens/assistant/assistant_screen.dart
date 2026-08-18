import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../l10n/app_localizations.dart';
import '../../services/cycle_assistant.dart';
import '../../state/app_preferences.dart';
import '../../state/cycle_controller.dart';
import '../../util/day.dart';
import '../../util/number_format.dart';
import '../../widgets/illustrations.dart';

class _Message {
  const _Message(this.text, {required this.fromUser});

  final String text;
  final bool fromUser;
}

/// On-device chat with [CycleAssistant]. Conversation state is ephemeral by
/// design — messages live only in this widget's memory and vanish when the
/// tab is disposed, so a chat about a sensitive topic never becomes another
/// stored artifact to protect.
class AssistantScreen extends StatefulWidget {
  const AssistantScreen({super.key});

  @override
  State<AssistantScreen> createState() => _AssistantScreenState();
}

class _AssistantScreenState extends State<AssistantScreen> {
  static const _assistant = CycleAssistant();

  final _messages = <_Message>[];
  final _input = TextEditingController();
  final _scroll = ScrollController();
  bool _typing = false;
  List<String> _followUps = const [];

  AssistantContext _buildContext(BuildContext context) {
    final controller = context.read<CycleController>();
    final status = controller.todayStatus;
    final prediction = controller.prediction;

    String? rangeLabel;
    String? ovulationLabel;
    if (prediction.hasPrediction) {
      final fmt = DateFormat.MMMd(Localizations.localeOf(context).toString());
      rangeLabel =
          '${fmt.format(prediction.earliestStart!)} – ${fmt.format(prediction.latestStart!)}';

      // Ovulation is counted back from the next period, using the same
      // luteal length the prediction engine itself uses (PredictionEngine
      // in main.dart) so the assistant can never contradict the rest of
      // the app. Shifting the whole window keeps the honest uncertainty:
      // a range in, a range out.
      final luteal = context.read<AppPreferences>().lutealPhaseDays;
      ovulationLabel =
          '${fmt.format(addDays(prediction.earliestStart!, -luteal))} – '
          '${fmt.format(addDays(prediction.latestStart!, -luteal))}';
    }

    return AssistantContext(
      cycleDay: status.cycleDay,
      phase: status.phase,
      meanCycleLengthLabel: prediction.meanLength == null
          ? null
          : formatDecimal(context, prediction.meanLength!),
      cyclesLogged: controller.cycles.where((c) => c.isComplete).length,
      predictionRangeLabel: rangeLabel,
      ovulationRangeLabel: ovulationLabel,
    );
  }

  Future<void> _send(String text) async {
    final trimmed = text.trim();
    if (trimmed.isEmpty || _typing) return;
    final lang = Localizations.localeOf(context).languageCode;
    final reply = _assistant.answer(trimmed, _buildContext(context), lang);
    setState(() {
      _messages.add(_Message(trimmed, fromUser: true));
      _typing = true;
      _followUps = const [];
    });
    _input.clear();
    _scrollDown();
    // A brief "typing" beat so replies read as conversation, not a lookup
    // table — bounded and short, never long enough to hide information.
    await Future<void>.delayed(const Duration(milliseconds: 650));
    if (!mounted) return;
    setState(() {
      _typing = false;
      _messages.add(_Message(reply, fromUser: false));
      _followUps = _assistant.followUps(lang, trimmed);
    });
    _scrollDown();
  }

  void _scrollDown() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scroll.hasClients) {
        _scroll.animateTo(
          _scroll.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  @override
  void dispose() {
    _input.dispose();
    _scroll.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final lang = Localizations.localeOf(context).languageCode;
    final scheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(title: Text(l10n.assistantTitle)),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: _messages.isEmpty
                  ? _EmptyState(
                      intro: l10n.assistantIntro,
                      suggestions: _assistant.suggestions(lang),
                      onSuggestionTap: _send,
                    )
                  : ListView(
                      controller: _scroll,
                      padding: const EdgeInsets.all(16),
                      children: [
                        for (final m in _messages) _Bubble(message: m),
                        if (_typing) _TypingBubble(label: l10n.assistantTyping),
                        if (!_typing && _followUps.isNotEmpty)
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Wrap(
                              spacing: 8,
                              runSpacing: 8,
                              children: [
                                for (final q in _followUps)
                                  ActionChip(
                                      label: Text(q),
                                      onPressed: () => _send(q)),
                              ],
                            ),
                          ),
                      ],
                    ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(16, 8, 8, 12),
              color: scheme.surface,
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _input,
                      textInputAction: TextInputAction.send,
                      onSubmitted: _send,
                      decoration: InputDecoration(
                        hintText: l10n.assistantInputHint,
                        filled: true,
                        fillColor: scheme.surfaceContainerHigh,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(24),
                          borderSide: BorderSide.none,
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 18, vertical: 12),
                      ),
                    ),
                  ),
                  const SizedBox(width: 4),
                  IconButton.filled(
                    icon: const Icon(Icons.arrow_upward_rounded),
                    onPressed: () => _send(_input.text),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _EmptyState extends StatelessWidget {
  const _EmptyState({
    required this.intro,
    required this.suggestions,
    required this.onSuggestionTap,
  });

  final String intro;
  final List<String> suggestions;
  final ValueChanged<String> onSuggestionTap;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        const PhotoHero(asset: 'assets/photos/selfcare_plants.jpg', height: 190),
        const SizedBox(height: 20),
        Text(intro, style: Theme.of(context).textTheme.bodyMedium),
        const SizedBox(height: 20),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [
            for (final s in suggestions)
              ActionChip(label: Text(s), onPressed: () => onSuggestionTap(s)),
          ],
        ),
      ],
    );
  }
}

class _TypingBubble extends StatefulWidget {
  const _TypingBubble({required this.label});

  final String label;

  @override
  State<_TypingBubble> createState() => _TypingBubbleState();
}

class _TypingBubbleState extends State<_TypingBubble>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 900),
  )..repeat();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    // Directional, not left: in Arabic the assistant speaks from the
    // start edge, which is the RIGHT. Hard-pinning to left put the
    // assistant on the wrong side of an RTL conversation.
    return Align(
      alignment: AlignmentDirectional.centerStart,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const RobotAvatar(),
          const SizedBox(width: 8),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 4),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: scheme.surfaceContainerHigh,
              borderRadius: BorderRadius.circular(20),
            ),
            child: AnimatedBuilder(
              animation: _controller,
              builder: (context, _) {
                final phase = (_controller.value * 3).floor() % 3;
                return Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    for (var i = 0; i < 3; i++)
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 2),
                        width: 7,
                        height: 7,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: scheme.onSurface
                              .withValues(alpha: i == phase ? 0.8 : 0.3),
                        ),
                      ),
                    const SizedBox(width: 8),
                    Text(widget.label,
                        style: Theme.of(context).textTheme.bodySmall),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _Bubble extends StatelessWidget {
  const _Bubble({required this.message});

  final _Message message;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final fromUser = message.fromUser;
    if (!fromUser) {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const RobotAvatar(),
          const SizedBox(width: 8),
          Flexible(child: _bubbleBody(context, scheme, fromUser)),
        ],
      );
    }
    // The user's own bubble hugs the END edge — right in LTR, left in
    // RTL. With Alignment.centerRight the whole chat read as an LTR
    // conversation dropped into an RTL screen.
    return Align(
      alignment: AlignmentDirectional.centerEnd,
      child: _bubbleBody(context, scheme, fromUser),
    );
  }

  Widget _bubbleBody(
      BuildContext context, ColorScheme scheme, bool fromUser) {
    return Container(
        margin: const EdgeInsets.symmetric(vertical: 4),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        constraints: BoxConstraints(
            maxWidth: MediaQuery.sizeOf(context).width * 0.78),
        decoration: BoxDecoration(
          color: fromUser ? scheme.primary : scheme.surfaceContainerHigh,
          // Directional so the 6px "tail" corner stays on the speaker's
          // own side after mirroring.
          borderRadius: BorderRadiusDirectional.only(
            topStart: const Radius.circular(20),
            topEnd: const Radius.circular(20),
            bottomStart: Radius.circular(fromUser ? 20 : 6),
            bottomEnd: Radius.circular(fromUser ? 6 : 20),
          ),
        ),
        child: Text(
          message.text,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: fromUser ? scheme.onPrimary : scheme.onSurface,
              ),
        ),
    );
  }
}
