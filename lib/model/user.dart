import 'package:cloud_firestore/cloud_firestore.dart';

class myUser {
  String name;
  String email;
  String profilePhoto;
  String uid;

  myUser({
    required this.name,
    required this.email,
    required this.uid,
    required this.profilePhoto,
  });


  // App - Firebase(Map)
  Map<String,dynamic> toJson() =>{
    "name": name,
    "email": email,
    "profilePic": profilePhoto,
  };

  // Firebase(Map) - App(myUser)
  static myUser fromSnap( DocumentSnapshot snap ){
    var snapshot = snap.data() as Map<String,dynamic>;
    return myUser(
      email: snapshot['email'],
      name: snapshot['name'],
      profilePhoto: snapshot['profilePic'],
      uid: snapshot['uid'],
    );
  }
}
