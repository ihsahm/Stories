import 'package:firebase_auth/firebase_auth.dart';
import 'package:social_media/Authentication/Database/usercollection.dart';
import 'package:social_media/Authentication/Database/userdata.dart';

class AnonymousLogin {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  UserData _userFromFirebase(User user) {
    return user != null ? UserData(uid: user.uid) : null;
  }

  Future signInAnon() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User user = result.user;
      await UserDatabaseService(uid: user.uid)
          .updateUserData('new name', 'new username');
      return _userFromFirebase(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
