import 'package:flutter/material.dart';
import 'package:movieapp/ex00/ex00.dart';
import 'package:movieapp/ex01/ex01.dart';
import 'package:movieapp/ex02/culculator.dart';
import 'package:movieapp/ex02/ex02.dart';
import 'package:movieapp/ex03/main.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> buttonLabels = ['Ex00', 'Ex01', 'Ex02', 'Ex03', 'Surprise'];

    return MaterialApp(
      home: Scaffold(
        appBar: buildAppBar(),
        body: ListView.builder(
          itemCount: buttonLabels.length,
          itemBuilder: (context, index){
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: ElevatedButton(
                onPressed: () {
                  if (index == 0)
                    {
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ex00()),
                          );
                    }
                  else if (index == 1)
                    {
                      Navigator.push(
                          context,
                    MaterialPageRoute(builder: (context) => ex01()),
                  );
                    }
                  else if (index ==2){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ex02()),
                    );
                  }
                  else if (index ==3){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ex03()),
                    );
                  }
                },
                child: Text(buttonLabels[index]),
              ),

            );

          }
        )

      ),

    );
  }

  AppBar buildAppBar() {
    return AppBar(
        backgroundColor: Colors.cyan,

        centerTitle: true,
        title : HoverTitle(),

      );
  }
}

class HoverTitle extends StatefulWidget {
  @override
  _HoverTitleState createState() => _HoverTitleState();
}

class _HoverTitleState extends State<HoverTitle> {
  Color _textColor = Colors.lightGreenAccent;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() {
        _textColor = Colors.yellow;  // Change to any color you want on hover
      }),
      onExit: (_) => setState(() {
        _textColor = Colors.lightGreenAccent;  // Original color when not hovering
      }),
      child: Text(
        'Choose Day',
        style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
          color: _textColor,
        ),
      ),
    );
  }
}

PageRouteBuilder _createPageRoute(Widget page) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(8.0, 3.0);
      const end = Offset.zero;
      const curve = Curves.easeInOut;
      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
      var offsetAnimation = animation.drive(tween);
      return SlideTransition(position: offsetAnimation, child: child);
    },
  );
}
