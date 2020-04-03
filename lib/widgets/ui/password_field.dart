import 'package:flutter_images/constants/forms.dart';
import 'package:flutter_images/l10n/core/localizations.dart';
import 'package:flutter/material.dart';

class PasswordField extends StatefulWidget {
  final bool initialVisibility;
  final int maxLength;
  final String Function(String) validator;
  final String helperText;
  final String hintText;
  final String labelText;
  final TextStyle style;
  final void Function(String) onSaved;

  PasswordField({
    Key key,
    this.helperText,
    this.hintText,
    this.initialVisibility = true,
    this.labelText,
    this.maxLength,
    this.onSaved,
    this.style = textInputStyle,
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
    CoreLocalizations coreTranslations = CoreLocalizations.of(context);
    String tooltip = (isVisible ? coreTranslations.inputTextShow : coreTranslations.inputTextHide);
    IconData iconType = isVisible ? Icons.visibility : Icons.visibility_off;

    return TextFormField(
      obscureText: isVisible,
      maxLength: widget.maxLength,
      decoration: InputDecoration(
        hintText: widget.hintText,
        labelText: widget.labelText,
        helperText: widget.helperText,
        suffixIcon: IconButton(
          icon: Icon(iconType),
          onPressed: _toggleVisibility,
          tooltip: tooltip,
        ),
      ),
      style: widget.style,
      validator: widget.validator,
      onSaved: widget.onSaved,
    );
  }
}
