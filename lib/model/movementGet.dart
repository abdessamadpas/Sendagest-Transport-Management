import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/foundation.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

List<MovementGet> clientFromJson(String str) => List<MovementGet>.from(
    json.decode(str).map((x) => MovementGet.fromJson(x)));

class MovementGet {
  final int? id;
  final String? id_Store;
  final String? id_delivery;
  final String? TypeMvt;
  final String? id_Vehicule;
  final String? id_TypePanne;
  final int? DateMvt;
  final String? Reference;
  final String? NumBon;
  final int? Qte;
  final int? Tva;
  final int? Price;
  final String? observation;
  final int? kilometrage;
  final int? Extra;
  final String? idCiterne;
  final String? Designation;
  final String? login;

  MovementGet({
    required this.id,
    required this.id_Store,
    required this.id_delivery,
    required this.TypeMvt,
    required this.id_Vehicule,
    required this.id_TypePanne,
    required this.DateMvt,
    required this.Reference,
    required this.NumBon,
    required this.Qte,
    required this.Tva,
    required this.Price,
    required this.observation,
    required this.kilometrage,
    required this.Extra,
    required this.idCiterne,
    required this.Designation,
    required this.login,
  });

  factory MovementGet.fromJson(Map<String, dynamic> json) => MovementGet(
        id: json["id"],
        id_Store: json["id_Store"],
        id_delivery: json["id_delivery"],
        TypeMvt: json["TypeMvt"],
        id_Vehicule: json["id_Vehicule"],
        id_TypePanne: json["id_TypePanne"],
        DateMvt: json["DateMvt"],
        Reference: json["Reference"],
        NumBon: json["NumBon"],
        Qte: json["Qte"],
        Tva: json["Tva"],
        Price: json["Price"],
        observation: json["observation"],
        kilometrage: json["kilometrage"],
        Extra: json["Extra"],
        idCiterne: json["idCiterne"],
        Designation: json["Designation"],
        login: json["login"],
      );
  Map<String, dynamic> toJson() => {
        "id": id,
        "id_Store": id_Store,
        "id_delivery": id_delivery,
        "TypeMvt": TypeMvt,
        "id_Vehicule": id_Vehicule,
        "id_TypePanne": id_TypePanne,
        "DateMvt": DateMvt,
        "Reference": Reference,
        "NumBon": NumBon,
        "Qte": Qte,
        "Tva": Tva,
        "Price": Price,
        "observation": observation,
        "kilometrage": kilometrage,
        "Extra": Extra,
        "idCiterne": idCiterne,
        "Designation": Designation,
        "login": login,
      };
}
