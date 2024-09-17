import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:untitled1/components/TextFiled.dart'; // Assuming this is a custom widget
import 'package:untitled1/services/Auth/auth_service.dart';
import 'package:untitled1/services/chat/chat_services.dart';

class Chatpage extends StatefulWidget {
  final String resiveremail; // Assuming this is the receiver's email
  final String uidresciver;

  const Chatpage({super.key, required this.resiveremail, required this.uidresciver});

  @override
  State<Chatpage> createState() => _ChatpageState();
}

class _ChatpageState extends State<Chatpage> {
  final TextEditingController _controller = TextEditingController();
  final ChatServ _chatServ = ChatServ();
  final Authservice _authservice = Authservice();

  void sendMessage() async {
    if (_controller.text.isNotEmpty) {
      await _chatServ.sendMessage(widget.uidresciver, _controller.text);
    }
    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back_ios, color: Colors.cyan,)),
        centerTitle: true,
        title: Text(
          widget.resiveremail,
          style: const TextStyle(fontSize: 12),
        ),
        actions: const [Icon(Icons.block)],
      ),
      body: Column(
        children: [
          Expanded(child: _buildMessagesList()),
          _buildUSERiNPUT(),
        ],
      ),
    );
  }

  Widget _buildMessagesList() {
    String senderid = _authservice.getCurrentUser()!.uid;
    return StreamBuilder(
      stream: _chatServ.getMessages(widget.uidresciver, senderid),
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshots) {
        if (snapshots.hasError) {
          return const Text("An error occurred");
        }
        if (snapshots.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if (!snapshots.hasData || snapshots.data!.docs.isEmpty) {
          return const Text("No messages");
        }

        // Create a ListView for messages
        return ListView(
          children: snapshots.data!.docs.map((doc) => _buildMessageitem(doc)).toList(),
        );
      },
    );
  }
  Widget _buildMessageitem(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    bool iscurrentuser = data['senderId'] == _authservice.getCurrentUser()!.uid;
    Color col = iscurrentuser ? Colors.cyanAccent : Colors.greenAccent;
    Alignment alignment = iscurrentuser ? Alignment.centerRight : Alignment.centerLeft;

    print('Message: ${data['message']}');
    print('SenderId: ${data['senderId']}');
    print('CurrentUser: ${_authservice.getCurrentUser()!.uid}');

    return Align(
      alignment: alignment,
      child: Container(
        // Removing the fixed width to allow the container to size to the text
        decoration: BoxDecoration(
          color: col,
          borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsets.all(12),
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: Text(
          data['message'],
          style: const TextStyle(fontSize: 16),
          softWrap: true,  // Ensures the text wraps
        ),
      ),
    );
  }


  Widget _buildUSERiNPUT() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: Row(
        children: [

          Expanded(
            child: TextFiledI(
              hintTextt: "Type your message",
              controller: _controller,
            ),
          ),
          IconButton(
            onPressed: sendMessage,
            icon: const Icon(Icons.send, color: Colors.cyanAccent,),
          ),
        ],
      ),
    );
  }
}
 