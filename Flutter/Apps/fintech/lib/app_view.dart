import 'package:fintech/screens/Home/views/Cards.dart';
import 'package:fintech/screens/Home/views/HomeScreen.dart';
import 'package:fintech/screens/Home/views/Loginpage.dart';
import 'package:fintech/screens/Home/views/Transiction.dart';
import 'package:flutter/material.dart';


class AppView extends StatelessWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "CIA App",
      debugShowCheckedModeBanner: false,
      color: Colors.grey.shade200,

      theme: ThemeData(

        colorScheme: ColorScheme.light(
            background: Colors.grey.shade500,
            onBackground: Colors.black,
            primary: const Color(0XFF00B2E7),
            secondary: const Color(0XFFE064F7),
            tertiary: const Color(0XFFFF8D6C)
      ),
      ),
        home:  LoginPage(),
    );
  }
}
