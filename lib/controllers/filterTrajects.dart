import 'package:get/get.dart';
import 'package:sendatrack/widgets/multiSelectInput.dart';
import 'package:sendatrack/widgets/multiSelectInput.dart';
import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:flutter/material.dart';

class FilterTrajectsController extends GetxController {
  RxBool DemarerisSelected = false.obs;
  RxBool EnCoursisSelected = false.obs;
  RxBool LivreisSelected = false.obs;
  RxBool AnnuleisSelected = false.obs;

  RxList<String> selectedStatus = <String>[].obs;

  final List<SelectedListItem> listOfCities = [
    SelectedListItem(name: 'sendatrack'),
    SelectedListItem(name: 'company 1 '),
    SelectedListItem(name: 'company 2 '),
    SelectedListItem(name: 'company 3 '),
    SelectedListItem(name: 'company 4 '),
    SelectedListItem(name: 'company 5 '),
    SelectedListItem(name: 'company 6 '),
    SelectedListItem(name: 'company 7 '),
    SelectedListItem(name: 'company 8 '),
    SelectedListItem(name: 'company 9 '),
  ];
  final List<SelectedListItem> listOfVehicles = [
    SelectedListItem(name: 'vehicle 1'),
    SelectedListItem(name: 'vehicle 2'),
    SelectedListItem(name: 'vehicle 3'),
    SelectedListItem(name: 'vehicle 4'),
    SelectedListItem(name: 'vehicle 5'),
    SelectedListItem(name: 'vehicle 6'),
    SelectedListItem(name: 'vehicle 7'),
    SelectedListItem(name: 'vehicle 8'),
    SelectedListItem(name: 'vehicle 9'),
  ];
  final TextEditingController clientTextEditingController =
      TextEditingController();
  final TextEditingController vehiculeTextEditingController =
      TextEditingController();
  final TextEditingController trajectTextEditingController =
      TextEditingController();

  @override
  void onInit() {
    super.onInit();
  }

  void clearData() {
    print('clearData');
    // print(selectedStatus.toList());
    // print(clientTextEditingController.text);
    // print(vehiculeTextEditingController.text);
    // print(trajectTextEditingController.text);

    clientTextEditingController.clear();
    vehiculeTextEditingController.clear();
    trajectTextEditingController.clear();
    selectedStatus.clear();
  }

  void stateShip(String value) {
    if (selectedStatus.contains(value)) {
      selectedStatus.remove(value);
    } else {
      selectedStatus.add(value);
    }
  }

  @override
  void onReady() {
    print("onReady");

    super.onReady();
  }

  @override
  void onClose() {
    print("onClose");
    clientTextEditingController.dispose();
    vehiculeTextEditingController.dispose();
    trajectTextEditingController.dispose();
    super.onClose();
  }
}
