import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:social_media/Authentication/Database/usercollection.dart';
import 'package:social_media/Contents/Homepage/Feeds/feeds.dart';
import 'package:social_media/Contents/Login/login.dart';
import 'package:social_media/Shared/navigation.dart';

class AuthPhone {
  handleAuth() {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (BuildContext context, snapshot) {
        if (snapshot.hasData) {
          return Navigation();
        } else {
          return LoginPage();
        }
      },
    );
  }

  signOut() {
    FirebaseAuth.instance.signOut();
  }

  signIn(AuthCredential authCreds) async {
    //await UserDatabaseService(uid: )
    FirebaseAuth.instance.signInWithCredential(authCreds);
  }

  signInWithOTP(smsCode, verId) {
    AuthCredential authCreds =
        PhoneAuthProvider.credential(smsCode: smsCode, verificationId: verId);

    signIn(authCreds);
  }
}
