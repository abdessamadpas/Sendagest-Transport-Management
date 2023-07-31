import 'dart:convert';

List<Movement> ClientFronJson(String str) =>
    List<Movement>.from(json.decode(str).map((x) => Movement.fromJson(x)));

class Movement {
  String id;
  String idStore;
  int dateMvt;
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
  int idVehicule;
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
        idStore: json["idStore"],
        dateMvt: json["dateMvt"],
        dateMvtString: json["dateMvtString"],
        typeMvt: json["typeMvt"],
        numBon: json["numBon"],
        extra: json["extra"],
        login: json["login"],
        qte: json["qte"],
        price: json["price"],
        tva: json["tva"],
        prixTotal: json["prixTotal"],
        reference: json["reference"],
        idTypePanne: json["idTypePanne"],
        idVehicule: json["idVehicule"],
        kilometrage: json["kilometrage"],
        observation: json["observation"],
        designation: json["designation"],
        idCiterne: json["idCiterne"],
        idDelivery: json["idDelivery"],
        qteTotal: json["qteTotal"],
        tVA: json["tVA"],
      );
}
