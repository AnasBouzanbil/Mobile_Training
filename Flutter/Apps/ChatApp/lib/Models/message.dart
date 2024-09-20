import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';



class Message{
  final String senderId;
  final String reciverId;
  final String senderEmail;
  final String message;
  final Timestamp time;

  Message({
    required this.senderEmail,
    required this.reciverId,
  required this.senderId,
  required this.message,
  required this.time
});
  Map<String, dynamic> toMap(){
    return {
      'senderId': senderId,
      'senderEmail' : senderEmail,
      'reciverId' : reciverId,
      'message' : message,
      'time' : time
    };
  }
}