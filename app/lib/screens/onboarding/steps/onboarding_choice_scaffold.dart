import 'package:flutter/material.dart';

class OnboardingChoiceOption<T> {
  const OnboardingChoiceOption({required this.value, required this.label, this.icon});

  final T value;
  final String label;
  final IconData? icon;
}

/// Shared layout for a tap-to-advance onboarding choice: unlike
/// [OnboardingQuestionScaffold], there is no separate Continue button —
/// selecting a card immediately advances, mirroring the snappy card-tap
/// pattern common across period-tracking onboarding flows.
class OnboardingChoiceScaffold<T> extends StatelessWidget {
  const OnboardingChoiceScaffold({
    super.key,
    required this.title,
    required this.body,
    required this.options,
    required this.onSelected,
  });

  final String title;
  final String body;
  final List<OnboardingChoiceOption<T>> options;
  final ValueChanged<T> onSelected;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Spacer(),
              Text(title,
                  style: Theme.of(context).textTheme.headlineSmall,
                  textAlign: TextAlign.center),
              const SizedBox(height: 12),
              Text(body,
                  style: Theme.of(context).textTheme.bodyMedium,
                  textAlign: TextAlign.center),
              const SizedBox(height: 32),
              for (final option in options) ...[
                _ChoiceCard<T>(option: option, onTap: () => onSelected(option.value)),
                const SizedBox(height: 12),
              ],
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}

class _ChoiceCard<T> extends StatelessWidget {
  const _ChoiceCard({required this.option, required this.onTap});

  final OnboardingChoiceOption<T> option;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Material(
      color: scheme.surfaceContainerHigh,
      borderRadius: BorderRadius.circular(20),
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 20),
          child: Row(
            children: [
              if (option.icon != null) ...[
                Icon(option.icon, color: scheme.primary),
                const SizedBox(width: 16),
              ],
              Expanded(
                child: Text(option.label, style: Theme.of(context).textTheme.titleMedium),
              ),
              Icon(Icons.chevron_right_rounded, color: scheme.outline),
            ],
          ),
        ),
      ),
    );
  }
}
