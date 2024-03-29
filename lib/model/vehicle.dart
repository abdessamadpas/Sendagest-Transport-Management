import 'dart:convert';
import 'dart:ffi';

List<Vehicle> ClientFronJson(String str) =>
    List<Vehicle>.from(json.decode(str).map((x) => Vehicle.fromJson(x)));

class Vehicle {
  final String? dID;
  final String? name;

  Vehicle({
    this.dID,
    this.name,
  });

  factory Vehicle.fromJson(Map<String, dynamic> json) => Vehicle(
        dID: json["dID"],
        name: json["name"],
      );
}
