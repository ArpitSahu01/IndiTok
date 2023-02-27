import 'dart:io';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class addCaptionScreen extends StatefulWidget {

  File videoFile;
  String videoPath;

   addCaptionScreen({Key? key,required this.videoFile,required this.videoPath}) : super(key: key);

  @override
  State<addCaptionScreen> createState() => _addCaptionScreenState();
}

class _addCaptionScreenState extends State<addCaptionScreen> {

late VideoPlayerController _videoPlayerController;
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
      body: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height/1.5,
        child: VideoPlayer(_videoPlayerController),
      ),
    );
  }
}
