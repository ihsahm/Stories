import 'package:flutter/material.dart';
import 'package:fluttericon/entypo_icons.dart';
import 'package:fluttericon/typicons_icons.dart';
import 'package:social_media/Screen/Homepage/homepage.dart';
import 'package:social_media/Screen/Messages/messages.dart';
import 'package:social_media/Screen/Popular/popularhobbies.dart';
import 'package:social_media/Screen/Popular/popularpeople.dart';
import 'package:social_media/Screen/Post/post.dart';
import 'package:social_media/Screen/Settings/settings.dart';
import 'package:social_media/Shared/Tabs/populartab.dart';

class Navigation extends StatefulWidget {
  @override
  _NavigationState createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  int _currentTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    final _pages = <Widget>[
      HomePage(),
      DiscoverTabs(),
      Post(),
      Messages(),
      Settings(),
    ];
    final _items = <BottomNavigationBarItem>[
      BottomNavigationBarItem(icon: Icon(Typicons.home_outline,size: 24,), label:''),
      BottomNavigationBarItem(icon: Icon(Typicons.user_add_outline,size: 24,), label: ''),
      BottomNavigationBarItem(
          icon: Container(
            decoration: BoxDecoration(color: Colors.grey[200], shape: BoxShape.circle,border: Border.all(color: Colors.grey)),           
            child: Icon(
              Icons.add,size: 35,
            ),
          ),
          label: 
            '',
                      
          ),
      BottomNavigationBarItem(
          icon: Icon(Entypo.chat,size: 24,), label: ''),
      BottomNavigationBarItem(
          icon: Icon(Typicons.user_outline,size: 24,), label:''),
    ];
    assert(_pages.length == _items.length);

    final bottomNavBar = BottomNavigationBar(
      elevation: 4,
      selectedItemColor: Colors.blue[700],
        items: _items,
        currentIndex: _currentTabIndex,
        type: BottomNavigationBarType.fixed,
        onTap: (int index) {
          setState(() {
            _currentTabIndex = index;
          });
        });
    return Scaffold(
      body: _pages[_currentTabIndex],
      bottomNavigationBar: bottomNavBar,
    );
  }
}
