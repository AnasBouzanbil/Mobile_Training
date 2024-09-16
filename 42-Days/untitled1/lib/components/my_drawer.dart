import 'package:flutter/material.dart';
import 'package:untitled1/services/Auth/auth_service.dart';


class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return  Drawer(
      backgroundColor: Colors.grey,

      //Logo
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children:[
          Column(
        children: [
          DrawerHeader(child: Icon(Icons.message, size: 40,)),
          Padding(
            padding: EdgeInsets.only(left: 25),
            child: ListTile(
              title: Text("H O M E"),
              leading: Icon(Icons.home),
              onTap: (){
                Navigator.pop(context);

              },
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 25),
            child: ListTile(
              title: Text("S E T T I N G S"),
              leading: Icon(Icons.settings),
              onTap: (){
                Navigator.pushNamed(context, '/settings');

              },
            ),
          ),


        ],


      ),
          Padding(
            padding: const EdgeInsets.only(left: 25, bottom: 40),
            child: ListTile(
              title: Text("L O G  O U T"),
              leading: Icon(Icons.logout),
              onTap: (){
                final Auth  = Authservice();
                Auth.signout();
              },
            ),
          ),
    ],

    )


      //HomeList



      // /setting list title



      // logout list title

    );
  }
}
