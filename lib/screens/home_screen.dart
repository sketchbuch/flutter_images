import 'package:flutter_images/l10n/trans_login/trans_login.dart';
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
    TransLogin transLogin = TransLogin.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(transLogin.title),
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
