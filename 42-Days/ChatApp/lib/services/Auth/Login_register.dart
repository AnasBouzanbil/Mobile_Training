import 'package:flutter/material.dart';
import 'package:untitled1/Pages/Login.dart';
import 'package:untitled1/Pages/Register.dart';



class LoginRegister extends StatefulWidget {
  const LoginRegister({super.key});

  @override
  State<LoginRegister> createState() => _LoginRegisterState();
}

class _LoginRegisterState extends State<LoginRegister> {
  bool showlogin = true;
  void toggel(){
    setState(() {showlogin = !showlogin;

    });
  }

  @override
  Widget build(BuildContext context) {
    if (showlogin)
      {
        return LoginPage(toggle: toggel);
      }
    else
      {
        return Register(toggle:  toggel);
      }
  }
}
