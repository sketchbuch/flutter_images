import 'dart:convert';
import 'package:flutter_images/models/media.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;

Future<Media> getPhotos(GoogleSignInAccount currentUser) async {
  return await http
      .get('https://photoslibrary.googleapis.com/v1/mediaItems?pageSize=1', headers: await currentUser.authHeaders)
      .then((response) {
    if (response.statusCode == 200) {
      Map mediaMap = jsonDecode(response.body);

      if (mediaMap.containsKey('mediaItems')) {
        List<dynamic> mediaItems = mediaMap['mediaItems'];

        if (mediaItems.length > 0) {
          Media media = Media.fromJson(mediaItems[0]);
          return media;
        }
      }
    }
  }).catchError((error) {
    throw Exception('getPhotos(): Response error - ' + error.toString());
  });
}
