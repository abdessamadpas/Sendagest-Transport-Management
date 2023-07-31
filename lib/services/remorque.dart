import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:sendatrack/model/remorque.dart';
import 'package:sendatrack/utils/api_endpoints.dart';

class RemorqueService {
  static const String url =
      '${ApiEndPoints.BASE_URL_HOST}/Trajet/CT/Donnee/Remorque/sendacar.ddns.net/bdsendacar';

  static Future<List<Vehicle>> getRemorque() async {
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final List<dynamic> jsonResponse = jsonDecode(response.body);
        return jsonResponse.map((item) => Vehicle.fromJson(item)).toList();
      } else {
        throw Exception('Failed to load remoques from API');
      }
    } catch (e) {
      throw Exception('error fetching data $e');
      ;
    }
  }
}
