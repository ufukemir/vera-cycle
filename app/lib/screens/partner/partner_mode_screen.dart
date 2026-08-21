import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../l10n/app_localizations.dart';
import '../../l10n/enum_labels.dart';
import '../../models/enums.dart';
import '../../state/app_lock_controller.dart';
import '../../state/app_preferences.dart';
import '../../state/cycle_controller.dart';
import '../../state/partner_controller.dart';
import 'pairing_enter_screen.dart';
import 'pairing_invite_screen.dart';

String _errorMessage(AppLocalizations l10n, PartnerErrorCode code) =>
    switch (code) {
      PartnerErrorCode.notConfigured => l10n.partnerModeErrorNotConfigured,
      PartnerErrorCode.codeNotFound => l10n.partnerModeErrorCodeNotFound,
      PartnerErrorCode.codeExpired => l10n.partnerModeErrorCodeExpired,
      PartnerErrorCode.codeIsOwn => l10n.partnerModeErrorCodeIsOwn,
      PartnerErrorCode.notSignedIn => l10n.partnerModeErrorNotSignedIn,
      PartnerErrorCode.unknown => l10n.partnerModeErrorUnknown,
    };

/// Partner Modu's hub — the one deliberate, opt-in exception to "health data
/// never leaves the device" (CLAUDE.md, 2026-08-21 revision). Renders one of
/// four states depending on [PartnerController]: unconfigured (no Firebase
/// in this build), signed out, signed in but unpaired, or paired.
///
/// Nothing here auto-shares anything. [_ShareSection] only ever writes to
/// Firestore when the user taps "Paylaş" — the toggles above it decide what
/// *would* go in that snapshot, not when it goes.
class PartnerModeScreen extends StatelessWidget {
  const PartnerModeScreen({super.key});

  Future<void> _handleSignIn(
    BuildContext context,
    Future<bool> Function() action,
  ) async {
    final lock = context.read<AppLockController>();
    final l10n = AppLocalizations.of(context)!;
    // Both providers hand off to a system sheet (Google account chooser /
    // Apple's native sheet) — same reasoning as the health-sync permission
    // flow in settings_screen.dart: auto-lock must not fire while that sheet
    // owns the foreground.
    final ok = await lock.duringSystemSheet(action);
    if (!context.mounted || ok) return;
    final controller = context.read<PartnerController>();
    final error = controller.error;
    if (error == null) return;
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text(_errorMessage(l10n, error)),
          behavior: SnackBarBehavior.floating,
          margin: const EdgeInsets.all(16),
        ),
      );
    controller.clearError();
  }

  Future<void> _confirmUnpair(BuildContext context) async {
    final l10n = AppLocalizations.of(context)!;
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: Text(l10n.partnerModeUnpairConfirmTitle),
        content: Text(l10n.partnerModeUnpairConfirmBody),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(false),
            child: Text(l10n.actionCancel),
          ),
          FilledButton(
            style: FilledButton.styleFrom(
              backgroundColor: Theme.of(dialogContext).colorScheme.error,
            ),
            onPressed: () => Navigator.of(dialogContext).pop(true),
            child: Text(l10n.partnerModeUnpair),
          ),
        ],
      ),
    );
    if (confirmed != true || !context.mounted) return;
    await context.read<PartnerController>().unpair();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final controller = context.watch<PartnerController>();

    return Scaffold(
      appBar: AppBar(title: Text(l10n.partnerModeTitle)),
      body: SafeArea(
        child: !controller.ready
            ? const Center(child: CircularProgressIndicator())
            : !controller.isConfigured
            ? _NotConfigured(l10n: l10n)
            : !controller.isSignedIn
            ? _SignInGate(
                loading: controller.loading,
                onGoogle: () =>
                    _handleSignIn(context, controller.signInWithGoogle),
                onApple: () =>
                    _handleSignIn(context, controller.signInWithApple),
              )
            : ListView(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 32),
                children: [
                  if (!controller.isPaired) ...[
                    _NotPaired(l10n: l10n),
                    const SizedBox(height: 20),
                    FilledButton.icon(
                      icon: const Icon(Icons.qr_code_outlined),
                      label: Text(l10n.partnerModeInviteButton),
                      onPressed: () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => const PairingInviteScreen(),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    OutlinedButton.icon(
                      icon: const Icon(Icons.pin_outlined),
                      label: Text(l10n.partnerModeEnterCodeButton),
                      onPressed: () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => const PairingEnterScreen(),
                        ),
                      ),
                    ),
                  ] else ...[
                    _PairedCard(l10n: l10n),
                    const SizedBox(height: 20),
                    const _ShareSection(),
                    const SizedBox(height: 20),
                    const _PartnerSnapshotCard(),
                    const SizedBox(height: 20),
                    OutlinedButton.icon(
                      icon: const Icon(Icons.link_off),
                      label: Text(l10n.partnerModeUnpair),
                      onPressed: () => _confirmUnpair(context),
                    ),
                  ],
                  const SizedBox(height: 24),
                  const Divider(),
                  const SizedBox(height: 8),
                  TextButton(
                    onPressed: controller.loading
                        ? null
                        : () => controller.signOut(),
                    child: Text(l10n.partnerModeSignOut),
                  ),
                ],
              ),
      ),
    );
  }
}

class _NotConfigured extends StatelessWidget {
  const _NotConfigured({required this.l10n});

  final AppLocalizations l10n;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.cloud_off_outlined,
              size: 48,
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
            const SizedBox(height: 16),
            Text(
              l10n.partnerModeNotConfiguredTitle,
              style: Theme.of(context).textTheme.titleMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              l10n.partnerModeNotConfiguredBody,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

class _SignInGate extends StatelessWidget {
  const _SignInGate({
    required this.loading,
    required this.onGoogle,
    required this.onApple,
  });

  final bool loading;
  final VoidCallback onGoogle;
  final VoidCallback onApple;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final scheme = Theme.of(context).colorScheme;

    return ListView(
      padding: const EdgeInsets.fromLTRB(24, 32, 24, 32),
      children: [
        Container(
          width: 96,
          height: 96,
          margin: const EdgeInsets.only(bottom: 20),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: scheme.primary.withValues(alpha: 0.14),
          ),
          child: Icon(Icons.favorite_outline, size: 44, color: scheme.primary),
        ),
        Text(
          l10n.partnerModeHeroTitle,
          style: Theme.of(context).textTheme.headlineSmall,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 10),
        Text(
          l10n.partnerModeHeroBody,
          style: Theme.of(
            context,
          ).textTheme.bodyMedium?.copyWith(color: scheme.onSurfaceVariant),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 28),
        FilledButton.icon(
          icon: const Icon(Icons.g_mobiledata, size: 26),
          label: Text(l10n.partnerModeSignInGoogle),
          onPressed: loading ? null : onGoogle,
        ),
        const SizedBox(height: 10),
        OutlinedButton.icon(
          icon: const Icon(Icons.apple),
          label: Text(l10n.partnerModeSignInApple),
          onPressed: loading ? null : onApple,
        ),
        const SizedBox(height: 32),
        Text(
          l10n.partnerModeFaqTitle,
          style: Theme.of(context).textTheme.titleSmall,
        ),
        const SizedBox(height: 8),
        _FaqTile(
          question: l10n.partnerModeFaq1Q,
          answer: l10n.partnerModeFaq1A,
        ),
        _FaqTile(
          question: l10n.partnerModeFaq2Q,
          answer: l10n.partnerModeFaq2A,
        ),
        _FaqTile(
          question: l10n.partnerModeFaq3Q,
          answer: l10n.partnerModeFaq3A,
        ),
      ],
    );
  }
}

class _FaqTile extends StatelessWidget {
  const _FaqTile({required this.question, required this.answer});

  final String question;
  final String answer;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      tilePadding: EdgeInsets.zero,
      title: Text(
        question,
        style: Theme.of(
          context,
        ).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600),
      ),
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              answer,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _NotPaired extends StatelessWidget {
  const _NotPaired({required this.l10n});

  final AppLocalizations l10n;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: scheme.surfaceContainerHigh,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            l10n.partnerModeNotPairedTitle,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 6),
          Text(
            l10n.partnerModeNotPairedBody,
            style: Theme.of(
              context,
            ).textTheme.bodyMedium?.copyWith(color: scheme.onSurfaceVariant),
          ),
        ],
      ),
    );
  }
}

class _PairedCard extends StatelessWidget {
  const _PairedCard({required this.l10n});

  final AppLocalizations l10n;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: scheme.primaryContainer.withValues(alpha: 0.5),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        children: [
          Icon(Icons.favorite, color: scheme.primary),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  l10n.partnerModePairedTitle,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 4),
                Text(
                  l10n.partnerModePairedBody,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: scheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// The toggles that decide what [PartnerController.shareMySnapshot] is
/// *allowed* to send, plus the button that actually sends it. Deliberately
/// two separate steps — flipping a toggle never itself triggers a network
/// write, so "what I've allowed" and "what I've actually shared right now"
/// stay honestly distinct, matching [PartnerService]'s own doc comment.
class _ShareSection extends StatelessWidget {
  const _ShareSection();

  Map<String, Object?> _buildSnapshot(
    AppPreferences prefs,
    CycleController cycle,
  ) {
    final status = cycle.todayStatus;
    final today = cycle.logs.isEmpty ? null : cycle.logFor(DateTime.now());
    return {
      if (prefs.partnerShareCyclePhase) 'cyclePhase': status.phase.name,
      if (prefs.partnerShareCyclePhase && status.cycleDay != null)
        'cycleDay': status.cycleDay,
      if (prefs.partnerShareMood && today?.mood != null)
        'mood': today!.mood!.name,
      if (prefs.partnerShareSymptoms && today != null)
        'symptoms': today.symptoms.map((s) => s.name).toList(),
      if (prefs.partnerShareHighDesire)
        'highDesire': (today?.sexLife.isNotEmpty ?? false),
    };
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final prefs = context.watch<AppPreferences>();
    final scheme = Theme.of(context).colorScheme;

    return Container(
      decoration: BoxDecoration(
        color: scheme.surfaceContainerHigh,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 14, 16, 4),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                l10n.partnerModeShareSectionTitle,
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ),
          ),
          SwitchListTile(
            title: Text(l10n.partnerModeShareCyclePhase),
            value: prefs.partnerShareCyclePhase,
            onChanged: (v) => prefs.setPartnerShareCyclePhase(v),
          ),
          SwitchListTile(
            title: Text(l10n.partnerModeShareMood),
            value: prefs.partnerShareMood,
            onChanged: (v) => prefs.setPartnerShareMood(v),
          ),
          SwitchListTile(
            title: Text(l10n.partnerModeShareSymptoms),
            value: prefs.partnerShareSymptoms,
            onChanged: (v) => prefs.setPartnerShareSymptoms(v),
          ),
          SwitchListTile(
            title: Text(l10n.partnerModeShareHighDesire),
            value: prefs.partnerShareHighDesire,
            onChanged: (v) => prefs.setPartnerShareHighDesire(v),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 4, 16, 16),
            child: SizedBox(
              width: double.infinity,
              child: FilledButton(
                onPressed: () async {
                  final controller = context.read<PartnerController>();
                  final cycle = context.read<CycleController>();
                  final messenger = ScaffoldMessenger.of(context);
                  final ok = await controller.shareMySnapshot(
                    _buildSnapshot(prefs, cycle),
                  );
                  if (!context.mounted) return;
                  messenger
                    ..hideCurrentSnackBar()
                    ..showSnackBar(
                      SnackBar(
                        content: Text(
                          ok
                              ? l10n.partnerModeShareSuccess
                              : _errorMessage(
                                  l10n,
                                  controller.error ?? PartnerErrorCode.unknown,
                                ),
                        ),
                        behavior: SnackBarBehavior.floating,
                        margin: const EdgeInsets.all(16),
                      ),
                    );
                },
                child: Text(l10n.partnerModeShareNow),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _PartnerSnapshotCard extends StatelessWidget {
  const _PartnerSnapshotCard();

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final controller = context.watch<PartnerController>();
    final scheme = Theme.of(context).colorScheme;

    return StreamBuilder<Map<String, dynamic>?>(
      stream: controller.partnerSnapshotStream(),
      builder: (context, snapshot) {
        final data = snapshot.data;
        return Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: scheme.surfaceContainerHigh,
            borderRadius: BorderRadius.circular(18),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                l10n.partnerModePairedTitle,
                style: Theme.of(context).textTheme.titleSmall,
              ),
              const SizedBox(height: 10),
              if (data == null || data.isEmpty)
                Text(
                  l10n.partnerModePartnerSnapshotEmpty,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: scheme.onSurfaceVariant,
                  ),
                )
              else
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    if (data['cyclePhase'] != null)
                      Chip(
                        label: Text(
                          phaseLabel(
                            l10n,
                            CyclePhase.values.firstWhere(
                              (p) => p.name == data['cyclePhase'],
                              orElse: () => CyclePhase.unknown,
                            ),
                          ),
                        ),
                      ),
                    if (data['mood'] != null)
                      Chip(
                        label: Text(
                          moodLabel(
                            l10n,
                            Mood.values.firstWhere(
                              (m) => m.name == data['mood'],
                              orElse: () => Mood.calm,
                            ),
                          ),
                        ),
                      ),
                    if (data['highDesire'] == true)
                      Chip(label: Text(l10n.partnerModeShareHighDesire)),
                  ],
                ),
            ],
          ),
        );
      },
    );
  }
}
