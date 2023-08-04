import 'dart:convert';

import 'package:get/get_rx/src/rx_types/rx_types.dart';

List<Movement> clientFromJson(String str) =>
    List<Movement>.from(json.decode(str).map((x) => Movement.fromJson(x)));

class Movement {
  String id;
  String idStore;
  String dateMvt;
  String dateMvtString;
  String typeMvt;
  String numBon;
  String extra;
  String login;
  int qte;
  int price;
  int tva;
  String prixTotal;
  String reference;
  int idTypePanne;
  String idVehicule;
  int kilometrage;
  String observation;
  String designation;
  String idCiterne;
  int idDelivery;
  String qteTotal;
  int tVA;

  Movement({
    required this.id,
    required this.idStore,
    required this.dateMvt,
    required this.dateMvtString,
    required this.typeMvt,
    required this.numBon,
    required this.extra,
    required this.login,
    required this.qte,
    required this.price,
    required this.tva,
    required this.prixTotal,
    required this.reference,
    required this.idTypePanne,
    required this.idVehicule,
    required this.kilometrage,
    required this.observation,
    required this.designation,
    required this.idCiterne,
    required this.idDelivery,
    required this.qteTotal,
    required this.tVA,
  });

  factory Movement.fromJson(Map<String, dynamic> json) => Movement(
        id: json["id"],
        idStore: json["id_Store"],
        dateMvt: json["DateMvt"],
        dateMvtString: json["DateMvtString"],
        typeMvt: json["TypeMvt"],
        numBon: json["NumBon"],
        extra: json["Extra"],
        login: json["login"],
        qte: json["Qte"],
        price: json["Price"],
        tva: json["Tva"],
        prixTotal: json["PrixTotal"],
        reference: json["Reference"],
        idTypePanne: json["id_TypePanne"],
        idVehicule: json["id_Vehicule"],
        kilometrage: json["Kilometrage"],
        observation: json["observation"],
        designation: json["Designation"],
        idCiterne: json["idCiterne"],
        idDelivery: json["id_delivery"],
        qteTotal: json["QteTotal"],
        tVA: json["TVA"],
      );
  Map<String, dynamic> toJson() => {
        "id": id,
        "id_Store": idStore,
        "DateMvt": dateMvt,
        "DateMvtString": dateMvtString,
        "TypeMvt": typeMvt,
        "NumBon": numBon,
        "Extra": extra,
        "login": login,
        "Qte": qte,
        "Price": price,
        "Tva": tva,
        "PrixTotal": prixTotal,
        "Reference": reference,
        "id_TypePanne": idTypePanne,
        "id_Vehicule": idVehicule,
        "Kilometrage": kilometrage,
        "observation": observation,
        "Designation": designation,
        "idCiterne": idCiterne,
        "id_delivery": idDelivery,
        "QteTotal": qteTotal,
        "TVA": tVA,
      };
}
