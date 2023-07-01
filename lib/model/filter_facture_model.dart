class FiltrageFactureModel {
  late final String NumFacture;
  late final String Societ;
  late final String DateFacure;
  late final String EtatFacture;
  late final DateTime? startDate;
  late final DateTime? endDate;

  FiltrageFactureModel({
    required this.NumFacture,
    required this.Societ,
    required this.DateFacure,
    required this.EtatFacture,
    required this.startDate,
    required this.endDate,
  });
}
