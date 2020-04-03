import 'package:flutter_images/l10n/error/translations.dart';
import 'package:flutter_images/widgets/typography/para.dart';
import 'package:flutter/material.dart';

class ErrorScreen extends StatelessWidget {
  final dynamic error;

  ErrorScreen({Key key, this.error}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ErrorTranslations errorTranslations = ErrorTranslations.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(errorTranslations.title),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Para(errorTranslations.message, isBold: true),
            Para(this.error.toString()),
          ],
        ),
      ),
    );
  }
}
