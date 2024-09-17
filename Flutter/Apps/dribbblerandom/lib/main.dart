import 'package:dribbblerandom/Themes/Light_Modes.dart';
import 'package:dribbblerandom/Themes/themeProvider.dart';
import 'package:dribbblerandom/pages/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(create: (context)=>ThemeProvider(),

   child: const     MyApp()

  ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Homepage(),
      theme: Provider.of<ThemeProvider>(context).themedata,
    );
  }
}