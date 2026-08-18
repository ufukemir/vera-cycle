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

  test('the language picker offers exactly the locales that exist', () {
    // `_supportedCodes` in language_picker_tile.dart is a hand-maintained
    // parallel list. The other tests here compare supportedLocales against
    // the .arb files — but supportedLocales is GENERATED from those files,
    // so that pair is tautologically consistent and guards nothing.
    //
    // The real failure modes this catches:
    //   * a new .arb lands and nobody adds the code, so the language is
    //     reachable only by changing the device language;
    //   * a code is added to _supportedCodes without a _labelFor case, and
    //     the picker renders the literal string "pl" as its own label.
    final source =
        File('lib/screens/settings/widgets/language_picker_tile.dart')
            .readAsStringSync();

    final listed = RegExp(r"_supportedCodes\s*=\s*<String>\[(.*?)\]",
            dotAll: true)
        .firstMatch(source)!
        .group(1)!;
    final codes = RegExp(r"'([a-z]{2})'")
        .allMatches(listed)
        .map((m) => m.group(1)!)
        .toSet();

    final generated = AppLocalizations.supportedLocales
        .map((l) => l.languageCode)
        .toSet();

    expect(codes, equals(generated),
        reason: 'the picker and the generated locales disagree');

    // Every offered code needs a real label, not the `default: return code`
    // fallback.
    for (final code in codes) {
      expect(source, contains("case '$code':"),
          reason: '$code has no _labelFor case — the picker would show the '
              'raw code as its own name');
    }
  });

  group('parked translations stay structurally in step with English', () {
    // These files are not compiled, so nothing else checks them — and that
    // is exactly how they drifted. When English gained 15 keys and 14 ICU
    // plurals, the parked files silently kept the old shape, and the bug
    // was only caught because a hand-written verification regex was
    // ALSO wrong: it used `re.match`, so it skipped `a11yFrequencyItem`,
    // whose plural does not start the string. Eleven files were then
    // reported as complete while missing it.
    //
    // Checking structure only — never wording — because these are drafts
    // awaiting native review, not shipped copy.
    final pendingDir = Directory('l10n_pending');
    final english = jsonDecode(File('lib/l10n/app_en.arb').readAsStringSync())
        as Map<String, dynamic>;
    final englishKeys =
        english.keys.where((k) => !k.startsWith('@')).toList();

    // `search`, not `match`: a plural is not always the first thing in the
    // string. That distinction is the whole reason this group exists.
    final pluralPattern = RegExp(r'\{\w+,\s*plural,');
    final pluralKeys = englishKeys
        .where((k) => english[k] is String && pluralPattern.hasMatch(english[k]))
        .toList();

    final files = pendingDir
        .listSync()
        .whereType<File>()
        .where((f) => f.path.endsWith('.arb'))
        .toList();

    test('there are parked files to check', () {
      expect(files, isNotEmpty);
      expect(pluralKeys, isNotEmpty,
          reason: 'English has no ICU plurals — the pattern is wrong');
    });

    for (final file in files) {
      final code = RegExp(r'app_(\w+)\.arb$').firstMatch(file.path)!.group(1)!;

      test('$code matches the English key set and order', () {
        final data = jsonDecode(file.readAsStringSync()) as Map<String, dynamic>;
        final keys = data.keys.where((k) => !k.startsWith('@')).toList();

        expect(keys.toSet().difference(englishKeys.toSet()), isEmpty,
            reason: '$code has keys English does not');
        expect(englishKeys.toSet().difference(keys.toSet()), isEmpty,
            reason: '$code is missing keys English has');
        expect(keys, orderedEquals(englishKeys),
            reason: '$code key order drifted, which makes diffs unreadable');
      });

      test('$code carries every ICU plural as a plural', () {
        final data = jsonDecode(file.readAsStringSync()) as Map<String, dynamic>;
        final flat = pluralKeys
            .where((k) => data[k] is String && !data[k].contains(', plural,'))
            .toList();
        expect(flat, isEmpty,
            reason: '$code still has flat strings where English pluralises: '
                '$flat');
      });

      test('$code uses the same placeholders as English', () {
        final data = jsonDecode(file.readAsStringSync()) as Map<String, dynamic>;
        final names = RegExp(r'\{(\w+)[,}]');
        Set<String> of(String v) =>
            names.allMatches(v).map((m) => m.group(1)!).toSet();

        for (final key in englishKeys) {
          if (english[key] is! String || data[key] is! String) continue;
          expect(of(data[key]), equals(of(english[key])),
              reason: '$code:$key placeholder mismatch');
        }
      });
    }
  });
}
