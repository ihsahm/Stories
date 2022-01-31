import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:social_media/Authentication/Database/User Database/user.dart';

class UserDatabaseService{
  final String uid;
  UserDatabaseService({this.uid});
  final CollectionReference userDataCollection=FirebaseFirestore.instance.collection('userdata');

  Future updateUserData(String name,String username) async{
    return await userDataCollection.doc(uid).set({
      'name':name,
      'username':username,
    });

  }
  
  List<UserFile> _userListFromSnapshot(QuerySnapshot snapshot){
    return snapshot.docs.map((doc){
      return UserFile(
        name:doc.data()['name']??'not added',
        username: doc.data()['username']??'not added',
       );

    } ).toList();

  }

  //get userdata
  Stream<List<UserFile>>get users{
    return userDataCollection.snapshots().map((_userListfromSnapshot) {} );
  }

}