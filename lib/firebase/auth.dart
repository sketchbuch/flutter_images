import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
final GoogleSignIn googleSignIn = GoogleSignIn(scopes: ['https://www.googleapis.com/auth/photoslibrary.readonly']);

Future<String> signInGoogle() async {
  String _name;
  String _email;
  String _imageUrl;

  try {
    final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
    final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount.authentication;

    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );

    final AuthResult authResult = await firebaseAuth.signInWithCredential(credential);
    final FirebaseUser user = authResult.user;

    _name = user.displayName;
    _email = user.email;
    _imageUrl = user.photoUrl;

    // Only taking the first part of the name, i.e., First Name
    if (_name.contains(" ")) {
      _name = _name.substring(0, _name.indexOf(" "));
    }

    final FirebaseUser currentUser = await firebaseAuth.currentUser();
    assert(user.uid == currentUser.uid);

    print('### signInGoogle succeeded: $_name - $_email - $_imageUrl');

    return _name;
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
  if (user == null) {
    return false;
  }

  print('### signInGoogle alreadey logged in: ${user.displayName} - ${user.email} - ${user.photoUrl}');
  return true;
}
