import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geolocator/geolocator.dart';
import 'cities.dart';

Future<String> initializeLocation() async {
  final permission = Permission.location;

  if (await permission.isDenied || await permission.isRestricted) {
    await permission.request();
  }

  if (await permission.isPermanentlyDenied) {
    throw Exception('Location permission is permanently denied.');
  }

  bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    throw Exception('Location services are disabled.');
  }

  LocationPermission locPermission = await Geolocator.checkPermission();
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
    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    double latitude = position.latitude;
    double longitude = position.longitude;
    print('Latitude: $latitude, Longitude: $longitude');
    return '$latitude $longitude';
  } catch (e) {
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
      index = iindex;
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
      appBar: AppBar(
        leading: Container(),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Container(
                height: 40,
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Autocomplete<String>(
                  optionsBuilder: (TextEditingValue textEditingValue) {
                    if (textEditingValue.text == '') {
                      return const Iterable<String>.empty();
                    }
                    return cities.where((String option) {
                      return option
                          .toLowerCase()
                          .contains(textEditingValue.text.toLowerCase());
                    });
                  },
                  onSelected: (String selection) {
                    setState(() {
                      _textNameController.text = selection;
                      inputvalue = selection;
                    });
                  },
                  fieldViewBuilder: (BuildContext context,
                      TextEditingController textEditingController,
                      FocusNode focusNode,
                      VoidCallback onFieldSubmitted) {
                    return TextField(
                      controller: textEditingController,
                      focusNode: focusNode,
                      decoration: InputDecoration(
                        hintText: 'Search City',
                        labelText: 'City name',
                        border: InputBorder.none,
                        prefixIcon: IconButton(
                          onPressed: () {
                            textEditingController.clear();
                            setState(() {
                              inputvalue = '';
                            });
                          },
                          icon: Icon(Icons.clear),
                        ),
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              inputvalue =
                                  "at " + textEditingController.text;
                              print(textEditingController.text);
                            });
                          },
                          icon: Icon(Icons.search),
                        ),
                      ),
                    );
                  },
                ),
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
                try {
                  location = await getLocation();
                  setState(() {
                    permission = 1;
                    value = Center(
                      child: Text(
                        "Your location is $location",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w900,
                          fontSize: 20,
                        ),
                      ),
                    );
                  });
                } catch (error) {
                  setState(() {
                    value = Center(
                      child: Padding(
                        padding: EdgeInsets.all(6),
                        child: Text(
                          "Oops! " + error.toString(),
                          style: TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.w900,
                            fontSize: 25,
                          ),
                        ),
                      ),
                    );
                  });
                }
              },
            ),
          ],
        ),
      ),
      body: GestureDetector(
        onPanUpdate: (details) {
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
