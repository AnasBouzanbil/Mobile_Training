///  ******************************************************************************
///  Created By: Anas Bouzanbil
///  At time of creation: [Specify date/time here]
///  Last time modified: [Specify last modification date/time here]
///  Explaining: This widget is responsible for displaying a detailed description
///  of a given Hadith, including its headline and formatted content, in a
///  user-friendly interface with proper styling.
///******************************************************************************//


 
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const Color customTealColor = Color(0xFF00796B);

class ShowHadithDescription extends StatelessWidget {
  final String hadithHeadline = "شرح وفوائد الحديث";
  final String hadith;

  const ShowHadithDescription({required this.hadith, super.key});

  @override
  Widget build(BuildContext context) {
    final formattedHadith = hadith.replaceAll("شرح وفوائد الحديث", "");
    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F9),
      appBar: AppBar(
        title: const Text("شرح الحديث"),
        centerTitle: true,
        backgroundColor: customTealColor,
        elevation: 5,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                hadithHeadline,
                style: GoogleFonts.amiri(
                  fontSize: 26,
                  color: customTealColor,
                  fontWeight: FontWeight.w600,
                ),
                textDirection: TextDirection.rtl,
              ),
              const SizedBox(height: 30),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      blurRadius: 5,
                      spreadRadius: 1,
                    ),
                  ],
                ),
                padding: const EdgeInsets.all(20),
                child: Text(
                  formattedHadith,
                  style: GoogleFonts.amiri(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: customTealColor,
                  ),
                  textAlign: TextAlign.center,
                  textDirection: TextDirection.rtl,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
