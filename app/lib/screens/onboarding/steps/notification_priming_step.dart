import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../l10n/app_localizations.dart';
import '../../../services/reminder_service.dart';
import '../../../state/app_preferences.dart';

/// Shows a realistic (but clearly in-app) mockup of what a reminder looks
/// like before asking the OS for real notification permission — so the
/// system prompt isn't the user's first encounter with what they're being
/// asked to allow. If granted, also flips [AppPreferences.remindersEnabled]
/// on, since asking twice ("allow notifications" then "turn on reminders in
/// settings") would just be friction for no reason.
class NotificationPrimingStep extends StatelessWidget {
  const NotificationPrimingStep({super.key, required this.onContinue});

  final VoidCallback onContinue;

  Future<void> _allow(BuildContext context) async {
    final granted = await context.read<ReminderService>().requestPermission();
    if (!context.mounted) return;
    if (granted) {
      await context.read<AppPreferences>().setRemindersEnabled(true);
    }
    if (!context.mounted) return;
    onContinue();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final scheme = Theme.of(context).colorScheme;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Spacer(),
              Text(
                l10n.onboardingNotificationTitle,
                style: Theme.of(context).textTheme.headlineSmall,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 12),
              Text(
                l10n.onboardingNotificationBody,
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),
              _NotificationMockup(
                title: l10n.onboardingNotificationMockTitle,
                body: l10n.onboardingNotificationMockBody,
              ),
              const Spacer(),
              FilledButton(
                onPressed: () => _allow(context),
                child: Text(l10n.onboardingNotificationAllow),
              ),
              const SizedBox(height: 8),
              TextButton(
                onPressed: onContinue,
                child: Text(
                  l10n.onboardingNotificationNotNow,
                  style: TextStyle(color: scheme.onSurfaceVariant),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _NotificationMockup extends StatelessWidget {
  const _NotificationMockup({required this.title, required this.body});

  final String title;
  final String body;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Material(
      color: scheme.surfaceContainerHigh,
      borderRadius: BorderRadius.circular(20),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(colors: [scheme.primary, scheme.secondary]),
              ),
              child: const Icon(Icons.water_drop, size: 20, color: Colors.white),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: Theme.of(context).textTheme.titleSmall),
                  const SizedBox(height: 2),
                  Text(body, style: Theme.of(context).textTheme.bodySmall),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
