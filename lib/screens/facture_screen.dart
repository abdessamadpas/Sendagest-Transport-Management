import 'package:flutter/material.dart';
import '../widgets/trajects_header.dart';
import '../widgets/factureGrid.dart';

class Facture extends StatefulWidget {
  const Facture({super.key});

  @override
  State<Facture> createState() => _FactureState();
}

class _FactureState extends State<Facture> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: const [
              TrajectsHeader(headerName: 'Facture'),
              SizedBox(
                height: 20,
              ),
              FactureGrid()
            ],
          ),
        ),
      ),
    );
  }
}
