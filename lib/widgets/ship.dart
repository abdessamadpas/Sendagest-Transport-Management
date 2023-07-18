import 'package:flutter/material.dart';
import '../constant.dart';
import 'package:get/get.dart';
import 'package:sendatrack/controllers/trajects/PopupTrajectController.dart';
import 'package:sendatrack/controllers/invoices/popupFactureController.dart';

class SelectedOne extends StatefulWidget {
  String name;
  final bool useInvoice;
  SelectedOne({super.key, required this.name, required this.useInvoice});

  @override
  State<SelectedOne> createState() => _SelectedOneState();
}

class _SelectedOneState extends State<SelectedOne> {
  late dynamic controller;

  @override
  void initState() {
    super.initState();
    controller = !widget.useInvoice
        ? Get.put(FilterTrajectsController())
        : Get.put(FilterInvoiceController());
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => Container(
            // padding: const EdgeInsets.fromLTRB(3, 18, 3, 8),
            child: GestureDetector(
          onTap: () {
            controller.stateShip(widget.name)!;
          },
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: controller.selectedStatus.contains(widget.name)!
                    ? kLightBlue
                    : Colors.white),
            padding: const EdgeInsets.fromLTRB(15, 8, 15, 8),
            child: Text(
              widget.name,
              style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 0, 0, 0)),
            ),
          ),
        )));
  }
}
