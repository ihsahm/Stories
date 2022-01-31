import 'package:flutter/material.dart';
import 'package:social_media/Contents/Popular/popular_people.dart';

class PopularPeople extends StatefulWidget {
  @override
  _PopularPeopleState createState() => _PopularPeopleState();
}

class _PopularPeopleState extends State<PopularPeople> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: PopularPeopleList(),
        
      );
  }
}