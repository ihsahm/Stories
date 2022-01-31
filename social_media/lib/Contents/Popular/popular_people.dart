import 'package:flutter/material.dart';

class PopularPeopleList extends StatefulWidget {
  @override
  _PopularPeopleListState createState() => _PopularPeopleListState();
}

class _PopularPeopleListState extends State<PopularPeopleList> {
  var popular_people_list = [
    {
      "name": "Tina Gal",
      "picture": "assets/users/user1.jpeg",
    },
    {
      "name": "Diana Lielt",
      "picture": "assets/users/user2.jpg",
    },
    {
      "name": "Robel Nigus",
      "picture": "assets/users/user3.jpg",
    },
    {
      "name": "Roblox",
      "picture": "assets/users/anime.jpg",
    },
    {
      "name": "Anon Guy",
      "picture": "assets/users/hacker.jpg",
    },
    {
      "name": "Abel Weynu",
      "picture": "assets/users/user4.jpg",
    },
    {
      "name": "Samri ",
      "picture": "assets/users/user5.jpg",
    },
    {
      "name": "Yidnekachew Mogessie",
      "picture": "assets/users/user6.jpeg",
    },
  ];
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemCount: popular_people_list.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          margin: const EdgeInsets.only(left: 10, right: 10, top: 8, bottom: 4),
          height: 150,
          decoration: BoxDecoration(
              color: Colors.white,
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(popular_people_list[index]["picture"])),
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
                gradient: LinearGradient(begin: Alignment.bottomRight, stops: [
                  0.1,
                  0.9
                ], colors: [
                  Colors.black.withOpacity(.8),
                  Colors.black.withOpacity(.1)
                ])),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        popular_people_list[index]["name"],
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    //FlatButton.icon(icon:Icon(Icons.add),onPressed:(){},label:Text('Follow'))
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
