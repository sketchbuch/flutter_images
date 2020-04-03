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

  String get title {
    return Intl.message('Flutter Images', name: 'title', desc: 'The title of the login screen');
  }

  String get message {
    return Intl.message('Login to Google Images', name: 'message');
  }

  // Username Field
  String get unLabel {
    return Intl.message('Email', name: 'unLabel');
  }

  String get unPlaceholder {
    return Intl.message('Enter your email', name: 'unPlaceholder');
  }

  String get unEmailError {
    return Intl.message('Please enter a valid email', name: 'unEmailError');
  }

  String get unEmptyError {
    return Intl.message('Please enter your email', name: 'unEmptyError');
  }

  // Password Field
  String get pwLabel {
    return Intl.message('Password', name: 'pwLabel');
  }

  String get pwPlaceholder {
    return Intl.message('Enter your password', name: 'pwPlaceholder');
  }

  String get pwEmptyError {
    return Intl.message('Please enter your password', name: 'pwEmptyError');
  }

  // Login Button
  String get btnLabel {
    return Intl.message('Login', name: 'btnLabel');
  }
}
