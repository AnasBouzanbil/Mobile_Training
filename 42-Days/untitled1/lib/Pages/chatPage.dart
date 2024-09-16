import 'package:flutter/material.dart';


class Chatpage extends StatefulWidget {

  final String resiveremail;
  const Chatpage({super.key,
  required this.resiveremail
  });

  @override
  State<Chatpage> createState() => _ChatpageState();
}

class _ChatpageState extends State<Chatpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(widget.resiveremail, style: TextStyle(fontSize: 12),),
        actions: [
          Icon(Icons.block)
        ],
      ),
      body: Text("Start your genery with " + widget.resiveremail),
    
    );
    
  }
}


