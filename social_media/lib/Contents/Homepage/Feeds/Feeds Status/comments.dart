import 'package:flutter/material.dart';

class CommentsList extends StatefulWidget {
  @override
  _CommentsListState createState() => _CommentsListState();
}

class _CommentsListState extends State<CommentsList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      bottomSheet: Padding(
        padding: const EdgeInsets.only(right: 8.0, left: 8.0),
        child: TextField(
            decoration: InputDecoration(
                hintText: 'Add a comment...',
                suffixIcon: IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () {
                    
                  },
                ))),
      ),
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.close),
          onPressed: () {
            Navigator.pop(context);
          },
          color: Colors.black,
        ),
        elevation: 0,
        title: Text(
          'Comments',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
      ),
      body: ListView.builder(
        itemCount: 17,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: InkWell(
              onLongPress: () {},
              child: ListTile(
                leading: InkWell(
                  onTap: () {

                  },
                  child: CircleAvatar(child: Image.asset('assets/person.png')),
                ),
                title: Text('Username'),
                subtitle: Text(
                    'Amazing place and amazing food enjoyed the experience'),
              ),
            ),
          );
        },
      ),
    );
  }
}
