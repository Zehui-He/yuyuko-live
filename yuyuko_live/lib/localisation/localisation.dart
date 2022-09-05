import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

/// This repository manages localised strings from the Game Data
class Localisation {
  static const localizationsDelegates = AppLocalizations.localizationsDelegates;
  static const supportedLocales = AppLocalizations.supportedLocales;

  /// The wrapper of [AppLocalizations].
  static AppLocalizations of(BuildContext context) {
    final i10n = AppLocalizations.of(context);
    if (i10n == null) {
      throw Exception('AppLocalizations is not working as expected.');
    }

    return i10n;
  }

  static Locale? localeResolutionCallback(
    Locale? locale,
    Iterable<Locale> supportedLocale,
  ) {
    for (final supported in supportedLocales) {
      if (supported.languageCode == locale?.languageCode) {
        return supported;
      }
    }

    return locale;
  }

  /// The list of valid game languages.
  static const validGameLanguages = ['en', 'zh'];
}
