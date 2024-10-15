import 'package:flutter/material.dart';
import 'package:cih/widgets/AppBar/Appbar.dart';
import 'package:cih/widgets/HomeBody/HomeBody.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: Appbar(),
      body: Body(),
      drawer: Drawer(child: Text("data")),
      bottomNavigationBar: bottomNavBar(context), // Pass context to make it responsive
    );
  }

  Container bottomNavBar(BuildContext context) {
    // Get screen width
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      margin: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
      height: 95, // Set a fixed height for the bottom navigation bar
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(60), // Rounded corners
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 4,
            offset: Offset(0, 2), // Shadow positioning
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Flexible(
            child: IconButton(
              onPressed: () {},
              icon: Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8),
                child: Container(
                  width: 150,
                  height: 90,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 236, 77, 28),
                    borderRadius: BorderRadius.circular(60),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Send Money",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(width: 5),
                      Transform(
                        alignment: Alignment.center,
                        transform: Matrix4.rotationZ(-5.508), // Rotates icon
                        child: const Icon(
                          Icons.arrow_upward,
                          size: 30, // Icon size
                          color: Colors.white, // Icon color
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.credit_card, color: Colors.black, size: 35),
            onPressed: () {
              // Your action for credit card icon button goes here
              print("Credit Card Button Pressed");
            },
          ),
          IconButton(
            icon: Icon(Icons.notifications_none_sharp, color: Colors.black, size: 35),
            onPressed: () {
              // Your action for notifications icon button goes here
              print("Notifications Button Pressed");
            },
          ),
          IconButton(
            icon: Icon(Icons.settings, color: Colors.black, size: 35),
            onPressed: () {
              // Your action for settings icon button goes here
              print("Settings Button Pressed");
            },
          ),
        ],
      ),
    );
  }
}
