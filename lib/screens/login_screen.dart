import 'package:flutter_images/firebase/auth.dart';
import 'package:flutter_images/l10n/login/localizations.dart';
import 'package:flutter_images/screens/error_screen.dart';
import 'package:flutter_images/screens/home_screen.dart';
import 'package:flutter_images/widgets/ui/signin_button.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key key}) : super(key: key);

  @override
  createState() => new LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  void onSignInPressed() {
    // try/catch instead of .catchError() as a work around
    // to: https://github.com/flutter/flutter/issues/33427
    try {
      signInGoogle().then((response) {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => HomeScreen()));
      });
    } catch (error) {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => ErrorScreen(error)));
    }
  }

  @override
  Widget build(BuildContext context) {
    LoginLocalizations loginLocalizations = LoginLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(loginLocalizations.lTitle),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SignInButton(onSignInPressed),
          ],
        ),
      ),
    );
  }
}
