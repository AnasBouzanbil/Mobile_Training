import 'package:flutter/material.dart';



class MyButton extends StatefulWidget {
  final void Function ()? onTap;

  final String textbutton;



   MyButton({super.key,
  required this.textbutton,
    required this.onTap,
  });


  @override
  State<MyButton> createState() => _MyButtonState();
}

class _MyButtonState extends State<MyButton> {
  double horiz = 100;
  double raduious = 40;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,  // Access onTap from widget
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: horiz),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(raduious)),
            color: Colors.blue,
          ),
          height: 50,
          child: Center(
            child: Text(widget.textbutton),  // Access textbutton from widget
          ),
        ),
      ),
    );
  }
}