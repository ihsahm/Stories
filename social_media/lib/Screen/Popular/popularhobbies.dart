import 'package:flutter/material.dart';
import 'package:social_media/Contents/Homepage/Feeds/feeds.dart';
import 'package:social_media/Contents/Homepage/Feeds/stories.dart';
import 'package:social_media/Contents/Popular/popular_hobby.dart';
import 'package:social_media/Screen/Popular/popularpeople.dart';

class PopularHobbies extends StatefulWidget {
  @override
  _PopularHobbiesState createState() => _PopularHobbiesState();
}

class _PopularHobbiesState extends State<PopularHobbies> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PopularHobbyList());
  }
}
