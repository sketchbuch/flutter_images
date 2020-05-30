import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_images/models/user.dart';
import 'package:google_sign_in/google_sign_in.dart';

final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
final GoogleSignIn googleSignIn = GoogleSignIn(scopes: ['https://www.googleapis.com/auth/photoslibrary.readonly']);
User loggedinUser;

Future<User> signInGoogle() async {
  try {
    final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
    final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount.authentication;

    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );

    final AuthResult authResult = await firebaseAuth.signInWithCredential(credential);
    final FirebaseUser user = authResult.user;
    loggedinUser = User(user.displayName, user.email, user.photoUrl);

    final FirebaseUser currentUser = await firebaseAuth.currentUser();
    assert(user.uid == currentUser.uid);

    return loggedinUser;
  } catch (error) {
    throw Exception('signInGoogle(): $error');
  }
}

Future<void> signOutGoogle() async {
  try {
    await googleSignIn.signOut();
    await firebaseAuth.signOut();
  } catch (error) {
    throw Exception('signOutGoogle(): $error');
  }
}

Future<bool> isLoggedIn() async {
  FirebaseUser user = await firebaseAuth.currentUser();
  bool isSignedIn = await googleSignIn.isSignedIn();

  if (isSignedIn && user != null) {
    loggedinUser = User(user.displayName, user.email, user.photoUrl);
    return true;
  }

  return false;
}
