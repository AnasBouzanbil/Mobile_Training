import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:geolocator/geolocator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';

part 'get_adan_state.dart';

class GetAdanCubit extends Cubit<GetAdanState> {
  GetAdanCubit() : super(GetAdanInitial());

  Future<void> fetchAdanTimings() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String date = DateFormat('yyyy-MM-dd').format(DateTime.now());

    String? lastFetchedDate = prefs.getString('lastFetchedDate');
    if (_shouldFetchTimings(lastFetchedDate)) {
      Position position = await _getCurrentLocation();
      var timings = await _getTimingsFromAPI(date, position.latitude, position.longitude);

      prefs.setString('lastFetchedDate', date);
      prefs.setString('timings', json.encode(timings));

      emit(GetAdanLoaded(timings));
    } else {
      String? cachedTimings = prefs.getString('timings');
      if (cachedTimings != null) {
        emit(GetAdanLoaded(json.decode(cachedTimings)));
      } else {
        emit(GetAdanError('No cached timings available.'));
      }
    }
  }

  bool _shouldFetchTimings(String? lastFetchedDate) {
    if (lastFetchedDate == null) return true;

    DateTime lastFetched = DateFormat('yyyy-MM-dd').parse(lastFetchedDate);
    DateTime now = DateTime.now();

    return now.difference(lastFetched).inDays >= 7;
  }

  Future<Position> _getCurrentLocation() async {
    try {
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) throw 'Location services are disabled';

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

      final LocationSettings locationSettings =  LocationSettings(
        accuracy: LocationAccuracy.high,
        distanceFilter: 100,
      );

      Position position = await Geolocator.getCurrentPosition(locationSettings: locationSettings);
      return position;
    } catch (e) {
      throw 'Location error: $e';
    }
  }

  Future<Map<String, dynamic>> _getTimingsFromAPI(String date, double latitude, double longitude) async {
    try {
      final response = await http.get(Uri.parse(
          'http://api.aladhan.com/v1/timings/$date?latitude=$latitude&longitude=$longitude&method=2'));

      if (response.statusCode == 200) {
        Map<String, dynamic> data = json.decode(response.body);
        return data['data']['timings'];
      } else {
        throw Exception('Failed to load timings');
      }
    } catch (e) {
      throw 'API Error: $e';
    }
  }
}
