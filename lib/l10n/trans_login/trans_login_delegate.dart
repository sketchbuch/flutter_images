import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_images/l10n/trans_login/trans_login.dart';

class TransLoginDelegate extends LocalizationsDelegate<TransLogin> {
  const TransLoginDelegate();

  @override
  bool isSupported(Locale locale) {
    return ['en'].contains(locale.languageCode);
  }

  @override
  Future<TransLogin> load(Locale locale) {
    return TransLogin.load(locale);
  }

  @override
  bool shouldReload(LocalizationsDelegate<TransLogin> old) {
    return false;
  }
}
