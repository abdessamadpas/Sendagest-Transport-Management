import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:sendatrack/model/vehicle.dart';
import 'package:sendatrack/utils/api_endpoints.dart';
import 'package:sendatrack/utils/token.dart';

class VehicleService {
  static const String url =
      '${ApiEndPoints.BASE_URL_PATH}/sendatrack-dev-othman/public/api/vehicule';

  static Future<List<Vehicle>> getVehicle() async {
    const String url =
        '${ApiEndPoints.BASE_URL_PATH}/sendatrack-dev-othman/public/api/vehicule';
    Map<String, String> headers = await TokenService.getHeaders();

    try {
      final response = await http.get(Uri.parse(url), headers: headers);
      print(response.body.toString());
      if (response.statusCode == 200) {
        final List<dynamic> jsonResponse = jsonDecode(response.body);
        return jsonResponse.map((item) => Vehicle.fromJson(item)).toList();
      } else {
        throw Exception('Failed to load DepotInfo from API');
      }
    } catch (e) {
      throw Exception('Error fetching data $e');
    }
  }
}
