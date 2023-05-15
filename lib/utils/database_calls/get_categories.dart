import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:practicando_flutter/infrastructure/models/category_model.dart';

final Uri uri = Uri.parse('http://10.0.2.2:3000/api/categories/getAll');

// Antes tenia que retornaba un http.response
Future<dynamic> getCategories() async {
  try {
    http.Response response = await http.get(uri);
    return response.statusCode == 200
        ? categoryFromJson(response.body)
        : 'Categorías no encontradas';
  } catch (e) {
    debugPrint(e.toString());
    return 'Error en la llamada ./utils/database_calls/get_categories.dart';
  }
}
