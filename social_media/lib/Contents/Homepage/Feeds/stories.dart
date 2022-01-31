import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:social_media/Contents/Homepage/Feeds/story.dart';

class Stories extends StatefulWidget {
  @override
  _StoriesState createState() => _StoriesState();
}

class _StoriesState extends State<Stories> {
  var stories_list = [
    {
      "name": "Hiking",
      "picture": "assets/hiking.jpg",
    },
    {
      "name": "Excercising",
      "picture": "assets/excercising.jpg",
    },
    {
      "name": "Eating",
      "picture": "assets/eating.jpg",
    },
    {
      "name": "Painting",
      "picture": "assets/painting.jpg",
    },
    {
      "name": "Hunting",
      "picture": "assets/hunting.jpg",
    },
    {
      "name": "Swimming",
      "picture": "assets/swimming.jpg",
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(0.0),
      height: 200,
      color: Colors.white70,
      child: InkWell(
        onTap: () {
        },
        child: ListView.builder(
            padding:
                const EdgeInsets.symmetric(vertical: 7.0, horizontal: 8.0),
            scrollDirection: Axis.horizontal,
            itemCount: stories_list.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: StoryCard(
                    story_name: stories_list[index]["name"],
                    story_picture: stories_list[index]["picture"],
                  ));
            }),
      ),
    );
  }
}

class StoryCard extends StatelessWidget {
  final story_name;
  final story_picture;

  const StoryCard({Key key, this.story_name, this.story_picture})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){

          Navigator.push(context, MaterialPageRoute(builder: (context)=>
             MoreStories(
               story_list_name: story_name,
               story_list_picture: story_picture,
             ),
          ));

      },
          child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: Image.asset(
              story_picture,
              height: double.infinity,
              width: 110.0,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            height: double.infinity,
            width: 110.0,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
          ),
          Positioned(
            child: Text(
              story_name,
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            bottom: 8.0,
            left: 8.0,
            right: 8.0,
          )
        ],
      ),
    );
  }
}
