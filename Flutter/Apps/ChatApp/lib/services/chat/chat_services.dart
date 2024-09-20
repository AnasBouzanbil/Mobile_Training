import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:untitled1/Models/message.dart';

class ChatServ {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Stream<List<Map<String, dynamic>>> getuserStream() {
    return _firestore.collection("Users").snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        final user = doc.data();
        print("User data: ");
        print(user);
        return user;
      }).toList();
    });
  }
  Future<void> sendMessage(String userid, message) async{
    final String _userid = _auth.currentUser!.uid;
    final String _email = _auth.currentUser!.email!;
    final Timestamp _time = Timestamp.now();
    
    Message _newmessage = Message(senderEmail: _email, reciverId: userid, senderId: _userid, message: message, time: _time);
    List<String> ids = [_userid, userid];
    ids.sort();
    String Roomtid = ids.join('_');
    await _firestore.collection('chat_rooms').doc(Roomtid).collection("messages").add(_newmessage.toMap());











  }
  Stream<QuerySnapshot> getMessages(String userid, otheruser){

    List<String> ids = [userid, otheruser];
    ids.sort();

    String chartRoomId = ids.join('_');
    return _firestore.collection('chat_rooms').doc(chartRoomId).collection("messages").orderBy('time', descending: false).snapshots();


  }


}
