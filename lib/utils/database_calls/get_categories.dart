import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

final Uri uri = Uri.parse('http://10.0.2.2:3000/api/categories');

// Antes tenia que retornaba un http.response
Future<dynamic> getCategories() async {
/*  
  Map<String, dynamic> userBody = {
    'email': ,
    'password': ,
  };
*/
  try {
    http.Response response = await http.get(uri);
    return response.statusCode == 200 ? response : 'Categorías no encontradas';
  } catch (e) {
    debugPrint(e.toString());
    return 'Error en la llamada ./utils/database_calls/get_categories.dart';
  }
}
