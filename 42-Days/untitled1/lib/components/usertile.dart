import 'package:flutter/material.dart';


class Usertile extends StatelessWidget {

  final String text;
  final void Function()? onTap;
   Usertile({super.key,
   required this.text,
     required this.onTap
   });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap, // Trigger onTap when the widget is tapped
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black, // Set the background color to black
          borderRadius: BorderRadius.circular(5.0),
        ),
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        margin: EdgeInsets.all(20),
        child: Row(
          children: [
            Icon(
              Icons.person,
              color: Colors.white, // Set icon color to white
            ),
            SizedBox(width: 10), // Adds space between the icon and text
            Text(
              text,
              style: TextStyle(fontSize: 18, color: Colors.white), // Set text color to white
            ),
          ],
        ),
      ),
    );
  }
}