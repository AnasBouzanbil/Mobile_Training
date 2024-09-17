import 'package:dribbblerandom/Components/Drawer.dart';
import 'package:flutter/material.dart';


class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  static const String routeName = '/homepage';  // Define a route name for the Homepage

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        centerTitle: true,
        title: Text('PLAY LIST' ,
        style: TextStyle(
            fontSize: 30,
          fontWeight: FontWeight.w900
        ),
        ),
      ),
      drawer: MyDrawer(),


    );
  }
}
