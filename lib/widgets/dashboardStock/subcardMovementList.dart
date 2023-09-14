import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:sendatrack/constant.dart';
import 'package:sendatrack/model/movement.dart';
import 'dart:ui';
import 'package:get/get.dart';
import 'package:sendatrack/controllers/stock/movementController.dart';

class SubCardMovement extends StatefulWidget {
  final mouvement;
  final index;
  SubCardMovement({super.key, required this.mouvement, required this.index});

  @override
  State<SubCardMovement> createState() => _SubCardMovementState();
}

MovementController controller = Get.put(MovementController());

class _SubCardMovementState extends State<SubCardMovement> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(vertical: 20),
        decoration: const BoxDecoration(
          border: Border(
              bottom: BorderSide(
                  width: 1.0, color: Color.fromARGB(255, 224, 224, 224))),
          color: Color.fromARGB(255, 255, 255, 255),
        ),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Column(
              children: [
                widget.mouvement.Designation != null
                    ? Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.white,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('Designation',
                                style: TextStyle(
                                    color: Color.fromARGB(255, 122, 122, 122),
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14)),
                            Text(widget.mouvement.Designation ?? '',
                                style: const TextStyle(
                                    color: Color.fromARGB(255, 0, 0, 0),
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15))
                          ],
                        ))
                    : Container(),
                widget.mouvement.TypeMvt != null
                    ? Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7),
                          color: kGrey,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('TypeMvt',
                                style: TextStyle(
                                    color: Color.fromARGB(255, 122, 122, 122),
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14)),
                            Text(
                                widget.mouvement.TypeMvt == "E"
                                    ? "Entrée"
                                    : "Sortie",
                                style: const TextStyle(
                                    color: Color.fromARGB(255, 0, 0, 0),
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15))
                          ],
                        ),
                      )
                    : Container(),
                widget.mouvement.Price != null
                    ? Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 8),
                        decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 255, 255, 255),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('Price',
                                style: TextStyle(
                                    color: Color.fromARGB(255, 122, 122, 122),
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14)),
                            Text('${widget.mouvement.Price} DHs ',
                                style: const TextStyle(
                                    color: kGreen,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15))
                          ],
                        ),
                      )
                    : Container(),
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    color: kGrey,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('kilometrage',
                          style: TextStyle(
                              color: Color.fromARGB(255, 122, 122, 122),
                              fontWeight: FontWeight.w400,
                              fontSize: 14)),
                      Text(widget.mouvement.kilometrage.toString() ?? '',
                          style: const TextStyle(
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontWeight: FontWeight.w500,
                              fontSize: 15))
                    ],
                  ),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 255, 255, 255),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('VÉHICULE',
                          style: TextStyle(
                              color: Color.fromARGB(255, 122, 122, 122),
                              fontWeight: FontWeight.w400,
                              fontSize: 14)),
                      Text('${widget.mouvement.id_Vehicule}',
                          style: const TextStyle(
                              color: kGreen,
                              fontWeight: FontWeight.w500,
                              fontSize: 15))
                    ],
                  ),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    color: kGrey,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('TYPE DE PANNE',
                          style: TextStyle(
                              color: Color.fromARGB(255, 122, 122, 122),
                              fontWeight: FontWeight.w400,
                              fontSize: 14)),
                      Text(widget.mouvement.id_Vehicule.toString() ?? '',
                          style: const TextStyle(
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontWeight: FontWeight.w500,
                              fontSize: 15))
                    ],
                  ),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 255, 255, 255),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('OBSERVATION',
                          style: TextStyle(
                              color: Color.fromARGB(255, 122, 122, 122),
                              fontWeight: FontWeight.w400,
                              fontSize: 14)),
                      Text('${widget.mouvement.observation.toString()} ',
                          style: const TextStyle(
                              color: kGreen,
                              fontWeight: FontWeight.w500,
                              fontSize: 15))
                    ],
                  ),
                ),
              ],
            ),
          )
        ]));
  }
}
