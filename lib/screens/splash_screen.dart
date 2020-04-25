import 'package:flutter_images/constants/layout.dart';
import 'package:flutter_images/firebase/sign_in.dart';
import 'package:flutter_images/l10n/core/localizations.dart';
import 'package:flutter_images/screens/home_screen.dart';
import 'package:flutter_images/screens/login_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key key}) : super(key: key);

  @override
  createState() => new SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _checkLoginStatus();
  }

  Future<void> _checkLoginStatus() async {
    if (await isLoggedIn()) {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => HomeScreen()));
    } else {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => LoginScreen()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(CoreLocalizations.of(context).cTitle),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: insetNormal,
          child: Text('...'),
        ),
      ),
    );
  }
}
