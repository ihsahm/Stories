import 'package:flutter/material.dart';
import 'package:social_media/Contents/Users/userinfo.dart';

class UserPage extends StatefulWidget {
  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {

  static const menuItems = <String>[
    'Block user',
    'Report user',
  ];
  final List<PopupMenuItem<String>> popupMenuItems = menuItems
      .map((String value) =>
          PopupMenuItem<String>(value: value, child: Text(value)))
      .toList();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white24,
        automaticallyImplyLeading: false,
        elevation: 0,
        actions: [
        PopupMenuButton<String>(
          icon:Icon(Icons.more_vert,color: Colors.black,),
          itemBuilder: (BuildContext context) => popupMenuItems,
          onSelected: (String value) {
            print('Selected');
          },
        )
        ],
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pop(context);
            }),
        title: Text(
          'Profile',
          style: TextStyle(color: Colors.black),
        ),
        
      ),
      body: UserInfo(),
    );
  }
}
