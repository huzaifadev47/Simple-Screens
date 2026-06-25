import 'package:flutter/material.dart';
import 'package:screens/screens/musicplayer.dart';
import 'package:screens/screens/practice.dart';

void main(){
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MusicPlayer(),
    );
  }
}