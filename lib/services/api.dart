import 'dart:convert';
import 'package:flutter_application_1/models/errMsg.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_application_1/models/packages.dart';

import '../models/kelompok.dart';

class APIstatic {
  // static final host = "http://192.168.1.6:80/api";
  static final host = "http://10.38.112.170:80/api";
  static getHost() {
    return host;
  }

  static Future<List<Smartglasses>> getSmartglasses() async {
    try {
      final response = await http.get(Uri.parse("$host/packages"),
          headers: {'Authorization': 'Bearer'});
      if (response.statusCode == 200) {
        //return data list
        var json = jsonDecode(response.body);
        final parsed = json['data'].cast<Map<String, dynamic>>();
        return parsed
            .map<Smartglasses>((json) => Smartglasses.fromJson(json))
            .toList();
      } else {
        //return null
        return [];
      }
    } catch (e) {
      return [];
    }
  }

  static Future<List<Kelompok>> getKelompok() async {
    try {
      final response = await http.get(Uri.parse("$host/kelompoks"),
          headers: {'Authorization': 'Bearer'});
      if (response.statusCode == 200) {
        //return data list
        var json = jsonDecode(response.body);
        final parsed = json.cast<Map<String, dynamic>>();
        return parsed.map<Kelompok>((json) => Kelompok.fromJson(json)).toList();
      } else {
        return [];
      }
    } catch (e) {
      return [];
    }
  }
}

// // create & update
// static Future<ErrorMSG> save(idkelompok, params) async{
//   try {
//     var url = uri.parse($host/save(idkelompok, params))
//   }
// }
