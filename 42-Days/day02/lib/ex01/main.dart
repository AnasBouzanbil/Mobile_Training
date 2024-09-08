import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:permission_handler/permission_handler.dart';

class Ex01 extends StatefulWidget {
  const Ex01({super.key});

  @override
  State<Ex01> createState() => _Ex01State();
}

class _Ex01State extends State<Ex01> {
  int myindex = 0;
  final _searchController = TextEditingController();
  String searched = "";

  @override
  void dispose() {
    _searchController.dispose(); // Clean up the controller when the widget is removed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> widg = [
      _buildText('Today\n  ' + searched, 45),
      _buildText('Tomorrow\n  ' + searched, 40),
      _buildText('Next month\n  ' + searched, 35)
    ];

    return Scaffold(
      appBar: AppBar(
        title: _buildSearchBar(),
        backgroundColor: Colors.teal[400], // Set AppBar color
        elevation: 0, // Remove shadow
      ),
      body: Center(
        child: AnimatedSwitcher(
          duration: Duration(milliseconds: 500), // Fade animation for switching texts
          child: widg[myindex],
        ),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  // Custom search bar
  Widget _buildSearchBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center, // Centers the icons
      children: [
        Expanded(
          child: Container(
            height: 45,
            padding: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search...',
                border: InputBorder.none,
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      searched = _searchController.text;
                    });
                  },
                  icon: Icon(Icons.search, color: Colors.teal[300]),
                ),
              ),
            ),
          ),
        ),
        VerticalDivider(color: Colors.black, thickness: 2),
        IconButton(
          onPressed: () {
            getLocation();
          },
          icon: Icon(Icons.location_on, color: Colors.white),
        ),
      ],
    );
  }

  // Widget for displaying text
  Widget _buildText(String text, double size) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Text(
        text,
        key: ValueKey(text),
        style: TextStyle(
          fontSize: size,
          fontWeight: FontWeight.w900,
          color: Colors.teal[800],
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  // Custom bottom navigation bar
  Widget _buildBottomNavigationBar() {
    return BottomNavigationBar(
      selectedItemColor: Colors.teal[700],
      unselectedItemColor: Colors.grey[500],
      currentIndex: myindex,
      onTap: (index) {
        setState(() {
          myindex = index;
        });
      },
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.calendar_today),
          label: 'Today',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.calendar_today_outlined),
          label: 'Tomorrow',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.calendar_month),
          label: 'Next Month',
        ),
      ],
    );
  }
}

Future<Widget> getLocation() async {
  try {
    final status = await Permission.location.request();
    if (status.isGranted) {
      return Text("Location access granted");
    } else if (status.isDenied) {
      return Text("Location permission denied");
    } else if (status.isPermanentlyDenied) {
      return Text("Location permission permanently denied");
    }
  } catch (error) {
    return Text('Failed to get permission');
  }
  return Text("Unexpected result");
}
