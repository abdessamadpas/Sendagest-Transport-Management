import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:sendatrack/model/trajects_model.dart';

class TrajectsService {
  static const String url =
      'http://192.168.11.113/Trajet/CT/Liste/othman/numtrajet/sendacar.ddns.net/bdsendacar';

  static Future<List<Traject>> getTrajects() async {
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final List<dynamic> jsonResponse = jsonDecode(response.body);
        return jsonResponse.map((item) => Traject.fromJson(item)).toList();
      } else {
        throw Exception('Failed to load facture from API');
      }
    } catch (e) {
      throw Exception('error fetching data $e');
      ;
    }
  }
}
