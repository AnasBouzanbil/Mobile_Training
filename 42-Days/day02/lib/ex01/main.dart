import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geolocator/geolocator.dart';
import 'cities.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:geocoding/geocoding.dart';
import 'package:fl_chart/fl_chart.dart';

// Define constants


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
      automaticallyImplyLeading: false,
      title: AppBarTitleRow(),
      centerTitle: true, // Ensure title content is centered
    );
  }

  Widget AppBarTitleRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center, // Center all widgets
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0), // Add horizontal padding for better spacing
            child: Container(
              height: 50,
              child: autocompleteContainerChild(),
            ),
          ),
        ),
        Container(
          width: 2, // Thickness of the line
          height: 30, // Height of the line
          color: Colors.black87, // Color of the line
        ),
        iconMapButtonChild(),
      ],
    );
  }

  IconButton iconMapButtonChild() {
    return IconButton(
      icon: Icon(Icons.add_location_alt, size: 30),
      onPressed: OnpressedMapicon,
    );
  }

  void OnpressedMapicon() async {
    try {
      final List<double> directions = await initializeLocation();
      userInfo.latitude = directions[1];
      userInfo.longitude = directions[0];
      await getCityUsingCoordinates(userInfo.latitude, userInfo.longitude);
      await fetchWeatherData();

      setState(() {
        initializeLists();
        userInfo.permission = 1;
      });
    } catch (error) {
      print(error);
      setState(() {
        Center(
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
          initializeLists();
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
            border: InputBorder.none,     // Removes the border
            labelText: 'City Name', // Label text
            hintText: 'Enter city to search', // Hint text
            prefixIcon: Icon(Icons.search),

            contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          ),
        );
      },
        optionsViewBuilder: (BuildContext context, AutocompleteOnSelected<String> onSelected, Iterable<String> options) {
          return Align(
            alignment: Alignment.topLeft,
            child: Material(
              elevation: 4.0,
              child: Container(
                width: MediaQuery.of(context).size.width * 0.9,
                child: ListView.builder(
                  padding: EdgeInsets.all(8.0),
                  itemCount: options.length,
                  itemBuilder: (BuildContext context, int index) {
                    final String option = options.elementAt(index);
                    return GestureDetector(
                      onTap: () {
                        onSelected(option);
                      },
                      child: ListTile(
                        leading: Icon(Icons.location_city, color: Colors.blue), // Custom widget: icon
                        title: Text('option'), // Custom widget: text
                      ),
                    );
                  },
                ),
              ),
            ),
          );
          }

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
      ?Column(
    children: [
      Center(
        child: Text(userInfo.inputValue),
      ),
      Expanded(
        child: ListView.builder(
          itemCount: tom.length,
          itemBuilder: (context, index){
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(tom[index].time),
                Text(tom[index].degree),
                Text(tom[index].distance),

              ],
            );
          },
        )
      ),
    ],
  )
      : PermissionRequest();
}
Widget Month() {
  return userInfo.permission == 1
      ? Column(
    children: [
      Center(
        child: Wrap(
      children: [
            Text(userInfo.inputValue),
    ],
        )
      ),
      Expanded(
        child: ListView.builder(
          itemCount: mon.length,
          itemBuilder: (context, index) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(mon[index].dayName),
                Text(mon[index].degree),
                Text(mon[index].description),
              ],
            );
          },
        ),
      ),
    ],
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
