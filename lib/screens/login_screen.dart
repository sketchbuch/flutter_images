import 'package:flutter_images/constants/layout.dart';
import 'package:flutter_images/l10n/trans_core/trans_core.dart';
import 'package:flutter_images/models/login_data.dart';
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
    return Scaffold(
      appBar: AppBar(
        title: Text(TransCore.of(context).appTitle),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: formMargin,
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(
                    hintText: Trans.of(context).fieldNewAuthorPlaceholder,
                    labelText: Trans.of(context).fieldNewAuthorLabel,
                  ),
                  onSaved: (val) => setState(() => _fromData.username = val),
                ),
                Padding(
                  padding: fieldWrapperPadding,
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: Trans.of(context).fieldNewTitleLabel,
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return Trans.of(context).fieldNewTitleError;
                      }
                      return null;
                    },
                    onSaved: (val) => setState(() => _fromData.password = val),
                  ),
                ),
                Padding(
                  padding: fieldWrapperPadding,
                  child: RaisedButton(
                    onPressed: () {
                      onSubmit();
                    },
                    child: Text(Trans.of(context).newSubmit),
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
