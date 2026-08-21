import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';

import '../../l10n/app_localizations.dart';
import '../../state/app_lock_controller.dart';

/// What the feedback is about — tags the share subject for whoever reads
/// it, same idea as [DiagnosticsScreen]'s technical log. Purely a hint for
/// the person on the receiving end, not a support-ticket routing system.
enum _FeedbackCategory {
  predictions,
  backup,
  reminders,
  subscription,
  ads,
  design,
  translation,
  other,
}

/// A short, categorized note the user can send about something they're
/// unhappy with — a lighter, topic-tagged sibling to [DiagnosticsScreen]'s
/// crash report.
///
/// There's no server behind "Gönder": tapping it opens the OS share sheet
/// (same mechanism [DiagnosticsScreen] already uses), so the person picks
/// where it goes — their mail app or anywhere else. That's the honest
/// version of "sent by email": this app has no mail server of its own to
/// send through, and pretending otherwise would be a promise it can't keep.
class FeedbackScreen extends StatefulWidget {
  const FeedbackScreen({super.key});

  @override
  State<FeedbackScreen> createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends State<FeedbackScreen> {
  _FeedbackCategory? _category;
  final _description = TextEditingController();
  PlatformFile? _photo;

  @override
  void dispose() {
    _description.dispose();
    super.dispose();
  }

  String _categoryLabel(AppLocalizations l10n, _FeedbackCategory c) =>
      switch (c) {
        _FeedbackCategory.predictions => l10n.feedbackCategoryPredictions,
        _FeedbackCategory.backup => l10n.feedbackCategoryBackup,
        _FeedbackCategory.reminders => l10n.navReminders,
        _FeedbackCategory.subscription => l10n.feedbackCategorySubscription,
        _FeedbackCategory.ads => l10n.feedbackCategoryAds,
        _FeedbackCategory.design => l10n.feedbackCategoryDesign,
        _FeedbackCategory.translation => l10n.feedbackCategoryTranslation,
        _FeedbackCategory.other => l10n.feedbackCategoryOther,
      };

  // Not localized, same reasoning as DiagnosticsScreen._report: this tag is
  // read by whoever the user shares to, most often a developer inbox, and a
  // stable English tag is easier to triage than one that shifts per locale.
  String _categoryTag(_FeedbackCategory c) => switch (c) {
    _FeedbackCategory.predictions => 'predictions',
    _FeedbackCategory.backup => 'backup & restore',
    _FeedbackCategory.reminders => 'reminders',
    _FeedbackCategory.subscription => 'subscription',
    _FeedbackCategory.ads => 'ads',
    _FeedbackCategory.design => 'design',
    _FeedbackCategory.translation => 'translation',
    _FeedbackCategory.other => 'other',
  };

  Future<void> _pickPhoto() async {
    final lock = context.read<AppLockController>();
    final result = await lock.duringSystemSheet(
      () => FilePicker.pickFiles(type: FileType.image),
    );
    if (result == null || result.files.isEmpty || !mounted) return;
    setState(() => _photo = result.files.single);
  }

  Future<void> _send() async {
    final category = _category;
    final subject = category == null
        ? 'Vera feedback'
        : 'Vera feedback: ${_categoryTag(category)}';
    final body = _description.text.trim();
    final lock = context.read<AppLockController>();
    final photo = _photo;

    await lock.duringSystemSheet(
      () => SharePlus.instance.share(
        photo?.path == null
            ? ShareParams(text: body, subject: subject)
            : ShareParams(
                text: body,
                subject: subject,
                files: [XFile(photo!.path!)],
              ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(title: Text(l10n.feedbackEntry)),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            Text(l10n.feedbackTitle, style: theme.textTheme.headlineSmall),
            const SizedBox(height: 8),
            Text(
              l10n.feedbackSubtitle,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: 20),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                for (final c in _FeedbackCategory.values)
                  ChoiceChip(
                    label: Text(_categoryLabel(l10n, c)),
                    selected: _category == c,
                    onSelected: (selected) =>
                        setState(() => _category = selected ? c : null),
                  ),
              ],
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _description,
              minLines: 4,
              maxLines: 8,
              textCapitalization: TextCapitalization.sentences,
              decoration: InputDecoration(
                labelText: l10n.feedbackDescriptionLabel,
                hintText: l10n.feedbackDescriptionHint,
                alignLabelWithHint: true,
                filled: true,
                fillColor: theme.colorScheme.surfaceContainerHigh,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 16),
            if (_photo == null)
              OutlinedButton.icon(
                onPressed: _pickPhoto,
                icon: const Icon(Icons.add_a_photo_outlined),
                label: Text(l10n.feedbackAttachPhoto),
              )
            else
              Chip(
                avatar: const Icon(Icons.image_outlined, size: 18),
                label: Text(_photo!.name, overflow: TextOverflow.ellipsis),
                onDeleted: () => setState(() => _photo = null),
                deleteButtonTooltipMessage: l10n.actionRemove,
              ),
            const SizedBox(height: 28),
            FilledButton(onPressed: _send, child: Text(l10n.actionSend)),
          ],
        ),
      ),
    );
  }
}
