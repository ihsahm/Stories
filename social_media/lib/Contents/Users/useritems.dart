import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:social_media/Authentication/Database/Feed%20Database/feed_data.dart';

class UserItems extends StatefulWidget {
  @override
  _UserItemsState createState() => _UserItemsState();
}

class _UserItemsState extends State<UserItems> {
  QuerySnapshot feeds;
  FeedData crudObj = new FeedData();
  bool descTextShowFlag = false;

  List<NetworkImage> _listOfImages = <NetworkImage>[];

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
    if (feeds != null) {
      return GridView.builder(
        shrinkWrap: true,
        itemCount: 6,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate:
            new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index) {
          return Card(
            elevation: 2,
            child: Material(
                child: InkWell(
              child: GridTile(
                child: ExtendedImage.network(
                  "${feeds.docs[index].data()['image']}",
                  fit: BoxFit.cover,
                  cache: true,
                ),
              ),
            )),
          );
        },
      );
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
