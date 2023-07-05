import 'package:get/get.dart';
import '../screens/main_screen.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.home,
      page: () => MainScreen(),
      // binding: HomeBinding(),
    ),
    // GetPage(
    //   name: _Paths.login,
    //   page: () => LoginScreen(),
    //   // binding: LoginBinding(),
    // ),
    // GetPage(
    //   name: _Paths.detailsTraject,
    //   page: () => DetailsTrajectScreen(),
    //   // binding: DetailsTrajectBinding(),
    // ),
    // GetPage(
    //   name: _Paths.factures,
    //   page: () => FacturesScreen(),
    //   // binding: FacturesBinding(),
    // ),
    // GetPage(
    //   name: _Paths.trajects,
    //   page: () => TrajectsScreen(),
    //   // binding: TrajectsBinding(),
    // ),
  ];
}
