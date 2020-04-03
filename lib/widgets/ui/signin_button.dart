import 'package:flutter_images/firebase/sign_in.dart';
import 'package:flutter_images/screens/error_screen.dart';
import 'package:flutter_images/screens/login_screen.dart';
import 'package:flutter/material.dart';

class SignInButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return OutlineButton(
      splashColor: Colors.grey,
      onPressed: () {
        signInGoogle().then((response) {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) {
                return LoginScreen();
              },
            ),
          );
        }).catchError((error) {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) {
                return ErrorScreen(error: error);
              },
            ),
          );
        });
      },
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
      highlightElevation: 0,
      borderSide: BorderSide(color: Colors.grey),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image(image: AssetImage("assets/logos/google_logo.png"), height: 35.0),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                'Sign in with Google',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.grey,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
