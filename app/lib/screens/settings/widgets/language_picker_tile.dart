import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../l10n/app_localizations.dart';
import '../../../state/app_preferences.dart';

/// Stands in for "follow system language" in the picker's own return
/// channel. [AppPreferences.locale] itself uses real `null` for that case —
/// this sentinel exists only so the bottom sheet's result can distinguish
/// "user picked System" from "user dismissed without picking anything"
/// (both of which a bare `null` from [showModalBottomSheet] would conflate).
const _systemSentinel = '_system_';

const _supportedCodes = <String>[
  _systemSentinel, 'en', 'tr', 'ar', 'es', 'fr', 'de', 'id',
];

String _labelFor(AppLocalizations l10n, String code) {
  switch (code) {
    case _systemSentinel:
      return l10n.settingsLanguageSystem;
    case 'en':
      return l10n.settingsLanguageEnglish;
    case 'tr':
      return l10n.settingsLanguageTurkish;
    case 'ar':
      return l10n.settingsLanguageArabic;
    case 'es':
      return l10n.settingsLanguageSpanish;
    case 'fr':
      return l10n.settingsLanguageFrench;
    case 'de':
      return l10n.settingsLanguageGerman;
    case 'id':
      return l10n.settingsLanguageIndonesian;
    default:
      return code;
  }
}

/// A settings row that opens a picker for the app's display language,
/// defaulting to following the device's own language (see
/// [AppPreferences.locale]).
class LanguagePickerTile extends StatelessWidget {
  const LanguagePickerTile({super.key});

  Future<void> _openPicker(BuildContext context, AppPreferences prefs) async {
    final l10n = AppLocalizations.of(context)!;
    final currentCode = prefs.locale?.languageCode ?? _systemSentinel;

    final selected = await showModalBottomSheet<String>(
      context: context,
      showDragHandle: true,
      builder: (sheetContext) => SafeArea(
        child: RadioGroup<String>(
          groupValue: currentCode,
          onChanged: (v) => Navigator.of(sheetContext).pop(v),
          child: ListView(
            shrinkWrap: true,
            children: [
              for (final code in _supportedCodes)
                RadioListTile<String>(
                  title: Text(_labelFor(l10n, code)),
                  value: code,
                ),
            ],
          ),
        ),
      ),
    );

    if (selected == null) return; // dismissed without picking
    await prefs.setLocale(selected == _systemSentinel ? null : Locale(selected));
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final prefs = context.watch<AppPreferences>();
    final currentCode = prefs.locale?.languageCode ?? _systemSentinel;

    return ListTile(
      title: Text(l10n.settingsLanguageLabel),
      trailing: Text(_labelFor(l10n, currentCode)),
      onTap: () => _openPicker(context, prefs),
    );
  }
}
