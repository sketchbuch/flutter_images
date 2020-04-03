import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_images/l10n/login/translations.dart';

class LoginTranslationsDelegate extends LocalizationsDelegate<LoginTranslations> {
  const LoginTranslationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return ['en'].contains(locale.languageCode);
  }

  @override
  Future<LoginTranslations> load(Locale locale) {
    return LoginTranslations.load(locale);
  }

  @override
  bool shouldReload(LocalizationsDelegate<LoginTranslations> old) {
    return false;
  }
}
