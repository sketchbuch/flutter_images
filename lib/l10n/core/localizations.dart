import 'dart:async';
import 'package:flutter_images/l10n/core/delegate.dart';
import 'package:flutter_images/l10n/core/messages/messages_all.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// flutter pub pub run intl_translation:extract_to_arb --output-dir=lib/l10n/core/source lib/l10n/core/localizations.dart
// flutter pub pub run intl_translation:generate_from_arb --output-dir=lib/l10n/core/messages lib/l10n/core/localizations.dart lib/l10n/core/source/intl_en.arb

class CoreLocalizations {
  static const CoreLocalizationsDelegate delegate = CoreLocalizationsDelegate();

  static Future<CoreLocalizations> load(Locale locale) {
    final String name = locale.countryCode == null ? locale.languageCode : locale.toString();
    final String localeName = Intl.canonicalizedLocale(name);

    return initializeMessages(localeName).then((bool _) {
      Intl.defaultLocale = localeName;
      return new CoreLocalizations();
    });
  }

  static CoreLocalizations of(BuildContext context) {
    return Localizations.of<CoreLocalizations>(context, CoreLocalizations);
  }

  String get appTitle {
    return Intl.message('Flutter Images', name: 'appTitle', desc: 'The app title (used on app screen)');
  }

  String get title {
    return Intl.message('Flutter Images', name: 'title', desc: 'The title for the screens without there own title');
  }

  String get message {
    return Intl.message('Welcome to Flutter Images', name: 'message');
  }

  /// Generics
  String get cancel {
    return Intl.message('Cancel', name: 'cancel');
  }

  String get ok {
    return Intl.message('OK', name: 'ok');
  }

  String get yes {
    return Intl.message('Yes', name: 'yes');
  }

  String get no {
    return Intl.message('No', name: 'no');
  }
}
