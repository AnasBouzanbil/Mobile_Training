import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:randomfigmadesign/ContentPage/ContentPage.dart';
import 'package:randomfigmadesign/Homepgae/Homepage.dart';



class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    // Set a timeout of 3 seconds to navigate to the next screen
    Future.delayed(Duration(milliseconds: 1), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => Homepage()),
      );
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(

          decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,

                colors: [
                  Colors.blue.shade600,
                  Colors.blue.shade800,


                  Color(0xFF015994),
                ],
              )
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Travel",
                    style: GoogleFonts.lobster(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 44,
                    ),
                  ),

                  Icon(Icons.airplane_ticket_outlined, size: 30, color: Colors.white,)
                ],
              ),
                   SizedBox(height: 20,),
                   Text("  Find Your Dream \nDestination With Us",
                    style: GoogleFonts.roboto(
                      fontSize: 20,
                      color: Colors.white


                    ),
                    ),

            ],
          ),
        ),
      ),
    );
  }
}
