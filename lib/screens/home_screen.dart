import 'package:flutter_images/firebase/sign_in.dart';
import 'package:flutter_images/l10n/login/localizations.dart';
import 'package:flutter_images/screens/error_screen.dart';
import 'package:flutter_images/screens/login_screen.dart';
import 'package:flutter_images/widgets/ui/signin_button.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  createState() => new HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  void onSignInPressed() {
    // try/catch instead of .catchError() as a work around
    // to: https://github.com/flutter/flutter/issues/33427
    try {
      signInGoogle().then((response) {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) {
              return LoginScreen();
            },
          ),
        );
      });
    } catch (error) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) {
            return ErrorScreen(error);
          },
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    LoginLocalizations loginLocalizations = LoginLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(loginLocalizations.title),
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
