import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_images/l10n/login/localizations.dart';

class LoginLocalizationsDelegate extends LocalizationsDelegate<LoginLocalizations> {
  const LoginLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return ['en'].contains(locale.languageCode);
  }

  @override
  Future<LoginLocalizations> load(Locale locale) {
    return LoginLocalizations.load(locale);
  }

  @override
  bool shouldReload(LocalizationsDelegate<LoginLocalizations> old) {
    return false;
  }
}
