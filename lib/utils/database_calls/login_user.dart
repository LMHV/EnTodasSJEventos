import 'package:practicando_flutter/utils/validate_email.dart';
import 'package:practicando_flutter/utils/validate_password.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

final Uri uri = Uri.parse('http://10.0.2.2:3000/api/users/login/');

Future<bool> loginUser(email, password) async {
  if (!isEmailValid(email)) {
    return false;
  }
  if (!isPasswordValid(password)) {
    return false;
  }

  Map<String, dynamic> userBody = {
    'email': email,
    'password': password,
  };

  if (userBody['email'] != '' && userBody['password'] != '') {
    try {
      http.Response response = await http.post(
        uri,
        headers: {'Content-Type': 'application/json'},
        body: json.encode(userBody),
      );

      if (response.statusCode == 200) {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        final responseBody = json.decode(response.body);
        await prefs.setString('token', responseBody['token']);

        return true;
      } else {
        return false;
      }
    } catch (e) {
      debugPrint(e.toString());
      return false;
    }
  }
  return false;
}
