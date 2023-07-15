import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:sendatrack/constant.dart';
import 'package:sendatrack/model/trajects_model.dart';
import 'package:sendatrack/services/trajects.dart';
import 'package:sendatrack/controllers/filterTrajects.dart';
import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:flutter/material.dart';
import 'package:sendatrack/controllers/headerTraject.dart';

class TrajectsController extends GetxController {
  RxList<Traject> trajectsList = <Traject>[].obs;
  RxList<SelectedListItem> clients = <SelectedListItem>[].obs;
  RxBool isLoading = true.obs;
  FilterTrajectsController filterController =
      Get.put(FilterTrajectsController());

  FilterHeaderController controllerHeader = Get.put(FilterHeaderController());

  @override
  void onInit() {
    super.onInit();
    print("on init for trajects controller ");
    print("on init for trajects controller ");
    ever(controllerHeader.isSavedTime, (_) {
      print("isSaved changed");
      print("time is cached ${controllerHeader.startDate}");
      fetchTrajects();
    });

    // ever((filterController.isSaved), (_) {
    //   print("isSaved changed");
    //   fetchTrajects();
    // });

    fetchTrajects().then((_) {
      fetchClients().then((clients) {
        filterController.initializeClients(clients);
      });
    });
  }

  Future<void> fetchTrajects() async {
    try {
      List<Traject> data = await TrajectsService.getTrajects();

      if (filterController.clientTextEditingController.text.isNotEmpty) {
        data = data
            .where((item) =>
                item.Client ==
                filterController.clientTextEditingController.text)
            .toList();
      }
      if (filterController.trajectTextEditingController.text.isNotEmpty) {
        data = data
            .where((item) =>
                item.Num_Trajet ==
                filterController.trajectTextEditingController.text)
            .toList();
      }

      List<Traject> filteredData = [];
      if (filterController.selectedStatus.isNotEmpty) {
        for (var status in filterController.selectedStatus) {
          if (status == "En cours") {
            filteredData.addAll(
                data.where((item) => item.Statut == 'ENCOURS').toList());
          }
          if (status == "Demarer") {
            filteredData.addAll(
                data.where((item) => item.Statut == 'DEMARRER').toList());
          }
          if (status == "Confirmer") {
            filteredData.addAll(
                data.where((item) => item.Statut == 'CONFIRMER').toList());
          }
          if (status == "Annuler") {
            filteredData.addAll(
                data.where((item) => item.Statut == 'ANNULER').toList());
          }
        }
      } else {
        filteredData.addAll(data);
      }

//! for time filtration

      if (controllerHeader.startDate != null &&
          controllerHeader.endDate != null) {
        filteredData = filteredData.where((item) {
          DateTime itemDate = DateTime.parse(item.Datedepart);
          DateTime startDateTime = DateTime(
            controllerHeader.startDate!.year,
            controllerHeader.startDate!.month,
            controllerHeader.startDate!.day,
          );
          DateTime endDateTime = DateTime(
            controllerHeader.endDate!.year,
            controllerHeader.endDate!.month,
            controllerHeader.endDate!.day,
          );

          return itemDate.isAtSameMomentAs(startDateTime) ||
              itemDate.isAtSameMomentAs(endDateTime) ||
              (itemDate.isAfter(startDateTime) &&
                  itemDate.isBefore(endDateTime));
        }).toList();
      }

      if (controllerHeader.startDate == controllerHeader.endDate &&
          controllerHeader.endDate != null &&
          controllerHeader.startDate != null) {
        print('picking a single day ');

        if (filteredData.isEmpty) {
          filteredData = data;
        }
        print('wewe : ${filteredData}');

        filteredData = filteredData
            .where((item) => DateTime.parse(item.Datedepart)
                .isAtSameMomentAs(controllerHeader.startDate!))
            .toList();
      }
      print('datawewe${filteredData}');
      trajectsList.value = filteredData;
      isLoading.value = false;
    } catch (error) {
      print('Error fetching trajects: $error');
    }
  }

  // fetch just Clients name from trajects
  Future<List<SelectedListItem>> fetchClients() async {
    try {
      List<SelectedListItem> clients = [];
      trajectsList.value.forEach((traject) {
        clients.add(SelectedListItem(name: traject.Client));
      });
      return clients;
    } catch (error) {
      print('Error fetching clients: $error');
      return [];
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
      return "${input.substring(0, maxLength - 3)}...";
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
