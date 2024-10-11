import 'package:cihapp/presentaiton/Conf/Provider/Provider.dart';
import 'package:cihapp/splash/Widgets/input.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:math'; // For shuffling numbers

class Signin extends StatelessWidget {
  Signin({super.key});

  @override
  Widget build(BuildContext context) {
    final localeProvider = Provider.of<LocaleProvider>(context);
    TextEditingController _username = TextEditingController();
    TextEditingController _password = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 0.0, right: 0),
          child: Column(
            children: [
              Container(
                height: localeProvider.screenHeight / 3.5,
                color: Colors.blueAccent.shade400,
              ),
              SizedBox(height: 50),
              UserInput(controller: _username),
              SizedBox(height: 20),
              PasswordInput(pass: _password),
              SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.only(right: 19.0),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      "Forgot Password",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                ),
              ),
              KeyboardScreen(usernameController: _username, passwordController: _password), // Custom Keyboard Integration
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

class KeyboardScreen extends StatefulWidget {
  final TextEditingController usernameController;
  final TextEditingController passwordController;

  KeyboardScreen({required this.usernameController, required this.passwordController});

  @override
  _KeyboardScreenState createState() => _KeyboardScreenState();
}

class _KeyboardScreenState extends State<KeyboardScreen> {
  String input = '';
  List<String> numbers = ['1', '7', '4', '0', '9', '6', '8', '3', '2']; // Numbers layout

  @override
  void initState() {
    super.initState();
    numbers.shuffle(); // Shuffle numbers when the screen loads
  }

  void _addNumber(String number) {
    setState(() {
      input += number;
    });

    widget.usernameController.text += number; // Integrate with username input
  }

  void _clearInput() {
    setState(() {
      input = '';
    });

    widget.usernameController.clear(); // Clear controller input
  }

  void _deleteInput() {
    setState(() {
      if (input.isNotEmpty) {
        input = input.substring(0, input.length - 1);
      }
    });

    if (widget.usernameController.text.isNotEmpty) {
      widget.usernameController.text = widget.usernameController.text.substring(0, widget.usernameController.text.length - 1); // Delete last character in controller
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          input,
          style: TextStyle(fontSize: 36),
        ),
        CustomKeyboard(
          onNumberTap: _addNumber,
          onDeleteTap: _deleteInput,
          onClearTap: _clearInput,
          numbers: numbers, // Pass shuffled numbers
        ),
      ],
    );
  }
}

class CustomKeyboard extends StatelessWidget {
  final Function(String) onNumberTap;
  final VoidCallback onDeleteTap;
  final VoidCallback onClearTap;
  final List<String> numbers;

  CustomKeyboard({
    required this.onNumberTap,
    required this.onDeleteTap,
    required this.onClearTap,
    required this.numbers,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final buttonSize = screenWidth * 0.15; // Dynamically set button size based on screen width

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildKey(numbers[0], buttonSize),
            _buildKey(numbers[1], buttonSize),
            _buildKey(numbers[2], buttonSize),
            _buildKey(numbers[3], buttonSize),
            GestureDetector(
              onTap: onDeleteTap,
              child: _buildKey('🗑️', buttonSize), // Delete button icon
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildKey(numbers[4], buttonSize),
            _buildKey(numbers[5], buttonSize),
            _buildKey(numbers[6], buttonSize),
            _buildKey(numbers[7], buttonSize),
            GestureDetector(
              onTap: onClearTap,
              child: _buildKey('C', buttonSize), // Clear button
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildKey(String label, double size) {
    return Container(
      margin: EdgeInsets.all(4.0),
      width: size,  // Set button width based on screen size
      height: size, // Set button height based on screen size
      decoration: BoxDecoration(
        color: Colors.blueAccent,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: Text(
          label,
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
    );
  }
}
