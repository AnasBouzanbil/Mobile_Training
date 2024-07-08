import 'package:flutter/material.dart';
String aloha = "A simple text";
int a = 0;
void main()
{
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: "ex01",
      home: Mymow(),
    );
  }
}

class Mymow extends StatefulWidget {
  @override
  Myhome createState() => Myhome();
}

class  Myhome extends State<Mymow> {
  @override
  Widget build(BuildContext context){

    return Material(
      color: Colors.white70,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.lime[900],
                borderRadius: BorderRadius.circular(9.0),
              ),
              padding: const  EdgeInsets.all(9.3),

              child:  Text(
                aloha,
                style: const TextStyle(
                  fontSize: 18.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        const   SizedBox(height: 2),
          ElevatedButton(onPressed: (){


            setState(() {
              if (a == 1) {
                aloha = "Hello 1337";
                a = 0;
              }
              else
                {
                  aloha = "A simple text";
                  a = 1;
                }
            });
          }
              , child: const Text(
              "click me"

          ),
          ),
        ],
      ),

    );
  }
}