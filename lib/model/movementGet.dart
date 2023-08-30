import 'dart:convert';

import 'package:get/get_rx/src/rx_types/rx_types.dart';

List<MovementGet> clientFromJson(String str) => List<MovementGet>.from(
    json.decode(str).map((x) => MovementGet.fromJson(x)));

class MovementGet {
  int? id;
  String? id_Store;
  String? id_delivery;
  String? TypeMvt;
  String? id_Vehicule;
  String? id_TypePanne;
  int? DateMvt;
  String? Reference;
  String? NumBon;
  int? Qte;
  int? Tva;
  int? Price;
  String? observation;
  int? kilometrage;
  int? Extra;
  String? idCiterne;
  String? Designation;
  String? login;
  MovementGet({
    this.id,
    this.id_Store,
    this.id_delivery,
    this.TypeMvt,
    this.id_Vehicule,
    this.id_TypePanne,
    this.DateMvt,
    this.Reference,
    this.NumBon,
    this.Qte,
    this.Tva,
    this.Price,
    this.observation,
    this.kilometrage,
    this.Extra,
    this.idCiterne,
    this.Designation,
    this.login,
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
