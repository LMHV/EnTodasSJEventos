import 'package:practicando_flutter/api_constants.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

Future<Map<String, dynamic>> createUser(name, surname, email, password) async {
  final Uri uri = Uri.parse(ApiConstants.createUserUrl);

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

    final data = jsonDecode(response.body);

    Map<String, dynamic> responseData = {
      'error': response.statusCode != 200,
      'message': data['msg']
    };

    return responseData;
  } catch (e) {
    debugPrint(e.toString());
    return {'error': true, 'message': 'Error creating user'};
  }
}
