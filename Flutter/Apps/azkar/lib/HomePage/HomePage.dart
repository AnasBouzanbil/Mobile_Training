import 'package:azkar/AzkarPage/TasbihPage.dart';
import 'package:azkar/CategoriesPage/AzkarPage.dart';
import 'package:azkar/HomePage/DailyDataPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_islamic_icons/flutter_islamic_icons.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = PageController(
    initialPage: 0,
  );

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
    backgroundColor: Color(0xFFDAD0E1),
    body: PageView(
      controller: controller,
      children: [
        DailyDataPage(),
        Categories(),
         AsmaaAllahWidget(),
      ],
    ),


    bottomNavigationBar: BottomNavigationBar(
      backgroundColor: Colors.brown[100],

      selectedItemColor: Colors.brown[800],
      selectedLabelStyle: GoogleFonts.amiri(
        fontSize: 15),
      unselectedLabelStyle: GoogleFonts.amiri(),

      currentIndex: currentIndex,
      onTap: (position){
        setState(() {
          currentIndex = position;
        });
        controller.animateToPage(position, duration: Duration(milliseconds: 500),    curve: Curves.easeInOut);
      }
      ,
      items: 
    [
      BottomNavigationBarItem(icon: Icon(Icons.home),label: "الرئيسية"),
      BottomNavigationBarItem(icon: Icon(FlutterIslamicIcons.prayer),label: "الأذكار"),
      BottomNavigationBarItem(icon: Icon(FlutterIslamicIcons.allah),label: "أسماء الله"),
    ]
    ),
     
    );
  }
}
