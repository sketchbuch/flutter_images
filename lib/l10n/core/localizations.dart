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

  String get cAppTitle {
    return Intl.message('Flutter Images', name: 'cAppTitle', desc: 'The app title (used on app screen)');
  }

  String get cTitle {
    return Intl.message('Flutter Images', name: 'cTitle', desc: 'The title for the screens without there own title');
  }

  String get cMessage {
    return Intl.message('Welcome to Flutter Images', name: 'cMessage');
  }

  /// Generics
  String get cCancel {
    return Intl.message('cCancel', name: 'cancel');
  }

  String get cOk {
    return Intl.message('cOk', name: 'ok');
  }

  String get cYes {
    return Intl.message('cYes', name: 'yes');
  }

  String get cNo {
    return Intl.message('cNo', name: 'no');
  }
}
