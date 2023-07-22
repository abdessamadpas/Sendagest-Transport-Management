// import 'package:get/get.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class AuthMiddleware extends GetMiddleware {
//   @override
//   Future<GetNavConfig?> redirectDelegate(GetNavConfig route) async {
//     print("middleware check");
//     // Check login status
//     final SharedPreferences prefs = await SharedPreferences.getInstance();
//     final token = prefs.getString('token');

//     if (token == null) {
//       // If token doesn't exist, redirect to the login page
//       return GetNavConfig.fromRoute('/login');
//     }

//     // If token exists, continue with the original route
//     return super.redirectDelegate(route);
//   }
// }
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sendatrack/routers/app_pages.dart';

class AuthService {
  static Future<bool> isLoggedIn() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    return token != null;
  }

  static void redirectToHomeOrLogin() async {
    print('redirectToHomeOrLogin function called');
    final isLoggedIn = await AuthService.isLoggedIn();
    Get.offNamed(isLoggedIn ? Routes.HOME : Routes.LOGIN);
  }
}
