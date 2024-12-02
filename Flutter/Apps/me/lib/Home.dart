import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sliding_sheet/sliding_sheet.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final Shader headerGradient = LinearGradient(
    colors: [Colors.blue, const Color.fromARGB(255, 37, 94, 0)],
  ).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));

  final Shader highlightGradient = LinearGradient(
    colors: <Color>[
      const Color.fromARGB(255, 53, 255, 63),
      const Color.fromARGB(255, 255, 237, 73),
      const Color.fromARGB(255, 255, 174, 123),
      const Color.fromARGB(255, 254, 162, 162),
      const Color.fromARGB(255, 175, 255, 14),


    ],
  ).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));

  final Shader overallTextGradient = LinearGradient(
    colors: [
      const Color.fromARGB(255, 35, 51, 194),
      const Color.fromARGB(255, 150, 27, 180),
      const Color.fromARGB(255, 255, 0, 0),
      const Color.fromARGB(255, 255, 255, 255),
      const Color.fromARGB(255, 44, 255, 244),
      const Color.fromARGB(255, 0, 255, 0),
    ],
  ).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));

  Widget mySkills(String num, String type) {
    return Row(
      children: [
        Text(
          num,
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            foreground: Paint()..shader = overallTextGradient,
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 10),
          child: Text(type),
        ),
      ],
    );
  }

  Widget mySpeciality(IconData icon, String text) {
    return SizedBox(
      width: 105,
      height: 115,
      child: Card(
        color: const Color.fromARGB(255, 30, 31, 30),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: Colors.white),
            const SizedBox(height: 10),
            Text(
              text,
              style: TextStyle(
                foreground: Paint()..shader = highlightGradient,

                fontSize: 15,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.white,
        leading: PopupMenuButton(
          icon: const Icon(Icons.menu, color: Colors.white),
          itemBuilder: (context) => [
            PopupMenuItem(
              child: TextButton(
                onPressed: () => Navigator.pushNamed(context, '/projects'),
                child: const Text('Projects'),
              ),
            ),
            PopupMenuItem(
              child: TextButton(
                onPressed: () => Navigator.pushNamed(context, '/about'),
                child: const Text('About Me'),
              ),
            ),
            PopupMenuItem(child: TextButton(
              onPressed: () => Navigator.pushNamed(context, '/image'),
              child: const Text('Picture Editor'),
            ),
            ),
          ],
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(255, 19, 16, 16),
              Color.fromARGB(255, 0, 0, 0),
            ],
          ),
        ),
        child: SlidingSheet(
          elevation: 8,
          cornerRadius: 16,
          snapSpec: const SnapSpec(
            snap: true,
            snappings: [0.4, 0.7, 1.0],
            positioning: SnapPositioning.relativeToAvailableSpace,
          ),
         body: Container(
  width: double.infinity,
  height: MediaQuery.of(context).size.height * 0.6,
  decoration: BoxDecoration(
    image: const DecorationImage(
      image: AssetImage('assets/me.jpg'),
      fit: BoxFit.cover,
    ),
  ),
),

builder: (context, state) {
  return Container(
    decoration: const BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(16),
        topRight: Radius.circular(16),
      ),
    ),
    child: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                "Hello, I'm Anas",
                style: TextStyle(
                  fontSize: 30,
                  foreground: Paint()..shader = overallTextGradient,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                mySkills("32k", "Lines of Code"),
                mySkills("2", "Years of coding Experience"),
              ],
            ),
            const SizedBox(height: 10),
            const Text(
              "Working with:",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    mySpeciality(FontAwesomeIcons.c, "C++"),
                    mySpeciality(FontAwesomeIcons.c, "C"),
                    mySpeciality(FontAwesomeIcons.dartLang, "Dart"),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    mySpeciality(FontAwesomeIcons.js, "JavaScript"),
                    mySpeciality(FontAwesomeIcons.flutter, "Flutter"),
                    mySpeciality(FontAwesomeIcons.react, "React"),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    mySpeciality(FontAwesomeIcons.nodeJs, "Node.js"),
                    mySpeciality(FontAwesomeIcons.python, "Python"),
                    mySpeciality(FontAwesomeIcons.gitAlt, "Git"),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    mySpeciality(FontAwesomeIcons.github, "Github"),
                    mySpeciality(FontAwesomeIcons.database, "SQL"),
                    mySpeciality(FontAwesomeIcons.gitAlt, "Git"),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    mySpeciality(FontAwesomeIcons.docker, "Docker"),
                    mySpeciality(FontAwesomeIcons.react, "React Native"),
                    mySpeciality(FontAwesomeIcons.java, "Java"),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
},

        ),
      ),
    );
  }
}