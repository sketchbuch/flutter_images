import 'package:flutter_images/l10n/core/localizations.dart';
import 'package:flutter_images/l10n/error/localizations.dart';
import 'package:flutter_images/l10n/login/localizations.dart';
import 'package:flutter_images/screens/splash_screen.dart';
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
        CoreLocalizations.delegate,
        ErrorLocalizations.delegate,
        LoginLocalizations.delegate,
      ],
      home: SplashScreen(),
      onGenerateTitle: (context) => CoreLocalizations.of(context).appTitle,
      theme: appTheme,
      supportedLocales: [
        const Locale('en'),
      ],
    );
  }
}
