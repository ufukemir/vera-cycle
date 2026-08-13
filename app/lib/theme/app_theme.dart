import 'package:flutter/material.dart';

/// A deliberately neutral palette — teal/slate, not pink or floral.
///
/// Mainstream period-tracker UIs default to pink, which repeatedly surfaces
/// as a dysphoria trigger for trans/non-binary users in their own words (see
/// docs/03-rakip-analizi.md). Clue is the one competitor consistently named
/// as getting this right; this app follows the same default rather than
/// treating a neutral palette as an optional "inclusive mode".
ThemeData buildAppTheme() {
  final colorScheme = ColorScheme.fromSeed(
    seedColor: const Color(0xFF2F6F6B),
    brightness: Brightness.light,
  );
  return ThemeData(
    useMaterial3: true,
    colorScheme: colorScheme,
    scaffoldBackgroundColor: colorScheme.surface,
    appBarTheme: AppBarTheme(
      backgroundColor: colorScheme.surface,
      foregroundColor: colorScheme.onSurface,
      elevation: 0,
    ),
  );
}
