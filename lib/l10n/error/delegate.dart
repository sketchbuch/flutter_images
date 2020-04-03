import 'dart:async';
import 'package:flutter_images/l10n/error/localizations.dart';
import 'package:flutter/material.dart';

class ErrorLocalizationsDelegate extends LocalizationsDelegate<ErrorLocalizations> {
  const ErrorLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return ['en'].contains(locale.languageCode);
  }

  @override
  Future<ErrorLocalizations> load(Locale locale) {
    return ErrorLocalizations.load(locale);
  }

  @override
  bool shouldReload(LocalizationsDelegate<ErrorLocalizations> old) {
    return false;
  }
}
