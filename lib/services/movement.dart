import 'dart:convert';

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:sendatrack/model/movement.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;

class MovementService {
  static Future addMovement(dataToSend) async {
    String serverUrl =
        'http://backup.sendatrack.com/sendatrack-dev-othman/public/api/AddMvt';

    String queryString = Uri(queryParameters: dataToSend).query;

    String requestUrl = '$serverUrl?$queryString';

    try {
      final response = await http.get(Uri.parse(requestUrl));

      if (response.statusCode == 200) {
        print('Response: ${response.body}');
      } else {
        print('Request failed with status: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }
}
