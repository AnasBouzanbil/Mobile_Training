import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:untitled1/services/Auth/Login_register.dart';
import 'package:untitled1/Pages/Login.dart';
import 'package:untitled1/Pages/Register.dart';
import 'package:untitled1/Pages/Settings.dart';
import 'package:untitled1/components/Button.dart';
import 'package:untitled1/components/TextFiled.dart';
import 'package:untitled1/firebase_options.dart';
import 'package:untitled1/services/Auth/AUth_gate.dart';

void main() async{

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      routes: {
        '/settings' :  (context) => Settings()
      },
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: AuthGate(),

    );
  }
}

