import 'package:flutter/material.dart';
import 'package:flutter_images/constants/layout.dart';
import 'package:flutter_images/constants/typography.dart';

class Headline extends StatelessWidget {
  final String headlineText;
  final Alignment alignment;

  const Headline(this.headlineText, {Key key, this.alignment = Alignment.centerLeft}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: this.alignment,
      child: Container(
        padding: insetTopNormal,
        child: Text(
          headlineText,
          style: TextStyle(fontSize: fontSizeLarge, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
