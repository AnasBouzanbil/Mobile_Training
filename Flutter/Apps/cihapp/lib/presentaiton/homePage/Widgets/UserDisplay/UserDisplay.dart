import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';



class Userdisplay extends StatelessWidget {
  const Userdisplay({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.grey.shade200
      ),

      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Row(
            children: [
              Container(
                width: 40, // Set appropriate width and height for the container
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                ),
                child: ClipRRect( // Clip the SVG to fit within rounded corners
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset(
                    "assets/images/AvatarMaker.png",
                    fit: BoxFit.cover, // Ensures the SVG fits properly within the container
                  ),
                ),
              ),
              SizedBox(width: 10,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start, // Ensures left alignment

                children: [
                  Text("Welcome Back", style: TextStyle(
                    fontSize: 10,
                    color: Colors.grey.shade500,
                    fontWeight: FontWeight.w100
                  ),),
                  SizedBox(height: 3,),
                  Text("Demno client",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,

                  ),
                  ),
                ],

              ),

              Spacer(),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white,
                  border: Border.all(color: Colors.black45, width: 1)

                ),
                child: IconButton(onPressed: (){},  icon: Icon(Icons.notification_add_sharp)),
              )
            ]
        ),
      ),
    );
  }
}
