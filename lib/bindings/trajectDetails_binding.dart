import 'package:get/get.dart';
import 'package:sendatrack/controllers/trajects/TrajectDetailsController.dart';

class TrajectDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TrajectDetailsController>(
      () => TrajectDetailsController(),
    );
  }
}
