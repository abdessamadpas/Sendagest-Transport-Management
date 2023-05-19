import 'package:flutter/material.dart';
import 'package:sendatrack/screens/login_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "sendaTrack",
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}
