import 'package:get/get.dart';
import 'package:sendatrack/controllers/trajects/addTraject.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddTrajectController>(
      () => AddTrajectController(),
    );
  }
}
