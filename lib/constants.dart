import 'dart:math';
import 'package:flutter/material.dart';
import 'package:inditok/view/screens/add_vedio.dart';


getRandomColor() =>[
  Colors.blueAccent,
  Colors.redAccent,
  Colors.greenAccent,
][Random().nextInt(3)];

// COLORS
const backgroundColor = Colors.black;
var buttonColor = Colors.red[400];
const borderColor = Colors.grey;

var pageIndexValues=[
  Center(child: Text('Home')),
  Center(child: Text('Search')),
  AddVideoScreen(),
  Center(child: Text('Message')),
  Center(child: Text('Profile')),
];