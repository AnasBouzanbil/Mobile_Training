import 'package:flutter/material.dart';
import 'package:me/About.dart';
import 'package:me/Home.dart';
import 'package:me/image.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/home',
      routes: {
        '/home': (context) => Home(),
        '/about': (context) => About(),
        '/image': (context) => PictureEditor(),
      },

    )
  );
}
