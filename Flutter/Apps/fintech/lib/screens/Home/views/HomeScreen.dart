import 'dart:math';
import 'package:fintech/screens/Home/views/Cards.dart';
import 'package:fintech/screens/Home/views/MainScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:ui';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  _HomescreenState createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  bool isLoading = false;

  void toggleLoading() {
    setState(() {
      isLoading = !isLoading;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade50,
        surfaceTintColor: Colors.transparent,
        leading: null,
        title: Image.asset("assets/cihavatar.jpeg", width: 60),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          const MainScreen(),
          if (isLoading)
            Positioned.fill(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                child: Container(
                  color:
                      Colors.black.withOpacity(0.3), 
                ),
              ),
            ),
          if (isLoading)
            Center(
              child: CircularProgressIndicator(),
            ),
        ],
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(30),
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: [
            BottomNavigationBarItem(
              icon: IconButton(
                  onPressed: () {
                    toggleLoading();
                  },
                  icon: const Icon(Icons.receipt)),
              label: "bills",
            ),
            BottomNavigationBarItem(
               icon: IconButton(
                  onPressed: () {
                    toggleLoading();
                  },
              icon: const Icon(Icons.hourglass_empty, color: Colors.black)),
              label: "bills",
            ),
            BottomNavigationBarItem(
               icon: IconButton(
                  onPressed: () {
                    toggleLoading();
                  },
              icon: const Icon(Icons.wallet)),
              label: "bills",
            ),
            BottomNavigationBarItem(
              icon: IconButton(
                icon: const Icon(CupertinoIcons.creditcard),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const CreditCardsPage()),
                  );
                },
              ),
              label: "states",
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: toggleLoading,
        shape: const CircleBorder(),
        child: Container(
          width: 70,
          height: 70,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              colors: [
                Theme.of(context).colorScheme.tertiary,
                Theme.of(context).colorScheme.secondary,
                Theme.of(context).colorScheme.primary,
              ],
              transform: const GradientRotation(pi / 4),
            ),
          ),
          child: const Icon(CupertinoIcons.arrow_2_circlepath),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
