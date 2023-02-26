import 'package:flutter/material.dart';
import 'package:inditok/view/widgets/glitch.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: GlithEffect(child: Text('Welcome to HomeScreen',style: TextStyle(fontWeight: FontWeight.w900,fontSize:30)))));
  }
}
