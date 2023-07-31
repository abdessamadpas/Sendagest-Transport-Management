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
u: [{"id":"","id_Store":"2","DateMvt":1690761600,"DateMvtString":"2023-07-31","TypeMvt":"E","NumBon":"","Extra":"","login":"","Qte":1,"Price":350,"Tva":0,"PrixTotal":"","Reference":"ref01","id_TypePanne":0,"id_Vehicule":0,"Kilometrage":0,"observation":"","Designation":"test01","idCiterne":"","id_delivery":0,"QteTotal":"","TVA":0},{"id":"","id_Store":"2","DateMvt":1690761600,"DateMvtString":"","TypeMvt":"E","NumBon":"","Extra":"","login":"","Qte":2,"Price":550,"Tva":0,"PrixTotal":"","Reference":"R2","id_TypePanne":0,"id_Vehicule":0,"Kilometrage":0,"observation":"","Designation":"RX002","idCiterne":"","id_delivery":0,"QteTotal":"","TVA":0}]