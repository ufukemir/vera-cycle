import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../l10n/app_localizations.dart';
import '../../services/pin_vault.dart';
import '../../state/app_lock_controller.dart';
import '../../state/app_preferences.dart';
import '../../state/cycle_controller.dart';
import '../../widgets/pin_pad.dart';
import 'pin_setup_screen.dart';

enum _ForgotPinChoice { resetViaDevice, eraseEverything }

/// Shown whenever [AppLockController.state] is [AppLockState.locked].
///
/// Mounted in place of the entire rest of the app (see AppRoot) rather than
/// drawn on top of it, so locked data never briefly exists in the widget tree
/// underneath.
class LockScreen extends StatefulWidget {
  const LockScreen({super.key});

  @override
  State<LockScreen> createState() => _LockScreenState();
}

class _LockScreenState extends State<LockScreen> {
  final _pinPadKey = GlobalKey<PinPadState>();
  String? _error;
  bool _attemptedAutoBiometrics = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Offer biometrics automatically once per screen mount, if enabled —
    // saves a tap on the common path without making it the only path.
    if (!_attemptedAutoBiometrics) {
      _attemptedAutoBiometrics = true;
      final prefs = context.read<AppPreferences>();
      if (prefs.biometricUnlockEnabled) {
        WidgetsBinding.instance.addPostFrameCallback((_) => _tryBiometrics());
      }
    }
  }

  Future<void> _tryBiometrics() async {
    if (!mounted) return;
    final l10n = AppLocalizations.of(context)!;
    await context.read<AppLockController>().unlockWithBiometrics(
      l10n.lockScreenEnterPin,
    );
  }

  Future<void> _onPinEntered(String pin) async {
    final lock = context.read<AppLockController>();
    final l10n = AppLocalizations.of(context)!;

    final success = await lock.unlockWithPin(pin);
    if (!mounted) return;

    if (!success) {
      final remaining = lock.lockoutRemaining;
      setState(() {
        _error = remaining != null
            ? l10n.lockScreenThrottled(remaining.inSeconds + 1)
            : l10n.lockScreenWrongPin;
      });
    } else {
      setState(() => _error = null);
    }
  }

  /// Offers a way out of a forgotten PIN that does not cost the user their
  /// data — see [AppLockController.verifyDeviceOwnership] for why proving
  /// you can unlock the phone itself is a sound enough bar for that. Falls
  /// straight through to the old erase-only path on a device with no lock
  /// of its own to verify against, since offering a button that cannot
  /// work is worse than not offering it.
  Future<void> _forgotPin() async {
    final l10n = AppLocalizations.of(context)!;
    final lock = context.read<AppLockController>();

    final canVerify = await lock.canVerifyDeviceOwnership();
    if (!mounted) return;
    if (!canVerify) {
      await _confirmErase();
      return;
    }

    final choice = await showDialog<_ForgotPinChoice>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: Text(l10n.lockScreenForgotPinChoiceTitle),
        content: Text(l10n.lockScreenResetViaDeviceBody),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(
              dialogContext,
            ).pop(_ForgotPinChoice.eraseEverything),
            child: Text(l10n.lockScreenEraseConfirm),
          ),
          FilledButton(
            onPressed: () => Navigator.of(
              dialogContext,
            ).pop(_ForgotPinChoice.resetViaDevice),
            child: Text(l10n.lockScreenResetViaDevice),
          ),
        ],
      ),
    );
    if (!mounted || choice == null) return;

    if (choice == _ForgotPinChoice.eraseEverything) {
      await _confirmErase();
      return;
    }

    final verified = await lock.verifyDeviceOwnership(
      l10n.lockScreenResetViaDeviceReason,
    );
    if (!verified || !mounted) return;

    await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => PinSetupScreen(
          // They just proved who they are with the device's own lock and are
          // about to prove it again by typing the new PIN twice — unlocking
          // here is the same "no third proof needed" call PinSetupScreen's
          // own onboarding path already makes.
          onComplete: () =>
              context.read<AppLockController>().unlockAfterSetup(),
        ),
      ),
    );
  }

  Future<void> _confirmErase() async {
    final l10n = AppLocalizations.of(context)!;
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: Text(l10n.lockScreenEraseTitle),
        content: Text(l10n.lockScreenEraseBody),
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
            child: Text(l10n.lockScreenEraseConfirm),
          ),
        ],
      ),
    );

    if (confirmed != true || !mounted) return;

    await context.read<CycleController>().eraseEverything();
    if (!mounted) return;
    await context.read<PinVault>().clear();
    if (!mounted) return;
    await context.read<AppPreferences>().setOnboardingComplete(false);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final lock = context.watch<AppLockController>();
    final throttled = lock.lockoutRemaining != null;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.lock_outline, size: 48),
                const SizedBox(height: 12),
                Text(
                  l10n.lockScreenTitle,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                const SizedBox(height: 8),
                Text(l10n.lockScreenEnterPin),
                if (_error != null) ...[
                  const SizedBox(height: 8),
                  Text(
                    _error!,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.error,
                    ),
                  ),
                ],
                const SizedBox(height: 24),
                PinPad(
                  key: _pinPadKey,
                  length: 6,
                  enabled: !throttled,
                  onSubmit: _onPinEntered,
                ),
                const SizedBox(height: 16),
                FutureBuilder<(bool, IconData, BiometricLabelKind)>(
                  // Bundled into one future rather than a fingerprint icon
                  // that used to be hardcoded regardless of device — an
                  // iPhone with Face ID showed a fingerprint glyph, labeled
                  // "Use biometrics", for a feature it unlocks by looking at
                  // the phone. Apple's own guidance is to name Face ID and
                  // Touch ID specifically rather than the generic term.
                  future: (() async => (
                    await lock.canUseBiometrics(),
                    await lock.biometricIcon(),
                    await lock.biometricLabelKind(),
                  ))(),
                  builder: (context, snapshot) {
                    if (snapshot.data?.$1 != true) {
                      return const SizedBox.shrink();
                    }
                    final label = switch (snapshot.data!.$3) {
                      BiometricLabelKind.face => l10n.lockScreenUseFaceId,
                      BiometricLabelKind.fingerprint =>
                        l10n.lockScreenUseFingerprint,
                      BiometricLabelKind.generic =>
                        l10n.lockScreenUseBiometrics,
                    };
                    return TextButton.icon(
                      onPressed: _tryBiometrics,
                      icon: Icon(snapshot.data!.$2),
                      label: Text(label),
                    );
                  },
                ),
                TextButton(
                  onPressed: _forgotPin,
                  child: Text(l10n.lockScreenForgotPin),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
