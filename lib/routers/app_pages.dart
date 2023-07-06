import 'package:get/get.dart';
import '../bindings/home_binding.dart';
import '../screens/main_screen.dart';
import '../bindings/trajects_binding.dart';
import '../screens/trajects_screen.dart';
import '../screens/detailsTraject_screen.dart';
import '../bindings/trajectDetails_binding.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.home,
      page: () => MainScreen(),
      binding: HomeBinding(),
    ),
    // GetPage(
    //   name: _Paths.login,
    //   page: () => LoginScreen(),
    //   // binding: LoginBinding(),
    // ),
    // GetPage(
    //   name: _Paths.detailsTraject,
    //   page: () => DetailsTraject(),
    //   binding: TrajectDetailsBinding(),
    // ),
    // GetPage(
    //   name: _Paths.factures,
    //   page: () => FacturesScreen(),
    //   // binding: FacturesBinding(),
    // ),
    GetPage(
      name: _Paths.trajects,
      page: () => Trajects(),
      binding: TrajectsBinding(),
    ),
  ];
}
