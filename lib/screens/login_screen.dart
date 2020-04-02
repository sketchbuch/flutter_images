import 'package:flutter_images/constants/layout.dart';
import 'package:flutter_images/constants/typography.dart';
import 'package:flutter_images/l10n/trans_login/trans_login.dart';
import 'package:flutter_images/models/login_data.dart';
import 'package:flutter_images/widgets/ui/field_wrapper.dart';
import 'package:flutter_images/widgets/ui/headline.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key key}) : super(key: key);

  @override
  createState() => new LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
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

    return Scaffold(
      appBar: AppBar(
        title: Text(transLogin.title),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: insetNormal,
          child: Form(
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
                    style: TextStyle(fontSize: fontSizeNormal),
                    validator: (value) {
                      if (value.isEmpty) {
                        return transLogin.unEmptyError;
                      }
                      return null;
                    },
                    onSaved: (val) => setState(() => _fromData.username = val),
                  ),
                ),
                FieldWrapper(
                  child: TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: transLogin.pwPlaceholder,
                      labelText: transLogin.pwLabel,
                    ),
                    style: TextStyle(fontSize: fontSizeNormal),
                    validator: (value) {
                      if (value.isEmpty) {
                        return transLogin.pwEmptyError;
                      }
                      return null;
                    },
                    onSaved: (val) => setState(() => _fromData.password = val),
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
          ),
        ),
      ),
    );
  }
}
