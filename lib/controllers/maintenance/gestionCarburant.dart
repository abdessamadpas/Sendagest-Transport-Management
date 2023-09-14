import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sendatrack/routers/app_pages.dart';

class GestionCarburantController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool input = true.obs;
  RxBool isOutput = false.obs;
  RxList<String?> ListMatricules = <String>["wewe"].obs;
  RxList<String?> ListConducteur = <String>["wewe"].obs;
  RxList<String?> ListCiternes = <String>["wewe"].obs;

  final TextEditingController KmPrecedentTextEditingController =
      TextEditingController();
  final TextEditingController QteTextEditingController =
      TextEditingController();
  final TextEditingController KmActuelTextEditingController =
      TextEditingController();
  @override
  void onInit() {
    super.onInit();
  }
}
