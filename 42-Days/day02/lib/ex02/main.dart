import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';

class Ex02 extends StatefulWidget {
  const Ex02({super.key});

  @override
  State<Ex02> createState() => _Ex02State();
}

class _Ex02State extends State<Ex02> {
  double _circleX = 0;
  double _circleY = 0;
  int _score = 0;
  double _circleRadius = 40;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startGame();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  // Function to randomly move the circle on the screen
  void _startGame() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        _randomizePosition();
      });
    });
  }

  // Randomize the circle's position
  void _randomizePosition() {
    final random = Random();
    _circleX = random.nextDouble() * 300; // X position
    _circleY = random.nextDouble() * 500; // Y position
  }

  // Function when the user taps the circle
  void _onCircleTap() {
    setState(() {
      _score++;
      _randomizePosition(); // Move the circle to a new position
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Catch the Circle - Score: $_score'),
        backgroundColor: Colors.teal[400],
      ),
      body: Stack(
        children: [
          Positioned(
            left: _circleX,
            top: _circleY,
            child: GestureDetector(
              onTap: _onCircleTap,
              child: Container(
                width: _circleRadius * 2,
                height: _circleRadius * 2,
                decoration: BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.5),
                      blurRadius: 10,
                      spreadRadius: 5,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
