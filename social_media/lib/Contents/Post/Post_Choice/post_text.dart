import 'package:flutter/material.dart';

class PostText extends StatefulWidget {
  @override
  _PostTextState createState() => _PostTextState();
}

class _PostTextState extends State<PostText> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        leading: IconButton(
            icon: Icon(
              Icons.clear,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pop(context);
            }),
        backgroundColor: Colors.white12,
        actions: [
          Padding(
              padding: const EdgeInsets.all(3.0),
              child: FlatButton(
                child: Text('Post', style: TextStyle(color: Colors.black)),
                onPressed: () {},
              )),
        ],
      ),
      body: Form(
        child: Padding(
          padding: const EdgeInsets.only(left: 5.0, right: 5.0, top: 10),
          child: Column(children: [
            TextFormField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(0))),
                  hintText: 'Post a text...'),
              maxLines: 15,
            ),
            SizedBox(height: 30),
          ]),
        ),
      ),
    );
  }
}
