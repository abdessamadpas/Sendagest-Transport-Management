import 'package:flutter/widgets.dart';

import 'package:get/get.dart';
import 'package:sendatrack/model/stock.dart';
import 'package:sendatrack/services/stock.dart';

class MovementController extends GetxController {
  RxBool input = true.obs;
  RxBool output = false.obs;

  DateTime date = DateTime.now();
// * define lists
  RxList<Stock> stock = <Stock>[].obs;
  RxList<Stock> reference = <Stock>[].obs;
  RxList<Stock> designation = <Stock>[].obs;

//todo need to define the following variables
//! depot
//! date
//! reference
//! vehicle id
//! type pane
//! citerne

  final TextEditingController DesignationTextEditingController =
      TextEditingController();
  final TextEditingController QuantityTextEditingController =
      TextEditingController();
  final TextEditingController PriceTextEditingController =
      TextEditingController();
  final TextEditingController ObservationTextEditingController =
      TextEditingController();
  final TextEditingController KilometrageTextEditingController =
      TextEditingController();
  final TextEditingController TVATextEditingController =
      TextEditingController();

  void changeState(String text) {
    input.value = !input.value;
    output.value = !output.value;
  }

  bool selectredOne(String text) {
    if (text == "Input") {
      return input.value;
    } else {
      return output.value;
    }
  }

  Future<void> fetchStock() async {
    List<Stock> data = await StockService.getStock("all");
  }

  getDepot(String depot) {
    stock.forEach((element) {
      if (element.id_Store == depot) {
        reference.add(element);
      }
    });
  }
}
