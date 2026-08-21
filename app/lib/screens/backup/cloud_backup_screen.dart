import 'package:cryptography/cryptography.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../l10n/app_localizations.dart';
import '../../services/backup_service.dart';
import '../../state/app_lock_controller.dart';
import '../../state/cloud_backup_controller.dart';
import '../../state/cycle_controller.dart';
import '../export/widgets/backup_password_dialogs.dart';

String _errorMessage(AppLocalizations l10n, CloudBackupErrorCode code) =>
    switch (code) {
      CloudBackupErrorCode.notConfigured => l10n.partnerModeErrorNotConfigured,
      CloudBackupErrorCode.notSignedIn => l10n.partnerModeErrorNotSignedIn,
      CloudBackupErrorCode.unknown => l10n.partnerModeErrorUnknown,
    };

/// Account-based cloud backup — reuses [BackupService]'s exact encrypted
/// file format and the same Google/Apple sign-in as Partner Modu (see
/// `CloudAuthService`), but is otherwise a separate, narrower feature: this
/// screen never shares anything with anyone, it only moves the user's own
/// encrypted file to their own account so a new device can restore it. See
/// CLAUDE.md's 2026-08-21 cloud-backup revision note.
class CloudBackupScreen extends StatefulWidget {
  const CloudBackupScreen({super.key});

  @override
  State<CloudBackupScreen> createState() => _CloudBackupScreenState();
}

class _CloudBackupScreenState extends State<CloudBackupScreen> {
  static const _backupService = BackupService();

  Future<T> _sheet<T>(Future<T> Function() action) =>
      context.read<AppLockController>().duringSystemSheet(action);

  Future<void> _handleSignIn(Future<bool> Function() action) async {
    final ok = await _sheet(action);
    if (!mounted || ok) return;
    final controller = context.read<CloudBackupController>();
    final error = controller.error;
    if (error == null) return;
    _showSnack(_errorMessage(AppLocalizations.of(context)!, error));
    controller.clearError();
  }

  Future<void> _upload() async {
    final l10n = AppLocalizations.of(context)!;
    final password = await showDialog<String>(
      context: context,
      builder: (_) => const NewPasswordDialog(),
    );
    if (password == null || !mounted) return;

    final logs = context.read<CycleController>().logs;
    final bytes = await _backupService.createBackup(logs, password);
    if (!mounted) return;

    final controller = context.read<CloudBackupController>();
    final ok = await controller.upload(bytes);
    if (!mounted) return;
    if (ok) {
      _showSnack(l10n.cloudBackupUploadSuccess);
    } else {
      _showSnack(
        _errorMessage(l10n, controller.error ?? CloudBackupErrorCode.unknown),
      );
      controller.clearError();
    }
  }

  Future<void> _download() async {
    final l10n = AppLocalizations.of(context)!;
    final controller = context.read<CloudBackupController>();

    final bytes = await controller.download();
    if (!mounted) return;
    if (bytes == null) {
      final error = controller.error;
      _showSnack(
        error == null
            ? l10n.cloudBackupNoBackupFound
            : _errorMessage(l10n, error),
      );
      controller.clearError();
      return;
    }

    final password = await showDialog<String>(
      context: context,
      builder: (_) => const SinglePasswordDialog(),
    );
    if (password == null || !mounted) return;

    final confirmed = await showDialog<bool>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: Text(l10n.exportRestoreConfirmTitle),
        content: Text(l10n.exportRestoreConfirmBody),
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
            child: Text(l10n.exportRestoreConfirmAction),
          ),
        ],
      ),
    );
    if (confirmed != true || !mounted) return;

    try {
      final restored = await _backupService.restoreBackup(bytes, password);
      if (!mounted) return;
      await context.read<CycleController>().replaceAll(restored);
      if (!mounted) return;
      _showSnack(l10n.exportRestoreSuccess);
    } on SecretBoxAuthenticationError {
      if (mounted) _showSnack(l10n.exportWrongPassword);
    } on FormatException {
      if (mounted) _showSnack(l10n.exportInvalidFile);
    }
  }

  void _showSnack(String message) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text(message),
          duration: const Duration(seconds: 3),
          behavior: SnackBarBehavior.floating,
          margin: const EdgeInsets.all(16),
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final controller = context.watch<CloudBackupController>();

    return Scaffold(
      appBar: AppBar(title: Text(l10n.cloudBackupTitle)),
      body: SafeArea(
        child: !controller.ready
            ? const Center(child: CircularProgressIndicator())
            : !controller.isConfigured
            ? _NotConfigured(l10n: l10n)
            : !controller.isSignedIn
            ? _SignInCarousel(
                loading: controller.loading,
                onGoogle: () => _handleSignIn(controller.signInWithGoogle),
                onApple: () => _handleSignIn(controller.signInWithApple),
              )
            : _SignedInBody(
                controller: controller,
                onUpload: _upload,
                onDownload: _download,
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
              l10n.cloudBackupNotConfiguredTitle,
              style: Theme.of(context).textTheme.titleMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              l10n.cloudBackupNotConfiguredBody,
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

class _SignInCarousel extends StatefulWidget {
  const _SignInCarousel({
    required this.loading,
    required this.onGoogle,
    required this.onApple,
  });

  final bool loading;
  final VoidCallback onGoogle;
  final VoidCallback onApple;

  @override
  State<_SignInCarousel> createState() => _SignInCarouselState();
}

class _SignInCarouselState extends State<_SignInCarousel> {
  final _controller = PageController();
  int _page = 0;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final scheme = Theme.of(context).colorScheme;

    final pages = [
      (
        icon: Icons.cloud_done_outlined,
        title: l10n.cloudBackupIntro1Title,
        body: l10n.cloudBackupIntro1Body,
      ),
      (
        icon: Icons.lock_outline,
        title: l10n.cloudBackupIntro2Title,
        body: l10n.cloudBackupIntro2Body,
      ),
      (
        icon: Icons.phone_iphone_outlined,
        title: l10n.cloudBackupIntro3Title,
        body: l10n.cloudBackupIntro3Body,
      ),
    ];

    return Column(
      children: [
        Expanded(
          child: PageView(
            controller: _controller,
            onPageChanged: (i) => setState(() => _page = i),
            children: [
              for (final page in pages)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 108,
                        height: 108,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: scheme.primary.withValues(alpha: 0.16),
                        ),
                        child: Icon(page.icon, size: 52, color: scheme.primary),
                      ),
                      const SizedBox(height: 32),
                      Text(
                        page.title,
                        style: Theme.of(context).textTheme.headlineSmall,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 12),
                      Text(
                        page.body,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: scheme.onSurfaceVariant,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (var i = 0; i < pages.length; i++)
                AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  margin: const EdgeInsets.symmetric(horizontal: 3),
                  width: i == _page ? 20 : 6,
                  height: 6,
                  decoration: BoxDecoration(
                    color: i == _page
                        ? scheme.primary
                        : scheme.onSurface.withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(3),
                  ),
                ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
          child: Column(
            children: [
              FilledButton.icon(
                icon: const Icon(Icons.g_mobiledata, size: 26),
                label: Text(l10n.partnerModeSignInGoogle),
                onPressed: widget.loading ? null : widget.onGoogle,
              ),
              const SizedBox(height: 10),
              OutlinedButton.icon(
                icon: const Icon(Icons.apple),
                label: Text(l10n.partnerModeSignInApple),
                onPressed: widget.loading ? null : widget.onApple,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _SignedInBody extends StatelessWidget {
  const _SignedInBody({
    required this.controller,
    required this.onUpload,
    required this.onDownload,
  });

  final CloudBackupController controller;
  final VoidCallback onUpload;
  final VoidCallback onDownload;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final scheme = Theme.of(context).colorScheme;
    final lastUploadedAt = controller.lastUploadedAt;
    final dateFmt = DateFormat.yMMMd(
      Localizations.localeOf(context).toString(),
    );

    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        Container(
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
            color: scheme.surfaceContainerHigh,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            children: [
              Icon(Icons.cloud_done_outlined, color: scheme.primary),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      l10n.cloudBackupSignedInTitle,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      lastUploadedAt == null
                          ? l10n.backupNever
                          : l10n.backupLastDone(dateFmt.format(lastUploadedAt)),
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: scheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        FilledButton.icon(
          icon: const Icon(Icons.cloud_upload_outlined),
          label: Text(l10n.cloudBackupUploadButton),
          onPressed: controller.loading ? null : onUpload,
        ),
        const SizedBox(height: 10),
        OutlinedButton.icon(
          icon: const Icon(Icons.cloud_download_outlined),
          label: Text(l10n.cloudBackupDownloadButton),
          onPressed: controller.loading ? null : onDownload,
        ),
        const SizedBox(height: 24),
        const Divider(),
        const SizedBox(height: 8),
        TextButton(
          onPressed: controller.loading ? null : () => controller.signOut(),
          child: Text(l10n.partnerModeSignOut),
        ),
      ],
    );
  }
}
