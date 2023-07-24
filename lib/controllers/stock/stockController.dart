import 'package:get/get.dart';

class stockController extends GetxController {
  RxList<String> selectedOptions = <String>[].obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  void ChangeStateShip(String value) {
    if (selectedOptions.contains(value)) {
      selectedOptions.remove(value);
    } else {
      selectedOptions.add(value);
    }
  }
}
