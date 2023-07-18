import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:sendatrack/controllers/invoices/factureController.dart';

class FilterInvoiceController extends GetxController {
  RxList<String> selectedStatus = <String>[].obs;
  RxBool isSaved = false.obs;
  final TextEditingController clientTextEditingController =
      TextEditingController();

  final TextEditingController invoiceTextEditingController =
      TextEditingController();
  late List<SelectedListItem> listOfClients = <SelectedListItem>[];

  @override
  void onInit() {
    print("onInit in filter factures");
    super.onInit();
  }

  void initializeClients(List<SelectedListItem> clients) {
    listOfClients = clients;
  }

  void applyFilter() {
    print("applyFilters factures ");
    isSaved.value = true;
    print('status of factures ${selectedStatus}');
    Get.find<InvoiceController>().fetchInvoices();
    Get.back();
  }

  void clearData() {
    print('clearData');
    clientTextEditingController.clear();
    invoiceTextEditingController.clear();
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
    print("onReady in filter invoices");
    super.onReady();
  }

  @override
  void onClose() {
    print("onClose");
    clientTextEditingController.dispose();
    invoiceTextEditingController.dispose();
    super.onClose();
  }
}
