import 'package:get/get.dart';
import 'package:flutter/material.dart';

class AuthMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    if (route == '/login') {
      return null;
    }
    return RouteSettings(name: '/login');
  }
}
