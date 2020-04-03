import 'package:flutter_images/l10n/login/localizations.dart';
import 'package:flutter_images/widgets/ui/signin_button.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  createState() => new HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
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
            SignInButton(),
          ],
        ),
      ),
    );
  }
}
