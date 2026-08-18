import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../l10n/app_localizations.dart';
import '../../services/pin_vault.dart';
import '../../state/app_lock_controller.dart';
import '../../state/app_preferences.dart';
import '../../widgets/pin_pad.dart';

enum _Stage { enter, confirm, biometricOffer }

/// Mandatory PIN creation, used both as onboarding's final step and (later)
/// from Settings for changing the PIN. Takes the PIN twice to catch typos —
/// there is no "forgot PIN during setup" case to design around, since nothing
/// has been locked yet.
class PinSetupScreen extends StatefulWidget {
  const PinSetupScreen({super.key, required this.onComplete});

  /// Called once the PIN is saved (and the biometric offer, if shown, is
  /// resolved either way).
  final VoidCallback onComplete;

  @override
  State<PinSetupScreen> createState() => _PinSetupScreenState();
}

class _PinSetupScreenState extends State<PinSetupScreen> {
  final _pinPadKey = GlobalKey<PinPadState>();
  _Stage _stage = _Stage.enter;
  String? _firstEntry;
  String? _error;
  bool _canOfferBiometrics = false;
  IconData _biometricIcon = Icons.fingerprint;

  Future<void> _onDigitsEntered(String pin) async {
    final l10n = AppLocalizations.of(context)!;

    if (_stage == _Stage.enter) {
      setState(() {
        _firstEntry = pin;
        _stage = _Stage.confirm;
        _error = null;
      });
      return;
    }

    // _stage == confirm
    if (pin != _firstEntry) {
      setState(() {
        _firstEntry = null;
        _stage = _Stage.enter;
        _error = l10n.pinSetupMismatch;
      });
      return;
    }

    await context.read<PinVault>().setPin(pin);
    if (!mounted) return;

    final lock = context.read<AppLockController>();
    final canBiometrics = await lock.canUseBiometrics();
    if (!mounted) return;

    if (canBiometrics) {
      // Same device-appropriate icon as the lock screen — a Face ID
      // iPhone showing a fingerprint glyph here is the first thing this
      // screen would ever show someone.
      final icon = await lock.biometricIcon();
      if (!mounted) return;
      setState(() {
        _canOfferBiometrics = true;
        _biometricIcon = icon;
        _stage = _Stage.biometricOffer;
      });
    } else {
      widget.onComplete();
    }
  }

  Future<void> _enableBiometrics() async {
    await context.read<AppPreferences>().setBiometricUnlockEnabled(true);
    widget.onComplete();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    if (_stage == _Stage.biometricOffer && _canOfferBiometrics) {
      return Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(_biometricIcon, size: 64),
                  const SizedBox(height: 16),
                  Text(l10n.pinSetupBiometricTitle,
                      style: Theme.of(context).textTheme.headlineSmall,
                      textAlign: TextAlign.center),
                  const SizedBox(height: 12),
                  Text(l10n.pinSetupBiometricBody, textAlign: TextAlign.center),
                  const SizedBox(height: 24),
                  FilledButton(
                    onPressed: _enableBiometrics,
                    child: Text(l10n.actionEnable),
                  ),
                  TextButton(
                    onPressed: widget.onComplete,
                    child: Text(l10n.actionSkip),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(title: Text(l10n.pinSetupTitle)),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  _stage == _Stage.enter
                      ? l10n.pinSetupEnterPrompt
                      : l10n.pinSetupConfirmPrompt,
                  style: Theme.of(context).textTheme.titleMedium,
                  textAlign: TextAlign.center,
                ),
                if (_error != null) ...[
                  const SizedBox(height: 8),
                  Text(_error!,
                      style: TextStyle(color: Theme.of(context).colorScheme.error)),
                ],
                const SizedBox(height: 24),
                PinPad(
                  key: _pinPadKey,
                  length: 6,
                  onSubmit: _onDigitsEntered,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
