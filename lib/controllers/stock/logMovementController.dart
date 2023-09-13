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
  late List<SelectedListItem> listOfStores = <SelectedListItem>[];

  RxBool tangerStore = false.obs;
  RxBool casaStore = false.obs;
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
  void onInit() async {
    listOfStores = await fetchStores();
    fetchStock();
    isSavedTime.value = false;
    ever(isSavedTime, (_) {
      fetchStock();
    });
    ever(tangerStore, (_) async {
      stockList.clear();
      stockListFiltered.clear();
      await fetchStock();
    });
    ever(casaStore, (_) async {
      stockList.clear();
      stockListFiltered.clear();
      await fetchStock();
    });
    ever(status, (_) async {
      stockList.clear();
      stockListFiltered.clear();
      await fetchStock();
    });
    super.onInit();
  }
//!fetch stores

  Future<List<SelectedListItem>> fetchStores() async {
    List<SelectedListItem> stores = [];

    try {
      List<DepotInfo> data = await StockService.getDepotInfo("Store");
      data.forEach((store) {
        stores.add(SelectedListItem(
          name: store.description!,
        ));
      });
      return stores;
    } catch (error) {
      print('Error fetching clients: $error');
      return [];
    }
  }

  void changeStateShip(String value) {
    if (_isFetching) return; // Ignore state changes when fetching data

    if (value == 'tanger') {
      tangerStore.value = !tangerStore.value;
      casaStore.value = false;
      isLoading.value = true;
    } else if (value == 'casa') {
      casaStore.value = !casaStore.value;
      tangerStore.value = false;
      isLoading.value = true;
    } else {
      tangerStore.value = false;
      casaStore.value = false;
      isLoading.value = true;
    }

    _isFetching = true;
    //!  Wait for 800 milliseconds before fetching data
    Future.delayed(Duration(milliseconds: 1), () {
      fetchStock().then((_) {
        _isFetching = false;
      });
    });
  }

  Future<void> fetchStock() async {
    if (tangerStore.value == true) {
      status.value = "siege";
    } else if (casaStore.value == true) {
      status.value = "Dépôt Casa";
    } else if (tangerStore.value == false && casaStore.value == false) {
      status.value = "all";
    }

    isLoading.value = true;
    List<MovementGet> data = await MovementService.GetMovements();
    if (status.value == "all") {
      data = await data.toList();
    } else if (status.value == "siege") {
      data =
          await data.where((element) => element.id_Store == "siege").toList();
    } else if (status.value == "Dépôt Casa") {
      data = await data
          .where((element) => element.id_Store == "Dépôt Casa")
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
