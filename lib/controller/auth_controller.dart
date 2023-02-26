import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:inditok/modals/user.dart';

class AuthController extends GetxController{

  // User Register
  static AuthController instance = Get.find();
  File? picimg;
  pickImage() async{
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if(image == null) return;
    final img = File(image.path);
    picimg = img;
  }

  void SignUp(String username,String email,String password,File? image) async{
    print('runTryBlock');
    try{
      if(username.isNotEmpty && email.isNotEmpty && password.isNotEmpty && image != null){
        print("Is this is null: $image");
        UserCredential credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
        String downloadUrl = await _uploadProPic(image);
        myUser user = myUser(username: username, email: email, profilePhoto: downloadUrl, uid: credential.user!.uid);
        await FirebaseFirestore.instance.collection("users").doc(credential.user!.uid).set(user.toJson());
      }else{
        Get.snackbar('This snackbar', 'Amazing');
      }
    }catch(e){
      print("This is exception : $e");
      Get.snackbar('This snackbar', 'Amazing');
    }
  }

  Future<String> _uploadProPic(File image) async{
    Reference ref = FirebaseStorage.instance.ref().child("profilePics").child(FirebaseAuth.instance.currentUser!.uid);
    UploadTask uploadTask = ref.putFile(image);
    TaskSnapshot snapshot = await uploadTask;
    String imageDwnUrl = await snapshot.ref.getDownloadURL();
    return imageDwnUrl;
  }


}