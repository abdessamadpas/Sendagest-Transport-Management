import 'dart:convert';
import 'dart:ffi';

List<DepotInfo> ClientFronJson(String str) =>
    List<DepotInfo>.from(json.decode(str).map((x) => DepotInfo.fromJson(x)));

class DepotInfo {
  final int? id;
  final String? description;

  DepotInfo({
    this.id,
    this.description,
  });

  factory DepotInfo.fromJson(Map<String, dynamic> json) => DepotInfo(
        id: json["id"],
        description: json["description"],
      );
}
