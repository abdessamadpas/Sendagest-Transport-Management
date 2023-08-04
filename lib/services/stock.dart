import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:sendatrack/model/stock.dart';
import 'package:sendatrack/model/depotInfo.dart';
import 'package:sendatrack/model/product.dart';

import 'package:sendatrack/utils/api_endpoints.dart';
import 'package:sendatrack/utils/token.dart';

import 'package:shared_preferences/shared_preferences.dart';

class StockService {
  //! get stock
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

//! get depots
  static Future<List<DepotInfo>> getDepotInfo(String type) async {
    String url =
        '${ApiEndPoints.BASE_URL_PATH}/sendatrack-dev-othman/public/api/loadParam?table=$type&extra=Min&foreignTable=';
    Map<String, String> headers = await TokenService.getHeaders();

    try {
      final response = await http.get(Uri.parse(url), headers: headers);
      if (response.statusCode == 200) {
        final List<dynamic> jsonResponse = jsonDecode(response.body);
        return jsonResponse.map((item) => DepotInfo.fromJson(item)).toList();
      } else {
        throw Exception('Failed to load DepotInfo from API');
      }
    } catch (e) {
      throw Exception('Error fetching data $e');
    }
  }

  //! get products
  static Future<List<Product>> getProducts(String type) async {
    String url =
        '${ApiEndPoints.BASE_URL_PATH}/sendatrack-dev-othman/public/api/getProducts?minimum=true';
    Map<String, String> headers = await TokenService.getHeaders();

    try {
      final response = await http.get(Uri.parse(url), headers: headers);
      print(type + "  " + response.body.toString());
      if (response.statusCode == 200) {
        final List<dynamic> jsonResponse = jsonDecode(response.body);
        return jsonResponse.map((item) => Product.fromJson(item)).toList();
      } else {
        throw Exception('Failed to load produts list from API');
      }
    } catch (e) {
      throw Exception('Error fetching data $e');
    }
  }
}
