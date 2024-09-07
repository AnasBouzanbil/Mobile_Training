import 'package:flutter/material.dart';

class ex01 extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<ex01> {
  String mytext = "A new String String";
  int i = 0;

  void _toggleText() {
    setState(() {
      if (i == 0) {
        i = 1;
        mytext = "Hello World!";
      } else {
        i = 0;
        mytext = "A new String String";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ex01'),

        backgroundColor: Colors.blueAccent,
        centerTitle: true,
      ),
      body: Center(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(mytext,
            style: TextStyle(
              backgroundColor: Colors.amber,
              color: Colors.black,
              fontSize: 20,

            ),),
            SizedBox(height: 30),
            TextButton(

              style: TextButton.styleFrom(
                backgroundColor: Colors.cyanAccent,
                // Set the background color here
                padding: EdgeInsets.all(
                    16.0), // Optional: Add padding for better appearance
              ),
              onPressed: _toggleText,
              child: Text(
                'Press the button ',
                style: TextStyle(
                  backgroundColor: Colors.cyanAccent,
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}