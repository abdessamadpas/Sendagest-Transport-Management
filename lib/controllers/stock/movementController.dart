import 'dart:ffi';
import 'dart:math';
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
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import '../../../constant.dart';

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
  RxString? errorMsg = "".obs;

  DateTime? selectedDate = DateTime.now();
// * define lists

  RxList<Product> listProducts = <Product>[].obs;

  RxList<String?> listReference = <String>[].obs;
  RxList<String?> listDepot = <String>[].obs;
  RxList<String?> listVehicle = <String>[].obs;
  RxList<String?> listTypePanne = <String>[].obs;
  RxList<String?> listCiterne = <String>[].obs;

// ! movements added to the list
  RxList<Movement> listMovement = <Movement>[].obs;
  RxList lisToDisplay = [].obs;

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

  // @override
  // void onClose() {
  //   print('MyController is closed');
  //   super.onClose();
  // }

//! save the movement to backend
  Future saveMovement() async {
    errorMsg!.value = "";
    if (selectedDepot!.value == "Select a value") {
      errorMsg!.value = "Please select a depot";
      return;
    }
    if (selectedReference!.value == "Select a value") {
      errorMsg!.value = "Please select a reference";
      return;
    } else {
      isLoading.value = true;
      // Map<String, dynamic> DataToSend = {
      //   "id": "",
      //   "id_Store": await getId(selectedDepot!.value, "Store").toString(),
      //   "DateMvt": selectedDate?.millisecondsSinceEpoch.toString(),
      //   "DateMvtString": selectedDate.toString().split(' ')[0].toString(),
      //   "TypeMvt": input.value == true ? "E" : "S",
      //   "NumBon": "",
      //   "Extra": "",
      //   "login": "",
      //   "Qte": int.parse(QuantityTextEditingController.text),
      //   "Price": int.parse(PriceTextEditingController.text),
      //   "Tva": int.parse(TVATextEditingController.text),
      //   "PrixTotal": "",
      //   "Reference": selectedReference!.value.toString(),
      //   "id_TypePanne": await getId(selectedTypePanne!.value, "TypePanne"),
      //   "id_Vehicule": selectedVehicle!.value.toString(),
      //   "Kilometrage": int.parse(KilometrageTextEditingController.text),
      //   "observation": ObservationTextEditingController.toString(),
      //   "Designation": DesignationTextEditingController.text.toString(),
      //   "idCiterne": await getId(selectedCiterne!.value, "Citerne").toString(),
      //   "id_delivery": 0,
      //   "QteTotal": "",
      //   "TVA": int.parse(TVATextEditingController.text)
      // };

      Map<String, dynamic> addedMovements = {
        "id_Store": selectedDepot!.value,
        "DateMvtString": selectedDate.toString().split(' ')[0].toString(),
        "Qte": QuantityTextEditingController.text,
        "Price": PriceTextEditingController.text,
        "Reference": selectedReference!.value,
        "id_TypePanne": selectedTypePanne!.value,
        "id_Vehicule": selectedVehicle!.value,
        // "Kilometrage": KilometrageTextEditingController.text.toString(),
        "observation": ObservationTextEditingController.text,
        "Designation": DesignationTextEditingController.text,
        "idCiterne": selectedCiterne!.value,
        "TVA": TVATextEditingController.text,
      };

      // listMovement.add(Movement.fromJson(DataToSend));
      //  lisToDisplay.add(Movement.fromJson(lisToDisplay));
      lisToDisplay.add(addedMovements);
      print('list length  ${lisToDisplay.toList()} ');
      //? clear data after adding
      //!clear data
      selectedReference?.value = "Select a value";
      DesignationTextEditingController.text = "";
      QuantityTextEditingController.text = "";
      PriceTextEditingController.text = "";
      TVATextEditingController.text = "";
      ObservationTextEditingController.text = "";
      KilometrageTextEditingController.text = "s";
      selectedTypePanne?.value = "Select a value";
      selectedVehicle?.value = "Select a value";
      selectedCiterne?.value = "Select a value";
      //? to hundle data
      // String jsonString =
      //     json.encode(listMovement.map((movement) => movement.toJson()).toList());
      // print(jsonString);

      // await MovementService.addMovement(movementData);

      isLoading.value = false;
    }
  }

//! get IDs

  Future<int?> getId(String description, String type) async {
    List<DepotInfo> data = await StockService.getDepotInfo(type);

    DepotInfo matchingElement =
        data.firstWhere((element) => element.description == description);

    if (matchingElement != null) {
      return matchingElement.id;
    } else {
      // Return a default value (e.g., -1) or throw an exception if desired.
      return -1;
    }
  }

  void clearDataFromForm() {
    selectedReference?.value = "Select a value";
    DesignationTextEditingController.text = "";
    QuantityTextEditingController.text = "";
    PriceTextEditingController.text = "";
    TVATextEditingController.text = "";
    ObservationTextEditingController.text = "";
    KilometrageTextEditingController.text = "";
    selectedTypePanne?.value = "Select a value";
    selectedVehicle?.value = "Select a value";
    selectedCiterne?.value = "Select a value";
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

  void removeMovement(int index) {
    if (lisToDisplay.length > 0) {
      lisToDisplay.removeAt(index);
      print('list length  ${lisToDisplay.toList()} ');
    }
  }
}
