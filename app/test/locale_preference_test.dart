import 'package:cycle_app/state/app_preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// The language preference stored only `languageCode`.
///
/// That silently discarded script and region, so `zh-Hans` vs `zh-Hant` and
/// `pt-BR` vs `pt-PT` could not be represented — and those are exactly the
/// distinctions the parked Chinese and Portuguese translations need. It had
/// to be widened before either ships, because migrating a stored key after
/// users have one is worse than widening it now.
void main() {
  group('tag round-trip', () {
    final cases = <String, Locale>{
      'en': const Locale('en'),
      'pt-BR': const Locale('pt', 'BR'),
      'zh-Hans': Locale.fromSubtags(languageCode: 'zh', scriptCode: 'Hans'),
      'zh-Hant-TW': Locale.fromSubtags(
          languageCode: 'zh', scriptCode: 'Hant', countryCode: 'TW'),
      'sr-Cyrl-RS': Locale.fromSubtags(
          languageCode: 'sr', scriptCode: 'Cyrl', countryCode: 'RS'),
    };

    cases.forEach((tag, locale) {
      test('$tag survives serialise → parse', () {
        expect(AppPreferences.localeTag(locale), tag);
        final parsed = AppPreferences.parseLocale(tag);
        expect(parsed.languageCode, locale.languageCode);
        expect(parsed.scriptCode, locale.scriptCode);
        expect(parsed.countryCode, locale.countryCode);
      });
    });
  });

  test('subtags are identified by shape, not by position', () {
    // The point of shape-matching: zh-Hans and zh-TW put a script and a
    // region in the same slot, and only their form tells them apart.
    final script = AppPreferences.parseLocale('zh-Hans');
    expect(script.scriptCode, 'Hans');
    expect(script.countryCode, isNull);

    final region = AppPreferences.parseLocale('zh-TW');
    expect(region.scriptCode, isNull);
    expect(region.countryCode, 'TW');

    // Numeric UN M.49 regions are regions too.
    expect(AppPreferences.parseLocale('es-419').countryCode, '419');
  });

  test('casing is normalised the way BCP-47 writes it', () {
    final parsed = AppPreferences.parseLocale('ZH-hans-tw');
    expect(parsed.languageCode, 'zh');
    expect(parsed.scriptCode, 'Hans');
    expect(parsed.countryCode, 'TW');
  });

  test('an underscore-separated tag still reads', () {
    // Some tooling writes pt_BR; accepting it costs nothing and a stored
    // value that fails to parse would silently reset the user's language.
    final parsed = AppPreferences.parseLocale('pt_BR');
    expect(parsed.languageCode, 'pt');
    expect(parsed.countryCode, 'BR');
  });

  test('a bare language code stored by the old version still loads', () async {
    // No migration step exists, so the old format has to keep working.
    SharedPreferences.setMockInitialValues({'locale': 'tr'});
    final prefs = await AppPreferences.load();
    expect(prefs.locale, const Locale('tr'));
  });

  test('setting and clearing round-trips through storage', () async {
    SharedPreferences.setMockInitialValues({});
    final prefs = await AppPreferences.load();
    expect(prefs.locale, isNull, reason: 'default is follow-the-system');

    await prefs.setLocale(
        Locale.fromSubtags(languageCode: 'zh', scriptCode: 'Hant'));
    expect(prefs.locale?.scriptCode, 'Hant');

    await prefs.setLocale(null);
    expect(prefs.locale, isNull);
  });
}
