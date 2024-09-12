import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geolocator/geolocator.dart';
import 'cities.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:geocoding/geocoding.dart';

// Define constants
const String apiKey = 'a96820cf78d1733bc408c4224bab04d8';

// Define models
class UserInfo {
  String location = '';
  double latitude = 0;
  double longitude = 0;
  int permission = 0;
  String selectedLocation = '';
  String inputValue = '';
  String city = '';
  String country = '';
  String state = '';
}

class TodayW {
  String location = '';
  String degree = '0';
  String distance = '';
  String mainWeather = '';
  String description = '';
}

// Create instances
var todayObj = TodayW();
UserInfo userInfo = UserInfo();

// Main App Widget
class Ex01 extends StatefulWidget {
  const Ex01({super.key});

  @override
  State<Ex01> createState() => _Ex01State();
}

class _Ex01State extends State<Ex01> {
  final _textNameController = TextEditingController();
  final PageController _pageController = PageController();
  int index = 0;
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

  @override
  void initState() {
    super.initState();
    checkPermissionAndFetchWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: GestureDetector(
        onPanUpdate: (details) {
          if (details.delta.dx > 0) {
            if (index > 0) onTabTapped(index - 1);
          } else if (details.delta.dx < 0) {
            if (index < 2) onTabTapped(index + 1);
          }
        },
        child: getWidgetForIndex(index),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (iindex) {
          setState(() {
            index = iindex;
            if (index == 0 && userInfo.permission == 1) fetchWeatherData();
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

  // API Methods
  Future<void> fetchWeatherData() async {
    try {
      if (userInfo.latitude != 0 && userInfo.longitude != 0) {
        await getCurrentWeatherByCoordinate();
      } else {
        await getCurrentWeather();
      }
      setState(() {});
    } catch (error) {
      print(error);
    }
  }

  Future<void> getCurrentWeather() async {
    var city = userInfo.city;
    try {
      final url = 'https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$apiKey';
      final res = await http.get(Uri.parse(url));
      var data = jsonDecode(res.body);

      updateTodayWeather(data);
    } catch (e) {
      print(e);
    }
  }

  Future<void> getCurrentWeatherByCoordinate() async {
    String long = userInfo.longitude.toString();
    String lat = userInfo.latitude.toString();
    try {
      final url = 'https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$long&appid=$apiKey';
      final res = await http.get(Uri.parse(url));
      var data = jsonDecode(res.body);

      updateTodayWeather(data);
    } catch (e) {
      print(e);
    }
  }

  void updateTodayWeather(dynamic data) {
    todayObj.location = data['name'];
    todayObj.degree = (data['main']['temp'] - 273.15).toStringAsFixed(1);
    todayObj.distance = data['visibility'].toString();
    todayObj.mainWeather = data['weather'][0]['main'];
    todayObj.description = data['weather'][0]['description'];
  }

  Future<String> getCityUsingCoordinates(double latitude, double longitude) async {
    try {
      final url = 'http://api.openweathermap.org/geo/1.0/reverse?lat=$latitude&lon=$longitude&limit=5&appid=$apiKey';
      final res = await http.get(Uri.parse(url));
      var data = jsonDecode(res.body);
      var result = data[0];

      userInfo.country = result['country'];
      userInfo.city = result['name'];
      userInfo.location = '${result['name']} ${result['country']}';
      return userInfo.location;
    } catch (e) {
      print('Error: $e');
      throw e;
    }
  }

  // Permission and Location Methods
  void checkPermissionAndFetchWeather() async {
    if (userInfo.permission == 1) {
      await fetchWeatherData();
    }
  }

  Future<List<double>> initializeLocation() async {
    var status = await Permission.location.request();
    if (status.isGranted) {
      Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
      return [position.longitude, position.latitude];
    } else {
      throw Exception("Location permission not granted");
    }
  }

  // UI Methods
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

  AppBar buildAppBar() {
    return AppBar(
      leading: Container(),
      title: AppBarTitleRow(),
    );
  }

  Row AppBarTitleRow() {
    return Row(
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
            child: autocompleteContainerChild(),
          ),
        ),
        VerticalDivider(
          color: Colors.black,
          thickness: 1,
          width: 20,
        ),
        iconMapButtonChild(),
      ],
    );
  }

  IconButton iconMapButtonChild() {
    return IconButton(
      icon: Icon(Icons.map, size: 30),
      onPressed: () async {
        try {
          final List<double> directions = await initializeLocation();
          userInfo.latitude = directions[1];
          userInfo.longitude = directions[0];
          await getCityUsingCoordinates(userInfo.latitude, userInfo.longitude);
          await fetchWeatherData();

          setState(() {
            userInfo.permission = 1;
          });
        } catch (error) {
          print(error);
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
    );
  }

  Autocomplete<String> autocompleteContainerChild() {
    return Autocomplete<String>(
      optionsBuilder: (TextEditingValue textEditingValue) {
        if (textEditingValue.text == '') {
          return const Iterable<String>.empty();
        }
        return cities.where((String option) {
          return option.toLowerCase().contains(textEditingValue.text.toLowerCase());
        });
      },
      onSelected: (String selection) async {
        _textNameController.text = selection;
        userInfo.inputValue = selection;
        userInfo.city = selection.split(' ')[0];
        await fetchWeatherData();
        setState(() {
          userInfo.permission = 1;
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
            border: InputBorder.none,
            prefixIcon: IconButton(
              onPressed: () {
                textEditingController.clear();
                setState(() {
                  userInfo.inputValue = '';
                  userInfo.permission = 0;
                });
              },
              icon: Icon(Icons.clear),
            ),
            suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  userInfo.inputValue = userInfo.selectedLocation;
                });
              },
              icon: Icon(Icons.search),
            ),
          ),
        );
      },
    );
  }

  Widget getWidgetForIndex(int index) {
    switch (index) {
      case 0:
        return Today();
      case 1:
        return Tomorrow();
      case 2:
        return Month();
      default:
        return Today();
    }
  }
}

// Weather Widgets
Widget Today() {
  return userInfo.permission == 1
      ? Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                todayObj.location,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8.0),
              Text(
                todayObj.degree,
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 8.0),
              Text(
                todayObj.mainWeather,
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 8.0),
              Text(
                todayObj.description,
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 8.0),
              Text(
                todayObj.distance,
                style: TextStyle(fontSize: 18),
              ),
            ],
          ),
        ),
      ],
    ),
  )
      : PermissionRequest();
}

Widget Tomorrow() {
  return userInfo.permission == 1
      ? Center(
    child: Row(
      children: [
        Container(
          child: Center(
            child: Wrap(
              children: [
                Text("data"),
              ],
            ),
          ),
        ),
      ],
    ),
  )
      : PermissionRequest();
}

Widget Month() {
  return userInfo.permission == 1
      ? Center(
    child: Row(
      children: [
        Container(
          child: Center(
            child: Wrap(
              children: [
                Text("data"),
              ],
            ),
          ),
        ),
      ],
    ),
  )
      : PermissionRequest();
}

Widget PermissionRequest() {
  return Center(
    child: Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSBmxosFVfhkZkQTS9-OeVvt_3HzsBZNQa4gg&s"),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.black87,
              borderRadius: BorderRadius.circular(10),
            ),
            padding: EdgeInsets.all(16),
            child: Text(
              'Please search for a city or press the map icon at the top to allow permission.',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    ),
  );
}
