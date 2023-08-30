import 'dart:convert';
import 'package:sendatrack/utils/token.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:sendatrack/model/movement.dart';
import 'package:sendatrack/model/movementGet.dart';

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
      } else {
        print('Request failed with status: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  static Future GetMovements() async {
    String serverUrl =
        'http://backup.sendatrack.com/sendatrack-dev-othman/public/api/loadMvt';
    Map<String, String> headers = await TokenService.getHeaders();

    try {
      final response = await http.get(Uri.parse(serverUrl), headers: headers);

      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        List<MovementGet> movements = [];
        for (var item in data) {
          movements.add(MovementGet.fromJson(item));
        }

        return movements;
      } else {
        print('Request failed with status: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }
}
