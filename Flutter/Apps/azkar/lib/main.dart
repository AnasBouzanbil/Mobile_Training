import 'package:azkar/CategoriesPage/cubit/categories_cubit.dart';
import 'package:azkar/HomePage/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp( MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    
      showSemanticsDebugger: false,
      debugShowCheckedModeBanner: false,
      title: 'Azkar',


      home: Directionality(textDirection: TextDirection.rtl, child: 
      HomePage(),)
    );
  }
}
