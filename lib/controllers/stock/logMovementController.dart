import 'dart:ffi';
import 'dart:math';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import '../../../constant.dart';
import 'package:sendatrack/model/movementGet.dart';
import 'package:sendatrack/services/movement.dart';
import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:sendatrack/services/stock.dart';
import 'package:sendatrack/model/depotInfo.dart';

class LogMovementController extends GetxController {
  final TextEditingController storeTextEditingController =
      TextEditingController();
  RxList<SelectedListItem> listOfStores = <SelectedListItem>[].obs;
  RxList selectedList = [].obs;
  RxString status = "".obs;
  RxList<MovementGet> stockList = <MovementGet>[].obs;
  RxList<MovementGet> stockListFiltered = <MovementGet>[].obs;
  bool _isFetching = false;
//! for date filtration
  RxBool isSavedTime = false.obs;
  DateTime? startDate = null;
  DateTime? endDate = null;

  RxBool isLoading = true.obs;
  @override
  void onInit() {
    super.onInit();
    fetchStores();
    fetchStock();
    isSavedTime.value = false;
    ever(isSavedTime, (_) {
      fetchStock();
    });

    ever(selectedList, (_) async {
      stockList.clear();
      stockListFiltered.clear();
      await fetchStock();
    });
  }

//!fetch stores

  Future<void> fetchStores() async {
    List<SelectedListItem> stores = [];
    listOfStores.clear();

    try {
      List<DepotInfo> data = await StockService.getDepotInfo("Store");
      data.forEach((store) {
        listOfStores.add(SelectedListItem(
          name: store.description!,
        ));
      });
    } catch (error) {
      print('Error fetching clients: $error');
    }
  }

  Future<void> fetchStock() async {
    isLoading.value = true;
    print("selectedListttttttt $selectedList ${selectedList.length}");

    List<MovementGet> data = await MovementService.GetMovements();
    if (selectedList.isEmpty) {
      data = await data.toList();
    } else {
      data = data
          .where((element) => selectedList.contains(element.id_Store))
          .toList();
    }

    //! for feltring with date
    if (startDate != null && endDate != null) {
      print("filtering by date");
      print("startDate $startDate");
      data = data.where((item) {
        if (item.TypeMvt != null) {
          var castDate =
              DateTime.fromMillisecondsSinceEpoch(item.DateMvt! * 1000);
          DateTime itemDate = castDate;
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
        }
        // Handle the case where TypeMvt is null (you can decide what to do here)
        return false;
      }).toList();
    }

    if (startDate == endDate && endDate != null && startDate != null) {
      if (data.isEmpty) {
        data = data;
      }

      data = data
          .where((item) => DateTime.parse(changeDate(item.DateMvt))
              .isAtSameMomentAs(startDate!))
          .toList();
    }

    print("fetchStock is called haha");
    stockList.clear();
    stockListFiltered.clear();
    stockList.addAll(data);
    stockListFiltered.addAll(data);
    isLoading.value = false;
  }

  void filterSearchResults(String query) {
    List<MovementGet> result = [];
    if (query.isNotEmpty) {
      result = stockList.where((element) {
        bool matchReference = element.Reference != null &&
            element.Reference!.toLowerCase().contains(query.toLowerCase());

        bool matchDesignation = element.Designation != null &&
            element.Designation!
                .toString()
                .toLowerCase()
                .contains(query.toLowerCase());
        bool matchStore = element.id_Store != null &&
            element.id_Store!
                .toString()
                .toLowerCase()
                .contains(query.toLowerCase());
        bool matchQte = element.Qte != null &&
            element.Qte!.toString().toLowerCase().contains(query.toLowerCase());
        return matchReference || matchDesignation || matchStore || matchQte;
      }).toList();
    } else {
      result = List.from(stockList);
    }
    stockListFiltered.value = result;
  }

  String changeDate(timestamp) {
    var date = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
    var formattedDate = "${date.day}-${date.month}-${date.year}";
    return formattedDate;
  }
}
