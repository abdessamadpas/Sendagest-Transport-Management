import 'package:get/get.dart';
import 'package:sendatrack/model/stock.dart';
import 'package:sendatrack/services/stock.dart';

class StockController extends GetxController {
  RxBool store = false.obs;
  RxBool product = false.obs;
  RxList<Stock> stockList = <Stock>[].obs;
  RxList<Stock> stockListFiltered = <Stock>[].obs;

  RxBool isLoading = true.obs;
  @override
  void onInit() {
    super.onInit();
    fetchStock();
    ever(store, (_) {
      fetchStock();
    });
    ever(product, (_) {
      fetchStock();
    });
  }

  @override
  void onReady() {
    super.onReady();
  }

  void changeStateShip(String value) {
    if (value == 'store') {
      store.value = !store.value;
      product.value = false;
    } else if (value == 'product') {
      product.value = !product.value;
      store.value = false;
    }
    fetchStock();
    filterSearchResults("");
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
