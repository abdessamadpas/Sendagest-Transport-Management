import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:sendatrack/model/facture_model.dart';

class InvoiceService {
  static const String url =
      'http://wsdv.sendatrack.com/Trajet/SG/LstFact/Top100/sendacar.ddns.net/bdsendacar';

  static Future<List<Facture>> getInvoices() async {
    try {
      final response = await http.get(Uri.parse(url));
      print(response.body);
      if (response.statusCode == 200) {
        final List<dynamic> jsonResponse = jsonDecode(response.body);
        return jsonResponse.map((item) => Facture.fromJson(item)).toList();
      } else {
        throw Exception('in server response');
      }
    } catch (e) {
      throw Exception('Failed to load data outside of sser $e');
      ;
    }
  }
}