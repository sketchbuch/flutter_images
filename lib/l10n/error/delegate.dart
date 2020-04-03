import 'dart:async';
import 'package:flutter_images/l10n/error/translations.dart';
import 'package:flutter/material.dart';

class ErrorTranslationsDelegate extends LocalizationsDelegate<ErrorTranslations> {
  const ErrorTranslationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return ['en'].contains(locale.languageCode);
  }

  @override
  Future<ErrorTranslations> load(Locale locale) {
    return ErrorTranslations.load(locale);
  }

  @override
  bool shouldReload(LocalizationsDelegate<ErrorTranslations> old) {
    return false;
  }
}
