@Tags(['screenshots'])
library;

import 'dart:io';

import 'package:cycle_app/l10n/app_localizations.dart';
import 'package:cycle_app/models/day_log.dart';
import 'package:cycle_app/models/enums.dart';
import 'package:cycle_app/screens/calendar/calendar_screen.dart';
import 'package:cycle_app/screens/day_log/day_log_screen.dart';
import 'package:cycle_app/screens/home/home_screen.dart';
import 'package:cycle_app/screens/insights/insights_screen.dart';
import 'package:cycle_app/screens/premium/premium_screen.dart';
import 'package:cycle_app/services/in_memory_day_log_repository.dart';
import 'package:cycle_app/services/pin_vault.dart';
import 'package:cycle_app/services/reminder_service.dart';
import 'package:cycle_app/state/app_preferences.dart';
import 'package:cycle_app/state/cycle_controller.dart';
import 'package:cycle_app/state/cloud_backup_controller.dart';
import 'package:cycle_app/state/partner_controller.dart';
import 'package:cycle_app/theme/app_theme.dart';
import 'package:cycle_app/widgets/illustrations.dart';
import 'package:cycle_app/util/day.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Generates the store screenshots.
///
/// Tagged so it does not run in the normal suite: `flutter test` excludes it
/// (see `dart_test.yaml`), and it is produced on demand with
/// `flutter test --tags screenshots --update-goldens`.
///
/// Rendered here rather than driven on a simulator, deliberately:
///   * the stores want EXACT pixel dimensions, which `physicalSize` +
///     `devicePixelRatio` give directly — a simulator gives whatever that
///     device happens to be;
///   * it is deterministic and needs no booted device, so it can be redone
///     for every locale without babysitting;
///   * the app's own lock screen makes `MainApp` unreachable from a cold
///     start anyway (AppLockController starts locked), so a simulator run
///     would need a debug entry point that ships in the binary.
///
/// The one thing this had to get right is fonts. Widget tests normally
/// render with the Ahem test font — every glyph a filled box — which is why
/// the existing goldens look like redacted documents and are useless as
/// marketing images. [_loadFonts] registers the real bundled faces.
const _devices = <String, _Device>{
  // App Store 6.9" (iPhone 17 Pro Max class) — the required primary size.
  'ios-6.9': _Device(width: 1290, height: 2796, ratio: 3),
  // App Store 6.5" — still required for older device families.
  'ios-6.5': _Device(width: 1242, height: 2688, ratio: 3),
  // Play phone screenshots: no fixed size, 1080x1920 is the safe default.
  'android-phone': _Device(width: 1080, height: 1920, ratio: 3),
};

class _Device {
  const _Device({
    required this.width,
    required this.height,
    required this.ratio,
  });

  final double width;
  final double height;
  final double ratio;

  Size get logical => Size(width / ratio, height / ratio);
}

/// Locales to shoot. Stores fall back to the default set for any language
/// without its own images, so this is a choice about effort, not coverage —
/// see docs/06-ekran-goruntuleri.md.
const _locales = ['en', 'tr'];

Future<void> _loadFont(String family, String path) async {
  final loader = FontLoader(family)
    ..addFont(File(path).readAsBytes().then((b) => ByteData.sublistView(b)));
  await loader.load();
}

Future<void> _loadFonts() async {
  for (final family in ['Quicksand', 'Fraunces']) {
    await _loadFont(family, 'assets/fonts/$family-Variable.ttf');
  }

  // Icons are a font too, and an unloaded one renders as the same box as
  // unloaded text — which looked like a layout bug in the first draft of
  // these images. It ships inside the SDK rather than the app, so it is
  // located relative to the running Flutter install instead of assets/.
  final flutterRoot =
      Platform.environment['FLUTTER_ROOT'] ?? _flutterRootFromDartExecutable();
  final icons = File(
    '$flutterRoot/bin/cache/artifacts/material_fonts/MaterialIcons-Regular.otf',
  );
  if (icons.existsSync()) {
    await _loadFont('MaterialIcons', icons.path);
  } else {
    // Not fatal: the images are still generated, just with box glyphs
    // where icons should be. Loud enough to notice in the log.
    // ignore: avoid_print
    print(
      'WARNING: MaterialIcons not found at ${icons.path} — icons will '
      'render as boxes. Set FLUTTER_ROOT.',
    );
  }
}

/// `dart` lives at `<flutter>/bin/cache/dart-sdk/bin/dart` when the test is
/// run through `flutter test`, so the root is four levels up.
String _flutterRootFromDartExecutable() =>
    File(Platform.resolvedExecutable).parent.parent.parent.parent.parent.path;

Future<Widget> _app(Widget screen, String locale) async {
  SharedPreferences.setMockInitialValues({
    'onboarding_complete': true,
    // Premium on: the screenshots should show the app at its best, and the
    // paid backgrounds are part of what is being sold.
    'premium_active': true,
  });
  final prefs = await AppPreferences.load();
  final controller = CycleController(repository: InMemoryDayLogRepository());

  // Three cycles, deliberately NOT identical lengths (31, 29, 28). Perfectly
  // regular data made the app advertise "Varies by about 0.0 days", which is
  // both unrealistic and off-message for a product whose whole pitch is
  // honest uncertainty.
  for (final start in [-88, -57, -28]) {
    for (var i = 0; i < 5; i++) {
      await controller.upsertDay(
        DayLog(
          date: addDays(today(), start + i),
          flow: i < 2 ? FlowIntensity.medium : FlowIntensity.light,
          symptoms: i < 2 ? const {Symptom.cramps} : const {Symptom.fatigue},
          mood: i < 2 ? Mood.low : Mood.calm,
          weightKg: 61.5,
          sleepMinutes: 450,
          waterIntakeMl: 1600,
        ),
      );
    }
  }

  return MultiProvider(
    providers: [
      ChangeNotifierProvider<AppPreferences>.value(value: prefs),
      ChangeNotifierProvider<CycleController>.value(value: controller),
      Provider<PinVault>(create: (_) => PinVault()),
      Provider<ReminderService>(create: (_) => ReminderService()),
      // Same reasoning as all_screens_smoke_test.dart: PartnerInviteCard
      // reads this unconditionally on build.
      ChangeNotifierProvider<PartnerController>(
        create: (_) => PartnerController()..init(),
      ),
      ChangeNotifierProvider<CloudBackupController>(
        create: (_) => CloudBackupController()..init(),
      ),
    ],
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: buildAppTheme(),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale(locale),
      home: screen,
    ),
  );
}

void main() {
  setUpAll(_loadFonts);

  final screens = <String, Widget Function()>{
    '1_home': () => const HomeScreen(),
    '2_calendar': () => const CalendarScreen(),
    '3_daylog': () => DayLogScreen(date: today()),
    '4_insights': () => const InsightsScreen(),
    '5_premium': () => const PremiumScreen(),
  };

  for (final locale in _locales) {
    for (final device in _devices.entries) {
      for (final screen in screens.entries) {
        testWidgets('$locale/${device.key}/${screen.key}', (tester) async {
          tester.view.physicalSize = Size(
            device.value.width,
            device.value.height,
          );
          tester.view.devicePixelRatio = device.value.ratio;
          addTearDown(tester.view.resetPhysicalSize);
          addTearDown(tester.view.resetDevicePixelRatio);

          await tester.pumpWidget(await _app(screen.value(), locale));

          // The scenic photos decode asynchronously; without a real async
          // window they render as grey placeholders, which is the other
          // half of why the existing goldens are unusable.
          await tester.runAsync(() async {
            for (final element in find.byType(Image).evaluate()) {
              final image = element.widget as Image;
              await precacheImage(image.image, element);
            }
          });
          for (var i = 0; i < 8; i++) {
            await tester.pump(const Duration(milliseconds: 200));
          }

          await expectLater(
            find.byType(MaterialApp),
            matchesGoldenFile(
              '../../fastlane/screenshots/$locale/${device.key}/${screen.key}.png',
            ),
          );
        });
      }
    }
  }

  /// The App Store subtitle for [locale], which is the product's own
  /// one-line promise and is already length-checked for the store.
  String taglineFor(String locale) {
    final dir = locale == 'en' ? 'en-US' : locale;
    return File(
      '../fastlane/metadata/ios/$dir/subtitle.txt',
    ).readAsStringSync().trim();
  }

  // Play requires a 1024x500 feature graphic for every listing and will not
  // let you publish without one. Built here rather than in a design tool so
  // it stays in sync with the palette and can be regenerated per locale.
  //
  // No screenshot inside it and no device frame: Play crops and scales this
  // aggressively across surfaces, and text below ~40pt becomes unreadable.
  // One line, one mark, brand colours.
  for (final locale in _locales) {
    testWidgets('$locale/feature-graphic', (tester) async {
      tester.view.physicalSize = const Size(1024, 500);
      tester.view.devicePixelRatio = 1;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);

      await tester.pumpWidget(
        MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: buildAppTheme(),
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          locale: Locale(locale),
          home: _FeatureGraphic(tagline: taglineFor(locale)),
        ),
      );
      await tester.pump(const Duration(milliseconds: 200));

      await expectLater(
        find.byType(MaterialApp),
        matchesGoldenFile(
          '../../fastlane/screenshots/$locale/feature-graphic.png',
        ),
      );
    });
  }
}

/// The Play feature graphic: app name, the one-line promise, and the mascot.
class _FeatureGraphic extends StatelessWidget {
  const _FeatureGraphic({required this.tagline});

  final String tagline;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);

    return DecoratedBox(
      decoration: const BoxDecoration(gradient: AppPalette.heroGradient),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 64),
        child: Row(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    l10n.appTitle,
                    style: theme.textTheme.displayLarge?.copyWith(
                      fontSize: 88,
                      color: AppPalette.roseDeep,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    // Read from the store metadata rather than the app's
                    // strings, so the graphic and the listing can never
                    // drift apart. The App Store subtitle is capped at 30
                    // characters, which is also about the most that stays
                    // legible after Play's cropping.
                    tagline,
                    style: theme.textTheme.headlineSmall?.copyWith(
                      fontSize: 34,
                      color: AppPalette.roseDeep,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 32),
            const MascotAvatar(mascot: Mascot.droplet, size: 220),
          ],
        ),
      ),
    );
  }
}
