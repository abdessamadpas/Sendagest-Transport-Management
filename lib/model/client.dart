import 'dart:convert';

List<Clients> ClientFronJson(String str) =>
    List<Clients>.from(json.decode(str).map((x) => Clients.fromJson(x)));

class Clients {
  final String Client;
  final String IDClient;

  Clients({
    required this.Client,
    required this.IDClient,
  });

  factory Clients.fromJson(Map<String, dynamic> json) => Clients(
        Client: json["Client"],
        IDClient: json["IDClient"],
      );
}
