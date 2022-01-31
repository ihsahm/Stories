import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:social_media/Authentication/Database/Feed%20Database/feed_data.dart';
import 'package:story_view/story_view.dart';


class StoryScreen extends StatefulWidget {
  @override
  _StoryScreenState createState() => _StoryScreenState();
}

class _StoryScreenState extends State<StoryScreen> {
  final StoryController controller = StoryController();

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
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(
          top:150,left: 15,right: 15
        ),
        child: ListView(
          children: <Widget>[
            Container(
              height: 300,
              child: StoryView(
                controller: controller,
                storyItems: [

                  
                  /*StoryItem.inlineImage(

                    caption: Text(''),
                    url:
                        "https://image.ibb.co/cU4WGx/Omotuo-Groundnut-Soup-braperucci-com-1.jpg",
                    controller: controller,
                  ),
                  StoryItem.inlineImage(
                    caption: Text(''),
                    url:
                        "https://media.giphy.com/media/5GoVLqeAOo6PK/giphy.gif",
                    controller: controller,
                  )*/
                ],
                onStoryShow: (s) {
                  print("Showing a story");
                },
                onComplete: () {
                  Navigator.pop(context);
                },
                progressPosition: ProgressPosition.bottom,
                repeat: false,
                inline: true,
              ),
            ),
            Material(
              child: InkWell(
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => MoreStories()));
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.black54,
                      borderRadius:
                          BorderRadius.vertical(bottom: Radius.circular(8))),
                  padding: EdgeInsets.symmetric(vertical: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      Text(
                        "View more stories",
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MoreStories extends StatefulWidget {
  final story_list_name;
  final story_list_picture;

  MoreStories({Key key, this.story_list_name, this.story_list_picture}) : super(key: key);
  @override
  _MoreStoriesState createState() => _MoreStoriesState();
}

class _MoreStoriesState extends State<MoreStories> {
  final storyController = StoryController();

  @override
  void dispose() {
    storyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StoryView(
        
        storyItems: [
          
          StoryItem.pageImage(
            url:"https://image.ibb.co/cU4WGx/Omotuo-Groundnut-Soup-braperucci-com-1.jpg",
            caption:  widget.story_list_name,
            

            
            imageFit: BoxFit.contain,
            controller: storyController,
          ),
          StoryItem.pageImage(
              url:  "https://www.helpguide.org/wp-content/uploads/young-woman-eating-fast-food-chicken-sandwich-768.jpg",
              caption:  widget.story_list_name,

            imageFit: BoxFit.contain,
              controller: storyController),
          StoryItem.pageImage(
            url: "https://media.overstockart.com/optimized/cache/data/product_images/VG485-1000x1000.jpg",
            caption:  widget.story_list_name,

            imageFit: BoxFit.contain,
            controller: storyController,
          ),
          StoryItem.pageImage(
            url: "https://cdn.britannica.com/94/125794-050-FB09B3F4/Hikers-Gore-Range-Mountains-Denver.jpg",
            caption:  widget.story_list_name,
            imageFit: BoxFit.contain,
            controller: storyController,
          ),

          StoryItem.pageImage(
            url:  "https://cdn.britannica.com/94/125794-050-FB09B3F4/Hikers-Gore-Range-Mountains-Denver.jpg",
            caption:  widget.story_list_name,
            imageFit: BoxFit.contain,
            controller: storyController,
          ),

          StoryItem.pageImage(
            url: "https://cdn.britannica.com/94/125794-050-FB09B3F4/Hikers-Gore-Range-Mountains-Denver.jpg",
            caption: widget.story_list_name,
            imageFit: BoxFit.contain,
            controller: storyController,
          ),
        ],
        onStoryShow: (s) {
          print("Showing a story");
        },
        onComplete: () {
          print("Completed a cycle");
        },
        progressPosition: ProgressPosition.top,
        repeat: false,
        controller: storyController,
        
      ),
    );
  }
}