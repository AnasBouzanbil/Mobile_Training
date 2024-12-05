import 'dart:convert';

import 'package:flutter/services.dart';

class JsonLoader {
 Future<Map<String, dynamic>>  loadJson() async {
    final res = await rootBundle.loadString('assets/adkhar.json');
    final data = await  json.decode(res);
    return data;
  }
Future<List<Map<String, dynamic>>> loadJsonDua() async {
  final res = await rootBundle.loadString('assets/Dua.json');
  final data = json.decode(res);
  
  if (data is List) {
    // Check each item in the list and ensure it's a Map<String, dynamic>
    return data.where((item) => item is Map<String, dynamic>).cast<Map<String, dynamic>>().toList();
  } else {
    throw Exception('Invalid JSON structure: Expected a List<Map<String, dynamic>>.');
  }
}


}

