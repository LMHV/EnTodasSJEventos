import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import 'package:practicando_flutter/utils/validate_email.dart';
import 'package:practicando_flutter/utils/validate_password.dart';

final Uri uri = Uri.parse('http://10.0.2.2:3000/api/users/create/');

Future<bool> createUser(name, surname, email, password) async {
  if (!isEmailValid(email)) {
    return false;
  }
  if (!isPasswordValid(password)) {
    return false;
  }

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
