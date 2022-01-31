import 'package:flutter/material.dart';
import 'package:social_media/Screen/Popular/popularhobbies.dart';
import 'package:social_media/Screen/Popular/popularpeople.dart';

class DiscoverTabs extends StatelessWidget {
  final tabsPages = <Widget>[
    PopularHobbies(),
    PopularPeople(),
  ];
  final tabsList = <Tab>[
    Tab(text: ('Top communities')),
    Tab(text: ('Top people'))
  ];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabsList.length,
      child: Scaffold(
        appBar: AppBar(
          brightness: Brightness.light,
          centerTitle: true,
          title: Text(
            'Discover',
            style: TextStyle(
              color: Colors.blue,
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: Colors.white,
          elevation: 0,
          bottom: TabBar(
            tabs: tabsList,
            indicatorColor: Colors.blue,
            labelColor: Colors.blue,
            isScrollable: true,
          ),
        ),
        body: TabBarView(
          children: tabsPages,
        ),
      ),
    );
  }
}
