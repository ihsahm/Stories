import 'package:flutter/material.dart';
import 'package:fluttericon/elusive_icons.dart';
import 'package:fluttericon/typicons_icons.dart';
import 'package:like_button/like_button.dart';
import 'package:social_media/Contents/Homepage/Feeds/Feeds%20Status/comments.dart';

class PostStatus extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            LikeButton(
              size: 30,
              circleColor: CircleColor(start: Colors.red, end: Colors.red),
              bubblesColor: BubblesColor(
                dotPrimaryColor: Colors.red,
                dotSecondaryColor: Colors.red,
              ),
              likeBuilder: (bool isLiked) {
                return Icon(
                  isLiked ? Icons.favorite : Icons.favorite_outline,
                  color: isLiked ? Colors.red : Colors.grey,
                  size: 28,
                );
              },
              likeCount: 0,
              countBuilder: (int count, bool isLiked, String text) {
                var color = isLiked ? Colors.red : Colors.grey;
                Widget result;
                if (count == 0) {
                  result = Text(
                    "0",
                    style: TextStyle(color: color),
                  );
                } else
                  result = Text(
                    text,
                    style: TextStyle(color: color),
                  );
                return result;
              },
            ),
            IconButton(
              icon: Icon(Typicons.chat, color: Colors.grey),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder:(context){
                  return CommentsList();
                }));
              }
             
            ),
            IconButton(
              icon: Icon(Elusive.share, color: Colors.grey),
              onPressed: () {},
            )
          ],
        )
      ],
    );
  }
}
