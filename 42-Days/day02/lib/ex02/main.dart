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

class Ex02 extends StatefulWidget {
  const Ex02({super.key});

  @override
  State<Ex02> createState() => _Ex01State();
}

class _Ex01State extends State<Ex02> {
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
  String selectedLocation = "";  // Variable to hold selected city/region/country
  List<String> suggestions = [
    'New York, USA',
    'London, UK',
    'Tokyo, Japan',
    'Paris, France',
    'Berlin, Germany',
    'Sydney, Australia',
    'Beijing, China',
    'Cape Town, South Africa',
    'Moscow, Russia',
    'Toronto, Canada',
    'Mumbai, India',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                children: [
                  Autocomplete<String>(
                    optionsBuilder: (TextEditingValue textEditingValue) {
                      if (textEditingValue.text.isEmpty) {
                        return const Iterable<String>.empty();
                      }
                      return suggestions.where((suggestion) => suggestion
                          .toLowerCase()
                          .contains(textEditingValue.text.toLowerCase()));
                    },
                    onSelected: (String selection) {
                      setState(() {
                        selectedLocation = selection;
                      });
                    },
                    fieldViewBuilder: (context, controller, focusNode, onFieldSubmitted) {
                      return TextField(
                        controller: controller,
                        focusNode: focusNode,
                        decoration: InputDecoration(
                          hintText: 'Enter city, region, or country',
                          border: OutlineInputBorder(),
                        ),
                      );
                    },
                  ),
                  if (selectedLocation.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Text('Selected Location: $selectedLocation'),
                    ),
                ],
              ),
            ),
            VerticalDivider(
              color: Colors.black,
              thickness: 1,
              width: 20,
            ),
            IconButton(
              icon: Icon(Icons.map, size: 30),
              onPressed: () async {
                // You can handle your location functionality here
                // For example:
                setState(() {
                  // Do something with location
                });
              },
            ),
          ],
        ),
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
