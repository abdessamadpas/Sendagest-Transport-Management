import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future check() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    print("token weeeeeee: $token");
    return token != null ? '/home' : '/login';
  }

  @override
  void initState() {
    super.initState();

    Future.delayed(
      const Duration(seconds: 2),
      () => check()
          .then((route) => Navigator.pushReplacementNamed(context, route)),
    );
  } //

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Image.asset(
            'images/sendaslide.jpg',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          // Add any other UI elements you want on top of the background image here
          // For example, you can show your logo or any other widgets.
          // You can also use AnimatedContainer, CircularProgressIndicator, etc.
        ],
      ),
    );
  }
}
