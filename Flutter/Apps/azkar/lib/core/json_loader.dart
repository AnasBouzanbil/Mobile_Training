import 'dart:convert';

import 'package:flutter/services.dart';

class JsonLoader {
 Future<Map<String, dynamic>>  loadJson() async {
    final res = await rootBundle.loadString('assets/adkhar.json');
    final data = await  json.decode(res);
    return data;
  }
}