import 'package:flutter/foundation.dart';

class AssistantMessage {
  const AssistantMessage(this.text, {required this.fromUser});

  final String text;
  final bool fromUser;
}

/// The assistant chat, held just above the tab that draws it.
///
/// It used to live inside `_AssistantScreenState`, which the shell disposes
/// on every tab switch: glancing at the calendar mid-conversation wiped it.
/// Owning it here means switching tabs and coming back finds the thread
/// where it was left, and ending the chat becomes something the user does
/// deliberately with the back button rather than something that happens to
/// them.
///
/// Still never written to disk, and deliberately not provided at the top of
/// the app: [HomeShell] creates it, so the shell being torn down — which is
/// exactly what the app lock does — takes the conversation with it. A chat
/// about a sensitive topic must not be waiting on screen for whoever
/// unlocks the phone next.
class AssistantConversation extends ChangeNotifier {
  final List<AssistantMessage> _messages = [];
  List<String> _followUps = const [];
  bool _typing = false;

  List<AssistantMessage> get messages => List.unmodifiable(_messages);
  List<String> get followUps => _followUps;
  bool get typing => _typing;
  bool get isEmpty => _messages.isEmpty;

  void addUserMessage(String text) {
    _messages.add(AssistantMessage(text, fromUser: true));
    _typing = true;
    _followUps = const [];
    notifyListeners();
  }

  void addReply(String text, List<String> followUps) {
    _messages.add(AssistantMessage(text, fromUser: false));
    _typing = false;
    _followUps = followUps;
    notifyListeners();
  }

  void clear() {
    if (_messages.isEmpty && !_typing) return;
    _messages.clear();
    _followUps = const [];
    _typing = false;
    notifyListeners();
  }
}
