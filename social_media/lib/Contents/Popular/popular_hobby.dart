import 'package:flutter/material.dart';

class PopularHobbyList extends StatefulWidget {
  @override
  _PopularHobbyListState createState() => _PopularHobbyListState();
}

class _PopularHobbyListState extends State<PopularHobbyList> {
  var popular_list = [
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
    return ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: popular_list.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            margin: const EdgeInsets.only(left: 10, right: 10, top: 8, bottom: 4),
            height: 150,
            decoration: BoxDecoration(
                color: Colors.white,
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(popular_list[index]["picture"])),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey[300],
                      offset: Offset(-2, -1),
                      blurRadius: 5),
                ]),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: LinearGradient(
                      begin: Alignment.bottomRight,
                      stops: [
                        0.1,
                        0.9
                      ],
                      colors: [
                        Colors.black.withOpacity(.8),
                        Colors.black.withOpacity(.1)
                      ])),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    popular_list[index]["name"],
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ),
          );
        });
  }
}
