import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:sendatrack/constant.dart';
import 'package:sendatrack/model/trajects_model.dart';
import 'package:sendatrack/services/trajects.dart';

class TrajectsController extends GetxController {
  RxList<Traject> trajectsList = <Traject>[].obs;
  RxBool isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();

    fetchTrajects();
  }

  Future<void> fetchTrajects() async {
    try {
      List<Traject> data = await TrajectsService.getTrajects();
      print(data);
      trajectsList.value = data;
      isLoading.value = false;
    } catch (error) {
      print('Error fetching trajects: $error');
    }
  }

  String getFirstAndLastCity(String libelleTrajet) {
    List<String> cities =
        libelleTrajet.split(">").map((city) => city.trim()).toList();
    if (cities.isNotEmpty) {
      String firstCity = cities.first;
      String lastCity = cities.last;
      return "$firstCity >$lastCity";
    }
    return " error in casting cities";
  }

  String getFirstLetter(String input) => input.substring(0, 1).toUpperCase();

  String truncateString(String input, int maxLength) {
    if (input.length <= maxLength) {
      return input;
    } else {
      return input.substring(0, maxLength - 3) + "...";
    }
  }

  Color getColor(String letter) {
    Color selectedColor = Colors.black;
    if (letter == 'D') {
      selectedColor = kGreen;
    } else if (letter == 'E') {
      selectedColor = kOrange;
    } else if (letter == 'T') {
      selectedColor = kDarkBlue;
    }
    return selectedColor;
  }

  String getTime(String date) {
    List<String> justTime = date.split(".");
    if (justTime.isNotEmpty) {
      String time = justTime.first;
      return time;
    }
    return " error in casting time";
  }
}
