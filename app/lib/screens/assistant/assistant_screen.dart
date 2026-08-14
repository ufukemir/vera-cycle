import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../l10n/app_localizations.dart';
import '../../services/cycle_assistant.dart';
import '../../state/cycle_controller.dart';
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

  AssistantContext _buildContext(BuildContext context) {
    final controller = context.read<CycleController>();
    final status = controller.todayStatus;
    final prediction = controller.prediction;

    String? rangeLabel;
    if (prediction.hasPrediction) {
      final fmt = DateFormat.MMMd(Localizations.localeOf(context).toString());
      rangeLabel =
          '${fmt.format(prediction.earliestStart!)} – ${fmt.format(prediction.latestStart!)}';
    }

    return AssistantContext(
      cycleDay: status.cycleDay,
      phase: status.phase,
      meanCycleLength: prediction.meanLength,
      cyclesLogged: controller.cycles.where((c) => c.isComplete).length,
      predictionRangeLabel: rangeLabel,
    );
  }

  void _send(String text) {
    final trimmed = text.trim();
    if (trimmed.isEmpty) return;
    final lang = Localizations.localeOf(context).languageCode;
    final reply = _assistant.answer(trimmed, _buildContext(context), lang);
    setState(() {
      _messages.add(_Message(trimmed, fromUser: true));
      _messages.add(_Message(reply, fromUser: false));
    });
    _input.clear();
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
                  : ListView.builder(
                      controller: _scroll,
                      padding: const EdgeInsets.all(16),
                      itemCount: _messages.length,
                      itemBuilder: (context, i) => _Bubble(message: _messages[i]),
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
        const HeroIllustration(scene: IllustrationScene.chatSparkles, height: 180),
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

class _Bubble extends StatelessWidget {
  const _Bubble({required this.message});

  final _Message message;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final fromUser = message.fromUser;
    return Align(
      alignment: fromUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        constraints: BoxConstraints(
            maxWidth: MediaQuery.sizeOf(context).width * 0.78),
        decoration: BoxDecoration(
          color: fromUser ? scheme.primary : scheme.surfaceContainerHigh,
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(20),
            topRight: const Radius.circular(20),
            bottomLeft: Radius.circular(fromUser ? 20 : 6),
            bottomRight: Radius.circular(fromUser ? 6 : 20),
          ),
        ),
        child: Text(
          message.text,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: fromUser ? scheme.onPrimary : scheme.onSurface,
              ),
        ),
      ),
    );
  }
}
