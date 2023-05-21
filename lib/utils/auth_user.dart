import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

final Uri uri = Uri.parse('http://10.0.2.2:3000/api/users/verify/');

Future<bool> authUser(email, password) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? token = prefs.getString('token');

  if (token != null) {
    try {
      http.Response response = await http.post(
        uri,
        headers: {'Content-Type': 'application/json'},
        body: json.encode({"token": token}),
      );

      return response.statusCode == 200 ? true : false;
    } catch (e) {
      debugPrint(e.toString());
      return false;
    }
  }
  return false;
}
