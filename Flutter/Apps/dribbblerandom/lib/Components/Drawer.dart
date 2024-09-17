import 'package:dribbblerandom/pages/HomePage.dart';
import 'package:dribbblerandom/pages/settings.dart';
import 'package:flutter/material.dart';



class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return  Drawer(
      child: Column(
        children: [
          DrawerHeader(child: Center(child: Icon(Icons.music_note_outlined, size: 50, color: Colors.cyanAccent.shade700,))),

          Padding(
            padding: const EdgeInsets.only(left: 25.0, top: 25.0),
            child: ListTile(
              title: Text("H O M E"),
              leading: Icon(Icons.home),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> Homepage()));
              },
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(left: 25.0, top: 25.0),
            child: ListTile(
              title: Text("S E T T I N G S"),
              leading: Icon(Icons.settings),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> Settings()));
              },
            ),
          ),

        ],
      ),
    );
  }
}
