// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the le`
  String get lorem_ipsam {
    return Intl.message(
      'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the le',
      name: 'lorem_ipsam',
      desc: '',
      args: [],
    );
  }

  /// `Done`
  String get labelDone {
    return Intl.message(
      'Done',
      name: 'labelDone',
      desc: '',
      args: [],
    );
  }

  /// `Minimal Diary`
  String get labelMinimalDiary {
    return Intl.message(
      'Minimal Diary',
      name: 'labelMinimalDiary',
      desc: '',
      args: [],
    );
  }

  /// `Back`
  String get labelBack {
    return Intl.message(
      'Back',
      name: 'labelBack',
      desc: '',
      args: [],
    );
  }

  /// `Remove Diary`
  String get labelRemoveDiary {
    return Intl.message(
      'Remove Diary',
      name: 'labelRemoveDiary',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure to remove diary`
  String get labelAreYouSure {
    return Intl.message(
      'Are you sure to remove diary',
      name: 'labelAreYouSure',
      desc: '',
      args: [],
    );
  }

  /// `Yes`
  String get labelYes {
    return Intl.message(
      'Yes',
      name: 'labelYes',
      desc: '',
      args: [],
    );
  }

  /// `No`
  String get labelNo {
    return Intl.message(
      'No',
      name: 'labelNo',
      desc: '',
      args: [],
    );
  }

  /// `Close`
  String get labelClose {
    return Intl.message(
      'Close',
      name: 'labelClose',
      desc: '',
      args: [],
    );
  }

  /// `Version`
  String get labelVersion {
    return Intl.message(
      'Version',
      name: 'labelVersion',
      desc: '',
      args: [],
    );
  }

  /// `View Licenses`
  String get labelViewLicenses {
    return Intl.message(
      'View Licenses',
      name: 'labelViewLicenses',
      desc: '',
      args: [],
    );
  }

  /// `How was your day...`
  String get hintHowWasYourDay {
    return Intl.message(
      'How was your day...',
      name: 'hintHowWasYourDay',
      desc: '',
      args: [],
    );
  }

  /// `Title`
  String get hintTitle {
    return Intl.message(
      'Title',
      name: 'hintTitle',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en', countryCode: 'US'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
