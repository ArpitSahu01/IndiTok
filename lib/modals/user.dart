import 'package:cloud_firestore/cloud_firestore.dart';

class myUser {
  String username;
  String email;
  String profilePhoto;
  String uid;

  myUser({
    required this.username,
    required this.email,
    required this.profilePhoto,
    required this.uid,
  });

  // App - Firebase(Map)
  Map<String, dynamic> toJson() => {
        'name': username,
        'email': email,
        'profilePic': profilePhoto,
        'uid': uid,
      };


  // Firebase(Map) - App(User)
  static myUser fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return myUser(
        username: snapshot['name'],
        email: snapshot['email'],
        profilePhoto: snapshot['profilePic'],
        uid: snapshot['uid']);
  }
}
