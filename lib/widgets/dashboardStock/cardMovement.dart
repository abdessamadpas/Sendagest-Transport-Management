import 'package:flutter/widgets.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import '../../../constant.dart';
import 'package:gap/gap.dart';
import 'package:sendatrack/widgets/dashboardStock/subcardMovementList.dart';
import 'package:sendatrack/controllers/stock/logMovementController.dart';
import 'package:get/get.dart';

class CardMovemet extends StatefulWidget {
  final index;
  final mouvement;
  const CardMovemet({super.key, required this.index, required this.mouvement});

  @override
  State<CardMovemet> createState() => _CardMovemetState();
}

class _CardMovemetState extends State<CardMovemet> {
  LogMovementController controller = Get.put(LogMovementController());

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      margin: const EdgeInsets.only(
        left: 0.0,
        right: 0.0,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(7.0),
      ),
      child: ExpansionTile(
        collapsedBackgroundColor: const Color.fromARGB(255, 255, 255, 255),
        title: Container(
          height: 70,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 4.0,
                    height: 25.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: widget.mouvement.TypeMvt.toString() == "E"
                          ? kGreen
                          : kRed,
                    ),
                  ),
                  ClipRect(
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 0.0, sigmaY: 0.0),
                      child: Container(
                        // padding: const EdgeInsets.all(15),
                        width: 45.0,
                        height: 45.0,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Color.fromARGB(255, 210, 241, 255)
                                .withOpacity(0.3)),
                        child: Center(
                          child: Text(
                              widget.mouvement.TypeMvt.toString() == "E"
                                  ? "E"
                                  : "S",
                              style: const TextStyle(
                                  color: kDarkBlue,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ),
                    ),
                  ),
                  const Gap(15),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(widget.mouvement.Reference,
                          style: const TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w800,
                            color: Colors.black,
                          )),
                      Gap(7),
                      Text(
                        widget.mouvement.Qte.toString() + " Units",
                        style: const TextStyle(
                          fontSize: 14,
                          color: lightGray,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
        trailing: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              widget.mouvement.id_Store,
              style: TextStyle(
                  fontSize: 14, fontWeight: FontWeight.w400, color: lightGray),
            ),
            Gap(7),
            Text(controller.changeDate(widget.mouvement.DateMvt),
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: Colors.black)),
          ],
        ),
        children: [
          ListTile(
            onTap: () {},
            title: SubCardMovement(
                index: widget.index, mouvement: widget.mouvement),
          )
        ],
      ),
    );
  }
}
