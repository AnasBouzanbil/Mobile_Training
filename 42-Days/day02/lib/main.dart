import 'package:day02/ex00/main.dart';
import 'package:day02/ex01/main.dart';
import 'package:day02/ex02/main.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Day 02',
      // Defining routes
      routes: {
        '/': (context) => const HomeScreen(), // Root route should point to HomeScreen or similar
        '/ex00': (context) => const Ex00()   , // Named route for Ex00
        '/ex01': (context) => const Ex01(),    // Named route for Ex01
        '/ex02': (context) => const Ex02(),    // Named route for Ex02
      },
      initialRoute: '/',  // Initial route set to HomeScreen
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                // Navigate to ex00 using named route
                Navigator.pushNamed(context, '/ex00');
              },
              child: const Text('Go to Ex00'),
            ),
            ElevatedButton(
              onPressed: () {
                // Navigate to ex01 using named route
                Navigator.pushNamed(context, '/ex01');
              },
              child: const Text('Go to Ex01'),
            ),
            ElevatedButton(
              onPressed: () {
                // Navigate to ex02 using named route
                Navigator.pushNamed(context, '/ex02');
              },
              child: const Text('Go to Ex02'),
            ),
          ],
        ),
      ),
    );
  }
}