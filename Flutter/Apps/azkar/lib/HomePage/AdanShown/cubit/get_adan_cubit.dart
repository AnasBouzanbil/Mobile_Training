import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:geolocator/geolocator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

part 'get_adan_state.dart';

class GetAdanCubit extends Cubit<GetAdanState> {
  GetAdanCubit() : super(GetAdanInitial());

  Future<void> fetchAdanTimings() async {
    // showing a mesage to the user that the data is being fetched
    
    Position position = await getCurrentLocation();

    String date = DateFormat('yyyy-MM-dd').format(DateTime.now());

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? lastFetchedDate = prefs.getString('lastFetchedDate');
    String? cachedTimings = prefs.getString('timings');


    if (lastFetchedDate == null || date != lastFetchedDate || DateTime.now().difference(DateTime.parse(lastFetchedDate)).inDays >= 7) {
      // Fetch new data from the API
      var timings = await getTimingsFromAPI(date, position.latitude, position.longitude);

      // Cache the data and date
      prefs.setString('lastFetchedDate', date);
      prefs.setString('timings', json.encode(timings));

      emit(GetAdanLoaded(timings)); // Pass the fetched data to the widget
    } else {
      // Load data from cache
      if (cachedTimings != null) {
        emit(GetAdanLoaded(json.decode(cachedTimings)));
      } else {
        emit(GetAdanError('No cached data available'));
      }
    }
  }

  Future<Position> getCurrentLocation() async {
  try {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      throw 'Location services are disabled';
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        throw 'Location permissions are denied';
      }
    }

    if (permission == LocationPermission.deniedForever) {
      throw 'Location permissions are permanently denied';
    }

    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    print("Location: ${position.latitude}, ${position.longitude}");
    return position;
  } catch (e) {
    print("Location error: $e");
    rethrow;
  }
}


  Future<Map<String, dynamic>> getTimingsFromAPI(String date, double latitude, double longitude) async {
    final response = await http.get(Uri.parse(
        'http://api.aladhan.com/v1/timings/$date?latitude=$latitude&longitude=$longitude&method=2'));

    if (response.statusCode == 200) {
      Map<String, dynamic> data = json.decode(response.body);
      return data['data']['timings'];
    } else {
      throw Exception('Failed to load timings');
    }
  }
}
