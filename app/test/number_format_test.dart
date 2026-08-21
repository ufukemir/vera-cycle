import 'package:cycle_app/util/number_format.dart';
import 'package:flutter_test/flutter_test.dart';

/// [formatDecimalIn] grouped by default (`36.5 °C`, `1.234 adım`), which is
/// wrong for a value no locale ever groups — a calendar year. `2.000` in the
/// birth-year wheel read as the number two, not the year two thousand.
void main() {
  group('formatDecimalIn grouping', () {
    test('groups by default', () {
      expect(formatDecimalIn('en', 2000, decimals: 0), '2,000');
      expect(formatDecimalIn('tr', 2000, decimals: 0), '2.000');
    });

    test('useGrouping: false leaves a plain year', () {
      expect(
        formatDecimalIn('en', 2000, decimals: 0, useGrouping: false),
        '2000',
      );
      expect(
        formatDecimalIn('tr', 2000, decimals: 0, useGrouping: false),
        '2000',
      );
    });
  });
}
