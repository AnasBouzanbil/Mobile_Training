import 'dart:convert';
import 'dart:math';
import 'package:bloc/bloc.dart';
import 'package:flutter/services.dart'; // For loading assets
import 'package:shared_preferences/shared_preferences.dart';

abstract class DailyDataState {}

class LoadingState extends DailyDataState {}

class LoadedState extends DailyDataState {
  final String ayah;
  final String surah;
  final int ayahNumber;
  final String hadith;
  final String description;

  LoadedState({
    required this.ayah,
    required this.surah,
    required this.ayahNumber,
    required this.hadith,
    required this.description,
  });
}

class ErrorState extends DailyDataState {
  final String message;

  ErrorState(this.message);
}

class DailyDataCubit extends Cubit<DailyDataState> {
  DailyDataCubit() : super(LoadingState());

  Future<void> fetchDailyData() async {
    emit(LoadingState());
    try {
      final prefs = await SharedPreferences.getInstance();
      final cachedData = prefs.getString('daily_data');
      final lastFetched = prefs.getInt('last_fetched') ?? 0;

      if (cachedData != null && DateTime.now().millisecondsSinceEpoch - lastFetched < 86400000) {
        // Use cached data
        final data = jsonDecode(cachedData);
        emit(LoadedState(
          ayah: data['ayah'],
          surah: data['surah'],
          ayahNumber: data['ayah_number'],
          hadith: data['hadith'],
          description: data['description'],
        ));
      } else {
        final ayah = await _fetchRandomAyah();
        final hadith = await _fetchRandomHadith();

        final data = {
          'ayah': ayah['ayah'],
          'surah': ayah['surah'],
          'ayah_number': ayah['ayah_number'],
          'hadith': hadith['hadith'],
          'description': hadith['description'],
        };

        // Cache the data
        await prefs.setString('daily_data', jsonEncode(data));
        await prefs.setInt('last_fetched', DateTime.now().millisecondsSinceEpoch);

        emit(LoadedState(
          ayah: ayah['ayah'],
          surah: ayah['surah'],
          ayahNumber: ayah['ayah_number'],
          hadith: hadith['hadith'],
          description: hadith['description'],
        ));
      }
    } catch (e) {
      emit(ErrorState("Failed to fetch daily data: $e"));
    }
  }

  Future<Map<String, dynamic>> _fetchRandomAyah() async {
    try {
      final ayahsJson = await rootBundle.loadString('assets/ayahs.json');
      final ayahs = jsonDecode(ayahsJson)['ayahs'];
      final randomAyah = ayahs[Random().nextInt(ayahs.length)];
      return {
        'ayah': randomAyah['ayah'],
        'surah': randomAyah['surah'],
        'ayah_number': randomAyah['ayah_number'],
      };
    } catch (e) {
      throw Exception("Failed to load Ayahs: $e");
    }
  }

  Future<Map<String, dynamic>> _fetchRandomHadith() async {
    try {
      final hadithsJson = await rootBundle.loadString('assets/hadiths.json');
      final hadiths = jsonDecode(hadithsJson);
      final randomindex = Random().nextInt(hadiths.length);
      return hadiths[randomindex];
    } catch (e) {
      throw Exception("Failed to load Hadiths: $e");
    }
  }
}
