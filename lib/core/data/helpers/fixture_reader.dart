//

import 'dart:convert';
import 'package:flutter/services.dart';

// 'assets/icons/'
Future<Map<String, dynamic>> mapFromFile(String name) async {
  // return File('assets/jsons/$name').readAsStringSync();

  String string = await rootBundle.loadString('assets/jsons/$name');
  Map map = json.decode(string);
  return map as Map<String, dynamic>;
}

Future<String> stringFromFile(String name) async {
  return await rootBundle.loadString('assets/jsons/$name');
}
