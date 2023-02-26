import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:image_picker/image_picker.dart';
import 'package:inditok/model/user.dart';
import 'package:inditok/view/screens/auth/login_screen.dart';
import 'package:inditok/view/screens/home.dart';

class AuthController extends GetxController{

  static AuthController instance = Get.find();
  File? proimg;

  pickImage() async{
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if(image == null) return;

    final img = File(image.path);
    proimg = img;
  }

  //User Persistance

  // _user - Nadi
  // _user.bindStream - Nadi me color dekho
  //  ever - Aap Ho
  late Rx<User?> _user;
  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    _user = Rx<User?>(FirebaseAuth.instance.currentUser);
    _user.bindStream(FirebaseAuth.instance.authStateChanges());
    ever(_user, _setInitialView);
  }

  _setInitialView(User? user){
    if(user == null){
      Get.offAll(()=>LoginScreen());
    }else{
      Get.offAll(()=>HomeScreen());
    }
  }
// User Registor
  void signUp(String username, String email, String password, File? image) async{

    try{
      if( username.isNotEmpty && email.isNotEmpty && password.isNotEmpty && image != null){
        UserCredential credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
        String downloadUrl = await _uploadProPic(image);

        myUser user = myUser(name: username, email: email, uid: credential.user!.uid, profilePhoto: downloadUrl);
        await FirebaseFirestore.instance.collection('users').doc(credential.user!.uid).set(user.toJson());
      }else{
        Get.snackbar("Error Creating Account", "Please enter all the required fields");
      }
    }catch(e){
      print(e);
      Get.snackbar("Error Occurred", e.toString());
    }

  }

  void logIn(String email,String password) async{

    try{
      if(email.isNotEmpty && password.isNotEmpty){
        await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
      }else{
        Get.snackbar('Error Occurred', 'Please enter all the fields');
      }
    }catch(e){
      Get.snackbar('Error Occurred', e.toString());
    }
  }

  Future<String> _uploadProPic(File image) async{
    Reference ref = FirebaseStorage.instance.ref().child('profilePics').child(FirebaseAuth.instance.currentUser!.uid);

    UploadTask uploadTask = ref.putFile(image);
    TaskSnapshot snapshot = await uploadTask;
    String imageDwnUrl = await snapshot.ref.getDownloadURL();
    return imageDwnUrl;
  }
}