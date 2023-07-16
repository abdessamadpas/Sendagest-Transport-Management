import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import '../constant.dart';
import 'package:get/get.dart';
import 'package:sendatrack/controllers/PopupTrajectController.dart';

class SelectedOne extends StatefulWidget {
  String name;

  SelectedOne({super.key, required this.name});

  @override
  State<SelectedOne> createState() => _SelectedOneState();
}

class _SelectedOneState extends State<SelectedOne> {
  final FilterTrajectsController controller =
      Get.put(FilterTrajectsController());
  @override
  Widget build(BuildContext context) {
    return Obx(() => Container(
            // padding: const EdgeInsets.fromLTRB(3, 18, 3, 8),
            child: GestureDetector(
          onTap: () {
            controller.stateShip(widget.name);
          },
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: controller.selectedStatus.contains(widget.name)
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
