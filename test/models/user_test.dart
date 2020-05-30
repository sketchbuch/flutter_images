import 'package:flutter_images/models/user.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Models > User()', () {
    const fName = 'Dave';
    const lName = 'Lister';
    const name = '$fName $lName';
    const email = 'dave.lister@reddwarf.co.uk';
    const imageUrl = 'https://some/url/';

    test('User properties are as expected', () {
      User testUser = new User(name, email, imageUrl);

      expect(testUser.name, name);
      expect(testUser.email, email);
      expect(testUser.image, imageUrl);
      expect(testUser.firstName, fName);
      expect(testUser.lastName, lName);
    });
  });
}
