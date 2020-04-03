import 'package:flutter_images/constants/layout.dart';
import 'package:flutter_images/l10n/login/translations.dart';
import 'package:flutter_images/models/login_data.dart';
import 'package:flutter_images/widgets/forms/login_form.dart';
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
    LoginTranslations loginTranslations = LoginTranslations.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(loginTranslations.title),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: insetNormal,
          child: LoginForm(),
        ),
      ),
    );
  }
}
