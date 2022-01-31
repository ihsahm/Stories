import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:social_media/Authentication/phoneauth.dart';
import 'package:social_media/Contents/Homepage/Feeds/story.dart';
import 'package:social_media/Contents/Homepage/data.dart';
import 'package:social_media/Screen/Login/login.dart';
import 'package:social_media/Shared/navigation.dart';

Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
 runApp(MaterialApp(

    debugShowCheckedModeBanner: false,
    home: AuthPhone().handleAuth(),
  ));
}

