import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:untitled1/services/Auth/Login_register.dart';
import 'package:untitled1/Pages/HomePage.dart';



class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(

      body: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot){
            if (snapshot.hasData)
              {
                return Homepage();
              }
            return LoginRegister();
          }
      ),
    );
  }
}



