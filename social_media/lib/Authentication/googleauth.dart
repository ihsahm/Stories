import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_sign_in/google_sign_in.dart';

/*class GoogleAuthService{

  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore db = FirebaseFirestore.instance;
  bool isloged = false;
  String name;
  String email;

   Observable<FirebaseUser> user;
  Observable<Map<String, dynamic>> profile;
  PublishSubject loading = PublishSubject();
  GoogleAuthService() {
    user = Observable(_auth.authStateChanges());
    profile = user.switchMap((FirebaseUser u) {
      if (u != null) {
        return db
            .collection('users')
            .doc(u.uid)
            .snapshots()
            .map((snap) => snap.data());
      } else {
        return Observable.just({});
      }
    });
  }
  // ignore: deprecated_member_use
  Future<FirebaseUser> googleSignin() async {
    loading.add(true);
    GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    GoogleSignInAuthentication googleAuth = await googleUser.authentication;
    AuthCredential credential = AuthCredential.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    // ignore: deprecated_member_use
    FirebaseUser user = (await _auth.signInWithCredential(credential)).user;
    updateUserData(user);
    print('signed in ' + user.displayName);
    loading.add(false);
    assert(user.email != null);
    assert(user.displayName != null);
    assert(!user.isAnonymous);
    assert(await user.getIdToken() != null);
    name = user.displayName;
    email = user.email;
    if (name.contains(" ")) {
      name = name.substring(0, name.indexOf(" "));
    }
    assert(!user.isAnonymous);
    assert(await user.getIdToken() != null);
    final FirebaseUser currentUser = await _auth.currentUser;
    assert(user.uid == currentUser.uid);
    return user;
  }

  void updateUserData(FirebaseUser user) async {
    DocumentReference ref = db.collection('users').doc(user.uid);

    return ref.set({
      'uid': user.uid,
      'email': user.email,
      'photoURL': user.photoURL,
      'displayName': user.displayName,
      'lastSeen': DateTime.now()
    });
  }

  void signOut(){

  }





}

final GoogleAuthService authService=GoogleAuthService();*/
class GoogleAuthentication {}
