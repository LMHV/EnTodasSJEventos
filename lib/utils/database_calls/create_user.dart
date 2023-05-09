import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

final Uri uri = Uri.parse('http://10.0.2.2:3000/api/users/create/');

Future<bool> createUser(name, surname, email, password) async {
  Map<String, dynamic> userBody = {
    'name': name,
    'surname': surname,
    'email': email,
    'password': password
  };

  try {
    http.Response response = await http.post(
      uri,
      headers: {'Content-Type': 'application/json'},
      body: json.encode(userBody),
    );

    return response.statusCode == 200 ? true : false;
  } catch (e) {
    debugPrint(e.toString());
    return false;
  }
}
