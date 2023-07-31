import 'dart:convert';
import 'dart:ffi';

List<Product> ClientFronJson(String str) =>
    List<Product>.from(json.decode(str).map((x) => Product.fromJson(x)));

class Product {
  final String? Reference;
  final String? Designation;
  final String? codebarre1;
  final int? Tva;
  final int? QteStock;
  final int? Prix_achat;

  Product({
    this.Reference,
    this.Designation,
    this.codebarre1,
    this.Tva,
    this.QteStock,
    this.Prix_achat,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        Reference: json["Reference"],
        Designation: json["Designation"],
        codebarre1: json["codebarre1"],
        Tva: json["Tva"],
        QteStock: json["QteStock"],
        Prix_achat: json["Prix_achat"],
      );
}
