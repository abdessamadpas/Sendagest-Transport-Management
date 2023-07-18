import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:sendatrack/model/client.dart';

class ClientService {
  static const String url =
      'http://192.168.11.113//Trajet/CT/Donnee/Client/sendacar.ddns.net/bdsendacar';

  static Future<List<Clients>> getClients() async {
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final List<dynamic> jsonResponse = jsonDecode(response.body);
        return jsonResponse.map((item) => Clients.fromJson(item)).toList();
      } else {
        throw Exception('Failed to load facture from API');
      }
    } catch (e) {
      throw Exception('error fetching data $e');
      ;
    }
  }
}
