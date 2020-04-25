import 'dart:async';
import 'package:flutter_images/l10n/login/delegate.dart';
import 'package:flutter_images/l10n/login/messages/messages_all.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// flutter pub pub run intl_translation:extract_to_arb --output-dir=lib/l10n/login/source lib/l10n/login/localizations.dart
// flutter pub pub run intl_translation:generate_from_arb --output-dir=lib/l10n/login/messages lib/l10n/login/localizations.dart lib/l10n/login/source/intl_en.arb

class LoginLocalizations {
  static const LoginLocalizationsDelegate delegate = LoginLocalizationsDelegate();

  static Future<LoginLocalizations> load(Locale locale) {
    final String name = locale.countryCode == null ? locale.languageCode : locale.toString();
    final String localeName = Intl.canonicalizedLocale(name);

    return initializeMessages(localeName).then((bool _) {
      Intl.defaultLocale = localeName;
      return new LoginLocalizations();
    });
  }

  static LoginLocalizations of(BuildContext context) {
    return Localizations.of<LoginLocalizations>(context, LoginLocalizations);
  }

  String get lTitle {
    return Intl.message('Login to Flutter Images', name: 'lTitle', desc: 'The title of the login screen');
  }

  String get lSigninButton {
    return Intl.message('Sign in with Google', name: 'lSigninButton');
  }

  String get lSignoutButton {
    return Intl.message('Log out', name: 'lSignoutButton');
  }
}
