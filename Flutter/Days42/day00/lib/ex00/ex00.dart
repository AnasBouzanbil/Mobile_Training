

import 'package:flutter/material.dart';
import 'package:movieapp/main.dart';


class ex00 extends StatelessWidget {
  const ex00({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home : Scaffold(
        appBar: AppBar(
          leading: IconButton(onPressed: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const MyApp()),
            );
          },
          icon: Icon(Icons.exit_to_app),
          ),

          backgroundColor: Colors.blueAccent,
          centerTitle: true,
          title: Text('EX00'),
        ),
        body: Center(
          child: TextButton(onPressed: (){
            print('  button has just beeen pressed');
          }, child: Text(
            'A First SHit',
                style: TextStyle(
              fontSize: 15,
                  fontWeight: FontWeight.bold
          ),
          ))


        )
      )
    );
  }
}
