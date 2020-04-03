import 'package:flutter_images/l10n/core/delegate.dart';
import 'package:flutter_images/l10n/core/translations.dart';
import 'package:flutter_images/l10n/error/delegate.dart';
import 'package:flutter_images/l10n/login/delegate.dart';
import 'package:flutter_images/screens/home_screen.dart';
import 'package:flutter_images/theme.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter/material.dart';

void main() => runApp(Root());

class Root extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        // App Translations:
        CoreTranslationsDelegate(),
        ErrorTranslationsDelegate(),
        LoginTranslationsDelegate(),
      ],
      home: HomeScreen(),
      onGenerateTitle: (context) => CoreTranslations.of(context).appTitle,
      theme: appTheme,
      supportedLocales: [
        const Locale('en'),
      ],
    );
  }
}
