import 'package:shared_preferences/shared_preferences.dart';

class TokenService {
  static const String token = 'auth_token';

  static Future<String?> getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    return token;
  }

  static Future<void> setToken(String _tokenKey) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(token, _tokenKey);
  }

  static Future<void> clearToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(token);
  }

  static Future<Map<String, String>> getHeaders() async {
    String? token = await getToken();
    return {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };
  }
}
