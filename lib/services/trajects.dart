import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:sendatrack/model/trajects_model.dart';

class TrajectsService {
  static const String url =
      'http://wsdv.sendatrack.com/Trajet/CT/Liste/othman/numtrajet/sendacar.ddns.net/bdsendacar';

  static Future<List<Traject>> getTrajects() async {
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final List<dynamic> jsonResponse = jsonDecode(response.body);
        return jsonResponse.map((item) => Traject.fromJson(item)).toList();
      } else {
        throw Exception('in server response');
      }
    } catch (e) {
      throw Exception('Failed to load data outside of sser $e');
      ;
    }
  }
}
