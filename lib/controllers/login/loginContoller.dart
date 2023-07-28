import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sendatrack/routers/app_pages.dart';

class LoginController extends GetxController {
  final TextEditingController accountTextEditingController =
      TextEditingController();
  final TextEditingController usernameTextEditingController =
      TextEditingController();
  final TextEditingController passwordTextEditingController =
      TextEditingController();

  RxBool isRemembered = true.obs;

  @override
  void onInit() {
    super.onInit();
  }

  void rememberMe() {
    isRemembered.value = !isRemembered.value;
  }

  Future<void> login() async {
    print('login function called');
    if (accountTextEditingController.text.isEmpty ||
        usernameTextEditingController.text.isEmpty ||
        passwordTextEditingController.text.isEmpty) {
      Get.snackbar('Error ', 'Please fill all fields 🤬');
      return;
    }
    final url = Uri.parse(
        'http://backup.sendatrack.com/sendatrack-dev-othman/public/api/login');
    final headers = {"Content-type": "application/json"};

    final jsonData = json.encode({
      "accountID": accountTextEditingController.text,
      "user": usernameTextEditingController.text,
      "password": passwordTextEditingController.text,
      "remember": isRemembered.value,
    });
    final response = await http.post(url, headers: headers, body: jsonData);
    if (response.statusCode != 200) {
      Get.snackbar('Error ', 'Invalid credentials 🤬');
      return;
    }
    final jsonResponse = json.decode(response.body);
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('user', jsonResponse['user']);
    await prefs.setString('token', jsonResponse['token']);
    Get.toNamed(Routes.HOME);
    print('response : ${jsonResponse['user']}');
  }

  logout() async {
    print('logout function called');
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('user');
    await prefs.remove('token');
    Get.toNamed('/login');
  }
}
