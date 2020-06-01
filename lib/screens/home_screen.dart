import 'package:flutter_images/constants/layout.dart';
import 'package:flutter_images/firebase/auth.dart';
import 'package:flutter_images/l10n/core/localizations.dart';
import 'package:flutter_images/l10n/login/localizations.dart';
import 'package:flutter_images/models/media.dart';
import 'package:flutter_images/screens/error_screen.dart';
import 'package:flutter_images/screens/splash_screen.dart';
import 'package:flutter_images/utils/get_photos.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  createState() => new HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  Media photo;
  bool imagesLoaded = false;

  void handleLogout() async {
    try {
      signOutGoogle().then((response) {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => SplashScreen()));
      });
    } catch (error) {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => ErrorScreen(error)));
    }
  }

  @override
  void initState() {
    super.initState();

    try {
      if (googleSignIn.currentUser != null) {
        getPhotos(googleSignIn.currentUser).then((response) {
          setState(() {
            photo = response;
          });
          imagesLoaded = true;
        });
      }
    } catch (error) {
      print('### catch()');
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => ErrorScreen(error)));
    }
  }

  @override
  Widget build(BuildContext context) {
    CoreLocalizations coreLocalizations = CoreLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(coreLocalizations.cTitle),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              Text(loggedinUser.name),
              if (photo != null)
                Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Image.network(
                        photo.baseUrl,
                      ),
                    ),
                    Text(photo.filename)
                  ],
                ),
              if (photo == null && !imagesLoaded)
                Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(16.0),
                      child: CircularProgressIndicator(),
                    ),
                  ],
                ),
              if (photo == null && imagesLoaded)
                Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Text(coreLocalizations.cNoImages),
                    ),
                  ],
                ),
              RaisedButton(
                child: Text(LoginLocalizations.of(context).lSignoutButton),
                onPressed: handleLogout,
              )
            ],
          ),
          margin: insetNormal,
          width: MediaQuery.of(context).size.width,
        ),
      ),
    );
  }
}
