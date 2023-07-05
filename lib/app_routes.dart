import 'package:get/get.dart';

import 'package:sendatrack/screens/login_screen.dart';

class AppRoutes {
  static const String home = '/';
  static const String login = '/login';
  static const String details = '/details';

  static final routes = [
    GetPage(name: login, page: () => LoginScreen()),
    // Add more routes as needed
  ];
}
