import 'package:get/get.dart';
import '../controllers/TrajectController.dart';

class TrajectsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TrajectsController>(
      () => TrajectsController(),
    );
  }
}
