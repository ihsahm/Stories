import 'package:flutter/material.dart';
import 'package:fluttericon/typicons_icons.dart';
import 'package:social_media/Contents/Post/Community/community-postlist.dart';

class PostFeeds extends StatefulWidget {
  @override
  _PostFeedsState createState() => _PostFeedsState();
}

class _PostFeedsState extends State<PostFeeds> {
  final formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white12,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.clear,color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          /*Padding(
            padding: const EdgeInsets.only(left: 10.0, right: 10.0),
            child: TextFormField(
              onChanged: (value) {},
              textCapitalization: TextCapitalization.sentences,
              maxLines: 6,
              decoration: InputDecoration(
                icon: Icon(Icons.person_outline),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
                hintText: 'Write something to post..',
              ),
            ),
          ),*/
          SizedBox(height: 10),
          ListTile(
            leading: Icon(
              Typicons.camera_outline,
              color: Colors.orange[900],
            ),
            title: Text('Post a photo'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(
              Typicons.pen,
              color: Colors.blue[900],
            ),
            title: Text('Post a text'),
            onTap: () {},
          ),

          /*   Padding(
            padding: const EdgeInsets.only(top: 18.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                OutlineButton(
                    onPressed: () {},
                    borderSide: BorderSide(color: Colors.grey[300], width: 1.0),
                    child:
                        /* (image1 != null)
                        ? Container(
                            height: 200,
                            child: Image.file(
                              image1,
                              fit: BoxFit.fitWidth,
                            ),
                          )
                        : */
                        Padding(
                      padding: EdgeInsets.fromLTRB(8.0, 26, 8.0, 26),
                      child: IconButton(
                          icon: Icon(Icons.add),
                          onPressed: () {
                            // getImage();
                          }),
                    )),*/
        ]),
      ),
    );
  }
}
