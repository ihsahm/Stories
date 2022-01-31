import 'package:cloud_firestore/cloud_firestore.dart';

class FeedData {
  getData() async {
    return await FirebaseFirestore.instance.collection('scilist').get();
  }
}
