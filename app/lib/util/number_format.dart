import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

/// Locale-aware formatting for the decimal numbers the app shows.
///
/// `toStringAsFixed` always emits a period, so every comma-decimal locale —
/// de, fr, es, tr, id, ar, pt, it, ru, pl, cs, uk, vi, nl, el — was shown
/// `36.5 °C`, `60.5 kg` and `28.4 gün`. The giveaway was the assistant's
/// Turkish answer, which built a Turkish sentence around an English decimal
/// point. Exactly one screen in the app formatted properly; the rest was
/// accidental, not policy.
///
/// Arabic is the sharper case: `NumberFormat` renders Arabic-Indic digits
/// (٣٦٫٥) where raw interpolation renders Western ones, and the app was
/// mixing both on the same screen.
String formatDecimal(BuildContext context, double value, {int decimals = 1}) =>
    formatDecimalIn(Localizations.localeOf(context).toString(), value,
        decimals: decimals);

/// [formatDecimal] for code that has a locale name but no [BuildContext] —
/// pure services, and the PDF builder, which deliberately takes no Flutter
/// dependency.
String formatDecimalIn(String localeName, double value, {int decimals = 1}) {
  final format = NumberFormat.decimalPatternDigits(
    locale: localeName,
    decimalDigits: decimals,
  );
  return format.format(value);
}
