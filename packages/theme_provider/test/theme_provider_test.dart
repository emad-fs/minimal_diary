import 'package:flutter/material.dart';
import 'package:flutter_deriv_theme/src/colors.dart';
import 'package:flutter_deriv_theme/text_styles.dart';
import 'package:flutter_test/flutter_test.dart';

import 'theme_provider.dart';

ValueKey<String> key = const ValueKey<String>('ok');

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('ThemeProviderTest', () {
    late ThemeProviderTest themeProviderTest;

    setUpAll(() => themeProviderTest = ThemeProviderTest());

    group('getStyleTest()', () {
      test('pass all arguments correctly', () {
        themeProviderTest.getStyleTest(
          textStyle: TextStyles.captionBold,
          color: DarkThemeColors.base08,
        );
      });

      test('getStyle() returns a TextStyle', () {
        const TextStyle resultStyle = TextStyle(
            color: Color(0xFFFFFFFF),
            fontFamily: 'IBMPlexSans',
            fontSize: 34,
            fontWeight: FontWeight.w400,
            height: 1.5);

        final TextStyle style = themeProviderTest.getStyleTest(
          textStyle: TextStyles.display1,
          color: DarkThemeColors.base01,
        );

        expect(style, equals(resultStyle));
      });

      test('do not accept null values', () {
        expect(
          () => themeProviderTest.getStyleTest(
            textStyle: null,
            color: null,
          ),
          throwsArgumentError,
        );
      });
    });

    group('textStyleTest()', () {
      test('pass arguments correctly', () {
        themeProviderTest.textStyleTest(
          textStyle: TextStyles.display1,
          color: DarkThemeColors.base02,
        );
      });

      test('textStyle() returns a TextStyle', () {
        const TextStyle resultStyle = TextStyle(
            color: Color(0xFFEAECED),
            fontFamily: 'IBMPlexSans',
            fontSize: 34,
            fontWeight: FontWeight.w400,
            height: 1.5);

        final TextStyle style = themeProviderTest.textStyleTest(
          textStyle: TextStyles.display1,
          color: DarkThemeColors.base02,
        );

        expect(style, equals(resultStyle));
      });

      test('do not accept null type', () {
        expect(
          () => themeProviderTest.textStyleTest(
            textStyle: null,
          ),
          throwsArgumentError,
        );
      });

      test('accepts no color', () {
        themeProviderTest.textStyleTest(
          textStyle: TextStyles.display1,
        );
      });

      test('accepts null color', () {
        themeProviderTest.textStyleTest(
          textStyle: TextStyles.display1,
        );
      });

      test('accepts color', () {
        themeProviderTest.textStyleTest(
          textStyle: TextStyles.display1,
          color: DarkThemeColors.base01,
        );
      });
    });

    group('updateThemeTest()', () {
      test('_isDarkTheme changes based on brightness value', () {
        themeProviderTest.updateThemeTest(brightness: Brightness.dark);
        expect(themeProviderTest.isDarkTheme, isTrue);

        themeProviderTest.updateThemeTest(brightness: Brightness.light);
        expect(themeProviderTest.isDarkTheme, isFalse);
      });
    });
  });
}
