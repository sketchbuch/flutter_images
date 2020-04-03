import 'l10n/trans_core/trans_core_delegate.dart';
import 'l10n/trans_core/trans_core.dart';
import 'l10n/trans_login/trans_login_delegate.dart';
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
        TransLoginDelegate(),
        TransCoreDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      home: HomeScreen(),
      onGenerateTitle: (context) => TransCore.of(context).appTitle,
      theme: appTheme,
      supportedLocales: [
        const Locale('en'),
      ],
    );
  }
}
