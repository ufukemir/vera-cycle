import 'package:cycle_app/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

/// The app bundles two fonts and used to render only one of them.
///
/// `ThemeData(fontFamily: 'Quicksand')` is overridden when an explicit
/// `textTheme` is supplied, and Typography's base styles arrive with the
/// platform font already set — so every body/label/title style resolved to
/// Roboto or SF. Nothing looked broken, because those are fine fonts; the
/// brand sans simply never appeared. Pin both families so a future
/// refactor cannot quietly drop one again.
void main() {
  for (final build in {'light': buildAppTheme, 'dark': buildDarkAppTheme}.entries) {
    test('${build.key} theme uses the bundled families, not the platform ones',
        () {
      final text = build.value().textTheme;

      const sansStyles = ['bodyLarge', 'bodyMedium', 'bodySmall', 'labelLarge',
          'labelMedium', 'labelSmall', 'titleMedium', 'titleSmall'];
      final resolved = <String, String?>{
        'bodyLarge': text.bodyLarge?.fontFamily,
        'bodyMedium': text.bodyMedium?.fontFamily,
        'bodySmall': text.bodySmall?.fontFamily,
        'labelLarge': text.labelLarge?.fontFamily,
        'labelMedium': text.labelMedium?.fontFamily,
        'labelSmall': text.labelSmall?.fontFamily,
        'titleMedium': text.titleMedium?.fontFamily,
        'titleSmall': text.titleSmall?.fontFamily,
      };
      for (final name in sansStyles) {
        expect(resolved[name], 'Quicksand',
            reason: '$name fell back to ${resolved[name]}');
      }

      // The serif is the deliberate exception, on headlines only.
      for (final style in [
        text.displayLarge,
        text.displayMedium,
        text.displaySmall,
        text.headlineLarge,
        text.headlineMedium,
        text.headlineSmall,
        text.titleLarge,
      ]) {
        expect(style?.fontFamily, 'Fraunces');
      }
    });
  }
}
