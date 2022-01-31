import 'package:flutter/material.dart';

class NotifcationList extends StatefulWidget {
  @override
  _NotifcationListState createState() => _NotifcationListState();
}

class _NotifcationListState extends State<NotifcationList> {
  var notification_list = [
    {"username": "Abebe23"},
    {"username": "Lidya"},
    {"username": "Lielt"},
    {"username": "Abdu12"},
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      // separatorBuilder: (BuildContext context, int index)=> Divider(),
      itemCount: notification_list.length,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: ListTile(
            leading: Icon(
              Icons.favorite,
              color: Colors.red,
            ),
            title: Text(
                "${notification_list[index]["username"]} has liked your picture"),
          ),
        );
      },
    );
  }
}
