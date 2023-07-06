import 'package:get/get.dart';
import '../controllers/TrajectDetailsController.dart';

class TrajectDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TrajectDetailsController>(
      () => TrajectDetailsController(),
    );
  }
}
