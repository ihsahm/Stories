import 'package:flutter/cupertino.dart';
import 'package:social_media/Models/user_model.dart';

enum MediaType{
  image,
}


class Story{
  final String url;
  final Duration duration;
  final User user;

  final MediaType media;

  const Story( {

    @required this.media,
    @required this.url, 
    @required this.duration,
    @required this.user,
  });

}