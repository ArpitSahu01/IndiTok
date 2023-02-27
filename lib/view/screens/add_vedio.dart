import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:inditok/constants.dart';
import 'dart:io';
import 'package:inditok/view/screens/addcaption_screen.dart';


class AddVideoScreen extends StatelessWidget {
  const AddVideoScreen({Key? key}) : super(key: key);

  showDialogOpt(BuildContext context){
    return showDialog(context: context, builder: (ctx)=>SimpleDialog(
      children: [
        SimpleDialogOption(
          onPressed: ()=>videoPicker(ImageSource.gallery,context).then(
            Navigator.of(context).pop()
          ),
          child: Text("Gallery"),
        ),
        SimpleDialogOption(
          onPressed: ()=>videoPicker(ImageSource.camera,context).then(
              Navigator.of(context).pop()
          ),
          child: Text("Camera"),
        ),
        SimpleDialogOption(
          onPressed: (){
            Navigator.pop(context);
          },
          child: Text("Close"),
        ),
      ],
    ));
  }
  
  videoPicker(ImageSource source,BuildContext context) async{
    final video = await ImagePicker().pickVideo(source: source);
    if(video !=null){
      Get.snackbar('Video Selected', video.path);
      Navigator.push(context, MaterialPageRoute(builder: (context)=>addCaptionScreen(videoFile: File(video.path), videoPath: video.path)));
    }else{
      Get.snackbar('Error in selecting Video', 'Please choose a different video');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InkWell(
          onTap: ()=>showDialogOpt(context),
          child: Container(
            height: 60,
            width: 200,
            decoration: BoxDecoration(
              color: buttonColor,
              borderRadius: BorderRadius.circular(10)
            ),
            child: Center(
              child: Text("Add Vedio",style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w900
              ),),
            ),
          ),
        ),
      ),
    );
  }
}
