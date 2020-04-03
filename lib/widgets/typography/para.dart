import 'package:flutter/material.dart';

class Para extends StatelessWidget {
  final String text;
  final bool isBold;

  Para(this.text, {Key key, this.isBold = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10.0),
      child: Text(
        this.text,
        style: TextStyle(fontWeight: this.isBold ? FontWeight.bold : FontWeight.normal),
        textAlign: TextAlign.center,
        textDirection: TextDirection.ltr,
      ),
    );
  }
}
