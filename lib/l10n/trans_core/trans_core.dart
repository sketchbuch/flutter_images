import 'dart:async';
import 'package:flutter_images/l10n/trans_core/messages/messages_all.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// flutter pub pub run intl_translation:extract_to_arb --output-dir=lib/l10n/trans_core/source lib/l10n/trans_core/trans_core.dart
// flutter pub pub run intl_translation:generate_from_arb --output-dir=lib/l10n/trans_core/messages lib/l10n/trans_core/trans_core.dart lib/l10n/trans_core/source/intl_en.arb

class TransCore {
  static Future<TransCore> load(Locale locale) {
    final String name = locale.countryCode == null ? locale.languageCode : locale.toString();
    final String localeName = Intl.canonicalizedLocale(name);

    return initializeMessages(localeName).then((bool _) {
      Intl.defaultLocale = localeName;
      return new TransCore();
    });
  }

  static TransCore of(BuildContext context) {
    return Localizations.of<TransCore>(context, TransCore);
  }

  String get cancel {
    return Intl.message('Cancel', name: 'cancel');
  }

  String get ok {
    return Intl.message('OK', name: 'ok');
  }

  String get yes {
    return Intl.message('Yes', name: 'yes');
  }

  String get no {
    return Intl.message('No', name: 'no');
  }
}
