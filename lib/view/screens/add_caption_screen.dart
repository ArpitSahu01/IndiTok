import 'dart:io';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class addCaption_Screen extends StatefulWidget {

  File videoFile;
  String videoPath;

  addCaption_Screen({
    Key? key,
    required this.videoFile,
    required this.videoPath,
  }) : super(key: key);

  @override
  State<addCaption_Screen> createState() => _addCaption_ScreenState();
}

class _addCaption_ScreenState extends State<addCaption_Screen> {

late VideoPlayerController videoPlayerController;

@override
  void initState() {
    super.initState();
    setState(() {
      videoPlayerController = VideoPlayerController.file(widget.videoFile);
    });
    videoPlayerController.initialize();
    videoPlayerController.play();
    videoPlayerController.setLooping(true);
    videoPlayerController.setVolume(0.7);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height/1.5,
            child: VideoPlayer(videoPlayerController),
          ),
        ],
      ),
    );
  }
}
