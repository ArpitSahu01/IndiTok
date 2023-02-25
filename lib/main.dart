import 'package:flutter/material.dart';
import 'package:inditok/constants.dart';
import 'package:inditok/view/screens/auth/login_screen.dart';
import 'package:inditok/view/screens/auth/signup_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: backgroundColor,
      ),
      home: SignupScreen(),
    );
  }
}
