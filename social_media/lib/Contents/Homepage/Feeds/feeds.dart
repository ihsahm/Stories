import 'package:carousel_pro/carousel_pro.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:flutter_parsed_text/flutter_parsed_text.dart';
import 'package:hashtagable/hashtagable.dart';
import 'package:social_media/Authentication/Database/Feed%20Database/feed_data.dart';
import 'package:social_media/Contents/Homepage/Feeds/poststatus.dart';
import 'package:social_media/Screen/Post/post.dart';
import 'package:social_media/Screen/Userpage/userpage.dart';
import 'package:linkwell/linkwell.dart';
import 'package:url_launcher/url_launcher.dart';

class Feeds extends StatefulWidget {
  final int maxLines;
  final feeds_picture;
  const Feeds({Key key, this.maxLines, this.feeds_picture}) : super(key: key);
  @override
  _FeedsState createState() => _FeedsState();
}

class _FeedsState extends State<Feeds> {
  var user_list = [
    {
      "username": "Hiking",
      "hour": "12",
      "location": "Abebe Kebede",
      "image": "assets/hiking.jpg"
    },
    {
      "username": "Food",
      "hour": "20",
      "location": "Eyob Demissie",
      "image": "assets/eating.jpg"
    },
    {
      "username": "Hunting",
      "hour": "6",
      "location": "Dina Ayele",
      "image": "assets/hunting.jpg"
    },
    {
      "username": "Painting",
      "hour": "3",
      "location": "Mekdi Girma",
      "image": "assets/painting.jpg"
    },
    {
      "username": "Swimming",
      "hour": "5",
      "location": "User2123124",
      "image": "assets/swimming.jpg"
    },
    {
      "username": "Gym",
      "hour": "11",
      "location": "Sitra Ahmed",
      "image": "assets/excercising.jpg"
    }
  ];

  int currentIndex = 0;
  QuerySnapshot feeds;
  FeedData crudObj = new FeedData();
  bool descTextShowFlag = false;

  @override
  void initState() {
    crudObj.getData().then((results) {
      setState(() {
        feeds = results;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bool _isExpanded = false;
    if (feeds != null) {
      return ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemCount: user_list.length,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (BuildContext context, int index) {
            return Container(
              margin: const EdgeInsets.symmetric(vertical: 5.0),
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              color: Colors.white,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          PostHeader(
                            username: user_list[index]["username"],
                            hour: user_list[index]["hour"],
                            location: user_list[index]["location"],
                            images: user_list[index]["image"],
                          ),
                          const SizedBox(height: 4.0),
                          ParsedText(
                              text:
                                  "${feeds.docs[index].data()['Description']}",
                              style:
                                  TextStyle(fontSize: 17, color: Colors.black),
                              parse: <MatchText>[
                                MatchText(
                                    type: ParsedType.PHONE,
                                    style: TextStyle(
                                      color: Colors.blue,
                                      fontSize: 17,
                                    ),
                                    onTap: (url) {
                                      print(url);
                                      launch("tel:" + url);
                                    }),
                                MatchText(
                                  pattern: r"\B#+([\w]+)\b",
                                  style: TextStyle(
                                    color: Colors.blue[600],
                                    fontSize: 17,
                                  ),
                                  onTap: (url) async {
                                    print('touched');
                                  },
                                ),
                                MatchText(
                                    pattern: r"\B@+([\w]+)\b",
                                    style: TextStyle(
                                      color: Colors.blue[600],
                                      fontSize: 20,
                                    ),
                                    onTap: (url) async {
                                      //print("https://t.me/" + url);
                                    }),
                              ]),
                        ]),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 8.0,
                    ),
                    child:
                        /* SizedBox(
                          height: 500,
                          width: double.infinity,
                          child: PageView.builder(
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (BuildContext context, int index) {
                                final String images =
                                    "${feeds.docs[index].data()['image']}";
                                return ExtendedImage.network(
                                  images,
                                  fit: BoxFit.cover,
                                  enableLoadState: false,
                                  cache: true,
                                );
                              })*/
                        ExtendedImage.network(
                      "${feeds.docs[index].data()['image']}",
                      fit: BoxFit.cover,
                      enableLoadState: false,
                      cache: false,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: PostStatus(),
                  )
                ],
              ),
            );
          });
    } else {
      return Center(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("assets/loading.gif"),
          SizedBox(height: 5),
          Text(
            'Loading,please wait...',
            style: TextStyle(fontSize: 18),
          ),
        ],
      ));
    }
  }
}

class PostHeader extends StatelessWidget {
  final username;
  final hour;
  final location;
  final images;
  static const menuItems = <String>[
    'Copy link',
    'Report Post',
  ];
  final List<PopupMenuItem<String>> popupMenuItems = menuItems
      .map((String value) =>
          PopupMenuItem<String>(value: value, child: Text(value)))
      .toList();

  PostHeader({Key key, this.username, this.hour, this.location, this.images})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => UserPage()));
          },
          child: CircleAvatar(
            child: Image.asset('assets/person.png'),
          ),
        ),
        const SizedBox(
          width: 8.0,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => UserPage()));
                    },
                    child: Text(
                      username,
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
                    ),
                  ),
                  const SizedBox(width: 5),
                  Text("$hour hrs",
                      style: TextStyle(
                          letterSpacing: 0.1,
                          wordSpacing: -2,
                          color: Colors.grey[600],
                          fontSize: 12.0)),
                ],
              ),
              Row(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      location,
                      style: TextStyle(color: Colors.grey[600], fontSize: 13.0),
                    )
                  ],
                )
              ])
            ],
          ),
        ),
        PopupMenuButton<String>(
          icon: Icon(Icons.more_vert),
          itemBuilder: (BuildContext context) => popupMenuItems,
          onSelected: (String value) {
            print('Selected');
          },
        )
      ],
    );
  }
}
