import 'package:flutter/material.dart';
import 'package:untitled1/Pages/chatPage.dart';
import 'package:untitled1/components/usertile.dart';
import 'package:untitled1/services/Auth/auth_service.dart';
import 'package:untitled1/components/my_drawer.dart';
import 'package:untitled1/services/chat/chat_services.dart';

class Homepage extends StatelessWidget {
  final ChatServ _charserv = ChatServ();
  final Authservice _authservice = Authservice();

  Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
      ),
      drawer: MyDrawer(),
      body: _buildUsersList(), // Add _buildusersList() in the body to show the list
    );
  }

  Widget _buildUsersList() {
    return StreamBuilder(
      stream: _charserv.getuserStream(),
      builder: (context, snapshots) {
        if (snapshots.hasError) {
          return Center(child: Text("Error"));
        }
        if (snapshots.connectionState == ConnectionState.waiting) {
          return Center(child: Text("Loading"));
        }
        // Ensure snapshots.data is treated as List<Map<String, dynamic>> and safely accessed
        var userList = snapshots.data as List<Map<String, dynamic>>;

        return ListView.separated(
          itemCount: userList.length,
          separatorBuilder: (context, index) => Container(),
          itemBuilder: (context, index) => _buildusersListItem(userList[index], context),
        );
      },
    );
  }


  Widget _buildusersListItem(Map<String, dynamic> userData, BuildContext context) {
    if (userData['email'] != _authservice.getCurrentUser()!.email)
      {
        return Usertile(
          text: userData['email'],
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Chatpage(uidresciver :userData['uid'],  resiveremail: userData['email']),)
            );
          },
        );
      }
    else
      {
        return Container();
      }
  }
}

