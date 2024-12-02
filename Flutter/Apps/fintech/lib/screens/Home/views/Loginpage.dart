import 'dart:math';

import 'package:fintech/screens/Home/views/HomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String username = "*****89";
  String password = "";
  bool isKeyboardVisible = false;
  bool isUsernameFieldFocused = false;

  void toggleKeyboard(bool isUsernameField) {
    setState(() {
      isKeyboardVisible = true;
      isUsernameFieldFocused = isUsernameField;
    });
  }

  void onKeyboardTap(String value) {
    setState(() {
      if (isUsernameFieldFocused) {
        username += value;
      } else {
        password += value;
      }
    });
  }

  void onDelete() {
    setState(() {
      if (isUsernameFieldFocused && username.isNotEmpty) {
        username = username.substring(0, username.length - 1);
      } else if (password.isNotEmpty) {
        password = password.substring(0, password.length - 1);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        title: Image.asset("assets/cihwithname.png", width: 100),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Welcome",
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w700,
                  fontFamily: GoogleFonts.exo2().fontFamily,
                  letterSpacing: 1),
            ),
            SizedBox(
              height: 50,
            ),
            _buildInputField(context, "Anas Bouzanbil", username,
                () => toggleKeyboard(true)),
            const SizedBox(height: 20),
            _buildInputField(context, "Password", '*' * password.length,
                () => toggleKeyboard(false)),
            if (!isKeyboardVisible)
              Padding(
                padding: const EdgeInsets.only(top: 40),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Homescreen()),
                    );
                  },
                  child: Container(
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 255, 116, 52),
                          borderRadius: BorderRadius.circular(10)),
                      height: MediaQuery.of(context).size.width / 10,
                      width: MediaQuery.of(context).size.width / 1.8,
                      child: Center(child: const Text('Login'))),
                ),
              ),
            if (isKeyboardVisible) _buildCustomKeyboard()
          ],
        ),
      ),
    );
  }

  Widget _buildInputField(
      BuildContext context, String label, String value, VoidCallback onTap) => GestureDetector(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width / 1.3,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 251, 255, 251),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.grey),
        ),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(label,
                    style: const TextStyle(fontSize: 14, color: Colors.grey)),
                const SizedBox(height: 4),
                Text(value,
                    style: const TextStyle(fontSize: 18, color: Colors.black)),
              ],
            ),
            Spacer(),
            IconButton(
                onPressed: () {
                  setState(() {
                    value = "";
                  });
                },
                icon: Icon(Icons.clear))
          ],
        ),
      ),
    );

  Widget _buildCustomKeyboard() {
    List<String> numbers = List.generate(9, (index) => (index + 1).toString());
    numbers.shuffle(Random());

    return Padding(
      padding: const EdgeInsets.only(left: 18.0, right: 18, top: 20),
      child: Container(
        padding: const EdgeInsets.only(top: 15, left: 15),
        decoration: BoxDecoration(
            color: const Color.fromARGB(255, 228, 228, 228),
            borderRadius: BorderRadius.circular(20)),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: _buildKeyboardRow(numbers.sublist(0, 3)),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: _buildKeyboardRow(numbers.sublist(3, 6)),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: _buildKeyboardRow(numbers.sublist(6, 9)),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildKeyboardButton('Del', onDelete),
                _buildKeyboardButton('0', () => onKeyboardTap('0')),
                _buildKeyboardButton('Ok', () {
                  setState(() => isKeyboardVisible = false);
                }),
              ],
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildKeyboardRow(List<String> keys) {
    return keys
        .map((key) => _buildKeyboardButton(key, () => onKeyboardTap(key)))
        .toList();
  }

  Widget _buildKeyboardButton(String label, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 60,
        height: 60,
        margin: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          border: Border.all(color: Colors.grey),
        ),
        alignment: Alignment.center,
        child: Text(label, style: const TextStyle(fontSize: 18)),
      ),
    );
  }
}
