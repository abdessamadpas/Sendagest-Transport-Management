import 'package:flutter/material.dart';
import 'package:get/get.dart';
import './routers/app_pages.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'middlewares/auth.dart';
import 'dart:developer';
import 'package:sendatrack/screens/handleErrors/custom_error_widget.dart';

void main() {
  FlutterError.onError = (FlutterErrorDetails details) {
    FlutterError.dumpErrorToConsole(details);
    log(details.exceptionAsString());
    runApp(const CustomErrorWidget(
        errorMessage: "  something went wrong \n please restart the app "));
  };

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      //! needs to be fixed for different screen sizes and needs to be dynamic depending on the screen size
      designSize: const Size(1100, 1500),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          title: "SendaTrack",
          debugShowCheckedModeBanner: false,
          onGenerateRoute: (settings) {
            // Redirect to home or login based on authentication status
            AuthService.redirectToHomeOrLogin();
            return MaterialPageRoute(
              builder: (context) => const SizedBox.shrink(),
            );
          },
          initialRoute: AppPages.INITIAL, // Use the constant from AppRoutes
          getPages: AppPages.routes, // Use the routes list from AppRoutes
        );
      },
    );
  }
}
