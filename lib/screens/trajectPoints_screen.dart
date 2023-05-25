import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

class PointsTrajectScreen extends StatefulWidget {
  const PointsTrajectScreen({super.key});

  @override
  State<PointsTrajectScreen> createState() => _PointsTrajectScreenState();
}

class _PointsTrajectScreenState extends State<PointsTrajectScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Traject Points"),
        ),
        body: SingleChildScrollView(
            child: SafeArea(
          child: Text(
            "Traject Points",
          ),
        )));
  }
}
