import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyPage(),
    );
  }
}

class MyPage extends StatefulWidget {
  const MyPage({super.key});

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  int _index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,

      body:  Center(

        child: Text(
          "The index is \n" + _index.toString(),
          style: TextStyle(color: Colors.cyan,
          fontSize: 40,
            fontWeight: FontWeight.w900
          ),
        ),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.deepPurple,
        color: Colors.deepPurple.shade300,
        onTap: (index){
          setState(() {
            _index = index;
          });
        },
        items: const [
          Icon(Icons.home , color: Colors.white,),
          Icon(Icons.heart_broken),
          Icon(Icons.settings),
        ],
      ),
    );
  }
}
