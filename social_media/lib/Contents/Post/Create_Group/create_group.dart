import 'package:flutter/material.dart';

class CreateGroup extends StatefulWidget {
  @override
  _CreateGroupState createState() => _CreateGroupState();
}

class _CreateGroupState extends State<CreateGroup> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Create a group', style: TextStyle(color: Colors.black)),
          centerTitle: true,
          elevation: 0.5,
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          leading: IconButton(
              icon: Icon(
                Icons.clear,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.pop(context);
              }),
        ),
        body: Container(
          margin: EdgeInsets.all(20),
          child: Column(
            children: [
              Column(
                children: [
                  CircleAvatar(
                    child: Icon(
                      Icons.add,
                      color: Colors.black,
                    ),
                    radius: 50,
                    backgroundColor: Colors.grey[200],
                  ),
                  TextField(
                      decoration: InputDecoration(hintText: 'Group name')),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: TextField(
                      decoration: InputDecoration(hintText: 'Description...'),
                      maxLines: 5,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 18.0),
                    child: ButtonTheme(
                      minWidth: 300,
                      height: 50,
                      child: RaisedButton(
                          elevation: 0.5,
                          color: Colors.grey[300],
                          child: Text('Create group'),
                          onPressed: () {}),
                    ),
                  )
                ],
              ),
            ],
          ),
        ));
  }
}
