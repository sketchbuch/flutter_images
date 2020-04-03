import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_images/l10n/core/translations.dart';

class CoreTranslationsDelegate extends LocalizationsDelegate<CoreTranslations> {
  const CoreTranslationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return ['en'].contains(locale.languageCode);
  }

  @override
  Future<CoreTranslations> load(Locale locale) {
    return CoreTranslations.load(locale);
  }

  @override
  bool shouldReload(LocalizationsDelegate<CoreTranslations> old) {
    return false;
  }
}
