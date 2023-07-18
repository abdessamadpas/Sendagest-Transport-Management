import 'dart:convert';

List<Vehicle> ClientFronJson(String str) =>
    List<Vehicle>.from(json.decode(str).map((x) => Vehicle.fromJson(x)));

class Vehicle {
  final String Remorque;

  Vehicle({
    required this.Remorque,
  });

  factory Vehicle.fromJson(Map<String, dynamic> json) => Vehicle(
        Remorque: json["Remorque"],
      );
}
