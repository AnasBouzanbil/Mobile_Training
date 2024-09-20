import 'package:flutter/material.dart';
import 'package:movieapp/ex02/culculator.dart';



class ex02 extends StatefulWidget {
  const ex02({super.key});

  @override
  State<ex02> createState() => _ex02State();
}

class _ex02State extends State<ex02> {
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: 'ex00',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Culc(),

    );
  }
}



