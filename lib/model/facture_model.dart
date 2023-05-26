import 'dart:convert';
import 'dart:ffi';

List<Facture> trajectsFromJson(String str) =>
    List<Facture>.from(json.decode(str).map((x) => Facture.fromJson(x)));

class Facture {
  final String DateFacure;
  final String EtatFacture;
  final String NumClient;
  final String NumFacture;
  final num? TotalHT;
  final num? TotalTTC;
  final num? TotalTVA;
  final String Societ;
  final num? dejpay;
  final num? restepay;
  final num? TauxDevise;
  final String Devises;
  final num? TotalHTDV;
  final num? TotalTTCDV;

  Facture({
    required this.DateFacure,
    required this.EtatFacture,
    required this.NumClient,
    required this.NumFacture,
    required this.TotalHT,
    required this.TotalTTC,
    required this.TotalTVA,
    required this.Societ,
    required this.dejpay,
    required this.restepay,
    required this.TauxDevise,
    required this.Devises,
    required this.TotalHTDV,
    required this.TotalTTCDV,
  });

  factory Facture.fromJson(Map<String, dynamic> json) => Facture(
        DateFacure: json["DateFacure"],
        EtatFacture: json["EtatFacture"],
        NumClient: json["NumClient"],
        NumFacture: json["NumFacture"],
        TotalHT: json["TotalHT"],
        TotalTTC: json["TotalTTC"],
        TotalTVA: json["TotalTVA"],
        Societ: json["Sociét"],
        dejpay: json["dejpay"],
        restepay: json["restepay"],
        TauxDevise: json["TauxDevise"],
        Devises: json["Devises"],
        TotalHTDV: json["TotalHTDV"],
        TotalTTCDV: json["TotalTTCDV"],
      );
}
