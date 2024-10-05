
import 'package:cih/pages/home/home.dart';
import 'package:flutter/material.dart';


class login extends StatelessWidget {
  const login({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: IconButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (BuildContext)=> Home()));}, icon: Icon(Icons.login)),
      ),
    );
  }
}
