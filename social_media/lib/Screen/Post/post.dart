import 'package:flutter/material.dart';
import 'package:social_media/Contents/Post/Community/community-postlist.dart';
import 'package:social_media/Contents/Post/Create_Group/create_group.dart';
import 'package:social_media/Contents/Post/post_feeds.dart';

class Post extends StatefulWidget {
  @override
  _PostState createState() => _PostState();
}

class _PostState extends State<Post> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text(
              'Choose a group to post',
              style: TextStyle(color: Colors.blue, fontSize: 16),
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
                icon: Icon(
                  Icons.add,
                  color: Colors.black,
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => CreateGroup()));
                }),
          )
        ],
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white12,
      ),
      body: CommunityList(),
    );
  }
}
