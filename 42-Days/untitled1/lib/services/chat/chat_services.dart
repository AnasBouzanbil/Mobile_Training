import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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


  }

}
