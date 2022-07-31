import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_deriv_theme/src/colors.dart';
import 'package:flutter_deriv_theme/text_styles.dart';

class ThemeProviderTest {
  factory ThemeProviderTest() => _instance;

  ThemeProviderTest._internal();

  static final ThemeProviderTest _instance = ThemeProviderTest._internal();

  final Map<TextStyle, Map<Color, TextStyle>> _textStyle =
      <TextStyle, Map<Color, TextStyle>>{};

  bool _isDarkTheme =
      SchedulerBinding.instance!.window.platformBrightness == Brightness.dark;

  bool get isDarkTheme => _isDarkTheme;

  String get fontFamily => TextStyles.appFontFamily;

  TextStyle getStyleTest({
    required TextStyle? textStyle,
    required Color? color,
  }) {
    ArgumentError.checkNotNull(textStyle, 'textStyle');
    ArgumentError.checkNotNull(color, 'color');

    _textStyle.putIfAbsent(textStyle!, () => <Color, TextStyle>{});
    _textStyle[textStyle]!
        .putIfAbsent(color!, () => textStyle.copyWith(color: color));

    return _textStyle[textStyle]![color]!;
  }

  TextStyle textStyleTest({
    required TextStyle? textStyle,
    Color? color,
  }) {
    ArgumentError.checkNotNull(textStyle, 'textStyle');

    color ??= DarkThemeColors.base01;

    return getStyleTest(textStyle: textStyle, color: color);
  }

  void updateThemeTest({required Brightness brightness}) =>
      _isDarkTheme = brightness == Brightness.dark;
}
