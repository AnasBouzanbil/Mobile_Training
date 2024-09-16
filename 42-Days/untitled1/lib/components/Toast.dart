
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
void showToast(String str, Color col) {
  Fluttertoast.showToast(
    msg: str,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.TOP,
    backgroundColor: Colors.cyan,
    textColor:col,
  );
}