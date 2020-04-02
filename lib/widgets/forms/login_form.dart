import 'package:email_validator/email_validator.dart';
import 'package:flutter_images/constants/forms.dart';
import 'package:flutter_images/l10n/trans_login/trans_login.dart';
import 'package:flutter_images/models/login_data.dart';
import 'package:flutter_images/widgets/ui/field_wrapper.dart';
import 'package:flutter_images/widgets/ui/headline.dart';
import 'package:flutter_images/widgets/ui/password_field.dart';
import 'package:flutter/material.dart';

const int UN_MAXLENGTH = 100;
const int PW_MAXLENGTH = 50;

class LoginForm extends StatefulWidget {
  LoginForm({Key key}) : super(key: key);

  @override
  createState() => new LoginFormState();
}

class LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final _fromData = LoginData();

  void onSubmit() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      print('login ok!!!');
    }
  }

  @override
  Widget build(BuildContext context) {
    TransLogin transLogin = TransLogin.of(context);

    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          Headline(transLogin.message),
          FieldWrapper(
            child: TextFormField(
              decoration: InputDecoration(
                hintText: transLogin.unPlaceholder,
                labelText: transLogin.unLabel,
              ),
              maxLength: UN_MAXLENGTH,
              onSaved: (val) => setState(() => _fromData.username = val),
              style: textInputStyle,
              validator: (value) {
                if (value.isEmpty) {
                  return transLogin.unEmptyError;
                } else if (!EmailValidator.validate(value)) {
                  return transLogin.unEmailError;
                }

                return null;
              },
            ),
          ),
          FieldWrapper(
            child: PasswordField(
              hintText: transLogin.pwPlaceholder,
              labelText: transLogin.pwLabel,
              maxLength: PW_MAXLENGTH,
              onSaved: (val) => setState(() => _fromData.password = val),
              validator: (value) {
                if (value.isEmpty) {
                  return transLogin.pwEmptyError;
                }

                return null;
              },
            ),
          ),
          FieldWrapper(
            child: RaisedButton(
              onPressed: () {
                onSubmit();
              },
              child: Text(transLogin.btnLabel),
            ),
          ),
        ],
      ),
    );
  }
}
