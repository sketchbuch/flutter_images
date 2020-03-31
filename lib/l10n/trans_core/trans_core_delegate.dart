import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_images/l10n/trans_core/trans_core.dart';

class TransCoreDelegate extends LocalizationsDelegate<TransCore> {
  const TransCoreDelegate();

  @override
  bool isSupported(Locale locale) {
    return ['en'].contains(locale.languageCode);
  }

  @override
  Future<TransCore> load(Locale locale) {
    return TransCore.load(locale);
  }

  @override
  bool shouldReload(LocalizationsDelegate<TransCore> old) {
    return false;
  }
}
