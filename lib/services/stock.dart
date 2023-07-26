import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:sendatrack/model/stock.dart';
import 'package:sendatrack/utils/api_endpoints.dart';
import 'package:sendatrack/utils/token.dart';

import 'package:shared_preferences/shared_preferences.dart';

class StockService {
  static Future<List<Stock>> getStock(String status) async {
    late String url;
    Map<String, String> headers = await TokenService.getHeaders();

    if (status == 'store') {
      url =
          '${ApiEndPoints.BASE_URL_PATH}/sendatrack-dev/public/api/loadStore?grouper=id_Store';
    } else if (status == 'product') {
      url =
          '${ApiEndPoints.BASE_URL_PATH}/sendatrack-dev/public/api/loadStore?grouper=Reference';
    } else if (status == 'all') {
      url =
          '${ApiEndPoints.BASE_URL_PATH}/sendatrack-dev/public/api/loadStore?grouper=Reference,id_Store';
    } else {
      throw ArgumentError('Invalid status: $status');
    }
    //  AUTH_TOKEN = await ApiEndPoints.getToken()

    try {
      final response = await http.get(Uri.parse(url), headers: headers);
      print(status + "  " + response.statusCode.toString());
      if (response.statusCode == 200) {
        final List<dynamic> jsonResponse = jsonDecode(response.body);
        return jsonResponse.map((item) => Stock.fromJson(item)).toList();
      } else {
        throw Exception('Failed to load Stock from API');
      }
    } catch (e) {
      throw Exception('Error fetching data $e');
    }
  }
}
