import 'package:home_widget/home_widget.dart';

/// Pushes a small, deliberately minimal snapshot to the OS home-screen
/// widget.
///
/// Only three short strings cross this boundary — a phase label, a
/// headline, and a countdown line. No symptoms, no notes, no dates.
/// Widget data lives in a shared container that other apps on the device
/// cannot read, but it *is* rendered on a lock screen, so the rule here
/// is: nothing that would embarrass someone if a stranger glanced at
/// their phone.
class HomeWidgetService {
  const HomeWidgetService();

  /// iOS App Group / Android provider names. The iOS one must match the
  /// App Group configured in Xcode once the widget extension is added.
  static const iOSAppGroupId = 'group.com.ufukemir.cycleApp';
  static const androidProviderName = 'VeraWidgetProvider';
  static const iOSWidgetName = 'VeraWidget';

  static const keyEyebrow = 'vera_eyebrow';
  static const keyHeadline = 'vera_headline';
  static const keySecondary = 'vera_secondary';

  Future<void> update({
    required String eyebrow,
    required String headline,
    String? secondary,
  }) async {
    try {
      await HomeWidget.setAppGroupId(iOSAppGroupId);
      await HomeWidget.saveWidgetData<String>(keyEyebrow, eyebrow);
      await HomeWidget.saveWidgetData<String>(keyHeadline, headline);
      await HomeWidget.saveWidgetData<String>(keySecondary, secondary ?? '');
      await HomeWidget.updateWidget(
        name: androidProviderName,
        androidName: androidProviderName,
        iOSName: iOSWidgetName,
      );
    } on Object {
      // A missing widget extension, an unconfigured App Group, or a
      // platform without home widgets must never take the app down —
      // this is decoration, not a feature the app depends on.
    }
  }
}
