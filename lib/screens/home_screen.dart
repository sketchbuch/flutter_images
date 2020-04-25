import 'package:flutter_images/constants/layout.dart';
import 'package:flutter_images/firebase/sign_in.dart';
import 'package:flutter_images/l10n/core/localizations.dart';
import 'package:flutter_images/l10n/login/localizations.dart';
import 'package:flutter_images/screens/splash_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  createState() => new HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  void handleLogout() async {
    await signOutGoogle();
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => SplashScreen()));
  }

  @override
  Widget build(BuildContext context) {
    CoreLocalizations coreLocalizations = CoreLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(coreLocalizations.title),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: insetNormal,
          child: Column(
            children: <Widget>[
              Text(coreLocalizations.message),
              RaisedButton(
                child: Text(LoginLocalizations.of(context).signoutButton),
                onPressed: handleLogout,
              )
            ],
          ),
        ),
      ),
    );
  }
}
