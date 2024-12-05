import 'package:azkar/CategoriesPage/cubit/categories_cubit.dart';
import 'package:azkar/HomePage/AdanShown/cubit/get_adan_cubit.dart';
import 'package:azkar/HomePage/HomePage.dart';
import 'package:azkar/HomePage/cubit/featchingnewdata_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => DailyDataCubit()..fetchDailyData()),
        BlocProvider(create: (_) => CategoriesCubit()..loadCategories()),
        BlocProvider(create: (_) => GetAdanCubit()..fetchAdanTimings()),
      ],
      child: MyApp(),
    ),
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
      home: Directionality(
        textDirection: TextDirection.rtl,
        child: HomePage(),
      ),
    );
  }
}
