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

/// Only fully-translated locales are offered. 14 more exist at 100% key
/// parity in l10n_pending/ but stay parked there — CLAUDE.md requires a
/// native-speaker review before a language goes live, and those 14
/// (Bengali, Persian, Hindi, Japanese, Korean, Marathi, Swahili, Tamil,
/// Telugu, Thai, Tagalog, Urdu, Vietnamese, Chinese) have not had one.
/// The 15 added here on 2026-08-21 (Czech, Danish, Greek, Finnish,
/// Hungarian, Italian, Malay, Norwegian, Dutch, Polish, Portuguese,
/// Romanian, Russian, Swedish, Ukrainian) are a deliberate, named
/// exception to that rule — promoted on translation-quality confidence
/// rather than an actual native-speaker pass, Ufuk's explicit call.
const _supportedCodes = <String>[
  _systemSentinel,
  'en',
  'tr',
  'ar',
  'es',
  'fr',
  'de',
  'id',
  'cs',
  'da',
  'el',
  'fi',
  'hu',
  'it',
  'ms',
  'nb',
  'nl',
  'pl',
  'pt',
  'ro',
  'ru',
  'sv',
  'uk',
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
    case 'cs':
      return l10n.settingsLanguageCzech;
    case 'da':
      return l10n.settingsLanguageDanish;
    case 'el':
      return l10n.settingsLanguageGreek;
    case 'fi':
      return l10n.settingsLanguageFinnish;
    case 'hu':
      return l10n.settingsLanguageHungarian;
    case 'it':
      return l10n.settingsLanguageItalian;
    case 'ms':
      return l10n.settingsLanguageMalay;
    case 'nb':
      return l10n.settingsLanguageNorwegian;
    case 'nl':
      return l10n.settingsLanguageDutch;
    case 'pl':
      return l10n.settingsLanguagePolish;
    case 'pt':
      return l10n.settingsLanguagePortuguese;
    case 'ro':
      return l10n.settingsLanguageRomanian;
    case 'ru':
      return l10n.settingsLanguageRussian;
    case 'sv':
      return l10n.settingsLanguageSwedish;
    case 'uk':
      return l10n.settingsLanguageUkrainian;
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
    await prefs.setLocale(
      selected == _systemSentinel ? null : Locale(selected),
    );
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
