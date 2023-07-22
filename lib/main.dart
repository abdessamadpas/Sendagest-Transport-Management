import 'package:flutter/material.dart';
import 'package:get/get.dart';
import './routers/app_pages.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'middlewares/auth.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      // needs to be fixed for different screen sizes
      designSize: const Size(1100, 1500),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          title: "sendaTrack",
          debugShowCheckedModeBanner: false,
          onGenerateRoute: (settings) {
            // Redirect to home or login based on authentication status
            AuthService.redirectToHomeOrLogin();
            return MaterialPageRoute(
              builder: (context) => SizedBox.shrink(),
            );
          },
          initialRoute: AppPages.INITIAL, // Use the constant from AppRoutes
          getPages: AppPages.routes, // Use the routes list from AppRoutes
        );
      },
    );
  }
}
