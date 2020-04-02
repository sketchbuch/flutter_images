import 'package:flutter_images/constants/layout.dart';
import 'package:flutter/material.dart';

class FieldWrapper extends StatelessWidget {
  final Widget child;
  final bool isFirst;

  FieldWrapper({Key key, @required this.child, this.isFirst = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: isFirst ? insetTopNone : insetTopNormal,
      child: child,
    );
  }
}
