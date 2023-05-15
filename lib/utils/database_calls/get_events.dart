import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:practicando_flutter/infrastructure/models/event_model.dart';

// Antes tenia que retornaba un http.response
Future<dynamic> getEvents(category) async {
  final Uri uri = Uri.parse(
      'http://10.0.2.2:3000/api/event/getbycategory?category=$category');

  try {
    http.Response response = await http.get(uri);
    return response.statusCode == 200
        ? eventFromJson(response.body)
        : 'Eventos no encontrados';
  } catch (e) {
    debugPrint(e.toString());
    return 'Error en la llamada ./utils/database_calls/get_events.dart';
  }
}
