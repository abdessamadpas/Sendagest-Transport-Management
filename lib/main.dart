import 'package:flutter/material.dart';
import 'package:get/get.dart';
import './routers/app_pages.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "sendaTrack",
      debugShowCheckedModeBanner: false,
      initialRoute: AppPages.INITIAL, // Use the constant from AppRoutes
      getPages: AppPages.routes, // Use the routes list from AppRoutes
    );
  }
}
