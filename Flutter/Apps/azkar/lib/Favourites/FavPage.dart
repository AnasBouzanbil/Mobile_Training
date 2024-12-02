import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Favpage extends StatelessWidget {
  const Favpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("المفضلة",
        style: GoogleFonts.amiri(
          fontSize: 25,
          fontWeight: FontWeight.bold,
          color: Colors.white
        ),
        ),
        backgroundColor: Colors.brown[800],
        
      ),
    );
  }
}