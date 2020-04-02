import 'package:flutter_images/constants/typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_images/l10n/trans_core/trans_core.dart';

class PasswordField extends StatefulWidget {
  final bool initialVisibility;
  final String Function(String) validator;
  final String label;
  final String placeholder;
  final TextStyle style;
  final void Function(String) onSaved;

  PasswordField({
    Key key,
    this.label,
    this.initialVisibility = true,
    this.onSaved,
    this.placeholder,
    this.style = const TextStyle(fontSize: fontSizeNormal),
    this.validator,
  }) : super(key: key);

  @override
  createState() => new PasswordFieldState(initialVisibility);
}

class PasswordFieldState extends State<PasswordField> {
  bool isVisible;
  final bool initialVisibility;

  PasswordFieldState(this.initialVisibility) {
    this.isVisible = this.initialVisibility;
  }

  void _toggleVisibility() {
    setState(() {
      isVisible = !isVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    TransCore transCore = TransCore.of(context);
    String tooltip = (isVisible ? transCore.inputTextShow : transCore.inputTextHide);
    IconData iconType = isVisible ? Icons.visibility : Icons.visibility_off;

    return TextFormField(
      obscureText: isVisible,
      decoration: InputDecoration(
          hintText: widget.placeholder,
          labelText: widget.label,
          suffixIcon: IconButton(
            icon: Icon(iconType),
            onPressed: _toggleVisibility,
            tooltip: tooltip,
          )),
      style: widget.style,
      validator: widget.validator,
      onSaved: widget.onSaved,
    );
  }
}
