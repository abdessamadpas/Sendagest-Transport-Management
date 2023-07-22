import 'dart:convert';
import 'dart:ffi';

List<Stock> ClientFronJson(String str) =>
    List<Stock>.from(json.decode(str).map((x) => Stock.fromJson(x)));

class Stock {
  final int id;

  final String id_Store;
  final String Designation;
  final String Reference;
  final int Qte;

  Stock({
    this.id = 0,
    this.id_Store = "",
    this.Designation = "",
    this.Reference = "",
    this.Qte = 0,
  });

  factory Stock.fromJson(Map<String, dynamic> json) => Stock(
        id: json["id"],
        id_Store: json["id_Store"],
        Designation: json["Designation"],
        Reference: json["Reference"],
        Qte: json["Qte"],
      );
}
