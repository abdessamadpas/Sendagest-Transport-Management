import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sendatrack/controllers/stock/movementController.dart';

class Ship extends StatefulWidget {
  String text;
  Ship({super.key, required this.text});

  @override
  State<Ship> createState() => _ShipState();
}

class _ShipState extends State<Ship> {
  MovementController controller = Get.put(MovementController());
  @override
  Widget build(BuildContext context) {
    return Obx(() => Expanded(
        child: GestureDetector(
            onTap: () {
              controller.changeState(widget.text);
            },
            child: Container(
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: controller.selectredOne(widget.text)
                      ? Color.fromARGB(255, 209, 237, 255)
                      : Color.fromARGB(255, 255, 255, 255),
                  border: Border.all(
                    color: Color.fromARGB(255, 209, 237, 255),
                    width: 2,
                  ),
                ),
                child: Center(
                  child: Text(
                    widget.text,
                    style: TextStyle(
                      color: controller.selectredOne(widget.text)
                          ? Color.fromARGB(255, 0, 110, 211)
                          : Color(0xff8EA3B7),
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                )))));
  }
}
