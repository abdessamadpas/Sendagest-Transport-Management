import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:sendatrack/model/trajects_model.dart';

// class TrajectsService {
//   static const String url = 'http://localhost:8080/trajects';

//   static Future<List<Traject>> getTrajects() async {
//     try {
//       final response = await http.get(Uri.parse(url));
//       if (response.statusCode == 200) {
//         final jsonResponse = jsonDecode(response.body);
//         final List<Traject> trajects = Traject.fromJson(jsonResponse);
//         return trajects;
//       } else {
//         return List<Traject>();
//       }
//     } catch (e) {
//       return List<Traject>();
//     }
//   }
// }