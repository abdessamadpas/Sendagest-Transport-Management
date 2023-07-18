import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:sendatrack/constant.dart';
import 'package:sendatrack/controllers/invoices/popupFactureController.dart';
import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:sendatrack/model/facture_model.dart';
import 'package:sendatrack/services/facture.dart';
import 'package:sendatrack/model/client.dart';
import 'package:sendatrack/services/clients.dart';

//! this controller is used to filter factures
class InvoiceController extends GetxController {
  RxList<Facture> invoicesList = <Facture>[].obs;
  RxList<SelectedListItem> clients = <SelectedListItem>[].obs;
  RxBool isLoading = true.obs;
  RxBool isSavedTime = false.obs;
  DateTime? startDate = null;
  DateTime? endDate = null;
  String? selectedStatus;

  FilterInvoiceController filterController = Get.put(FilterInvoiceController());

  @override
  void onInit() {
    super.onInit();
    isSavedTime.value = false;
    ever(isSavedTime, (_) {
      fetchInvoices();
    });

    fetchInvoices().then((_) {
      fetchClients().then((clients) {
        filterController.initializeClients(clients);
      });
    });
  }

// fetch trajects with filters and save them in invoicesList
  Future<void> fetchInvoices() async {
    try {
      List<Facture> data = await InvoiceService.getInvoices();

      if (filterController.clientTextEditingController.text.isNotEmpty) {
        data = data
            .where((item) =>
                item.Societ ==
                filterController.clientTextEditingController.text)
            .toList();
      }
      if (filterController.invoiceTextEditingController.text.isNotEmpty) {
        data = data
            .where((item) =>
                item.NumFacture ==
                filterController.invoiceTextEditingController.text)
            .toList();
      }

//! for status filtration needs to be changed
//todo: change status filtration

      List<Facture> filteredData = [];
      print(" lissst of selected ${filterController.selectedStatus} ");
      if (filterController.selectedStatus.isNotEmpty) {
        for (var status in filterController.selectedStatus) {
          if (status == "Annuler") {
            filteredData.addAll(
                data.where((item) => item.EtatFacture == 'ANNULER').toList());
          }
          if (status == "Non Regle") {
            filteredData.addAll(
                data.where((item) => item.EtatFacture == 'NONREGLE').toList());
          }
          if (status == "Regle Tot") {
            filteredData.addAll(
                data.where((item) => item.EtatFacture == 'REGLETOT').toList());
          }
          // if (status == "Annuler") {
          //   filteredData.addAll(
          //       data.where((item) => item.Statut == 'ANNULER').toList());
          // }
        }
      } else {
        filteredData.addAll(data);
      }

//! for time filtration

      if (startDate != null && endDate != null) {
        print("startDate $startDate");
        filteredData = filteredData.where((item) {
          DateTime itemDate = DateTime.parse(item.DateFacure);
          DateTime startDateTime = DateTime(
            startDate!.year,
            startDate!.month,
            startDate!.day,
          );
          DateTime endDateTime = DateTime(
            endDate!.year,
            endDate!.month,
            endDate!.day,
          );

          return itemDate.isAtSameMomentAs(startDateTime) ||
              itemDate.isAtSameMomentAs(endDateTime) ||
              (itemDate.isAfter(startDateTime) &&
                  itemDate.isBefore(endDateTime));
        }).toList();
      }

      if (startDate == endDate && endDate != null && startDate != null) {
        if (filteredData.isEmpty) {
          filteredData = data;
        }

        filteredData = filteredData
            .where((item) =>
                DateTime.parse(item.DateFacure).isAtSameMomentAs(startDate!))
            .toList();
      }
      invoicesList.value = filteredData;
      isLoading.value = false;
    } catch (error) {
      print('Error fetching trajects: $error');
    }
  }

  // fetch just Clients name from API
  Future<List<SelectedListItem>> fetchClients() async {
    try {
      List<SelectedListItem> clients = [];
      List<Clients> data = await ClientService.getClients();
      data.forEach((client) {
        clients.add(SelectedListItem(name: client.Client));
      });
      return clients;
    } catch (error) {
      print('Error fetching clients: $error');
      return [];
    }
  }

// static methods for UI
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
}
