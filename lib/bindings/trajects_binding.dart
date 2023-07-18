import 'package:get/get.dart';
import 'package:sendatrack/controllers/trajects/TrajectController.dart';

class TrajectsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TrajectsController>(
      () => TrajectsController(),
    );
  }
}
