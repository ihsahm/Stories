
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';
import 'package:social_media/Authentication/Database/User%20Database/user.dart';
import 'package:social_media/Authentication/Database/usercollection.dart';
import 'package:social_media/Authentication/Database/userdata.dart';
import 'package:social_media/Authentication/anonauth.dart';
import 'package:social_media/Authentication/Database/User Database/user_list.dart';
import 'package:social_media/Authentication/phoneauth.dart';
import 'package:social_media/Contents/Homepage/data.dart';

class Settings extends StatefulWidget {
  final UserFile userlist;

  const Settings({Key key, this.userlist});
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final AnonymousLogin _anonymousLogin = AnonymousLogin();
  @override
  Widget build(BuildContext context) {

  final users=Provider.of<List<UserFile>>(context);
    return StreamProvider<List<UserFile>>.value(
      value: UserDatabaseService().users,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Settings'),
        ),
        body: Container(
          child: Center(
              child: Column(
            children: [
              FlatButton.icon(
                  onPressed: () {
                    AuthPhone().signOut();
                  },
                  icon: Icon(Icons.arrow_back),
                  label: Text('SignOut')),
              FlatButton.icon(
                  onPressed: () async {
                    _firebaseAuth.signOut();
                  },
                  icon: Icon(Icons.arrow_back),
                  label: Text('SignOut Google')),
              FlatButton.icon(
                  onPressed: () async {
                    //AnonymousLogin().signOut();
                  },
                  icon: Icon(Icons.arrow_back),
                  label: Text('SignOut Anonymous')),
             // Text(userlist.),
              Text('name')
            ],
          )),
        ),
      ),
    );
  }
}
