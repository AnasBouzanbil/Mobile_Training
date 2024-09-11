import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geolocator/geolocator.dart';
import 'cities.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:geocoding/geocoding.dart';


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
UserInfo userInfo = UserInfo();
List<String> threetimes = ['Today', 'Tomorrow', 'Next Week'];

Future<String> getCityUsingCoordinates(double latitude, double longitude) async {
  try {
    final url = 'http://api.openweathermap.org/geo/1.0/reverse?lat=$latitude&lon=$longitude&limit=5&appid=a96820cf78d1733bc408c4224bab04d8';
    final res =  await http.get(Uri.parse(url));
    var data = jsonDecode(res.body);
    var result = data[0];
    print(result);
    userInfo.country = result['country'];
    userInfo.city = result['name'];
    userInfo.location =  result['name']+ ' ' +result['country'] ;
    return userInfo.location;
  } catch (e) {
    print('Error: $e');
    throw e;
  }
}

Future<void> getWheatherData(String searchfor) async
{
  try{
    print(searchfor);
    final url = 'https://api.openweathermap.org/data/2.5/weather?q=$searchfor&appid=a96820cf78d1733bc408c4224bab04d8';
    final res =  await http.get(Uri.parse(url));
    var data = jsonDecode(res.body);

    print(data);

  }catch(e){
    print(e);

  }
}

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
      appBar: buildAppBar(),
      body: GestureDetector(
        onPanUpdate: (details) {
          if (details.delta.dx > 0) {
            if (index > 0) {
              onTabTapped(index - 1);
            }
          } else if (details.delta.dx < 0) {
            if (index < 2) {
              onTabTapped(index + 1);
            }
          }
        },
        child: ForBody(value, threetimes[index], userInfo.inputValue),
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
        ExpandChild(),
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
          String city = await getCityUsingCoordinates(userInfo.latitude, userInfo.longitude);
          getWheatherData(userInfo.city);
          setState(() {
            userInfo.permission = 1;
            userInfo.location = city; // Update location
            value = Center(
              child: Text(
                "Your location is ${userInfo.location}",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w900,
                  fontSize: 20,
                ),
              ),
            );
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

  Expanded ExpandChild() {
    return Expanded(
      child: Container(
        height: 40,
        padding: EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: autocompleteContainerChild(),
      ),
    );
  }

  Autocomplete<String> autocompleteContainerChild() {
    return Autocomplete<String>(
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
          userInfo.inputValue = selection;
          getWheatherData(userInfo.inputValue);
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
}

Widget ForBody(Widget value, String Value2, String city) {
  return Center(
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
