import 'dart:convert';

List<Traject> trajectsFronJson(String str) =>
    List<Traject>.from(json.decode(str).map((x) => Traject.fromJson(x)));

class Traject {
  final String Num_Trajet;
  final String Client;
  final String libelletrajet;
  final String Statut;
  final String Datedepart;
  final String heureDepart;
  final String Remorque;
  final String Vehicule;
  final String Chauffeur;
  final String user;

  Traject({
    required this.Num_Trajet,
    required this.Client,
    required this.libelletrajet,
    required this.Statut,
    required this.Datedepart,
    required this.heureDepart,
    required this.Remorque,
    required this.Vehicule,
    required this.Chauffeur,
    required this.user,
  });

  factory Traject.fromJson(Map<String, dynamic> json) => Traject(
      Num_Trajet: json["Num_Trajet"],
      Client: json["Client"],
      libelletrajet: json["libelletrajet"],
      Statut: json["Statut"],
      Datedepart: json["Datedepart"],
      heureDepart: json["heureDepart"],
      Remorque: json["Remorque"],
      Vehicule: json["Vehicule"],
      Chauffeur: json["Chauffeur"],
      user: json["user"]);
}
