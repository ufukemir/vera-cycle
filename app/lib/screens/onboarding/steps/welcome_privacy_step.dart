import 'package:flutter/material.dart';

import '../../../l10n/app_localizations.dart';

class WelcomePrivacyStep extends StatelessWidget {
  const WelcomePrivacyStep({super.key, required this.onContinue});

  final VoidCallback onContinue;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Icon(Icons.shield_outlined, size: 56),
              const SizedBox(height: 20),
              Text(
                l10n.onboardingPrivacyTitle,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              Text(
                l10n.onboardingPrivacyBody,
                style: Theme.of(context).textTheme.bodyLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),
              FilledButton(
                onPressed: onContinue,
                child: Text(l10n.actionContinue),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
