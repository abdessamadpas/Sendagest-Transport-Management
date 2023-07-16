import 'package:flutter/material.dart';
import '../widgets/trajects_header.dart';
import '../widgets/factureGrid.dart';
import 'package:sendatrack/model/filter_facture_model.dart';

class Facture extends StatefulWidget {
  const Facture({super.key});

  @override
  State<Facture> createState() => _FactureState();
}

class _FactureState extends State<Facture> {
  FiltrageFactureModel? updatedFilter;
  void callBackForFilter(FiltrageFactureModel filter) {
    setState(() {
      updatedFilter = filter;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TrajectsHeader(headerName: 'Facture', type: "facture"),
              const SizedBox(
                height: 20,
              ),
              const FactureGrid()
            ],
          ),
        ),
      ),
    );
  }
}
