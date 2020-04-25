import 'package:flutter_images/l10n/error/localizations.dart';
import 'package:flutter_images/widgets/typography/para.dart';
import 'package:flutter/material.dart';

class ErrorScreen extends StatelessWidget {
  final dynamic error;

  ErrorScreen(this.error, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ErrorLocalizations errorLocalizations = ErrorLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(errorLocalizations.eTitle),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Para(errorLocalizations.eMessage, isBold: true),
            Para(this.error.toString()),
          ],
        ),
      ),
    );
  }
}
