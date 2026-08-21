import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../l10n/app_localizations.dart';
import '../../state/partner_controller.dart';

/// Where the partner who received a code types it in. Success pops back to
/// the hub, which re-renders paired the moment [PartnerController]'s
/// `pairedWithStream` fires — no extra navigation logic needed here.
class PairingEnterScreen extends StatefulWidget {
  const PairingEnterScreen({super.key});

  @override
  State<PairingEnterScreen> createState() => _PairingEnterScreenState();
}

class _PairingEnterScreenState extends State<PairingEnterScreen> {
  final _controller = TextEditingController();
  String? _errorText;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    final l10n = AppLocalizations.of(context)!;
    final code = _controller.text.trim();
    if (code.isEmpty) return;
    setState(() => _errorText = null);
    final partnerController = context.read<PartnerController>();
    final ok = await partnerController.redeemPairingCode(code);
    if (!mounted) return;
    if (ok) {
      Navigator.of(context).pop();
      return;
    }
    final error = partnerController.error;
    setState(
      () => _errorText = error == null
          ? l10n.partnerModeErrorUnknown
          : switch (error) {
              PartnerErrorCode.codeNotFound =>
                l10n.partnerModeErrorCodeNotFound,
              PartnerErrorCode.codeExpired => l10n.partnerModeErrorCodeExpired,
              PartnerErrorCode.codeIsOwn => l10n.partnerModeErrorCodeIsOwn,
              PartnerErrorCode.notSignedIn => l10n.partnerModeErrorNotSignedIn,
              PartnerErrorCode.notConfigured =>
                l10n.partnerModeErrorNotConfigured,
              PartnerErrorCode.unknown => l10n.partnerModeErrorUnknown,
            },
    );
    partnerController.clearError();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final controller = context.watch<PartnerController>();
    final scheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(title: Text(l10n.partnerModeEnterTitle)),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              Text(
                l10n.partnerModeEnterBody,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: scheme.onSurfaceVariant,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 28),
              TextField(
                controller: _controller,
                textAlign: TextAlign.center,
                textCapitalization: TextCapitalization.characters,
                maxLength: 6,
                inputFormatters: [UpperCaseTextFormatter()],
                style: Theme.of(
                  context,
                ).textTheme.headlineSmall?.copyWith(letterSpacing: 6),
                decoration: InputDecoration(
                  hintText: l10n.partnerModeEnterHint,
                  errorText: _errorText,
                  counterText: '',
                ),
                onSubmitted: (_) => _submit(),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: FilledButton(
                  onPressed: controller.loading ? null : _submit,
                  child: controller.loading
                      ? const SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        )
                      : Text(l10n.partnerModeEnterSubmit),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class UpperCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    return newValue.copyWith(text: newValue.text.toUpperCase());
  }
}
