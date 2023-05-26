import 'package:practicando_flutter/api_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

final Uri uri = Uri.parse(ApiConstants.loginUserUrl);

Future<Map<String, dynamic>> loginUser(email, password) async {
  Map<String, dynamic> userBody = {
    'email': email,
    'password': password,
  };

  try {
    http.Response response = await http.post(
      uri,
      headers: {'Content-Type': 'application/json'},
      body: json.encode(userBody),
    );

    final data = jsonDecode(response.body);

    Map<String, dynamic> responseData = {
      'error': response.statusCode != 200,
      'message': data['msg']
    };

    if (response.statusCode == 200) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('token', data['token']);

      return responseData;
    } else {
      return responseData;
    }
  } catch (e) {
    debugPrint(e.toString());
    return {'error': true, 'message': 'Error login user'};
  }
}
