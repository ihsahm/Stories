import 'package:flutter/material.dart';
import 'package:fluttericon/typicons_icons.dart';
import 'package:social_media/Contents/Post/Post_Choice/post_text.dart';
import 'package:social_media/Contents/Post/post_feeds.dart';

class CommunityList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(
        separatorBuilder: (BuildContext context, int index) => Divider(),
        itemCount: 15,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
              onTap: () {
                showModalBottomSheet(
                    isDismissible: true,
                    context: context,
                    builder: (BuildContext context) {
                      return Container(
                        // height: 300,
                        child: Wrap(
                          children: [
                            ListTile(
                              leading: Icon(
                                Typicons.camera_outline,
                                color: Colors.orange[900],
                              ),
                              title: Text('Post a photo'),
                              onTap: () {
                                Navigator.pop(context);
                              },
                            ),
                            ListTile(
                              leading: Icon(
                                Typicons.pen,
                                color: Colors.blue[900],
                              ),
                              title: Text('Post a text'),
                              onTap: () {
                                Navigator.pop(context);
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            PostText()));
                              },
                            ),
                          ],
                        ),
                      );
                    });
                /* Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return PostFeeds();
                    },
                  ),
                );*/
              },
              leading: CircleAvatar(
                child: Image.asset('assets/avatar.png'),
                backgroundColor: Colors.transparent,
              ),
              title: Text('Group $index'));
        },
      ),
    );
  }
}
