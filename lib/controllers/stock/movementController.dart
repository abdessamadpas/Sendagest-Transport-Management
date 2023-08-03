import 'dart:ffi';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:sendatrack/model/stock.dart';
import 'package:sendatrack/services/stock.dart';
import 'package:sendatrack/model/depotInfo.dart';
import 'package:sendatrack/model/product.dart';
import 'package:sendatrack/model/movement.dart';
import 'package:sendatrack/services/vehicle.dart';
import 'package:sendatrack/services/movement.dart';
import 'package:sendatrack/model/vehicle.dart';
import 'dart:convert';

class MovementController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool input = true.obs;
  RxBool output = false.obs;
// * selected reference
  RxString? selectedReference = "".obs;
  RxString? selectedDepot = "".obs;
  RxString? selectedVehicle = "".obs;
  RxString? selectedTypePanne = "".obs;
  RxString? selectedCiterne = "".obs;

  DateTime date = DateTime.now();
// * define lists

  RxList<Product> listProducts = <Product>[].obs;
  RxList<String?> listReference = <String>[].obs;
  RxList<String?> listDepot = <String>[].obs;
  RxList<String?> listVehicle = <String>[].obs;
  RxList<String?> listTypePanne = <String>[].obs;
  RxList<String?> listCiterne = <String>[].obs;

// ! movements added to the list
  RxList<Movement> listMovement = <Movement>[].obs;

  RxString? designation = "".obs;
  RxString? quantity = "".obs;
  RxString? price = "".obs;

//todo need to define the following variables
//! depot
//! date
//! listReference
//! vehicle idR
//! type pane
//! citerne

  final TextEditingController DesignationTextEditingController =
      TextEditingController();
  final TextEditingController QuantityTextEditingController =
      TextEditingController();
  final TextEditingController PriceTextEditingController =
      TextEditingController();
  final TextEditingController ObservationTextEditingController =
      TextEditingController();
  final TextEditingController KilometrageTextEditingController =
      TextEditingController();
  final TextEditingController TVATextEditingController =
      TextEditingController();

  @override
  void onInit() async {
    isLoading.value = true;
    super.onInit();
    ever(selectedReference!, (_) => getDataOfRef(selectedReference!.value));
    await fetchDepots();
    await getlistProducts().then((value) => getlistReference());

    await getlistVehivule();
    await getlistTypePanne();
    await getlistCiterne();
    isLoading.value = false;
  }

// save the movement
  Future saveMovement() async {
    print("allo");
    isLoading.value = true;
    Map<String, dynamic> movementData = {
      "id": "",
      "id_Store": 0,
      "DateMvt": 1690761600,
      "DateMvtString": "2023-07-31",
      "TypeMvt": "E",
      "NumBon": "",
      "Extra": "",
      "login": "",
      "Qte": 1,
      "Price": 350,
      "Tva": 0,
      "PrixTotal": "",
      "Reference": "ref01",
      "id_TypePanne": 0,
      "id_Vehicule": 0,
      "Kilometrage": 0,
      "observation": "",
      "Designation": "test01",
      "idCiterne": "",
      "id_delivery": 0,
      "QteTotal": "",
      "TVA": 0
    };
    listMovement.add(Movement.fromJson(movementData));
    print(listMovement.length);
//? clear data after adding
    selectedReference?.value = "Select a value";
    DesignationTextEditingController.text = "";

    //? to hundle data
    String jsonString =
        json.encode(listMovement.map((movement) => movement.toJson()).toList());
    print(jsonString);

    // await MovementService.addMovement(movementData);

    // selectedDepot!.value,
    // date,
    // selectedReference!.value,
    // selectedVehicle!.value,
    // selectedTypePanne!.value,
    // selectedCiterne!.value,
    // DesignationTextEditingController.text,
    // QuantityTextEditingController.text,
    // PriceTextEditingController.text,
    // ObservationTextEditingController.text,
    // KilometrageTextEditingController.text,
    // TVATextEditingController.text,

    isLoading.value = false;
  }

  getIds(description, type) async {
    List<DepotInfo> data = await StockService.getDepotInfo(type);

    return data.map((element) {
      if (element.description == description) {
        return element.id;
      }
    });
  }

  void changeState(String text) {
    input.value = !input.value;
    output.value = !output.value;
  }

  void changeStateSelectedValue(String text, value) {
    if (text == "depot") {
      selectedDepot?.value = value!;
    }
    if (text == "reference") {
      selectedReference?.value = value!;
    }
    if (text == "vehicle") {
      selectedVehicle?.value = value!;
    }
    if (text == "typePanne") {
      selectedTypePanne?.value = value!;
    }
    if (text == "citerne") {
      selectedCiterne?.value = value!;
    }
  }

  String? getSelectedVariable(String value) {
    if (value == "depot") {
      return selectedDepot?.value;
    }
    if (value == "reference") {
      return selectedReference?.value;
    }
    if (value == "vehicle") {
      return selectedVehicle?.value;
    }
    if (value == "typePanne") {
      return selectedTypePanne?.value;
    }
    if (value == "citerne") {
      return selectedCiterne?.value;
    }
  }

  bool selectredOne(String text) {
    if (text == "Input") {
      return input.value;
    } else {
      return output.value;
    }
  }

  Future<void> fetchDepots() async {
    List<DepotInfo> data = await StockService.getDepotInfo("Store");
    data.forEach((element) {
      listDepot.add(element.description);
    });
  }

  Future<void> getlistProducts() async {
    List<Product> data = await StockService.getProducts("Store");
    listProducts.value = data;
  }

  Future<void> getlistReference() async {
    listProducts.forEach((element) {
      listReference.add(element.Reference);
    });
    print(listReference);
  }

  Future<void> getlistVehivule() async {
    List<Vehicle> vehicles = await VehicleService.getVehicle();

    vehicles.forEach((element) {
      listVehicle.add(element.name);
    });
  }

  Future<void> getlistTypePanne() async {
    List<DepotInfo> typePannes = await StockService.getDepotInfo("TypePanne");

    typePannes.forEach((element) {
      listTypePanne.add(element.description);
    });
  }

  void getDataOfRef(ref) {
    listProducts.forEach((element) {
      if (element.Reference == ref) {
        DesignationTextEditingController.text = element.Designation!;
      }
    });
    listProducts.forEach((element) {
      if (element.Reference == ref) {
        QuantityTextEditingController.text = element.QteStock.toString();
      }
    });
    listProducts.forEach((element) {
      if (element.Reference == ref) {
        PriceTextEditingController.text = element.Prix_achat.toString();
      }
    });
  }

  Future<void> getlistCiterne() async {
    List<DepotInfo> citernes = await StockService.getDepotInfo("Citerne");

    citernes.forEach((element) {
      listCiterne.add(element.description);
    });
  }
}
