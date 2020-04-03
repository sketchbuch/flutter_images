import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_images/l10n/core/localizations.dart';

class CoreLocalizationsDelegate extends LocalizationsDelegate<CoreLocalizations> {
  const CoreLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return ['en'].contains(locale.languageCode);
  }

  @override
  Future<CoreLocalizations> load(Locale locale) {
    return CoreLocalizations.load(locale);
  }

  @override
  bool shouldReload(LocalizationsDelegate<CoreLocalizations> old) {
    return false;
  }
}
