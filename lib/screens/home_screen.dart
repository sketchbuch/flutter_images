import 'package:flutter_images/l10n/login/translations.dart';
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
    LoginTranslations loginTranslations = LoginTranslations.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(loginTranslations.title),
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
