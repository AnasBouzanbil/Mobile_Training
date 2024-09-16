import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geolocator/geolocator.dart';
import '../ex01/cities.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:geocoding/geocoding.dart';
import 'package:fl_chart/fl_chart.dart';

// Define constants


// Main App Widget
class Ex02 extends StatefulWidget {
  const Ex02({super.key});

  @override
  State<Ex02> createState() => _Ex02State();
}

class _Ex02State extends State<Ex02> {
  final _textNameController = TextEditingController();
  final PageController _pageController = PageController();
  int index = 0;
  Widget value = Center(
    
    child: Column(
      children: [
        Text(
          "Please allow the location permission to access your location",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w900,
            fontSize: 30,
          ),
        ),

      ],
    )
  );@override
  void initState() {
    super.initState();
    checkPermissionAndFetchWeather();
  }
  List<String> bg = [
    'lib/assets/1.jpg',
    'lib/assets/9010621.jpg'
  ];

  int bgindex = 1;
  @override
  Widget build(BuildContext context) {
    return Stack(  // Use Stack to layer the background and Scaffold
      children: [
        Container(
          decoration:  BoxDecoration(
            image: DecorationImage(
              image: AssetImage(bg[bgindex]), // Use AssetImage to load local assets

              fit: BoxFit.fill,
            ),
          ),
        ),
        Scaffold(

          backgroundColor: Colors.transparent,
          extendBodyBehindAppBar: true,  // Extends the body behind the app bar
          extendBody: true,  // Extends the body behind the bottom navigation bar

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
            items: const [
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
        ),
      ],
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
      backgroundColor: Colors.transparent,
      elevation: 60,
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
                  shrinkWrap: true,
                  padding: EdgeInsets.all(8.0),

                  itemCount: options.length < 5 ? options.length : 5, // Only show up to 5 suggestions
                  itemBuilder: (BuildContext context, int index) {
                    final String option = options.elementAt(index);
                    print(option);
                    return GestureDetector(

                      onTap: () {
                        onSelected(option);
                      },
                      child: ListTile(

                        leading: Icon(Icons.location_city, color: Colors.blue), // Custom widget: icon
                        title: Text(option,
                        style: TextStyle(
                          color: Colors.black54
                        ),
                        ), // Custom widget: text

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
Widget Today() {
  return userInfo.permission == 1
      ? Container(
    padding: EdgeInsets.symmetric(horizontal: 10),
    child: Column(
      children: [

        Expanded(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        child: Column(
                          children: [
                            Align(
                              alignment: Alignment.center,
                              child: Padding(
                                padding: EdgeInsets.only(top: 0.1),
                                child: Text(
                                  userInfo.city,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w900,
                                    fontSize: 26,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                            Container(
                              height: 10,
                            ),
                            Text(userInfo.inputValue,
                            style: TextStyle(
                              fontWeight: FontWeight.w900
                            ),
                            ),

                          ],
                        ),
                      ),
                      Container(
                        height: 60,
                        color: Colors.amberAccent,
                      ),
                      Text(
                        todayObj.degree + 'C',
                        style: TextStyle(fontSize: 40,
                        color: Colors.deepOrange
                        ),
                        textAlign: TextAlign.center,

                      ),
                      Container(height: 20, color: Colors.deepOrange),
                      Icon(Icons.sunny , size: 50, color: Colors.cyan,),
                      SizedBox(height: 8.0),
                      Text(
                        todayObj.description,
                        style: TextStyle(fontSize: 18),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 8.0),
                      Text(
                        todayObj.distance,
                        style: TextStyle(fontSize: 18),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  )
      : PermissionRequest();
}



Widget Tomorrow() {
  return userInfo.permission == 1
      ? Column(
    children: [
      Container(
        color: Colors.yellow.withOpacity(0.4),
        height: 250, // Set the height for the chart
        padding: EdgeInsets.only(top: 60),
        margin: EdgeInsets.only(top: 10),
        child: BarChart(
          BarChartData(
            maxY: 100,
            minY: 0,
            barGroups: _generateBarData(), // Generate the bar chart data
            titlesData: FlTitlesData(
              bottomTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  getTitlesWidget: (double value, TitleMeta meta) {
                    const style = TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    );
                    return Text('${value.toInt() + 1}', style: style);
                  },
                  reservedSize: 32,
                ),
              ),
              leftTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  reservedSize: 40,
                  interval: 20,
                  getTitlesWidget: (double value, TitleMeta meta) {
                    return Text('${value.toInt()}');
                  },
                ),
              ),
            ),
          ),
        ),
      ),
      Center(
        child: Text(userInfo.inputValue),
      ),
      Expanded(
        child: ListView.builder(
          itemCount: tom.length,
          itemBuilder: (context, index) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(tom[index].time),
                Text(tom[index].degree),
                Text(tom[index].distance),
              ],
            );
          },
        ),
      ),
    ],
  )
      : PermissionRequest();
}

List<BarChartGroupData> _generateBarData() {
  // Example data for 7 days
  final List<double> barValues = [50, 80, 60, 90, 70, 30, 50];

  return List.generate(barValues.length, (index) {
    return BarChartGroupData(
      x: index, // Position on the x-axis
      barRods: [
        BarChartRodData(
          toY: barValues[index], // Value of the bar
          color: Colors.blue, // Color of the bar
          width: 15, // Width of the bar
          borderRadius: BorderRadius.circular(5),
        ),
      ],
    );
  });
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
