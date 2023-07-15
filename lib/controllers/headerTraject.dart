import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FilterHeaderController extends GetxController {
  RxBool isSavedTime = false.obs;
  DateTime? startDate = null;
  DateTime? endDate = null;

  TextEditingController _controllerClient = TextEditingController();
  TextEditingController _controllerFacture = TextEditingController();
  String? selectedStatus;

  String castDate(startDate, endDate) {
    if (startDate == null && endDate == null) {
      return "All";
    } else if (startDate == null) {
      return "Select Start Date";
    } else if (endDate == null) {
      return "Select End Date";
    }
    List<String> start = startDate.toString().split(" ").first.split("-");
    List<String> end = endDate.toString().split(" ").first.split("-");
    if (start[0] == end[0] && start[1] == end[1] && start[2] == end[2]) {
      return "${start[2]}/${start[1]}";
    }
    return "${start[2]}/${start[1]} - ${end[2]}/${end[1]}";
  }

  bool showForm = false;

  @override
  void onInit() {
    isSavedTime.value = false;
    super.onInit();
  }

  @override
  void onReady() {
    print("onReady in filterTrajects");
  }

  @override
  void onClose() {
    print("onClose in filterTrajects");
    super.onClose();
  }
}
