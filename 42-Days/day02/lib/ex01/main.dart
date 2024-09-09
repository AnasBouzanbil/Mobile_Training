import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geolocator/geolocator.dart';

Future<String> initializeLocation() async {
  // Request location permission
  final permission = Permission.location;

  // Check and request permission if needed
  if (await permission.isDenied || await permission.isRestricted) {
    await permission.request();
  }

  // Check if permission is permanently denied
  if (await permission.isPermanentlyDenied) {
    throw Exception('Location permission is permanently denied.');
  }

  // Ensure location services are enabled
  bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    throw Exception('Location services are disabled.');
  }

  // Get the location permission status
  LocationPermission locPermission = await Geolocator.checkPermission();

  // Request permission if it hasn't been granted
  if (locPermission == LocationPermission.denied) {
    locPermission = await Geolocator.requestPermission();
    if (locPermission == LocationPermission.denied) {
      throw Exception('Location permission denied.');
    }
  }

  if (locPermission == LocationPermission.deniedForever) {
    throw Exception('Location permission is permanently denied.');
  }

  try {
    // If permission is granted, get the current position
    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    double latitude = position.latitude;
    double longitude = position.longitude;
    print('Latitude: $latitude, Longitude: $longitude');

    // Return the latitude and longitude as a string
    return '$latitude $longitude';
  } catch (e) {
    // If there's any error, throw it
    throw Exception('Failed to get location: $e');
  }
}

List<String> threetimes = ['Today', 'Tomorrow', 'Next Week'];

Future<String> getLocation() async {
  try {
    String location = await initializeLocation();
    return location;
  } catch (error) {
    print('Error: $error');
    throw error;
  }
}

class Ex01 extends StatefulWidget {
  const Ex01({super.key});

  @override
  State<Ex01> createState() => _Ex01State();
}

class _Ex01State extends State<Ex01> {
  final _textNameController = TextEditingController();
  String inputvalue = '';
  final PageController _pageController = PageController();
  Widget value = Center(
    child: Text(
      "Please allow the location permission to access your location",
      style: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w900,
        fontSize: 30,
      ),
    ),
  );
  String location = "";
  int permission = 0;
  int index = 0;

  void onTabTapped(int iindex) {
    setState(() {
      index = iindex;  // Update the current index
    });
    _pageController.animateToPage(
      iindex,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white60,
      appBar: AppBar(
        backgroundColor: Colors.white60,


        title: Padding(
          padding: EdgeInsets.only(top: 5.0), // Add padding to the top
          child: TextField(
            controller: _textNameController,
            decoration: InputDecoration(
              labelText: 'City name',
              hintText: 'Marrakesh',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0), // Set the radius here
              ),
              suffixIcon: Padding(
                padding: EdgeInsets.all(2),
                child: IconButton(
                  onPressed: () {
                    setState(() {
                      inputvalue = "at " + _textNameController.text;
                      print(_textNameController.text);
                    });
                  },
                  icon: Icon(Icons.search),
                ),
              ),
              prefixIcon: Padding(
                padding: EdgeInsets.all(5),
                child: IconButton(
                  onPressed: () {
                    _textNameController.clear();
                    inputvalue = '';
                  },
                  icon: Icon(Icons.clear),
                ),
              ),
            ),
          ),
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () async {
              try {
                location = await getLocation();
                setState(() {
                  permission = 1;
                  value = Center(
                    child: Container(
                      child: Text(
                        "Your location is $location",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w900,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  );
                });
              } catch (error) {
                setState(() {
                  value = Center(
                    child: Container(
                      decoration: BoxDecoration(),
                      child: Padding(
                        padding: EdgeInsets.all(6),
                        child: Text(
                          "Oops " + error.toString(),
                          style: TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.w900,
                            fontSize: 25,
                          ),
                        ),
                      ),
                    ),
                  );
                });
              }
            },
            icon: Icon(Icons.map),
          ),
        ],
      ),
      body: GestureDetector(
        onPanUpdate: (details) {
          // Swiping in right direction.
          onPanUpdate:
              (details) {
            if (details.delta.dx > 0) {
              if (index > 0) {
                onTabTapped(index - 1);
              }
            } else if (details.delta.dx < 0) {
              if (index < 2) {
                onTabTapped(index + 1);
              }
            }
          };
        },

    child: ForBody(value, threetimes[index], inputvalue),
      ),


      bottomNavigationBar: BottomNavigationBar(
        onTap: (iindex) {
          setState(() {
            index = iindex;
          });
        },
        currentIndex: index,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.lock_clock),
            label: 'Today',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_view_week),
            label: 'Tomorrow',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today_outlined),
            label: 'Next Week',
          ),
        ],
      ),
    );
  }
}

Widget ForBody(Widget value, String Value2, String city) {
  return Container(
    child: Padding(
      padding: EdgeInsets.all(20),
      child: Wrap(
        children: [
          Container(
            child: Center(
              child: Text(
                Value2 + " " + city,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                  decoration: TextDecoration.underline,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
          ),
          SizedBox(height: 40),
          Container(
            child: Center(
              child: value,
            ),
          ),
        ],
      ),
    ),
  );
}
