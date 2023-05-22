import 'package:flutter/material.dart';
import 'package:sendatrack/widgets/carsGrid.dart';
import 'package:sendatrack/widgets/carsHeader.dart';

class Cars extends StatefulWidget {
  const Cars({super.key});

  @override
  State<Cars> createState() => _CarsState();
}

class _CarsState extends State<Cars> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const CarsHeader(),
              const SizedBox(
                height: 20,
              ),
              const CarsGrid(),
            ],
          ),
        )));
  }
}
