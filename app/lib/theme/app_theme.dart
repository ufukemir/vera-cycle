import 'package:flutter/material.dart';

/// A warm, rose/terracotta/gold palette — deliberately not the pastel-pink-
/// and-flowers cliché research flagged as alienating (see
/// docs/03-rakip-analizi.md), and deliberately not the clinical neutral this
/// app started with either. Warmth and inclusivity aren't actually opposed:
/// the goal here is "feels considered and cared-for," not "coded strictly
/// feminine by convention." Hand-picked tokens rather than a single
/// `ColorScheme.fromSeed` hue, so the fertile-window gold and the period-mark
/// rose read as intentional choices, not whatever a seed algorithm produced.
class AppPalette {
  AppPalette._();

  static const rose = Color(0xFFB5406B);
  static const roseDeep = Color(0xFF7A2647);
  static const roseSoft = Color(0xFFFFD9E4);
  static const roseSoftText = Color(0xFF5C1030);

  static const terracotta = Color(0xFFE08E6D);
  static const terracottaSoft = Color(0xFFFFE3D4);
  static const terracottaSoftText = Color(0xFF6B3315);

  static const gold = Color(0xFFC9942F);
  static const goldSoft = Color(0xFFFCE8BC);
  static const goldSoftText = Color(0xFF513C0A);

  static const cream = Color(0xFFFFF8F5);
  static const plum = Color(0xFF3A2A2E);
  static const error = Color(0xFFBA3D3D);

  /// Warm gradient used behind hero/illustration moments (onboarding,
  /// celebratory states) — never behind dense text, for contrast's sake.
  static const heroGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [roseSoft, terracottaSoft],
  );
}

ThemeData buildAppTheme() {
  final base = ColorScheme.fromSeed(
    seedColor: AppPalette.rose,
    brightness: Brightness.light,
  );

  final colorScheme = base.copyWith(
    primary: AppPalette.rose,
    onPrimary: Colors.white,
    primaryContainer: AppPalette.roseSoft,
    onPrimaryContainer: AppPalette.roseSoftText,
    secondary: AppPalette.terracotta,
    onSecondary: Colors.white,
    secondaryContainer: AppPalette.terracottaSoft,
    onSecondaryContainer: AppPalette.terracottaSoftText,
    tertiary: AppPalette.gold,
    onTertiary: Colors.white,
    tertiaryContainer: AppPalette.goldSoft,
    onTertiaryContainer: AppPalette.goldSoftText,
    error: AppPalette.error,
    surface: AppPalette.cream,
    onSurface: AppPalette.plum,
  );

  final textTheme = _buildTextTheme(colorScheme);

  return ThemeData(
    useMaterial3: true,
    colorScheme: colorScheme,
    scaffoldBackgroundColor: colorScheme.surface,
    fontFamily: 'Quicksand',
    textTheme: textTheme,
    appBarTheme: AppBarTheme(
      backgroundColor: colorScheme.surface,
      foregroundColor: colorScheme.onSurface,
      elevation: 0,
      titleTextStyle: textTheme.titleLarge,
    ),
    cardTheme: CardThemeData(
      elevation: 0,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: BorderSide(color: colorScheme.outlineVariant.withValues(alpha: 0.4)),
      ),
    ),
    chipTheme: ChipThemeData(
      shape: const StadiumBorder(),
      side: BorderSide(color: colorScheme.outlineVariant),
      selectedColor: colorScheme.primaryContainer,
      labelStyle: textTheme.labelLarge,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
    ),
    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
        shape: const StadiumBorder(),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        textStyle: textTheme.labelLarge,
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        shape: const StadiumBorder(),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        textStyle: textTheme.labelLarge,
      ),
    ),
    navigationBarTheme: NavigationBarThemeData(
      backgroundColor: Colors.white,
      indicatorColor: colorScheme.primaryContainer,
      elevation: 0,
    ),
  );
}

/// Fraunces (a warm, soft-optical-size serif) for anything that should feel
/// considered — headlines, the cycle-day number. Quicksand (rounded sans)
/// for everything read at length, so the warmth doesn't cost legibility.
TextTheme _buildTextTheme(ColorScheme colorScheme) {
  const serif = 'Fraunces';
  final base = Typography.material2021(colorScheme: colorScheme).black;
  return base.copyWith(
    displayLarge: base.displayLarge?.copyWith(fontFamily: serif, fontWeight: FontWeight.w600),
    displayMedium: base.displayMedium?.copyWith(fontFamily: serif, fontWeight: FontWeight.w600),
    displaySmall: base.displaySmall?.copyWith(fontFamily: serif, fontWeight: FontWeight.w600),
    headlineLarge: base.headlineLarge?.copyWith(fontFamily: serif, fontWeight: FontWeight.w600),
    headlineMedium: base.headlineMedium?.copyWith(fontFamily: serif, fontWeight: FontWeight.w600),
    headlineSmall: base.headlineSmall?.copyWith(fontFamily: serif, fontWeight: FontWeight.w600),
    titleLarge: base.titleLarge?.copyWith(fontFamily: serif, fontWeight: FontWeight.w600),
  );
}
