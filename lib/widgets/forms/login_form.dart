import 'package:flutter_images/constants/typography.dart';
import 'package:flutter_images/l10n/trans_login/trans_login.dart';
import 'package:flutter_images/models/login_data.dart';
import 'package:flutter_images/widgets/ui/field_wrapper.dart';
import 'package:flutter_images/widgets/ui/headline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_images/widgets/ui/password_field.dart';

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
              onSaved: (val) => setState(() => _fromData.username = val),
              style: TextStyle(fontSize: fontSizeNormal),
              validator: (value) {
                if (value.isEmpty) {
                  return transLogin.unEmptyError;
                }
                return null;
              },
            ),
          ),
          FieldWrapper(
            child: PasswordField(
              label: transLogin.pwLabel,
              placeholder: transLogin.pwPlaceholder,
              onSaved: (val) => setState(() => _fromData.password = val),
              style: TextStyle(fontSize: fontSizeNormal),
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
