# flutter_deriv_theme

A flutter package that contains the theme used by Deriv products

## Getting Started

This package contains theme details associated with Deriv guidelines such as color codes, font families, font appearance & style, and dark/light theme control.

## Installing

### 1. Depend on it

In order to use the package, import it to the root of the Flutter project and register it to `pubspec.yaml` file as follows

```yaml
dependencies:

  flutter_deriv_theme:
    path: ./flutter_deriv_theme/
```

### 2. Install it

run `flutter pub get` from the command line.

### 3. Import it

```dart
import 'package:flutter_deriv_theme/theme_provider.dart';
```

## Example

Add a style for a text. You can choose any style type provided, for the full list, see `text_styles.dart`

```dart
Text(
   'Text',
   style: AppThemeProvider.of(context).textStyle(textStyle: TextStyles.display1),
)
```

Add a style for a text and specify a color. For the full list of colors, see `colors.dart`

```dart
Text(
   'Text',
   style: AppThemeProvider.of(context).textStyle(
     textStyle: TextStyles.body2,
     color: _themeProvider.base05Color,
   ),
)
```

Theme provider package allows accessing dimensions values such as margins and border radius in different variations, for example;
```dart

// possible values: margin04, margin08, margin12, margin16, margin24, margin32
margin: const EdgeInsets.symmetric(horizontal: ThemeProvider.margin08),

// possible values: borderRadius04, borderRadius08
borderRadius: BorderRadius.circular(ThemeProvider.borderRadius08)

```