import 'dart:ffi';
import 'dart:math';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import 'dart:convert';
import 'package:flutter/material.dart';
import '../../../constant.dart';
import 'package:sendatrack/model/movementGet.dart';
import 'package:sendatrack/services/movement.dart';

class LogMovementController extends GetxController {
  RxBool tangerStore = false.obs;
  RxBool casaStore = false.obs;
  RxList<MovementGet> stockList = <MovementGet>[].obs;
  RxList<MovementGet> stockListFiltered = <MovementGet>[].obs;
  bool _isFetching = false;

  RxBool isLoading = true.obs;
  @override
  void onInit() {
    fetchStock();
    // ever(product, (_) async {
    //   stockList.clear();
    //   stockListFiltered.clear();

    //   await fetchStock();
    // });
    // ever(store, (_) async {
    //   stockList.clear();
    //   stockListFiltered.clear();
    //   await fetchStock();
    // });
    super.onInit();
  }

  void changeStateShip(String value) {
    if (_isFetching) return; // Ignore state changes when fetching data

    if (value == "tanger") {
      tangerStore.value = !tangerStore.value;
      casaStore.value = false;
      isLoading.value = true;
    } else if (value == "casa") {
      casaStore.value = !casaStore.value;
      tangerStore.value = false;

      isLoading.value = true;
    } else {
      tangerStore.value = false;
      casaStore.value = false;
    }

    _isFetching = true; // Mark that we are fetching data

    //!  Wait for 800 milliseconds before fetching data
    Future.delayed(Duration(milliseconds: 1), () {
      fetchStock().then((_) {
        _isFetching = false; // Mark that data fetching is done
      });
    });
  }

  Future<void> fetchStock() async {
    isLoading.value = true;

    String status;
    if (tangerStore.value == true) {
      status = "tanger";
    } else if (casaStore.value == true) {
      status = "casa";
    } else {
      status = "all";
    }
    List<MovementGet> data = await MovementService.GetMovements();
    print(data);

    // Clear the lists before adding new data
    stockList.clear();
    stockListFiltered.clear();

    stockList.addAll(data);
    stockListFiltered.addAll(data);

    isLoading.value = false;
  }

  // void filterSearchResults(String query) {
  //   List<MovementGet> result = [];

  //   if (query.isNotEmpty) {
  //     result = stockList.where((element) {
  //       bool matchReference = element.Reference != null &&
  //           element.Reference!.toLowerCase().contains(query.toLowerCase());

  //       bool matchDesignation = element.Designation != null &&
  //           element.Designation!
  //               .toString()
  //               .toLowerCase()
  //               .contains(query.toLowerCase());
  //       bool matchStore = element.id_Store != null &&
  //           element.id_Store!.toLowerCase().contains(query.toLowerCase());
  //       bool matchQte = element.Qte != null &&
  //           element.Qte!.toString().toLowerCase().contains(query.toLowerCase());
  //       return matchReference || matchDesignation || matchStore || matchQte;
  //     }).toList();
  //   } else {
  //     result = List.from(stockList);
  //   }

  //   stockListFiltered.value = result;
  // }
}
