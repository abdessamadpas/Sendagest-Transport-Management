import 'package:get/get.dart';
import '../controllers/addTraject.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddTrajectController>(
      () => AddTrajectController(),
    );
  }
}
