import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:practicando_flutter/api_constants.dart';
import 'dart:async';
import 'package:practicando_flutter/infrastructure/models/category_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Antes tenia que retornaba un http.response
Future<dynamic> getCategories() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? token = prefs.getString('token');

  final Uri uri = Uri.parse(ApiConstants.getAllcategoriesUrl);

  try {
    http.Response response =
        await http.get(uri, headers: {'Authorization': 'Bearer $token'});
    return response.statusCode == 200 ? categoryFromJson(response.body) : null;
  } catch (e) {
    debugPrint(e.toString());
    return 'Error en la llamada ./utils/database_calls/get_categories.dart';
  }
}
