import 'package:flutter/material.dart';
import 'package:social_media/Contents/Homepage/Feeds/feeds.dart';
import 'package:social_media/Contents/Homepage/Feeds/stories.dart';
import 'package:social_media/Screen/Homepage/notification.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            brightness: Brightness.light,
            centerTitle: false,
            title: Text(
              'Socify',
              style: TextStyle(
                  color: Colors.blue[800],
                  fontWeight: FontWeight.bold,
                  fontSize: 24),
            ),
            backgroundColor: Colors.white,
            elevation: 0,
            floating: true,
            actions: [
              Container(
                margin: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                    color: Colors.grey[200],
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.grey)),
                child: IconButton(
                    icon: Icon(Icons.search),
                    onPressed: () {
                      /* Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => NotificationPage()));*/
                    },
                    color: Colors.black),
              ),
              Container(
                margin: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                    color: Colors.grey[200],
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.grey)),
                child: IconButton(
                    icon: Icon(Icons.notifications_none_outlined),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => NotificationPage()));
                    },
                    color: Colors.black),
              )
            ],
          ),
          SliverPadding(
            padding: const EdgeInsets.only(top: 5.0, bottom: 5.0),
            sliver: SliverToBoxAdapter(child: Stories()),
          ),
          SliverList(
              delegate: SliverChildBuilderDelegate(
            (context, index) {
              return Feeds();
            },
            childCount: 1,
          ))
        ],
      ),
    );
  }
}
