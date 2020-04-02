import 'package:flutter_images/constants/typography.dart';
import 'package:flutter/material.dart';

class NormalField extends StatelessWidget {
  final int maxLength;
  final String Function(String) validator;
  final String helperText;
  final String hintText;
  final String labelText;
  final TextStyle style;
  final void Function(String) onSaved;

  NormalField({
    Key key,
    this.helperText,
    this.hintText,
    this.labelText,
    this.maxLength,
    this.onSaved,
    this.style = const TextStyle(fontSize: fontSizeNormal),
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLength: maxLength,
      decoration: InputDecoration(
        hintText: hintText,
        labelText: labelText,
        helperText: helperText,
      ),
      style: style,
      validator: validator,
      onSaved: onSaved,
    );
  }
}
