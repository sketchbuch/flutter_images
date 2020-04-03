import 'dart:async';
import 'package:flutter_images/l10n/error/messages/messages_all.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// flutter pub pub run intl_translation:extract_to_arb --output-dir=lib/l10n/error/source lib/l10n/error/translations.dart
// flutter pub pub run intl_translation:generate_from_arb --output-dir=lib/l10n/error/messages lib/l10n/error/translations.dart lib/l10n/error/source/intl_en.arb

class ErrorTranslations {
  static Future<ErrorTranslations> load(Locale locale) {
    final String name = locale.countryCode == null ? locale.languageCode : locale.toString();
    final String localeName = Intl.canonicalizedLocale(name);

    return initializeMessages(localeName).then((bool _) {
      Intl.defaultLocale = localeName;
      return new ErrorTranslations();
    });
  }

  static ErrorTranslations of(BuildContext context) {
    return Localizations.of<ErrorTranslations>(context, ErrorTranslations);
  }

  String get title {
    return Intl.message('Flutter Images Error', name: 'title', desc: 'The title of the error screen');
  }

  String get message {
    return Intl.message('An error occured:', name: 'message');
  }
}
