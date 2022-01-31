import 'package:flutter/material.dart';
import 'package:social_media/Contents/Users/useritems.dart';

class UserInfo extends StatefulWidget {
  @override
  _UserInfoState createState() => _UserInfoState();
}

class _UserInfoState extends State<UserInfo> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {},
                  child: CircleAvatar(
                    radius: 60,
                    child: Image.asset('assets/person.png'),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Abebe Kebede',
                  style: TextStyle(fontSize: 21, fontWeight: FontWeight.w400),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30.0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    '    120\n   Likes',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '      320\n  Followers',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '      134\n  Following',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ]),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15.0, bottom: 15.0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ButtonTheme(
                      minWidth: 120,
                      height: 50,
                      buttonColor: Colors.blue,
                      child: FlatButton(
                        onPressed: () {},
                        child: Text(
                          'Follow',
                          style: TextStyle(color: Colors.white),
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        color: Colors.blue,
                      )),
                  ButtonTheme(
                      height: 50,
                      minWidth: 120,
                      child: FlatButton(
                        onPressed: () {},
                        child: Text('Message'),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                            side: BorderSide(color: Colors.blue)),
                      )),
                ]),
          ),
          Divider(
            thickness: 1,
            color: Colors.black12,
          ),
          UserItems(),
        ],
      ),
    );
  }
}
