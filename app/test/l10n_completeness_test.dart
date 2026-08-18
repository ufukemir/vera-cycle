import 'dart:convert';
import 'dart:io';

import 'package:cycle_app/l10n/app_localizations.dart';
import 'package:flutter_test/flutter_test.dart';

/// CLAUDE.md: "Yalnızca %100 çevrilmiş diller listelenir."
///
/// The risk this guards is specific. `app_*.arb` already carries translated
/// names for eight languages that have NO arb file of their own
/// (`settingsLanguagePortuguese`, `...Japanese`, `...Urdu`, …). They are
/// pre-wired bait: adding `'pt'` to `_supportedCodes` in
/// `language_picker_tile.dart` would compile, render a label, and ship a
/// mostly-English app to a Portuguese user — the exact outcome the rule
/// exists to prevent. A half-translated health app is worse than an
/// untranslated one, because the user cannot tell which half they are
/// reading.
void main() {
  final l10nDir = Directory('lib/l10n');

  Map<String, dynamic> arb(String code) => jsonDecode(
        File('${l10nDir.path}/app_$code.arb').readAsStringSync(),
      ) as Map<String, dynamic>;

  Set<String> messageKeys(Map<String, dynamic> data) =>
      data.keys.where((k) => !k.startsWith('@')).toSet();

  test('every offered locale has a complete translation file', () {
    final offered = AppLocalizations.supportedLocales
        .map((l) => l.languageCode)
        .toSet();
    final english = messageKeys(arb('en'));

    expect(offered, contains('en'));
    expect(english, isNotEmpty);

    for (final code in offered) {
      final file = File('${l10nDir.path}/app_$code.arb');
      expect(file.existsSync(), isTrue,
          reason: '$code is offered in the picker but has no .arb file');

      final keys = messageKeys(arb(code));
      expect(keys.difference(english), isEmpty,
          reason: '$code defines keys English does not');
      expect(english.difference(keys), isEmpty,
          reason: '$code is missing keys — a partially translated language '
              'must stay out of the picker until it is complete');
    }
  });

  test('no locale is offered without a generated delegate', () {
    // supportedLocales comes from the generated code, so a language listed
    // in the picker but never generated would fail here rather than at
    // runtime with a missing-delegate assertion.
    final generated = AppLocalizations.supportedLocales
        .map((l) => l.languageCode)
        .toSet();
    final onDisk = l10nDir
        .listSync()
        .whereType<File>()
        .map((f) => RegExp(r'app_([a-z]{2})\.arb$').firstMatch(f.path)?.group(1))
        .whereType<String>()
        .toSet();

    expect(generated, equals(onDisk),
        reason: 'the set of .arb files and the set of offered locales must '
            'match exactly in both directions');
  });

  test('placeholders match across every locale', () {
    // A {placeholder} present in one language and absent in another renders
    // literally, or throws, depending on the call site.
    final placeholder = RegExp(r'\{(\w+)\}');
    Set<String> names(String value) =>
        placeholder.allMatches(value).map((m) => m.group(1)!).toSet();

    final english = arb('en');
    for (final locale in AppLocalizations.supportedLocales) {
      final code = locale.languageCode;
      if (code == 'en') continue;
      final other = arb(code);

      for (final key in messageKeys(english)) {
        final a = english[key];
        final b = other[key];
        if (a is! String || b is! String) continue;
        expect(names(b), equals(names(a)),
            reason: '$code:$key uses different placeholders than English');
      }
    }
  });
}
