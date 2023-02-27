import 'dart:io';
import 'package:flutter/material.dart';
import 'package:inditok/constants.dart';
import 'package:video_player/video_player.dart';

import '../widgets/text_input.dart';

class addCaptionScreen extends StatefulWidget {

  File videoFile;
  String videoPath;

   addCaptionScreen({Key? key,required this.videoFile,required this.videoPath}) : super(key: key);

  @override
  State<addCaptionScreen> createState() => _addCaptionScreenState();
}

class _addCaptionScreenState extends State<addCaptionScreen> {

late VideoPlayerController _videoPlayerController;
TextEditingController songNameController = TextEditingController();
TextEditingController captionController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState((){
      _videoPlayerController = VideoPlayerController.file(widget.videoFile);
    });
    _videoPlayerController.initialize();
    _videoPlayerController.play();
    _videoPlayerController.setVolume(0.7);
    _videoPlayerController.setLooping(true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              height: MediaQuery.of(context).size.height/1.5,
              child: VideoPlayer(_videoPlayerController),
            ),
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height/3.5,
              margin: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                TextInputField(
                  controller: songNameController,
                  myIcon: Icons.music_note,
                  myLabelText: 'Song Name',
                ),
                const SizedBox(height: 10,),
                TextInputField(
                  controller: captionController,
                  myIcon: Icons.closed_caption,
                  myLabelText: 'Caption',
                ),
                const SizedBox(height: 10,),
                ElevatedButton(onPressed: (){}, style: ButtonStyle(backgroundColor: MaterialStateProperty.all(buttonColor)),child: const Text('Upload')),
              ],),
            )
          ],
        ),
      ),
    );
  }
}
