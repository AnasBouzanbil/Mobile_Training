import 'package:flutter/material.dart';

class Balancedisplay extends StatefulWidget {
  Balancedisplay({super.key});

  @override
  State<Balancedisplay> createState() => _BalanceDisplayState();
}

class _BalanceDisplayState extends State<Balancedisplay> {
  var showPrice = false;
  var _currentIndex = 0;
  final List<Widget> _swapping = [const BalanceCheck(), const BalanceAccount()];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onHorizontalDragUpdate: (details) {
            if (details.delta.dx > 0) {
              // Swipe Right
              if (_currentIndex > 0) {
                setState(() {
                  _currentIndex--;
                });
              }
            } else if (details.delta.dx < 0) {
              // Swipe Left
              if (_currentIndex < _swapping.length - 1) {
                setState(() {
                  _currentIndex++;
                });
              }
            }
          },
          child: Container(
            height:140, // Set height to match BalanceAccount
            decoration: BoxDecoration(
              color: Colors.lightBlueAccent,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              children: [
                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  child: _swapping[_currentIndex],
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 5,),
        Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              _swapping.length,
                  (index) => Container(
                margin: const EdgeInsets.symmetric(horizontal: 4.0),
                width: 8.0,
                height: 8.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _currentIndex == index ? Colors.black : Colors.grey,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
class BalanceAccount extends StatelessWidget {
  const BalanceAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30.0),
      child: Center(
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.orangeAccent, width: 1),
          ),
          padding: const EdgeInsets.all(16.0), // Added padding for better text spacing
          child: TextButton(onPressed: (){}, child: Text(
            "Ouvrir un compte d'Epargne",
            textAlign: TextAlign.center, // Center the text
            style: TextStyle(fontSize: 16), // Optional: Adjust font size
          ),)

        ),
      ),
    );
  }
}
class BalanceCheck extends StatefulWidget {
  const BalanceCheck({super.key});

  @override
  State<BalanceCheck> createState() => _BalanceCheckState();
}

class _BalanceCheckState extends State<BalanceCheck> {
  var showPrice = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 18.0),
      child: Center(
        child: Column(
          children: [
            Text(
              "Check Balance",
              style: TextStyle(color: Colors.white),
            ),
            showPrice
                ? Text(
              "5000.00DH",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 35,
                letterSpacing: 1,
                color: Colors.white,
              ),
            )
                : const Text(
              "*******",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 35,
                letterSpacing: 2,
                color: Colors.white,
              ),
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  showPrice = !showPrice;
                });
              },
              icon: showPrice
                  ? Icon(Icons.visibility_off)
                  : Icon(Icons.visibility),
            ),


          ],
        ),
      ),
    );
  }
}
