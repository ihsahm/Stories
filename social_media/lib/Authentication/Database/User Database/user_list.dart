import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_media/Authentication/Database/User%20Database/user.dart';

class UserList extends StatefulWidget {
  @override
  _UserListState createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  @override
  Widget build(BuildContext context) {
    final users=Provider.of<List<UserFile>>(context);
    //print(users.docs);
      users.forEach((userlist) {
        print(userlist.name);
        print(userlist.username);
      });
    
    return Container(
      
    );
  }
}
