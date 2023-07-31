import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:sendatrack/model/trajects_model.dart';
import 'package:sendatrack/utils/api_endpoints.dart';

class TrajectsService {
  static const String url =
      '${ApiEndPoints.BASE_URL_HOST}/Trajet/CT/Liste/othman/numtrajet/sendacar.ddns.net/bdsendacar';

  static Future<List<Traject>> getTrajects() async {
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final List<dynamic> jsonResponse = jsonDecode(response.body);
        return jsonResponse.map((item) => Traject.fromJson(item)).toList();
      } else {
        throw Exception('Failed to load trajects from API');
      }
    } catch (e) {
      throw Exception('error fetching data $e');
      ;
    }
  }
}
