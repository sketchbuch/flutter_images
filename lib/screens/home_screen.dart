import 'package:flutter/material.dart';
import 'package:flutter_images/l10n/trans_core/trans_core.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TransCore transCore = TransCore.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(transCore.appTitle),
      ),
      body: Text('The content'),
    );
  }
}
