import 'package:get/get.dart';
import '../controllers/traject_controller.dart';

class TrajectsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TrajectsController>(
      () => TrajectsController(),
    );
  }
}
