import 'package:get/get.dart';
import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:flutter/material.dart';
import 'package:sendatrack/controllers/trajects/TrajectController.dart';

class FilterTrajectsController extends GetxController {
  RxList<String> selectedStatus = <String>[].obs;
  RxBool isSaved = false.obs;
  late List<SelectedListItem> listOfCities = <SelectedListItem>[];
  late List<SelectedListItem> listOfVehicles = <SelectedListItem>[];
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

  void initializeVehicles(List<SelectedListItem> vehicles) {
    listOfVehicles = vehicles;
  }

  void applyFilter() {
    print("applyFilter trajects");
    isSaved.value = true;
    print('status of trajects ${selectedStatus}');
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
