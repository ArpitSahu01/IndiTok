import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:inditok/view/screens/auth/login_screen.dart';
import 'package:get/get.dart';
import 'package:inditok/view/screens/auth/signup_screen.dart';
import './constants.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: backgroundColor,
      ),
      home: SignupScreen(),
    );
  }
}
