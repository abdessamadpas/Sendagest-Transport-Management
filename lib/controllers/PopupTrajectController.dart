import 'package:get/get.dart';
import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:flutter/material.dart';
import 'package:sendatrack/controllers/TrajectController.dart';

class FilterTrajectsController extends GetxController {
  RxList<String> selectedStatus = <String>[].obs;
  RxBool isSaved = false.obs;
  late List<SelectedListItem> listOfCities = <SelectedListItem>[];
  final List<SelectedListItem> listOfVehicles = [
    SelectedListItem(name: 'Car'),
    SelectedListItem(name: 'Truck'),
    SelectedListItem(name: 'Bike'),
    SelectedListItem(name: 'Boat'),
    SelectedListItem(name: 'Plane'),
    SelectedListItem(name: 'Train'),
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

  void initializeClients(List<SelectedListItem> clients) {
    listOfCities = clients;
  }

  void applyFilter() {
    print("applyFilter");
    isSaved.value = true;
    print(selectedStatus);
    Get.find<TrajectsController>().fetchTrajects();
    Get.back();
  }

  void clearData() {
    print('clearData');
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
    print("onReady in filterTrajects");
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
