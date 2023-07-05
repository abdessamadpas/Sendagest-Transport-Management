import 'package:flutter/material.dart';
import 'package:get/get.dart';
import './app_routes.dart'; // Import the routes list from 'app_routes.dart

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'My App',
      initialRoute: AppRoutes.login, // Use the constant from AppRoutes
      getPages: AppRoutes.routes, // Use the routes list from AppRoutes
    );

    // return const MaterialApp(
    //   title: "sendaTrack",
    //   debugShowCheckedModeBanner: false,
    //   home: LoginScreen(),
    // );
  }
}
