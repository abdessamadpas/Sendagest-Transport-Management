import 'dart:math';
import 'package:debounce_throttle/debounce_throttle.dart';
import 'package:get/get.dart';
import 'package:sendatrack/model/stock.dart';
import 'package:sendatrack/services/stock.dart';

class StockController extends GetxController {
  RxBool store = false.obs;
  RxBool product = false.obs;
  RxList<Stock> stockList = <Stock>[].obs;
  RxList<Stock> stockListFiltered = <Stock>[].obs;
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

    if (value == "store") {
      store.value = !store.value;
      product.value = false;
      isLoading.value = true;
    } else if (value == "product") {
      product.value = !product.value;
      store.value = false;

      isLoading.value = true;
    } else {
      store.value = false;
      product.value = false;
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
    if (store.value == true) {
      status = "store";
    } else if (product.value == true) {
      status = "product";
    } else {
      status = "all";
    }
    List<Stock> data = await StockService.getStock(status);

    // Clear the lists before adding new data
    stockList.clear();
    stockListFiltered.clear();

    stockList.addAll(data);
    stockListFiltered.addAll(data);

    isLoading.value = false;
  }

  void filterSearchResults(String query) {
    List<Stock> result = [];

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
            element.id_Store!.toLowerCase().contains(query.toLowerCase());
        bool matchQte = element.Qte != null &&
            element.Qte!.toString().toLowerCase().contains(query.toLowerCase());
        return matchReference || matchDesignation || matchStore || matchQte;
      }).toList();
    } else {
      result = List.from(stockList); // Make a copy of the original stockList
    }

    stockListFiltered.value = result;
  }
}
